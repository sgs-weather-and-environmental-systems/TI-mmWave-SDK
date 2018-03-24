/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D20
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class ti_sysbios_family_arm_v7r_tms570
{
    static final String VERS = "@(#) xdc-D20\n";

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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.interfaces");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.tms570.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.v7r.tms570", new Value.Obj("ti.sysbios.family.arm.v7r.tms570", pkgP));
    }

    void Boot$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.tms570.Boot.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v7r.tms570.Boot", new Value.Obj("ti.sysbios.family.arm.v7r.tms570.Boot", po));
        pkgV.bind("Boot", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.tms570.Boot$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.tms570.Boot.ModuleView", new Proto.Str(spo, false));
    }

    void Core$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.tms570.Core.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v7r.tms570.Core", new Value.Obj("ti.sysbios.family.arm.v7r.tms570.Core", po));
        pkgV.bind("Core", vo);
        // decls 
    }

    void Boot$$CONSTS()
    {
        // module Boot
        om.bind("ti.sysbios.family.arm.v7r.tms570.Boot.getFrequency", new Extern("ti_sysbios_family_arm_v7r_tms570_Boot_getFrequency__E", "xdc_UInt32(*)(xdc_Void)", true, false));
    }

    void Core$$CONSTS()
    {
        // module Core
        om.bind("ti.sysbios.family.arm.v7r.tms570.Core.getId", new Extern("ti_sysbios_family_arm_v7r_tms570_Core_getId__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.tms570.Core.interruptCore", new Extern("ti_sysbios_family_arm_v7r_tms570_Core_interruptCore__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.tms570.Core.lock", new Extern("ti_sysbios_family_arm_v7r_tms570_Core_lock__E", "xdc_IArg(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.tms570.Core.unlock", new Extern("ti_sysbios_family_arm_v7r_tms570_Core_unlock__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.tms570.Core.startCore1", new Extern("ti_sysbios_family_arm_v7r_tms570_Core_startCore1__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.tms570.Core.resetC", new Extern("ti_sysbios_family_arm_v7r_tms570_Core_resetC__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void Boot$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Core$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Boot$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Boot.registerFreqListener
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.v7r.tms570.Boot$$registerFreqListener", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot.Module", "ti.sysbios.family.arm.v7r.tms570"), null, 0, -1, false));
    }

    void Core$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Boot$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Core$$SIZES()
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

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7r/tms570/Boot.xs");
        om.bind("ti.sysbios.family.arm.v7r.tms570.Boot$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot.Module", "ti.sysbios.family.arm.v7r.tms570");
        po.init("ti.sysbios.family.arm.v7r.tms570.Boot.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.v7r.tms570"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.v7r.tms570"), $$UNDEF, "wh");
            po.addFld("configureClocks", $$T_Bool, true, "w");
            po.addFld("OSCIN", Proto.Elm.newCNum("(xdc_UInt)"), 16L, "wh");
            po.addFld("PLLMUL", Proto.Elm.newCNum("(xdc_UInt)"), 0x4AL, "wh");
            po.addFld("REFCLKDIV", Proto.Elm.newCNum("(xdc_UInt)"), 0x5L, "wh");
            po.addFld("PLLDIV", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "wh");
            po.addFld("ODPLL", Proto.Elm.newCNum("(xdc_UInt)"), 1L, "wh");
            po.addFld("SPREADINGRATE", Proto.Elm.newCNum("(xdc_UInt)"), 0x1FFL, "wh");
            po.addFld("MULMOD", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "wh");
            po.addFld("SPR_AMOUNT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "wh");
            po.addFld("frequencyModulationEnable", $$T_Bool, false, "wh");
            po.addFld("configureFlashController", $$T_Bool, true, "wh");
            po.addFld("configureFlashWaitStates", $$T_Bool, true, "wh");
            po.addFld("flashPortAPrefetchEnable", $$T_Bool, true, "wh");
            po.addFld("flashPortBPrefetchEnable", $$T_Bool, true, "wh");
            po.addFld("displayFrequency", $$T_Str, $$UNDEF, "wh");
            po.addFld("flashWaitStates", Proto.Elm.newCNum("(xdc_UInt)"), 3L, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.tms570.Boot$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.tms570.Boot$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.tms570.Boot$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.tms570.Boot$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("registerFreqListener", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot$$registerFreqListener", "ti.sysbios.family.arm.v7r.tms570"), Global.get(cap, "registerFreqListener"));
        // struct Boot.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot$$ModuleView", "ti.sysbios.family.arm.v7r.tms570");
        po.init("ti.sysbios.family.arm.v7r.tms570.Boot.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("configureClocks", $$T_Bool, $$UNDEF, "w");
                po.addFld("frequencyModulationEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("OSCIN", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("PLLMUL", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("PLLDIV", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("REFCLKDIV", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("ODPLL", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("SPREADINGRATE", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("MULMOD", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("SPR_AMOUNT", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
    }

    void Core$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7r/tms570/Core.xs");
        om.bind("ti.sysbios.family.arm.v7r.tms570.Core$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core.Module", "ti.sysbios.family.arm.v7r.tms570");
        po.init("ti.sysbios.family.arm.v7r.tms570.Core.Module", om.findStrict("ti.sysbios.interfaces.ICore.Module", "ti.sysbios.family.arm.v7r.tms570"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("E_mismatchedIds", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v7r.tms570"), Global.newObject("msg", "E_mismatchedIds: Core_Id: %d does not match hardware core Id: %d"), "w");
            po.addFld("numCores", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
            po.addFld("resetFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), null, "wh");
            po.addFld("overrideHwiResetFunc", $$T_Bool, false, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.tms570.Core$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.tms570.Core$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.tms570.Core$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.tms570.Core$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // typedef Core.ResetFuncPtr
        om.bind("ti.sysbios.family.arm.v7r.tms570.Core.ResetFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
    }

    void Boot$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot", "ti.sysbios.family.arm.v7r.tms570");
    }

    void Core$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core", "ti.sysbios.family.arm.v7r.tms570");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.v7r.tms570.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.v7r.tms570"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7r/tms570/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.v7r.tms570"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.v7r.tms570"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.v7r.tms570"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.v7r.tms570"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.v7r.tms570"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.v7r.tms570"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.v7r.tms570", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.v7r.tms570");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.v7r.tms570.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.v7r.tms570'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.v7r.tms570$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.v7r.tms570$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.v7r.tms570$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7r.tms570.aer5f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7r.tms570.aer4f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7r.tms570.aer4ft',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7r.tms570.aer5f', {target: 'ti.targets.arm.elf.R5F', suffix: 'er5f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7r.tms570.aer4f', {target: 'ti.targets.arm.elf.R4F', suffix: 'er4f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7r.tms570.aer4ft', {target: 'ti.targets.arm.elf.R4Ft', suffix: 'er4ft'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Boot$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot", "ti.sysbios.family.arm.v7r.tms570");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot.Module", "ti.sysbios.family.arm.v7r.tms570");
        vo.init2(po, "ti.sysbios.family.arm.v7r.tms570.Boot", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot$$capsule", "ti.sysbios.family.arm.v7r.tms570"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v7r.tms570", "ti.sysbios.family.arm.v7r.tms570"));
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
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot.ModuleView", "ti.sysbios.family.arm.v7r.tms570"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot.ModuleView", "ti.sysbios.family.arm.v7r.tms570"));
        mcfgs.add("configureClocks");
        icfgs.add("displayFrequency");
        icfgs.add("flashWaitStates");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v7r.tms570")).add(vo);
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
        vo.bind("getFrequency", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot.getFrequency", "ti.sysbios.family.arm.v7r.tms570"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v7r_tms570_Boot_Module__startupDone__E", "ti_sysbios_family_arm_v7r_tms570_Boot_getFrequency__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", "./Boot.xdt");
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Boot.xdt");
        pkgV.bind("Boot", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Boot");
    }

    void Core$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core", "ti.sysbios.family.arm.v7r.tms570");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core.Module", "ti.sysbios.family.arm.v7r.tms570");
        vo.init2(po, "ti.sysbios.family.arm.v7r.tms570.Core", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core$$capsule", "ti.sysbios.family.arm.v7r.tms570"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v7r.tms570", "ti.sysbios.family.arm.v7r.tms570"));
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
        mcfgs.add("numCores");
        vo.bind("ResetFuncPtr", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core.ResetFuncPtr", "ti.sysbios.family.arm.v7r.tms570"));
        mcfgs.add("E_mismatchedIds");
        mcfgs.add("id");
        icfgs.add("overrideHwiResetFunc");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v7r.tms570")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("getId", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core.getId", "ti.sysbios.family.arm.v7r.tms570"));
        vo.bind("interruptCore", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core.interruptCore", "ti.sysbios.family.arm.v7r.tms570"));
        vo.bind("lock", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core.lock", "ti.sysbios.family.arm.v7r.tms570"));
        vo.bind("unlock", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core.unlock", "ti.sysbios.family.arm.v7r.tms570"));
        vo.bind("startCore1", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core.startCore1", "ti.sysbios.family.arm.v7r.tms570"));
        vo.bind("resetC", om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core.resetC", "ti.sysbios.family.arm.v7r.tms570"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v7r_tms570_Core_Module__startupDone__E", "ti_sysbios_family_arm_v7r_tms570_Core_getId__E", "ti_sysbios_family_arm_v7r_tms570_Core_interruptCore__E", "ti_sysbios_family_arm_v7r_tms570_Core_lock__E", "ti_sysbios_family_arm_v7r_tms570_Core_unlock__E", "ti_sysbios_family_arm_v7r_tms570_Core_hwiDisable__E", "ti_sysbios_family_arm_v7r_tms570_Core_hwiEnable__E", "ti_sysbios_family_arm_v7r_tms570_Core_hwiRestore__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_mismatchedIds"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Core.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Core.xdt");
        pkgV.bind("Core", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Core");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot", "ti.sysbios.family.arm.v7r.tms570"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Core", "ti.sysbios.family.arm.v7r.tms570"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.tms570.Boot", "ti.sysbios.family.arm.v7r.tms570");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v7r.tms570.Boot")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v7r.tms570.Core")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.v7r.tms570")).add(pkgV);
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
        Core$$OBJECTS();
        Boot$$CONSTS();
        Core$$CONSTS();
        Boot$$CREATES();
        Core$$CREATES();
        Boot$$FUNCTIONS();
        Core$$FUNCTIONS();
        Boot$$SIZES();
        Core$$SIZES();
        Boot$$TYPES();
        Core$$TYPES();
        if (isROV) {
            Boot$$ROV();
            Core$$ROV();
        }//isROV
        $$SINGLETONS();
        Boot$$SINGLETONS();
        Core$$SINGLETONS();
        $$INITIALIZATION();
    }
}
