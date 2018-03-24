/*!
 *  @_nodoc
 *  ======== xdc.tools.xgconf.productview ========
 *  Generate "product views" from the specified IProductView modules
 *
 *  This command is used to generate the tables of modules and their
 *  icons for display in the "Available Products View".
 *
 *  @see xdc.tools.product.IProductView
 */
metaonly module Main inherits xdc.tools.ICmd {

    /*
     *  ======== usage ========
     */
    override config String usage[] = [
        'xs xdc.tools.xgconf.productview [options] <productview module0> .. <productview moduleN>'
    ];

instance:

    /*!
     *  @_nodoc
     *  ======== packagePath ========
     *  deprecated: unused
     */
    @CommandOption("packagePath")
    config String packagePath = null;

    /*
     *  ======== platform ========
     *  Platform to use when constructing a xdc.cfg.Program context
     */
    @CommandOption("platform,p")
    config String platform = null;

    /*
     *  ======== target ========
     *  Target to use when constructing a xdc.cfg.Program context
     */
    @CommandOption("target,t")
    config String target = null;
}
