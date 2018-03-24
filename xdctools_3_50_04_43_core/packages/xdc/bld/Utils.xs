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
/*
 *  ======== display ========
 */
function display(msg, obj)
{
    function genObj(indent, obj)
    {
	if (indent.length >= 16) {
	    return ("...");
	}
	var pindent = "    " + indent;
	
	var str = '' + obj;
	if (obj != null) {
	    str += " {\n";
	    var i;
	    for (i in obj) {
		str += pindent + i + " = " + gen(pindent, obj[i]) + "\n";
	    }
	    str += indent + "}\n";
	}
	return (str);
    }
    function gen(indent, obj)
    {
	if (obj == null) {
	    return (obj + '');
	}
	else if (typeof obj == "object") {
	    return (genObj(indent, obj));
	}
	else {
	    return (obj + '');
	}
    }

    print(msg + gen('', obj));
}

/*
 *  ======== expandString ========
 */
function expandString(cmd, values)
{
    return (String(Packages.xdc.services.intern.xsr.Utils.expandString(cmd, values)));
}

/*
 *  ======== expandDbgName ========
 */
function expandDbgName(cfgName, exeName, pattern)
{
//    print("cfgName = '" + cfgName + "', " + "exeName = '" + exeName);

    /* parse cfgName into a directory and a base name */
    var ca = cfgName.match(/^(.*[\/\\]){0,1}([^\/\\]*)/);
    if (ca[1] == null) {
	ca[1] = "./";
    }

    /* parse exeName into a directory and a base name */
    var ea = exeName.match(/^(.*[\/\\]){0,1}([^\/\\]*)/);
    if (ea[1] == null) {
	ea[1] = "./";
    }

    /* expand the output file name pattern */
    var fname = expandString(pattern, {
	cfgName: ca[2],
	cfgDir: ca[1],
	exeName: ea[2],
	exeDir: ea[1]
    });

    return (fname);
}

/*
 *  ======== parsePlatName ========
 */
function parsePlatName(pName)
{
    var result = {};

    if (pName == null) {
        return (result);
    }

    /* first try old names (defined in BuildEnvironment.platformTable) */
    var pa = pName.split(':');
    result.platPkgName = pa[0];
    var platIName = pa[1];
    if (pa.length > 2) {
        pa.shift();
        platIName = pa.join(":");
    }

    if (platIName == null) {
        /* try new platform naming convention (config param of module) */
        var index = pName.lastIndexOf('.') + 1;
        platIName = pName.substr(index);
        try {
            /* get the instances module */
            var Mod = xdc.useModule(pName.substring(0, index - 1));

            /* check for the specified config param */
            if (!platIName in Mod) {
//                print("can't find '" + platIName + "' in module " + Mod);
                platIName = "";
            }
            else {
                result.instMod = Mod;

                /* get the type name */
                var tmp = String(Mod[platIName].$type);

                /* remove the ".Module" suffix */
                tmp = tmp.substring(0, tmp.lastIndexOf('.'));

                /* remove the ".Platform" suffix */
                result.platPkgName = tmp.substring(0, tmp.lastIndexOf('.'));
            }
        }
        catch (e) {
            platIName = "";
        }
    }

    result.instName = platIName;

//    print(pName + " := " + result.platPkgName + "::" + result.instName);
    return (result);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

