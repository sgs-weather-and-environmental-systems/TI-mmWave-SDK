var thisPkgName;

/*
 * ======== run ========
 */
function run(cmdr, args)
{
    var socket = cmdr.socket;

    thisPkgName = this.$package.$name;

    _setupEnvironment(this);
    
    if (null != socket) {
        /* return results via socket to Server */
        var h = new java.util.HashMap();
        for(var i = 0;i < args.length;i++) {
            var prodView = _getProductView(args[i]);
            h.put(args[i],prodView);
        }
        socket.giveToClient(h);
    }
    else {
        /* print output */
        for (var i = 0; i < args.length; i++) {
            _printProductView(args[i]);
        }
    }
}

/*
 * ======== _setupEnvironment ========
 */
function _setupEnvironment(params)
{
    if (params.target) {
        var e;
        try {
            /* load the target */
            var targetName = params.target;
            var target = xdc.module(targetName);

            /* publish a partial Program object */
            var Program = xdc.module("xdc.cfg.Program");
            Program.build = { target: target };
            xdc.global.Program = Program;
        }
        catch (e) {
            print(thisPkgName + ": target "
		  + params.target + " exception: " + e);
        }
    }
    if (params.platform) {
        var e;
        try {
            /* instantiate the platform */
            var platformName = params.platform;
            var BuildEnvironment = xdc.module("xdc.bld.BuildEnvironment");
            var platform = BuildEnvironment.usePlatform(platformName);

            /* instantiate the cpu */
            var Program = xdc.module("xdc.cfg.Program");
            var cpu = platform.getExeContext(Program);

            /* publish a partial Program object */
            Program.platform = platform;
            Program.cpu = cpu;
            xdc.global.Program = Program;
        }
        catch (e) {
            print(thisPkgName + ": platform " 
		  + params.platform + " exception: " + e);
        }
    }
}

/*
 * ======== _getProductView ========
 */
function _getProductView(productViewModule)
{
    try {
        var productView = xdc.useModule(productViewModule);

        var desc = productView.getProductDescriptor();
    
        var homeModule = null;
        if ('homeModule' in productView) {
            homeModule = productView.homeModule;
        }    
    
        /* 
         * If 'homeModule' is not defined pickup the first element from
         * 'elemArray'.
         *
         * Note: This was the heuristic followed earlier and we are doing
         * the same to preserve backwards compatibility
         */ 
        if ((homeModule == null) && (desc.elemArray != null)) {
            var e = desc.elemArray[0];
            homeModule = e.moduleName;
        } 
     
        var linksToArray = null;
    
        if ('linksToArray' in productView) {
            linksToArray = productView.linksToArray;
        }
    
        var prodDescRoot = _traverseProductTree(desc, 
                               productView.$package.packageBase,
                               homeModule,
                               linksToArray);

        return prodDescRoot;
    }
    catch (e) {
        /* Return evaluation error */ 
        return (thisPkgName + ": view module "
		+ productViewModule + " exception: " + e);
    }      
}

/*
 * ======== _traverseProductTree ========
 */
function _traverseProductTree(prodDesc, packageBase, homeModule, linksToArray)
{
    /* convert array into Java LinkedHashSet */
    var linksToSet = new java.util.LinkedHashSet();
    if (linksToArray != null) {
        for each (var link in linksToArray) {
            linksToSet.add(link);
        }
    }

    /* locate specified icon file */
    var iconFile = packageBase + prodDesc.iconFileName;
    if (!java.io.File(iconFile).exists()) {
        /* if it's not in packageBase, look along package path */
        iconFile = xdc.findFile(prodDesc.iconFileName);
        if (iconFile == null) {
            /* if we still can't find it, use a default known to exist */
            print("can't find '" + prodDesc.iconFileName
                  + "' for '" + prodDesc.elemName
                  + "' specified by " + packageBase);
            iconFile = xdc.findFile(
                prodDesc.moduleName == null
                    ? "xdc/productview/icons/mem_fldr.ico"
                    : "xdc/productview/icons/mem.ico");
        }
    }

    /* create a Java ProductDescriptor */
    var p = new xdc.jre.org.eclipse.rtsc.xdctools.model.elements.ProductDescriptor(
        prodDesc.elemName, prodDesc.moduleName,
        iconFile, homeModule, linksToSet);
    
    /* populate its elemArray (recursively) */
    if (prodDesc.elemArray != null) {
        for (var i = 0; i < prodDesc.elemArray.length; i++) {
           p.addProductDescriptor(
               _traverseProductTree(prodDesc.elemArray[i],packageBase,
                                    homeModule, linksToArray));
        }
    }
    
    /* return newly created ProductDescriptor */
    return p;
}

/*
 * ======== _printProductView ========
 */
function _printProductView(productViewModule)
{
    try {
        var productView = xdc.useModule(productViewModule);
        var desc = productView.getProductDescriptor();
        _printProductDescriptor(desc, "");
    }
    catch (e) {
        /* print evaluation error */ 
        print(thisPkgName + ": module "
		  + productViewModule + " exception: " + e);
    }
}

/*
 * ======== _printProductDescriptor ========
 */
function _printProductDescriptor(desc, indent)
{
    /* list the attributes to be printed, in order */
    var attrs = [
        "elemName",
        "moduleName",
        "iconFileName"
    ];

    /* function to delimit the last attribute */
    var end = function(pos) {
        /* check the values of all the later attributes */
        for (var i = pos; i < attrs.length; i++) {
            if (desc[attrs[i]]) {
                /* not the last attribute */
                return "";
            }
        }

        /* last attribute, or last everything? */
        return (!desc.elemArray.length ? "/>" : ">");
    };

    /* print the opening tag */
    print(indent + "<desc" + end(0));

    /* print the attributes */
    for (var i = 0; i < attrs.length; i++) {
        var attr = attrs[i];
        if (desc[attr]) {
            print(indent + "    " + attr + "=\""
                  + desc[attr] + "\"" + end(i+1));
        }
    }

    /* print the children */
    if (desc.elemArray.length) {
        for each (var item in desc.elemArray) {
            _printProductDescriptor(item, indent + "    ");
        }
        print(indent + "</desc>");
    }
}
