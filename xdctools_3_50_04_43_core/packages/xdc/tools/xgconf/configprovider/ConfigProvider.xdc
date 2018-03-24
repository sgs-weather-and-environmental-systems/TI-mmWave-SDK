/*!
 *  ======== ConfigProvider ========
 *  Provides a ContentProvider that serves up
 *  the exported contents of an xdc configuration.
 */
metaonly module ConfigProvider {

    /*!
     *  ======== Ops ========
     *  Filter function operation modes
     */
    enum Ops {
        OP_GETVALUES,           /*! Get allowed value list. */
        OP_VALIDATE             /*! Validate choice and return js rval */
    };

    /*!
     *  ======== CFGFILTERFXN ========
     *  Config param value-filter function type definition
     *
     *  @param(operation)    Config operation type
     *  @param(configParam)  Config param name
     *  @param(value)        Value for set
     *
     *  @returns(results)     Depends on operation - string array on get, and
     *                        string on set
     */
    typedef any (*CFGFILTERFXN)(int, string, string);

instance:
    config Bool breakAfterUserScript = false;
     
    /*!
     *  ======== create ========
     *  instance creation function 
     *  @param(fileName)        Config File name
     *  @param(exeName)         Executable name
     *  @param(pkgName)         Package name
     *  @param(pkgRep)          Optional additional package repository path
     */
    create(string fileName, string exeName, string pkgName, string cfgScript);
    
    /*!
     *  ======== loadCfgModel ======== 
     *  Get the Configuration Model
     */
    any loadCfgModel();
    
    /*!
     *  ======== runCFFxn ========
     *  Run a function in the current configuration
     *
     *  This is used to get valid choices or set results.
     *  
     *  @param(mobjId)    Fully qualified model object id - including #nn
     *                     if it's an instance
     *  @param(fxn)       Name of function to invoke must match
     *                     CFGFILTERFXN signature
     *  @param(op)        Operation id - 0: get; 1: set - Ops enum
     *  @param(cfgparam)  Configuration parameter whose information is
     *                     requested
     *  @param(value)     Selected value for set command - ignored if get
     *
     *  @returns(results)  Depends on operation - s/b string array on get
     *                     and string on set
     */
    any runCFFxn(string mobjId, int modinst, string fxn, int op,
                 string cfgparam, string value);

    /*!
     *  ======== eval ========
     *  Execute an XDCscript expression
     *
     *  The expression executed in the context of the user's configuration
     *  script.
     */
    any eval(String expr);
    
    /*!
     * @_nodoc 
     *  ======== _getValidateResults ========
     */
    any _getValidateResults();
}

