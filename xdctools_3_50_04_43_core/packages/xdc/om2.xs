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
 *  ======== logError ========
 *  Module raise error function
 *
 *  Indicate an error from this module but allow additional errors
 *  to be logged.
 */
function logError(msg, agg, sel)
{
    if (msg == undefined) {
        throw Error("parameter msg must be defined for $logError()");
    }
    if (agg == undefined) {
        throw Error("parameter agg must be defined for $logError()");
    }
    if (sel == undefined) {
        sel = "";
    }
    var shellContext = Packages.config.Shell.getFrame(1);
    xdc.om.$$errors.push('error:::' + this.$name + ':::' + shellContext + ':::' + ("" + agg + " " + sel) + ':::' + msg);
}

/*
 *  ======== logFatal ========
 *  Module raise fatal error function
 *
 *  Throw exception because it is not possible to continue
 */
function logFatal(msg, agg, sel)
{
    if (msg == undefined) {
        throw Error("parameter msg must be defined for $logFatal()");
    }
    if (agg == undefined) {
        throw Error("parameter agg must be defined for $logFatal()");
    }
    if (sel == undefined) {
        sel = "";
    }
    var frame = Packages.config.Shell.getFrame(1);
    xdc.om.$$errors.push('error:::' + this.$name + ':::' + frame + ':::' + (""
        + agg + " " + sel) + ':::' + msg);
    throw new Error("xdc.fatal.error");
}

/*
 *  ======== logWarning ========
 *  Module raise warning function
 */
function logWarning(msg, agg, sel)
{
    if (typeof(msg) == "object" && msg.warning.id != undefined) {
        var message = xdc.module("xdc.Warnings").getMessage(msg);
        if (message == "_undf" || message == "_dsbl") {
            return;
        }
        msg = message;
    }
    if (msg == undefined) {
        throw Error("parameter msg must be defined for $logWarning()");
    }
    if (agg == undefined) {
        throw Error("parameter agg must be defined for $logWarning()");
    }
    if (sel == undefined) {
        sel = "";
    }
    var shellContext = Packages.config.Shell.getFrame(1);
    xdc.om.$$warnings.push('warning:::' + this.$name + ':::' + shellContext + ':::' + ("" + agg + " " + sel) + ':::' + msg);
}

xdc.global.$$PAdr = Packages.xdc.services.intern.xsr.Proto$Adr;
xdc.global.$$PArr = Packages.xdc.services.intern.xsr.Proto$Arr;
xdc.global.$$PElm = Packages.xdc.services.intern.xsr.Proto$Elm;
xdc.global.$$PEnm = Packages.xdc.services.intern.xsr.Proto$Enm;
xdc.global.$$PFxn = Packages.xdc.services.intern.xsr.Proto$Fxn;
xdc.global.$$PMap = Packages.xdc.services.intern.xsr.Proto$Map;
xdc.global.$$PObj = Packages.xdc.services.intern.xsr.Proto$Obj;
xdc.global.$$PStr = Packages.xdc.services.intern.xsr.Proto$Str;
xdc.global.$$PTag = Packages.xdc.services.intern.xsr.Proto$Tag;
xdc.global.$$PTel = Packages.xdc.services.intern.xsr.Proto$Tel;

xdc.global.$$T_Bool = $$PElm.newBool();
xdc.global.$$T_CNum = $$PElm.newCNum;
xdc.global.$$T_Num = $$PElm.newNum();
xdc.global.$$T_Obj = $$PElm.newObj();
xdc.global.$$T_Str = $$PElm.newStr();

xdc.global.$$T_Met = $$PFxn(null, null, 0, -1, false);
xdc.global.$$T_Map = $$PMap($$T_Obj);
xdc.global.$$T_Vec = $$PArr($$T_Obj);

xdc.global.$$Enum = Packages.xdc.services.intern.xsr.Enum.make;
xdc.global.$$Extern = Packages.xdc.services.intern.xsr.Extern;
xdc.global.$$Debug = Packages.xdc.services.intern.xsr.Debug;
xdc.global.$$VObj = Packages.xdc.services.intern.xsr.Value$Obj;

xdc.global.$$DEFAULT = Packages.xdc.services.intern.xsr.Value.DEFAULT;
xdc.global.$$NOGEN = Packages.xdc.services.intern.xsr.Value.NOGEN;
xdc.global.$$NOP = function(){ };
xdc.global.$$INSTANCE_STATIC_INIT = function() {
    throw new Packages.xdc.services.global.XDCException("xdc.STATIC_INSTANCE",
        "Module '" + this.$module.$name + "' does not support static instances."
        + " There is no implementation of instance$static$init in '"
        + this.$module.$name + "'.");
};

xdc.global.$$SO = Packages.xdc.services.intern.xsr.Value.sealSObj;

xdc.global.$$Package = $$PObj().$$init('$$Package', null);
xdc.global.$$Module = $$PObj().$$init('$$Module', null);
xdc.global.$$Instance = $$PObj().$$init('$$Instance', null);
xdc.global.$$Params = $$PObj().$$init('$$Params', null);

xdc.global.$addr = Packages.xdc.services.intern.xsr.Addr;

xdc.global.$externFxn = function( sym ) {
    return xdc.global.$$Extern(sym, null, true, true);
};
xdc.global.$externModFxn = function( sym ) {
    return xdc.global.$$Extern(sym, null, true, false);
};
xdc.global.$externPtr = function( sym ) {
    return xdc.global.$$Extern(sym, null, false, true);
};

var cap = xdc.loadCapsule('xdc/xmlgen.xs');
xdc.global.$$xml = cap.xml;

cap = xdc.loadCapsule('xdc/xmlgen2.xs');
xdc.global.$$xml2 = cap.xml;

/* $$Package and $$Module are instances of Proto.Obj, with 'sup' set to null.
 * Most modules, except some special ones like IPackage, inherit from $$Modules
 * through xdc.runtime.IModule, which is initialized with $$Module in the 
 * xdc.runtime schema.
 */
var po = $$Package;
    po.$$fld('$attr', $$T_Map, $$DEFAULT, 'rh');
    po.$$fld('$modules', $$T_Vec, $$DEFAULT, 'rh');
    po.$$fld('$interfaces', $$T_Vec, $$DEFAULT, 'rh');
    po.$$fld('$unitNames', $$T_Vec, $$DEFAULT, 'rh');
    po.$$fldv('$spec', $$T_Obj, null, 'rh', function() { return xdc.$$ses.findPkg(this.$name); }, null);

po = $$Module;
    po.$$fld('$used', $$T_Bool, false, 'wh');
    po.$$fld('$uses', $$PArr($$Module), $$DEFAULT, 'wh');
    po.$$fld('$attr', $$T_Map, $$DEFAULT, 'rh');
    po.$$fld('$instances', $$T_Vec, $$DEFAULT, 'rh');
    po.$$fld('$objects', $$T_Vec, $$DEFAULT, 'rh');
    po.$$fxn('module$meta$init', $$T_Met, $$NOP);
    po.$$fxn('instance$meta$init', $$T_Met, $$NOP);
    po.$$fxn('instance$static$init', $$T_Met, $$INSTANCE_STATIC_INIT);
    po.$$fxn('instance$init', $$T_Met, $$NOP);
    po.$$fxn('module$static$init', $$T_Met, $$NOP);
    po.$$fxn('module$validate', $$T_Met, $$NOP);
    po.$$fxn('module$use', $$T_Met, $$NOP);
    po.$$fxn('$logError', $$T_Met, logError);
    po.$$fxn('$logWarning', $$T_Met, logWarning);
    po.$$fxn('$logFatal', $$T_Met, logFatal);
    po.$$fldv('$spec', $$T_Obj, null, 'rh', function() { xdc.$$ses.findPkg(this.$package.$name); return xdc.$$ses.findUnit(this.$name); }, null);


xdc.global.$$objFldGet = function(prop) {
    return this['Object_field_' + prop];
};

xdc.global.$$objFldSet = function(prop, val) {
    return this['Object_field_' + prop] = val;
};

xdc.global.$$proxyGet = function(prop) {
    return this.delegate$[prop];
};

xdc.global.$$proxySet = function(prop, val) {
    return this.delegate$[prop] = val;
};

/* These two functions are added as a getter and a setter for each config
 * parameter declared as proxy. The parameter PName is in the prototype,
 * while PName$proxy is in the object.
 */
xdc.global.$$delegGet = function(prop) {
    var p = this[prop + '$proxy'];
    return (p.delegate$ ? p : p.delegate$);
};

xdc.global.$$delegSet = function(prop, val) {
    return (this[prop + '$proxy'].delegate$ = val);
};

xdc.global.$$alignof = function(stype)
{
    $$computeSizes(stype);
    return stype.$$al;
};

xdc.global.$$offsetof = function(stype, fld)
{
    $$computeSizes(stype);
    return stype[fld + '$$of'];
};

xdc.global.$$sizeof = function(stype)
{
    $$computeSizes(stype);
    return stype.$$sz;
};

/*
 *  ======== $$computeSizes ========
 *  This function references the object Program, which means that it
 *  can be invoked only within the configuration object model.
 */
xdc.global.$$computeSizes = function(stype)
{
    if ('$$sz' in stype) {
        return;
    }

    var sizes = stype.$$sizes;
    var uflg = '$$union' in stype;

    var t, a, d, s;
    var a0 = 0, n = 1, sz = 0;
    var ms = 0, ma = 0;

    var target = Program.build.target;
    
    for (var i = 0; i < sizes.length; i++) {
        var fld = sizes[i][0];
        var ts = sizes[i][1];

        /* compute total number of element in an array and each elem's type */
        while (ts[0] == 'A') {
            var k = ts.indexOf(';');
            n *= Number(eval(ts.substring(1, k)));
            ts = ts.substring(k + 1);
        }

        switch (ts[0]) {
            case 'S':
                /* structure aggregate: <scope>;<name> */
                var sn = ts.substring(1).split(';');
                var st = xdc.om[sn[0]][sn[1]];
                a = $$alignof(st);
                s = $$sizeof(st);
                break;

            case 'E':
                /* @Encoded type, get size and alignment from module */
                var en = ts.substring(1).split(";");
                a = xdc.om[en[0] + '$$capsule'][en[1] + '$alignof']();
                s = xdc.om[en[0] + '$$capsule'][en[1] + '$sizeof']();
                break;

            case 'N':
                /* enumerated type */
                t = $$getEnumType(ts, target);
                a = t.align;
                s = t.size;
                break;

            case 'T':
            case 'U':
                /* "U": unsigned std type, "T": signed std type */
                t = target.stdTypes['t_' + ts.substring(1)];
                a = t.align;
                s = t.size;
                break;
        }

        if ((d = sz % a) != 0) {
            sz += a - d;
        }

        stype.$$bind(fld + '$$of', sz);

        sz += s * n; n = 1;
        if (i == 0) {
            a0 = a;
        }

        if (uflg) {
            if (sz > ms) {
                ms = sz;
            }
            sz = 0;
            if (a0 > ma) {
                ma = a0;
            }
            a0 = 0;
        }
    }

    if ((d = sz % a0) != 0) {
        sz += a0 - d;
    }

    stype.$$bind('$$sz', uflg ? ms : sz);
    stype.$$bind('$$al', uflg ? ma : a0);
};

/*
 *  ======== $$getEnumType ========
 *  Convert enum encoding into a Target stdType
 */
xdc.global.$$getEnumType = function (ts, target)
{
    var k = ts.indexOf(';');
    if (k < 0) {
        return (target.stdTypes.t_Int);
    }
    
    var suffix = ts.substr(k + 1);
    var name = ts.substr(1, k);
    
    var sa = suffix.split(';');
    var refType = sa.shift();
	    
    if (refType != "") {
        /* refType[0] == 'T' or 'U' */
        return (target.stdTypes['t_' + refType.substring(1)]);
    }

    if (("shortEnums" in target.model) && target.model.shortEnums) {
        /* this is where we have to compute smallest container */
        var min = 0;
        var max = sa.length - 1;
        for (var i = 0; i < sa.length; i++) {
            if (sa[i] != "") {
                var tmp = eval(sa[i]);
                if (tmp > max) {
                    max = tmp;
                }
                if (tmp < min) {
                    min = tmp;
                }
                sa[i] = tmp;
            }
        }
        if ((min >= 0 && max <= 255) || (min >= -128 && max <= 127)) {
            return (target.stdTypes.t_Int8);
        }
        if ((min >= 0 && max <= 65535) || (min >= -32768 && max <= 32767)) {
            return (target.stdTypes.t_Int16);
        }
        return (target.stdTypes.t_Int32);
    }
    
    return (target.stdTypes.t_Int);
};

/* xdc.om is an instance of Value.Obj, with 'proto' set to '$$OM' instance of
 * Proto.Obj.
 */
xdc.om = $$VObj('$om').$$init($$PObj().$$init('$$OM', null), '$om', $$DEFAULT, false);
xdc.om.$$bind('$$d', {});
xdc.om.$$bind('$name', undefined);
xdc.om.$$bind('$$phase', 0);
xdc.om.$$bind('$curpkg', undefined);
xdc.om.$$bind('$require', new $$T_Map);
xdc.om.$$bind('$homepkg', undefined);
xdc.om.$$bind('$modules', new $$T_Vec);
xdc.om.$$bind('$packages', new $$T_Vec);
xdc.om.$$bind('$$om2', 1);
xdc.om.$$bind('$$errors', []);
xdc.om.$$bind('$$warnings', []);
xdc.om.$$bind('$om', xdc.om);

Packages.xdc.services.intern.xsr.XScriptO.setOM(xdc.om);
xdc.global.$om = xdc.om;                /* DEPRECATED ALIAS */
/*
 *  @(#) xdc; 1, 1, 1,0; 11-8-2017 17:10:07; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

