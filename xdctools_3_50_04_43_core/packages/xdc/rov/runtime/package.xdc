/*!
 *  ======== xdc.rov.runtime ========
 *  ROV target runtime support
 *
 *  This package contains a runtime monitor that can be used with ROV in lieu
 *  of a JTAG connection.  The `xdc.rov.monserver` package contains a server
 *  that enables a standalone Browser-based ROV GUI application that can
 *  utilize the target monitor provided by this package.
 *
 *  The file `Board_serialMon.txt` (contained in this package) illustrates
 *  how to use the runtime monitor with a TI-RTOS UART driver.
 */
package xdc.rov.runtime {
    module Monitor;
}
