/*
 *  ======== MonWifi.h ========
 *  WiFi ROV monitor
 */

#ifndef MONWIFI_H_
#define MONWIFI_H_

/*
 *  ======== MonWiFi_init ========
 *  Initialize this module
 */
#define MonWiFi_init() /* nothing to do */

/*
 *  ======== MonWiFi_start ========
 *  Start an ROV monitor on a specified port
 *
 *  This function assumes that the application is already part of a network.
 *
 *  This ROV monitor allows one to use the ROV tool to gather runtime
 *  information about the application.  To connect using ROV you must
 *  specify a network connection to a specific IP address and port number.
 *
 *  For example, to connect to a device whose IP address is 10.123.45.1
 *  running the monitor on port 5001, you would specify the following
 *  "Target communication link" when starting the ROV tool:
 *
 *      Net:10.123.45.1:5001
 */
extern int MonWiFi_start(unsigned short portNumber);


#endif /* MONWIFI_H_ */
