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

public class xdc_rov
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
        pkgP = (Proto.Obj)om.bind("xdc.rov.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.rov", new Value.Obj("xdc.rov", pkgP));
    }

    void Model$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.Model.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.Model", new Value.Obj("xdc.rov.Model", po));
        pkgV.bind("Model", vo);
        // decls 
    }

    void Program$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.Program.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.Program", new Value.Obj("xdc.rov.Program", po));
        pkgV.bind("Program", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.rov.Program$$FetchDesc", new Proto.Obj());
        om.bind("xdc.rov.Program.FetchDesc", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.rov.Program$$InstDataView", new Proto.Obj());
        om.bind("xdc.rov.Program.InstDataView", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.rov.Program$$ModDataView", new Proto.Obj());
        om.bind("xdc.rov.Program.ModDataView", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.rov.Program$$TreeNode", new Proto.Obj());
        om.bind("xdc.rov.Program.TreeNode", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.rov.Program$$RawView", new Proto.Obj());
        om.bind("xdc.rov.Program.RawView", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.rov.Program$$StatusEntry", new Proto.Obj());
        om.bind("xdc.rov.Program.StatusEntry", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.rov.Program$$Tab", new Proto.Obj());
        om.bind("xdc.rov.Program.Tab", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.rov.Program$$ROVModuleDesc", new Proto.Obj());
        om.bind("xdc.rov.Program.ROVModuleDesc", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.rov.Program$$ROVInstanceDesc", new Proto.Obj());
        om.bind("xdc.rov.Program.ROVInstanceDesc", new Proto.Str(spo, true));
    }

    void StructureDecoder$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.StructureDecoder.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.StructureDecoder", new Value.Obj("xdc.rov.StructureDecoder", po));
        pkgV.bind("StructureDecoder", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.rov.StructureDecoder$$Buffer", new Proto.Obj());
        om.bind("xdc.rov.StructureDecoder.Buffer", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.rov.StructureDecoder$$FieldType", new Proto.Obj());
        om.bind("xdc.rov.StructureDecoder.FieldType", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.rov.StructureDecoder.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.StructureDecoder$$Object", new Proto.Obj());
        om.bind("xdc.rov.StructureDecoder.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.StructureDecoder$$Params", new Proto.Obj());
        om.bind("xdc.rov.StructureDecoder.Params", new Proto.Str(po, true));
    }

    void StateReader$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.StateReader.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.StateReader", new Value.Obj("xdc.rov.StateReader", po));
        pkgV.bind("StateReader", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.rov.StateReader.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.StateReader$$Object", new Proto.Obj());
        om.bind("xdc.rov.StateReader.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.StateReader$$Params", new Proto.Obj());
        om.bind("xdc.rov.StateReader.Params", new Proto.Str(po, true));
    }

    void ViewXml$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.ViewXml.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.ViewXml", new Value.Obj("xdc.rov.ViewXml", po));
        pkgV.bind("ViewXml", vo);
        // decls 
    }

    void ViewInfo$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.ViewInfo.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.ViewInfo", new Value.Obj("xdc.rov.ViewInfo", po));
        pkgV.bind("ViewInfo", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.rov.ViewInfo$$Arg", new Proto.Obj());
        om.bind("xdc.rov.ViewInfo.Arg", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.rov.ViewInfo$$Args", new Proto.Obj());
        om.bind("xdc.rov.ViewInfo.Args", new Proto.Str(spo, true));
        om.bind("xdc.rov.ViewInfo.ViewType", new Proto.Enm("xdc.rov.ViewInfo.ViewType"));
        spo = (Proto.Obj)om.bind("xdc.rov.ViewInfo$$View", new Proto.Obj());
        om.bind("xdc.rov.ViewInfo.View", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.rov.ViewInfo.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.ViewInfo$$Object", new Proto.Obj());
        om.bind("xdc.rov.ViewInfo.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.ViewInfo$$Params", new Proto.Obj());
        om.bind("xdc.rov.ViewInfo.Params", new Proto.Str(po, true));
    }

    void CallStack$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.CallStack.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.CallStack", new Value.Obj("xdc.rov.CallStack", po));
        pkgV.bind("CallStack", vo);
        // decls 
    }

    void ISymbolTable$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.ISymbolTable.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.ISymbolTable", new Value.Obj("xdc.rov.ISymbolTable", po));
        pkgV.bind("ISymbolTable", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.rov.ISymbolTable.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.ISymbolTable$$Object", new Proto.Obj());
        om.bind("xdc.rov.ISymbolTable.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.ISymbolTable$$Params", new Proto.Obj());
        om.bind("xdc.rov.ISymbolTable.Params", new Proto.Str(po, true));
    }

    void ICallBack$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.ICallBack.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.ICallBack", new Value.Obj("xdc.rov.ICallBack", po));
        pkgV.bind("ICallBack", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.rov.ICallBack.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.ICallBack$$Object", new Proto.Obj());
        om.bind("xdc.rov.ICallBack.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.ICallBack$$Params", new Proto.Obj());
        om.bind("xdc.rov.ICallBack.Params", new Proto.Str(po, true));
    }

    void ICallStack$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.ICallStack.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.ICallStack", new Value.Obj("xdc.rov.ICallStack", po));
        pkgV.bind("ICallStack", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.rov.ICallStack.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.ICallStack$$Object", new Proto.Obj());
        om.bind("xdc.rov.ICallStack.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.ICallStack$$Params", new Proto.Obj());
        om.bind("xdc.rov.ICallStack.Params", new Proto.Str(po, true));
    }

    void Model$$CONSTS()
    {
        // module Model
    }

    void Program$$CONSTS()
    {
        // module Program
    }

    void StructureDecoder$$CONSTS()
    {
        // module StructureDecoder
    }

    void StateReader$$CONSTS()
    {
        // module StateReader
    }

    void ViewXml$$CONSTS()
    {
        // module ViewXml
    }

    void ViewInfo$$CONSTS()
    {
        // module ViewInfo
        om.bind("xdc.rov.ViewInfo.INSTANCE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.rov.ViewInfo.ViewType", "xdc.rov"), "xdc.rov.ViewInfo.INSTANCE", 0));
        om.bind("xdc.rov.ViewInfo.MODULE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.rov.ViewInfo.ViewType", "xdc.rov"), "xdc.rov.ViewInfo.MODULE", 1));
        om.bind("xdc.rov.ViewInfo.INSTANCE_DATA", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.rov.ViewInfo.ViewType", "xdc.rov"), "xdc.rov.ViewInfo.INSTANCE_DATA", 2));
        om.bind("xdc.rov.ViewInfo.MODULE_DATA", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.rov.ViewInfo.ViewType", "xdc.rov"), "xdc.rov.ViewInfo.MODULE_DATA", 3));
        om.bind("xdc.rov.ViewInfo.RAW", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.rov.ViewInfo.ViewType", "xdc.rov"), "xdc.rov.ViewInfo.RAW", 4));
        om.bind("xdc.rov.ViewInfo.TREE_TABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.rov.ViewInfo.ViewType", "xdc.rov"), "xdc.rov.ViewInfo.TREE_TABLE", 5));
        om.bind("xdc.rov.ViewInfo.TREE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.rov.ViewInfo.ViewType", "xdc.rov"), "xdc.rov.ViewInfo.TREE", 6));
    }

    void CallStack$$CONSTS()
    {
        // module CallStack
    }

    void ISymbolTable$$CONSTS()
    {
        // interface ISymbolTable
    }

    void ICallBack$$CONSTS()
    {
        // interface ICallBack
    }

    void ICallStack$$CONSTS()
    {
        // interface ICallStack
    }

    void Model$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Program$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void StructureDecoder$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.rov.StructureDecoder$$create", new Proto.Fxn(om.findStrict("xdc.rov.StructureDecoder.Module", "xdc.rov"), om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), 3, 2, false));
                fxn.addArg(0, "mem", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "targConfig", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.rov.StructureDecoder.Params", "xdc.rov"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$StructureDecoder$$create = function( mem, targConfig, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.StructureDecoder'];\n");
            sb.append("var __inst = xdc.om['xdc.rov.StructureDecoder.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.rov']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {mem:mem, targConfig:targConfig});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [mem, targConfig]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.rov.StructureDecoder$$construct", new Proto.Fxn(om.findStrict("xdc.rov.StructureDecoder.Module", "xdc.rov"), null, 4, 2, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.rov.StructureDecoder$$Object", "xdc.rov"), null);
                fxn.addArg(1, "mem", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "targConfig", $$T_Obj, $$UNDEF);
                fxn.addArg(3, "__params", (Proto)om.findStrict("xdc.rov.StructureDecoder.Params", "xdc.rov"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$StructureDecoder$$construct = function( __obj, mem, targConfig, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.StructureDecoder'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {mem:mem, targConfig:targConfig});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void StateReader$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.rov.StateReader$$create", new Proto.Fxn(om.findStrict("xdc.rov.StateReader.Module", "xdc.rov"), om.findStrict("xdc.rov.StateReader.Instance", "xdc.rov"), 3, 2, false));
                fxn.addArg(0, "symTable", (Proto)om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov"), $$UNDEF);
                fxn.addArg(1, "strDec", (Proto)om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.rov.StateReader.Params", "xdc.rov"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$StateReader$$create = function( symTable, strDec, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.StateReader'];\n");
            sb.append("var __inst = xdc.om['xdc.rov.StateReader.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.rov']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {symTable:symTable, strDec:strDec});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [symTable, strDec]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.rov.StateReader$$construct", new Proto.Fxn(om.findStrict("xdc.rov.StateReader.Module", "xdc.rov"), null, 4, 2, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.rov.StateReader$$Object", "xdc.rov"), null);
                fxn.addArg(1, "symTable", (Proto)om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov"), $$UNDEF);
                fxn.addArg(2, "strDec", (Proto)om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), $$UNDEF);
                fxn.addArg(3, "__params", (Proto)om.findStrict("xdc.rov.StateReader.Params", "xdc.rov"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$StateReader$$construct = function( __obj, symTable, strDec, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.StateReader'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {symTable:symTable, strDec:strDec});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ViewXml$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ViewInfo$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.rov.ViewInfo$$create", new Proto.Fxn(om.findStrict("xdc.rov.ViewInfo.Module", "xdc.rov"), om.findStrict("xdc.rov.ViewInfo.Instance", "xdc.rov"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.rov.ViewInfo.Params", "xdc.rov"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$ViewInfo$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.ViewInfo'];\n");
            sb.append("var __inst = xdc.om['xdc.rov.ViewInfo.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.rov']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.viewMap = __mod.PARAMS.viewMap;\n");
            sb.append("__inst.argsMap = __mod.PARAMS.argsMap;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.rov.ViewInfo$$construct", new Proto.Fxn(om.findStrict("xdc.rov.ViewInfo.Module", "xdc.rov"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.rov.ViewInfo$$Object", "xdc.rov"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.rov.ViewInfo.Params", "xdc.rov"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$ViewInfo$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.ViewInfo'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.viewMap = __mod.PARAMS.viewMap;\n");
            sb.append("__inst.argsMap = __mod.PARAMS.argsMap;\n");
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

    }

    void ISymbolTable$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ICallBack$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ICallStack$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Model$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Model.start
        fxn = (Proto.Fxn)om.bind("xdc.rov.Model$$start", new Proto.Fxn(om.findStrict("xdc.rov.Model.Module", "xdc.rov"), null, 6, 6, false));
                fxn.addArg(0, "vers", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(1, "executable", $$T_Str, $$UNDEF);
                fxn.addArg(2, "recap", $$T_Obj, $$UNDEF);
                fxn.addArg(3, "sym", (Proto)om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov"), $$UNDEF);
                fxn.addArg(4, "mem", $$T_Obj, $$UNDEF);
                fxn.addArg(5, "callBack", (Proto)om.findStrict("xdc.rov.ICallBack.Instance", "xdc.rov"), $$UNDEF);
        // fxn Model.getICallStackInst
        fxn = (Proto.Fxn)om.bind("xdc.rov.Model$$getICallStackInst", new Proto.Fxn(om.findStrict("xdc.rov.Model.Module", "xdc.rov"), (Proto)om.findStrict("xdc.rov.ICallStack.Instance", "xdc.rov"), 0, 0, false));
        // fxn Model.setICallStackInst
        fxn = (Proto.Fxn)om.bind("xdc.rov.Model$$setICallStackInst", new Proto.Fxn(om.findStrict("xdc.rov.Model.Module", "xdc.rov"), null, 1, 1, false));
                fxn.addArg(0, "cs", (Proto)om.findStrict("xdc.rov.ICallStack.Instance", "xdc.rov"), $$UNDEF);
        // fxn Model.getISymbolTableInst
        fxn = (Proto.Fxn)om.bind("xdc.rov.Model$$getISymbolTableInst", new Proto.Fxn(om.findStrict("xdc.rov.Model.Module", "xdc.rov"), (Proto)om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov"), 0, 0, false));
        // fxn Model.getMemoryImageInst
        fxn = (Proto.Fxn)om.bind("xdc.rov.Model$$getMemoryImageInst", new Proto.Fxn(om.findStrict("xdc.rov.Model.Module", "xdc.rov"), null, 0, -1, false));
        // fxn Model.getICallBackInst
        fxn = (Proto.Fxn)om.bind("xdc.rov.Model$$getICallBackInst", new Proto.Fxn(om.findStrict("xdc.rov.Model.Module", "xdc.rov"), (Proto)om.findStrict("xdc.rov.ICallBack.Instance", "xdc.rov"), 0, 0, false));
        // fxn Model.getIOFReaderInst
        fxn = (Proto.Fxn)om.bind("xdc.rov.Model$$getIOFReaderInst", new Proto.Fxn(om.findStrict("xdc.rov.Model.Module", "xdc.rov"), null, 0, -1, false));
        // fxn Model.getModuleList
        fxn = (Proto.Fxn)om.bind("xdc.rov.Model$$getModuleList", new Proto.Fxn(om.findStrict("xdc.rov.Model.Module", "xdc.rov"), $$T_Obj, 0, 0, false));
    }

    void Program$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Program.scanInstanceView
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$scanInstanceView", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 2, 2, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "tabName", $$T_Str, $$UNDEF);
        // fxn Program.scanModuleView
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$scanModuleView", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 2, 2, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "tabName", $$T_Str, $$UNDEF);
        // fxn Program.scanInstanceDataView
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$scanInstanceDataView", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), new Proto.Arr((Proto)om.findStrict("xdc.rov.Program.InstDataView", "xdc.rov"), false), 2, 2, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "tabName", $$T_Str, $$UNDEF);
        // fxn Program.scanModuleDataView
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$scanModuleDataView", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), (Proto)om.findStrict("xdc.rov.Program.ModDataView", "xdc.rov"), 2, 2, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "tabName", $$T_Str, $$UNDEF);
        // fxn Program.scanRawView
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$scanRawView", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), (Proto)om.findStrict("xdc.rov.Program.RawView", "xdc.rov"), 1, 1, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
        // fxn Program.scanTreeTableView
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$scanTreeTableView", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), new Proto.Arr((Proto)om.findStrict("xdc.rov.Program.TreeNode", "xdc.rov"), false), 2, 2, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "tabName", $$T_Str, $$UNDEF);
        // fxn Program.scanTreeView
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$scanTreeView", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 2, 2, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "tabName", $$T_Str, $$UNDEF);
        // fxn Program.scanHandleView
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$scanHandleView", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 3, 3, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "instAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(2, "tabName", $$T_Str, $$UNDEF);
        // fxn Program.scanObjectView
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$scanObjectView", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 3, 3, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "obj", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "tabName", $$T_Str, $$UNDEF);
        // fxn Program.fetchStruct
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$fetchStruct", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 3, 2, false));
                fxn.addArg(0, "desc", (Proto)om.findStrict("xdc.rov.Program.FetchDesc", "xdc.rov"), $$DEFAULT);
                fxn.addArg(1, "addr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(2, "addrCheck", $$T_Bool, true);
        // fxn Program.fetchArray
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$fetchArray", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 4, 3, false));
                fxn.addArg(0, "desc", (Proto)om.findStrict("xdc.rov.Program.FetchDesc", "xdc.rov"), $$DEFAULT);
                fxn.addArg(1, "addr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(2, "len", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(3, "addrCheck", $$T_Bool, true);
        // fxn Program.fetchString
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$fetchString", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Str, 2, 1, false));
                fxn.addArg(0, "addr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(1, "addrCheck", $$T_Bool, true);
        // fxn Program.fetchStaticString
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$fetchStaticString", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "addr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
        // fxn Program.getModuleConfig
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$getModuleConfig", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 1, 1, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
        // fxn Program.getPrivateData
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$getPrivateData", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 1, 1, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
        // fxn Program.lookupDataSymbol
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$lookupDataSymbol", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 1, 1, false));
                fxn.addArg(0, "addr", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn Program.lookupFuncName
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$lookupFuncName", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 1, 1, false));
                fxn.addArg(0, "addr", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn Program.getSymbolValue
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$getSymbolValue", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), Proto.Elm.newCNum("(xdc_Int)"), 1, 1, false));
                fxn.addArg(0, "symName", $$T_Str, $$UNDEF);
        // fxn Program.displayError
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$displayError", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), null, 3, 3, false));
                fxn.addArg(0, "view", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "fieldName", $$T_Str, $$UNDEF);
                fxn.addArg(2, "errorMsg", $$T_Str, $$UNDEF);
        // fxn Program.ptrToHex
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$ptrToHex", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "ptr", $$T_Obj, $$UNDEF);
        // fxn Program.getShortName
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$getShortName", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
        // fxn Program.debugPrint
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$debugPrint", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), null, 1, 1, false));
                fxn.addArg(0, "msg", $$T_Str, $$UNDEF);
        // fxn Program.timestamp
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$timestamp", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), null, 1, 1, false));
                fxn.addArg(0, "msg", $$T_Str, $$UNDEF);
        // fxn Program.setTimestampFunc
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$setTimestampFunc", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), null, 1, 1, false));
                fxn.addArg(0, "func", $$T_Obj, $$UNDEF);
        // fxn Program.newViewStruct
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$newViewStruct", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 2, 2, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "tabName", $$T_Str, $$UNDEF);
        // fxn Program.getStatusTable
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$getStatusTable", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Obj, 0, 0, false));
        // fxn Program.getModuleDesc
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$getModuleDesc", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), new Proto.Adr("xdc_rov_Program_ROVModuleDesc*", "PS"), 1, 1, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
        // fxn Program.getViewType
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$getViewType", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Str, 2, 2, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "tabName", $$T_Str, $$UNDEF);
        // fxn Program.getSupportedTabs
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$getSupportedTabs", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), new Proto.Arr((Proto)om.findStrict("xdc.rov.Program.Tab", "xdc.rov"), false), 1, 1, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
        // fxn Program.getAbortFlag
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$getAbortFlag", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Bool, 0, 0, false));
        // fxn Program.resetMods
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$resetMods", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), null, 0, 0, false));
        // fxn Program.setThrowViewErrors
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$setThrowViewErrors", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), null, 1, 1, false));
                fxn.addArg(0, "flag", $$T_Bool, $$UNDEF);
        // fxn Program.moduleIdToName
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$moduleIdToName", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "mid", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn Program.exToString
        fxn = (Proto.Fxn)om.bind("xdc.rov.Program$$exToString", new Proto.Fxn(om.findStrict("xdc.rov.Program.Module", "xdc.rov"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "e", $$T_Obj, $$UNDEF);
    }

    void StructureDecoder$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn StructureDecoder.fetchStruct
        fxn = (Proto.Fxn)om.bind("xdc.rov.StructureDecoder$$fetchStruct", new Proto.Fxn(om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), $$T_Obj, 3, 3, false));
                fxn.addArg(0, "structType", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "addr", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(2, "addrCheck", $$T_Bool, $$UNDEF);
        // fxn StructureDecoder.fetchArray
        fxn = (Proto.Fxn)om.bind("xdc.rov.StructureDecoder$$fetchArray", new Proto.Fxn(om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), $$T_Obj, 5, 5, false));
                fxn.addArg(0, "structType", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "addr", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(2, "len", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(3, "isScalar", $$T_Bool, $$UNDEF);
                fxn.addArg(4, "addrCheck", $$T_Bool, $$UNDEF);
        // fxn StructureDecoder.decodeStruct
        fxn = (Proto.Fxn)om.bind("xdc.rov.StructureDecoder$$decodeStruct", new Proto.Fxn(om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), $$T_Obj, 3, 2, false));
                fxn.addArg(0, "structType", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "buffer", (Proto)om.findStrict("xdc.rov.StructureDecoder.Buffer", "xdc.rov"), $$DEFAULT);
                fxn.addArg(2, "inStr", $$T_Obj, null);
        // fxn StructureDecoder.decodeStructArray
        fxn = (Proto.Fxn)om.bind("xdc.rov.StructureDecoder$$decodeStructArray", new Proto.Fxn(om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), $$T_Obj, 3, 3, false));
                fxn.addArg(0, "structType", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "buffer", (Proto)om.findStrict("xdc.rov.StructureDecoder.Buffer", "xdc.rov"), $$DEFAULT);
                fxn.addArg(2, "len", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn StructureDecoder._parseTypeString
        fxn = (Proto.Fxn)om.bind("xdc.rov.StructureDecoder$$_parseTypeString", new Proto.Fxn(om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), (Proto)om.findStrict("xdc.rov.StructureDecoder.FieldType", "xdc.rov"), 1, 1, false));
                fxn.addArg(0, "fieldType", $$T_Str, $$UNDEF);
        // fxn StructureDecoder._decodeField
        fxn = (Proto.Fxn)om.bind("xdc.rov.StructureDecoder$$_decodeField", new Proto.Fxn(om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), null, 0, -1, false));
        // fxn StructureDecoder._decodeArray
        fxn = (Proto.Fxn)om.bind("xdc.rov.StructureDecoder$$_decodeArray", new Proto.Fxn(om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), $$T_Obj, 3, 3, false));
                fxn.addArg(0, "elemType", $$T_Str, $$UNDEF);
                fxn.addArg(1, "buffer", (Proto)om.findStrict("xdc.rov.StructureDecoder.Buffer", "xdc.rov"), $$DEFAULT);
                fxn.addArg(2, "len", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn StructureDecoder._decodeScalar
        fxn = (Proto.Fxn)om.bind("xdc.rov.StructureDecoder$$_decodeScalar", new Proto.Fxn(om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"), null, 0, -1, false));
    }

    void StateReader$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn StateReader.fetchModuleState
        fxn = (Proto.Fxn)om.bind("xdc.rov.StateReader$$fetchModuleState", new Proto.Fxn(om.findStrict("xdc.rov.StateReader.Instance", "xdc.rov"), null, 1, 1, false));
                fxn.addArg(0, "mod", new Proto.Adr("xdc_rov_Program_ROVModuleDesc*", "PS"), $$UNDEF);
        // fxn StateReader.fetchAllInstStates
        fxn = (Proto.Fxn)om.bind("xdc.rov.StateReader$$fetchAllInstStates", new Proto.Fxn(om.findStrict("xdc.rov.StateReader.Instance", "xdc.rov"), null, 1, 1, false));
                fxn.addArg(0, "mod", new Proto.Adr("xdc_rov_Program_ROVModuleDesc*", "PS"), $$UNDEF);
        // fxn StateReader.fetchInstState
        fxn = (Proto.Fxn)om.bind("xdc.rov.StateReader$$fetchInstState", new Proto.Fxn(om.findStrict("xdc.rov.StateReader.Instance", "xdc.rov"), new Proto.Adr("xdc_rov_Program_ROVInstanceDesc*", "PS"), 3, 3, false));
                fxn.addArg(0, "mod", new Proto.Adr("xdc_rov_Program_ROVModuleDesc*", "PS"), $$UNDEF);
                fxn.addArg(1, "instAddr", Proto.Elm.newCNum("(xdc_Long)"), $$UNDEF);
                fxn.addArg(2, "staticIndex", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn StateReader.fetchHandleState
        fxn = (Proto.Fxn)om.bind("xdc.rov.StateReader$$fetchHandleState", new Proto.Fxn(om.findStrict("xdc.rov.StateReader.Instance", "xdc.rov"), new Proto.Adr("xdc_rov_Program_ROVInstanceDesc*", "PS"), 2, 2, false));
                fxn.addArg(0, "mod", new Proto.Adr("xdc_rov_Program_ROVModuleDesc*", "PS"), $$UNDEF);
                fxn.addArg(1, "instAddr", Proto.Elm.newCNum("(xdc_Long)"), $$UNDEF);
        // fxn StateReader.getInstDesc
        fxn = (Proto.Fxn)om.bind("xdc.rov.StateReader$$getInstDesc", new Proto.Fxn(om.findStrict("xdc.rov.StateReader.Instance", "xdc.rov"), new Proto.Adr("xdc_rov_Program_ROVInstanceDesc*", "PS"), 3, 3, false));
                fxn.addArg(0, "mod", new Proto.Adr("xdc_rov_Program_ROVModuleDesc*", "PS"), $$UNDEF);
                fxn.addArg(1, "obj", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "staticIndex", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
    }

    void ViewXml$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ViewXml.processCommand
        fxn = (Proto.Fxn)om.bind("xdc.rov.ViewXml$$processCommand", new Proto.Fxn(om.findStrict("xdc.rov.ViewXml.Module", "xdc.rov"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "cmd", $$T_Str, $$UNDEF);
        // fxn ViewXml.listModules
        fxn = (Proto.Fxn)om.bind("xdc.rov.ViewXml$$listModules", new Proto.Fxn(om.findStrict("xdc.rov.ViewXml.Module", "xdc.rov"), $$T_Str, 0, 0, false));
        // fxn ViewXml.retrieveView
        fxn = (Proto.Fxn)om.bind("xdc.rov.ViewXml$$retrieveView", new Proto.Fxn(om.findStrict("xdc.rov.ViewXml.Module", "xdc.rov"), $$T_Str, 2, 2, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "tabName", $$T_Str, $$UNDEF);
    }

    void ViewInfo$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void CallStack$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn CallStack.clearRegisters
        fxn = (Proto.Fxn)om.bind("xdc.rov.CallStack$$clearRegisters", new Proto.Fxn(om.findStrict("xdc.rov.CallStack.Module", "xdc.rov"), null, 0, 0, false));
        // fxn CallStack.fetchRegisters
        fxn = (Proto.Fxn)om.bind("xdc.rov.CallStack$$fetchRegisters", new Proto.Fxn(om.findStrict("xdc.rov.CallStack.Module", "xdc.rov"), null, 1, 1, false));
                fxn.addArg(0, "names", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn CallStack.getRegister
        fxn = (Proto.Fxn)om.bind("xdc.rov.CallStack$$getRegister", new Proto.Fxn(om.findStrict("xdc.rov.CallStack.Module", "xdc.rov"), Proto.Elm.newCNum("(xdc_Long)"), 1, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
        // fxn CallStack.setRegister
        fxn = (Proto.Fxn)om.bind("xdc.rov.CallStack$$setRegister", new Proto.Fxn(om.findStrict("xdc.rov.CallStack.Module", "xdc.rov"), null, 2, 2, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "value", Proto.Elm.newCNum("(xdc_Long)"), $$UNDEF);
        // fxn CallStack.toText
        fxn = (Proto.Fxn)om.bind("xdc.rov.CallStack$$toText", new Proto.Fxn(om.findStrict("xdc.rov.CallStack.Module", "xdc.rov"), $$T_Str, 0, 0, false));
    }

    void ISymbolTable$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ISymbolTable.getSymbolValue
        fxn = (Proto.Fxn)om.bind("xdc.rov.ISymbolTable$$getSymbolValue", new Proto.Fxn(om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov"), Proto.Elm.newCNum("(xdc_Int)"), 1, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
        // fxn ISymbolTable.lookupDataSymbol
        fxn = (Proto.Fxn)om.bind("xdc.rov.ISymbolTable$$lookupDataSymbol", new Proto.Fxn(om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov"), $$T_Obj, 1, 1, false));
                fxn.addArg(0, "addr", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn ISymbolTable.lookupFuncName
        fxn = (Proto.Fxn)om.bind("xdc.rov.ISymbolTable$$lookupFuncName", new Proto.Fxn(om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov"), $$T_Obj, 1, 1, false));
                fxn.addArg(0, "addr", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn ISymbolTable.getISA
        fxn = (Proto.Fxn)om.bind("xdc.rov.ISymbolTable$$getISA", new Proto.Fxn(om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov"), Proto.Elm.newCNum("(xdc_Int)"), 0, 0, false));
        // fxn ISymbolTable.getJavaImp
        fxn = (Proto.Fxn)om.bind("xdc.rov.ISymbolTable$$getJavaImp", new Proto.Fxn(om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov"), null, 0, -1, false));
    }

    void ICallBack$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ICallBack.updateStartupProgress
        fxn = (Proto.Fxn)om.bind("xdc.rov.ICallBack$$updateStartupProgress", new Proto.Fxn(om.findStrict("xdc.rov.ICallBack.Instance", "xdc.rov"), null, 2, 2, false));
                fxn.addArg(0, "percent", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(1, "message", $$T_Str, $$UNDEF);
        // fxn ICallBack.getAbortFlag
        fxn = (Proto.Fxn)om.bind("xdc.rov.ICallBack$$getAbortFlag", new Proto.Fxn(om.findStrict("xdc.rov.ICallBack.Instance", "xdc.rov"), $$T_Bool, 0, 0, false));
    }

    void ICallStack$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ICallStack.clearRegisters
        fxn = (Proto.Fxn)om.bind("xdc.rov.ICallStack$$clearRegisters", new Proto.Fxn(om.findStrict("xdc.rov.ICallStack.Instance", "xdc.rov"), null, 0, 0, false));
        // fxn ICallStack.fetchRegisters
        fxn = (Proto.Fxn)om.bind("xdc.rov.ICallStack$$fetchRegisters", new Proto.Fxn(om.findStrict("xdc.rov.ICallStack.Instance", "xdc.rov"), null, 1, 1, false));
                fxn.addArg(0, "names", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn ICallStack.getRegister
        fxn = (Proto.Fxn)om.bind("xdc.rov.ICallStack$$getRegister", new Proto.Fxn(om.findStrict("xdc.rov.ICallStack.Instance", "xdc.rov"), Proto.Elm.newCNum("(xdc_Long)"), 1, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
        // fxn ICallStack.setRegister
        fxn = (Proto.Fxn)om.bind("xdc.rov.ICallStack$$setRegister", new Proto.Fxn(om.findStrict("xdc.rov.ICallStack.Instance", "xdc.rov"), null, 2, 2, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "value", Proto.Elm.newCNum("(xdc_Long)"), $$UNDEF);
        // fxn ICallStack.toText
        fxn = (Proto.Fxn)om.bind("xdc.rov.ICallStack$$toText", new Proto.Fxn(om.findStrict("xdc.rov.ICallStack.Instance", "xdc.rov"), $$T_Str, 0, 0, false));
    }

    void Model$$SIZES()
    {
    }

    void Program$$SIZES()
    {
    }

    void StructureDecoder$$SIZES()
    {
    }

    void StateReader$$SIZES()
    {
    }

    void ViewXml$$SIZES()
    {
    }

    void ViewInfo$$SIZES()
    {
    }

    void CallStack$$SIZES()
    {
    }

    void ISymbolTable$$SIZES()
    {
    }

    void ICallBack$$SIZES()
    {
    }

    void ICallStack$$SIZES()
    {
    }

    void Model$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/Model.xs");
        om.bind("xdc.rov.Model$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.Model.Module", "xdc.rov");
        po.init("xdc.rov.Model.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("vers", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.Model$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.Model$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.Model$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("start", (Proto.Fxn)om.findStrict("xdc.rov.Model$$start", "xdc.rov"), Global.get(cap, "start"));
                po.addFxn("getICallStackInst", (Proto.Fxn)om.findStrict("xdc.rov.Model$$getICallStackInst", "xdc.rov"), Global.get(cap, "getICallStackInst"));
                po.addFxn("setICallStackInst", (Proto.Fxn)om.findStrict("xdc.rov.Model$$setICallStackInst", "xdc.rov"), Global.get(cap, "setICallStackInst"));
                po.addFxn("getISymbolTableInst", (Proto.Fxn)om.findStrict("xdc.rov.Model$$getISymbolTableInst", "xdc.rov"), Global.get(cap, "getISymbolTableInst"));
                po.addFxn("getMemoryImageInst", (Proto.Fxn)om.findStrict("xdc.rov.Model$$getMemoryImageInst", "xdc.rov"), Global.get(cap, "getMemoryImageInst"));
                po.addFxn("getICallBackInst", (Proto.Fxn)om.findStrict("xdc.rov.Model$$getICallBackInst", "xdc.rov"), Global.get(cap, "getICallBackInst"));
                po.addFxn("getIOFReaderInst", (Proto.Fxn)om.findStrict("xdc.rov.Model$$getIOFReaderInst", "xdc.rov"), Global.get(cap, "getIOFReaderInst"));
                po.addFxn("getModuleList", (Proto.Fxn)om.findStrict("xdc.rov.Model$$getModuleList", "xdc.rov"), Global.get(cap, "getModuleList"));
    }

    void Program$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/Program.xs");
        om.bind("xdc.rov.Program$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.Program.Module", "xdc.rov");
        po.init("xdc.rov.Program.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("moduleNames", new Proto.Arr($$T_Str, true), $$DEFAULT, "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.Program$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.Program$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.Program$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("scanInstanceView", (Proto.Fxn)om.findStrict("xdc.rov.Program$$scanInstanceView", "xdc.rov"), Global.get(cap, "scanInstanceView"));
                po.addFxn("scanModuleView", (Proto.Fxn)om.findStrict("xdc.rov.Program$$scanModuleView", "xdc.rov"), Global.get(cap, "scanModuleView"));
                po.addFxn("scanInstanceDataView", (Proto.Fxn)om.findStrict("xdc.rov.Program$$scanInstanceDataView", "xdc.rov"), Global.get(cap, "scanInstanceDataView"));
                po.addFxn("scanModuleDataView", (Proto.Fxn)om.findStrict("xdc.rov.Program$$scanModuleDataView", "xdc.rov"), Global.get(cap, "scanModuleDataView"));
                po.addFxn("scanRawView", (Proto.Fxn)om.findStrict("xdc.rov.Program$$scanRawView", "xdc.rov"), Global.get(cap, "scanRawView"));
                po.addFxn("scanTreeTableView", (Proto.Fxn)om.findStrict("xdc.rov.Program$$scanTreeTableView", "xdc.rov"), Global.get(cap, "scanTreeTableView"));
                po.addFxn("scanTreeView", (Proto.Fxn)om.findStrict("xdc.rov.Program$$scanTreeView", "xdc.rov"), Global.get(cap, "scanTreeView"));
                po.addFxn("scanHandleView", (Proto.Fxn)om.findStrict("xdc.rov.Program$$scanHandleView", "xdc.rov"), Global.get(cap, "scanHandleView"));
                po.addFxn("scanObjectView", (Proto.Fxn)om.findStrict("xdc.rov.Program$$scanObjectView", "xdc.rov"), Global.get(cap, "scanObjectView"));
                po.addFxn("fetchStruct", (Proto.Fxn)om.findStrict("xdc.rov.Program$$fetchStruct", "xdc.rov"), Global.get(cap, "fetchStruct"));
                po.addFxn("fetchArray", (Proto.Fxn)om.findStrict("xdc.rov.Program$$fetchArray", "xdc.rov"), Global.get(cap, "fetchArray"));
                po.addFxn("fetchString", (Proto.Fxn)om.findStrict("xdc.rov.Program$$fetchString", "xdc.rov"), Global.get(cap, "fetchString"));
                po.addFxn("fetchStaticString", (Proto.Fxn)om.findStrict("xdc.rov.Program$$fetchStaticString", "xdc.rov"), Global.get(cap, "fetchStaticString"));
                po.addFxn("getModuleConfig", (Proto.Fxn)om.findStrict("xdc.rov.Program$$getModuleConfig", "xdc.rov"), Global.get(cap, "getModuleConfig"));
                po.addFxn("getPrivateData", (Proto.Fxn)om.findStrict("xdc.rov.Program$$getPrivateData", "xdc.rov"), Global.get(cap, "getPrivateData"));
                po.addFxn("lookupDataSymbol", (Proto.Fxn)om.findStrict("xdc.rov.Program$$lookupDataSymbol", "xdc.rov"), Global.get(cap, "lookupDataSymbol"));
                po.addFxn("lookupFuncName", (Proto.Fxn)om.findStrict("xdc.rov.Program$$lookupFuncName", "xdc.rov"), Global.get(cap, "lookupFuncName"));
                po.addFxn("getSymbolValue", (Proto.Fxn)om.findStrict("xdc.rov.Program$$getSymbolValue", "xdc.rov"), Global.get(cap, "getSymbolValue"));
                po.addFxn("displayError", (Proto.Fxn)om.findStrict("xdc.rov.Program$$displayError", "xdc.rov"), Global.get(cap, "displayError"));
                po.addFxn("ptrToHex", (Proto.Fxn)om.findStrict("xdc.rov.Program$$ptrToHex", "xdc.rov"), Global.get(cap, "ptrToHex"));
                po.addFxn("getShortName", (Proto.Fxn)om.findStrict("xdc.rov.Program$$getShortName", "xdc.rov"), Global.get(cap, "getShortName"));
                po.addFxn("debugPrint", (Proto.Fxn)om.findStrict("xdc.rov.Program$$debugPrint", "xdc.rov"), Global.get(cap, "debugPrint"));
                po.addFxn("timestamp", (Proto.Fxn)om.findStrict("xdc.rov.Program$$timestamp", "xdc.rov"), Global.get(cap, "timestamp"));
                po.addFxn("setTimestampFunc", (Proto.Fxn)om.findStrict("xdc.rov.Program$$setTimestampFunc", "xdc.rov"), Global.get(cap, "setTimestampFunc"));
                po.addFxn("newViewStruct", (Proto.Fxn)om.findStrict("xdc.rov.Program$$newViewStruct", "xdc.rov"), Global.get(cap, "newViewStruct"));
                po.addFxn("getStatusTable", (Proto.Fxn)om.findStrict("xdc.rov.Program$$getStatusTable", "xdc.rov"), Global.get(cap, "getStatusTable"));
                po.addFxn("getModuleDesc", (Proto.Fxn)om.findStrict("xdc.rov.Program$$getModuleDesc", "xdc.rov"), Global.get(cap, "getModuleDesc"));
                po.addFxn("getViewType", (Proto.Fxn)om.findStrict("xdc.rov.Program$$getViewType", "xdc.rov"), Global.get(cap, "getViewType"));
                po.addFxn("getSupportedTabs", (Proto.Fxn)om.findStrict("xdc.rov.Program$$getSupportedTabs", "xdc.rov"), Global.get(cap, "getSupportedTabs"));
                po.addFxn("getAbortFlag", (Proto.Fxn)om.findStrict("xdc.rov.Program$$getAbortFlag", "xdc.rov"), Global.get(cap, "getAbortFlag"));
                po.addFxn("resetMods", (Proto.Fxn)om.findStrict("xdc.rov.Program$$resetMods", "xdc.rov"), Global.get(cap, "resetMods"));
                po.addFxn("setThrowViewErrors", (Proto.Fxn)om.findStrict("xdc.rov.Program$$setThrowViewErrors", "xdc.rov"), Global.get(cap, "setThrowViewErrors"));
                po.addFxn("moduleIdToName", (Proto.Fxn)om.findStrict("xdc.rov.Program$$moduleIdToName", "xdc.rov"), Global.get(cap, "moduleIdToName"));
                po.addFxn("exToString", (Proto.Fxn)om.findStrict("xdc.rov.Program$$exToString", "xdc.rov"), Global.get(cap, "exToString"));
        // struct Program.FetchDesc
        po = (Proto.Obj)om.findStrict("xdc.rov.Program$$FetchDesc", "xdc.rov");
        po.init("xdc.rov.Program.FetchDesc", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("type", $$T_Str, $$UNDEF, "w");
                po.addFld("isScalar", $$T_Bool, $$UNDEF, "w");
        // struct Program.InstDataView
        po = (Proto.Obj)om.findStrict("xdc.rov.Program$$InstDataView", "xdc.rov");
        po.init("xdc.rov.Program.InstDataView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("elements", new Proto.Arr($$T_Obj, false), $$DEFAULT, "w");
        // typedef Program.InstDataViewArr
        om.bind("xdc.rov.Program.InstDataViewArr", new Proto.Arr((Proto)om.findStrict("xdc.rov.Program.InstDataView", "xdc.rov"), false));
        // struct Program.ModDataView
        po = (Proto.Obj)om.findStrict("xdc.rov.Program$$ModDataView", "xdc.rov");
        po.init("xdc.rov.Program.ModDataView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("elements", new Proto.Arr($$T_Obj, false), $$DEFAULT, "w");
        // struct Program.TreeNode
        po = (Proto.Obj)om.findStrict("xdc.rov.Program$$TreeNode", "xdc.rov");
        po.init("xdc.rov.Program.TreeNode", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("children", new Proto.Arr((Proto)om.findStrict("xdc.rov.Program.TreeNode", "xdc.rov"), false), $$DEFAULT, "w");
                po.addFld("properties", new Proto.Arr($$T_Obj, false), $$DEFAULT, "w");
        // typedef Program.TreeNodeArr
        om.bind("xdc.rov.Program.TreeNodeArr", new Proto.Arr((Proto)om.findStrict("xdc.rov.Program.TreeNode", "xdc.rov"), false));
        // struct Program.RawView
        po = (Proto.Obj)om.findStrict("xdc.rov.Program$$RawView", "xdc.rov");
        po.init("xdc.rov.Program.RawView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("modState", $$T_Obj, $$UNDEF, "w");
                po.addFld("instStates", new Proto.Arr($$T_Obj, false), $$DEFAULT, "w");
                po.addFld("modCfg", $$T_Obj, $$UNDEF, "w");
        // struct Program.StatusEntry
        po = (Proto.Obj)om.findStrict("xdc.rov.Program$$StatusEntry", "xdc.rov");
        po.init("xdc.rov.Program.StatusEntry", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("mod", $$T_Str, $$UNDEF, "w");
                po.addFld("tab", $$T_Str, $$UNDEF, "w");
                po.addFld("inst", $$T_Str, $$UNDEF, "w");
                po.addFld("field", $$T_Str, $$UNDEF, "w");
                po.addFld("message", $$T_Str, $$UNDEF, "w");
        // struct Program.Tab
        po = (Proto.Obj)om.findStrict("xdc.rov.Program$$Tab", "xdc.rov");
        po.init("xdc.rov.Program.Tab", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("type", $$T_Str, $$UNDEF, "w");
        // typedef Program.Tabs
        om.bind("xdc.rov.Program.Tabs", new Proto.Arr((Proto)om.findStrict("xdc.rov.Program.Tab", "xdc.rov"), false));
        // struct Program.ROVModuleDesc
        po = (Proto.Obj)om.findStrict("xdc.rov.Program$$ROVModuleDesc", "xdc.rov");
        po.init("xdc.rov.Program.ROVModuleDesc", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("addr", $$T_Obj, $$UNDEF, "w");
                po.addFld("loadFailed", $$T_Bool, $$UNDEF, "w");
                po.addFld("loadFailedMsg", $$T_Str, $$UNDEF, "w");
                po.addFld("cfg", $$T_Obj, $$UNDEF, "w");
                po.addFld("useMod", $$T_Obj, $$UNDEF, "w");
                po.addFld("viewInfo", $$T_Obj, $$UNDEF, "w");
                po.addFld("state", $$T_Obj, $$UNDEF, "w");
                po.addFld("staticInstAddrs", new Proto.Arr($$T_Obj, false), $$DEFAULT, "w");
                po.addFld("dynInstAddrs", new Proto.Arr($$T_Obj, false), $$DEFAULT, "w");
                po.addFld("readAllAddrs", $$T_Bool, $$UNDEF, "w");
                po.addFld("instances", new Proto.Arr(new Proto.Adr("xdc_rov_Program_ROVInstanceDesc*", "PS"), false), $$DEFAULT, "w");
                po.addFld("viewMap", new Proto.Map($$T_Obj), $$DEFAULT, "w");
                po.addFld("errorMap", new Proto.Map($$T_Str), $$DEFAULT, "w");
                po.addFld("error", $$T_Str, $$UNDEF, "w");
                po.addFld("instMap", $$T_Obj, $$UNDEF, "w");
                po.addFld("userPrivate", $$T_Obj, $$UNDEF, "w");
        // struct Program.ROVInstanceDesc
        po = (Proto.Obj)om.findStrict("xdc.rov.Program$$ROVInstanceDesc", "xdc.rov");
        po.init("xdc.rov.Program.ROVInstanceDesc", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("state", $$T_Obj, $$UNDEF, "w");
                po.addFld("addr", $$T_Obj, $$UNDEF, "w");
                po.addFld("viewMap", new Proto.Map($$T_Obj), $$DEFAULT, "w");
                po.addFld("errorMap", new Proto.Map($$T_Str), $$DEFAULT, "w");
                po.addFld("error", $$T_Str, $$UNDEF, "w");
    }

    void StructureDecoder$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/StructureDecoder.xs");
        om.bind("xdc.rov.StructureDecoder$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.StructureDecoder.Module", "xdc.rov");
        po.init("xdc.rov.StructureDecoder.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$create", "xdc.rov"), Global.get("xdc$rov$StructureDecoder$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$construct", "xdc.rov"), Global.get("xdc$rov$StructureDecoder$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.StructureDecoder$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.StructureDecoder$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.rov.StructureDecoder$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.StructureDecoder$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov");
        po.init("xdc.rov.StructureDecoder.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("fetchStruct", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$fetchStruct", "xdc.rov"), Global.get(cap, "fetchStruct"));
                po.addFxn("fetchArray", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$fetchArray", "xdc.rov"), Global.get(cap, "fetchArray"));
                po.addFxn("decodeStruct", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$decodeStruct", "xdc.rov"), Global.get(cap, "decodeStruct"));
                po.addFxn("decodeStructArray", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$decodeStructArray", "xdc.rov"), Global.get(cap, "decodeStructArray"));
                po.addFxn("_parseTypeString", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$_parseTypeString", "xdc.rov"), Global.get(cap, "_parseTypeString"));
                po.addFxn("_decodeField", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$_decodeField", "xdc.rov"), Global.get(cap, "_decodeField"));
                po.addFxn("_decodeArray", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$_decodeArray", "xdc.rov"), Global.get(cap, "_decodeArray"));
                po.addFxn("_decodeScalar", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$_decodeScalar", "xdc.rov"), Global.get(cap, "_decodeScalar"));
        po = (Proto.Obj)om.findStrict("xdc.rov.StructureDecoder$$Params", "xdc.rov");
        po.init("xdc.rov.StructureDecoder.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.StructureDecoder$$Object", "xdc.rov");
        po.init("xdc.rov.StructureDecoder.Object", om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"));
                po.addFxn("fetchStruct", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$fetchStruct", "xdc.rov"), Global.get(cap, "fetchStruct"));
                po.addFxn("fetchArray", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$fetchArray", "xdc.rov"), Global.get(cap, "fetchArray"));
                po.addFxn("decodeStruct", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$decodeStruct", "xdc.rov"), Global.get(cap, "decodeStruct"));
                po.addFxn("decodeStructArray", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$decodeStructArray", "xdc.rov"), Global.get(cap, "decodeStructArray"));
                po.addFxn("_parseTypeString", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$_parseTypeString", "xdc.rov"), Global.get(cap, "_parseTypeString"));
                po.addFxn("_decodeField", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$_decodeField", "xdc.rov"), Global.get(cap, "_decodeField"));
                po.addFxn("_decodeArray", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$_decodeArray", "xdc.rov"), Global.get(cap, "_decodeArray"));
                po.addFxn("_decodeScalar", (Proto.Fxn)om.findStrict("xdc.rov.StructureDecoder$$_decodeScalar", "xdc.rov"), Global.get(cap, "_decodeScalar"));
        // struct StructureDecoder.Buffer
        po = (Proto.Obj)om.findStrict("xdc.rov.StructureDecoder$$Buffer", "xdc.rov");
        po.init("xdc.rov.StructureDecoder.Buffer", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("buffer", $$T_Obj, $$UNDEF, "w");
                po.addFld("addr", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("off", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // struct StructureDecoder.FieldType
        po = (Proto.Obj)om.findStrict("xdc.rov.StructureDecoder$$FieldType", "xdc.rov");
        po.init("xdc.rov.StructureDecoder.FieldType", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("isScalarType", $$T_Bool, $$UNDEF, "w");
                po.addFld("signed", $$T_Bool, $$UNDEF, "w");
                po.addFld("isEnum", $$T_Bool, $$UNDEF, "w");
                po.addFld("isEncoded", $$T_Bool, $$UNDEF, "w");
                po.addFld("size", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("align", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("isAddr", $$T_Bool, $$UNDEF, "w");
                po.addFld("fldType", $$T_Str, $$UNDEF, "w");
                po.addFld("isStrType", $$T_Bool, $$UNDEF, "w");
                po.addFld("strType", $$T_Obj, $$UNDEF, "w");
                po.addFld("isArrType", $$T_Bool, $$UNDEF, "w");
                po.addFld("len", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("elemType", $$T_Str, $$UNDEF, "w");
    }

    void StateReader$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/StateReader.xs");
        om.bind("xdc.rov.StateReader$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.StateReader.Module", "xdc.rov");
        po.init("xdc.rov.StateReader.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$create", "xdc.rov"), Global.get("xdc$rov$StateReader$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$construct", "xdc.rov"), Global.get("xdc$rov$StateReader$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.StateReader$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.StateReader$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.rov.StateReader$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.StateReader$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.StateReader.Instance", "xdc.rov");
        po.init("xdc.rov.StateReader.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("fetchModuleState", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$fetchModuleState", "xdc.rov"), Global.get(cap, "fetchModuleState"));
                po.addFxn("fetchAllInstStates", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$fetchAllInstStates", "xdc.rov"), Global.get(cap, "fetchAllInstStates"));
                po.addFxn("fetchInstState", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$fetchInstState", "xdc.rov"), Global.get(cap, "fetchInstState"));
                po.addFxn("fetchHandleState", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$fetchHandleState", "xdc.rov"), Global.get(cap, "fetchHandleState"));
                po.addFxn("getInstDesc", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$getInstDesc", "xdc.rov"), Global.get(cap, "getInstDesc"));
        po = (Proto.Obj)om.findStrict("xdc.rov.StateReader$$Params", "xdc.rov");
        po.init("xdc.rov.StateReader.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.StateReader$$Object", "xdc.rov");
        po.init("xdc.rov.StateReader.Object", om.findStrict("xdc.rov.StateReader.Instance", "xdc.rov"));
                po.addFxn("fetchModuleState", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$fetchModuleState", "xdc.rov"), Global.get(cap, "fetchModuleState"));
                po.addFxn("fetchAllInstStates", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$fetchAllInstStates", "xdc.rov"), Global.get(cap, "fetchAllInstStates"));
                po.addFxn("fetchInstState", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$fetchInstState", "xdc.rov"), Global.get(cap, "fetchInstState"));
                po.addFxn("fetchHandleState", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$fetchHandleState", "xdc.rov"), Global.get(cap, "fetchHandleState"));
                po.addFxn("getInstDesc", (Proto.Fxn)om.findStrict("xdc.rov.StateReader$$getInstDesc", "xdc.rov"), Global.get(cap, "getInstDesc"));
    }

    void ViewXml$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/ViewXml.xs");
        om.bind("xdc.rov.ViewXml$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.ViewXml.Module", "xdc.rov");
        po.init("xdc.rov.ViewXml.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.ViewXml$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.ViewXml$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.ViewXml$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("processCommand", (Proto.Fxn)om.findStrict("xdc.rov.ViewXml$$processCommand", "xdc.rov"), Global.get(cap, "processCommand"));
                po.addFxn("listModules", (Proto.Fxn)om.findStrict("xdc.rov.ViewXml$$listModules", "xdc.rov"), Global.get(cap, "listModules"));
                po.addFxn("retrieveView", (Proto.Fxn)om.findStrict("xdc.rov.ViewXml$$retrieveView", "xdc.rov"), Global.get(cap, "retrieveView"));
    }

    void ViewInfo$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.rov.ViewInfo.Module", "xdc.rov");
        po.init("xdc.rov.ViewInfo.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.rov.ViewInfo$$create", "xdc.rov"), Global.get("xdc$rov$ViewInfo$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.rov.ViewInfo$$construct", "xdc.rov"), Global.get("xdc$rov$ViewInfo$$construct"));
        po = (Proto.Obj)om.findStrict("xdc.rov.ViewInfo.Instance", "xdc.rov");
        po.init("xdc.rov.ViewInfo.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("viewMap", new Proto.Map((Proto)om.findStrict("xdc.rov.ViewInfo.View", "xdc.rov")), $$DEFAULT, "wh");
        po.addFld("showRawTab", $$T_Bool, true, "wh");
        po.addFld("argsMap", new Proto.Map((Proto)om.findStrict("xdc.rov.ViewInfo.Args", "xdc.rov")), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.rov.ViewInfo$$Params", "xdc.rov");
        po.init("xdc.rov.ViewInfo.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("viewMap", new Proto.Map((Proto)om.findStrict("xdc.rov.ViewInfo.View", "xdc.rov")), $$DEFAULT, "wh");
        po.addFld("showRawTab", $$T_Bool, true, "wh");
        po.addFld("argsMap", new Proto.Map((Proto)om.findStrict("xdc.rov.ViewInfo.Args", "xdc.rov")), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.rov.ViewInfo$$Object", "xdc.rov");
        po.init("xdc.rov.ViewInfo.Object", om.findStrict("xdc.rov.ViewInfo.Instance", "xdc.rov"));
        // struct ViewInfo.Arg
        po = (Proto.Obj)om.findStrict("xdc.rov.ViewInfo$$Arg", "xdc.rov");
        po.init("xdc.rov.ViewInfo.Arg", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("type", $$T_Str, $$UNDEF, "w");
                po.addFld("defaultValue", $$T_Str, $$UNDEF, "w");
        // struct ViewInfo.Args
        po = (Proto.Obj)om.findStrict("xdc.rov.ViewInfo$$Args", "xdc.rov");
        po.init("xdc.rov.ViewInfo.Args", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("description", $$T_Str, $$UNDEF, "w");
                po.addFld("args", new Proto.Arr((Proto)om.findStrict("xdc.rov.ViewInfo.Arg", "xdc.rov"), true), $$DEFAULT, "w");
        // struct ViewInfo.View
        po = (Proto.Obj)om.findStrict("xdc.rov.ViewInfo$$View", "xdc.rov");
        po.init("xdc.rov.ViewInfo.View", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("type", (Proto)om.findStrict("xdc.rov.ViewInfo.ViewType", "xdc.rov"), $$UNDEF, "w");
                po.addFld("viewInitFxn", $$T_Str, $$UNDEF, "w");
                po.addFld("structName", $$T_Str, $$UNDEF, "w");
                po.addFld("argsName", $$T_Str, $$UNDEF, "w");
    }

    void CallStack$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/CallStack.xs");
        om.bind("xdc.rov.CallStack$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.CallStack.Module", "xdc.rov");
        po.init("xdc.rov.CallStack.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.CallStack$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.CallStack$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.CallStack$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("clearRegisters", (Proto.Fxn)om.findStrict("xdc.rov.CallStack$$clearRegisters", "xdc.rov"), Global.get(cap, "clearRegisters"));
                po.addFxn("fetchRegisters", (Proto.Fxn)om.findStrict("xdc.rov.CallStack$$fetchRegisters", "xdc.rov"), Global.get(cap, "fetchRegisters"));
                po.addFxn("getRegister", (Proto.Fxn)om.findStrict("xdc.rov.CallStack$$getRegister", "xdc.rov"), Global.get(cap, "getRegister"));
                po.addFxn("setRegister", (Proto.Fxn)om.findStrict("xdc.rov.CallStack$$setRegister", "xdc.rov"), Global.get(cap, "setRegister"));
                po.addFxn("toText", (Proto.Fxn)om.findStrict("xdc.rov.CallStack$$toText", "xdc.rov"), Global.get(cap, "toText"));
    }

    void ISymbolTable$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.rov.ISymbolTable.Module", "xdc.rov");
        po.init("xdc.rov.ISymbolTable.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov");
        po.init("xdc.rov.ISymbolTable.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.ISymbolTable$$Params", "xdc.rov");
        po.init("xdc.rov.ISymbolTable.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
    }

    void ICallBack$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.rov.ICallBack.Module", "xdc.rov");
        po.init("xdc.rov.ICallBack.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.ICallBack.Instance", "xdc.rov");
        po.init("xdc.rov.ICallBack.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.ICallBack$$Params", "xdc.rov");
        po.init("xdc.rov.ICallBack.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
    }

    void ICallStack$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.rov.ICallStack.Module", "xdc.rov");
        po.init("xdc.rov.ICallStack.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.ICallStack.Instance", "xdc.rov");
        po.init("xdc.rov.ICallStack.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.ICallStack$$Params", "xdc.rov");
        po.init("xdc.rov.ICallStack.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
    }

    void Model$$ROV()
    {
    }

    void Program$$ROV()
    {
    }

    void StructureDecoder$$ROV()
    {
    }

    void StateReader$$ROV()
    {
    }

    void ViewXml$$ROV()
    {
    }

    void ViewInfo$$ROV()
    {
    }

    void CallStack$$ROV()
    {
    }

    void ISymbolTable$$ROV()
    {
    }

    void ICallBack$$ROV()
    {
    }

    void ICallStack$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.rov.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.rov"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.rov", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.rov");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.rov.");
        pkgV.bind("$vers", Global.newArray(1, 0, 1));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.rov'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.rov$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.rov$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.rov$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Model$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.Model", "xdc.rov");
        po = (Proto.Obj)om.findStrict("xdc.rov.Model.Module", "xdc.rov");
        vo.init2(po, "xdc.rov.Model", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.Model$$capsule", "xdc.rov"));
        vo.bind("$package", om.findStrict("xdc.rov", "xdc.rov"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.rov")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.Model$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Model", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Model");
    }

    void Program$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.Program", "xdc.rov");
        po = (Proto.Obj)om.findStrict("xdc.rov.Program.Module", "xdc.rov");
        vo.init2(po, "xdc.rov.Program", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.Program$$capsule", "xdc.rov"));
        vo.bind("$package", om.findStrict("xdc.rov", "xdc.rov"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("FetchDesc", om.findStrict("xdc.rov.Program.FetchDesc", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.Program.FetchDesc", "xdc.rov"));
        vo.bind("InstDataView", om.findStrict("xdc.rov.Program.InstDataView", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.Program.InstDataView", "xdc.rov"));
        vo.bind("InstDataViewArr", om.findStrict("xdc.rov.Program.InstDataViewArr", "xdc.rov"));
        vo.bind("ModDataView", om.findStrict("xdc.rov.Program.ModDataView", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.Program.ModDataView", "xdc.rov"));
        vo.bind("TreeNode", om.findStrict("xdc.rov.Program.TreeNode", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.Program.TreeNode", "xdc.rov"));
        vo.bind("TreeNodeArr", om.findStrict("xdc.rov.Program.TreeNodeArr", "xdc.rov"));
        vo.bind("RawView", om.findStrict("xdc.rov.Program.RawView", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.Program.RawView", "xdc.rov"));
        vo.bind("StatusEntry", om.findStrict("xdc.rov.Program.StatusEntry", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.Program.StatusEntry", "xdc.rov"));
        vo.bind("Tab", om.findStrict("xdc.rov.Program.Tab", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.Program.Tab", "xdc.rov"));
        vo.bind("Tabs", om.findStrict("xdc.rov.Program.Tabs", "xdc.rov"));
        vo.bind("ROVModuleDesc", om.findStrict("xdc.rov.Program.ROVModuleDesc", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.Program.ROVModuleDesc", "xdc.rov"));
        vo.bind("ROVInstanceDesc", om.findStrict("xdc.rov.Program.ROVInstanceDesc", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.Program.ROVInstanceDesc", "xdc.rov"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.rov")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.Program$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Program", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Program");
    }

    void StructureDecoder$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.StructureDecoder", "xdc.rov");
        po = (Proto.Obj)om.findStrict("xdc.rov.StructureDecoder.Module", "xdc.rov");
        vo.init2(po, "xdc.rov.StructureDecoder", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.StructureDecoder$$capsule", "xdc.rov"));
        vo.bind("Instance", om.findStrict("xdc.rov.StructureDecoder.Instance", "xdc.rov"));
        vo.bind("Params", om.findStrict("xdc.rov.StructureDecoder.Params", "xdc.rov"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.StructureDecoder.Params", "xdc.rov")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov", "xdc.rov"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Buffer", om.findStrict("xdc.rov.StructureDecoder.Buffer", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.StructureDecoder.Buffer", "xdc.rov"));
        vo.bind("FieldType", om.findStrict("xdc.rov.StructureDecoder.FieldType", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.StructureDecoder.FieldType", "xdc.rov"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.rov")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.StructureDecoder$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.rov.StructureDecoder.Object", "xdc.rov"));
        pkgV.bind("StructureDecoder", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("StructureDecoder");
    }

    void StateReader$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.StateReader", "xdc.rov");
        po = (Proto.Obj)om.findStrict("xdc.rov.StateReader.Module", "xdc.rov");
        vo.init2(po, "xdc.rov.StateReader", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.StateReader$$capsule", "xdc.rov"));
        vo.bind("Instance", om.findStrict("xdc.rov.StateReader.Instance", "xdc.rov"));
        vo.bind("Params", om.findStrict("xdc.rov.StateReader.Params", "xdc.rov"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.StateReader.Params", "xdc.rov")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov", "xdc.rov"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.rov")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.StateReader$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.rov.StateReader.Object", "xdc.rov"));
        pkgV.bind("StateReader", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("StateReader");
    }

    void ViewXml$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.ViewXml", "xdc.rov");
        po = (Proto.Obj)om.findStrict("xdc.rov.ViewXml.Module", "xdc.rov");
        vo.init2(po, "xdc.rov.ViewXml", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.ViewXml$$capsule", "xdc.rov"));
        vo.bind("$package", om.findStrict("xdc.rov", "xdc.rov"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.rov")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.ViewXml$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("ViewXml", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ViewXml");
    }

    void ViewInfo$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.ViewInfo", "xdc.rov");
        po = (Proto.Obj)om.findStrict("xdc.rov.ViewInfo.Module", "xdc.rov");
        vo.init2(po, "xdc.rov.ViewInfo", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.rov.ViewInfo.Instance", "xdc.rov"));
        vo.bind("Params", om.findStrict("xdc.rov.ViewInfo.Params", "xdc.rov"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.ViewInfo.Params", "xdc.rov")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov", "xdc.rov"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Arg", om.findStrict("xdc.rov.ViewInfo.Arg", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.ViewInfo.Arg", "xdc.rov"));
        vo.bind("Args", om.findStrict("xdc.rov.ViewInfo.Args", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.ViewInfo.Args", "xdc.rov"));
        vo.bind("ViewType", om.findStrict("xdc.rov.ViewInfo.ViewType", "xdc.rov"));
        vo.bind("View", om.findStrict("xdc.rov.ViewInfo.View", "xdc.rov"));
        tdefs.add(om.findStrict("xdc.rov.ViewInfo.View", "xdc.rov"));
        vo.bind("INSTANCE", om.findStrict("xdc.rov.ViewInfo.INSTANCE", "xdc.rov"));
        vo.bind("MODULE", om.findStrict("xdc.rov.ViewInfo.MODULE", "xdc.rov"));
        vo.bind("INSTANCE_DATA", om.findStrict("xdc.rov.ViewInfo.INSTANCE_DATA", "xdc.rov"));
        vo.bind("MODULE_DATA", om.findStrict("xdc.rov.ViewInfo.MODULE_DATA", "xdc.rov"));
        vo.bind("RAW", om.findStrict("xdc.rov.ViewInfo.RAW", "xdc.rov"));
        vo.bind("TREE_TABLE", om.findStrict("xdc.rov.ViewInfo.TREE_TABLE", "xdc.rov"));
        vo.bind("TREE", om.findStrict("xdc.rov.ViewInfo.TREE", "xdc.rov"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.rov")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.ViewInfo$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.rov.ViewInfo.Object", "xdc.rov"));
        pkgV.bind("ViewInfo", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ViewInfo");
    }

    void CallStack$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.CallStack", "xdc.rov");
        po = (Proto.Obj)om.findStrict("xdc.rov.CallStack.Module", "xdc.rov");
        vo.init2(po, "xdc.rov.CallStack", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.CallStack$$capsule", "xdc.rov"));
        vo.bind("$package", om.findStrict("xdc.rov", "xdc.rov"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.rov")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.CallStack$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("CallStack", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("CallStack");
    }

    void ISymbolTable$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.ISymbolTable", "xdc.rov");
        po = (Proto.Obj)om.findStrict("xdc.rov.ISymbolTable.Module", "xdc.rov");
        vo.init2(po, "xdc.rov.ISymbolTable", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov"));
        vo.bind("Params", om.findStrict("xdc.rov.ISymbolTable.Params", "xdc.rov"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.ISymbolTable.Params", "xdc.rov")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov", "xdc.rov"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ISymbolTable", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ISymbolTable");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ICallBack$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.ICallBack", "xdc.rov");
        po = (Proto.Obj)om.findStrict("xdc.rov.ICallBack.Module", "xdc.rov");
        vo.init2(po, "xdc.rov.ICallBack", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.rov.ICallBack.Instance", "xdc.rov"));
        vo.bind("Params", om.findStrict("xdc.rov.ICallBack.Params", "xdc.rov"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.ICallBack.Params", "xdc.rov")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov", "xdc.rov"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ICallBack", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ICallBack");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ICallStack$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.ICallStack", "xdc.rov");
        po = (Proto.Obj)om.findStrict("xdc.rov.ICallStack.Module", "xdc.rov");
        vo.init2(po, "xdc.rov.ICallStack", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.rov.ICallStack.Instance", "xdc.rov"));
        vo.bind("Params", om.findStrict("xdc.rov.ICallStack.Params", "xdc.rov"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.ICallStack.Params", "xdc.rov")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov", "xdc.rov"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ICallStack", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ICallStack");
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
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.Model", "xdc.rov"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.Program", "xdc.rov"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.StructureDecoder", "xdc.rov"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.StateReader", "xdc.rov"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.ViewXml", "xdc.rov"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.ViewInfo", "xdc.rov"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.CallStack", "xdc.rov"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.rov.Model")).bless();
        ((Value.Obj)om.getv("xdc.rov.Program")).bless();
        ((Value.Obj)om.getv("xdc.rov.StructureDecoder")).bless();
        ((Value.Obj)om.getv("xdc.rov.StateReader")).bless();
        ((Value.Obj)om.getv("xdc.rov.ViewXml")).bless();
        ((Value.Obj)om.getv("xdc.rov.ViewInfo")).bless();
        ((Value.Obj)om.getv("xdc.rov.CallStack")).bless();
        ((Value.Obj)om.getv("xdc.rov.ISymbolTable")).bless();
        ((Value.Obj)om.getv("xdc.rov.ICallBack")).bless();
        ((Value.Obj)om.getv("xdc.rov.ICallStack")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.rov")).add(pkgV);
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
        Model$$OBJECTS();
        Program$$OBJECTS();
        StructureDecoder$$OBJECTS();
        StateReader$$OBJECTS();
        ViewXml$$OBJECTS();
        ViewInfo$$OBJECTS();
        CallStack$$OBJECTS();
        ISymbolTable$$OBJECTS();
        ICallBack$$OBJECTS();
        ICallStack$$OBJECTS();
        Model$$CONSTS();
        Program$$CONSTS();
        StructureDecoder$$CONSTS();
        StateReader$$CONSTS();
        ViewXml$$CONSTS();
        ViewInfo$$CONSTS();
        CallStack$$CONSTS();
        ISymbolTable$$CONSTS();
        ICallBack$$CONSTS();
        ICallStack$$CONSTS();
        Model$$CREATES();
        Program$$CREATES();
        StructureDecoder$$CREATES();
        StateReader$$CREATES();
        ViewXml$$CREATES();
        ViewInfo$$CREATES();
        CallStack$$CREATES();
        ISymbolTable$$CREATES();
        ICallBack$$CREATES();
        ICallStack$$CREATES();
        Model$$FUNCTIONS();
        Program$$FUNCTIONS();
        StructureDecoder$$FUNCTIONS();
        StateReader$$FUNCTIONS();
        ViewXml$$FUNCTIONS();
        ViewInfo$$FUNCTIONS();
        CallStack$$FUNCTIONS();
        ISymbolTable$$FUNCTIONS();
        ICallBack$$FUNCTIONS();
        ICallStack$$FUNCTIONS();
        Model$$SIZES();
        Program$$SIZES();
        StructureDecoder$$SIZES();
        StateReader$$SIZES();
        ViewXml$$SIZES();
        ViewInfo$$SIZES();
        CallStack$$SIZES();
        ISymbolTable$$SIZES();
        ICallBack$$SIZES();
        ICallStack$$SIZES();
        Model$$TYPES();
        Program$$TYPES();
        StructureDecoder$$TYPES();
        StateReader$$TYPES();
        ViewXml$$TYPES();
        ViewInfo$$TYPES();
        CallStack$$TYPES();
        ISymbolTable$$TYPES();
        ICallBack$$TYPES();
        ICallStack$$TYPES();
        if (isROV) {
            Model$$ROV();
            Program$$ROV();
            StructureDecoder$$ROV();
            StateReader$$ROV();
            ViewXml$$ROV();
            ViewInfo$$ROV();
            CallStack$$ROV();
            ISymbolTable$$ROV();
            ICallBack$$ROV();
            ICallStack$$ROV();
        }//isROV
        $$SINGLETONS();
        Model$$SINGLETONS();
        Program$$SINGLETONS();
        StructureDecoder$$SINGLETONS();
        StateReader$$SINGLETONS();
        ViewXml$$SINGLETONS();
        ViewInfo$$SINGLETONS();
        CallStack$$SINGLETONS();
        ISymbolTable$$SINGLETONS();
        ICallBack$$SINGLETONS();
        ICallStack$$SINGLETONS();
        $$INITIALIZATION();
    }
}
