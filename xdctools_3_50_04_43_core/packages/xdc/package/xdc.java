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

public class xdc
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
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc", new Value.Obj("xdc", pkgP));
    }

    void Warnings$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.Warnings.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.Warnings", new Value.Obj("xdc.Warnings", po));
        pkgV.bind("Warnings", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.Warnings$$Warning", new Proto.Obj());
        om.bind("xdc.Warnings.Warning", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.Warnings$$WarningParams", new Proto.Obj());
        om.bind("xdc.Warnings.WarningParams", new Proto.Str(spo, true));
    }

    void IPackage$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.IPackage.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.IPackage", new Value.Obj("xdc.IPackage", po));
        pkgV.bind("IPackage", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.IPackage$$LibDesc", new Proto.Obj());
        om.bind("xdc.IPackage.LibDesc", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.IPackage$$BuildAttrs", new Proto.Obj());
        om.bind("xdc.IPackage.BuildAttrs", new Proto.Str(spo, true));
    }

    void Warnings$$CONSTS()
    {
        // module Warnings
        om.bind("xdc.Warnings.LOGID", Global.newObject("id", 4L, "msg", "Two events with the same id: %s and %s share the msg: '%s'. You must reconfigure the message of one of these events to ensure its id will be unique."));
    }

    void IPackage$$CONSTS()
    {
        // interface IPackage
    }

    void Warnings$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IPackage$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Warnings$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Warnings.disable
        fxn = (Proto.Fxn)om.bind("xdc.Warnings$$disable", new Proto.Fxn(om.findStrict("xdc.Warnings.Module", "xdc"), null, 1, 1, false));
                fxn.addArg(0, "ids", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn Warnings.getMessage
        fxn = (Proto.Fxn)om.bind("xdc.Warnings$$getMessage", new Proto.Fxn(om.findStrict("xdc.Warnings.Module", "xdc"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "prms", (Proto)om.findStrict("xdc.Warnings.WarningParams", "xdc"), $$DEFAULT);
    }

    void IPackage$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn IPackage.init
        fxn = (Proto.Fxn)om.bind("xdc.IPackage$$init", new Proto.Fxn(om.findStrict("xdc.IPackage.Module", "xdc"), null, 0, -1, false));
        // fxn IPackage.close
        fxn = (Proto.Fxn)om.bind("xdc.IPackage$$close", new Proto.Fxn(om.findStrict("xdc.IPackage.Module", "xdc"), null, 0, -1, false));
        // fxn IPackage.validate
        fxn = (Proto.Fxn)om.bind("xdc.IPackage$$validate", new Proto.Fxn(om.findStrict("xdc.IPackage.Module", "xdc"), null, 0, -1, false));
        // fxn IPackage.exit
        fxn = (Proto.Fxn)om.bind("xdc.IPackage$$exit", new Proto.Fxn(om.findStrict("xdc.IPackage.Module", "xdc"), null, 0, -1, false));
        // fxn IPackage.getLibs
        fxn = (Proto.Fxn)om.bind("xdc.IPackage$$getLibs", new Proto.Fxn(om.findStrict("xdc.IPackage.Module", "xdc"), null, 0, -1, false));
        // fxn IPackage.getSects
        fxn = (Proto.Fxn)om.bind("xdc.IPackage$$getSects", new Proto.Fxn(om.findStrict("xdc.IPackage.Module", "xdc"), null, 0, -1, false));
    }

    void Warnings$$SIZES()
    {
    }

    void IPackage$$SIZES()
    {
    }

    void Warnings$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/Warnings.xs");
        om.bind("xdc.Warnings$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.Warnings.Module", "xdc");
        po.init("xdc.Warnings.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("LOGID", (Proto)om.findStrict("xdc.Warnings.Warning", "xdc"), Global.newObject("id", 4L, "msg", "Two events with the same id: %s and %s share the msg: '%s'. You must reconfigure the message of one of these events to ensure its id will be unique."), "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.Warnings$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.Warnings$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.Warnings$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("disable", (Proto.Fxn)om.findStrict("xdc.Warnings$$disable", "xdc"), Global.get(cap, "disable"));
                po.addFxn("getMessage", (Proto.Fxn)om.findStrict("xdc.Warnings$$getMessage", "xdc"), Global.get(cap, "getMessage"));
        // typedef Warnings.StringArray
        om.bind("xdc.Warnings.StringArray", new Proto.Arr($$T_Str, false));
        // struct Warnings.Warning
        po = (Proto.Obj)om.findStrict("xdc.Warnings$$Warning", "xdc");
        po.init("xdc.Warnings.Warning", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("msg", $$T_Str, $$UNDEF, "w");
        // struct Warnings.WarningParams
        po = (Proto.Obj)om.findStrict("xdc.Warnings$$WarningParams", "xdc");
        po.init("xdc.Warnings.WarningParams", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("warning", (Proto)om.findStrict("xdc.Warnings.Warning", "xdc"), $$DEFAULT, "w");
                po.addFld("args", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
    }

    void IPackage$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/IPackage.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc");
        po.init("xdc.IPackage.Module", $$Package);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("packageBase", $$T_Str, $$UNDEF, "wh");
        po.addFld("packageRepository", $$T_Str, $$UNDEF, "wh");
        po.addFld("build", (Proto)om.findStrict("xdc.IPackage.BuildAttrs", "xdc"), $$DEFAULT, "wh");
        po.addFld("profile", $$T_Str, $$UNDEF, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.IPackage$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.IPackage$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.IPackage$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "init");
                if (fxn != null) po.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "xdc"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) po.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "xdc"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) po.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "xdc"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) po.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "xdc"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) po.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "xdc"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) po.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "xdc"), fxn);
        // struct IPackage.LibDesc
        po = (Proto.Obj)om.findStrict("xdc.IPackage$$LibDesc", "xdc");
        po.init("xdc.IPackage.LibDesc", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("target", $$T_Str, $$UNDEF, "w");
                po.addFld("suffix", $$T_Str, $$UNDEF, "w");
        // struct IPackage.BuildAttrs
        po = (Proto.Obj)om.findStrict("xdc.IPackage$$BuildAttrs", "xdc");
        po.init("xdc.IPackage.BuildAttrs", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("libraries", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("libDesc", new Proto.Map((Proto)om.findStrict("xdc.IPackage.LibDesc", "xdc")), $$DEFAULT, "w");
                po.addFld("getLibs", $$T_Obj, $$UNDEF, "w");
    }

    void Warnings$$ROV()
    {
    }

    void IPackage$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "xdc"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "xdc"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "xdc"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "xdc"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "xdc"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "xdc"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "xdc", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.");
        pkgV.bind("$vers", Global.newArray(1, 1, 1));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Warnings$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.Warnings", "xdc");
        po = (Proto.Obj)om.findStrict("xdc.Warnings.Module", "xdc");
        vo.init2(po, "xdc.Warnings", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.Warnings$$capsule", "xdc"));
        vo.bind("$package", om.findStrict("xdc", "xdc"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("StringArray", om.findStrict("xdc.Warnings.StringArray", "xdc"));
        vo.bind("Warning", om.findStrict("xdc.Warnings.Warning", "xdc"));
        tdefs.add(om.findStrict("xdc.Warnings.Warning", "xdc"));
        vo.bind("WarningParams", om.findStrict("xdc.Warnings.WarningParams", "xdc"));
        tdefs.add(om.findStrict("xdc.Warnings.WarningParams", "xdc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.Warnings$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Warnings", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Warnings");
    }

    void IPackage$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.IPackage", "xdc");
        po = (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc");
        vo.init2(po, "xdc.IPackage", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.IPackage$$capsule", "xdc"));
        vo.bind("$package", om.findStrict("xdc", "xdc"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("LibDesc", om.findStrict("xdc.IPackage.LibDesc", "xdc"));
        tdefs.add(om.findStrict("xdc.IPackage.LibDesc", "xdc"));
        vo.bind("BuildAttrs", om.findStrict("xdc.IPackage.BuildAttrs", "xdc"));
        tdefs.add(om.findStrict("xdc.IPackage.BuildAttrs", "xdc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IPackage", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IPackage");
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
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.Warnings", "xdc"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.Warnings")).bless();
        ((Value.Obj)om.getv("xdc.IPackage")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc")).add(pkgV);
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
        Warnings$$OBJECTS();
        IPackage$$OBJECTS();
        Warnings$$CONSTS();
        IPackage$$CONSTS();
        Warnings$$CREATES();
        IPackage$$CREATES();
        Warnings$$FUNCTIONS();
        IPackage$$FUNCTIONS();
        Warnings$$SIZES();
        IPackage$$SIZES();
        Warnings$$TYPES();
        IPackage$$TYPES();
        if (isROV) {
            Warnings$$ROV();
            IPackage$$ROV();
        }//isROV
        $$SINGLETONS();
        Warnings$$SINGLETONS();
        IPackage$$SINGLETONS();
        $$INITIALIZATION();
    }
}
