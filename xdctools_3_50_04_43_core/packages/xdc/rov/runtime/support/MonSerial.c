/*
 *  ======== MonSerial.c ========
 *  This monitor accepts read memory requests from the serial port
 *  and sends the results back through the serial port.
 *
 */
#include <ti/sysbios/knl/Task.h>
#include <ti/drivers/UART.h>

#include <xdc/runtime/System.h>
#include <xdc/rov/runtime/Mon.h>

static void serialMon(void);
static int  uartRead(char *buf, int len);
static int  uartWrite(const char *buf, int len);

static UART_Handle uart;
static char buffer[Mon_MAXCMDSIZE];

static Mon_Object monObject = {
    buffer,
    uartRead,
    uartWrite
};

/*
 *  ======== MonSerial_start ========
 */
void MonSerial_start(int port, int baudRate)
{
    UART_Params params;

    UART_init();

    /* initialize serial port at specified baud */
    UART_Params_init(&params);
    params.readMode = UART_MODE_BLOCKING;
    params.writeMode = UART_MODE_BLOCKING;
    params.readDataMode = UART_DATA_BINARY;
    params.writeDataMode = UART_DATA_BINARY;
    params.readReturnMode = UART_RETURN_FULL;
    params.baudRate = baudRate <= 0 ? 115200 : baudRate;

    if ((uart = UART_open(port, &params)) == NULL) {
        System_abort("UART open failed");
    }

    /* create monitor thread */
    Task_create((Task_FuncPtr)serialMon, NULL, NULL);
}

/*
 *  ======== serialMon ========
 */
static void serialMon(void)
{
    for (;;) {
        Mon_doCommand(&monObject);
    }
}

/*
 *  ======== uartRead ========
 */
static int uartRead(char *buf, int len)
{
    return (UART_read(uart, buf, len));
}

/*
 *  ======== uartWrite ========
 */
static int uartWrite(const char *buf, int len)
{
    return (UART_write(uart, buf, len));
}

