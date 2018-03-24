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

public class xdc_rov_dss
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
        Global.callFxn("loadPackage", xdcO, "ti.dss");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.rov.dss.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.rov.dss", new Value.Obj("xdc.rov.dss", pkgP));
    }

    void SymbolTable$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.dss.SymbolTable.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.dss.SymbolTable", new Value.Obj("xdc.rov.dss.SymbolTable", po));
        pkgV.bind("SymbolTable", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.rov.dss.SymbolTable.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.dss.SymbolTable$$Object", new Proto.Obj());
        om.bind("xdc.rov.dss.SymbolTable.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.dss.SymbolTable$$Params", new Proto.Obj());
        om.bind("xdc.rov.dss.SymbolTable.Params", new Proto.Str(po, true));
    }

    void CallBack$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.dss.CallBack.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.dss.CallBack", new Value.Obj("xdc.rov.dss.CallBack", po));
        pkgV.bind("CallBack", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.rov.dss.CallBack.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.rov.dss.CallBack$$Object", new Proto.Obj());
        om.bind("xdc.rov.dss.CallBack.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.rov.dss.CallBack$$Params", new Proto.Obj());
        om.bind("xdc.rov.dss.CallBack.Params", new Proto.Str(po, true));
    }

    void SymbolTable$$CONSTS()
    {
        // module SymbolTable
    }

    void CallBack$$CONSTS()
    {
        // module CallBack
    }

    void SymbolTable$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.rov.dss.SymbolTable$$create", new Proto.Fxn(om.findStrict("xdc.rov.dss.SymbolTable.Module", "xdc.rov.dss"), om.findStrict("xdc.rov.dss.SymbolTable.Instance", "xdc.rov.dss"), 2, 1, false));
                fxn.addArg(0, "session", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.rov.dss.SymbolTable.Params", "xdc.rov.dss"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$dss$SymbolTable$$create = function( session, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.dss.SymbolTable'];\n");
            sb.append("var __inst = xdc.om['xdc.rov.dss.SymbolTable.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.rov.dss']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {session:session});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [session]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.rov.dss.SymbolTable$$construct", new Proto.Fxn(om.findStrict("xdc.rov.dss.SymbolTable.Module", "xdc.rov.dss"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.rov.dss.SymbolTable$$Object", "xdc.rov.dss"), null);
                fxn.addArg(1, "session", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.rov.dss.SymbolTable.Params", "xdc.rov.dss"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$dss$SymbolTable$$construct = function( __obj, session, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.dss.SymbolTable'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {session:session});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void CallBack$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.rov.dss.CallBack$$create", new Proto.Fxn(om.findStrict("xdc.rov.dss.CallBack.Module", "xdc.rov.dss"), om.findStrict("xdc.rov.dss.CallBack.Instance", "xdc.rov.dss"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.rov.dss.CallBack.Params", "xdc.rov.dss"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$dss$CallBack$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.dss.CallBack'];\n");
            sb.append("var __inst = xdc.om['xdc.rov.dss.CallBack.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.rov.dss']);\n");
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
        fxn = (Proto.Fxn)om.bind("xdc.rov.dss.CallBack$$construct", new Proto.Fxn(om.findStrict("xdc.rov.dss.CallBack.Module", "xdc.rov.dss"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.rov.dss.CallBack$$Object", "xdc.rov.dss"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.rov.dss.CallBack.Params", "xdc.rov.dss"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$rov$dss$CallBack$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.rov.dss.CallBack'];\n");
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

    void SymbolTable$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void CallBack$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SymbolTable$$SIZES()
    {
    }

    void CallBack$$SIZES()
    {
    }

    void SymbolTable$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/dss/SymbolTable.xs");
        om.bind("xdc.rov.dss.SymbolTable$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.dss.SymbolTable.Module", "xdc.rov.dss");
        po.init("xdc.rov.dss.SymbolTable.Module", om.findStrict("xdc.rov.ISymbolTable.Module", "xdc.rov.dss"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.rov.dss.SymbolTable$$create", "xdc.rov.dss"), Global.get("xdc$rov$dss$SymbolTable$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.rov.dss.SymbolTable$$construct", "xdc.rov.dss"), Global.get("xdc$rov$dss$SymbolTable$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.dss.SymbolTable$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.dss.SymbolTable$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.rov.dss.SymbolTable$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.dss.SymbolTable$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.dss.SymbolTable.Instance", "xdc.rov.dss");
        po.init("xdc.rov.dss.SymbolTable.Instance", om.findStrict("xdc.rov.ISymbolTable.Instance", "xdc.rov.dss"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                fxn = Global.get(cap, "getSymbolValue");
                if (fxn != null) po.addFxn("getSymbolValue", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getSymbolValue", "xdc.rov.dss"), fxn);
                fxn = Global.get(cap, "lookupDataSymbol");
                if (fxn != null) po.addFxn("lookupDataSymbol", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$lookupDataSymbol", "xdc.rov.dss"), fxn);
                fxn = Global.get(cap, "lookupFuncName");
                if (fxn != null) po.addFxn("lookupFuncName", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$lookupFuncName", "xdc.rov.dss"), fxn);
                fxn = Global.get(cap, "getISA");
                if (fxn != null) po.addFxn("getISA", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getISA", "xdc.rov.dss"), fxn);
                fxn = Global.get(cap, "getJavaImp");
                if (fxn != null) po.addFxn("getJavaImp", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getJavaImp", "xdc.rov.dss"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.dss.SymbolTable$$Params", "xdc.rov.dss");
        po.init("xdc.rov.dss.SymbolTable.Params", om.findStrict("xdc.rov.ISymbolTable$$Params", "xdc.rov.dss"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.dss.SymbolTable$$Object", "xdc.rov.dss");
        po.init("xdc.rov.dss.SymbolTable.Object", om.findStrict("xdc.rov.dss.SymbolTable.Instance", "xdc.rov.dss"));
                fxn = Global.get(cap, "getSymbolValue");
                if (fxn != null) po.addFxn("getSymbolValue", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getSymbolValue", "xdc.rov.dss"), fxn);
                fxn = Global.get(cap, "lookupDataSymbol");
                if (fxn != null) po.addFxn("lookupDataSymbol", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$lookupDataSymbol", "xdc.rov.dss"), fxn);
                fxn = Global.get(cap, "lookupFuncName");
                if (fxn != null) po.addFxn("lookupFuncName", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$lookupFuncName", "xdc.rov.dss"), fxn);
                fxn = Global.get(cap, "getISA");
                if (fxn != null) po.addFxn("getISA", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getISA", "xdc.rov.dss"), fxn);
                fxn = Global.get(cap, "getJavaImp");
                if (fxn != null) po.addFxn("getJavaImp", (Proto.Fxn)om.findStrict("xdc.rov.ISymbolTable$$getJavaImp", "xdc.rov.dss"), fxn);
    }

    void CallBack$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/dss/CallBack.xs");
        om.bind("xdc.rov.dss.CallBack$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.dss.CallBack.Module", "xdc.rov.dss");
        po.init("xdc.rov.dss.CallBack.Module", om.findStrict("xdc.rov.ICallBack.Module", "xdc.rov.dss"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.rov.dss.CallBack$$create", "xdc.rov.dss"), Global.get("xdc$rov$dss$CallBack$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.rov.dss.CallBack$$construct", "xdc.rov.dss"), Global.get("xdc$rov$dss$CallBack$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.dss.CallBack$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.dss.CallBack$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.rov.dss.CallBack$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.dss.CallBack$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.dss.CallBack.Instance", "xdc.rov.dss");
        po.init("xdc.rov.dss.CallBack.Instance", om.findStrict("xdc.rov.ICallBack.Instance", "xdc.rov.dss"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                fxn = Global.get(cap, "updateStartupProgress");
                if (fxn != null) po.addFxn("updateStartupProgress", (Proto.Fxn)om.findStrict("xdc.rov.ICallBack$$updateStartupProgress", "xdc.rov.dss"), fxn);
                fxn = Global.get(cap, "getAbortFlag");
                if (fxn != null) po.addFxn("getAbortFlag", (Proto.Fxn)om.findStrict("xdc.rov.ICallBack$$getAbortFlag", "xdc.rov.dss"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.rov.dss.CallBack$$Params", "xdc.rov.dss");
        po.init("xdc.rov.dss.CallBack.Params", om.findStrict("xdc.rov.ICallBack$$Params", "xdc.rov.dss"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.rov.dss.CallBack$$Object", "xdc.rov.dss");
        po.init("xdc.rov.dss.CallBack.Object", om.findStrict("xdc.rov.dss.CallBack.Instance", "xdc.rov.dss"));
                fxn = Global.get(cap, "updateStartupProgress");
                if (fxn != null) po.addFxn("updateStartupProgress", (Proto.Fxn)om.findStrict("xdc.rov.ICallBack$$updateStartupProgress", "xdc.rov.dss"), fxn);
                fxn = Global.get(cap, "getAbortFlag");
                if (fxn != null) po.addFxn("getAbortFlag", (Proto.Fxn)om.findStrict("xdc.rov.ICallBack$$getAbortFlag", "xdc.rov.dss"), fxn);
    }

    void SymbolTable$$ROV()
    {
    }

    void CallBack$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.rov.dss.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.rov.dss"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.rov.dss", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.rov.dss");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.rov.dss.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.rov", Global.newArray()));
        imports.add(Global.newArray("xdc.rta", Global.newArray()));
        imports.add(Global.newArray("ti.dss", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.rov.dss'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.rov.dss$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.rov.dss$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.rov.dss$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void SymbolTable$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.dss.SymbolTable", "xdc.rov.dss");
        po = (Proto.Obj)om.findStrict("xdc.rov.dss.SymbolTable.Module", "xdc.rov.dss");
        vo.init2(po, "xdc.rov.dss.SymbolTable", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.dss.SymbolTable$$capsule", "xdc.rov.dss"));
        vo.bind("Instance", om.findStrict("xdc.rov.dss.SymbolTable.Instance", "xdc.rov.dss"));
        vo.bind("Params", om.findStrict("xdc.rov.dss.SymbolTable.Params", "xdc.rov.dss"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.dss.SymbolTable.Params", "xdc.rov.dss")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov.dss", "xdc.rov.dss"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.rov.dss")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.dss.SymbolTable$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.rov.dss.SymbolTable.Object", "xdc.rov.dss"));
        pkgV.bind("SymbolTable", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SymbolTable");
    }

    void CallBack$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.dss.CallBack", "xdc.rov.dss");
        po = (Proto.Obj)om.findStrict("xdc.rov.dss.CallBack.Module", "xdc.rov.dss");
        vo.init2(po, "xdc.rov.dss.CallBack", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.dss.CallBack$$capsule", "xdc.rov.dss"));
        vo.bind("Instance", om.findStrict("xdc.rov.dss.CallBack.Instance", "xdc.rov.dss"));
        vo.bind("Params", om.findStrict("xdc.rov.dss.CallBack.Params", "xdc.rov.dss"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.rov.dss.CallBack.Params", "xdc.rov.dss")).newInstance());
        vo.bind("$package", om.findStrict("xdc.rov.dss", "xdc.rov.dss"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.rov.dss")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.rov.dss.CallBack$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.rov.dss.CallBack.Object", "xdc.rov.dss"));
        pkgV.bind("CallBack", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("CallBack");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.dss.SymbolTable", "xdc.rov.dss"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.dss.CallBack", "xdc.rov.dss"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.rov.dss.SymbolTable")).bless();
        ((Value.Obj)om.getv("xdc.rov.dss.CallBack")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.rov.dss")).add(pkgV);
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
        SymbolTable$$OBJECTS();
        CallBack$$OBJECTS();
        SymbolTable$$CONSTS();
        CallBack$$CONSTS();
        SymbolTable$$CREATES();
        CallBack$$CREATES();
        SymbolTable$$FUNCTIONS();
        CallBack$$FUNCTIONS();
        SymbolTable$$SIZES();
        CallBack$$SIZES();
        SymbolTable$$TYPES();
        CallBack$$TYPES();
        if (isROV) {
            SymbolTable$$ROV();
            CallBack$$ROV();
        }//isROV
        $$SINGLETONS();
        SymbolTable$$SINGLETONS();
        CallBack$$SINGLETONS();
        $$INITIALIZATION();
    }
}
