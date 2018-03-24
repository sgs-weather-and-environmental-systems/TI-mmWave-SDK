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

public class ti_sysbios_family_arm_v7r
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
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.v7r", new Value.Obj("ti.sysbios.family.arm.v7r", pkgP));
    }

    void Cache$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.Cache.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v7r.Cache", new Value.Obj("ti.sysbios.family.arm.v7r.Cache", po));
        pkgV.bind("Cache", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.v7r.Cache.Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arm.v7r"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.Cache$$CacheInfoView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.Cache.CacheInfoView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.Cache$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.Cache.Module_State", new Proto.Str(spo, false));
    }

    void Cache$$CONSTS()
    {
        // module Cache
        om.bind("ti.sysbios.family.arm.v7r.Cache.enable", new Extern("ti_sysbios_family_arm_v7r_Cache_enable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.inv", new Extern("ti_sysbios_family_arm_v7r_Cache_inv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.wb", new Extern("ti_sysbios_family_arm_v7r_Cache_wb__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.wbInv", new Extern("ti_sysbios_family_arm_v7r_Cache_wbInv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.wbAll", new Extern("ti_sysbios_family_arm_v7r_Cache_wbAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.wbInvAll", new Extern("ti_sysbios_family_arm_v7r_Cache_wbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.wait", new Extern("ti_sysbios_family_arm_v7r_Cache_wait__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.disable", new Extern("ti_sysbios_family_arm_v7r_Cache_disable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.getEnabled", new Extern("ti_sysbios_family_arm_v7r_Cache_getEnabled__E", "xdc_Bits16(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.invL1dAll", new Extern("ti_sysbios_family_arm_v7r_Cache_invL1dAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.invL1pAll", new Extern("ti_sysbios_family_arm_v7r_Cache_invL1pAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.enableBP", new Extern("ti_sysbios_family_arm_v7r_Cache_enableBP__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.disableBP", new Extern("ti_sysbios_family_arm_v7r_Cache_disableBP__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.invBPAll", new Extern("ti_sysbios_family_arm_v7r_Cache_invBPAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.initModuleState", new Extern("ti_sysbios_family_arm_v7r_Cache_initModuleState__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.startup", new Extern("ti_sysbios_family_arm_v7r_Cache_startup__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.disableL1d", new Extern("ti_sysbios_family_arm_v7r_Cache_disableL1d__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.disableL1p", new Extern("ti_sysbios_family_arm_v7r_Cache_disableL1p__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.enableL1d", new Extern("ti_sysbios_family_arm_v7r_Cache_enableL1d__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.enableL1p", new Extern("ti_sysbios_family_arm_v7r_Cache_enableL1p__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.invL1d", new Extern("ti_sysbios_family_arm_v7r_Cache_invL1d__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.invL1p", new Extern("ti_sysbios_family_arm_v7r_Cache_invL1p__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.wbInvAllI", new Extern("ti_sysbios_family_arm_v7r_Cache_wbInvAllI__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.Cache.getCacheLevelInfo", new Extern("ti_sysbios_family_arm_v7r_Cache_getCacheLevelInfo__I", "xdc_Bits32(*)(xdc_UInt)", true, false));
    }

    void Cache$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Cache$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cache$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v7r.Cache.Module_State", "ti.sysbios.family.arm.v7r");
        sizes.clear();
        sizes.add(Global.newArray("l1dCacheLineSize", "UInt8"));
        sizes.add(Global.newArray("l1pCacheLineSize", "UInt8"));
        sizes.add(Global.newArray("l1dInfo", "UInt32"));
        sizes.add(Global.newArray("l1pInfo", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v7r.Cache.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v7r.Cache.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v7r.Cache.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Cache$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7r/Cache.xs");
        om.bind("ti.sysbios.family.arm.v7r.Cache$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.Cache.Module", "ti.sysbios.family.arm.v7r");
        po.init("ti.sysbios.family.arm.v7r.Cache.Module", om.findStrict("ti.sysbios.interfaces.ICache.Module", "ti.sysbios.family.arm.v7r"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.v7r"), $$UNDEF, "wh");
            po.addFld("A_badBlockLength", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.v7r"), Global.newObject("msg", "A_badBlockLength: Block length too large. Must be <= L2 way size."), "w");
            po.addFld("A_blockCrossesPage", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.v7r"), Global.newObject("msg", "A_blockCrossesPage: Memory block crosses L2 way page boundary."), "w");
            po.addFld("enableCache", $$T_Bool, true, "w");
            po.addFld("branchPredictionEnabled", $$T_Bool, true, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.Cache$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.Cache$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.Cache$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.Cache$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Cache.CacheInfoView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.Cache$$CacheInfoView", "ti.sysbios.family.arm.v7r");
        po.init("ti.sysbios.family.arm.v7r.Cache.CacheInfoView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("cache", $$T_Str, $$UNDEF, "w");
                po.addFld("cacheSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("lineSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("ways", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("waySize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
        // struct Cache.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.Cache$$Module_State", "ti.sysbios.family.arm.v7r");
        po.init("ti.sysbios.family.arm.v7r.Cache.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("l1dCacheLineSize", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("l1pCacheLineSize", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("l1dInfo", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l1pInfo", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
    }

    void Cache$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.Cache", "ti.sysbios.family.arm.v7r");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v7r.Cache.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.Cache$$Module_State", "ti.sysbios.family.arm.v7r");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.v7r.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.v7r"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7r/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.v7r"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.v7r"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.v7r"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.v7r"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.v7r"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.v7r"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.v7r", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.v7r");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.v7r.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.v7r'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.v7r$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.v7r$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.v7r$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7r.aer5f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7r.aer4f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7r.aer4ft',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7r.aer5f', {target: 'ti.targets.arm.elf.R5F', suffix: 'er5f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7r.aer4f', {target: 'ti.targets.arm.elf.R4F', suffix: 'er4f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7r.aer4ft', {target: 'ti.targets.arm.elf.R4Ft', suffix: 'er4ft'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Cache$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.Cache", "ti.sysbios.family.arm.v7r");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.Cache.Module", "ti.sysbios.family.arm.v7r");
        vo.init2(po, "ti.sysbios.family.arm.v7r.Cache", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v7r.Cache$$capsule", "ti.sysbios.family.arm.v7r"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v7r", "ti.sysbios.family.arm.v7r"));
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
        vo.bind("Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arm.v7r"));
        vo.bind("CacheInfoView", om.findStrict("ti.sysbios.family.arm.v7r.Cache.CacheInfoView", "ti.sysbios.family.arm.v7r"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7r.Cache.CacheInfoView", "ti.sysbios.family.arm.v7r"));
        mcfgs.add("A_badBlockLength");
        mcfgs.add("A_blockCrossesPage");
        mcfgs.add("enableCache");
        mcfgs.add("branchPredictionEnabled");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.v7r.Cache.Module_State", "ti.sysbios.family.arm.v7r"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7r.Cache.Module_State", "ti.sysbios.family.arm.v7r"));
        vo.bind("Type_L1P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1P", "ti.sysbios.family.arm.v7r"));
        vo.bind("Type_L1D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1D", "ti.sysbios.family.arm.v7r"));
        vo.bind("Type_L1", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1", "ti.sysbios.family.arm.v7r"));
        vo.bind("Type_L2P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2P", "ti.sysbios.family.arm.v7r"));
        vo.bind("Type_L2D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2D", "ti.sysbios.family.arm.v7r"));
        vo.bind("Type_L2", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2", "ti.sysbios.family.arm.v7r"));
        vo.bind("Type_ALLP", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLP", "ti.sysbios.family.arm.v7r"));
        vo.bind("Type_ALLD", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLD", "ti.sysbios.family.arm.v7r"));
        vo.bind("Type_ALL", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALL", "ti.sysbios.family.arm.v7r"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v7r")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.v7r.Cache.enable", "ti.sysbios.family.arm.v7r"));
        vo.bind("inv", om.findStrict("ti.sysbios.family.arm.v7r.Cache.inv", "ti.sysbios.family.arm.v7r"));
        vo.bind("wb", om.findStrict("ti.sysbios.family.arm.v7r.Cache.wb", "ti.sysbios.family.arm.v7r"));
        vo.bind("wbInv", om.findStrict("ti.sysbios.family.arm.v7r.Cache.wbInv", "ti.sysbios.family.arm.v7r"));
        vo.bind("wbAll", om.findStrict("ti.sysbios.family.arm.v7r.Cache.wbAll", "ti.sysbios.family.arm.v7r"));
        vo.bind("wbInvAll", om.findStrict("ti.sysbios.family.arm.v7r.Cache.wbInvAll", "ti.sysbios.family.arm.v7r"));
        vo.bind("wait", om.findStrict("ti.sysbios.family.arm.v7r.Cache.wait", "ti.sysbios.family.arm.v7r"));
        vo.bind("disable", om.findStrict("ti.sysbios.family.arm.v7r.Cache.disable", "ti.sysbios.family.arm.v7r"));
        vo.bind("getEnabled", om.findStrict("ti.sysbios.family.arm.v7r.Cache.getEnabled", "ti.sysbios.family.arm.v7r"));
        vo.bind("invL1dAll", om.findStrict("ti.sysbios.family.arm.v7r.Cache.invL1dAll", "ti.sysbios.family.arm.v7r"));
        vo.bind("invL1pAll", om.findStrict("ti.sysbios.family.arm.v7r.Cache.invL1pAll", "ti.sysbios.family.arm.v7r"));
        vo.bind("enableBP", om.findStrict("ti.sysbios.family.arm.v7r.Cache.enableBP", "ti.sysbios.family.arm.v7r"));
        vo.bind("disableBP", om.findStrict("ti.sysbios.family.arm.v7r.Cache.disableBP", "ti.sysbios.family.arm.v7r"));
        vo.bind("invBPAll", om.findStrict("ti.sysbios.family.arm.v7r.Cache.invBPAll", "ti.sysbios.family.arm.v7r"));
        vo.bind("initModuleState", om.findStrict("ti.sysbios.family.arm.v7r.Cache.initModuleState", "ti.sysbios.family.arm.v7r"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.v7r.Cache.startup", "ti.sysbios.family.arm.v7r"));
        vo.bind("disableL1d", om.findStrict("ti.sysbios.family.arm.v7r.Cache.disableL1d", "ti.sysbios.family.arm.v7r"));
        vo.bind("disableL1p", om.findStrict("ti.sysbios.family.arm.v7r.Cache.disableL1p", "ti.sysbios.family.arm.v7r"));
        vo.bind("enableL1d", om.findStrict("ti.sysbios.family.arm.v7r.Cache.enableL1d", "ti.sysbios.family.arm.v7r"));
        vo.bind("enableL1p", om.findStrict("ti.sysbios.family.arm.v7r.Cache.enableL1p", "ti.sysbios.family.arm.v7r"));
        vo.bind("invL1d", om.findStrict("ti.sysbios.family.arm.v7r.Cache.invL1d", "ti.sysbios.family.arm.v7r"));
        vo.bind("invL1p", om.findStrict("ti.sysbios.family.arm.v7r.Cache.invL1p", "ti.sysbios.family.arm.v7r"));
        vo.bind("wbInvAllI", om.findStrict("ti.sysbios.family.arm.v7r.Cache.wbInvAllI", "ti.sysbios.family.arm.v7r"));
        vo.bind("getCacheLevelInfo", om.findStrict("ti.sysbios.family.arm.v7r.Cache.getCacheLevelInfo", "ti.sysbios.family.arm.v7r"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v7r_Cache_Module__startupDone__E", "ti_sysbios_family_arm_v7r_Cache_enable__E", "ti_sysbios_family_arm_v7r_Cache_inv__E", "ti_sysbios_family_arm_v7r_Cache_wb__E", "ti_sysbios_family_arm_v7r_Cache_wbInv__E", "ti_sysbios_family_arm_v7r_Cache_wbAll__E", "ti_sysbios_family_arm_v7r_Cache_wbInvAll__E", "ti_sysbios_family_arm_v7r_Cache_wait__E", "ti_sysbios_family_arm_v7r_Cache_disable__E", "ti_sysbios_family_arm_v7r_Cache_getEnabled__E", "ti_sysbios_family_arm_v7r_Cache_invL1dAll__E", "ti_sysbios_family_arm_v7r_Cache_invL1pAll__E", "ti_sysbios_family_arm_v7r_Cache_enableBP__E", "ti_sysbios_family_arm_v7r_Cache_disableBP__E", "ti_sysbios_family_arm_v7r_Cache_invBPAll__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_badBlockLength", "A_blockCrossesPage"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Cache", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Cache");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v7r.Cache", "ti.sysbios.family.arm.v7r"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.Cache", "ti.sysbios.family.arm.v7r");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Cache Info", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitCacheInfo", "structName", "CacheInfoView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v7r.Cache")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.v7r")).add(pkgV);
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
        Cache$$OBJECTS();
        Cache$$CONSTS();
        Cache$$CREATES();
        Cache$$FUNCTIONS();
        Cache$$SIZES();
        Cache$$TYPES();
        if (isROV) {
            Cache$$ROV();
        }//isROV
        $$SINGLETONS();
        Cache$$SINGLETONS();
        $$INITIALIZATION();
    }
}
