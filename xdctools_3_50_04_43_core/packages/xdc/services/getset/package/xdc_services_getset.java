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

public class xdc_services_getset
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
        pkgP = (Proto.Obj)om.bind("xdc.services.getset.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.services.getset", new Value.Obj("xdc.services.getset", pkgP));
    }

    void GetSet$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.services.getset.GetSet.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.services.getset.GetSet", new Value.Obj("xdc.services.getset.GetSet", po));
        pkgV.bind("GetSet", vo);
        // decls 
    }

    void GetSet$$CONSTS()
    {
        // module GetSet
    }

    void GetSet$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void GetSet$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn GetSet.onGet
        fxn = (Proto.Fxn)om.bind("xdc.services.getset.GetSet$$onGet", new Proto.Fxn(om.findStrict("xdc.services.getset.GetSet.Module", "xdc.services.getset"), null, 0, -1, false));
        // fxn GetSet.onSet
        fxn = (Proto.Fxn)om.bind("xdc.services.getset.GetSet$$onSet", new Proto.Fxn(om.findStrict("xdc.services.getset.GetSet.Module", "xdc.services.getset"), null, 0, -1, false));
        // fxn GetSet.createGroup
        fxn = (Proto.Fxn)om.bind("xdc.services.getset.GetSet$$createGroup", new Proto.Fxn(om.findStrict("xdc.services.getset.GetSet.Module", "xdc.services.getset"), null, 0, -1, false));
        // fxn GetSet.init
        fxn = (Proto.Fxn)om.bind("xdc.services.getset.GetSet$$init", new Proto.Fxn(om.findStrict("xdc.services.getset.GetSet.Module", "xdc.services.getset"), null, 0, -1, false));
    }

    void GetSet$$SIZES()
    {
    }

    void GetSet$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/services/getset/GetSet.xs");
        om.bind("xdc.services.getset.GetSet$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.services.getset.GetSet.Module", "xdc.services.getset");
        po.init("xdc.services.getset.GetSet.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("debug", $$T_Bool, false, "wh");
        po.addFld("maxIterations", Proto.Elm.newCNum("(xdc_Int)"), 0L, "wh");
        po.addFld("maxStackDepth", Proto.Elm.newCNum("(xdc_Int)"), 0L, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.services.getset.GetSet$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.services.getset.GetSet$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.services.getset.GetSet$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("onGet", (Proto.Fxn)om.findStrict("xdc.services.getset.GetSet$$onGet", "xdc.services.getset"), Global.get(cap, "onGet"));
                po.addFxn("onSet", (Proto.Fxn)om.findStrict("xdc.services.getset.GetSet$$onSet", "xdc.services.getset"), Global.get(cap, "onSet"));
                po.addFxn("createGroup", (Proto.Fxn)om.findStrict("xdc.services.getset.GetSet$$createGroup", "xdc.services.getset"), Global.get(cap, "createGroup"));
                po.addFxn("init", (Proto.Fxn)om.findStrict("xdc.services.getset.GetSet$$init", "xdc.services.getset"), Global.get(cap, "init"));
    }

    void GetSet$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.services.getset.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.services.getset"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.services.getset", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.services.getset");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.services.getset.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.services.getset'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.services.getset$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.services.getset$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.services.getset$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void GetSet$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.services.getset.GetSet", "xdc.services.getset");
        po = (Proto.Obj)om.findStrict("xdc.services.getset.GetSet.Module", "xdc.services.getset");
        vo.init2(po, "xdc.services.getset.GetSet", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.services.getset.GetSet$$capsule", "xdc.services.getset"));
        vo.bind("$package", om.findStrict("xdc.services.getset", "xdc.services.getset"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.services.getset")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.services.getset.GetSet$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("GetSet", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GetSet");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.services.getset.GetSet", "xdc.services.getset"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.services.getset.GetSet")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.services.getset")).add(pkgV);
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
        GetSet$$OBJECTS();
        GetSet$$CONSTS();
        GetSet$$CREATES();
        GetSet$$FUNCTIONS();
        GetSet$$SIZES();
        GetSet$$TYPES();
        if (isROV) {
            GetSet$$ROV();
        }//isROV
        $$SINGLETONS();
        GetSet$$SINGLETONS();
        $$INITIALIZATION();
    }
}
