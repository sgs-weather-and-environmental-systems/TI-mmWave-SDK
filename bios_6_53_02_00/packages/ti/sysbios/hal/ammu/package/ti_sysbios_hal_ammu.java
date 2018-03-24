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

public class ti_sysbios_hal_ammu
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
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.hal.ammu.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.hal.ammu", new Value.Obj("ti.sysbios.hal.ammu", pkgP));
    }

    void AMMU$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.hal.ammu.AMMU.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.hal.ammu.AMMU", new Value.Obj("ti.sysbios.hal.ammu.AMMU", po));
        pkgV.bind("AMMU", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.ammu.AMMU$$PageView", new Proto.Obj());
        om.bind("ti.sysbios.hal.ammu.AMMU.PageView", new Proto.Str(spo, false));
        om.bind("ti.sysbios.hal.ammu.AMMU.Small", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.Small"));
        om.bind("ti.sysbios.hal.ammu.AMMU.Medium", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.Medium"));
        om.bind("ti.sysbios.hal.ammu.AMMU.Large", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.Large"));
        om.bind("ti.sysbios.hal.ammu.AMMU.Volatile", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.Volatile"));
        om.bind("ti.sysbios.hal.ammu.AMMU.CachePolicy", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.CachePolicy"));
        om.bind("ti.sysbios.hal.ammu.AMMU.PostedPolicy", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.PostedPolicy"));
        om.bind("ti.sysbios.hal.ammu.AMMU.AllocatePolicy", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.AllocatePolicy"));
        om.bind("ti.sysbios.hal.ammu.AMMU.WritePolicy", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.WritePolicy"));
        om.bind("ti.sysbios.hal.ammu.AMMU.Enable", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.Enable"));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.ammu.AMMU$$LargePage", new Proto.Obj());
        om.bind("ti.sysbios.hal.ammu.AMMU.LargePage", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.ammu.AMMU$$MediumPage", new Proto.Obj());
        om.bind("ti.sysbios.hal.ammu.AMMU.MediumPage", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.ammu.AMMU$$SmallPage", new Proto.Obj());
        om.bind("ti.sysbios.hal.ammu.AMMU.SmallPage", new Proto.Str(spo, false));
        om.bind("ti.sysbios.hal.ammu.AMMU.Maintenance", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.Maintenance"));
        om.bind("ti.sysbios.hal.ammu.AMMU.Invalidate", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.Invalidate"));
        om.bind("ti.sysbios.hal.ammu.AMMU.Unlock", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.Unlock"));
        om.bind("ti.sysbios.hal.ammu.AMMU.Lock", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.Lock"));
        om.bind("ti.sysbios.hal.ammu.AMMU.Clean", new Proto.Enm("ti.sysbios.hal.ammu.AMMU.Clean"));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.ammu.AMMU$$SmallPageMaintenance", new Proto.Obj());
        om.bind("ti.sysbios.hal.ammu.AMMU.SmallPageMaintenance", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.ammu.AMMU$$LinePage", new Proto.Obj());
        om.bind("ti.sysbios.hal.ammu.AMMU.LinePage", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.ammu.AMMU$$DebugPage", new Proto.Obj());
        om.bind("ti.sysbios.hal.ammu.AMMU.DebugPage", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.ammu.AMMU$$MMU", new Proto.Obj());
        om.bind("ti.sysbios.hal.ammu.AMMU.MMU", new Proto.Str(spo, false));
    }

    void AMMU$$CONSTS()
    {
        // module AMMU
        om.bind("ti.sysbios.hal.ammu.AMMU.Small_4K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Small", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Small_4K", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.Small_8K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Small", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Small_8K", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.Small_16K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Small", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Small_16K", 2));
        om.bind("ti.sysbios.hal.ammu.AMMU.Small_32K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Small", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Small_32K", 3));
        om.bind("ti.sysbios.hal.ammu.AMMU.Medium_128K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Medium", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Medium_128K", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.Medium_256K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Medium", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Medium_256K", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.Medium_512K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Medium", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Medium_512K", 2));
        om.bind("ti.sysbios.hal.ammu.AMMU.Medium_1M", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Medium", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Medium_1M", 3));
        om.bind("ti.sysbios.hal.ammu.AMMU.Large_2M", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Large_2M", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.Large_4M", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Large_4M", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.Large_8M", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Large_8M", 2));
        om.bind("ti.sysbios.hal.ammu.AMMU.Large_16M", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Large_16M", 3));
        om.bind("ti.sysbios.hal.ammu.AMMU.Large_32M", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Large_32M", 4));
        om.bind("ti.sysbios.hal.ammu.AMMU.Large_64M", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Large_64M", 5));
        om.bind("ti.sysbios.hal.ammu.AMMU.Large_128M", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Large_128M", 6));
        om.bind("ti.sysbios.hal.ammu.AMMU.Large_256M", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Large_256M", 7));
        om.bind("ti.sysbios.hal.ammu.AMMU.Large_512M", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Large_512M", 8));
        om.bind("ti.sysbios.hal.ammu.AMMU.Volatile_DO_NOT_FOLLOW", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Volatile", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Volatile_DO_NOT_FOLLOW", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.Volatile_FOLLOW", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Volatile", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Volatile_FOLLOW", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.CachePolicy_NON_CACHEABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.CachePolicy_NON_CACHEABLE", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.CachePolicy_CACHEABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.CachePolicy_CACHEABLE", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.PostedPolicy_NON_POSTED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.PostedPolicy_NON_POSTED", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.PostedPolicy_POSTED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.PostedPolicy_POSTED", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.AllocatePolicy_NON_ALLOCATE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.AllocatePolicy_NON_ALLOCATE", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.AllocatePolicy_ALLOCATE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.AllocatePolicy_ALLOCATE", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.WritePolicy_WRITE_THROUGH", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.WritePolicy_WRITE_THROUGH", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.WritePolicy_WRITE_BACK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.WritePolicy_WRITE_BACK", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.Enable_NO", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Enable_NO", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.Enable_YES", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.Enable_YES", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.DO_NOT_PERFORM", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Maintenance", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.DO_NOT_PERFORM", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.PERFORM", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Maintenance", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.PERFORM", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.DO_NOT_INVALIDATE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Invalidate", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.DO_NOT_INVALIDATE", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.INVALIDATE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Invalidate", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.INVALIDATE", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.DO_NOT_UNLOCK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Unlock", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.DO_NOT_UNLOCK", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.UNLOCK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Unlock", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.UNLOCK", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.DO_NOT_LOCK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Lock", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.DO_NOT_LOCK", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.LOCK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Lock", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.LOCK", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.DO_NOT_CLEAN", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Clean", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.DO_NOT_CLEAN", 0));
        om.bind("ti.sysbios.hal.ammu.AMMU.CLEAN", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.hal.ammu.AMMU.Clean", "ti.sysbios.hal.ammu"), "ti.sysbios.hal.ammu.AMMU.CLEAN", 1));
        om.bind("ti.sysbios.hal.ammu.AMMU.mmu", new Extern("ti_sysbios_hal_ammu_AMMU_mmu", "ti_sysbios_hal_ammu_AMMU_MMU*", false, false));
        om.bind("ti.sysbios.hal.ammu.AMMU.invAll", new Extern("ti_sysbios_hal_ammu_AMMU_invAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.hal.ammu.AMMU.dumpAmmu", new Extern("ti_sysbios_hal_ammu_AMMU_dumpAmmu__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.hal.ammu.AMMU.init", new Extern("ti_sysbios_hal_ammu_AMMU_init__E", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void AMMU$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void AMMU$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn AMMU.pageSizeFilter
        fxn = (Proto.Fxn)om.bind("ti.sysbios.hal.ammu.AMMU$$pageSizeFilter", new Proto.Fxn(om.findStrict("ti.sysbios.hal.ammu.AMMU.Module", "ti.sysbios.hal.ammu"), $$T_Obj, 3, 3, false));
                fxn.addArg(0, "op", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(1, "paramName", $$T_Str, $$UNDEF);
                fxn.addArg(2, "value", $$T_Str, $$UNDEF);
    }

    void AMMU$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.hal.ammu.AMMU.MMU", "ti.sysbios.hal.ammu");
        sizes.clear();
        sizes.add(Global.newArray("LARGE_ADDR", "A8;UPtr"));
        sizes.add(Global.newArray("LARGE_XLTE", "A8;UPtr"));
        sizes.add(Global.newArray("LARGE_POLICY", "A8;UInt32"));
        sizes.add(Global.newArray("MEDIUM_ADDR", "A16;UPtr"));
        sizes.add(Global.newArray("MEDIUM_XLTE", "A16;UPtr"));
        sizes.add(Global.newArray("MEDIUM_POLICY", "A16;UInt32"));
        sizes.add(Global.newArray("SMALL_ADDR", "A32;UPtr"));
        sizes.add(Global.newArray("SMALL_XLTE", "A32;UPtr"));
        sizes.add(Global.newArray("SMALL_POLICY", "A32;UInt32"));
        sizes.add(Global.newArray("SMALL_MAINT", "A32;UInt32"));
        sizes.add(Global.newArray("LINE_ADDR", "A32;UPtr"));
        sizes.add(Global.newArray("LINE_XLTE", "A32;UPtr"));
        sizes.add(Global.newArray("LINE_POLICY", "A32;UInt32"));
        sizes.add(Global.newArray("DEBUG_XLTE", "UPtr"));
        sizes.add(Global.newArray("DEBUG_POLICY", "UInt32"));
        sizes.add(Global.newArray("MAINT", "UInt32"));
        sizes.add(Global.newArray("MSTART", "UPtr"));
        sizes.add(Global.newArray("MEND", "UPtr"));
        sizes.add(Global.newArray("MSTAT", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.hal.ammu.AMMU.MMU']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.hal.ammu.AMMU.MMU']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.hal.ammu.AMMU.MMU'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void AMMU$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/hal/ammu/AMMU.xs");
        om.bind("ti.sysbios.hal.ammu.AMMU$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU.Module", "ti.sysbios.hal.ammu");
        po.init("ti.sysbios.hal.ammu.AMMU.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.hal.ammu"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("filteredNameMap$", new Proto.Map((Proto)om.findStrict("xdc.runtime.Types.ViewInfo", "ti.sysbios.hal.ammu")), Global.newArray(new Object[]{Global.newArray(new Object[]{"Filtered Variables", Global.newObject("viewType", "module", "viewFxn", "pageSizeFilter", "fields", Global.newArray(new Object[]{"largePages", "mediumPages", "smallPages"}))})}), "rh");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.hal.ammu"), $$UNDEF, "wh");
            po.addFld("largePages", new Proto.Arr((Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.LargePage", "ti.sysbios.hal.ammu"), false), Global.newArray(new Object[]{}), "wh");
            po.addFld("mediumPages", new Proto.Arr((Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.MediumPage", "ti.sysbios.hal.ammu"), false), Global.newArray(new Object[]{}), "wh");
            po.addFld("smallPages", new Proto.Arr((Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.SmallPage", "ti.sysbios.hal.ammu"), false), Global.newArray(new Object[]{}), "wh");
            po.addFld("linePages", new Proto.Arr((Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.LinePage", "ti.sysbios.hal.ammu"), false), Global.newArray(new Object[]{}), "wh");
            po.addFld("debugPage", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.DebugPage", "ti.sysbios.hal.ammu"), $$DEFAULT, "wh");
            po.addFld("configureAmmu", $$T_Bool, true, "w");
            po.addFld("numLargePages", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("numMediumPages", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("numSmallPages", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("numLinePages", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("baseAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
            po.addFld("mmuInitConfig", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.MMU", "ti.sysbios.hal.ammu"), $$DEFAULT, "w");
            po.addFld("largePageSizeStrings", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
            po.addFld("mediumPageSizeStrings", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
            po.addFld("smallPageSizeStrings", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.hal.ammu.AMMU$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.hal.ammu.AMMU$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.hal.ammu.AMMU$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.hal.ammu.AMMU$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("pageSizeFilter", (Proto.Fxn)om.findStrict("ti.sysbios.hal.ammu.AMMU$$pageSizeFilter", "ti.sysbios.hal.ammu"), Global.get(cap, "pageSizeFilter"));
        // struct AMMU.PageView
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU$$PageView", "ti.sysbios.hal.ammu");
        po.init("ti.sysbios.hal.ammu.AMMU.PageView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("Page", $$T_Str, $$UNDEF, "w");
                po.addFld("AddrVirtual", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("AddrPhysical", $$T_Str, $$UNDEF, "w");
                po.addFld("Enabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("L1Cacheable", $$T_Bool, $$UNDEF, "w");
                po.addFld("L1WrPolicy", $$T_Str, $$UNDEF, "w");
                po.addFld("L1AllocPolicy", $$T_Str, $$UNDEF, "w");
                po.addFld("L1Posted", $$T_Bool, $$UNDEF, "w");
                po.addFld("L2Cacheable", $$T_Bool, $$UNDEF, "w");
                po.addFld("L2WrPolicy", $$T_Str, $$UNDEF, "w");
                po.addFld("L2AllocPolicy", $$T_Str, $$UNDEF, "w");
                po.addFld("L2Posted", $$T_Bool, $$UNDEF, "w");
                po.addFld("ReadOnly", $$T_Bool, $$UNDEF, "w");
                po.addFld("ExecOnly", $$T_Bool, $$UNDEF, "w");
        // struct AMMU.LargePage
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU$$LargePage", "ti.sysbios.hal.ammu");
        po.init("ti.sysbios.hal.ammu.AMMU.LargePage", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("pageEnabled", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("logicalAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("translationEnabled", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("translatedAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("size", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("volatileQualifier", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Volatile", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("executeOnly", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("readOnly", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("prefetch", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("exclusion", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_cacheable", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_posted", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_allocate", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_writePolicy", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_cacheable", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_posted", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_allocate", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_writePolicy", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
        // struct AMMU.MediumPage
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU$$MediumPage", "ti.sysbios.hal.ammu");
        po.init("ti.sysbios.hal.ammu.AMMU.MediumPage", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("pageEnabled", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("logicalAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("translationEnabled", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("translatedAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("size", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Medium", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("volatileQualifier", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Volatile", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("executeOnly", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("readOnly", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("prefetch", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("exclusion", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_cacheable", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_posted", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_allocate", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_writePolicy", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_cacheable", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_posted", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_allocate", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_writePolicy", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
        // struct AMMU.SmallPage
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU$$SmallPage", "ti.sysbios.hal.ammu");
        po.init("ti.sysbios.hal.ammu.AMMU.SmallPage", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("pageEnabled", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("logicalAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("translationEnabled", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("translatedAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("size", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Small", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("volatileQualifier", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Volatile", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("executeOnly", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("readOnly", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("prefetch", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("exclusion", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_cacheable", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_posted", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_allocate", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L1_writePolicy", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_cacheable", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_posted", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_allocate", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("L2_writePolicy", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
        // struct AMMU.SmallPageMaintenance
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU$$SmallPageMaintenance", "ti.sysbios.hal.ammu");
        po.init("ti.sysbios.hal.ammu.AMMU.SmallPageMaintenance", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("maintL2Cache", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Maintenance", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("maintL1Cache2", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Maintenance", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("maintL1Cache1", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Maintenance", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("cpuInterrupt", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("hostInterrupt", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("invalidate", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Invalidate", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("clean", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Clean", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("unlock", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Unlock", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("lock", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Lock", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("preload", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
        // struct AMMU.LinePage
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU$$LinePage", "ti.sysbios.hal.ammu");
        po.init("ti.sysbios.hal.ammu.AMMU.LinePage", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("pageEnabled", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("logicalAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("translationEnabled", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("translatedAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct AMMU.DebugPage
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU$$DebugPage", "ti.sysbios.hal.ammu");
        po.init("ti.sysbios.hal.ammu.AMMU.DebugPage", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("pageEnabled", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("translationEnabled", (Proto)om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"), $$UNDEF, "w");
                po.addFld("translatedAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct AMMU.MMU
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU$$MMU", "ti.sysbios.hal.ammu");
        po.init("ti.sysbios.hal.ammu.AMMU.MMU", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("LARGE_ADDR", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("LARGE_XLTE", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("LARGE_POLICY", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("MEDIUM_ADDR", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
                po.addFld("MEDIUM_XLTE", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
                po.addFld("MEDIUM_POLICY", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
                po.addFld("SMALL_ADDR", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("SMALL_XLTE", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("SMALL_POLICY", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("SMALL_MAINT", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("LINE_ADDR", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("LINE_XLTE", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("LINE_POLICY", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("DEBUG_XLTE", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("DEBUG_POLICY", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MAINT", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MSTART", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("MEND", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("MSTAT", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
    }

    void AMMU$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU", "ti.sysbios.hal.ammu");
        vo.bind("MMU$fetchDesc", Global.newObject("type", "ti.sysbios.hal.ammu.AMMU.MMU", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU$$MMU", "ti.sysbios.hal.ammu");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.hal.ammu.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.hal.ammu"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/hal/ammu/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.hal.ammu"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.hal.ammu"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.hal.ammu"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.hal.ammu"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.hal.ammu"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.hal.ammu"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.hal.ammu", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.hal.ammu");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.hal.ammu.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.hal.ammu'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.hal.ammu$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.hal.ammu$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.hal.ammu$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.ammu.aem3',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.ammu.aem4',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.ammu.aem4f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.ammu.am3g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.ammu.am4g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.ammu.am4fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.ammu.arm3',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.ammu.arm4',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.ammu.arm4f',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.hal.ammu.aem3',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.hal.ammu.aem4',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.ammu.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.ammu.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.ammu.aem4f', {target: 'ti.targets.arm.elf.M4F', suffix: 'em4f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.ammu.am3g', {target: 'gnu.targets.arm.M3', suffix: 'm3g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.ammu.am4g', {target: 'gnu.targets.arm.M4', suffix: 'm4g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.ammu.am4fg', {target: 'gnu.targets.arm.M4F', suffix: 'm4fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.ammu.arm3', {target: 'iar.targets.arm.M3', suffix: 'rm3'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.ammu.arm4', {target: 'iar.targets.arm.M4', suffix: 'rm4'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.ammu.arm4f', {target: 'iar.targets.arm.M4F', suffix: 'rm4f'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.hal.ammu.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.hal.ammu.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void AMMU$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU", "ti.sysbios.hal.ammu");
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU.Module", "ti.sysbios.hal.ammu");
        vo.init2(po, "ti.sysbios.hal.ammu.AMMU", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.hal.ammu.AMMU$$capsule", "ti.sysbios.hal.ammu"));
        vo.bind("$package", om.findStrict("ti.sysbios.hal.ammu", "ti.sysbios.hal.ammu"));
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
        vo.bind("PageView", om.findStrict("ti.sysbios.hal.ammu.AMMU.PageView", "ti.sysbios.hal.ammu"));
        tdefs.add(om.findStrict("ti.sysbios.hal.ammu.AMMU.PageView", "ti.sysbios.hal.ammu"));
        vo.bind("Small", om.findStrict("ti.sysbios.hal.ammu.AMMU.Small", "ti.sysbios.hal.ammu"));
        vo.bind("Medium", om.findStrict("ti.sysbios.hal.ammu.AMMU.Medium", "ti.sysbios.hal.ammu"));
        vo.bind("Large", om.findStrict("ti.sysbios.hal.ammu.AMMU.Large", "ti.sysbios.hal.ammu"));
        vo.bind("Volatile", om.findStrict("ti.sysbios.hal.ammu.AMMU.Volatile", "ti.sysbios.hal.ammu"));
        vo.bind("CachePolicy", om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy", "ti.sysbios.hal.ammu"));
        vo.bind("PostedPolicy", om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy", "ti.sysbios.hal.ammu"));
        vo.bind("AllocatePolicy", om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy", "ti.sysbios.hal.ammu"));
        vo.bind("WritePolicy", om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy", "ti.sysbios.hal.ammu"));
        vo.bind("Enable", om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable", "ti.sysbios.hal.ammu"));
        vo.bind("LargePage", om.findStrict("ti.sysbios.hal.ammu.AMMU.LargePage", "ti.sysbios.hal.ammu"));
        tdefs.add(om.findStrict("ti.sysbios.hal.ammu.AMMU.LargePage", "ti.sysbios.hal.ammu"));
        vo.bind("MediumPage", om.findStrict("ti.sysbios.hal.ammu.AMMU.MediumPage", "ti.sysbios.hal.ammu"));
        tdefs.add(om.findStrict("ti.sysbios.hal.ammu.AMMU.MediumPage", "ti.sysbios.hal.ammu"));
        vo.bind("SmallPage", om.findStrict("ti.sysbios.hal.ammu.AMMU.SmallPage", "ti.sysbios.hal.ammu"));
        tdefs.add(om.findStrict("ti.sysbios.hal.ammu.AMMU.SmallPage", "ti.sysbios.hal.ammu"));
        vo.bind("Maintenance", om.findStrict("ti.sysbios.hal.ammu.AMMU.Maintenance", "ti.sysbios.hal.ammu"));
        vo.bind("Invalidate", om.findStrict("ti.sysbios.hal.ammu.AMMU.Invalidate", "ti.sysbios.hal.ammu"));
        vo.bind("Unlock", om.findStrict("ti.sysbios.hal.ammu.AMMU.Unlock", "ti.sysbios.hal.ammu"));
        vo.bind("Lock", om.findStrict("ti.sysbios.hal.ammu.AMMU.Lock", "ti.sysbios.hal.ammu"));
        vo.bind("Clean", om.findStrict("ti.sysbios.hal.ammu.AMMU.Clean", "ti.sysbios.hal.ammu"));
        vo.bind("SmallPageMaintenance", om.findStrict("ti.sysbios.hal.ammu.AMMU.SmallPageMaintenance", "ti.sysbios.hal.ammu"));
        tdefs.add(om.findStrict("ti.sysbios.hal.ammu.AMMU.SmallPageMaintenance", "ti.sysbios.hal.ammu"));
        vo.bind("LinePage", om.findStrict("ti.sysbios.hal.ammu.AMMU.LinePage", "ti.sysbios.hal.ammu"));
        tdefs.add(om.findStrict("ti.sysbios.hal.ammu.AMMU.LinePage", "ti.sysbios.hal.ammu"));
        vo.bind("DebugPage", om.findStrict("ti.sysbios.hal.ammu.AMMU.DebugPage", "ti.sysbios.hal.ammu"));
        tdefs.add(om.findStrict("ti.sysbios.hal.ammu.AMMU.DebugPage", "ti.sysbios.hal.ammu"));
        vo.bind("MMU", om.findStrict("ti.sysbios.hal.ammu.AMMU.MMU", "ti.sysbios.hal.ammu"));
        tdefs.add(om.findStrict("ti.sysbios.hal.ammu.AMMU.MMU", "ti.sysbios.hal.ammu"));
        vo.bind("mmu", om.findStrict("ti.sysbios.hal.ammu.AMMU.mmu", "ti.sysbios.hal.ammu"));
        mcfgs.add("configureAmmu");
        mcfgs.add("numLargePages");
        icfgs.add("numLargePages");
        mcfgs.add("numMediumPages");
        icfgs.add("numMediumPages");
        mcfgs.add("numSmallPages");
        icfgs.add("numSmallPages");
        mcfgs.add("numLinePages");
        icfgs.add("numLinePages");
        icfgs.add("baseAddr");
        mcfgs.add("mmuInitConfig");
        icfgs.add("mmuInitConfig");
        icfgs.add("largePageSizeStrings");
        icfgs.add("mediumPageSizeStrings");
        icfgs.add("smallPageSizeStrings");
        vo.bind("Small_4K", om.findStrict("ti.sysbios.hal.ammu.AMMU.Small_4K", "ti.sysbios.hal.ammu"));
        vo.bind("Small_8K", om.findStrict("ti.sysbios.hal.ammu.AMMU.Small_8K", "ti.sysbios.hal.ammu"));
        vo.bind("Small_16K", om.findStrict("ti.sysbios.hal.ammu.AMMU.Small_16K", "ti.sysbios.hal.ammu"));
        vo.bind("Small_32K", om.findStrict("ti.sysbios.hal.ammu.AMMU.Small_32K", "ti.sysbios.hal.ammu"));
        vo.bind("Medium_128K", om.findStrict("ti.sysbios.hal.ammu.AMMU.Medium_128K", "ti.sysbios.hal.ammu"));
        vo.bind("Medium_256K", om.findStrict("ti.sysbios.hal.ammu.AMMU.Medium_256K", "ti.sysbios.hal.ammu"));
        vo.bind("Medium_512K", om.findStrict("ti.sysbios.hal.ammu.AMMU.Medium_512K", "ti.sysbios.hal.ammu"));
        vo.bind("Medium_1M", om.findStrict("ti.sysbios.hal.ammu.AMMU.Medium_1M", "ti.sysbios.hal.ammu"));
        vo.bind("Large_2M", om.findStrict("ti.sysbios.hal.ammu.AMMU.Large_2M", "ti.sysbios.hal.ammu"));
        vo.bind("Large_4M", om.findStrict("ti.sysbios.hal.ammu.AMMU.Large_4M", "ti.sysbios.hal.ammu"));
        vo.bind("Large_8M", om.findStrict("ti.sysbios.hal.ammu.AMMU.Large_8M", "ti.sysbios.hal.ammu"));
        vo.bind("Large_16M", om.findStrict("ti.sysbios.hal.ammu.AMMU.Large_16M", "ti.sysbios.hal.ammu"));
        vo.bind("Large_32M", om.findStrict("ti.sysbios.hal.ammu.AMMU.Large_32M", "ti.sysbios.hal.ammu"));
        vo.bind("Large_64M", om.findStrict("ti.sysbios.hal.ammu.AMMU.Large_64M", "ti.sysbios.hal.ammu"));
        vo.bind("Large_128M", om.findStrict("ti.sysbios.hal.ammu.AMMU.Large_128M", "ti.sysbios.hal.ammu"));
        vo.bind("Large_256M", om.findStrict("ti.sysbios.hal.ammu.AMMU.Large_256M", "ti.sysbios.hal.ammu"));
        vo.bind("Large_512M", om.findStrict("ti.sysbios.hal.ammu.AMMU.Large_512M", "ti.sysbios.hal.ammu"));
        vo.bind("Volatile_DO_NOT_FOLLOW", om.findStrict("ti.sysbios.hal.ammu.AMMU.Volatile_DO_NOT_FOLLOW", "ti.sysbios.hal.ammu"));
        vo.bind("Volatile_FOLLOW", om.findStrict("ti.sysbios.hal.ammu.AMMU.Volatile_FOLLOW", "ti.sysbios.hal.ammu"));
        vo.bind("CachePolicy_NON_CACHEABLE", om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy_NON_CACHEABLE", "ti.sysbios.hal.ammu"));
        vo.bind("CachePolicy_CACHEABLE", om.findStrict("ti.sysbios.hal.ammu.AMMU.CachePolicy_CACHEABLE", "ti.sysbios.hal.ammu"));
        vo.bind("PostedPolicy_NON_POSTED", om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy_NON_POSTED", "ti.sysbios.hal.ammu"));
        vo.bind("PostedPolicy_POSTED", om.findStrict("ti.sysbios.hal.ammu.AMMU.PostedPolicy_POSTED", "ti.sysbios.hal.ammu"));
        vo.bind("AllocatePolicy_NON_ALLOCATE", om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy_NON_ALLOCATE", "ti.sysbios.hal.ammu"));
        vo.bind("AllocatePolicy_ALLOCATE", om.findStrict("ti.sysbios.hal.ammu.AMMU.AllocatePolicy_ALLOCATE", "ti.sysbios.hal.ammu"));
        vo.bind("WritePolicy_WRITE_THROUGH", om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy_WRITE_THROUGH", "ti.sysbios.hal.ammu"));
        vo.bind("WritePolicy_WRITE_BACK", om.findStrict("ti.sysbios.hal.ammu.AMMU.WritePolicy_WRITE_BACK", "ti.sysbios.hal.ammu"));
        vo.bind("Enable_NO", om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable_NO", "ti.sysbios.hal.ammu"));
        vo.bind("Enable_YES", om.findStrict("ti.sysbios.hal.ammu.AMMU.Enable_YES", "ti.sysbios.hal.ammu"));
        vo.bind("DO_NOT_PERFORM", om.findStrict("ti.sysbios.hal.ammu.AMMU.DO_NOT_PERFORM", "ti.sysbios.hal.ammu"));
        vo.bind("PERFORM", om.findStrict("ti.sysbios.hal.ammu.AMMU.PERFORM", "ti.sysbios.hal.ammu"));
        vo.bind("DO_NOT_INVALIDATE", om.findStrict("ti.sysbios.hal.ammu.AMMU.DO_NOT_INVALIDATE", "ti.sysbios.hal.ammu"));
        vo.bind("INVALIDATE", om.findStrict("ti.sysbios.hal.ammu.AMMU.INVALIDATE", "ti.sysbios.hal.ammu"));
        vo.bind("DO_NOT_UNLOCK", om.findStrict("ti.sysbios.hal.ammu.AMMU.DO_NOT_UNLOCK", "ti.sysbios.hal.ammu"));
        vo.bind("UNLOCK", om.findStrict("ti.sysbios.hal.ammu.AMMU.UNLOCK", "ti.sysbios.hal.ammu"));
        vo.bind("DO_NOT_LOCK", om.findStrict("ti.sysbios.hal.ammu.AMMU.DO_NOT_LOCK", "ti.sysbios.hal.ammu"));
        vo.bind("LOCK", om.findStrict("ti.sysbios.hal.ammu.AMMU.LOCK", "ti.sysbios.hal.ammu"));
        vo.bind("DO_NOT_CLEAN", om.findStrict("ti.sysbios.hal.ammu.AMMU.DO_NOT_CLEAN", "ti.sysbios.hal.ammu"));
        vo.bind("CLEAN", om.findStrict("ti.sysbios.hal.ammu.AMMU.CLEAN", "ti.sysbios.hal.ammu"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.hal.ammu")).add(vo);
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
        vo.bind("invAll", om.findStrict("ti.sysbios.hal.ammu.AMMU.invAll", "ti.sysbios.hal.ammu"));
        vo.bind("dumpAmmu", om.findStrict("ti.sysbios.hal.ammu.AMMU.dumpAmmu", "ti.sysbios.hal.ammu"));
        vo.bind("init", om.findStrict("ti.sysbios.hal.ammu.AMMU.init", "ti.sysbios.hal.ammu"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_hal_ammu_AMMU_Module__startupDone__E", "ti_sysbios_hal_ammu_AMMU_invAll__E", "ti_sysbios_hal_ammu_AMMU_dumpAmmu__E", "ti_sysbios_hal_ammu_AMMU_init__E"));
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
        pkgV.bind("AMMU", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("AMMU");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.hal.ammu.AMMU", "ti.sysbios.hal.ammu"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.hal.ammu.AMMU", "ti.sysbios.hal.ammu");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"PageView", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages", "structName", "PageView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.hal.ammu.AMMU")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.hal.ammu")).add(pkgV);
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
        AMMU$$OBJECTS();
        AMMU$$CONSTS();
        AMMU$$CREATES();
        AMMU$$FUNCTIONS();
        AMMU$$SIZES();
        AMMU$$TYPES();
        if (isROV) {
            AMMU$$ROV();
        }//isROV
        $$SINGLETONS();
        AMMU$$SINGLETONS();
        $$INITIALIZATION();
    }
}
