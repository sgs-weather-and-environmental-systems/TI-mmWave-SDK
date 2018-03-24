/*
 *  ======== ROVMonUART ========
 *  This sketch accepts read memory requests from the serial port
 *  and sends the results back through the serial port.
 *
 *  Memory read requests are of the form:
 *      <addr>,<count>\n
 *
 *  where <addr> is an all lower-case hexadecimal address without
 *  a leading "0x", <count> is a decimal byte count, and \n is a 
 *  single newline character.  For example: 2000faf8,8
 *
 *  The reply is the sequence of <count> 8-bit bytes starting from
 *  <addr>. 
 */
#include <string.h>

static void doCommand(char *buffer, int len);
static void getAddrCnt(char *buf, int bcnt, long *addr, int *cnt);

/*
 *  ======== ROVMonSetup ========
 */
void ROVMonSetup()
{
    Serial.begin(115200);
}

/*
 *  ======== ROVMonLoop ========
 */
void ROVMonLoop()
{
    static char buffer[256] = {0};
    static int bufLen = 0;
    
    /* copy characters to the command buffer, byte at a time */
    char c = Serial.read();

    /* ignore bogus characters */
    if (c == '\0' || c == '\r') return;

    /* never overrun the command buffer */
    if (bufLen >= (int)(sizeof (buffer))) {
        bufLen = sizeof (buffer) - 1;
    }
    buffer[bufLen++] = c;

    /* if there's a new line, we have a complete command */
    if (c == '\n') {
        /* run command and reset buffer index to get next command */
        doCommand(buffer, bufLen);
        bufLen = 0;
    }
}

/*
 *  ======== doCommand ========
 *  Execute the command in buffer and send results to client
 */
static void doCommand(char *buffer, int len)
{
    long int addr = 0;
    int cnt = 0;

    /* get the address and count from the command buffer */
    getAddrCnt(buffer, len, &addr, &cnt);

    /* send client cnt bytes starting from addr */
    if (cnt > 0) {
        Serial.write((const uint8_t *)addr, cnt);
    }
}

/*
 *  ======== getAddrCnt ========
 *  Parse "<addr>,<count>\n" commands
 */
static void getAddrCnt(char *buf, int bcnt, long *addr, int *cnt)
{
    static const char hex[] = "0123456789abcdef";
    int i;

    /* decode hex address */
    for (*addr = 0, i = 0; i < bcnt;  i++) {
        unsigned char c = buf[i];
        char *cp = strchr(hex, c);
        if (cp == NULL) {
            break;
        }
        *addr = (*addr * 16) + (cp - hex);
    }

    i++; /* skip over ',' separation character */

    /* decode decimal count */
    for (*cnt = 0; i < bcnt;  i++) {
        if (buf[i] == '\n' || buf[i] == '\r') {
            break;
        }
        *cnt = (*cnt * 10) + (buf[i] - '0');
    }
}

