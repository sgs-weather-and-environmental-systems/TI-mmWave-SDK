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

public class ti_sysbios_family_c62
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.interfaces");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.c62.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.c62", new Value.Obj("ti.sysbios.family.c62", pkgP));
    }

    void TaskSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c62.TaskSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c62.TaskSupport", new Value.Obj("ti.sysbios.family.c62.TaskSupport", po));
        pkgV.bind("TaskSupport", vo);
        // decls 
    }

    void IntrinsicsSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c62.IntrinsicsSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c62.IntrinsicsSupport", new Value.Obj("ti.sysbios.family.c62.IntrinsicsSupport", po));
        pkgV.bind("IntrinsicsSupport", vo);
        // decls 
    }

    void TaskSupport$$CONSTS()
    {
        // module TaskSupport
        om.bind("ti.sysbios.family.c62.TaskSupport.start", new Extern("ti_sysbios_family_c62_TaskSupport_start__E", "xdc_Ptr(*)(xdc_Ptr,xdc_Void(*)(xdc_Void),xdc_Void(*)(xdc_Void),xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.c62.TaskSupport.swap", new Extern("ti_sysbios_family_c62_TaskSupport_swap__E", "xdc_Void(*)(xdc_Ptr*,xdc_Ptr*)", true, false));
        om.bind("ti.sysbios.family.c62.TaskSupport.checkStack", new Extern("ti_sysbios_family_c62_TaskSupport_checkStack__E", "xdc_Bool(*)(xdc_Char*,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.c62.TaskSupport.stackUsed", new Extern("ti_sysbios_family_c62_TaskSupport_stackUsed__E", "xdc_SizeT(*)(xdc_Char*,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.c62.TaskSupport.getStackAlignment", new Extern("ti_sysbios_family_c62_TaskSupport_getStackAlignment__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c62.TaskSupport.getDefaultStackSize", new Extern("ti_sysbios_family_c62_TaskSupport_getDefaultStackSize__E", "xdc_SizeT(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c62.TaskSupport.getCheckValueAddr", new Extern("ti_sysbios_family_c62_TaskSupport_getCheckValueAddr__E", "xdc_Ptr(*)(xdc_Ptr)", true, false));
    }

    void IntrinsicsSupport$$CONSTS()
    {
        // module IntrinsicsSupport
        om.bind("ti.sysbios.family.c62.IntrinsicsSupport.maxbit", new Extern("ti_sysbios_family_c62_IntrinsicsSupport_maxbit__E", "xdc_UInt(*)(xdc_UInt)", true, false));
    }

    void TaskSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IntrinsicsSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TaskSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IntrinsicsSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TaskSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void IntrinsicsSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void TaskSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c62/TaskSupport.xs");
        om.bind("ti.sysbios.family.c62.TaskSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c62.TaskSupport.Module", "ti.sysbios.family.c62");
        po.init("ti.sysbios.family.c62.TaskSupport.Module", om.findStrict("ti.sysbios.interfaces.ITaskSupport.Module", "ti.sysbios.family.c62"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("defaultStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 2048L, "r");
            po.addFld("stackAlignment", Proto.Elm.newCNum("(xdc_UInt)"), 8L, "r");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c62.TaskSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c62.TaskSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c62.TaskSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c62.TaskSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "stackUsed$view");
                if (fxn != null) po.addFxn("stackUsed$view", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITaskSupport$$stackUsed$view", "ti.sysbios.family.c62"), fxn);
                fxn = Global.get(cap, "getCallStack$view");
                if (fxn != null) po.addFxn("getCallStack$view", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITaskSupport$$getCallStack$view", "ti.sysbios.family.c62"), fxn);
    }

    void IntrinsicsSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c62/IntrinsicsSupport.xs");
        om.bind("ti.sysbios.family.c62.IntrinsicsSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c62.IntrinsicsSupport.Module", "ti.sysbios.family.c62");
        po.init("ti.sysbios.family.c62.IntrinsicsSupport.Module", om.findStrict("ti.sysbios.interfaces.IIntrinsicsSupport.Module", "ti.sysbios.family.c62"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c62.IntrinsicsSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c62.IntrinsicsSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c62.IntrinsicsSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c62.IntrinsicsSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void TaskSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c62.TaskSupport", "ti.sysbios.family.c62");
    }

    void IntrinsicsSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c62.IntrinsicsSupport", "ti.sysbios.family.c62");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.c62.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.c62"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c62/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.c62"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.c62"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.c62"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.c62"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.c62"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.c62"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.c62", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.c62");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.c62.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.c62'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.c62$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.c62$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.c62$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c62.ae64P',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c62.ae674',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c62.ae66',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c62.ae66e',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c62.ae64P', {target: 'ti.targets.elf.C64P', suffix: 'e64P'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c62.ae674', {target: 'ti.targets.elf.C674', suffix: 'e674'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c62.ae66', {target: 'ti.targets.elf.C66', suffix: 'e66'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c62.ae66e', {target: 'ti.targets.elf.C66_big_endian', suffix: 'e66e'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void TaskSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c62.TaskSupport", "ti.sysbios.family.c62");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c62.TaskSupport.Module", "ti.sysbios.family.c62");
        vo.init2(po, "ti.sysbios.family.c62.TaskSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c62.TaskSupport$$capsule", "ti.sysbios.family.c62"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c62", "ti.sysbios.family.c62"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITaskSupport.FuncPtr", "ti.sysbios.family.c62"));
        mcfgs.add("defaultStackSize");
        mcfgs.add("stackAlignment");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c62")).add(vo);
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
        vo.bind("start", om.findStrict("ti.sysbios.family.c62.TaskSupport.start", "ti.sysbios.family.c62"));
        vo.bind("swap", om.findStrict("ti.sysbios.family.c62.TaskSupport.swap", "ti.sysbios.family.c62"));
        vo.bind("checkStack", om.findStrict("ti.sysbios.family.c62.TaskSupport.checkStack", "ti.sysbios.family.c62"));
        vo.bind("stackUsed", om.findStrict("ti.sysbios.family.c62.TaskSupport.stackUsed", "ti.sysbios.family.c62"));
        vo.bind("getStackAlignment", om.findStrict("ti.sysbios.family.c62.TaskSupport.getStackAlignment", "ti.sysbios.family.c62"));
        vo.bind("getDefaultStackSize", om.findStrict("ti.sysbios.family.c62.TaskSupport.getDefaultStackSize", "ti.sysbios.family.c62"));
        vo.bind("getCheckValueAddr", om.findStrict("ti.sysbios.family.c62.TaskSupport.getCheckValueAddr", "ti.sysbios.family.c62"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c62_TaskSupport_Module__startupDone__E", "ti_sysbios_family_c62_TaskSupport_start__E", "ti_sysbios_family_c62_TaskSupport_swap__E", "ti_sysbios_family_c62_TaskSupport_checkStack__E", "ti_sysbios_family_c62_TaskSupport_stackUsed__E", "ti_sysbios_family_c62_TaskSupport_getStackAlignment__E", "ti_sysbios_family_c62_TaskSupport_getDefaultStackSize__E", "ti_sysbios_family_c62_TaskSupport_getCheckValueAddr__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("TaskSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TaskSupport");
    }

    void IntrinsicsSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c62.IntrinsicsSupport", "ti.sysbios.family.c62");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c62.IntrinsicsSupport.Module", "ti.sysbios.family.c62");
        vo.init2(po, "ti.sysbios.family.c62.IntrinsicsSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c62.IntrinsicsSupport$$capsule", "ti.sysbios.family.c62"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c62", "ti.sysbios.family.c62"));
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
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c62")).add(vo);
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
        vo.bind("maxbit", om.findStrict("ti.sysbios.family.c62.IntrinsicsSupport.maxbit", "ti.sysbios.family.c62"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c62_IntrinsicsSupport_Module__startupDone__E", "ti_sysbios_family_c62_IntrinsicsSupport_maxbit__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("IntrinsicsSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IntrinsicsSupport");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c62.TaskSupport", "ti.sysbios.family.c62"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c62.IntrinsicsSupport", "ti.sysbios.family.c62"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.c62.TaskSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c62.IntrinsicsSupport")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.c62")).add(pkgV);
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
        TaskSupport$$OBJECTS();
        IntrinsicsSupport$$OBJECTS();
        TaskSupport$$CONSTS();
        IntrinsicsSupport$$CONSTS();
        TaskSupport$$CREATES();
        IntrinsicsSupport$$CREATES();
        TaskSupport$$FUNCTIONS();
        IntrinsicsSupport$$FUNCTIONS();
        TaskSupport$$SIZES();
        IntrinsicsSupport$$SIZES();
        TaskSupport$$TYPES();
        IntrinsicsSupport$$TYPES();
        if (isROV) {
            TaskSupport$$ROV();
            IntrinsicsSupport$$ROV();
        }//isROV
        $$SINGLETONS();
        TaskSupport$$SINGLETONS();
        IntrinsicsSupport$$SINGLETONS();
        $$INITIALIZATION();
    }
}
