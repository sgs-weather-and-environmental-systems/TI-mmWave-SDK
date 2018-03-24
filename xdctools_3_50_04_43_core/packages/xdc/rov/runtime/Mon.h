/*
 *  ======== Mon.h ========
 *  Portable ROV monitor
 *
 *  This module requires the user to supply two functions: one that reads
 *  characters consisting of read/write commands, and another that writes
 *  binary results back to the client that sent the commands.
 *  
 *  To use this monitor you must
 *      1. initialize a static structure of type Mon_Object
 *      2. repeatedly call the function Mon_doCommand() from a thread that
 *         is allowed to call the read/write functions configured in step 1.
 *
 *  The file support/MonSerial.c illustrates how to use this module with a
 *  TI-RTOS UART driver.
 *
 *  The file support/MonWiFi.c illustrates how to use this module with a
 *  TI-RTOS UART driver.
 */

#ifndef xdc_rov_Mon__include
#define xdc_rov_Mon__include

#if defined(__cplusplus)
extern "C" {
#endif

/*
 *  ======== Mon_MAXCMDSIZE ========
 *  Minimum recommended command buffer size
 */
#define Mon_MAXCMDSIZE 128

/*
 *  ======== Mon_readFxn ========
 *  Read cnt chars from client's output data stream into buf
 *
 *  The read function's parameters and return follow the the standard POSIX
 *  read() function:
 *      o up to cnt bytes are transfered to buf
 *      o the return value is the number of bytes transfered, which may
 *        be less than cnt
 *      o a return value of 0 indicates an end of the input stream
 *      o a return value less than 0 indicates an error
 */
typedef int (*Mon_readFxn)(char *buf, int cnt);

/*
 *  ======== Mon_writeFxn ========
 *  Write cnt chars from buf to the client's input data stream
 *
 *  The write function's parameters and return value follow that of the
 *  standard POSIX  write() function:
 *      o up to cnt bytes are transfered from buf
 *      o the return value is the number of bytes transfered, which may
 *        be less than cnt (including 0)
 *      o a return value less than 0 indicates an error
 */
typedef int (*Mon_writeFxn)(const char *buf, int cnt);

/*
 *  ======== Mon_Object ========
 *  Monitor instance state
 *
 *  This structure contains the state of the monitor which must be
 *  initialized prior to using any methods provided by this module.
 */
typedef struct Mon_Object {
    char         *buffer;       /* command buf with >= Mon_MAXCMDSIZE chars */
    Mon_readFxn  read;          /* read command and data function */
    Mon_writeFxn write;         /* write results function */
} Mon_Object;

/*
 *  ======== Mon_Handle ========
 */
typedef struct Mon_Object *Mon_Handle;

/*
 *  ======== Mon_doCommand ========
 *  Read and execute a single command, then write results to client
 *
 *  Mon_doCommand() uses the read and write functions to read one command,
 *  perform the command, and write its results.  If there is a read() or
 *  write() failure (i.e., they return a negative value), no command is
 *  executed and Mon_doCommand() returns the failing read/write status value.
 *
 *  Commands suported:
 *     "r <addr>,<cnt>\n"  - copy <cnt> bytes from <addr> and write them
 *     "w <addr>,<cnt>\n"  - read <cnt> bytes and copy them to <addr>
 *     "c <addr>,<cnt>\n"  - crc32 <cnt> bytes from <addr> and write 4-byte
 *                           binary CRC
 *
 *  where, <addr> is a long and <cnt> is an int and both are represented as
 *  lower-case hexadecimal numbers (without a leading "0x").
 *
 *  Returns 0 on success; otherwise, a negative value indicating a read or
 *  write failure.
 */
extern int Mon_doCommand(Mon_Handle mon);

#if defined(__cplusplus)
}
#endif

#endif
