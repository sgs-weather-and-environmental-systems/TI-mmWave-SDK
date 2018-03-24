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

public class xdc_tools_mkpkg
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
        pkgP = (Proto.Obj)om.bind("xdc.tools.mkpkg.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.tools.mkpkg", new Value.Obj("xdc.tools.mkpkg", pkgP));
    }

    void Template$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.Template.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.mkpkg.Template", new Value.Obj("xdc.tools.mkpkg.Template", po));
        pkgV.bind("Template", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.mkpkg.Template.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.Template$$Object", new Proto.Obj());
        om.bind("xdc.tools.mkpkg.Template.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.Template$$Params", new Proto.Obj());
        om.bind("xdc.tools.mkpkg.Template.Params", new Proto.Str(po, true));
    }

    void ICmd$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.ICmd.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.mkpkg.ICmd", new Value.Obj("xdc.tools.mkpkg.ICmd", po));
        pkgV.bind("ICmd", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.mkpkg.ICmd.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.ICmd$$Object", new Proto.Obj());
        om.bind("xdc.tools.mkpkg.ICmd.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.ICmd$$Params", new Proto.Obj());
        om.bind("xdc.tools.mkpkg.ICmd.Params", new Proto.Str(po, true));
    }

    void Main$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.Main.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.mkpkg.Main", new Value.Obj("xdc.tools.mkpkg.Main", po));
        pkgV.bind("Main", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.mkpkg.Main.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.Main$$Object", new Proto.Obj());
        om.bind("xdc.tools.mkpkg.Main.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.Main$$Params", new Proto.Obj());
        om.bind("xdc.tools.mkpkg.Main.Params", new Proto.Str(po, true));
    }

    void Gen$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.Gen.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.mkpkg.Gen", new Value.Obj("xdc.tools.mkpkg.Gen", po));
        pkgV.bind("Gen", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.mkpkg.Gen.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.Gen$$Object", new Proto.Obj());
        om.bind("xdc.tools.mkpkg.Gen.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.mkpkg.Gen$$Params", new Proto.Obj());
        om.bind("xdc.tools.mkpkg.Gen.Params", new Proto.Str(po, true));
    }

    void Template$$CONSTS()
    {
        // interface Template
    }

    void ICmd$$CONSTS()
    {
        // interface ICmd
    }

    void Main$$CONSTS()
    {
        // module Main
    }

    void Gen$$CONSTS()
    {
        // module Gen
    }

    void Template$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ICmd$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Main$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.mkpkg.Main$$create", new Proto.Fxn(om.findStrict("xdc.tools.mkpkg.Main.Module", "xdc.tools.mkpkg"), om.findStrict("xdc.tools.mkpkg.Main.Instance", "xdc.tools.mkpkg"), 2, 1, false));
                fxn.addArg(0, "input", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.tools.mkpkg.Main.Params", "xdc.tools.mkpkg"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$mkpkg$Main$$create = function( input, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.mkpkg.Main'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.mkpkg.Main.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools.mkpkg']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {input:input});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.input = __mod.PARAMS.input;\n");
            sb.append("__inst.inputPath = __mod.PARAMS.inputPath;\n");
            sb.append("__inst.arguments = __mod.PARAMS.arguments;\n");
            sb.append("__inst.output = __mod.PARAMS.output;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [input]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.tools.mkpkg.Main$$construct", new Proto.Fxn(om.findStrict("xdc.tools.mkpkg.Main.Module", "xdc.tools.mkpkg"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.mkpkg.Main$$Object", "xdc.tools.mkpkg"), null);
                fxn.addArg(1, "input", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.tools.mkpkg.Main.Params", "xdc.tools.mkpkg"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$mkpkg$Main$$construct = function( __obj, input, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.mkpkg.Main'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {input:input});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.input = __mod.PARAMS.input;\n");
            sb.append("__inst.inputPath = __mod.PARAMS.inputPath;\n");
            sb.append("__inst.arguments = __mod.PARAMS.arguments;\n");
            sb.append("__inst.output = __mod.PARAMS.output;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Gen$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.mkpkg.Gen$$create", new Proto.Fxn(om.findStrict("xdc.tools.mkpkg.Gen.Module", "xdc.tools.mkpkg"), om.findStrict("xdc.tools.mkpkg.Gen.Instance", "xdc.tools.mkpkg"), 3, 2, false));
                fxn.addArg(0, "template", (Proto)om.findStrict("xdc.tools.mkpkg.Template.Instance", "xdc.tools.mkpkg"), $$UNDEF);
                fxn.addArg(1, "output", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.tools.mkpkg.Gen.Params", "xdc.tools.mkpkg"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$mkpkg$Gen$$create = function( template, output, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.mkpkg.Gen'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.mkpkg.Gen.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools.mkpkg']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {template:template, output:output});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [template, output]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.tools.mkpkg.Gen$$construct", new Proto.Fxn(om.findStrict("xdc.tools.mkpkg.Gen.Module", "xdc.tools.mkpkg"), null, 4, 2, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.mkpkg.Gen$$Object", "xdc.tools.mkpkg"), null);
                fxn.addArg(1, "template", (Proto)om.findStrict("xdc.tools.mkpkg.Template.Instance", "xdc.tools.mkpkg"), $$UNDEF);
                fxn.addArg(2, "output", $$T_Str, $$UNDEF);
                fxn.addArg(3, "__params", (Proto)om.findStrict("xdc.tools.mkpkg.Gen.Params", "xdc.tools.mkpkg"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$mkpkg$Gen$$construct = function( __obj, template, output, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.mkpkg.Gen'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {template:template, output:output});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Template$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ICmd$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ICmd.main
        fxn = (Proto.Fxn)om.bind("xdc.tools.mkpkg.ICmd$$main", new Proto.Fxn(om.findStrict("xdc.tools.mkpkg.ICmd.Module", "xdc.tools.mkpkg"), Proto.Elm.newCNum("(xdc_Int)"), 1, 1, false));
                fxn.addArg(0, "args", new Proto.Arr($$T_Str, false), $$DEFAULT);
    }

    void Main$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Main.main
        fxn = (Proto.Fxn)om.bind("xdc.tools.mkpkg.Main$$main", new Proto.Fxn(om.findStrict("xdc.tools.mkpkg.Main.Module", "xdc.tools.mkpkg"), Proto.Elm.newCNum("(xdc_Int)"), 1, 1, false));
                fxn.addArg(0, "arguments", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn Main.mkpkg
        fxn = (Proto.Fxn)om.bind("xdc.tools.mkpkg.Main$$mkpkg", new Proto.Fxn(om.findStrict("xdc.tools.mkpkg.Main.Module", "xdc.tools.mkpkg"), null, 2, 2, true));
                fxn.addArg(0, "template", $$T_Str, $$UNDEF);
                fxn.addArg(1, "output", $$T_Str, $$UNDEF);
    }

    void Gen$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Gen.gen
        fxn = (Proto.Fxn)om.bind("xdc.tools.mkpkg.Gen$$gen", new Proto.Fxn(om.findStrict("xdc.tools.mkpkg.Gen.Instance", "xdc.tools.mkpkg"), null, 0, 0, false));
    }

    void Template$$SIZES()
    {
    }

    void ICmd$$SIZES()
    {
    }

    void Main$$SIZES()
    {
    }

    void Gen$$SIZES()
    {
    }

    void Template$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/mkpkg/Template.xs");
        om.bind("xdc.tools.mkpkg.Template$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Template.Module", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Template.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Template$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Template$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Template$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Template$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Template.Instance", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Template.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("input", $$T_Str, $$UNDEF, "rh");
        po.addFld("inputPath", $$T_Str, $$UNDEF, "rh");
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Template$$Params", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Template.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("input", $$T_Str, $$UNDEF, "rh");
        po.addFld("inputPath", $$T_Str, $$UNDEF, "rh");
    }

    void ICmd$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/mkpkg/ICmd.xs");
        om.bind("xdc.tools.mkpkg.ICmd$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.ICmd.Module", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.ICmd.Module", om.findStrict("xdc.tools.mkpkg.Template.Module", "xdc.tools.mkpkg"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.mkpkg.ICmd$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.mkpkg.ICmd$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.mkpkg.ICmd$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.mkpkg.ICmd$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "main");
                if (fxn != null) po.addFxn("main", (Proto.Fxn)om.findStrict("xdc.tools.mkpkg.ICmd$$main", "xdc.tools.mkpkg"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.ICmd.Instance", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.ICmd.Instance", om.findStrict("xdc.tools.mkpkg.Template.Instance", "xdc.tools.mkpkg"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("arguments", new Proto.Arr($$T_Obj, false), $$DEFAULT, "wh");
        po.addFld("output", $$T_Str, $$UNDEF, "wh");
        po.addFld("preserveModTime", $$T_Bool, false, "wh");
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.ICmd$$Params", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.ICmd.Params", om.findStrict("xdc.tools.mkpkg.Template$$Params", "xdc.tools.mkpkg"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("arguments", new Proto.Arr($$T_Obj, false), $$DEFAULT, "wh");
        po.addFld("output", $$T_Str, $$UNDEF, "wh");
        po.addFld("preserveModTime", $$T_Bool, false, "wh");
    }

    void Main$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/mkpkg/Main.xs");
        om.bind("xdc.tools.mkpkg.Main$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Main.Module", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Main.Module", om.findStrict("xdc.tools.mkpkg.ICmd.Module", "xdc.tools.mkpkg"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("update", $$T_Bool, false, "wh");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.mkpkg.Main$$create", "xdc.tools.mkpkg"), Global.get("xdc$tools$mkpkg$Main$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.mkpkg.Main$$construct", "xdc.tools.mkpkg"), Global.get("xdc$tools$mkpkg$Main$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Main$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Main$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Main$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Main$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "main");
                if (fxn != null) po.addFxn("main", (Proto.Fxn)om.findStrict("xdc.tools.mkpkg.ICmd$$main", "xdc.tools.mkpkg"), fxn);
                po.addFxn("mkpkg", (Proto.Fxn)om.findStrict("xdc.tools.mkpkg.Main$$mkpkg", "xdc.tools.mkpkg"), Global.get(cap, "mkpkg"));
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Main.Instance", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Main.Instance", om.findStrict("xdc.tools.mkpkg.ICmd.Instance", "xdc.tools.mkpkg"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Main$$Params", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Main.Params", om.findStrict("xdc.tools.mkpkg.ICmd$$Params", "xdc.tools.mkpkg"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Main$$Object", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Main.Object", om.findStrict("xdc.tools.mkpkg.Main.Instance", "xdc.tools.mkpkg"));
    }

    void Gen$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/mkpkg/Gen.xs");
        om.bind("xdc.tools.mkpkg.Gen$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Gen.Module", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Gen.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.mkpkg.Gen$$create", "xdc.tools.mkpkg"), Global.get("xdc$tools$mkpkg$Gen$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.mkpkg.Gen$$construct", "xdc.tools.mkpkg"), Global.get("xdc$tools$mkpkg$Gen$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Gen$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Gen$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Gen$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.mkpkg.Gen$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Gen.Instance", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Gen.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("preserveModTime", $$T_Bool, false, "wh");
                po.addFxn("gen", (Proto.Fxn)om.findStrict("xdc.tools.mkpkg.Gen$$gen", "xdc.tools.mkpkg"), Global.get(cap, "gen"));
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Gen$$Params", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Gen.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("preserveModTime", $$T_Bool, false, "wh");
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Gen$$Object", "xdc.tools.mkpkg");
        po.init("xdc.tools.mkpkg.Gen.Object", om.findStrict("xdc.tools.mkpkg.Gen.Instance", "xdc.tools.mkpkg"));
                po.addFxn("gen", (Proto.Fxn)om.findStrict("xdc.tools.mkpkg.Gen$$gen", "xdc.tools.mkpkg"), Global.get(cap, "gen"));
    }

    void Template$$ROV()
    {
    }

    void ICmd$$ROV()
    {
    }

    void Main$$ROV()
    {
    }

    void Gen$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.tools.mkpkg.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.tools.mkpkg"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.tools.mkpkg", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.tools.mkpkg");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.tools.mkpkg.");
        pkgV.bind("$vers", Global.newArray(1, 0, 1));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.tools.mkpkg'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.tools.mkpkg$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.tools.mkpkg$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.tools.mkpkg$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Template$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.mkpkg.Template", "xdc.tools.mkpkg");
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Template.Module", "xdc.tools.mkpkg");
        vo.init2(po, "xdc.tools.mkpkg.Template", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.tools.mkpkg.Template$$capsule", "xdc.tools.mkpkg"));
        vo.bind("Instance", om.findStrict("xdc.tools.mkpkg.Template.Instance", "xdc.tools.mkpkg"));
        vo.bind("Params", om.findStrict("xdc.tools.mkpkg.Template.Params", "xdc.tools.mkpkg"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.mkpkg.Template.Params", "xdc.tools.mkpkg")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.mkpkg", "xdc.tools.mkpkg"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("Template", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Template");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ICmd$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.mkpkg.ICmd", "xdc.tools.mkpkg");
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.ICmd.Module", "xdc.tools.mkpkg");
        vo.init2(po, "xdc.tools.mkpkg.ICmd", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.tools.mkpkg.ICmd$$capsule", "xdc.tools.mkpkg"));
        vo.bind("Instance", om.findStrict("xdc.tools.mkpkg.ICmd.Instance", "xdc.tools.mkpkg"));
        vo.bind("Params", om.findStrict("xdc.tools.mkpkg.ICmd.Params", "xdc.tools.mkpkg"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.mkpkg.ICmd.Params", "xdc.tools.mkpkg")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.mkpkg", "xdc.tools.mkpkg"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.tools.mkpkg");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ICmd", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ICmd");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void Main$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.mkpkg.Main", "xdc.tools.mkpkg");
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Main.Module", "xdc.tools.mkpkg");
        vo.init2(po, "xdc.tools.mkpkg.Main", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.mkpkg.Main$$capsule", "xdc.tools.mkpkg"));
        vo.bind("Instance", om.findStrict("xdc.tools.mkpkg.Main.Instance", "xdc.tools.mkpkg"));
        vo.bind("Params", om.findStrict("xdc.tools.mkpkg.Main.Params", "xdc.tools.mkpkg"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.mkpkg.Main.Params", "xdc.tools.mkpkg")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.mkpkg", "xdc.tools.mkpkg"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.tools.mkpkg");
        inherits.add("xdc.tools.mkpkg");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.mkpkg")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.mkpkg.Main$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.mkpkg.Main.Object", "xdc.tools.mkpkg"));
        pkgV.bind("Main", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Main");
    }

    void Gen$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.mkpkg.Gen", "xdc.tools.mkpkg");
        po = (Proto.Obj)om.findStrict("xdc.tools.mkpkg.Gen.Module", "xdc.tools.mkpkg");
        vo.init2(po, "xdc.tools.mkpkg.Gen", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.mkpkg.Gen$$capsule", "xdc.tools.mkpkg"));
        vo.bind("Instance", om.findStrict("xdc.tools.mkpkg.Gen.Instance", "xdc.tools.mkpkg"));
        vo.bind("Params", om.findStrict("xdc.tools.mkpkg.Gen.Params", "xdc.tools.mkpkg"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.mkpkg.Gen.Params", "xdc.tools.mkpkg")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.mkpkg", "xdc.tools.mkpkg"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.mkpkg")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.mkpkg.Gen$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.mkpkg.Gen.Object", "xdc.tools.mkpkg"));
        pkgV.bind("Gen", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Gen");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.mkpkg.Main", "xdc.tools.mkpkg"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.mkpkg.Gen", "xdc.tools.mkpkg"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.tools.mkpkg.Template")).bless();
        ((Value.Obj)om.getv("xdc.tools.mkpkg.ICmd")).bless();
        ((Value.Obj)om.getv("xdc.tools.mkpkg.Main")).bless();
        ((Value.Obj)om.getv("xdc.tools.mkpkg.Gen")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.tools.mkpkg")).add(pkgV);
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
        Template$$OBJECTS();
        ICmd$$OBJECTS();
        Main$$OBJECTS();
        Gen$$OBJECTS();
        Template$$CONSTS();
        ICmd$$CONSTS();
        Main$$CONSTS();
        Gen$$CONSTS();
        Template$$CREATES();
        ICmd$$CREATES();
        Main$$CREATES();
        Gen$$CREATES();
        Template$$FUNCTIONS();
        ICmd$$FUNCTIONS();
        Main$$FUNCTIONS();
        Gen$$FUNCTIONS();
        Template$$SIZES();
        ICmd$$SIZES();
        Main$$SIZES();
        Gen$$SIZES();
        Template$$TYPES();
        ICmd$$TYPES();
        Main$$TYPES();
        Gen$$TYPES();
        if (isROV) {
            Template$$ROV();
            ICmd$$ROV();
            Main$$ROV();
            Gen$$ROV();
        }//isROV
        $$SINGLETONS();
        Template$$SINGLETONS();
        ICmd$$SINGLETONS();
        Main$$SINGLETONS();
        Gen$$SINGLETONS();
        $$INITIALIZATION();
    }
}
