/*
 *  ======== ROVMonNet ========
 *  This sketch starts a network and listens on port PORTNUM for
 *  commands to read memory.
 *
 *  The name and password of the network and the port number of the server
 *  (always at IP address 192.168.1.1) can be changed below.
 */

#include <WiFi.h>
#include <string.h>

/* name of the network and its password */
static const char ssid[] = "ROVMonAP";
static const char wifipw[] = "password";

/* the port number of the server listening for command at 192.168.1.1 */
#define PORTNUM 8080

static WiFiServer server(PORTNUM); // create data server on port PORTNUM

static int num_clients = 0;
static int num_sockets = 0;

static void doCommand(char *buffer, int len, WiFiClient client);
static void printWifiData();
static void getAddrCnt(char *buf, int bcnt, long *addr, int *cnt);

/*
 *  ======== ROVMonSetup ========
 */
void ROVMonSetup()
{
    Serial.begin(9600);

    Serial.print("Setting up Access Point named: ");
    Serial.print(ssid);
    Serial.print(" with password: ");
    Serial.println(wifipw);

    /* startup a new network and get the first IP address: 192.168.1.1 */
    WiFi.beginNetwork((char *)ssid, (char *)wifipw);
    while (WiFi.localIP() == INADDR_NONE) {
        /* print dots while we wait for the AP config to complete */
        Serial.print('.');
        delay(300);
    }
    Serial.println('.');
    printWifiData();

    /*
     * Expected device firmware versions from servicepack_1.0.0.10.0.bin:
     *   NWP version: 2.4.0.2
     *   MAC version: 1.3.0.1
     *   PHY version: 1.0.3.34
     *
     *   RedBear output was: 2.2.0.1.31.1.2.0.2.1.0.3.23
     *           and now is: 2.4.0.2.31.1.3.0.1.1.0.3.34
     */
    Serial.print(" firmware version: ");
    Serial.println(WiFi.firmwareVersion());
    Serial.println("AP active.");

    /* start a data server on port number PORTNUM */
    Serial.print("Starting dataserver on port: "); Serial.println(PORTNUM);
    server.begin();
    Serial.println("dataserver started.");
}

/*
 *  ======== ROVMonLoop ========
 */
void ROVMonLoop()
{
    /* Did a client connect/disconnect since the last time we checked? */
    int a = WiFi.getTotalDevices();
    if (a != num_clients) {
        if (a > num_clients) {  // new Client connected
            int i;
            /* display all clients on the network */
            Serial.println("New client connected. All clients:");
            for (i = 0; i < a; i++) {
                Serial.print("  Client #");
                Serial.print(i);
                Serial.print(" at IP address = ");
                Serial.print(WiFi.deviceIpAddress(i));
                Serial.print(", MAC = ");
                Serial.println(WiFi.deviceMacAddress(i));
            }
        }
        else {                  // a Client disconnected
            Serial.print("Client disconnected, ");
            Serial.print(a);
            Serial.println(" clients remaining.");
        }
        num_clients = a;
    }

    if (num_clients > 0) {
        /* listen for incoming clients */
        WiFiClient client = server.available();

        if (client) {
            /* if there's a client, read and process commands */
            Serial.print("new client socket: ");
            Serial.println(++num_sockets);

            static char buffer[256] = {0};
            int bufLen = 0;
            int sleep = 1;

            /* while connected to the client, read commands and send results */
            while (client.connected()) {
                /* if there's a byte to read from the client .. */
                if (client.available()) {
                    sleep = 1;
                    /* copy it to the command buffer, byte at a time */
                    char c = client.read();

                    /* ignore bogus characters */
                    if (c == '\0' || c == '\r') continue;

                    /* never overrun the command buffer */
                    if (bufLen >= (int)(sizeof (buffer))) {
                        bufLen = sizeof (buffer) - 1;
                    }
                    buffer[bufLen++] = c;

                    /* if there's a new line, we have a complete command */
                    if (c == '\n') {
                        doCommand(buffer, bufLen, client);
                        /* reset command buffer index to get next command */
                        bufLen = 0;
                    }
                }
                else {
                    delay(sleep);
                    if (sleep < 100) {
                       sleep++;
                    }
                }
            }

            /* client disconnected, close the connection */
            Serial.println("client socket disconnected");
            client.flush();
            client.stop();
        }
    }

    delay(100);
}

extern unsigned char g_ucDMAEnabled;

/*
 *  ======== doCommand ========
 *  execute the command in buffer and send results to client
 */
static void doCommand(char *buffer, int len, WiFiClient client)
{
    long int addr = 0;
    int cnt = 0;

    /* get the address and count from the command */
    getAddrCnt(buffer, len, &addr, &cnt);

    /* send client cnt bytes starting from addr */
#if 1
    //Serial.print("read("); Serial.print(addr, HEX); Serial.print(", "); Serial.print(cnt); Serial.println(")");
    if (cnt > 0) {
        unsigned char save = g_ucDMAEnabled;
        if ((0xFFFFFF00 & addr) == 0xE000E400) {
            g_ucDMAEnabled = 0;
        }
        client.write((const uint8_t *)addr, cnt);
        g_ucDMAEnabled = save;
    }
#else
    char *ptr = (char *)addr;
    while (cnt-- > 0) {
        if (client.write(*ptr) != 1) {
            System_printf("doCommand write failure!");
        }
        ptr++;
    }
#endif
}

/*
 *  ======== getAddrCnt ========
 */
static void getAddrCnt(char *buf, int bcnt, long *addr, int *cnt)
{
    static const char hex[] = "0123456789abcdef";
    int i = 0;

    *addr = 0;
    *cnt = 0;

    for (i = 0; i < bcnt;  i++) {
        unsigned char c = buf[i];
        char *cp = strchr(hex, c);
        if (cp == NULL) {
            break;
        }
        *addr = (*addr * 16) + (cp - hex);
    }

    i++;
    for (; i < bcnt;  i++) {
        if (buf[i] == '\n' || buf[i] == '\r') {
            break;
        }
        *cnt = (*cnt * 10) + (buf[i] - '0');
    }
}

/*
 *  ======== printWifiData ========
 */
static void printWifiData()
{
    int i;

    /* print our WiFi IP address: */
    IPAddress ip = WiFi.localIP();
    Serial.print("IP Address: ");
    Serial.println(ip);

    /* print our MAC address: */
    byte mac[6];
    WiFi.macAddress(mac);
    Serial.print("MAC address: ");
    for (i = 5; i >= 1; i--) {
        Serial.print(mac[i], HEX);
        Serial.print(":");
    }
    Serial.println(mac[0], HEX);
}

