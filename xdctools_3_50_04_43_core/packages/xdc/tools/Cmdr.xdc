/* 
 *  Copyright (c) 2008 Texas Instruments and others.
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
 *  ======== Cmdr ========
 *  Command line tool context
 */
metaonly module Cmdr {

    enum Context { SHELL, SCRIPT };

instance:

    /*!
     *  ======== context ========
     *  @_nodoc
     */
    config Context context = SHELL;

    /*
     *  ======== tid ========
     *  @_nodoc
     */
    config Int tid = 0;

    /*!
     *  ======== socket ========
     *  @_nodoc
     */
    config Any socket = null;
    
    /*
     *  ======== create ========
     */
    create(Any cmdmod);
    
    /*!
     *  ======== error ========
     *  Throw an error exception with the specified message
     *
     *  If `msg` is null or the empty string (""), the message
     *  `"fatal error"` is used.
     */
    function error(msg);

    /*!
     *  ======== getopts ========
     *  Parse command-line arguments into config params.
     *
     *  This function accepts an array of command-line arguments, and
     *  uses them to set the values of config parameters in a module
     *  instance. Parsing is controlled by the XDC declarations of the
     *  instance config params.
     *
     *  @a(Usage)
     *  The following command-line argument syntaxes are supported,
     *  following the syntax supported by GNU getopt() and getopt_long():
     *
     *  @p(code)
     *    -f                a boolean flag with short name
     *    -f value          a number or string with short name
     *    -fvalue
     *    -f=value
     *    --longname        a boolean flag with long name
     *    --longname value  a number or string with long name
     *    --longname=value  a number or string with long name
     *  @p
     *
     *  In addition the following non-standard syntaxes are supported:
     *  @p(code)
     *    -f:value
     *    --longnamevalue
     *    --longname:value
     *  @p
     *
     *  @a(Declaration)
     *  The long and short names of the config parameter are declared
     *  by the @CommandOption() attribute of the XDC spec language. For
     *  example to declare a boolean flag with a short name of "-f" and
     *  a long name of "--flag", and a default value of false:
     *  @p(code)
     *     @ CommandOption("f,flag")
     *     config Bool myFlag = false;
     *  @p
     *
     *  Options of type Bool with no argument are assigned the value
     *  "true". The types String and Int can also be used, and always
     *  require an argument to be given on the command line.
     *
     *  @a(Combining Short Flags)
     *  Short-name options can be combined on the command line where there
     *  is no ambiguity, for example the following usages are equivalent:
     *  @p(code)
     *    -a -b -c -f filename
     *    -abcf filename
     *  @p
     *
     *  @a(Multiple Occurrences)
     *  If the config param is declared as an array, the option may
     *  be used multiple times on the command line and each occurence
     *  will be recorded. For example the following records all -I
     *  options, in order:
     *  @p(code)
     *    @ CommandOption("I")
     *    config String includeDirs[] = [];
     *  @p
     *
     *  @a(Required Options)
     *  If the config param has no default value declared, then it
     *  is required on the command line.
     *
     *  @a(Returns)
     *  The following return values are used to determine whether or not to
     *  proceed with the command and, if not, what the exit status of the
     *  command should be.
     *  @p(dlist)
     *      - `undefined`
     *        the command options have been successfully parsed and the 
     *        command should be run.
     *      - `0` (zero)
     *        the command options have been successfully parsed and the 
     *        command does not need to be run and should exit with a
     *        successful exit status (0).
     *      - non-zero integral value
     *        an error occured in the parsing the options and the 
     *        command should not be run and should exit with a non-zero
     *        exit status.
     *      
     *  @param(inst)  instance with config parameters to set
     *  @param(args)  an array of command-line arguments
     */
    function getopts(inst, args);

    /*!
     *  ======== info ========
     *  Output informational message to stdout
     */
    function info(msg);

    /*!
     *  ======== read ========
     *  @_nodoc
     */
    function read();

    /*!
     *  ======== time ========
     *  Output elapsed time since command start to stderr
     */
    function time(msg);

    /*!
     *  ======== usage ========
     *  Output command usage message to stderr
     *
     *  If `msg` is defined and non-empty, the command name and `msg` are
     *  output before the usage information.
     */
    function usage(msg);

    /*!
     *  ======== verbose ========
     *  Set verbose flag as specified
     */
    function verbose(flag);

    /*!
     *  ======== warning ========
     *  Output specified warning message to stderr
     */
    function warning(msg);

    /*!
     *  ======== write ========
     *  @_nodoc
     */
    function write(s);
}
/*
 *  @(#) xdc.tools; 1, 0, 0,0; 11-8-2017 17:13:28; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

