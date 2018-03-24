/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D05
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class ti_catalog_c2800_concertoInit
{
    static final String VERS = "@(#) xdc-D05\n";

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
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.c2800.concertoInit.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.c2800.concertoInit", new Value.Obj("ti.catalog.c2800.concertoInit", pkgP));
    }

    void Boot$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.concertoInit.Boot.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.concertoInit.Boot", new Value.Obj("ti.catalog.c2800.concertoInit.Boot", po));
        pkgV.bind("Boot", vo);
        // decls 
    }

    void Boot$$CONSTS()
    {
        // module Boot
    }

    void Boot$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Boot$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Boot$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Boot$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/c2800/concertoInit/Boot.xs");
        om.bind("ti.catalog.c2800.concertoInit.Boot$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.concertoInit.Boot.Module", "ti.catalog.c2800.concertoInit");
        po.init("ti.catalog.c2800.concertoInit.Boot.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.catalog.c2800.concertoInit"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("bootFromFlash", $$T_Bool, true, "wh");
            po.addFld("configureFlashController", $$T_Bool, true, "wh");
            po.addFld("configureFlashWaitStates", $$T_Bool, true, "wh");
            po.addFld("enableFlashProgramPrefetch", $$T_Bool, false, "wh");
            po.addFld("enableFlashDataCache", $$T_Bool, true, "wh");
            po.addFld("loadSegment", $$T_Str, $$UNDEF, "wh");
            po.addFld("runSegment", $$T_Str, $$UNDEF, "wh");
            po.addFld("flashWaitStates", Proto.Elm.newCNum("(xdc_UInt)"), 3L, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.c2800.concertoInit.Boot$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.c2800.concertoInit.Boot$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.catalog.c2800.concertoInit.Boot$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.c2800.concertoInit.Boot$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Boot$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.concertoInit.Boot", "ti.catalog.c2800.concertoInit");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.c2800.concertoInit.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.c2800.concertoInit"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/c2800/concertoInit/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.catalog.c2800.concertoInit"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.catalog.c2800.concertoInit"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.catalog.c2800.concertoInit"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.catalog.c2800.concertoInit"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.catalog.c2800.concertoInit"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.catalog.c2800.concertoInit"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.catalog.c2800.concertoInit", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.c2800.concertoInit");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.c2800.concertoInit.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.c2800.concertoInit'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.c2800.concertoInit$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.c2800.concertoInit$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.c2800.concertoInit$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/Boot.a28L',\n");
            sb.append("'lib/Boot.a28FP',\n");
            sb.append("'lib/Boot.ae28FP',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/Boot.a28L', {target: 'ti.targets.C28_large', suffix: '28L'}],\n");
            sb.append("['lib/Boot.a28FP', {target: 'ti.targets.C28_float', suffix: '28FP'}],\n");
            sb.append("['lib/Boot.ae28FP', {target: 'ti.targets.elf.C28_float', suffix: 'e28FP'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Boot$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.concertoInit.Boot", "ti.catalog.c2800.concertoInit");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.concertoInit.Boot.Module", "ti.catalog.c2800.concertoInit");
        vo.init2(po, "ti.catalog.c2800.concertoInit.Boot", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.c2800.concertoInit.Boot$$capsule", "ti.catalog.c2800.concertoInit"));
        vo.bind("$package", om.findStrict("ti.catalog.c2800.concertoInit", "ti.catalog.c2800.concertoInit"));
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
        icfgs.add("flashWaitStates");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800.concertoInit")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 1);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("$$fxntab", Global.newArray("ti_catalog_c2800_concertoInit_Boot_Module__startupDone__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", "./Boot.xdt");
        atmap.seal("length");
        if (isCFG) {
            vo.put("common$", vo, Global.get((Proto.Obj)om.find("xdc.runtime.Defaults.Module"), "noRuntimeCommon$"));
            ((Value.Obj)vo.geto("common$")).seal(null);
        }//isCFG
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Boot.xdt");
        pkgV.bind("Boot", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Boot");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.concertoInit.Boot", "ti.catalog.c2800.concertoInit"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.c2800.concertoInit.Boot")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.c2800.concertoInit")).add(pkgV);
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
        Boot$$OBJECTS();
        Boot$$CONSTS();
        Boot$$CREATES();
        Boot$$FUNCTIONS();
        Boot$$SIZES();
        Boot$$TYPES();
        if (isROV) {
            Boot$$ROV();
        }//isROV
        $$SINGLETONS();
        Boot$$SINGLETONS();
        $$INITIALIZATION();
    }
}
