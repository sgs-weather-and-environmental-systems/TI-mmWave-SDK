/*
 *  ======== MonWiFi.c ========
 *  This file uses the ROV Mon module to run a simple ROV monitor
 *  over a TCP/IP socket connection.
 */
#include <stdlib.h> /* needed for realloc/malloc() */

#include <ti/sysbios/knl/Task.h>
#include <xdc/runtime/System.h>

#include <ti/drivers/net/wifi/simplelink.h>
#include <ti/drivers/net/wifi/errors.h>

#include <xdc/rov/runtime/Mon.h>

#include "MonWiFi.h"

static int  serverSocket;
static int  clientSocket;
static Task_Handle rovTask = NULL;

static char buffer[Mon_MAXCMDSIZE];

static char *cpuRead(const char *addr, int len);
static void rovServer(UArg arg1, UArg arg2);
static int  socketRead(char *buf, int len);
static int  socketWrite(const char *buf, int len);

static Mon_Object monObject = {
    buffer,
    socketRead,
    socketWrite
};

/*
 *  ======== MonWiFi_start ========
 *  Start the ROV server on the specified port
 *
 *  This function assumes that the application is already part of a network.
 */
int MonWiFi_start(unsigned short portNumber)
{
    int status;
    SlSockAddrIn_t localAddr;
    Task_Params params;

    /* if we're already initialized, just return */
    if (rovTask != NULL) {
        return (0);
    }

    memset(&localAddr, '\0', sizeof(localAddr));
    localAddr.sin_family = SL_AF_INET;
    localAddr.sin_port = sl_Htons(portNumber);
    localAddr.sin_addr.s_addr = SL_INADDR_ANY;

    /* create a socket to the specified port address */
    serverSocket = sl_Socket(SL_AF_INET, SL_SOCK_STREAM, 0);
    if (serverSocket < 0) {
        System_printf("sl_Socket failed: %d\n", serverSocket);
        return (serverSocket);
    }

    /* bind the socket to the specified port address */
    status = sl_Bind(serverSocket, (SlSockAddr_t *)&localAddr,
                     sizeof(localAddr));
    if (status < 0) {
        System_printf("sl_Bind failed: %d\n", status);
        sl_Close(serverSocket);
        return (status);
    }

    /* set the socket to listen to the incoming connection requests */
    if ((status = sl_Listen(serverSocket, 0)) < 0) {
        System_printf("sl_Listen failed\n", status);
        sl_Close(serverSocket);
        return (status);
    }

    /* create a separate server thread */
    Task_Params_init(&params);
    params.priority = 2;
    params.stackSize = 4096;
    rovTask = Task_create(rovServer, &params, NULL);

    return (0);
}

/*
 *  ======== cpuRead =========
 *  Read memory into internal buffer using the CPU (not the DMA)
 *
 *  The DMA is unable to access some memory mapped addresses that ROV may
 *  want/need to read.  This function is used to read those locations
 *  because the underlying socket implementation is free to use
 *  the DMA to directly read from the specified buffer.
 *
 *  WARNING: this function calls malloc() and is not reentrant.
 */
static char *cpuRead(const char *addr, int len)
{
    static char *buffer = 0;
    static int bufferLen = 0;

    if (len > bufferLen) {
        buffer = realloc(buffer, len * sizeof (char));
        if (buffer == 0) {
            System_abort("malloc failure");
        }
        bufferLen = len;
    }
    memcpy(buffer, addr, len);
    return buffer;
}

/*
 *  ======== rovServer ========
 */
static void rovServer(UArg arg1, UArg arg2)
{
    for (;;) {

        /* wait for an incoming TCP connection */
        System_printf("Waiting for TCP Accept\n");
        do {
            /* accept a connection from a TCP client, if there is any */
            SlSockAddr_t  sAddr;
            SlSocklen_t addrSize = sizeof(sAddr);
            clientSocket = sl_Accept(serverSocket, &sAddr, &addrSize);

            /* if accept fails, wait before trying again */
            if (clientSocket < 0) {
                if (clientSocket != SL_ERROR_BSD_EAGAIN) {
                    /* should never occur? */
                    System_printf("sl_Accept failed: %d\n", clientSocket);
                }
                Task_sleep(100);
            }
        } while (clientSocket < 0);

        System_printf("TCP Connection accepted\n");

        while (clientSocket >= 0) {
            Mon_doCommand(&monObject);
        }
    }
}

/*
 *  ======== socketRead ========
 */
static int socketRead(char *buf, int len)
{
    int  status;

    if (len <= 0) {
        return (0);
    }

    status = sl_Recv(clientSocket, buf, len, 0);
    if (status <= 0) {
        System_printf("TCP Receive Connection Failed\n");
        sl_Close(clientSocket);
        status = clientSocket = -1;
    }

    return (status);
}

/*
 *  ======== socketWrite ========
 */
static int socketWrite(const char *buf, int len)
{
    int status;

    if (len <= 0) {
        return (0);
    }

    /* check for buffer addresses that can't be read by DMA */
    if ((0xFFFFF000 & (intptr_t)buf) == 0xE000E000) {
        buf = cpuRead(buf, len);
    }

    /* write data from buf to socket (may use DMA to copy data out) */
    status = sl_Send(clientSocket, buf, len, 0);
    if (status <= 0) {
        System_printf("TCP Send Connection Failed\n");
        sl_Close(clientSocket);
        status = clientSocket = -1;
    }

    return (status);
}
