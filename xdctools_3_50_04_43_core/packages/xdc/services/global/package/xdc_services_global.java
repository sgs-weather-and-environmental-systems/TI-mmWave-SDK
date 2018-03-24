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

public class xdc_services_global
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
        pkgP = (Proto.Obj)om.bind("xdc.services.global.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.services.global", new Value.Obj("xdc.services.global", pkgP));
    }

    void Clock$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.services.global.Clock.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.services.global.Clock", new Value.Obj("xdc.services.global.Clock", po));
        pkgV.bind("Clock", vo);
        // decls 
    }

    void Trace$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.services.global.Trace.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.services.global.Trace", new Value.Obj("xdc.services.global.Trace", po));
        pkgV.bind("Trace", vo);
        // decls 
    }

    void Clock$$CONSTS()
    {
        // module Clock
    }

    void Trace$$CONSTS()
    {
        // module Trace
    }

    void Clock$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Trace$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Clock$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Clock.getElapsedTime
        fxn = (Proto.Fxn)om.bind("xdc.services.global.Clock$$getElapsedTime", new Proto.Fxn(om.findStrict("xdc.services.global.Clock.Module", "xdc.services.global"), null, 0, -1, false));
        // fxn Clock.print
        fxn = (Proto.Fxn)om.bind("xdc.services.global.Clock$$print", new Proto.Fxn(om.findStrict("xdc.services.global.Clock.Module", "xdc.services.global"), null, 1, 1, false));
                fxn.addArg(0, "msg", $$T_Str, $$UNDEF);
        // fxn Clock.reset
        fxn = (Proto.Fxn)om.bind("xdc.services.global.Clock$$reset", new Proto.Fxn(om.findStrict("xdc.services.global.Clock.Module", "xdc.services.global"), null, 0, 0, false));
    }

    void Trace$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Trace.addSupergroup
        fxn = (Proto.Fxn)om.bind("xdc.services.global.Trace$$addSupergroup", new Proto.Fxn(om.findStrict("xdc.services.global.Trace.Module", "xdc.services.global"), null, 2, 2, false));
                fxn.addArg(0, "supergroup", $$T_Str, $$UNDEF);
                fxn.addArg(1, "subgroups", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn Trace.capsuleEnable
        fxn = (Proto.Fxn)om.bind("xdc.services.global.Trace$$capsuleEnable", new Proto.Fxn(om.findStrict("xdc.services.global.Trace.Module", "xdc.services.global"), new Proto.Arr($$T_Str, false), 1, 1, false));
                fxn.addArg(0, "capsules", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn Trace.groupEnable
        fxn = (Proto.Fxn)om.bind("xdc.services.global.Trace$$groupEnable", new Proto.Fxn(om.findStrict("xdc.services.global.Trace.Module", "xdc.services.global"), new Proto.Arr($$T_Str, false), 1, 1, false));
                fxn.addArg(0, "groups", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn Trace.packageEnable
        fxn = (Proto.Fxn)om.bind("xdc.services.global.Trace$$packageEnable", new Proto.Fxn(om.findStrict("xdc.services.global.Trace.Module", "xdc.services.global"), new Proto.Arr($$T_Str, false), 1, 1, false));
                fxn.addArg(0, "packages", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn Trace.setLevel
        fxn = (Proto.Fxn)om.bind("xdc.services.global.Trace$$setLevel", new Proto.Fxn(om.findStrict("xdc.services.global.Trace.Module", "xdc.services.global"), Proto.Elm.newCNum("(xdc_Int)"), 1, 1, false));
                fxn.addArg(0, "level", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn Trace.start
        fxn = (Proto.Fxn)om.bind("xdc.services.global.Trace$$start", new Proto.Fxn(om.findStrict("xdc.services.global.Trace.Module", "xdc.services.global"), null, 0, 0, false));
    }

    void Clock$$SIZES()
    {
    }

    void Trace$$SIZES()
    {
    }

    void Clock$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/services/global/Clock.xs");
        om.bind("xdc.services.global.Clock$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.services.global.Clock.Module", "xdc.services.global");
        po.init("xdc.services.global.Clock.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("enable", $$T_Bool, false, "wh");
        po.addFld("showMemory", $$T_Bool, false, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.services.global.Clock$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.services.global.Clock$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.services.global.Clock$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("getElapsedTime", (Proto.Fxn)om.findStrict("xdc.services.global.Clock$$getElapsedTime", "xdc.services.global"), Global.get(cap, "getElapsedTime"));
                po.addFxn("print", (Proto.Fxn)om.findStrict("xdc.services.global.Clock$$print", "xdc.services.global"), Global.get(cap, "print"));
                po.addFxn("reset", (Proto.Fxn)om.findStrict("xdc.services.global.Clock$$reset", "xdc.services.global"), Global.get(cap, "reset"));
    }

    void Trace$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/services/global/Trace.xs");
        om.bind("xdc.services.global.Trace$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.services.global.Trace.Module", "xdc.services.global");
        po.init("xdc.services.global.Trace.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("level", Proto.Elm.newCNum("(xdc_Int)"), 0L, "wh");
        po.addFld("capsules", new Proto.Arr($$T_Str, false), Global.newArray(new Object[]{}), "wh");
        po.addFld("packages", new Proto.Arr($$T_Str, false), Global.newArray(new Object[]{}), "wh");
        po.addFld("groups", new Proto.Arr($$T_Str, false), Global.newArray(new Object[]{}), "wh");
        po.addFld("packageLoad", $$T_Bool, false, "wh");
        po.addFld("useModule", $$T_Bool, false, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.services.global.Trace$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.services.global.Trace$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.services.global.Trace$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("addSupergroup", (Proto.Fxn)om.findStrict("xdc.services.global.Trace$$addSupergroup", "xdc.services.global"), Global.get(cap, "addSupergroup"));
                po.addFxn("capsuleEnable", (Proto.Fxn)om.findStrict("xdc.services.global.Trace$$capsuleEnable", "xdc.services.global"), Global.get(cap, "capsuleEnable"));
                po.addFxn("groupEnable", (Proto.Fxn)om.findStrict("xdc.services.global.Trace$$groupEnable", "xdc.services.global"), Global.get(cap, "groupEnable"));
                po.addFxn("packageEnable", (Proto.Fxn)om.findStrict("xdc.services.global.Trace$$packageEnable", "xdc.services.global"), Global.get(cap, "packageEnable"));
                po.addFxn("setLevel", (Proto.Fxn)om.findStrict("xdc.services.global.Trace$$setLevel", "xdc.services.global"), Global.get(cap, "setLevel"));
                po.addFxn("start", (Proto.Fxn)om.findStrict("xdc.services.global.Trace$$start", "xdc.services.global"), Global.get(cap, "start"));
        // typedef Trace.StringArray
        om.bind("xdc.services.global.Trace.StringArray", new Proto.Arr($$T_Str, false));
    }

    void Clock$$ROV()
    {
    }

    void Trace$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.services.global.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.services.global"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.services.global", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.services.global");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.services.global.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.services.global'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.services.global$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.services.global$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.services.global$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Clock$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.services.global.Clock", "xdc.services.global");
        po = (Proto.Obj)om.findStrict("xdc.services.global.Clock.Module", "xdc.services.global");
        vo.init2(po, "xdc.services.global.Clock", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.services.global.Clock$$capsule", "xdc.services.global"));
        vo.bind("$package", om.findStrict("xdc.services.global", "xdc.services.global"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.services.global")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.services.global.Clock$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Clock", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Clock");
    }

    void Trace$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.services.global.Trace", "xdc.services.global");
        po = (Proto.Obj)om.findStrict("xdc.services.global.Trace.Module", "xdc.services.global");
        vo.init2(po, "xdc.services.global.Trace", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.services.global.Trace$$capsule", "xdc.services.global"));
        vo.bind("$package", om.findStrict("xdc.services.global", "xdc.services.global"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("StringArray", om.findStrict("xdc.services.global.Trace.StringArray", "xdc.services.global"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.services.global")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.services.global.Trace$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Trace", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Trace");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.services.global.Clock", "xdc.services.global"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.services.global.Trace", "xdc.services.global"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.services.global.Clock")).bless();
        ((Value.Obj)om.getv("xdc.services.global.Trace")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.services.global")).add(pkgV);
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
        Clock$$OBJECTS();
        Trace$$OBJECTS();
        Clock$$CONSTS();
        Trace$$CONSTS();
        Clock$$CREATES();
        Trace$$CREATES();
        Clock$$FUNCTIONS();
        Trace$$FUNCTIONS();
        Clock$$SIZES();
        Trace$$SIZES();
        Clock$$TYPES();
        Trace$$TYPES();
        if (isROV) {
            Clock$$ROV();
            Trace$$ROV();
        }//isROV
        $$SINGLETONS();
        Clock$$SINGLETONS();
        Trace$$SINGLETONS();
        $$INITIALIZATION();
    }
}
