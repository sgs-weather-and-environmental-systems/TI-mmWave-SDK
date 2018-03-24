/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D17
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class xdc_rov_monserver
{
    static final String VERS = "@(#) xdc-D17\n";

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
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
        Global.callFxn("loadPackage", xdcO, "xdc.rta");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.tools");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.rov.monserver.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.rov.monserver", new Value.Obj("xdc.rov.monserver", pkgP));
    }

    void Main$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.monserver.Main.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.monserver.Main", new Value.Obj("xdc.rov.monserver.Main", po));
        pkgV.bind("Main", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.rov.monserver.Main.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.monserver.Main$$Object", new Proto.Obj());
        om.bind("xdc.rov.monserver.Main.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.monserver.Main$$Params", new Proto.Obj());
        om.bind("xdc.rov.monserver.Main.Params", new Proto.Str(po, true));
    }

    void CallStack$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.monserver.CallStack.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.monserver.CallStack", new Value.Obj("xdc.rov.monserver.CallStack", po));
        pkgV.bind("CallStack", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.rov.monserver.CallStack.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.monserver.CallStack$$Object", new Proto.Obj());
        om.bind("xdc.rov.monserver.CallStack.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.monserver.CallStack$$Params", new Proto.Obj());
        om.bind("xdc.rov.monserver.CallStack.Params", new Proto.Str(po, true));
    }

    void DummyCallBack$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.monserver.DummyCallBack.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.monserver.DummyCallBack", new Value.Obj("xdc.rov.monserver.DummyCallBack", po));
        pkgV.bind("DummyCallBack", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.rov.monserver.DummyCallBack.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.monserver.DummyCallBack$$Object", new Proto.Obj());
        om.bind("xdc.rov.monserver.DummyCallBack.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.monserver.DummyCallBack$$Params", new Proto.Obj());
        om.bind("xdc.rov.monserver.DummyCallBack.Params", new Proto.Str(po, true));
    }

    void Support$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.monserver.Support.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.monserver.Support", new Value.Obj("xdc.rov.monserver.Support", po));
        pkgV.bind("Support", vo);
        // decls 
    }

    void SymbolTable$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.monserver.SymbolTable.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.monserver.SymbolTable", new Value.Obj("xdc.rov.monserver.SymbolTable", po));
        pkgV.bind("SymbolTable", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.rov.monserver.SymbolTable.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.monserver.SymbolTable$$Object", new Proto.Obj());
        om.bind("xdc.rov.monserver.SymbolTable.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.monserver.SymbolTable$$Params", new Proto.Obj());
        om.bind("xdc.rov.monserver.SymbolTable.Params", new Proto.Str(po, true));
    }

    void Main$$CONSTS()
    {
        // module Main
    }

    void CallStack$$CONSTS()
    {
        // module CallStack
    }

    void DummyCallBack$$CONSTS()
    {
        // module DummyCallBack
    }

    void Support$$CONSTS()
    {
        // module Support
    }

    void SymbolTable$$CONSTS()
    {
        // module SymbolTable
    }

    void Main$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.Main$$create", new Proto.Fxn(om.findStrict("xdc.rov.monserver.Main.Module", "xdc.rov.monserver"), om.findStrict("xdc.rov.monserver.Main.Instance", "xdc.rov.monserver"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.rov.monserver.Main.Params", "xdc.rov.monserver"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$monserver$Main$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.monserver.Main'];\n");
            sb.append("var __inst = xdc.om['xdc.rov.monserver.Main.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.rov.monserver']);\n");
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
        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.Main$$construct", new Proto.Fxn(om.findStrict("xdc.rov.monserver.Main.Module", "xdc.rov.monserver"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.rov.monserver.Main$$Object", "xdc.rov.monserver"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.rov.monserver.Main.Params", "xdc.rov.monserver"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$monserver$Main$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.monserver.Main'];\n");
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

    void CallStack$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.CallStack$$create", new Proto.Fxn(om.findStrict("xdc.rov.monserver.CallStack.Module", "xdc.rov.monserver"), om.findStrict("xdc.rov.monserver.CallStack.Instance", "xdc.rov.monserver"), 2, 1, false));
                fxn.addArg(0, "memoryReader", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.rov.monserver.CallStack.Params", "xdc.rov.monserver"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$monserver$CallStack$$create = function( memoryReader, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.monserver.CallStack'];\n");
            sb.append("var __inst = xdc.om['xdc.rov.monserver.CallStack.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.rov.monserver']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {memoryReader:memoryReader});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [memoryReader]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.CallStack$$construct", new Proto.Fxn(om.findStrict("xdc.rov.monserver.CallStack.Module", "xdc.rov.monserver"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.rov.monserver.CallStack$$Object", "xdc.rov.monserver"), null);
                fxn.addArg(1, "memoryReader", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.rov.monserver.CallStack.Params", "xdc.rov.monserver"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$monserver$CallStack$$construct = function( __obj, memoryReader, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.monserver.CallStack'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {memoryReader:memoryReader});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void DummyCallBack$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.DummyCallBack$$create", new Proto.Fxn(om.findStrict("xdc.rov.monserver.DummyCallBack.Module", "xdc.rov.monserver"), om.findStrict("xdc.rov.monserver.DummyCallBack.Instance", "xdc.rov.monserver"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.rov.monserver.DummyCallBack.Params", "xdc.rov.monserver"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$monserver$DummyCallBack$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.monserver.DummyCallBack'];\n");
            sb.append("var __inst = xdc.om['xdc.rov.monserver.DummyCallBack.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.rov.monserver']);\n");
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
        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.DummyCallBack$$construct", new Proto.Fxn(om.findStrict("xdc.rov.monserver.DummyCallBack.Module", "xdc.rov.monserver"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.rov.monserver.DummyCallBack$$Object", "xdc.rov.monserver"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.rov.monserver.DummyCallBack.Params", "xdc.rov.monserver"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$monserver$DummyCallBack$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.monserver.DummyCallBack'];\n");
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

    void Support$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void SymbolTable$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.SymbolTable$$create", new Proto.Fxn(om.findStrict("xdc.rov.monserver.SymbolTable.Module", "xdc.rov.monserver"), om.findStrict("xdc.rov.monserver.SymbolTable.Instance", "xdc.rov.monserver"), 2, 1, false));
                fxn.addArg(0, "elf", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.rov.monserver.SymbolTable.Params", "xdc.rov.monserver"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$monserver$SymbolTable$$create = function( elf, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.monserver.SymbolTable'];\n");
            sb.append("var __inst = xdc.om['xdc.rov.monserver.SymbolTable.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.rov.monserver']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {elf:elf});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [elf]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.SymbolTable$$construct", new Proto.Fxn(om.findStrict("xdc.rov.monserver.SymbolTable.Module", "xdc.rov.monserver"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.rov.monserver.SymbolTable$$Object", "xdc.rov.monserver"), null);
                fxn.addArg(1, "elf", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.rov.monserver.SymbolTable.Params", "xdc.rov.monserver"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$monserver$SymbolTable$$construct = function( __obj, elf, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.monserver.SymbolTable'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {elf:elf});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Main$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void CallStack$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void DummyCallBack$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Support$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Support.startModel
        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.Support$$startModel", new Proto.Fxn(om.findStrict("xdc.rov.monserver.Support.Module", "xdc.rov.monserver"), null, 0, -1, false));
        // fxn Support.close
        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.Support$$close", new Proto.Fxn(om.findStrict("xdc.rov.monserver.Support.Module", "xdc.rov.monserver"), null, 0, 0, false));
        // fxn Support.stringify
        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.Support$$stringify", new Proto.Fxn(om.findStrict("xdc.rov.monserver.Support.Module", "xdc.rov.monserver"), $$T_Str, 2, 2, false));
                fxn.addArg(0, "obj", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "indent", $$T_Str, $$UNDEF);
        // fxn Support.processTreeTable
        fxn = (Proto.Fxn)om.bind("xdc.rov.monserver.Support$$processTreeTable", new Proto.Fxn(om.findStrict("xdc.rov.monserver.Support.Module", "xdc.rov.monserver"), null, 2, 2, false));
                fxn.addArg(0, "obj", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "newObj", $$T_Obj, $$UNDEF);
    }

    void SymbolTable$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Main$$SIZES()
    {
    }

    void CallStack$$SIZES()
    {
    }

    void DummyCallBack$$SIZES()
    {
    }

    void Support$$SIZES()
    {
    }

    void SymbolTable$$SIZES()
    {
    }

    void Main$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/monserver/Main.xs");
        om.bind("xdc.rov.monserver.Main$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.Main.Module", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.Main.Module", om.findStrict("xdc.tools.ICmd.Module", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("usage", new Proto.Arr($$T_Str, false), Global.newArray(new Object[]{" ", "Usage", "[-p]", "[--help]", " "}), "wh");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.rov.monserver.Main$$create", "xdc.rov.monserver"), Global.get("xdc$rov$monserver$Main$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.rov.monserver.Main$$construct", "xdc.rov.monserver"), Global.get("xdc$rov$monserver$Main$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.monserver.Main$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.monserver.Main$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.rov.monserver.Main$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.monserver.Main$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "main");
                if (fxn != null) po.addFxn("main", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$main", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "exec");
                if (fxn != null) po.addFxn("exec", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$exec", "xdc.rov.monserver"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.Main.Instance", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.Main.Instance", om.findStrict("xdc.tools.ICmd.Instance", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("port", Proto.Elm.newCNum("(xdc_UInt)"), 8888L, "wh");
                fxn = Global.get(cap, "run");
                if (fxn != null) po.addFxn("run", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$run", "xdc.rov.monserver"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.Main$$Params", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.Main.Params", om.findStrict("xdc.tools.ICmd$$Params", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("port", Proto.Elm.newCNum("(xdc_UInt)"), 8888L, "wh");
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.Main$$Object", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.Main.Object", om.findStrict("xdc.rov.monserver.Main.Instance", "xdc.rov.monserver"));
                fxn = Global.get(cap, "run");
                if (fxn != null) po.addFxn("run", (Proto.Fxn)om.findStrict("xdc.tools.ICmd$$run", "xdc.rov.monserver"), fxn);
    }

    void CallStack$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/monserver/CallStack.xs");
        om.bind("xdc.rov.monserver.CallStack$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.CallStack.Module", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.CallStack.Module", om.findStrict("xdc.rov.ICallStack.Module", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.rov.monserver.CallStack$$create", "xdc.rov.monserver"), Global.get("xdc$rov$monserver$CallStack$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.rov.monserver.CallStack$$construct", "xdc.rov.monserver"), Global.get("xdc$rov$monserver$CallStack$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.monserver.CallStack$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.monserver.CallStack$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.rov.monserver.CallStack$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.monserver.CallStack$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.CallStack.Instance", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.CallStack.Instance", om.findStrict("xdc.rov.ICallStack.Instance", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                fxn = Global.get(cap, "clearRegisters");
                if (fxn != null) po.addFxn("clearRegisters", (Proto.Fxn)om.findStrict("xdc.rov.ICallStack$$clearRegisters", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "fetchRegisters");
                if (fxn != null) po.addFxn("fetchRegisters", (Proto.Fxn)om.findStrict("xdc.rov.ICallStack$$fetchRegisters", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "getRegister");
                if (fxn != null) po.addFxn("getRegister", (Proto.Fxn)om.findStrict("xdc.rov.ICallStack$$getRegister", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "setRegister");
                if (fxn != null) po.addFxn("setRegister", (Proto.Fxn)om.findStrict("xdc.rov.ICallStack$$setRegister", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "toText");
                if (fxn != null) po.addFxn("toText", (Proto.Fxn)om.findStrict("xdc.rov.ICallStack$$toText", "xdc.rov.monserver"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.CallStack$$Params", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.CallStack.Params", om.findStrict("xdc.rov.ICallStack$$Params", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.CallStack$$Object", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.CallStack.Object", om.findStrict("xdc.rov.monserver.CallStack.Instance", "xdc.rov.monserver"));
                fxn = Global.get(cap, "clearRegisters");
                if (fxn != null) po.addFxn("clearRegisters", (Proto.Fxn)om.findStrict("xdc.rov.ICallStack$$clearRegisters", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "fetchRegisters");
                if (fxn != null) po.addFxn("fetchRegisters", (Proto.Fxn)om.findStrict("xdc.rov.ICallStack$$fetchRegisters", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "getRegister");
                if (fxn != null) po.addFxn("getRegister", (Proto.Fxn)om.findStrict("xdc.rov.ICallStack$$getRegister", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "setRegister");
                if (fxn != null) po.addFxn("setRegister", (Proto.Fxn)om.findStrict("xdc.rov.ICallStack$$setRegister", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "toText");
                if (fxn != null) po.addFxn("toText", (Proto.Fxn)om.findStrict("xdc.rov.ICallStack$$toText", "xdc.rov.monserver"), fxn);
    }

    void DummyCallBack$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/monserver/DummyCallBack.xs");
        om.bind("xdc.rov.monserver.DummyCallBack$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.DummyCallBack.Module", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.DummyCallBack.Module", om.findStrict("xdc.rov.ICallBack.Module", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.rov.monserver.DummyCallBack$$create", "xdc.rov.monserver"), Global.get("xdc$rov$monserver$DummyCallBack$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.rov.monserver.DummyCallBack$$construct", "xdc.rov.monserver"), Global.get("xdc$rov$monserver$DummyCallBack$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.monserver.DummyCallBack$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.monserver.DummyCallBack$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.rov.monserver.DummyCallBack$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.monserver.DummyCallBack$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.DummyCallBack.Instance", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.DummyCallBack.Instance", om.findStrict("xdc.rov.ICallBack.Instance", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                fxn = Global.get(cap, "updateStartupProgress");
                if (fxn != null) po.addFxn("updateStartupProgress", (Proto.Fxn)om.findStrict("xdc.rov.ICallBack$$updateStartupProgress", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "getAbortFlag");
                if (fxn != null) po.addFxn("getAbortFlag", (Proto.Fxn)om.findStrict("xdc.rov.ICallBack$$getAbortFlag", "xdc.rov.monserver"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.DummyCallBack$$Params", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.DummyCallBack.Params", om.findStrict("xdc.rov.ICallBack$$Params", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.DummyCallBack$$Object", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.DummyCallBack.Object", om.findStrict("xdc.rov.monserver.DummyCallBack.Instance", "xdc.rov.monserver"));
                fxn = Global.get(cap, "updateStartupProgress");
                if (fxn != null) po.addFxn("updateStartupProgress", (Proto.Fxn)om.findStrict("xdc.rov.ICallBack$$updateStartupProgress", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "getAbortFlag");
                if (fxn != null) po.addFxn("getAbortFlag", (Proto.Fxn)om.findStrict("xdc.rov.ICallBack$$getAbortFlag", "xdc.rov.monserver"), fxn);
    }

    void Support$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/monserver/Support.xs");
        om.bind("xdc.rov.monserver.Support$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.Support.Module", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.Support.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.monserver.Support$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.monserver.Support$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.monserver.Support$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("startModel", (Proto.Fxn)om.findStrict("xdc.rov.monserver.Support$$startModel", "xdc.rov.monserver"), Global.get(cap, "startModel"));
                po.addFxn("close", (Proto.Fxn)om.findStrict("xdc.rov.monserver.Support$$close", "xdc.rov.monserver"), Global.get(cap, "close"));
                po.addFxn("stringify", (Proto.Fxn)om.findStrict("xdc.rov.monserver.Support$$stringify", "xdc.rov.monserver"), Global.get(cap, "stringify"));
                po.addFxn("processTreeTable", (Proto.Fxn)om.findStrict("xdc.rov.monserver.Support$$processTreeTable", "xdc.rov.monserver"), Global.get(cap, "processTreeTable"));
    }

    void SymbolTable$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/monserver/SymbolTable.xs");
        om.bind("xdc.rov.monserver.SymbolTable$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.SymbolTable.Module", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.SymbolTable.Module", om.findStrict("xdc.rov.ISymbolTable.Module", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.rov.monserver.SymbolTable$$create", "xdc.rov.monserver"), Global.get("xdc$rov$monserver$SymbolTable$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.rov.monserver.SymbolTable$$construct", "xdc.rov.monserver"), Global.get("xdc$rov$monserver$SymbolTable$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.monserver.SymbolTable$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.monserver.SymbolTable$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.rov.monserver.SymbolTable$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.monserver.SymbolTable$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.SymbolTable.Instance", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.SymbolTable.Instance", om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                fxn = Global.get(cap, "getSymbolValue");
                if (fxn != null) po.addFxn("getSymbolValue", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getSymbolValue", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "lookupDataSymbol");
                if (fxn != null) po.addFxn("lookupDataSymbol", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$lookupDataSymbol", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "lookupFuncName");
                if (fxn != null) po.addFxn("lookupFuncName", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$lookupFuncName", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "getISA");
                if (fxn != null) po.addFxn("getISA", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getISA", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "getJavaImp");
                if (fxn != null) po.addFxn("getJavaImp", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getJavaImp", "xdc.rov.monserver"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.SymbolTable$$Params", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.SymbolTable.Params", om.findStrict("xdc.rov.ISymbolTable$$Params", "xdc.rov.monserver"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.SymbolTable$$Object", "xdc.rov.monserver");
        po.init("xdc.rov.monserver.SymbolTable.Object", om.findStrict("xdc.rov.monserver.SymbolTable.Instance", "xdc.rov.monserver"));
                fxn = Global.get(cap, "getSymbolValue");
                if (fxn != null) po.addFxn("getSymbolValue", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getSymbolValue", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "lookupDataSymbol");
                if (fxn != null) po.addFxn("lookupDataSymbol", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$lookupDataSymbol", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "lookupFuncName");
                if (fxn != null) po.addFxn("lookupFuncName", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$lookupFuncName", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "getISA");
                if (fxn != null) po.addFxn("getISA", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getISA", "xdc.rov.monserver"), fxn);
                fxn = Global.get(cap, "getJavaImp");
                if (fxn != null) po.addFxn("getJavaImp", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getJavaImp", "xdc.rov.monserver"), fxn);
    }

    void Main$$ROV()
    {
    }

    void CallStack$$ROV()
    {
    }

    void DummyCallBack$$ROV()
    {
    }

    void Support$$ROV()
    {
    }

    void SymbolTable$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.rov.monserver.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.rov.monserver"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.rov.monserver", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.rov.monserver");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.rov.monserver.");
        pkgV.bind("$vers", Global.newArray());
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.rov", Global.newArray()));
        imports.add(Global.newArray("xdc.rta", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.rov.monserver'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.rov.monserver$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.rov.monserver$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.rov.monserver$$stat$root'];\n");
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

        vo = (Value.Obj)om.findStrict("xdc.rov.monserver.Main", "xdc.rov.monserver");
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.Main.Module", "xdc.rov.monserver");
        vo.init2(po, "xdc.rov.monserver.Main", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.monserver.Main$$capsule", "xdc.rov.monserver"));
        vo.bind("Instance", om.findStrict("xdc.rov.monserver.Main.Instance", "xdc.rov.monserver"));
        vo.bind("Params", om.findStrict("xdc.rov.monserver.Main.Params", "xdc.rov.monserver"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.monserver.Main.Params", "xdc.rov.monserver")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov.monserver", "xdc.rov.monserver"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.rov.monserver")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.monserver.Main$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.rov.monserver.Main.Object", "xdc.rov.monserver"));
        pkgV.bind("Main", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Main");
    }

    void CallStack$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.monserver.CallStack", "xdc.rov.monserver");
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.CallStack.Module", "xdc.rov.monserver");
        vo.init2(po, "xdc.rov.monserver.CallStack", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.monserver.CallStack$$capsule", "xdc.rov.monserver"));
        vo.bind("Instance", om.findStrict("xdc.rov.monserver.CallStack.Instance", "xdc.rov.monserver"));
        vo.bind("Params", om.findStrict("xdc.rov.monserver.CallStack.Params", "xdc.rov.monserver"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.monserver.CallStack.Params", "xdc.rov.monserver")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov.monserver", "xdc.rov.monserver"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.rov");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.rov.monserver")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.monserver.CallStack$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.rov.monserver.CallStack.Object", "xdc.rov.monserver"));
        pkgV.bind("CallStack", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("CallStack");
    }

    void DummyCallBack$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.monserver.DummyCallBack", "xdc.rov.monserver");
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.DummyCallBack.Module", "xdc.rov.monserver");
        vo.init2(po, "xdc.rov.monserver.DummyCallBack", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.monserver.DummyCallBack$$capsule", "xdc.rov.monserver"));
        vo.bind("Instance", om.findStrict("xdc.rov.monserver.DummyCallBack.Instance", "xdc.rov.monserver"));
        vo.bind("Params", om.findStrict("xdc.rov.monserver.DummyCallBack.Params", "xdc.rov.monserver"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.monserver.DummyCallBack.Params", "xdc.rov.monserver")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov.monserver", "xdc.rov.monserver"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.rov");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.rov.monserver")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.monserver.DummyCallBack$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.rov.monserver.DummyCallBack.Object", "xdc.rov.monserver"));
        pkgV.bind("DummyCallBack", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("DummyCallBack");
    }

    void Support$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.monserver.Support", "xdc.rov.monserver");
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.Support.Module", "xdc.rov.monserver");
        vo.init2(po, "xdc.rov.monserver.Support", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.monserver.Support$$capsule", "xdc.rov.monserver"));
        vo.bind("$package", om.findStrict("xdc.rov.monserver", "xdc.rov.monserver"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.rov.monserver")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.monserver.Support$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Support", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Support");
    }

    void SymbolTable$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.monserver.SymbolTable", "xdc.rov.monserver");
        po = (Proto.Obj)om.findStrict("xdc.rov.monserver.SymbolTable.Module", "xdc.rov.monserver");
        vo.init2(po, "xdc.rov.monserver.SymbolTable", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.monserver.SymbolTable$$capsule", "xdc.rov.monserver"));
        vo.bind("Instance", om.findStrict("xdc.rov.monserver.SymbolTable.Instance", "xdc.rov.monserver"));
        vo.bind("Params", om.findStrict("xdc.rov.monserver.SymbolTable.Params", "xdc.rov.monserver"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.monserver.SymbolTable.Params", "xdc.rov.monserver")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov.monserver", "xdc.rov.monserver"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.rov");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.rov.monserver")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.monserver.SymbolTable$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.rov.monserver.SymbolTable.Object", "xdc.rov.monserver"));
        pkgV.bind("SymbolTable", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SymbolTable");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.monserver.Main", "xdc.rov.monserver"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.monserver.CallStack", "xdc.rov.monserver"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.monserver.DummyCallBack", "xdc.rov.monserver"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.monserver.Support", "xdc.rov.monserver"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.monserver.SymbolTable", "xdc.rov.monserver"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.rov.monserver.Main")).bless();
        ((Value.Obj)om.getv("xdc.rov.monserver.CallStack")).bless();
        ((Value.Obj)om.getv("xdc.rov.monserver.DummyCallBack")).bless();
        ((Value.Obj)om.getv("xdc.rov.monserver.Support")).bless();
        ((Value.Obj)om.getv("xdc.rov.monserver.SymbolTable")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.rov.monserver")).add(pkgV);
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
        CallStack$$OBJECTS();
        DummyCallBack$$OBJECTS();
        Support$$OBJECTS();
        SymbolTable$$OBJECTS();
        Main$$CONSTS();
        CallStack$$CONSTS();
        DummyCallBack$$CONSTS();
        Support$$CONSTS();
        SymbolTable$$CONSTS();
        Main$$CREATES();
        CallStack$$CREATES();
        DummyCallBack$$CREATES();
        Support$$CREATES();
        SymbolTable$$CREATES();
        Main$$FUNCTIONS();
        CallStack$$FUNCTIONS();
        DummyCallBack$$FUNCTIONS();
        Support$$FUNCTIONS();
        SymbolTable$$FUNCTIONS();
        Main$$SIZES();
        CallStack$$SIZES();
        DummyCallBack$$SIZES();
        Support$$SIZES();
        SymbolTable$$SIZES();
        Main$$TYPES();
        CallStack$$TYPES();
        DummyCallBack$$TYPES();
        Support$$TYPES();
        SymbolTable$$TYPES();
        if (isROV) {
            Main$$ROV();
            CallStack$$ROV();
            DummyCallBack$$ROV();
            Support$$ROV();
            SymbolTable$$ROV();
        }//isROV
        $$SINGLETONS();
        Main$$SINGLETONS();
        CallStack$$SINGLETONS();
        DummyCallBack$$SINGLETONS();
        Support$$SINGLETONS();
        SymbolTable$$SINGLETONS();
        $$INITIALIZATION();
    }
}
