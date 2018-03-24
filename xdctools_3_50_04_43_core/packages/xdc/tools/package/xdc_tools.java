/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D21
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class xdc_tools
{
    static final String VERS = "@(#) xdc-D21\n";

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
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.tools.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.tools", new Value.Obj("xdc.tools", pkgP));
    }

    void Cmdr$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.Cmdr.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.Cmdr", new Value.Obj("xdc.tools.Cmdr", po));
        pkgV.bind("Cmdr", vo);
        // decls 
        om.bind("xdc.tools.Cmdr.Context", new Proto.Enm("xdc.tools.Cmdr.Context"));
        // insts 
        Object insP = om.bind("xdc.tools.Cmdr.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.Cmdr$$Object", new Proto.Obj());
        om.bind("xdc.tools.Cmdr.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.Cmdr$$Params", new Proto.Obj());
        om.bind("xdc.tools.Cmdr.Params", new Proto.Str(po, true));
    }

    void ResourceBundle$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.ResourceBundle.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.ResourceBundle", new Value.Obj("xdc.tools.ResourceBundle", po));
        pkgV.bind("ResourceBundle", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.ResourceBundle.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.ResourceBundle$$Object", new Proto.Obj());
        om.bind("xdc.tools.ResourceBundle.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.ResourceBundle$$Params", new Proto.Obj());
        om.bind("xdc.tools.ResourceBundle.Params", new Proto.Str(po, true));
    }

    void ICmd$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.ICmd.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.ICmd", new Value.Obj("xdc.tools.ICmd", po));
        pkgV.bind("ICmd", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.ICmd.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.ICmd$$Object", new Proto.Obj());
        om.bind("xdc.tools.ICmd.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.ICmd$$Params", new Proto.Obj());
        om.bind("xdc.tools.ICmd.Params", new Proto.Str(po, true));
    }

    void IProductView$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.IProductView.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.IProductView", new Value.Obj("xdc.tools.IProductView", po));
        pkgV.bind("IProductView", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.tools.IProductView$$ProductElemDesc", new Proto.Obj());
        om.bind("xdc.tools.IProductView.ProductElemDesc", new Proto.Str(spo, true));
    }

    void IRtscProductTemplate$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.IRtscProductTemplate.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.IRtscProductTemplate", new Value.Obj("xdc.tools.IRtscProductTemplate", po));
        pkgV.bind("IRtscProductTemplate", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.tools.IRtscProductTemplate$$TemplateInfo", new Proto.Obj());
        om.bind("xdc.tools.IRtscProductTemplate.TemplateInfo", new Proto.Str(spo, true));
    }

    void Cmdr$$CONSTS()
    {
        // module Cmdr
        om.bind("xdc.tools.Cmdr.SHELL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.tools.Cmdr.Context", "xdc.tools"), "xdc.tools.Cmdr.SHELL", 0));
        om.bind("xdc.tools.Cmdr.SCRIPT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.tools.Cmdr.Context", "xdc.tools"), "xdc.tools.Cmdr.SCRIPT", 1));
    }

    void ResourceBundle$$CONSTS()
    {
        // module ResourceBundle
    }

    void ICmd$$CONSTS()
    {
        // interface ICmd
    }

    void IProductView$$CONSTS()
    {
        // interface IProductView
    }

    void IRtscProductTemplate$$CONSTS()
    {
        // interface IRtscProductTemplate
    }

    void Cmdr$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$create", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Module", "xdc.tools"), om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), 2, 1, false));
                fxn.addArg(0, "cmdmod", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.tools.Cmdr.Params", "xdc.tools"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$Cmdr$$create = function( cmdmod, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.Cmdr'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.Cmdr.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {cmdmod:cmdmod});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [cmdmod]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$construct", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Module", "xdc.tools"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.Cmdr$$Object", "xdc.tools"), null);
                fxn.addArg(1, "cmdmod", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.tools.Cmdr.Params", "xdc.tools"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$Cmdr$$construct = function( __obj, cmdmod, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.Cmdr'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {cmdmod:cmdmod});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ResourceBundle$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.ResourceBundle$$create", new Proto.Fxn(om.findStrict("xdc.tools.ResourceBundle.Module", "xdc.tools"), om.findStrict("xdc.tools.ResourceBundle.Instance", "xdc.tools"), 3, 2, false));
                fxn.addArg(0, "pkgName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "lang", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.tools.ResourceBundle.Params", "xdc.tools"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$ResourceBundle$$create = function( pkgName, lang, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.ResourceBundle'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.ResourceBundle.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {pkgName:pkgName, lang:lang});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [pkgName, lang]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.tools.ResourceBundle$$construct", new Proto.Fxn(om.findStrict("xdc.tools.ResourceBundle.Module", "xdc.tools"), null, 4, 2, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.ResourceBundle$$Object", "xdc.tools"), null);
                fxn.addArg(1, "pkgName", $$T_Str, $$UNDEF);
                fxn.addArg(2, "lang", $$T_Str, $$UNDEF);
                fxn.addArg(3, "__params", (Proto)om.findStrict("xdc.tools.ResourceBundle.Params", "xdc.tools"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$ResourceBundle$$construct = function( __obj, pkgName, lang, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.ResourceBundle'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {pkgName:pkgName, lang:lang});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ICmd$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IProductView$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IRtscProductTemplate$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Cmdr$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Cmdr.error
        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$error", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), null, 0, -1, false));
        // fxn Cmdr.getopts
        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$getopts", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), null, 0, -1, false));
        // fxn Cmdr.info
        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$info", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), null, 0, -1, false));
        // fxn Cmdr.read
        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$read", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), null, 0, -1, false));
        // fxn Cmdr.time
        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$time", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), null, 0, -1, false));
        // fxn Cmdr.usage
        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$usage", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), null, 0, -1, false));
        // fxn Cmdr.verbose
        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$verbose", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), null, 0, -1, false));
        // fxn Cmdr.warning
        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$warning", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), null, 0, -1, false));
        // fxn Cmdr.write
        fxn = (Proto.Fxn)om.bind("xdc.tools.Cmdr$$write", new Proto.Fxn(om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), null, 0, -1, false));
    }

    void ResourceBundle$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ResourceBundle.getResourceBundle
        fxn = (Proto.Fxn)om.bind("xdc.tools.ResourceBundle$$getResourceBundle", new Proto.Fxn(om.findStrict("xdc.tools.ResourceBundle.Module", "xdc.tools"), (Proto)om.findStrict("xdc.tools.ResourceBundle.Instance", "xdc.tools"), 2, 2, false));
                fxn.addArg(0, "pkgName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "lang", $$T_Str, $$UNDEF);
        // fxn ResourceBundle.getString
        fxn = (Proto.Fxn)om.bind("xdc.tools.ResourceBundle$$getString", new Proto.Fxn(om.findStrict("xdc.tools.ResourceBundle.Instance", "xdc.tools"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "key", $$T_Str, $$UNDEF);
        // fxn ResourceBundle.formatMessage
        fxn = (Proto.Fxn)om.bind("xdc.tools.ResourceBundle$$formatMessage", new Proto.Fxn(om.findStrict("xdc.tools.ResourceBundle.Instance", "xdc.tools"), $$T_Str, 2, 2, false));
                fxn.addArg(0, "key", $$T_Str, $$UNDEF);
                fxn.addArg(1, "args", $$T_Obj, $$UNDEF);
    }

    void ICmd$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ICmd.main
        fxn = (Proto.Fxn)om.bind("xdc.tools.ICmd$$main", new Proto.Fxn(om.findStrict("xdc.tools.ICmd.Module", "xdc.tools"), null, 0, -1, false));
        // fxn ICmd.exec
        fxn = (Proto.Fxn)om.bind("xdc.tools.ICmd$$exec", new Proto.Fxn(om.findStrict("xdc.tools.ICmd.Module", "xdc.tools"), null, 0, -1, false));
        // fxn ICmd.run
        fxn = (Proto.Fxn)om.bind("xdc.tools.ICmd$$run", new Proto.Fxn(om.findStrict("xdc.tools.ICmd.Instance", "xdc.tools"), $$T_Obj, 2, 2, false));
                fxn.addArg(0, "cmdr", (Proto)om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"), $$UNDEF);
                fxn.addArg(1, "args", new Proto.Arr($$T_Str, false), $$DEFAULT);
    }

    void IProductView$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn IProductView.getProductDescriptor
        fxn = (Proto.Fxn)om.bind("xdc.tools.IProductView$$getProductDescriptor", new Proto.Fxn(om.findStrict("xdc.tools.IProductView.Module", "xdc.tools"), (Proto)om.findStrict("xdc.tools.IProductView.ProductElemDesc", "xdc.tools"), 0, 0, false));
    }

    void IRtscProductTemplate$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cmdr$$SIZES()
    {
    }

    void ResourceBundle$$SIZES()
    {
    }

    void ICmd$$SIZES()
    {
    }

    void IProductView$$SIZES()
    {
    }

    void IRtscProductTemplate$$SIZES()
    {
    }

    void Cmdr$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/Cmdr.xs");
        om.bind("xdc.tools.Cmdr$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.Cmdr.Module", "xdc.tools");
        po.init("xdc.tools.Cmdr.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$create", "xdc.tools"), Global.get("xdc$tools$Cmdr$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$construct", "xdc.tools"), Global.get("xdc$tools$Cmdr$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.Cmdr$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.Cmdr$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.Cmdr$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.Cmdr$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools");
        po.init("xdc.tools.Cmdr.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("context", (Proto)om.findStrict("xdc.tools.Cmdr.Context", "xdc.tools"), om.find("xdc.tools.Cmdr.SHELL"), "wh");
        po.addFld("tid", Proto.Elm.newCNum("(xdc_Int)"), 0L, "wh");
        po.addFld("socket", $$T_Obj, null, "wh");
                po.addFxn("error", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$error", "xdc.tools"), Global.get(cap, "error"));
                po.addFxn("getopts", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$getopts", "xdc.tools"), Global.get(cap, "getopts"));
                po.addFxn("info", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$info", "xdc.tools"), Global.get(cap, "info"));
                po.addFxn("read", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$read", "xdc.tools"), Global.get(cap, "read"));
                po.addFxn("time", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$time", "xdc.tools"), Global.get(cap, "time"));
                po.addFxn("usage", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$usage", "xdc.tools"), Global.get(cap, "usage"));
                po.addFxn("verbose", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$verbose", "xdc.tools"), Global.get(cap, "verbose"));
                po.addFxn("warning", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$warning", "xdc.tools"), Global.get(cap, "warning"));
                po.addFxn("write", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$write", "xdc.tools"), Global.get(cap, "write"));
        po = (Proto.Obj)om.findStrict("xdc.tools.Cmdr$$Params", "xdc.tools");
        po.init("xdc.tools.Cmdr.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("context", (Proto)om.findStrict("xdc.tools.Cmdr.Context", "xdc.tools"), om.find("xdc.tools.Cmdr.SHELL"), "wh");
        po.addFld("tid", Proto.Elm.newCNum("(xdc_Int)"), 0L, "wh");
        po.addFld("socket", $$T_Obj, null, "wh");
        po = (Proto.Obj)om.findStrict("xdc.tools.Cmdr$$Object", "xdc.tools");
        po.init("xdc.tools.Cmdr.Object", om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"));
                po.addFxn("error", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$error", "xdc.tools"), Global.get(cap, "error"));
                po.addFxn("getopts", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$getopts", "xdc.tools"), Global.get(cap, "getopts"));
                po.addFxn("info", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$info", "xdc.tools"), Global.get(cap, "info"));
                po.addFxn("read", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$read", "xdc.tools"), Global.get(cap, "read"));
                po.addFxn("time", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$time", "xdc.tools"), Global.get(cap, "time"));
                po.addFxn("usage", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$usage", "xdc.tools"), Global.get(cap, "usage"));
                po.addFxn("verbose", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$verbose", "xdc.tools"), Global.get(cap, "verbose"));
                po.addFxn("warning", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$warning", "xdc.tools"), Global.get(cap, "warning"));
                po.addFxn("write", (Proto.Fxn)om.findStrict("xdc.tools.Cmdr$$write", "xdc.tools"), Global.get(cap, "write"));
    }

    void ResourceBundle$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/ResourceBundle.xs");
        om.bind("xdc.tools.ResourceBundle$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.ResourceBundle.Module", "xdc.tools");
        po.init("xdc.tools.ResourceBundle.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.ResourceBundle$$create", "xdc.tools"), Global.get("xdc$tools$ResourceBundle$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.ResourceBundle$$construct", "xdc.tools"), Global.get("xdc$tools$ResourceBundle$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.ResourceBundle$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.ResourceBundle$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.ResourceBundle$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.ResourceBundle$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("getResourceBundle", (Proto.Fxn)om.findStrict("xdc.tools.ResourceBundle$$getResourceBundle", "xdc.tools"), Global.get(cap, "getResourceBundle"));
        po = (Proto.Obj)om.findStrict("xdc.tools.ResourceBundle.Instance", "xdc.tools");
        po.init("xdc.tools.ResourceBundle.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getString", (Proto.Fxn)om.findStrict("xdc.tools.ResourceBundle$$getString", "xdc.tools"), Global.get(cap, "getString"));
                po.addFxn("formatMessage", (Proto.Fxn)om.findStrict("xdc.tools.ResourceBundle$$formatMessage", "xdc.tools"), Global.get(cap, "formatMessage"));
        po = (Proto.Obj)om.findStrict("xdc.tools.ResourceBundle$$Params", "xdc.tools");
        po.init("xdc.tools.ResourceBundle.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.tools.ResourceBundle$$Object", "xdc.tools");
        po.init("xdc.tools.ResourceBundle.Object", om.findStrict("xdc.tools.ResourceBundle.Instance", "xdc.tools"));
                po.addFxn("getString", (Proto.Fxn)om.findStrict("xdc.tools.ResourceBundle$$getString", "xdc.tools"), Global.get(cap, "getString"));
                po.addFxn("formatMessage", (Proto.Fxn)om.findStrict("xdc.tools.ResourceBundle$$formatMessage", "xdc.tools"), Global.get(cap, "formatMessage"));
    }

    void ICmd$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/ICmd.xs");
        om.bind("xdc.tools.ICmd$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.ICmd.Module", "xdc.tools");
        po.init("xdc.tools.ICmd.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("usage", new Proto.Arr($$T_Str, false), Global.newArray(new Object[]{}), "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.ICmd$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.ICmd$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.ICmd$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.ICmd$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "main");
                if (fxn != null) po.addFxn("main", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$main", "xdc.tools"), fxn);
                fxn = Global.get(cap, "exec");
                if (fxn != null) po.addFxn("exec", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$exec", "xdc.tools"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.ICmd.Instance", "xdc.tools");
        po.init("xdc.tools.ICmd.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                fxn = Global.get(cap, "run");
                if (fxn != null) po.addFxn("run", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$run", "xdc.tools"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.ICmd$$Params", "xdc.tools");
        po.init("xdc.tools.ICmd.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
    }

    void IProductView$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.tools.IProductView.Module", "xdc.tools");
        po.init("xdc.tools.IProductView.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        // struct IProductView.ProductElemDesc
        po = (Proto.Obj)om.findStrict("xdc.tools.IProductView$$ProductElemDesc", "xdc.tools");
        po.init("xdc.tools.IProductView.ProductElemDesc", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("elemName", $$T_Str, $$UNDEF, "w");
                po.addFld("moduleName", $$T_Str, $$UNDEF, "w");
                po.addFld("iconFileName", $$T_Str, $$UNDEF, "w");
                po.addFld("elemArray", new Proto.Arr((Proto)om.findStrict("xdc.tools.IProductView.ProductElemDesc", "xdc.tools"), false), $$DEFAULT, "w");
    }

    void IRtscProductTemplate$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.tools.IRtscProductTemplate.Module", "xdc.tools");
        po.init("xdc.tools.IRtscProductTemplate.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("appTemplates", new Proto.Arr((Proto)om.findStrict("xdc.tools.IRtscProductTemplate.TemplateInfo", "xdc.tools"), false), $$DEFAULT, "wh");
        po.addFld("configTemplates", new Proto.Arr((Proto)om.findStrict("xdc.tools.IRtscProductTemplate.TemplateInfo", "xdc.tools"), false), $$DEFAULT, "wh");
        // struct IRtscProductTemplate.TemplateInfo
        po = (Proto.Obj)om.findStrict("xdc.tools.IRtscProductTemplate$$TemplateInfo", "xdc.tools");
        po.init("xdc.tools.IRtscProductTemplate.TemplateInfo", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("title", $$T_Str, $$UNDEF, "w");
                po.addFld("fileList", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("description", $$T_Str, $$UNDEF, "w");
                po.addFld("template", new Proto.Arr((Proto)om.findStrict("xdc.tools.IRtscProductTemplate.TemplateInfo", "xdc.tools"), false), $$DEFAULT, "w");
    }

    void Cmdr$$ROV()
    {
    }

    void ResourceBundle$$ROV()
    {
    }

    void ICmd$$ROV()
    {
    }

    void IProductView$$ROV()
    {
    }

    void IRtscProductTemplate$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.tools.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.tools"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.tools", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.tools");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.tools.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.tools'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.tools$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.tools$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.tools$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Cmdr$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.Cmdr", "xdc.tools");
        po = (Proto.Obj)om.findStrict("xdc.tools.Cmdr.Module", "xdc.tools");
        vo.init2(po, "xdc.tools.Cmdr", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.Cmdr$$capsule", "xdc.tools"));
        vo.bind("Instance", om.findStrict("xdc.tools.Cmdr.Instance", "xdc.tools"));
        vo.bind("Params", om.findStrict("xdc.tools.Cmdr.Params", "xdc.tools"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.Cmdr.Params", "xdc.tools")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools", "xdc.tools"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Context", om.findStrict("xdc.tools.Cmdr.Context", "xdc.tools"));
        vo.bind("SHELL", om.findStrict("xdc.tools.Cmdr.SHELL", "xdc.tools"));
        vo.bind("SCRIPT", om.findStrict("xdc.tools.Cmdr.SCRIPT", "xdc.tools"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.tools")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.Cmdr$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.Cmdr.Object", "xdc.tools"));
        pkgV.bind("Cmdr", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Cmdr");
    }

    void ResourceBundle$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.ResourceBundle", "xdc.tools");
        po = (Proto.Obj)om.findStrict("xdc.tools.ResourceBundle.Module", "xdc.tools");
        vo.init2(po, "xdc.tools.ResourceBundle", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.ResourceBundle$$capsule", "xdc.tools"));
        vo.bind("Instance", om.findStrict("xdc.tools.ResourceBundle.Instance", "xdc.tools"));
        vo.bind("Params", om.findStrict("xdc.tools.ResourceBundle.Params", "xdc.tools"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.ResourceBundle.Params", "xdc.tools")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools", "xdc.tools"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.tools")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.ResourceBundle$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.ResourceBundle.Object", "xdc.tools"));
        pkgV.bind("ResourceBundle", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ResourceBundle");
    }

    void ICmd$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.ICmd", "xdc.tools");
        po = (Proto.Obj)om.findStrict("xdc.tools.ICmd.Module", "xdc.tools");
        vo.init2(po, "xdc.tools.ICmd", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.tools.ICmd$$capsule", "xdc.tools"));
        vo.bind("Instance", om.findStrict("xdc.tools.ICmd.Instance", "xdc.tools"));
        vo.bind("Params", om.findStrict("xdc.tools.ICmd.Params", "xdc.tools"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.ICmd.Params", "xdc.tools")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools", "xdc.tools"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ICmd", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ICmd");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void IProductView$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.IProductView", "xdc.tools");
        po = (Proto.Obj)om.findStrict("xdc.tools.IProductView.Module", "xdc.tools");
        vo.init2(po, "xdc.tools.IProductView", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("xdc.tools", "xdc.tools"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("ProductElemDesc", om.findStrict("xdc.tools.IProductView.ProductElemDesc", "xdc.tools"));
        tdefs.add(om.findStrict("xdc.tools.IProductView.ProductElemDesc", "xdc.tools"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IProductView", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IProductView");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void IRtscProductTemplate$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.IRtscProductTemplate", "xdc.tools");
        po = (Proto.Obj)om.findStrict("xdc.tools.IRtscProductTemplate.Module", "xdc.tools");
        vo.init2(po, "xdc.tools.IRtscProductTemplate", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("xdc.tools", "xdc.tools"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("TemplateInfo", om.findStrict("xdc.tools.IRtscProductTemplate.TemplateInfo", "xdc.tools"));
        tdefs.add(om.findStrict("xdc.tools.IRtscProductTemplate.TemplateInfo", "xdc.tools"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IRtscProductTemplate", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IRtscProductTemplate");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.Cmdr", "xdc.tools"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.ResourceBundle", "xdc.tools"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.tools.Cmdr")).bless();
        ((Value.Obj)om.getv("xdc.tools.ResourceBundle")).bless();
        ((Value.Obj)om.getv("xdc.tools.ICmd")).bless();
        ((Value.Obj)om.getv("xdc.tools.IProductView")).bless();
        ((Value.Obj)om.getv("xdc.tools.IRtscProductTemplate")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.tools")).add(pkgV);
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
        Cmdr$$OBJECTS();
        ResourceBundle$$OBJECTS();
        ICmd$$OBJECTS();
        IProductView$$OBJECTS();
        IRtscProductTemplate$$OBJECTS();
        Cmdr$$CONSTS();
        ResourceBundle$$CONSTS();
        ICmd$$CONSTS();
        IProductView$$CONSTS();
        IRtscProductTemplate$$CONSTS();
        Cmdr$$CREATES();
        ResourceBundle$$CREATES();
        ICmd$$CREATES();
        IProductView$$CREATES();
        IRtscProductTemplate$$CREATES();
        Cmdr$$FUNCTIONS();
        ResourceBundle$$FUNCTIONS();
        ICmd$$FUNCTIONS();
        IProductView$$FUNCTIONS();
        IRtscProductTemplate$$FUNCTIONS();
        Cmdr$$SIZES();
        ResourceBundle$$SIZES();
        ICmd$$SIZES();
        IProductView$$SIZES();
        IRtscProductTemplate$$SIZES();
        Cmdr$$TYPES();
        ResourceBundle$$TYPES();
        ICmd$$TYPES();
        IProductView$$TYPES();
        IRtscProductTemplate$$TYPES();
        if (isROV) {
            Cmdr$$ROV();
            ResourceBundle$$ROV();
            ICmd$$ROV();
            IProductView$$ROV();
            IRtscProductTemplate$$ROV();
        }//isROV
        $$SINGLETONS();
        Cmdr$$SINGLETONS();
        ResourceBundle$$SINGLETONS();
        ICmd$$SINGLETONS();
        IProductView$$SINGLETONS();
        IRtscProductTemplate$$SINGLETONS();
        $$INITIALIZATION();
    }
}
