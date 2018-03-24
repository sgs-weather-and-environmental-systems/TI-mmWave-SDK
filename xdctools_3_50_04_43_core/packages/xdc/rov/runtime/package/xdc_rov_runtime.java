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

public class xdc_rov_runtime
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
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.rov.runtime.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.rov.runtime", new Value.Obj("xdc.rov.runtime", pkgP));
    }

    void Monitor$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.runtime.Monitor", new Value.Obj("xdc.rov.runtime.Monitor", po));
        pkgV.bind("Monitor", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$ModuleView", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$SectionView", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.SectionView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$SymbolView", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.SymbolView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$VariableView", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.VariableView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$Bits16View", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.Bits16View", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$Bits32View", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.Bits32View", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$UCharView", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.UCharView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$UCharBuffer", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.UCharBuffer", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$Bits16Buffer", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.Bits16Buffer", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$Bits32Buffer", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.Bits32Buffer", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.runtime.Monitor$$MonState", new Proto.Obj());
        om.bind("xdc.rov.runtime.Monitor.MonState", new Proto.Str(spo, false));
    }

    void Monitor$$CONSTS()
    {
        // module Monitor
    }

    void Monitor$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Monitor$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Monitor$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.rov.runtime.Monitor.UCharBuffer", "xdc.rov.runtime");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UChar"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.runtime.Monitor.UCharBuffer']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.runtime.Monitor.UCharBuffer']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.runtime.Monitor.UCharBuffer'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.runtime.Monitor.Bits16Buffer", "xdc.rov.runtime");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UInt16"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.runtime.Monitor.Bits16Buffer']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.runtime.Monitor.Bits16Buffer']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.runtime.Monitor.Bits16Buffer'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.runtime.Monitor.Bits32Buffer", "xdc.rov.runtime");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.runtime.Monitor.Bits32Buffer']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.runtime.Monitor.Bits32Buffer']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.runtime.Monitor.Bits32Buffer'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.runtime.Monitor.MonState", "xdc.rov.runtime");
        sizes.clear();
        sizes.add(Global.newArray("buffer", "UPtr"));
        sizes.add(Global.newArray("read", "UFxn"));
        sizes.add(Global.newArray("write", "UFxn"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.runtime.Monitor.MonState']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.runtime.Monitor.MonState']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.runtime.Monitor.MonState'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Monitor$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/runtime/Monitor.xs");
        om.bind("xdc.rov.runtime.Monitor$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor.Module", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.rov.runtime"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "xdc.rov.runtime"), $$UNDEF, "wh");
            po.addFld("MAXCMDSIZE", Proto.Elm.newCNum("(xdc_Int)"), 128L, "w");
            po.addFld("STATEADDR", new Proto.Adr("xdc_Ptr", "Pv"), "&monObject", "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.rov.runtime.Monitor$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.rov.runtime.Monitor$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.rov.runtime.Monitor$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.rov.runtime.Monitor$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Monitor.ModuleView
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$ModuleView", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("command", $$T_Str, $$UNDEF, "w");
                po.addFld("readFxn", $$T_Str, $$UNDEF, "w");
                po.addFld("writeFxn", $$T_Str, $$UNDEF, "w");
        // struct Monitor.SectionView
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$SectionView", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.SectionView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("start", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("end", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("len", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("gap", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("kind", $$T_Str, $$UNDEF, "w");
                po.addFld("startSym", $$T_Str, $$UNDEF, "w");
        // struct Monitor.SymbolView
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$SymbolView", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.SymbolView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("addr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("type", $$T_Str, $$UNDEF, "w");
        // struct Monitor.VariableView
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$VariableView", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.VariableView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("character", $$T_Str, $$UNDEF, "w");
                po.addFld("int8_t", $$T_Str, $$UNDEF, "w");
                po.addFld("int16_t", $$T_Str, $$UNDEF, "w");
                po.addFld("int32_t", $$T_Str, $$UNDEF, "w");
                po.addFld("uint8_t", $$T_Str, $$UNDEF, "w");
                po.addFld("uint16_t", $$T_Str, $$UNDEF, "w");
                po.addFld("uint32_t", $$T_Str, $$UNDEF, "w");
        // struct Monitor.Bits16View
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$Bits16View", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.Bits16View", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("addr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("word0", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("word1", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("word2", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("word3", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("word4", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("word5", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("word6", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("word7", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
        // struct Monitor.Bits32View
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$Bits32View", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.Bits32View", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("addr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("word0", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("word1", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("word2", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("word3", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
        // struct Monitor.UCharView
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$UCharView", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.UCharView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("addr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("byte0", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "w");
                po.addFld("byte1", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "w");
                po.addFld("byte2", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "w");
                po.addFld("byte3", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "w");
                po.addFld("byte4", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "w");
                po.addFld("byte5", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "w");
                po.addFld("byte6", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "w");
                po.addFld("byte7", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "w");
        // struct Monitor.UCharBuffer
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$UCharBuffer", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.UCharBuffer", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "w");
        // struct Monitor.Bits16Buffer
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$Bits16Buffer", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.Bits16Buffer", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
        // struct Monitor.Bits32Buffer
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$Bits32Buffer", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.Bits32Buffer", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
        // struct Monitor.MonState
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$MonState", "xdc.rov.runtime");
        po.init("xdc.rov.runtime.Monitor.MonState", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("buffer", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("read", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF, "w");
                po.addFld("write", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF, "w");
    }

    void Monitor$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.runtime.Monitor", "xdc.rov.runtime");
        vo.bind("UCharBuffer$fetchDesc", Global.newObject("type", "xdc.rov.runtime.Monitor.UCharBuffer", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$UCharBuffer", "xdc.rov.runtime");
        vo.bind("Bits16Buffer$fetchDesc", Global.newObject("type", "xdc.rov.runtime.Monitor.Bits16Buffer", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$Bits16Buffer", "xdc.rov.runtime");
        vo.bind("Bits32Buffer$fetchDesc", Global.newObject("type", "xdc.rov.runtime.Monitor.Bits32Buffer", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$Bits32Buffer", "xdc.rov.runtime");
        vo.bind("MonState$fetchDesc", Global.newObject("type", "xdc.rov.runtime.Monitor.MonState", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor$$MonState", "xdc.rov.runtime");
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.rov.runtime.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.rov.runtime"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/rov/runtime/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "xdc.rov.runtime"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "xdc.rov.runtime"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "xdc.rov.runtime"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "xdc.rov.runtime"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "xdc.rov.runtime"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "xdc.rov.runtime"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "xdc.rov.runtime", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.rov.runtime");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.rov.runtime.");
        pkgV.bind("$vers", Global.newArray());
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.rov.runtime'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.rov.runtime$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.rov.runtime$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.rov.runtime$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/xdc.rov.runtime.am4g',\n");
            sb.append("'lib/xdc.rov.runtime.aem4',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/xdc.rov.runtime.am4g', {target: 'gnu.targets.arm.M4', suffix: 'm4g'}],\n");
            sb.append("['lib/xdc.rov.runtime.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Monitor$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.runtime.Monitor", "xdc.rov.runtime");
        po = (Proto.Obj)om.findStrict("xdc.rov.runtime.Monitor.Module", "xdc.rov.runtime");
        vo.init2(po, "xdc.rov.runtime.Monitor", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.rov.runtime.Monitor$$capsule", "xdc.rov.runtime"));
        vo.bind("$package", om.findStrict("xdc.rov.runtime", "xdc.rov.runtime"));
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
        vo.bind("ModuleView", om.findStrict("xdc.rov.runtime.Monitor.ModuleView", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.ModuleView", "xdc.rov.runtime"));
        vo.bind("SectionView", om.findStrict("xdc.rov.runtime.Monitor.SectionView", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.SectionView", "xdc.rov.runtime"));
        vo.bind("SymbolView", om.findStrict("xdc.rov.runtime.Monitor.SymbolView", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.SymbolView", "xdc.rov.runtime"));
        vo.bind("VariableView", om.findStrict("xdc.rov.runtime.Monitor.VariableView", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.VariableView", "xdc.rov.runtime"));
        vo.bind("Bits16View", om.findStrict("xdc.rov.runtime.Monitor.Bits16View", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.Bits16View", "xdc.rov.runtime"));
        vo.bind("Bits32View", om.findStrict("xdc.rov.runtime.Monitor.Bits32View", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.Bits32View", "xdc.rov.runtime"));
        vo.bind("UCharView", om.findStrict("xdc.rov.runtime.Monitor.UCharView", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.UCharView", "xdc.rov.runtime"));
        vo.bind("UCharBuffer", om.findStrict("xdc.rov.runtime.Monitor.UCharBuffer", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.UCharBuffer", "xdc.rov.runtime"));
        vo.bind("Bits16Buffer", om.findStrict("xdc.rov.runtime.Monitor.Bits16Buffer", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.Bits16Buffer", "xdc.rov.runtime"));
        vo.bind("Bits32Buffer", om.findStrict("xdc.rov.runtime.Monitor.Bits32Buffer", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.Bits32Buffer", "xdc.rov.runtime"));
        mcfgs.add("MAXCMDSIZE");
        mcfgs.add("STATEADDR");
        vo.bind("MonState", om.findStrict("xdc.rov.runtime.Monitor.MonState", "xdc.rov.runtime"));
        tdefs.add(om.findStrict("xdc.rov.runtime.Monitor.MonState", "xdc.rov.runtime"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.rov.runtime")).add(vo);
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
        vo.bind("$$fxntab", Global.newArray("xdc_rov_runtime_Monitor_Module__startupDone__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Monitor", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Monitor");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.runtime.Monitor", "xdc.rov.runtime"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("xdc.rov.runtime.Monitor", "xdc.rov.runtime");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("argsMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"VariableNameOrAddr", Global.newObject("description", "Variable Name/Address", "args", Global.newArray(new Object[]{Global.newObject("name", "name/addr", "type", "number", "defaultValue", "0"), Global.newObject("name", "check", "type", "boolean", "defaultValue", "true")}))}), Global.newArray(new Object[]{"ReadMemory", Global.newObject("description", "Read Memory", "args", Global.newArray(new Object[]{Global.newObject("name", "addr", "type", "number", "defaultValue", "0"), Global.newObject("name", "length", "type", "number", "defaultValue", "0"), Global.newObject("name", "check", "type", "boolean", "defaultValue", "true")}))}), Global.newArray(new Object[]{"FindSymbols", Global.newObject("description", "Find Symbols", "args", Global.newArray(new Object[]{Global.newObject("name", "addr", "type", "number", "defaultValue", "0"), Global.newObject("name", "radius", "type", "number", "defaultValue", "0"), Global.newObject("name", "check", "type", "boolean", "defaultValue", "true")}))})}), "viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")}), Global.newArray(new Object[]{"Variable", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitVariable", "structName", "VariableView", "argsName", "VariableNameOrAddr")}), Global.newArray(new Object[]{"UChar", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitUChar", "structName", "UCharView", "argsName", "ReadMemory")}), Global.newArray(new Object[]{"Bits16", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitBits16", "structName", "Bits16View", "argsName", "ReadMemory")}), Global.newArray(new Object[]{"Bits32", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitBits32", "structName", "Bits32View", "argsName", "ReadMemory")}), Global.newArray(new Object[]{"Sections", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitSections", "structName", "SectionView")}), Global.newArray(new Object[]{"Symbols", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitSymbols", "structName", "SymbolView", "argsName", "FindSymbols")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.rov.runtime.Monitor")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.rov.runtime")).add(pkgV);
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
        Monitor$$OBJECTS();
        Monitor$$CONSTS();
        Monitor$$CREATES();
        Monitor$$FUNCTIONS();
        Monitor$$SIZES();
        Monitor$$TYPES();
        if (isROV) {
            Monitor$$ROV();
        }//isROV
        $$SINGLETONS();
        Monitor$$SINGLETONS();
        $$INITIALIZATION();
    }
}
