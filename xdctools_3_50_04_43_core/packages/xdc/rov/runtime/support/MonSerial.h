/*
 *  ======== MonSerial.h ========
 *  Serial port ROV monitor
 */
#ifndef MonSerial_H
#define MonSerial_H
#ifdef __cplusplus
extern "C" {
#endif

/*
 *  ======== MonSerial_init ========
 *  Initialize this module
 */
#define MonSerial_init() /* nothing to do */

/*
 *  ======== MonSerial_start ========
 *  Start the ROV monitor using the specified UART and baud rate
 *
 *  This function assumes that the application has configured the TI-DRIVER
 *  UART and there is an UART that's available for exclusive use by this
 *  module.
 *
 *  This ROV monitor allows one to use the ROV tool to gather runtime
 *  information about the application.  To connect using ROV you must
 *  specify a serial connection to a specific "comm port"
 *
 *  For example, to connect to comm port "COM3", you would specify the
 *  following "Target communication link" when starting the ROV tool:
 *
 *      Serial:COM3
 *
 *  NOTE: if you specify a baudrate other than 115200, you must also specify
 *        the same baudrate when connecting the ROV application to the serial
 *        port.  For example, if you pass a baudrate of 9600 to
 *        MonSerial_start, you must connect with ROV using:
 *
 *            Serial:COM3:9600
 */
extern void MonSerial_start(int uartId, int baudRate);

#ifdef __cplusplus
}
#endif

#endif
