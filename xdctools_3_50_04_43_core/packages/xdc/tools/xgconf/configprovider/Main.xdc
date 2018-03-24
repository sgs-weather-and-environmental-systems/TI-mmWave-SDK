/*!
 *  ======== Main ========  
 *  XGCONF Parser
 */
metaonly module Main inherits xdc.tools.ICmd
{
    override config String usage[] = [
        '[-e executableName] [-s script] [-f fileName] packagename'
    ];

instance:
    
    //! Executable name - required if package has multiple executables
    @CommandOption('e')
    config String executableName = null;

    //! File name - required if package has multiple executables
    @CommandOption('f')
    config String cfgFileName = null;
    
    @CommandOption('s')
    config String cfgScript = null;
    
    /*
     *  ======== addXGConfJars ========
     */
    void addXGConfJars();
}
