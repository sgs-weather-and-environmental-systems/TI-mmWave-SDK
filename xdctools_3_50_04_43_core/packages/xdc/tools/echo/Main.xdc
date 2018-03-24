/* 
 *Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */
/*!
 *   Echo arguments
 *
 *   This command simply echos its arguments, optionally preceded by
 *   some header text specified via the -H option.  The -v option emits
 *   descriptive commentary to standard error.
 *
 *   The -a option outputs an array of lines representing each argument
 *   to the command, while the -x options outputs a suitably-structured XML
 *   document.  These options downstream processing of command results.
 */
metaonly module Main inherits xdc.tools.ICmd {

    override config String usage[] = [
        '[-v] [-H header] arg ...',
        '[-a] [-v] [-H header] arg ...',
        '[-x] [-v] [-H header] arg ...',
    ];

    @XmlDtd
    struct Results {
        String header;
        String args[];
    }

instance:

    //!Return an array of strings
    @CommandOption('a')
    config Bool arrFlag = false;

    //!Print informative messages during execution
    @CommandOption('v')
    config Bool verboseFlag = false;

    //!Return an Results struct as XML
    @CommandOption('x')
    config Bool xmlFlag = false;

    //!Header label
    @CommandOption('H')
    config String header = null;
}
/*
 *  @(#) xdc.tools.echo; 1, 0, 0,0; 1-9-2017 12:51:27; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

