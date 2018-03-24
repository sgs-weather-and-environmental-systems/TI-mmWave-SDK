/*
 *  ======== Contrib ========
 */
metaonly module Contrib
{
    config Bool breakAfterUserScript = false;

    /*!
     * Execute the config model.
     */
    function execConfig(exeName, pkgName, cfgScript);
}
