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

public class ti_sysbios_hal_unicache
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.hal");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.hal.unicache.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.hal.unicache", new Value.Obj("ti.sysbios.hal.unicache", pkgP));
    }

    void Cache$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.hal.unicache.Cache.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.hal.unicache.Cache", new Value.Obj("ti.sysbios.hal.unicache.Cache", po));
        pkgV.bind("Cache", vo);
        // decls 
        om.bind("ti.sysbios.hal.unicache.Cache.Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.hal.unicache"));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.unicache.Cache$$CACHE", new Proto.Obj());
        om.bind("ti.sysbios.hal.unicache.Cache.CACHE", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.unicache.Cache$$OCPConfig", new Proto.Obj());
        om.bind("ti.sysbios.hal.unicache.Cache.OCPConfig", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.unicache.Cache$$SecurityConfig", new Proto.Obj());
        om.bind("ti.sysbios.hal.unicache.Cache.SecurityConfig", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.hal.unicache.Cache$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.hal.unicache.Cache.ModuleView", new Proto.Str(spo, false));
    }

    void Cache_Module_GateProxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy", new Value.Obj("ti.sysbios.hal.unicache.Cache_Module_GateProxy", po));
        pkgV.bind("Cache_Module_GateProxy", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy$$Object", new Proto.Obj());
        om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy$$Params", new Proto.Obj());
        om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance_State", new Proto.Str(po, false));
        om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Object", om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance_State", "ti.sysbios.hal.unicache"));
        }//isROV
    }

    void Cache$$CONSTS()
    {
        // module Cache
        om.bind("ti.sysbios.hal.unicache.Cache.cache", new Extern("ti_sysbios_hal_unicache_Cache_cache", "ti_sysbios_hal_unicache_Cache_CACHE*", false, false));
        om.bind("ti.sysbios.hal.unicache.Cache.enable", new Extern("ti_sysbios_hal_unicache_Cache_enable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.disable", new Extern("ti_sysbios_hal_unicache_Cache_disable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.inv", new Extern("ti_sysbios_hal_unicache_Cache_inv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.wb", new Extern("ti_sysbios_hal_unicache_Cache_wb__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.wbInv", new Extern("ti_sysbios_hal_unicache_Cache_wbInv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.wait", new Extern("ti_sysbios_hal_unicache_Cache_wait__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.lock", new Extern("ti_sysbios_hal_unicache_Cache_lock__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.unlock", new Extern("ti_sysbios_hal_unicache_Cache_unlock__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.preload", new Extern("ti_sysbios_hal_unicache_Cache_preload__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.preloadLock", new Extern("ti_sysbios_hal_unicache_Cache_preloadLock__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.wbAll", new Extern("ti_sysbios_hal_unicache_Cache_wbAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.invAll", new Extern("ti_sysbios_hal_unicache_Cache_invAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.wbInvAll", new Extern("ti_sysbios_hal_unicache_Cache_wbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.read", new Extern("ti_sysbios_hal_unicache_Cache_read__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Ptr)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.dumpRegs", new Extern("ti_sysbios_hal_unicache_Cache_dumpRegs__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.seizeRegs", new Extern("ti_sysbios_hal_unicache_Cache_seizeRegs__I", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.releaseRegs", new Extern("ti_sysbios_hal_unicache_Cache_releaseRegs__I", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.ISR", new Extern("ti_sysbios_hal_unicache_Cache_ISR__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.invAllI", new Extern("ti_sysbios_hal_unicache_Cache_invAllI__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.printInfo", new Extern("ti_sysbios_hal_unicache_Cache_printInfo__I", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.printConfig", new Extern("ti_sysbios_hal_unicache_Cache_printConfig__I", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.printOCP", new Extern("ti_sysbios_hal_unicache_Cache_printOCP__I", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.hal.unicache.Cache.startup", new Extern("ti_sysbios_hal_unicache_Cache_startup__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void Cache_Module_GateProxy$$CONSTS()
    {
        // module Cache_Module_GateProxy
        om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy.query", new Extern("ti_sysbios_hal_unicache_Cache_Module_GateProxy_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
    }

    void Cache$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Cache_Module_GateProxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$hal$unicache$Cache_Module_GateProxy$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.hal.unicache.Cache_Module_GateProxy.create() called before xdc.useModule('ti.sysbios.hal.unicache.Cache_Module_GateProxy')\");\n");
                sb.append("}\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.hal.unicache.Cache_Module_GateProxy$$create", new Proto.Fxn(om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Module", "ti.sysbios.hal.unicache"), om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance", "ti.sysbios.hal.unicache"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Params", "ti.sysbios.hal.unicache"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$hal$unicache$Cache_Module_GateProxy$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.hal.unicache.Cache_Module_GateProxy'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.hal.unicache']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.hal.unicache.Cache_Module_GateProxy'].Instance_State);\n");
                sb.append("if (!__mod.delegate$) {\n");
                    sb.append("throw new Error(\"Unbound proxy module: ti.sysbios.hal.unicache.Cache_Module_GateProxy\");\n");
                sb.append("}\n");
                sb.append("var __dmod = __mod.delegate$.$orig;\n");
                sb.append("var __dinst = __dmod.create(__params);\n");
                sb.append("__inst.$$bind('delegate$', __dinst);\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.hal.unicache.Cache_Module_GateProxy'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Cache$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cache_Module_GateProxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cache$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.hal.unicache.Cache.CACHE", "ti.sysbios.hal.unicache");
        sizes.clear();
        sizes.add(Global.newArray("L1_INFO", "UInt32"));
        sizes.add(Global.newArray("L1_CONFIG", "UInt32"));
        sizes.add(Global.newArray("L1_INT", "UInt32"));
        sizes.add(Global.newArray("L1_OCP", "UInt32"));
        sizes.add(Global.newArray("L1_MAINT", "UInt32"));
        sizes.add(Global.newArray("L1_MTSTART", "UPtr"));
        sizes.add(Global.newArray("L1_MTEND", "UPtr"));
        sizes.add(Global.newArray("L1_CTADDR", "UPtr"));
        sizes.add(Global.newArray("L1_CTDATA", "UInt32"));
        sizes.add(Global.newArray("Reserved", "A0x77;UInt32"));
        sizes.add(Global.newArray("L2_INFO", "UInt32"));
        sizes.add(Global.newArray("L2_CONFIG", "UInt32"));
        sizes.add(Global.newArray("L2_INT", "UInt32"));
        sizes.add(Global.newArray("L2_OCP", "UInt32"));
        sizes.add(Global.newArray("L2_MAINT", "UInt32"));
        sizes.add(Global.newArray("L2_MTSTART", "UPtr"));
        sizes.add(Global.newArray("L2_MTEND", "UPtr"));
        sizes.add(Global.newArray("L2_CTADDR", "UPtr"));
        sizes.add(Global.newArray("L2_CTDATA", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.hal.unicache.Cache.CACHE']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.hal.unicache.Cache.CACHE']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.hal.unicache.Cache.CACHE'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.hal.unicache.Cache.OCPConfig", "ti.sysbios.hal.unicache");
        sizes.clear();
        sizes.add(Global.newArray("wrap", "UInt8"));
        sizes.add(Global.newArray("wrbuffer", "UInt8"));
        sizes.add(Global.newArray("prefetch", "UInt8"));
        sizes.add(Global.newArray("cleanbuf", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.hal.unicache.Cache.OCPConfig']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.hal.unicache.Cache.OCPConfig']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.hal.unicache.Cache.OCPConfig'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.hal.unicache.Cache.SecurityConfig", "ti.sysbios.hal.unicache");
        sizes.clear();
        sizes.add(Global.newArray("secure", "UInt8"));
        sizes.add(Global.newArray("nbypass", "UInt8"));
        sizes.add(Global.newArray("secint", "UInt8"));
        sizes.add(Global.newArray("secport", "UInt8"));
        sizes.add(Global.newArray("secmain", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.hal.unicache.Cache.SecurityConfig']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.hal.unicache.Cache.SecurityConfig']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.hal.unicache.Cache.SecurityConfig'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Cache_Module_GateProxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Cache$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/hal/unicache/Cache.xs");
        om.bind("ti.sysbios.hal.unicache.Cache$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache.Module", "ti.sysbios.hal.unicache");
        po.init("ti.sysbios.hal.unicache.Cache.Module", om.findStrict("ti.sysbios.interfaces.ICache.Module", "ti.sysbios.hal.unicache"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.hal.unicache"), $$UNDEF, "wh");
            po.addFld("E_exception", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.hal.unicache"), Global.newObject("msg", "E_exception: L%d reason: 0x%x"), "w");
            po.addFld("ocpL1", (Proto)om.findStrict("ti.sysbios.hal.unicache.Cache.OCPConfig", "ti.sysbios.hal.unicache"), Global.newObject("wrap", 0L, "wrbuffer", 0L, "prefetch", 0L), "wh");
            po.addFld("configL1", (Proto)om.findStrict("ti.sysbios.hal.unicache.Cache.SecurityConfig", "ti.sysbios.hal.unicache"), Global.newObject("secure", 0L, "nbypass", 0L, "secint", 1L, "secport", 1L, "secmain", 1L), "wh");
            po.addFld("ocpL2", (Proto)om.findStrict("ti.sysbios.hal.unicache.Cache.OCPConfig", "ti.sysbios.hal.unicache"), Global.newObject("wrap", 0L, "wrbuffer", 0L, "prefetch", 0L, "cleanbuf", 0L), "wh");
            po.addFld("configL2", (Proto)om.findStrict("ti.sysbios.hal.unicache.Cache.SecurityConfig", "ti.sysbios.hal.unicache"), Global.newObject("secure", 0L, "nbypass", 0L, "secint", 1L, "secport", 1L, "secmain", 1L), "wh");
            po.addFld("configureCache", $$T_Bool, false, "w");
            po.addFld("enableCache", $$T_Bool, false, "w");
            po.addFld("maxLineModeBufSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
            po.addFld("l1InterruptHandler", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "wh");
            po.addFld("l1InterruptNumber", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
            po.addFld("l1InterruptPriority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
            po.addFld("l2InterruptHandler", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "wh");
            po.addFld("l2InterruptNumber", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
            po.addFld("l2InterruptPriority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
            po.addFld("l1ocpConfig", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
            po.addFld("l1secConfig", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
            po.addFld("l2ocpConfig", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
            po.addFld("l2secConfig", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
            po.addFld("l2CacheSupported", $$T_Bool, $$UNDEF, "r");
            po.addFld("baseAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
            po.addFldV("Module_GateProxy", (Proto)om.findStrict("xdc.runtime.IGateProvider.Module", "ti.sysbios.hal.unicache"), null, "wh", $$delegGet, $$delegSet);
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.hal.unicache.Cache$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.hal.unicache.Cache$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.hal.unicache.Cache$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.hal.unicache.Cache$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Cache.CACHE
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache$$CACHE", "ti.sysbios.hal.unicache");
        po.init("ti.sysbios.hal.unicache.Cache.CACHE", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("L1_INFO", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L1_CONFIG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L1_INT", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L1_OCP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L1_MAINT", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L1_MTSTART", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("L1_MTEND", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("L1_CTADDR", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("L1_CTDATA", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("Reserved", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(0x77L)), $$DEFAULT, "w");
                po.addFld("L2_INFO", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L2_CONFIG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L2_INT", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L2_OCP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L2_MAINT", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("L2_MTSTART", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("L2_MTEND", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("L2_CTADDR", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("L2_CTDATA", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Cache.OCPConfig
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache$$OCPConfig", "ti.sysbios.hal.unicache");
        po.init("ti.sysbios.hal.unicache.Cache.OCPConfig", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("wrap", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("wrbuffer", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("prefetch", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("cleanbuf", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
        // struct Cache.SecurityConfig
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache$$SecurityConfig", "ti.sysbios.hal.unicache");
        po.init("ti.sysbios.hal.unicache.Cache.SecurityConfig", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("secure", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("nbypass", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("secint", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("secport", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("secmain", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
        // struct Cache.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache$$ModuleView", "ti.sysbios.hal.unicache");
        po.init("ti.sysbios.hal.unicache.Cache.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("cacheEnabled", $$T_Bool, $$UNDEF, "w");
    }

    void Cache_Module_GateProxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Module", "ti.sysbios.hal.unicache");
        po.init("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Module", om.findStrict("xdc.runtime.IGateProvider.Module", "ti.sysbios.hal.unicache"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.IGateProvider.Module", "ti.sysbios.hal.unicache"), null, "wh");
                po.addFld("abstractInstances$", $$T_Bool, false, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy$$create", "ti.sysbios.hal.unicache"), Global.get("ti$sysbios$hal$unicache$Cache_Module_GateProxy$$create"));
        }//isCFG
                po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "ti.sysbios.hal.unicache"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance", "ti.sysbios.hal.unicache");
        po.init("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance", om.findStrict("xdc.runtime.IGateProvider.Instance", "ti.sysbios.hal.unicache"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.hal.unicache"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy$$Params", "ti.sysbios.hal.unicache");
        po.init("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Params", om.findStrict("xdc.runtime.IGateProvider$$Params", "ti.sysbios.hal.unicache"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.hal.unicache"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy$$Object", "ti.sysbios.hal.unicache");
        po.init("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Object", om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance", "ti.sysbios.hal.unicache"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy$$Instance_State", "ti.sysbios.hal.unicache");
        po.init("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void Cache$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache", "ti.sysbios.hal.unicache");
        vo.bind("CACHE$fetchDesc", Global.newObject("type", "ti.sysbios.hal.unicache.Cache.CACHE", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache$$CACHE", "ti.sysbios.hal.unicache");
        vo.bind("OCPConfig$fetchDesc", Global.newObject("type", "ti.sysbios.hal.unicache.Cache.OCPConfig", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache$$OCPConfig", "ti.sysbios.hal.unicache");
        vo.bind("SecurityConfig$fetchDesc", Global.newObject("type", "ti.sysbios.hal.unicache.Cache.SecurityConfig", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache$$SecurityConfig", "ti.sysbios.hal.unicache");
    }

    void Cache_Module_GateProxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy", "ti.sysbios.hal.unicache");
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy$$Instance_State", "ti.sysbios.hal.unicache");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.hal.unicache.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.hal.unicache"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/hal/unicache/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.hal.unicache"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.hal.unicache"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.hal.unicache"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.hal.unicache"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.hal.unicache"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.hal.unicache"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.hal.unicache", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.hal.unicache");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.hal.unicache.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.hal.unicache'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.hal.unicache$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.hal.unicache$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.hal.unicache$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.unicache.aem3',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.unicache.aem4',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.unicache.aem4f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.unicache.am3g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.unicache.am4g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.unicache.am4fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.unicache.arm3',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.unicache.arm4',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.hal.unicache.arm4f',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.hal.unicache.aem3',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.hal.unicache.aem4',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.unicache.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.unicache.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.unicache.aem4f', {target: 'ti.targets.arm.elf.M4F', suffix: 'em4f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.unicache.am3g', {target: 'gnu.targets.arm.M3', suffix: 'm3g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.unicache.am4g', {target: 'gnu.targets.arm.M4', suffix: 'm4g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.unicache.am4fg', {target: 'gnu.targets.arm.M4F', suffix: 'm4fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.unicache.arm3', {target: 'iar.targets.arm.M3', suffix: 'rm3'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.unicache.arm4', {target: 'iar.targets.arm.M4', suffix: 'rm4'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.hal.unicache.arm4f', {target: 'iar.targets.arm.M4F', suffix: 'rm4f'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.hal.unicache.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.hal.unicache.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Cache$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache", "ti.sysbios.hal.unicache");
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache.Module", "ti.sysbios.hal.unicache");
        vo.init2(po, "ti.sysbios.hal.unicache.Cache", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.hal.unicache.Cache$$capsule", "ti.sysbios.hal.unicache"));
        vo.bind("$package", om.findStrict("ti.sysbios.hal.unicache", "ti.sysbios.hal.unicache"));
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
        vo.bind("Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.hal.unicache"));
        vo.bind("CACHE", om.findStrict("ti.sysbios.hal.unicache.Cache.CACHE", "ti.sysbios.hal.unicache"));
        tdefs.add(om.findStrict("ti.sysbios.hal.unicache.Cache.CACHE", "ti.sysbios.hal.unicache"));
        vo.bind("cache", om.findStrict("ti.sysbios.hal.unicache.Cache.cache", "ti.sysbios.hal.unicache"));
        vo.bind("OCPConfig", om.findStrict("ti.sysbios.hal.unicache.Cache.OCPConfig", "ti.sysbios.hal.unicache"));
        tdefs.add(om.findStrict("ti.sysbios.hal.unicache.Cache.OCPConfig", "ti.sysbios.hal.unicache"));
        vo.bind("SecurityConfig", om.findStrict("ti.sysbios.hal.unicache.Cache.SecurityConfig", "ti.sysbios.hal.unicache"));
        tdefs.add(om.findStrict("ti.sysbios.hal.unicache.Cache.SecurityConfig", "ti.sysbios.hal.unicache"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.hal.unicache.Cache.ModuleView", "ti.sysbios.hal.unicache"));
        tdefs.add(om.findStrict("ti.sysbios.hal.unicache.Cache.ModuleView", "ti.sysbios.hal.unicache"));
        mcfgs.add("E_exception");
        mcfgs.add("configureCache");
        mcfgs.add("enableCache");
        mcfgs.add("maxLineModeBufSize");
        mcfgs.add("l1ocpConfig");
        icfgs.add("l1ocpConfig");
        mcfgs.add("l1secConfig");
        icfgs.add("l1secConfig");
        mcfgs.add("l2ocpConfig");
        icfgs.add("l2ocpConfig");
        mcfgs.add("l2secConfig");
        icfgs.add("l2secConfig");
        mcfgs.add("l2CacheSupported");
        icfgs.add("l2CacheSupported");
        icfgs.add("baseAddr");
        vo.bind("Module_GateProxy$proxy", om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy", "ti.sysbios.hal.unicache"));
        proxies.add("Module_GateProxy");
        vo.bind("Type_L1P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1P", "ti.sysbios.hal.unicache"));
        vo.bind("Type_L1D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1D", "ti.sysbios.hal.unicache"));
        vo.bind("Type_L1", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1", "ti.sysbios.hal.unicache"));
        vo.bind("Type_L2P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2P", "ti.sysbios.hal.unicache"));
        vo.bind("Type_L2D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2D", "ti.sysbios.hal.unicache"));
        vo.bind("Type_L2", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2", "ti.sysbios.hal.unicache"));
        vo.bind("Type_ALLP", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLP", "ti.sysbios.hal.unicache"));
        vo.bind("Type_ALLD", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLD", "ti.sysbios.hal.unicache"));
        vo.bind("Type_ALL", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALL", "ti.sysbios.hal.unicache"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.hal.unicache")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.hal.unicache.Cache.enable", "ti.sysbios.hal.unicache"));
        vo.bind("disable", om.findStrict("ti.sysbios.hal.unicache.Cache.disable", "ti.sysbios.hal.unicache"));
        vo.bind("inv", om.findStrict("ti.sysbios.hal.unicache.Cache.inv", "ti.sysbios.hal.unicache"));
        vo.bind("wb", om.findStrict("ti.sysbios.hal.unicache.Cache.wb", "ti.sysbios.hal.unicache"));
        vo.bind("wbInv", om.findStrict("ti.sysbios.hal.unicache.Cache.wbInv", "ti.sysbios.hal.unicache"));
        vo.bind("wait", om.findStrict("ti.sysbios.hal.unicache.Cache.wait", "ti.sysbios.hal.unicache"));
        vo.bind("lock", om.findStrict("ti.sysbios.hal.unicache.Cache.lock", "ti.sysbios.hal.unicache"));
        vo.bind("unlock", om.findStrict("ti.sysbios.hal.unicache.Cache.unlock", "ti.sysbios.hal.unicache"));
        vo.bind("preload", om.findStrict("ti.sysbios.hal.unicache.Cache.preload", "ti.sysbios.hal.unicache"));
        vo.bind("preloadLock", om.findStrict("ti.sysbios.hal.unicache.Cache.preloadLock", "ti.sysbios.hal.unicache"));
        vo.bind("wbAll", om.findStrict("ti.sysbios.hal.unicache.Cache.wbAll", "ti.sysbios.hal.unicache"));
        vo.bind("invAll", om.findStrict("ti.sysbios.hal.unicache.Cache.invAll", "ti.sysbios.hal.unicache"));
        vo.bind("wbInvAll", om.findStrict("ti.sysbios.hal.unicache.Cache.wbInvAll", "ti.sysbios.hal.unicache"));
        vo.bind("read", om.findStrict("ti.sysbios.hal.unicache.Cache.read", "ti.sysbios.hal.unicache"));
        vo.bind("dumpRegs", om.findStrict("ti.sysbios.hal.unicache.Cache.dumpRegs", "ti.sysbios.hal.unicache"));
        vo.bind("seizeRegs", om.findStrict("ti.sysbios.hal.unicache.Cache.seizeRegs", "ti.sysbios.hal.unicache"));
        vo.bind("releaseRegs", om.findStrict("ti.sysbios.hal.unicache.Cache.releaseRegs", "ti.sysbios.hal.unicache"));
        vo.bind("ISR", om.findStrict("ti.sysbios.hal.unicache.Cache.ISR", "ti.sysbios.hal.unicache"));
        vo.bind("invAllI", om.findStrict("ti.sysbios.hal.unicache.Cache.invAllI", "ti.sysbios.hal.unicache"));
        vo.bind("printInfo", om.findStrict("ti.sysbios.hal.unicache.Cache.printInfo", "ti.sysbios.hal.unicache"));
        vo.bind("printConfig", om.findStrict("ti.sysbios.hal.unicache.Cache.printConfig", "ti.sysbios.hal.unicache"));
        vo.bind("printOCP", om.findStrict("ti.sysbios.hal.unicache.Cache.printOCP", "ti.sysbios.hal.unicache"));
        vo.bind("startup", om.findStrict("ti.sysbios.hal.unicache.Cache.startup", "ti.sysbios.hal.unicache"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_hal_unicache_Cache_Module__startupDone__E", "ti_sysbios_hal_unicache_Cache_enable__E", "ti_sysbios_hal_unicache_Cache_disable__E", "ti_sysbios_hal_unicache_Cache_inv__E", "ti_sysbios_hal_unicache_Cache_wb__E", "ti_sysbios_hal_unicache_Cache_wbInv__E", "ti_sysbios_hal_unicache_Cache_wait__E", "ti_sysbios_hal_unicache_Cache_lock__E", "ti_sysbios_hal_unicache_Cache_unlock__E", "ti_sysbios_hal_unicache_Cache_preload__E", "ti_sysbios_hal_unicache_Cache_preloadLock__E", "ti_sysbios_hal_unicache_Cache_wbAll__E", "ti_sysbios_hal_unicache_Cache_invAll__E", "ti_sysbios_hal_unicache_Cache_wbInvAll__E", "ti_sysbios_hal_unicache_Cache_read__E", "ti_sysbios_hal_unicache_Cache_dumpRegs__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_exception"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Cache", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Cache");
    }

    void Cache_Module_GateProxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy", "ti.sysbios.hal.unicache");
        po = (Proto.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Module", "ti.sysbios.hal.unicache");
        vo.init2(po, "ti.sysbios.hal.unicache.Cache_Module_GateProxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance", "ti.sysbios.hal.unicache"));
        vo.bind("Params", om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Params", "ti.sysbios.hal.unicache"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Params", "ti.sysbios.hal.unicache")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Handle", "ti.sysbios.hal.unicache"));
        vo.bind("$package", om.findStrict("ti.sysbios.hal.unicache", "ti.sysbios.hal.unicache"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.hal.unicache")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
            vo.bind("__initObject", Global.get("ti$sysbios$hal$unicache$Cache_Module_GateProxy$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.query", "ti.sysbios.hal.unicache"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__Handle__label", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__Module__startupDone", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__Object__create", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__Object__delete", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__Object__get", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__Object__first", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__Object__next", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__Params__init", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__Proxy__abstract", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__Proxy__delegate", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__queryMeta", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__query", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__enter", "ti_sysbios_hal_unicache_Cache_Module_GateProxy_DELEGATE__leave"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Object", "ti.sysbios.hal.unicache"));
        vo.bind("Instance_State", om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy.Instance_State", "ti.sysbios.hal.unicache"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Cache_Module_GateProxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Cache_Module_GateProxy");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.hal.unicache")).findStrict("PARAMS", "ti.sysbios.hal.unicache");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy", "ti.sysbios.hal.unicache")).findStrict("PARAMS", "ti.sysbios.hal.unicache");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.hal.unicache.Cache", "ti.sysbios.hal.unicache"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.hal.unicache.Cache_Module_GateProxy", "ti.sysbios.hal.unicache"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.hal.unicache.Cache", "ti.sysbios.hal.unicache");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.hal.unicache.Cache")).bless();
        ((Value.Obj)om.getv("ti.sysbios.hal.unicache.Cache_Module_GateProxy")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.hal.unicache")).add(pkgV);
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
        Cache_Module_GateProxy$$OBJECTS();
        Cache$$CONSTS();
        Cache_Module_GateProxy$$CONSTS();
        Cache$$CREATES();
        Cache_Module_GateProxy$$CREATES();
        Cache$$FUNCTIONS();
        Cache_Module_GateProxy$$FUNCTIONS();
        Cache$$SIZES();
        Cache_Module_GateProxy$$SIZES();
        Cache$$TYPES();
        Cache_Module_GateProxy$$TYPES();
        if (isROV) {
            Cache$$ROV();
            Cache_Module_GateProxy$$ROV();
        }//isROV
        $$SINGLETONS();
        Cache$$SINGLETONS();
        Cache_Module_GateProxy$$SINGLETONS();
        $$INITIALIZATION();
    }
}
