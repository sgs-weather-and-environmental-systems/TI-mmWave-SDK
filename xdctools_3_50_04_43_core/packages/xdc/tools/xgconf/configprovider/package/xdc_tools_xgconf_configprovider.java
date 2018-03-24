/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-A65
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class xdc_tools_xgconf_configprovider
{
    static final String VERS = "@(#) xdc-A65\n";

    static final Proto.Elm $$T_Bool = Proto.Elm.newBool();
    static final Proto.Elm $$T_Num = Proto.Elm.newNum();
    static final Proto.Elm $$T_Str = Proto.Elm.newStr();
    static final Proto.Elm $$T_Obj = Proto.Elm.newObj();

    static final Proto.Fxn $$T_Met = new Proto.Fxn(null, null, 0, -1, false);
    static final Proto.Map $$T_Map = new Proto.Map($$T_Obj);
    static final Proto.Arr $$T_Vec = new Proto.Arr($$T_Obj);

    static final XScriptO $$DEFAULT = Value.DEFAULT;
    static final Object $$UNDEF = Undefined.instance;

    static final Proto.Obj $$Package = (Proto.Obj)Global.get("$$Package");
    static final Proto.Obj $$Module = (Proto.Obj)Global.get("$$Module");
    static final Proto.Obj $$Instance = (Proto.Obj)Global.get("$$Instance");
    static final Proto.Obj $$Params = (Proto.Obj)Global.get("$$Params");

    static final Object $$objFldGet = Global.get("$$objFldGet");
    static final Object $$objFldSet = Global.get("$$objFldSet");
    static final Object $$proxyGet = Global.get("$$proxyGet");
    static final Object $$proxySet = Global.get("$$proxySet");
    static final Object $$delegGet = Global.get("$$delegGet");
    static final Object $$delegSet = Global.get("$$delegSet");

    Scriptable xdcO;
    Session ses;
    Value.Obj om;

    boolean isROV;
    boolean isCFG;

    Proto.Obj pkgP;
    Value.Obj pkgV;

    ArrayList<Object> imports = new ArrayList<Object>();
    ArrayList<Object> loggables = new ArrayList<Object>();
    ArrayList<Object> mcfgs = new ArrayList<Object>();
    ArrayList<Object> icfgs = new ArrayList<Object>();
    ArrayList<String> inherits = new ArrayList<String>();
    ArrayList<Object> proxies = new ArrayList<Object>();
    ArrayList<Object> sizes = new ArrayList<Object>();
    ArrayList<Object> tdefs = new ArrayList<Object>();

    void $$IMPORTS()
    {
        Global.callFxn("loadPackage", xdcO, "xdc.tools");
        Global.callFxn("loadPackage", xdcO, "xdc.shelf");
        Global.callFxn("loadPackage", xdcO, "xdc.tools.xgconf.modeldata");
        Global.callFxn("loadPackage", xdcO, "xdc.services.spec");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.tools.xgconf.configprovider.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.tools.xgconf.configprovider", new Value.Obj("xdc.tools.xgconf.configprovider", pkgP));
    }

    void ConfigProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.xgconf.configprovider.ConfigProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.xgconf.configprovider.ConfigProvider", new Value.Obj("xdc.tools.xgconf.configprovider.ConfigProvider", po));
        pkgV.bind("ConfigProvider", vo);
        // decls 
        om.bind("xdc.tools.xgconf.configprovider.ConfigProvider.Ops", new Proto.Enm("xdc.tools.xgconf.configprovider.ConfigProvider.Ops"));
        // insts 
        Object insP = om.bind("xdc.tools.xgconf.configprovider.ConfigProvider.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$Object", new Proto.Obj());
        om.bind("xdc.tools.xgconf.configprovider.ConfigProvider.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$Params", new Proto.Obj());
        om.bind("xdc.tools.xgconf.configprovider.ConfigProvider.Params", new Proto.Str(po, true));
    }

    void Main$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.xgconf.configprovider.Main.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.xgconf.configprovider.Main", new Value.Obj("xdc.tools.xgconf.configprovider.Main", po));
        pkgV.bind("Main", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.xgconf.configprovider.Main.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.xgconf.configprovider.Main$$Object", new Proto.Obj());
        om.bind("xdc.tools.xgconf.configprovider.Main.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.xgconf.configprovider.Main$$Params", new Proto.Obj());
        om.bind("xdc.tools.xgconf.configprovider.Main.Params", new Proto.Str(po, true));
    }

    void Contrib$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.xgconf.configprovider.Contrib.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.xgconf.configprovider.Contrib", new Value.Obj("xdc.tools.xgconf.configprovider.Contrib", po));
        pkgV.bind("Contrib", vo);
        // decls 
    }

    void ConfigProvider$$CONSTS()
    {
        // module ConfigProvider
        om.bind("xdc.tools.xgconf.configprovider.ConfigProvider.OP_GETVALUES", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Ops", "xdc.tools.xgconf.configprovider"), "xdc.tools.xgconf.configprovider.ConfigProvider.OP_GETVALUES", 0));
        om.bind("xdc.tools.xgconf.configprovider.ConfigProvider.OP_VALIDATE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Ops", "xdc.tools.xgconf.configprovider"), "xdc.tools.xgconf.configprovider.ConfigProvider.OP_VALIDATE", 1));
    }

    void Main$$CONSTS()
    {
        // module Main
    }

    void Contrib$$CONSTS()
    {
        // module Contrib
    }

    void ConfigProvider$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$create", new Proto.Fxn(om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Module", "xdc.tools.xgconf.configprovider"), om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Instance", "xdc.tools.xgconf.configprovider"), 5, 4, false));
                fxn.addArg(0, "fileName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "exeName", $$T_Str, $$UNDEF);
                fxn.addArg(2, "pkgName", $$T_Str, $$UNDEF);
                fxn.addArg(3, "cfgScript", $$T_Str, $$UNDEF);
                fxn.addArg(4, "__params", (Proto)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Params", "xdc.tools.xgconf.configprovider"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$xgconf$configprovider$ConfigProvider$$create = function( fileName, exeName, pkgName, cfgScript, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.xgconf.configprovider.ConfigProvider'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.xgconf.configprovider.ConfigProvider.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools.xgconf.configprovider']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {fileName:fileName, exeName:exeName, pkgName:pkgName, cfgScript:cfgScript});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [fileName, exeName, pkgName, cfgScript]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$construct", new Proto.Fxn(om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Module", "xdc.tools.xgconf.configprovider"), null, 6, 4, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$Object", "xdc.tools.xgconf.configprovider"), null);
                fxn.addArg(1, "fileName", $$T_Str, $$UNDEF);
                fxn.addArg(2, "exeName", $$T_Str, $$UNDEF);
                fxn.addArg(3, "pkgName", $$T_Str, $$UNDEF);
                fxn.addArg(4, "cfgScript", $$T_Str, $$UNDEF);
                fxn.addArg(5, "__params", (Proto)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Params", "xdc.tools.xgconf.configprovider"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$xgconf$configprovider$ConfigProvider$$construct = function( __obj, fileName, exeName, pkgName, cfgScript, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.xgconf.configprovider.ConfigProvider'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {fileName:fileName, exeName:exeName, pkgName:pkgName, cfgScript:cfgScript});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Main$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.xgconf.configprovider.Main$$create", new Proto.Fxn(om.findStrict("xdc.tools.xgconf.configprovider.Main.Module", "xdc.tools.xgconf.configprovider"), om.findStrict("xdc.tools.xgconf.configprovider.Main.Instance", "xdc.tools.xgconf.configprovider"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.tools.xgconf.configprovider.Main.Params", "xdc.tools.xgconf.configprovider"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$xgconf$configprovider$Main$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.xgconf.configprovider.Main'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.xgconf.configprovider.Main.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools.xgconf.configprovider']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.tools.xgconf.configprovider.Main$$construct", new Proto.Fxn(om.findStrict("xdc.tools.xgconf.configprovider.Main.Module", "xdc.tools.xgconf.configprovider"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.xgconf.configprovider.Main$$Object", "xdc.tools.xgconf.configprovider"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.tools.xgconf.configprovider.Main.Params", "xdc.tools.xgconf.configprovider"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$xgconf$configprovider$Main$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.xgconf.configprovider.Main'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Contrib$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ConfigProvider$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ConfigProvider.loadCfgModel
        fxn = (Proto.Fxn)om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$loadCfgModel", new Proto.Fxn(om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Instance", "xdc.tools.xgconf.configprovider"), $$T_Obj, 0, 0, false));
        // fxn ConfigProvider.runCFFxn
        fxn = (Proto.Fxn)om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$runCFFxn", new Proto.Fxn(om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Instance", "xdc.tools.xgconf.configprovider"), $$T_Obj, 6, 6, false));
                fxn.addArg(0, "mobjId", $$T_Str, $$UNDEF);
                fxn.addArg(1, "modinst", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(2, "fxn", $$T_Str, $$UNDEF);
                fxn.addArg(3, "op", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(4, "cfgparam", $$T_Str, $$UNDEF);
                fxn.addArg(5, "value", $$T_Str, $$UNDEF);
        // fxn ConfigProvider.eval
        fxn = (Proto.Fxn)om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$eval", new Proto.Fxn(om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Instance", "xdc.tools.xgconf.configprovider"), $$T_Obj, 1, 1, false));
                fxn.addArg(0, "expr", $$T_Str, $$UNDEF);
        // fxn ConfigProvider._getValidateResults
        fxn = (Proto.Fxn)om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$_getValidateResults", new Proto.Fxn(om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Instance", "xdc.tools.xgconf.configprovider"), $$T_Obj, 0, 0, false));
    }

    void Main$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Main.addXGConfJars
        fxn = (Proto.Fxn)om.bind("xdc.tools.xgconf.configprovider.Main$$addXGConfJars", new Proto.Fxn(om.findStrict("xdc.tools.xgconf.configprovider.Main.Instance", "xdc.tools.xgconf.configprovider"), null, 0, 0, false));
    }

    void Contrib$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Contrib.execConfig
        fxn = (Proto.Fxn)om.bind("xdc.tools.xgconf.configprovider.Contrib$$execConfig", new Proto.Fxn(om.findStrict("xdc.tools.xgconf.configprovider.Contrib.Module", "xdc.tools.xgconf.configprovider"), null, 0, -1, false));
    }

    void ConfigProvider$$SIZES()
    {
    }

    void Main$$SIZES()
    {
    }

    void Contrib$$SIZES()
    {
    }

    void ConfigProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/xgconf/configprovider/ConfigProvider.xs");
        om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Module", "xdc.tools.xgconf.configprovider");
        po.init("xdc.tools.xgconf.configprovider.ConfigProvider.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$create", "xdc.tools.xgconf.configprovider"), Global.get("xdc$tools$xgconf$configprovider$ConfigProvider$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$construct", "xdc.tools.xgconf.configprovider"), Global.get("xdc$tools$xgconf$configprovider$ConfigProvider$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.ConfigProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Instance", "xdc.tools.xgconf.configprovider");
        po.init("xdc.tools.xgconf.configprovider.ConfigProvider.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("breakAfterUserScript", $$T_Bool, false, "wh");
                po.addFxn("loadCfgModel", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$loadCfgModel", "xdc.tools.xgconf.configprovider"), Global.get(cap, "loadCfgModel"));
                po.addFxn("runCFFxn", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$runCFFxn", "xdc.tools.xgconf.configprovider"), Global.get(cap, "runCFFxn"));
                po.addFxn("eval", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$eval", "xdc.tools.xgconf.configprovider"), Global.get(cap, "eval"));
                po.addFxn("_getValidateResults", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$_getValidateResults", "xdc.tools.xgconf.configprovider"), Global.get(cap, "_getValidateResults"));
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$Params", "xdc.tools.xgconf.configprovider");
        po.init("xdc.tools.xgconf.configprovider.ConfigProvider.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("breakAfterUserScript", $$T_Bool, false, "wh");
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$Object", "xdc.tools.xgconf.configprovider");
        po.init("xdc.tools.xgconf.configprovider.ConfigProvider.Object", om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Instance", "xdc.tools.xgconf.configprovider"));
                po.addFxn("loadCfgModel", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$loadCfgModel", "xdc.tools.xgconf.configprovider"), Global.get(cap, "loadCfgModel"));
                po.addFxn("runCFFxn", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$runCFFxn", "xdc.tools.xgconf.configprovider"), Global.get(cap, "runCFFxn"));
                po.addFxn("eval", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$eval", "xdc.tools.xgconf.configprovider"), Global.get(cap, "eval"));
                po.addFxn("_getValidateResults", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$_getValidateResults", "xdc.tools.xgconf.configprovider"), Global.get(cap, "_getValidateResults"));
        // typedef ConfigProvider.CFGFILTERFXN
        om.bind("xdc.tools.xgconf.configprovider.ConfigProvider.CFGFILTERFXN", new Proto.Adr("xdc_Any(*)(xdc_Int,xdc_String,xdc_String)", "PFa"));
    }

    void Main$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/xgconf/configprovider/Main.xs");
        om.bind("xdc.tools.xgconf.configprovider.Main$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.Main.Module", "xdc.tools.xgconf.configprovider");
        po.init("xdc.tools.xgconf.configprovider.Main.Module", om.findStrict("xdc.tools.ICmd.Module", "xdc.tools.xgconf.configprovider"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("usage", new Proto.Arr($$T_Str, false), Global.newArray(new Object[]{"[-e executableName] [-s script] [-f fileName] packagename"}), "wh");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.Main$$create", "xdc.tools.xgconf.configprovider"), Global.get("xdc$tools$xgconf$configprovider$Main$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.Main$$construct", "xdc.tools.xgconf.configprovider"), Global.get("xdc$tools$xgconf$configprovider$Main$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.Main$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.Main$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.Main$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.Main$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "main");
                if (fxn != null) po.addFxn("main", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$main", "xdc.tools.xgconf.configprovider"), fxn);
                fxn = Global.get(cap, "exec");
                if (fxn != null) po.addFxn("exec", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$exec", "xdc.tools.xgconf.configprovider"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.Main.Instance", "xdc.tools.xgconf.configprovider");
        po.init("xdc.tools.xgconf.configprovider.Main.Instance", om.findStrict("xdc.tools.ICmd.Instance", "xdc.tools.xgconf.configprovider"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("executableName", $$T_Str, null, "wh");
        po.addFld("cfgFileName", $$T_Str, null, "wh");
        po.addFld("cfgScript", $$T_Str, null, "wh");
                fxn = Global.get(cap, "run");
                if (fxn != null) po.addFxn("run", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$run", "xdc.tools.xgconf.configprovider"), fxn);
                po.addFxn("addXGConfJars", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.Main$$addXGConfJars", "xdc.tools.xgconf.configprovider"), Global.get(cap, "addXGConfJars"));
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.Main$$Params", "xdc.tools.xgconf.configprovider");
        po.init("xdc.tools.xgconf.configprovider.Main.Params", om.findStrict("xdc.tools.ICmd$$Params", "xdc.tools.xgconf.configprovider"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("executableName", $$T_Str, null, "wh");
        po.addFld("cfgFileName", $$T_Str, null, "wh");
        po.addFld("cfgScript", $$T_Str, null, "wh");
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.Main$$Object", "xdc.tools.xgconf.configprovider");
        po.init("xdc.tools.xgconf.configprovider.Main.Object", om.findStrict("xdc.tools.xgconf.configprovider.Main.Instance", "xdc.tools.xgconf.configprovider"));
                fxn = Global.get(cap, "run");
                if (fxn != null) po.addFxn("run", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$run", "xdc.tools.xgconf.configprovider"), fxn);
                po.addFxn("addXGConfJars", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.Main$$addXGConfJars", "xdc.tools.xgconf.configprovider"), Global.get(cap, "addXGConfJars"));
    }

    void Contrib$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/xgconf/configprovider/Contrib.xs");
        om.bind("xdc.tools.xgconf.configprovider.Contrib$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.Contrib.Module", "xdc.tools.xgconf.configprovider");
        po.init("xdc.tools.xgconf.configprovider.Contrib.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("breakAfterUserScript", $$T_Bool, false, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.Contrib$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.Contrib$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.xgconf.configprovider.Contrib$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("execConfig", (Proto.Fxn)om.findStrict("xdc.tools.xgconf.configprovider.Contrib$$execConfig", "xdc.tools.xgconf.configprovider"), Global.get(cap, "execConfig"));
    }

    void ConfigProvider$$ROV()
    {
    }

    void Main$$ROV()
    {
    }

    void Contrib$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.tools.xgconf.configprovider.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.tools.xgconf.configprovider"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.tools.xgconf.configprovider", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.tools.xgconf.configprovider");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.tools.xgconf.configprovider.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.tools", Global.newArray()));
        imports.add(Global.newArray("xdc.shelf", Global.newArray()));
        imports.add(Global.newArray("xdc.tools.xgconf.modeldata", Global.newArray()));
        imports.add(Global.newArray("xdc.services.spec", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.tools.xgconf.configprovider'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.tools.xgconf.configprovider$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.tools.xgconf.configprovider$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.tools.xgconf.configprovider$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void ConfigProvider$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider", "xdc.tools.xgconf.configprovider");
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Module", "xdc.tools.xgconf.configprovider");
        vo.init2(po, "xdc.tools.xgconf.configprovider.ConfigProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider$$capsule", "xdc.tools.xgconf.configprovider"));
        vo.bind("Instance", om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Instance", "xdc.tools.xgconf.configprovider"));
        vo.bind("Params", om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Params", "xdc.tools.xgconf.configprovider"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Params", "xdc.tools.xgconf.configprovider")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.xgconf.configprovider", "xdc.tools.xgconf.configprovider"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Ops", om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Ops", "xdc.tools.xgconf.configprovider"));
        vo.bind("CFGFILTERFXN", om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.CFGFILTERFXN", "xdc.tools.xgconf.configprovider"));
        vo.bind("OP_GETVALUES", om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.OP_GETVALUES", "xdc.tools.xgconf.configprovider"));
        vo.bind("OP_VALIDATE", om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.OP_VALIDATE", "xdc.tools.xgconf.configprovider"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.xgconf.configprovider")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.xgconf.configprovider.ConfigProvider$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider.Object", "xdc.tools.xgconf.configprovider"));
        pkgV.bind("ConfigProvider", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ConfigProvider");
    }

    void Main$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.xgconf.configprovider.Main", "xdc.tools.xgconf.configprovider");
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.Main.Module", "xdc.tools.xgconf.configprovider");
        vo.init2(po, "xdc.tools.xgconf.configprovider.Main", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.xgconf.configprovider.Main$$capsule", "xdc.tools.xgconf.configprovider"));
        vo.bind("Instance", om.findStrict("xdc.tools.xgconf.configprovider.Main.Instance", "xdc.tools.xgconf.configprovider"));
        vo.bind("Params", om.findStrict("xdc.tools.xgconf.configprovider.Main.Params", "xdc.tools.xgconf.configprovider"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.xgconf.configprovider.Main.Params", "xdc.tools.xgconf.configprovider")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.xgconf.configprovider", "xdc.tools.xgconf.configprovider"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.tools");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.xgconf.configprovider")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.xgconf.configprovider.Main$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.xgconf.configprovider.Main.Object", "xdc.tools.xgconf.configprovider"));
        pkgV.bind("Main", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Main");
    }

    void Contrib$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.xgconf.configprovider.Contrib", "xdc.tools.xgconf.configprovider");
        po = (Proto.Obj)om.findStrict("xdc.tools.xgconf.configprovider.Contrib.Module", "xdc.tools.xgconf.configprovider");
        vo.init2(po, "xdc.tools.xgconf.configprovider.Contrib", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.xgconf.configprovider.Contrib$$capsule", "xdc.tools.xgconf.configprovider"));
        vo.bind("$package", om.findStrict("xdc.tools.xgconf.configprovider", "xdc.tools.xgconf.configprovider"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.xgconf.configprovider")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.xgconf.configprovider.Contrib$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Contrib", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Contrib");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.xgconf.configprovider.ConfigProvider", "xdc.tools.xgconf.configprovider"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.xgconf.configprovider.Main", "xdc.tools.xgconf.configprovider"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.xgconf.configprovider.Contrib", "xdc.tools.xgconf.configprovider"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.tools.xgconf.configprovider.ConfigProvider")).bless();
        ((Value.Obj)om.getv("xdc.tools.xgconf.configprovider.Main")).bless();
        ((Value.Obj)om.getv("xdc.tools.xgconf.configprovider.Contrib")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.tools.xgconf.configprovider")).add(pkgV);
    }

    public void exec( Scriptable xdcO, Session ses )
    {
        this.xdcO = xdcO;
        this.ses = ses;
        om = (Value.Obj)xdcO.get("om", null);

        Object o = om.geto("$name");
        String s = o instanceof String ? (String)o : null;
        isCFG = s != null && s.equals("cfg");
        isROV = s != null && s.equals("rov");

        $$IMPORTS();
        $$OBJECTS();
        ConfigProvider$$OBJECTS();
        Main$$OBJECTS();
        Contrib$$OBJECTS();
        ConfigProvider$$CONSTS();
        Main$$CONSTS();
        Contrib$$CONSTS();
        ConfigProvider$$CREATES();
        Main$$CREATES();
        Contrib$$CREATES();
        ConfigProvider$$FUNCTIONS();
        Main$$FUNCTIONS();
        Contrib$$FUNCTIONS();
        ConfigProvider$$SIZES();
        Main$$SIZES();
        Contrib$$SIZES();
        ConfigProvider$$TYPES();
        Main$$TYPES();
        Contrib$$TYPES();
        if (isROV) {
            ConfigProvider$$ROV();
            Main$$ROV();
            Contrib$$ROV();
        }//isROV
        $$SINGLETONS();
        ConfigProvider$$SINGLETONS();
        Main$$SINGLETONS();
        Contrib$$SINGLETONS();
        $$INITIALIZATION();
    }
}
