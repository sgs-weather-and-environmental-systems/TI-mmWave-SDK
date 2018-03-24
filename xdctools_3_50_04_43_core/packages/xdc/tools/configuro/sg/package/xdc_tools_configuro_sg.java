/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-A65
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class xdc_tools_configuro_sg
{
    static final String VERS = "@(#) xdc-A65\n";

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
        Global.callFxn("loadPackage", xdcO, "xdc.tools.sg.widgets");
        Global.callFxn("loadPackage", xdcO, "xdc.tools.sg");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.tools.configuro.sg.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.tools.configuro.sg", new Value.Obj("xdc.tools.configuro.sg", pkgP));
    }

    void Main$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.configuro.sg.Main.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.configuro.sg.Main", new Value.Obj("xdc.tools.configuro.sg.Main", po));
        pkgV.bind("Main", vo);
        // decls 
    }

    void Main$$CONSTS()
    {
        // module Main
    }

    void Main$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Main$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Main.main
        fxn = (Proto.Fxn)om.bind("xdc.tools.configuro.sg.Main$$main", new Proto.Fxn(om.findStrict("xdc.tools.configuro.sg.Main.Module", "xdc.tools.configuro.sg"), null, 0, -1, false));
        // fxn Main.createPartControl
        fxn = (Proto.Fxn)om.bind("xdc.tools.configuro.sg.Main$$createPartControl", new Proto.Fxn(om.findStrict("xdc.tools.configuro.sg.Main.Module", "xdc.tools.configuro.sg"), null, 0, -1, false));
    }

    void Main$$SIZES()
    {
    }

    void Main$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/configuro/sg/Main.xs");
        om.bind("xdc.tools.configuro.sg.Main$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.configuro.sg.Main.Module", "xdc.tools.configuro.sg");
        po.init("xdc.tools.configuro.sg.Main.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.configuro.sg.Main$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.configuro.sg.Main$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.configuro.sg.Main$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("main", (Proto.Fxn)om.findStrict("xdc.tools.configuro.sg.Main$$main", "xdc.tools.configuro.sg"), Global.get(cap, "main"));
                po.addFxn("createPartControl", (Proto.Fxn)om.findStrict("xdc.tools.configuro.sg.Main$$createPartControl", "xdc.tools.configuro.sg"), Global.get(cap, "createPartControl"));
    }

    void Main$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.tools.configuro.sg.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.tools.configuro.sg"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.tools.configuro.sg", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.tools.configuro.sg");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.tools.configuro.sg.");
        pkgV.bind("$vers", Global.newArray());
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.tools.sg.widgets", Global.newArray()));
        imports.add(Global.newArray("xdc.tools.sg", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.tools.configuro.sg'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.tools.configuro.sg$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.tools.configuro.sg$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.tools.configuro.sg$$stat$root'];\n");
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

        vo = (Value.Obj)om.findStrict("xdc.tools.configuro.sg.Main", "xdc.tools.configuro.sg");
        po = (Proto.Obj)om.findStrict("xdc.tools.configuro.sg.Main.Module", "xdc.tools.configuro.sg");
        vo.init2(po, "xdc.tools.configuro.sg.Main", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.configuro.sg.Main$$capsule", "xdc.tools.configuro.sg"));
        vo.bind("$package", om.findStrict("xdc.tools.configuro.sg", "xdc.tools.configuro.sg"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.configuro.sg")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.configuro.sg.Main$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Main", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Main");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.configuro.sg.Main", "xdc.tools.configuro.sg"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.tools.configuro.sg.Main")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.tools.configuro.sg")).add(pkgV);
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
        Main$$CONSTS();
        Main$$CREATES();
        Main$$FUNCTIONS();
        Main$$SIZES();
        Main$$TYPES();
        if (isROV) {
            Main$$ROV();
        }//isROV
        $$SINGLETONS();
        Main$$SINGLETONS();
        $$INITIALIZATION();
    }
}
