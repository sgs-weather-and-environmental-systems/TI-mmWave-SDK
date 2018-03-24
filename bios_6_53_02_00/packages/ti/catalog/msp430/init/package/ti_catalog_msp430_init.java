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

public class ti_catalog_msp430_init
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
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.init.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.init", new Value.Obj("ti.catalog.msp430.init", pkgP));
    }

    void Boot$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.init.Boot.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.init.Boot", new Value.Obj("ti.catalog.msp430.init.Boot", po));
        pkgV.bind("Boot", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.init.Boot$$ModuleView", new Proto.Obj());
        om.bind("ti.catalog.msp430.init.Boot.ModuleView", new Proto.Str(spo, true));
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
    }

    void Boot$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/init/Boot.xs");
        om.bind("ti.catalog.msp430.init.Boot$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.init.Boot.Module", "ti.catalog.msp430.init");
        po.init("ti.catalog.msp430.init.Boot.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.catalog.msp430.init"), $$UNDEF, "wh");
        po.addFld("disableWatchdog", $$T_Bool, true, "wh");
        po.addFld("watchdogAddress", Proto.Elm.newCNum("(xdc_UInt)"), 0x15cL, "wh");
        po.addFld("configureDCO", $$T_Bool, false, "wh");
        po.addFld("useLFXT", $$T_Bool, false, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.init.Boot$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.init.Boot$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.init.Boot$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Boot.ModuleView
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.init.Boot$$ModuleView", "ti.catalog.msp430.init");
        po.init("ti.catalog.msp430.init.Boot.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("disableWatchdog", $$T_Bool, $$UNDEF, "w");
                po.addFld("watchdogAddress", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("configureDCO", $$T_Bool, $$UNDEF, "w");
                po.addFld("useLFXT", $$T_Bool, $$UNDEF, "w");
    }

    void Boot$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.init.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.init"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/init/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.catalog.msp430.init"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.catalog.msp430.init"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.catalog.msp430.init"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.catalog.msp430.init"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.catalog.msp430.init"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.catalog.msp430.init"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.catalog.msp430.init", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.init");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.init.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.runtime", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.init'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.init$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.init$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.init$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/ti.catalog.msp430.init.a430X',\n");
            sb.append("'lib/ti.catalog.msp430.init.a430XS',\n");
            sb.append("'lib/ti.catalog.msp430.init.ae430',\n");
            sb.append("'lib/ti.catalog.msp430.init.ae430X',\n");
            sb.append("'lib/ti.catalog.msp430.init.ae430XS',\n");
            sb.append("'lib/ti.catalog.msp430.init.ar430',\n");
            sb.append("'lib/ti.catalog.msp430.init.ar430XS',\n");
            sb.append("'lib/ti.catalog.msp430.init.ar430XL',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/ti.catalog.msp430.init.a430X', {target: 'ti.targets.msp430.MSP430X', suffix: '430X'}],\n");
            sb.append("['lib/ti.catalog.msp430.init.a430XS', {target: 'ti.targets.msp430.MSP430X_small', suffix: '430XS'}],\n");
            sb.append("['lib/ti.catalog.msp430.init.ae430', {target: 'ti.targets.msp430.elf.MSP430', suffix: 'e430'}],\n");
            sb.append("['lib/ti.catalog.msp430.init.ae430X', {target: 'ti.targets.msp430.elf.MSP430X', suffix: 'e430X'}],\n");
            sb.append("['lib/ti.catalog.msp430.init.ae430XS', {target: 'ti.targets.msp430.elf.MSP430X_small', suffix: 'e430XS'}],\n");
            sb.append("['lib/ti.catalog.msp430.init.ar430', {target: 'iar.targets.msp430.MSP430', suffix: 'r430'}],\n");
            sb.append("['lib/ti.catalog.msp430.init.ar430XS', {target: 'iar.targets.msp430.MSP430X_small', suffix: 'r430XS'}],\n");
            sb.append("['lib/ti.catalog.msp430.init.ar430XL', {target: 'iar.targets.msp430.MSP430X_large', suffix: 'r430XL'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Boot$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.init.Boot", "ti.catalog.msp430.init");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.init.Boot.Module", "ti.catalog.msp430.init");
        vo.init2(po, "ti.catalog.msp430.init.Boot", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.init.Boot$$capsule", "ti.catalog.msp430.init"));
        vo.bind("$package", om.findStrict("ti.catalog.msp430.init", "ti.catalog.msp430.init"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("ModuleView", om.findStrict("ti.catalog.msp430.init.Boot.ModuleView", "ti.catalog.msp430.init"));
        tdefs.add(om.findStrict("ti.catalog.msp430.init.Boot.ModuleView", "ti.catalog.msp430.init"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.init")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.init.Boot$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Boot.xdt");
        atmap.seal("length");
        vo.bind("TEMPLATE$", "./Boot.xdt");
        pkgV.bind("Boot", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Boot");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.init.Boot", "ti.catalog.msp430.init"));
        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.init.Boot", "ti.catalog.msp430.init");
        Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.init.Boot")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.init")).add(pkgV);
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
