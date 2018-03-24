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

public class xdc_tools_cdoc
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
        Global.callFxn("loadPackage", xdcO, "xdc.tools");
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.tools.cdoc.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.tools.cdoc", new Value.Obj("xdc.tools.cdoc", pkgP));
    }

    void Main$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.cdoc.Main.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.cdoc.Main", new Value.Obj("xdc.tools.cdoc.Main", po));
        pkgV.bind("Main", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.cdoc.Main.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.cdoc.Main$$Object", new Proto.Obj());
        om.bind("xdc.tools.cdoc.Main.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.cdoc.Main$$Params", new Proto.Obj());
        om.bind("xdc.tools.cdoc.Main.Params", new Proto.Str(po, true));
    }

    void Markup$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.cdoc.Markup.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.cdoc.Markup", new Value.Obj("xdc.tools.cdoc.Markup", po));
        pkgV.bind("Markup", vo);
        // decls 
    }

    void Example$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.cdoc.Example.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.cdoc.Example", new Value.Obj("xdc.tools.cdoc.Example", po));
        pkgV.bind("Example", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.tools.cdoc.Example$$AStruct", new Proto.Obj());
        om.bind("xdc.tools.cdoc.Example.AStruct", new Proto.Str(spo, false));
        om.bind("xdc.tools.cdoc.Example.AnEnum", new Proto.Enm("xdc.tools.cdoc.Example.AnEnum"));
        spo = (Proto.Obj)om.bind("xdc.tools.cdoc.Example$$AUnion", new Proto.Obj());
        om.bind("xdc.tools.cdoc.Example.AUnion", new Proto.Str(spo, false));
        om.bind("xdc.tools.cdoc.Example.ATypedEnum", new Proto.Enm("xdc.tools.cdoc.Example.ATypedEnum"));
        spo = (Proto.Obj)om.bind("xdc.tools.cdoc.Example$$__struct__1", new Proto.Obj());
        om.bind("xdc.tools.cdoc.Example.__struct__1", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.tools.cdoc.Example$$__struct__2", new Proto.Obj());
        om.bind("xdc.tools.cdoc.Example.__struct__2", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.tools.cdoc.Example$$__struct__3", new Proto.Obj());
        om.bind("xdc.tools.cdoc.Example.__struct__3", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.tools.cdoc.Example$$ACmd", new Proto.Obj());
        om.bind("xdc.tools.cdoc.Example.ACmd", new Proto.Str(spo, false));
    }

    void Main$$CONSTS()
    {
        // module Main
    }

    void Markup$$CONSTS()
    {
        // module Markup
    }

    void Example$$CONSTS()
    {
        // module Example
        om.bind("xdc.tools.cdoc.Example.AVALUE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.tools.cdoc.Example.AnEnum", "xdc.tools.cdoc"), "xdc.tools.cdoc.Example.AVALUE", 0));
        om.bind("xdc.tools.cdoc.Example.LOOP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.tools.cdoc.Example.ATypedEnum", "xdc.tools.cdoc"), "xdc.tools.cdoc.Example.LOOP", xdc.services.intern.xsr.Enum.intValue(6L)+0));
        om.bind("xdc.tools.cdoc.Example.PRINT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.tools.cdoc.Example.ATypedEnum", "xdc.tools.cdoc"), "xdc.tools.cdoc.Example.PRINT", xdc.services.intern.xsr.Enum.intValue(28L)+0));
        om.bind("xdc.tools.cdoc.Example.aFunction", new Extern("xdc_tools_cdoc_Example_aFunction__E", "xdc_Void(*)(xdc_Int)", true, false));
    }

    void Main$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.cdoc.Main$$create", new Proto.Fxn(om.findStrict("xdc.tools.cdoc.Main.Module", "xdc.tools.cdoc"), om.findStrict("xdc.tools.cdoc.Main.Instance", "xdc.tools.cdoc"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.tools.cdoc.Main.Params", "xdc.tools.cdoc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$cdoc$Main$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.cdoc.Main'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.cdoc.Main.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools.cdoc']);\n");
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
        fxn = (Proto.Fxn)om.bind("xdc.tools.cdoc.Main$$construct", new Proto.Fxn(om.findStrict("xdc.tools.cdoc.Main.Module", "xdc.tools.cdoc"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.cdoc.Main$$Object", "xdc.tools.cdoc"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.tools.cdoc.Main.Params", "xdc.tools.cdoc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$cdoc$Main$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.cdoc.Main'];\n");
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

    void Markup$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Example$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Main$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Markup$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Example$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Main$$SIZES()
    {
    }

    void Markup$$SIZES()
    {
    }

    void Example$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.tools.cdoc.Example.AStruct", "xdc.tools.cdoc");
        sizes.clear();
        sizes.add(Global.newArray("aField", "TInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.tools.cdoc.Example.AStruct']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.tools.cdoc.Example.AStruct']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.tools.cdoc.Example.AStruct'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.tools.cdoc.Example.AUnion", "xdc.tools.cdoc");
        sizes.clear();
        sizes.add(Global.newArray("aString", "UPtr"));
        sizes.add(Global.newArray("anInt", "TInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.tools.cdoc.Example.AUnion']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.tools.cdoc.Example.AUnion']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.tools.cdoc.Example.AUnion'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.tools.cdoc.Example.__struct__1", "xdc.tools.cdoc");
        sizes.clear();
        sizes.add(Global.newArray("count", "TInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.tools.cdoc.Example.__struct__1']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.tools.cdoc.Example.__struct__1']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.tools.cdoc.Example.__struct__1'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.tools.cdoc.Example.__struct__2", "xdc.tools.cdoc");
        sizes.clear();
        sizes.add(Global.newArray("msg", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.tools.cdoc.Example.__struct__2']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.tools.cdoc.Example.__struct__2']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.tools.cdoc.Example.__struct__2'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.tools.cdoc.Example.__struct__3", "xdc.tools.cdoc");
        sizes.clear();
        sizes.add(Global.newArray("loop", "Sxdc.tools.cdoc.Example;__struct__1"));
        sizes.add(Global.newArray("print", "Sxdc.tools.cdoc.Example;__struct__2"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.tools.cdoc.Example.__struct__3']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.tools.cdoc.Example.__struct__3']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.tools.cdoc.Example.__struct__3'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.tools.cdoc.Example.ACmd", "xdc.tools.cdoc");
        sizes.clear();
        sizes.add(Global.newArray("cmdId", "Nxdc.tools.cdoc.Example.ATypedEnum;TInt;6;28"));
        sizes.add(Global.newArray("args", "Sxdc.tools.cdoc.Example;__struct__3"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.tools.cdoc.Example.ACmd']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.tools.cdoc.Example.ACmd']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.tools.cdoc.Example.ACmd'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Main$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/cdoc/Main.xs");
        om.bind("xdc.tools.cdoc.Main$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Main.Module", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Main.Module", om.findStrict("xdc.tools.ICmd.Module", "xdc.tools.cdoc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("usage", new Proto.Arr($$T_Str, false), Global.newArray(new Object[]{"[-od:dir] [-title text] [--start package] [--indexonly] [--doxytags file] [--doxybase dir] [-h] [-n] [-b] [-s] [-P pkg-dir...|-Pr repo-dir...|-A]"}), "wh");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.cdoc.Main$$create", "xdc.tools.cdoc"), Global.get("xdc$tools$cdoc$Main$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.cdoc.Main$$construct", "xdc.tools.cdoc"), Global.get("xdc$tools$cdoc$Main$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.cdoc.Main$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.cdoc.Main$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.cdoc.Main$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.cdoc.Main$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "main");
                if (fxn != null) po.addFxn("main", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$main", "xdc.tools.cdoc"), fxn);
                fxn = Global.get(cap, "exec");
                if (fxn != null) po.addFxn("exec", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$exec", "xdc.tools.cdoc"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Main.Instance", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Main.Instance", om.findStrict("xdc.tools.ICmd.Instance", "xdc.tools.cdoc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("outdir", $$T_Str, null, "wh");
        po.addFld("title", $$T_Str, null, "wh");
        po.addFld("start", $$T_Str, null, "wh");
        po.addFld("sopt", $$T_Bool, false, "wh");
        po.addFld("popt", $$T_Bool, false, "wh");
        po.addFld("ropt", $$T_Bool, false, "wh");
        po.addFld("aopt", $$T_Bool, false, "wh");
        po.addFld("bopt", $$T_Bool, false, "wh");
        po.addFld("hopt", $$T_Bool, false, "wh");
        po.addFld("nopt", $$T_Bool, false, "wh");
        po.addFld("qopt", $$T_Bool, false, "wh");
        po.addFld("iopt", $$T_Bool, false, "wh");
        po.addFld("doxytags", $$T_Str, null, "wh");
        po.addFld("doxybase", $$T_Str, null, "wh");
        po.addFld("style", $$T_Str, null, "wh");
                fxn = Global.get(cap, "run");
                if (fxn != null) po.addFxn("run", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$run", "xdc.tools.cdoc"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Main$$Params", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Main.Params", om.findStrict("xdc.tools.ICmd$$Params", "xdc.tools.cdoc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("outdir", $$T_Str, null, "wh");
        po.addFld("title", $$T_Str, null, "wh");
        po.addFld("start", $$T_Str, null, "wh");
        po.addFld("sopt", $$T_Bool, false, "wh");
        po.addFld("popt", $$T_Bool, false, "wh");
        po.addFld("ropt", $$T_Bool, false, "wh");
        po.addFld("aopt", $$T_Bool, false, "wh");
        po.addFld("bopt", $$T_Bool, false, "wh");
        po.addFld("hopt", $$T_Bool, false, "wh");
        po.addFld("nopt", $$T_Bool, false, "wh");
        po.addFld("qopt", $$T_Bool, false, "wh");
        po.addFld("iopt", $$T_Bool, false, "wh");
        po.addFld("doxytags", $$T_Str, null, "wh");
        po.addFld("doxybase", $$T_Str, null, "wh");
        po.addFld("style", $$T_Str, null, "wh");
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Main$$Object", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Main.Object", om.findStrict("xdc.tools.cdoc.Main.Instance", "xdc.tools.cdoc"));
                fxn = Global.get(cap, "run");
                if (fxn != null) po.addFxn("run", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$run", "xdc.tools.cdoc"), fxn);
    }

    void Markup$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Markup.Module", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Markup.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
    }

    void Example$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example.Module", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Example.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.tools.cdoc"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("u", (Proto)om.findStrict("xdc.tools.cdoc.Example.AUnion", "xdc.tools.cdoc"), Global.newObject("aString", "hello", "anInt", 1234L), "w");
        }//isCFG
        // struct Example.AStruct
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$AStruct", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Example.AStruct", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("aField", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // union Example.AUnion
        ps = (Proto.Str)om.findStrict("xdc.tools.cdoc.Example.AUnion", "xdc.tools.cdoc");        ps.bind("$$union", 1);
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$AUnion", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Example.AUnion", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("aString", $$T_Str, $$UNDEF, "w");
                po.addFld("anInt", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "wh");
        // struct Example.__struct__1
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$__struct__1", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Example.__struct__1", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("count", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // struct Example.__struct__2
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$__struct__2", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Example.__struct__2", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("msg", $$T_Str, $$UNDEF, "w");
        // union Example.__struct__3
        ps = (Proto.Str)om.findStrict("xdc.tools.cdoc.Example.__struct__3", "xdc.tools.cdoc");        ps.bind("$$union", 1);
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$__struct__3", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Example.__struct__3", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("loop", (Proto)om.findStrict("xdc.tools.cdoc.Example.__struct__1", "xdc.tools.cdoc"), $$DEFAULT, "w");
                po.addFld("print", (Proto)om.findStrict("xdc.tools.cdoc.Example.__struct__2", "xdc.tools.cdoc"), $$DEFAULT, "wh");
        // struct Example.ACmd
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$ACmd", "xdc.tools.cdoc");
        po.init("xdc.tools.cdoc.Example.ACmd", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("cmdId", (Proto)om.findStrict("xdc.tools.cdoc.Example.ATypedEnum", "xdc.tools.cdoc"), $$UNDEF, "w");
                po.addFld("args", (Proto)om.findStrict("xdc.tools.cdoc.Example.__struct__3", "xdc.tools.cdoc"), $$DEFAULT, "w");
    }

    void Main$$ROV()
    {
    }

    void Markup$$ROV()
    {
    }

    void Example$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.cdoc.Example", "xdc.tools.cdoc");
        vo.bind("AStruct$fetchDesc", Global.newObject("type", "xdc.tools.cdoc.Example.AStruct", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$AStruct", "xdc.tools.cdoc");
        vo.bind("AUnion$fetchDesc", Global.newObject("type", "xdc.tools.cdoc.Example.AUnion", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$AUnion", "xdc.tools.cdoc");
        vo.bind("__struct__1$fetchDesc", Global.newObject("type", "xdc.tools.cdoc.Example.__struct__1", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$__struct__1", "xdc.tools.cdoc");
        vo.bind("__struct__2$fetchDesc", Global.newObject("type", "xdc.tools.cdoc.Example.__struct__2", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$__struct__2", "xdc.tools.cdoc");
        vo.bind("__struct__3$fetchDesc", Global.newObject("type", "xdc.tools.cdoc.Example.__struct__3", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$__struct__3", "xdc.tools.cdoc");
        vo.bind("ACmd$fetchDesc", Global.newObject("type", "xdc.tools.cdoc.Example.ACmd", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example$$ACmd", "xdc.tools.cdoc");
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.tools.cdoc.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.tools.cdoc"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.tools.cdoc", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.tools.cdoc");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.tools.cdoc.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.tools.cdoc'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.tools.cdoc$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.tools.cdoc$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.tools.cdoc$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Main$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.cdoc.Main", "xdc.tools.cdoc");
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Main.Module", "xdc.tools.cdoc");
        vo.init2(po, "xdc.tools.cdoc.Main", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.cdoc.Main$$capsule", "xdc.tools.cdoc"));
        vo.bind("Instance", om.findStrict("xdc.tools.cdoc.Main.Instance", "xdc.tools.cdoc"));
        vo.bind("Params", om.findStrict("xdc.tools.cdoc.Main.Params", "xdc.tools.cdoc"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.cdoc.Main.Params", "xdc.tools.cdoc")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.cdoc", "xdc.tools.cdoc"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.cdoc")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.cdoc.Main$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.cdoc.Main.Object", "xdc.tools.cdoc"));
        pkgV.bind("Main", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Main");
    }

    void Markup$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.cdoc.Markup", "xdc.tools.cdoc");
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Markup.Module", "xdc.tools.cdoc");
        vo.init2(po, "xdc.tools.cdoc.Markup", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("xdc.tools.cdoc", "xdc.tools.cdoc"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.cdoc")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.cdoc.Markup$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Markup", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Markup");
    }

    void Example$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.cdoc.Example", "xdc.tools.cdoc");
        po = (Proto.Obj)om.findStrict("xdc.tools.cdoc.Example.Module", "xdc.tools.cdoc");
        vo.init2(po, "xdc.tools.cdoc.Example", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("xdc.tools.cdoc", "xdc.tools.cdoc"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        mcfgs.add("Module__diagsEnabled");
        icfgs.add("Module__diagsEnabled");
        mcfgs.add("Module__diagsIncluded");
        icfgs.add("Module__diagsIncluded");
        mcfgs.add("Module__diagsMask");
        icfgs.add("Module__diagsMask");
        mcfgs.add("Module__gateObj");
        icfgs.add("Module__gateObj");
        mcfgs.add("Module__gatePrms");
        icfgs.add("Module__gatePrms");
        mcfgs.add("Module__id");
        icfgs.add("Module__id");
        mcfgs.add("Module__loggerDefined");
        icfgs.add("Module__loggerDefined");
        mcfgs.add("Module__loggerObj");
        icfgs.add("Module__loggerObj");
        mcfgs.add("Module__loggerFxn0");
        icfgs.add("Module__loggerFxn0");
        mcfgs.add("Module__loggerFxn1");
        icfgs.add("Module__loggerFxn1");
        mcfgs.add("Module__loggerFxn2");
        icfgs.add("Module__loggerFxn2");
        mcfgs.add("Module__loggerFxn4");
        icfgs.add("Module__loggerFxn4");
        mcfgs.add("Module__loggerFxn8");
        icfgs.add("Module__loggerFxn8");
        mcfgs.add("Object__count");
        icfgs.add("Object__count");
        mcfgs.add("Object__heap");
        icfgs.add("Object__heap");
        mcfgs.add("Object__sizeof");
        icfgs.add("Object__sizeof");
        mcfgs.add("Object__table");
        icfgs.add("Object__table");
        vo.bind("AStruct", om.findStrict("xdc.tools.cdoc.Example.AStruct", "xdc.tools.cdoc"));
        tdefs.add(om.findStrict("xdc.tools.cdoc.Example.AStruct", "xdc.tools.cdoc"));
        vo.bind("AnEnum", om.findStrict("xdc.tools.cdoc.Example.AnEnum", "xdc.tools.cdoc"));
        vo.bind("AUnion", om.findStrict("xdc.tools.cdoc.Example.AUnion", "xdc.tools.cdoc"));
        tdefs.add(om.findStrict("xdc.tools.cdoc.Example.AUnion", "xdc.tools.cdoc"));
        mcfgs.add("u");
        vo.bind("ATypedEnum", om.findStrict("xdc.tools.cdoc.Example.ATypedEnum", "xdc.tools.cdoc"));
        vo.bind("__struct__1", om.findStrict("xdc.tools.cdoc.Example.__struct__1", "xdc.tools.cdoc"));
        tdefs.add(om.findStrict("xdc.tools.cdoc.Example.__struct__1", "xdc.tools.cdoc"));
        vo.bind("__struct__2", om.findStrict("xdc.tools.cdoc.Example.__struct__2", "xdc.tools.cdoc"));
        tdefs.add(om.findStrict("xdc.tools.cdoc.Example.__struct__2", "xdc.tools.cdoc"));
        vo.bind("__struct__3", om.findStrict("xdc.tools.cdoc.Example.__struct__3", "xdc.tools.cdoc"));
        tdefs.add(om.findStrict("xdc.tools.cdoc.Example.__struct__3", "xdc.tools.cdoc"));
        vo.bind("ACmd", om.findStrict("xdc.tools.cdoc.Example.ACmd", "xdc.tools.cdoc"));
        tdefs.add(om.findStrict("xdc.tools.cdoc.Example.ACmd", "xdc.tools.cdoc"));
        vo.bind("AVALUE", om.findStrict("xdc.tools.cdoc.Example.AVALUE", "xdc.tools.cdoc"));
        vo.bind("LOOP", om.findStrict("xdc.tools.cdoc.Example.LOOP", "xdc.tools.cdoc"));
        vo.bind("PRINT", om.findStrict("xdc.tools.cdoc.Example.PRINT", "xdc.tools.cdoc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.cdoc")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("aFunction", om.findStrict("xdc.tools.cdoc.Example.aFunction", "xdc.tools.cdoc"));
        vo.bind("$$fxntab", Global.newArray("xdc_tools_cdoc_Example_Module__startupDone__E", "xdc_tools_cdoc_Example_aFunction__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        loggables.add(Global.newObject("name", "aFunction", "entry", "%d", "exit", ""));
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Example", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Example");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.cdoc.Main", "xdc.tools.cdoc"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.cdoc.Markup", "xdc.tools.cdoc"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.cdoc.Example", "xdc.tools.cdoc"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.tools.cdoc.Main")).bless();
        ((Value.Obj)om.getv("xdc.tools.cdoc.Markup")).bless();
        ((Value.Obj)om.getv("xdc.tools.cdoc.Example")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.tools.cdoc")).add(pkgV);
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
        Main$$OBJECTS();
        Markup$$OBJECTS();
        Example$$OBJECTS();
        Main$$CONSTS();
        Markup$$CONSTS();
        Example$$CONSTS();
        Main$$CREATES();
        Markup$$CREATES();
        Example$$CREATES();
        Main$$FUNCTIONS();
        Markup$$FUNCTIONS();
        Example$$FUNCTIONS();
        Main$$SIZES();
        Markup$$SIZES();
        Example$$SIZES();
        Main$$TYPES();
        Markup$$TYPES();
        Example$$TYPES();
        if (isROV) {
            Main$$ROV();
            Markup$$ROV();
            Example$$ROV();
        }//isROV
        $$SINGLETONS();
        Main$$SINGLETONS();
        Markup$$SINGLETONS();
        Example$$SINGLETONS();
        $$INITIALIZATION();
    }
}
