/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-z44
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class ti_dsplib
{
    static final String VERS = "@(#) xdc-z44\n";

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
        Global.callFxn("loadPackage", xdcO, "ti.mas.swtools");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.dsplib.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.dsplib", new Value.Obj("ti.dsplib", pkgP));
    }

    void Version$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.dsplib.Version.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.dsplib.Version", new Value.Obj("ti.dsplib.Version", po));
        pkgV.bind("Version", vo);
        // decls 
    }

    void Version$$CONSTS()
    {
        // module Version
        om.bind("ti.dsplib.Version.MAJOR", 3L);
        om.bind("ti.dsplib.Version.MINOR", 4L);
        om.bind("ti.dsplib.Version.PATCH", 0L);
        om.bind("ti.dsplib.Version.BUILD", 0L);
        om.bind("ti.dsplib.Version.QUALITY", 3L);
        om.bind("ti.dsplib.Version.BTYPE", 0L);
        om.bind("ti.dsplib.Version.WIDTH", 0L);
        om.bind("ti.dsplib.Version.PKGSTD", 2L);
    }

    void Version$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Version$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Version$$SIZES()
    {
    }

    void Version$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.dsplib.Version.Module", "ti.dsplib");
        po.init("ti.dsplib.Version.Module", om.findStrict("ti.mas.swtools.IVersion2.Module", "ti.dsplib"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("QUALITY_PREALPHA", Proto.Elm.newCNum("(xdc_UInt16)"), 0L, "rh");
                po.addFld("QUALITY_ALPHA", Proto.Elm.newCNum("(xdc_UInt16)"), 1L, "rh");
                po.addFld("QUALITY_BETA", Proto.Elm.newCNum("(xdc_UInt16)"), 2L, "rh");
                po.addFld("QUALITY_GA", Proto.Elm.newCNum("(xdc_UInt16)"), 3L, "rh");
                po.addFld("BTYPE_STANDARD", Proto.Elm.newCNum("(xdc_UInt16)"), 0L, "rh");
                po.addFld("BTYPE_ENGINEERING", Proto.Elm.newCNum("(xdc_UInt16)"), 1L, "rh");
                po.addFld("BTYPE_DEBUG", Proto.Elm.newCNum("(xdc_UInt16)"), 2L, "rh");
                po.addFld("MAJOR", Proto.Elm.newCNum("(xdc_UInt16)"), 3L, "rh");
                po.addFld("MINOR", Proto.Elm.newCNum("(xdc_UInt16)"), 4L, "rh");
                po.addFld("PATCH", Proto.Elm.newCNum("(xdc_UInt16)"), 0L, "rh");
                po.addFld("BUILD", Proto.Elm.newCNum("(xdc_UInt16)"), 0L, "rh");
                po.addFld("QUALITY", Proto.Elm.newCNum("(xdc_UInt16)"), 3L, "rh");
                po.addFld("BTYPE", Proto.Elm.newCNum("(xdc_UInt16)"), 0L, "rh");
                po.addFld("WIDTH", Proto.Elm.newCNum("(xdc_UInt16)"), 0L, "rh");
                po.addFld("PKGSTD", Proto.Elm.newCNum("(xdc_UInt16)"), 2L, "rh");
                po.addFxn("getString", (Proto.Fxn)om.findStrict("ti.mas.swtools.IVersion2$$getString", "ti.dsplib"), $$UNDEF);
    }

    void Version$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.dsplib.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.dsplib"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.dsplib", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.dsplib");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.dsplib.");
        pkgV.bind("$vers", Global.newArray("2, 0, 1, 0"));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.dsplib'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Version$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.dsplib.Version", "ti.dsplib");
        po = (Proto.Obj)om.findStrict("ti.dsplib.Version.Module", "ti.dsplib");
        vo.init2(po, "ti.dsplib.Version", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.dsplib", "ti.dsplib"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.mas.swtools");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.dsplib")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.dsplib.Version$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Version", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Version");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.dsplib.Version", "ti.dsplib"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.dsplib.Version")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.dsplib")).add(pkgV);
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
        Version$$OBJECTS();
        Version$$CONSTS();
        Version$$CREATES();
        Version$$FUNCTIONS();
        Version$$SIZES();
        Version$$TYPES();
        if (isROV) {
            Version$$ROV();
        }//isROV
        $$SINGLETONS();
        Version$$SINGLETONS();
        $$INITIALIZATION();
    }
}
