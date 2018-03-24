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

public class ti_sysbios_family_c64p
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
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.c64p", new Value.Obj("ti.sysbios.family.c64p", pkgP));
    }

    void EventCombiner$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c64p.EventCombiner.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c64p.EventCombiner", new Value.Obj("ti.sysbios.family.c64p.EventCombiner", po));
        pkgV.bind("EventCombiner", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.EventCombiner$$EventView", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.EventCombiner.EventView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.EventCombiner$$EventObj", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.EventCombiner.EventObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.EventCombiner$$DispatchTabElem", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.EventCombiner.DispatchTabElem", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.EventCombiner$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.EventCombiner.Module_State", new Proto.Str(spo, false));
    }

    void Exception$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Exception.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c64p.Exception", new Value.Obj("ti.sysbios.family.c64p.Exception", po));
        pkgV.bind("Exception", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Exception$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Exception.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Exception$$Context", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Exception.Context", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Exception$$Status", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Exception.Status", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Exception$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Exception.Module_State", new Proto.Str(spo, false));
    }

    void Hwi$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Hwi.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c64p.Hwi", new Value.Obj("ti.sysbios.family.c64p.Hwi", po));
        pkgV.bind("Hwi", vo);
        // decls 
        om.bind("ti.sysbios.family.c64p.Hwi.HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.c64p"));
        om.bind("ti.sysbios.family.c64p.Hwi.MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.c64p"));
        om.bind("ti.sysbios.family.c64p.Hwi.StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.c64p"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Hwi$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Hwi.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Hwi$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Hwi.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Hwi$$NonDispatchedInterrupt", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Hwi.NonDispatchedInterrupt", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Hwi$$InterruptObj", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Hwi.InterruptObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Hwi$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Hwi.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Hwi$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Hwi.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.c64p.Hwi.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Hwi$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Hwi.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Hwi$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Hwi.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.c64p.Hwi.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.c64p.Hwi.Object", om.findStrict("ti.sysbios.family.c64p.Hwi.Instance_State", "ti.sysbios.family.c64p"));
        }//isROV
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c64p.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c64p.TimestampProvider", new Value.Obj("ti.sysbios.family.c64p.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
    }

    void MemoryProtect$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c64p.MemoryProtect.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c64p.MemoryProtect", new Value.Obj("ti.sysbios.family.c64p.MemoryProtect", po));
        pkgV.bind("MemoryProtect", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.MemoryProtect$$BitRange", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.MemoryProtect.BitRange", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.MemoryProtect$$Lock", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.MemoryProtect.Lock", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.MemoryProtect$$Fault", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.MemoryProtect.Fault", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.MemoryProtect$$Key", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.MemoryProtect.Key", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.MemoryProtect$$Controller", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.MemoryProtect.Controller", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.MemoryProtect$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.MemoryProtect.Module_State", new Proto.Str(spo, false));
    }

    void Clobber$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Clobber.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c64p.Clobber", new Value.Obj("ti.sysbios.family.c64p.Clobber", po));
        pkgV.bind("Clobber", vo);
        // decls 
    }

    void Cache$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Cache.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c64p.Cache", new Value.Obj("ti.sysbios.family.c64p.Cache", po));
        pkgV.bind("Cache", vo);
        // decls 
        om.bind("ti.sysbios.family.c64p.Cache.Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.c64p"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Cache$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Cache.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Cache$$MarRegisterView", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Cache.MarRegisterView", new Proto.Str(spo, false));
        om.bind("ti.sysbios.family.c64p.Cache.Mode", new Proto.Enm("ti.sysbios.family.c64p.Cache.Mode"));
        om.bind("ti.sysbios.family.c64p.Cache.L1Size", new Proto.Enm("ti.sysbios.family.c64p.Cache.L1Size"));
        om.bind("ti.sysbios.family.c64p.Cache.L2Size", new Proto.Enm("ti.sysbios.family.c64p.Cache.L2Size"));
        om.bind("ti.sysbios.family.c64p.Cache.Mar", new Proto.Enm("ti.sysbios.family.c64p.Cache.Mar"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Cache$$Size", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Cache.Size", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Cache$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c64p.Cache.Module_State", new Proto.Str(spo, false));
    }

    void Settings$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c64p.Settings.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c64p.Settings", new Value.Obj("ti.sysbios.family.c64p.Settings", po));
        pkgV.bind("Settings", vo);
        // decls 
    }

    void EventCombiner$$CONSTS()
    {
        // module EventCombiner
        om.bind("ti.sysbios.family.c64p.EventCombiner.NUM_EVENTS", 128L);
        om.bind("ti.sysbios.family.c64p.EventCombiner.disableEvent", new Extern("ti_sysbios_family_c64p_EventCombiner_disableEvent__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.EventCombiner.enableEvent", new Extern("ti_sysbios_family_c64p_EventCombiner_enableEvent__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.EventCombiner.dispatch", new Extern("ti_sysbios_family_c64p_EventCombiner_dispatch__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.EventCombiner.dispatchPlug", new Extern("ti_sysbios_family_c64p_EventCombiner_dispatchPlug__E", "xdc_Void(*)(xdc_UInt,xdc_Void(*)(xdc_UArg),xdc_UArg,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c64p.EventCombiner.unused", new Extern("ti_sysbios_family_c64p_EventCombiner_unused__E", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void Exception$$CONSTS()
    {
        // module Exception
        om.bind("ti.sysbios.family.c64p.Exception.EFRSXF", 0x00000001L);
        om.bind("ti.sysbios.family.c64p.Exception.EFRIXF", 0x00000002L);
        om.bind("ti.sysbios.family.c64p.Exception.EFREXF", 0x40000000L);
        om.bind("ti.sysbios.family.c64p.Exception.EFRNXF", 0x80000000L);
        om.bind("ti.sysbios.family.c64p.Exception.ECRSXF", 0x00000001L);
        om.bind("ti.sysbios.family.c64p.Exception.ECRIXF", 0x00000002L);
        om.bind("ti.sysbios.family.c64p.Exception.ECREXF", 0x40000000L);
        om.bind("ti.sysbios.family.c64p.Exception.ECRNXF", 0x80000000L);
        om.bind("ti.sysbios.family.c64p.Exception.IERRIFX", 0x00000001L);
        om.bind("ti.sysbios.family.c64p.Exception.IERRFPX", 0x00000002L);
        om.bind("ti.sysbios.family.c64p.Exception.IERREPX", 0x00000004L);
        om.bind("ti.sysbios.family.c64p.Exception.IERROPX", 0x00000008L);
        om.bind("ti.sysbios.family.c64p.Exception.IERRRCX", 0x00000010L);
        om.bind("ti.sysbios.family.c64p.Exception.IERRRAX", 0x00000020L);
        om.bind("ti.sysbios.family.c64p.Exception.IERRPRX", 0x00000040L);
        om.bind("ti.sysbios.family.c64p.Exception.IERRLBX", 0x00000080L);
        om.bind("ti.sysbios.family.c64p.Exception.IERRMSX", 0x00000100L);
        om.bind("ti.sysbios.family.c64p.Exception.TSRGEE", 0x00000004L);
        om.bind("ti.sysbios.family.c64p.Exception.TSRXEN", 0x00000008L);
        om.bind("ti.sysbios.family.c64p.Exception.TSREXC", 0x00000400L);
        om.bind("ti.sysbios.family.c64p.Exception.TSRCXM", 0x000000C0L);
        om.bind("ti.sysbios.family.c64p.Exception.TSRCXMSHIFT", 6L);
        om.bind("ti.sysbios.family.c64p.Exception.TSRCXMSV", 0x00000000L);
        om.bind("ti.sysbios.family.c64p.Exception.TSRCXMUS", 0x00000040L);
        om.bind("ti.sysbios.family.c64p.Exception.sizeContextBuf", 320L);
        om.bind("ti.sysbios.family.c64p.Exception.EVTPMCCMPA", 120L);
        om.bind("ti.sysbios.family.c64p.Exception.EVTDMCCMPA", 122L);
        om.bind("ti.sysbios.family.c64p.Exception.EVTUMCCMPA", 124L);
        om.bind("ti.sysbios.family.c64p.Exception.EVTEMCCMPA", 126L);
        om.bind("ti.sysbios.family.c64p.Exception.getLastStatus", new Extern("ti_sysbios_family_c64p_Exception_getLastStatus__E", "xdc_Void(*)(ti_sysbios_family_c64p_Exception_Status*)", true, false));
        om.bind("ti.sysbios.family.c64p.Exception.clearLastStatus", new Extern("ti_sysbios_family_c64p_Exception_clearLastStatus__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Exception.setReturnPtr", new Extern("ti_sysbios_family_c64p_Exception_setReturnPtr__E", "xdc_Void(*)(xdc_Void)(*)(xdc_Void(*)(xdc_Void))", true, false));
        om.bind("ti.sysbios.family.c64p.Exception.evtEvtClear", new Extern("ti_sysbios_family_c64p_Exception_evtEvtClear__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Exception.evtExpMaskEnable", new Extern("ti_sysbios_family_c64p_Exception_evtExpMaskEnable__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Exception.dispatch", new Extern("ti_sysbios_family_c64p_Exception_dispatch__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Exception.handler", new Extern("ti_sysbios_family_c64p_Exception_handler__I", "xdc_Void(*)(xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c64p.Exception.internalHandler", new Extern("ti_sysbios_family_c64p_Exception_internalHandler__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Exception.externalHandler", new Extern("ti_sysbios_family_c64p_Exception_externalHandler__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Exception.nmiHandler", new Extern("ti_sysbios_family_c64p_Exception_nmiHandler__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Exception.decodeMpfsr", new Extern("ti_sysbios_family_c64p_Exception_decodeMpfsr__I", "xdc_Void(*)(xdc_UInt)", true, false));
    }

    void Hwi$$CONSTS()
    {
        // module Hwi
        om.bind("ti.sysbios.family.c64p.Hwi.NUM_INTERRUPTS", 16L);
        om.bind("ti.sysbios.family.c64p.Hwi.getStackInfo", new Extern("ti_sysbios_family_c64p_Hwi_getStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.getCoreStackInfo", new Extern("ti_sysbios_family_c64p_Hwi_getCoreStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.startup", new Extern("ti_sysbios_family_c64p_Hwi_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.switchFromBootStack", new Extern("ti_sysbios_family_c64p_Hwi_switchFromBootStack__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.post", new Extern("ti_sysbios_family_c64p_Hwi_post__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.getTaskSP", new Extern("ti_sysbios_family_c64p_Hwi_getTaskSP__E", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.disableInterrupt", new Extern("ti_sysbios_family_c64p_Hwi_disableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.enableInterrupt", new Extern("ti_sysbios_family_c64p_Hwi_enableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.restoreInterrupt", new Extern("ti_sysbios_family_c64p_Hwi_restoreInterrupt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.clearInterrupt", new Extern("ti_sysbios_family_c64p_Hwi_clearInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.eventMap", new Extern("ti_sysbios_family_c64p_Hwi_eventMap__E", "xdc_Void(*)(xdc_Int,xdc_Int)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.plug", new Extern("ti_sysbios_family_c64p_Hwi_plug__E", "xdc_Void(*)(xdc_UInt,xdc_Void(*)(xdc_Void))", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.getEventId", new Extern("ti_sysbios_family_c64p_Hwi_getEventId__E", "xdc_Int(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.getHandle", new Extern("ti_sysbios_family_c64p_Hwi_getHandle__E", "ti_sysbios_family_c64p_Hwi_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.disableIER", new Extern("ti_sysbios_family_c64p_Hwi_disableIER__E", "xdc_Bits16(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.enableIER", new Extern("ti_sysbios_family_c64p_Hwi_enableIER__E", "xdc_Bits16(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.restoreIER", new Extern("ti_sysbios_family_c64p_Hwi_restoreIER__E", "xdc_Bits16(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.getIsrStackAddress", new Extern("ti_sysbios_family_c64p_Hwi_getIsrStackAddress__I", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.dispatchC", new Extern("ti_sysbios_family_c64p_Hwi_dispatchC__I", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.dispatchCore", new Extern("ti_sysbios_family_c64p_Hwi_dispatchCore__I", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.unPluggedInterrupt", new Extern("ti_sysbios_family_c64p_Hwi_unPluggedInterrupt__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.switchAndDispatch", new Extern("ti_sysbios_family_c64p_Hwi_switchAndDispatch__I", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.setupSC", new Extern("ti_sysbios_family_c64p_Hwi_setupSC__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Hwi.postInit", new Extern("ti_sysbios_family_c64p_Hwi_postInit__I", "xdc_Int(*)(ti_sysbios_family_c64p_Hwi_Object*,xdc_runtime_Error_Block*)", true, false));
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
        om.bind("ti.sysbios.family.c64p.TimestampProvider.get32", new Extern("ti_sysbios_family_c64p_TimestampProvider_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.TimestampProvider.get64", new Extern("ti_sysbios_family_c64p_TimestampProvider_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.family.c64p.TimestampProvider.getFreq", new Extern("ti_sysbios_family_c64p_TimestampProvider_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
    }

    void MemoryProtect$$CONSTS()
    {
        // module MemoryProtect
        om.bind("ti.sysbios.family.c64p.MemoryProtect.MPPA_UX", 0x00000001L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.MPPA_UW", 0x00000002L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.MPPA_UR", 0x00000004L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.MPPA_SX", 0x00000008L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.MPPA_SW", 0x00000010L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.MPPA_SR", 0x00000020L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.MPPA_LOCAL", 0x00000100L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.NONE", 0L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.UMAP0", 1L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.UMAP1", 2L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.DMC", 3L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.PMC", 4L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.UMC", 1L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.LCKUNLOCK", 0x00000001L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.LCKLOCK", 0x00000002L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.LCKKEYR", 0x00000004L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.LKSTATLK", 0x00000001L);
        om.bind("ti.sysbios.family.c64p.MemoryProtect.getPA", new Extern("ti_sysbios_family_c64p_MemoryProtect_getPA__E", "xdc_Bool(*)(xdc_Ptr,xdc_UInt32*)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.setPA", new Extern("ti_sysbios_family_c64p_MemoryProtect_setPA__E", "xdc_Bool(*)(xdc_Ptr,xdc_SizeT,xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.getPageSize", new Extern("ti_sysbios_family_c64p_MemoryProtect_getPageSize__E", "xdc_Bool(*)(xdc_Ptr,xdc_UInt*)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.getPrivMode", new Extern("ti_sysbios_family_c64p_MemoryProtect_getPrivMode__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.setPrivMode", new Extern("ti_sysbios_family_c64p_MemoryProtect_setPrivMode__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.decodeRegion", new Extern("ti_sysbios_family_c64p_MemoryProtect_decodeRegion__I", "xdc_Int(*)(xdc_UInt32,xdc_UInt32,xdc_UInt32*,xdc_UInt32*)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.getAddrPageSize", new Extern("ti_sysbios_family_c64p_MemoryProtect_getAddrPageSize__I", "xdc_Int(*)(xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.lock", new Extern("ti_sysbios_family_c64p_MemoryProtect_lock__I", "xdc_Void(*)(ti_sysbios_family_c64p_MemoryProtect_Controller*,ti_sysbios_family_c64p_MemoryProtect_Key*)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.makeLocal", new Extern("ti_sysbios_family_c64p_MemoryProtect_makeLocal__I", "xdc_Bool(*)(xdc_UInt*,xdc_UInt*)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.readPA", new Extern("ti_sysbios_family_c64p_MemoryProtect_readPA__I", "xdc_UInt32(*)(ti_sysbios_family_c64p_MemoryProtect_Controller*,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.unlock", new Extern("ti_sysbios_family_c64p_MemoryProtect_unlock__I", "xdc_Void(*)(ti_sysbios_family_c64p_MemoryProtect_Controller*,ti_sysbios_family_c64p_MemoryProtect_Key*)", true, false));
        om.bind("ti.sysbios.family.c64p.MemoryProtect.writePA", new Extern("ti_sysbios_family_c64p_MemoryProtect_writePA__I", "xdc_Void(*)(ti_sysbios_family_c64p_MemoryProtect_Controller*,xdc_UInt,xdc_UInt32)", true, false));
    }

    void Clobber$$CONSTS()
    {
        // module Clobber
        om.bind("ti.sysbios.family.c64p.Clobber.trashRegs", new Extern("ti_sysbios_family_c64p_Clobber_trashRegs__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Clobber.postIntr", new Extern("ti_sysbios_family_c64p_Clobber_postIntr__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c64p.Clobber.checkRegs", new Extern("ti_sysbios_family_c64p_Clobber_checkRegs__E", "xdc_UInt(*)(xdc_UInt)", true, false));
    }

    void Cache$$CONSTS()
    {
        // module Cache
        om.bind("ti.sysbios.family.c64p.Cache.Mode_FREEZE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.Mode", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.Mode_FREEZE", 0));
        om.bind("ti.sysbios.family.c64p.Cache.Mode_BYPASS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.Mode", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.Mode_BYPASS", 1));
        om.bind("ti.sysbios.family.c64p.Cache.Mode_NORMAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.Mode", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.Mode_NORMAL", 2));
        om.bind("ti.sysbios.family.c64p.Cache.L1Size_0K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L1Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L1Size_0K", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L1Size_4K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L1Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L1Size_4K", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L1Size_8K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L1Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L1Size_8K", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L1Size_16K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L1Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L1Size_16K", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L1Size_32K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L1Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L1Size_32K", xdc.services.intern.xsr.Enum.intValue(4L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L2Size_0K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L2Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L2Size_0K", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L2Size_32K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L2Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L2Size_32K", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L2Size_64K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L2Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L2Size_64K", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L2Size_128K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L2Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L2Size_128K", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L2Size_256K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L2Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L2Size_256K", xdc.services.intern.xsr.Enum.intValue(4L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L2Size_512K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L2Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L2Size_512K", xdc.services.intern.xsr.Enum.intValue(5L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L2Size_1024K", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.L2Size", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.L2Size_1024K", xdc.services.intern.xsr.Enum.intValue(6L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.Mar_DISABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.Mar", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.Mar_DISABLE", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.Mar_ENABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c64p.Cache.Mar", "ti.sysbios.family.c64p"), "ti.sysbios.family.c64p.Cache.Mar_ENABLE", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.c64p.Cache.L2CFG", 0x01840000L);
        om.bind("ti.sysbios.family.c64p.Cache.L1PCFG", 0x01840020L);
        om.bind("ti.sysbios.family.c64p.Cache.L1PCC", 0x01840024L);
        om.bind("ti.sysbios.family.c64p.Cache.L1DCFG", 0x01840040L);
        om.bind("ti.sysbios.family.c64p.Cache.L1DCC", 0x01840044L);
        om.bind("ti.sysbios.family.c64p.Cache.MAR", 0x01848000L);
        om.bind("ti.sysbios.family.c64p.Cache.enable", new Extern("ti_sysbios_family_c64p_Cache_enable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.wait", new Extern("ti_sysbios_family_c64p_Cache_wait__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.disable", new Extern("ti_sysbios_family_c64p_Cache_disable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.setMode", new Extern("ti_sysbios_family_c64p_Cache_setMode__E", "ti_sysbios_family_c64p_Cache_Mode(*)(xdc_Bits16,ti_sysbios_family_c64p_Cache_Mode)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.getMode", new Extern("ti_sysbios_family_c64p_Cache_getMode__E", "ti_sysbios_family_c64p_Cache_Mode(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.setSize", new Extern("ti_sysbios_family_c64p_Cache_setSize__E", "xdc_Void(*)(ti_sysbios_family_c64p_Cache_Size*)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.getSize", new Extern("ti_sysbios_family_c64p_Cache_getSize__E", "xdc_Void(*)(ti_sysbios_family_c64p_Cache_Size*)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.getMar", new Extern("ti_sysbios_family_c64p_Cache_getMar__E", "ti_sysbios_family_c64p_Cache_Mar(*)(xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.setMar", new Extern("ti_sysbios_family_c64p_Cache_setMar__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,ti_sysbios_family_c64p_Cache_Mar)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.inv", new Extern("ti_sysbios_family_c64p_Cache_inv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.wb", new Extern("ti_sysbios_family_c64p_Cache_wb__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.wbInv", new Extern("ti_sysbios_family_c64p_Cache_wbInv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.invL1pAll", new Extern("ti_sysbios_family_c64p_Cache_invL1pAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.wbAll", new Extern("ti_sysbios_family_c64p_Cache_wbAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.wbL1dAll", new Extern("ti_sysbios_family_c64p_Cache_wbL1dAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.wbInvAll", new Extern("ti_sysbios_family_c64p_Cache_wbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.wbInvL1dAll", new Extern("ti_sysbios_family_c64p_Cache_wbInvL1dAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.all", new Extern("ti_sysbios_family_c64p_Cache_all__I", "xdc_Void(*)(xdc_UInt32*)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.block", new Extern("ti_sysbios_family_c64p_Cache_block__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_UInt32*)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.getL1DInitSize", new Extern("ti_sysbios_family_c64p_Cache_getL1DInitSize__I", "xdc_Void(*)(ti_sysbios_family_c64p_Cache_Size*)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.getL1PInitSize", new Extern("ti_sysbios_family_c64p_Cache_getL1PInitSize__I", "xdc_Void(*)(ti_sysbios_family_c64p_Cache_Size*)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.getL2InitSize", new Extern("ti_sysbios_family_c64p_Cache_getL2InitSize__I", "xdc_Void(*)(ti_sysbios_family_c64p_Cache_Size*)", true, false));
        om.bind("ti.sysbios.family.c64p.Cache.marInit", new Extern("ti_sysbios_family_c64p_Cache_marInit__I", "xdc_Void(*)(xdc_UInt32,xdc_UInt32)", true, false));
    }

    void Settings$$CONSTS()
    {
        // module Settings
    }

    void EventCombiner$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Exception$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Hwi$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$c64p$Hwi$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.c64p.Hwi.create() called before xdc.useModule('ti.sysbios.family.c64p.Hwi')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.intNum, inst.$args.hwiFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c64p.Hwi$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.c64p.Hwi.Module", "ti.sysbios.family.c64p"), om.findStrict("ti.sysbios.family.c64p.Hwi.Instance", "ti.sysbios.family.c64p"), 3, 2, false));
                        fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.c64p.Hwi.Params", "ti.sysbios.family.c64p"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$c64p$Hwi$$create = function( intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.c64p.Hwi'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.c64p.Hwi.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.c64p']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.c64p.Hwi'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [intNum, hwiFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.c64p.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c64p.Hwi$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.c64p.Hwi.Module", "ti.sysbios.family.c64p"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.c64p.Hwi$$Object", "ti.sysbios.family.c64p"), null);
                        fxn.addArg(1, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.c64p.Hwi.Params", "ti.sysbios.family.c64p"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$c64p$Hwi$$construct = function( __obj, intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.c64p.Hwi'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.c64p.Hwi'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.c64p.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void TimestampProvider$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MemoryProtect$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Clobber$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Cache$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Settings$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void EventCombiner$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn EventCombiner.dispatchEventGroup
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c64p.EventCombiner$$dispatchEventGroup", new Proto.Fxn(om.findStrict("ti.sysbios.family.c64p.EventCombiner.Module", "ti.sysbios.family.c64p"), null, 2, 2, false));
                fxn.addArg(0, "evt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "hwiVec", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
    }

    void Exception$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Hwi$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Hwi.inUseMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c64p.Hwi$$inUseMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.c64p.Hwi.Module", "ti.sysbios.family.c64p"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
        // fxn Hwi.eventMapMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c64p.Hwi$$eventMapMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.c64p.Hwi.Module", "ti.sysbios.family.c64p"), null, 2, 2, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(1, "eventId", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn Hwi.plugMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c64p.Hwi$$plugMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.c64p.Hwi.Module", "ti.sysbios.family.c64p"), null, 2, 2, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "fxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF);
    }

    void TimestampProvider$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MemoryProtect$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Clobber$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cache$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Settings$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void EventCombiner$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.EventCombiner.DispatchTabElem", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("arg", "UIArg"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.EventCombiner.DispatchTabElem']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.EventCombiner.DispatchTabElem']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.EventCombiner.DispatchTabElem'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.EventCombiner.Module_State", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("dispatchTab", "A128;Sti.sysbios.family.c64p.EventCombiner;DispatchTabElem"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.EventCombiner.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.EventCombiner.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.EventCombiner.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Exception$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.Exception.Context", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("ILC", "UPtr"));
        sizes.add(Global.newArray("RILC", "UPtr"));
        sizes.add(Global.newArray("AMR", "UPtr"));
        sizes.add(Global.newArray("SSR", "UPtr"));
        sizes.add(Global.newArray("IRP", "UPtr"));
        sizes.add(Global.newArray("NRP", "UPtr"));
        sizes.add(Global.newArray("ITSR", "UPtr"));
        sizes.add(Global.newArray("NTSR", "UPtr"));
        sizes.add(Global.newArray("EFR", "UPtr"));
        sizes.add(Global.newArray("IERR", "UPtr"));
        sizes.add(Global.newArray("B30", "UPtr"));
        sizes.add(Global.newArray("B31", "UPtr"));
        sizes.add(Global.newArray("B28", "UPtr"));
        sizes.add(Global.newArray("B29", "UPtr"));
        sizes.add(Global.newArray("B26", "UPtr"));
        sizes.add(Global.newArray("B27", "UPtr"));
        sizes.add(Global.newArray("B24", "UPtr"));
        sizes.add(Global.newArray("B25", "UPtr"));
        sizes.add(Global.newArray("B22", "UPtr"));
        sizes.add(Global.newArray("B23", "UPtr"));
        sizes.add(Global.newArray("B20", "UPtr"));
        sizes.add(Global.newArray("B21", "UPtr"));
        sizes.add(Global.newArray("B18", "UPtr"));
        sizes.add(Global.newArray("B19", "UPtr"));
        sizes.add(Global.newArray("B16", "UPtr"));
        sizes.add(Global.newArray("B17", "UPtr"));
        sizes.add(Global.newArray("B14", "UPtr"));
        sizes.add(Global.newArray("B15", "UPtr"));
        sizes.add(Global.newArray("B12", "UPtr"));
        sizes.add(Global.newArray("B13", "UPtr"));
        sizes.add(Global.newArray("B10", "UPtr"));
        sizes.add(Global.newArray("B11", "UPtr"));
        sizes.add(Global.newArray("B8", "UPtr"));
        sizes.add(Global.newArray("B9", "UPtr"));
        sizes.add(Global.newArray("B6", "UPtr"));
        sizes.add(Global.newArray("B7", "UPtr"));
        sizes.add(Global.newArray("B4", "UPtr"));
        sizes.add(Global.newArray("B5", "UPtr"));
        sizes.add(Global.newArray("B2", "UPtr"));
        sizes.add(Global.newArray("B3", "UPtr"));
        sizes.add(Global.newArray("B0", "UPtr"));
        sizes.add(Global.newArray("B1", "UPtr"));
        sizes.add(Global.newArray("A30", "UPtr"));
        sizes.add(Global.newArray("A31", "UPtr"));
        sizes.add(Global.newArray("A28", "UPtr"));
        sizes.add(Global.newArray("A29", "UPtr"));
        sizes.add(Global.newArray("A26", "UPtr"));
        sizes.add(Global.newArray("A27", "UPtr"));
        sizes.add(Global.newArray("A24", "UPtr"));
        sizes.add(Global.newArray("A25", "UPtr"));
        sizes.add(Global.newArray("A22", "UPtr"));
        sizes.add(Global.newArray("A23", "UPtr"));
        sizes.add(Global.newArray("A20", "UPtr"));
        sizes.add(Global.newArray("A21", "UPtr"));
        sizes.add(Global.newArray("A18", "UPtr"));
        sizes.add(Global.newArray("A19", "UPtr"));
        sizes.add(Global.newArray("A16", "UPtr"));
        sizes.add(Global.newArray("A17", "UPtr"));
        sizes.add(Global.newArray("A14", "UPtr"));
        sizes.add(Global.newArray("A15", "UPtr"));
        sizes.add(Global.newArray("A12", "UPtr"));
        sizes.add(Global.newArray("A13", "UPtr"));
        sizes.add(Global.newArray("A10", "UPtr"));
        sizes.add(Global.newArray("A11", "UPtr"));
        sizes.add(Global.newArray("A8", "UPtr"));
        sizes.add(Global.newArray("A9", "UPtr"));
        sizes.add(Global.newArray("A6", "UPtr"));
        sizes.add(Global.newArray("A7", "UPtr"));
        sizes.add(Global.newArray("A4", "UPtr"));
        sizes.add(Global.newArray("A5", "UPtr"));
        sizes.add(Global.newArray("A2", "UPtr"));
        sizes.add(Global.newArray("A3", "UPtr"));
        sizes.add(Global.newArray("A0", "UPtr"));
        sizes.add(Global.newArray("A1", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.Exception.Context']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.Exception.Context']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.Exception.Context'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.Exception.Status", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("efr", "UInt32"));
        sizes.add(Global.newArray("nrp", "UInt32"));
        sizes.add(Global.newArray("ntsr", "UInt32"));
        sizes.add(Global.newArray("ierr", "UInt32"));
        sizes.add(Global.newArray("excContext", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.Exception.Status']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.Exception.Status']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.Exception.Status'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.Exception.Module_State", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("efr", "UInt32"));
        sizes.add(Global.newArray("nrp", "UInt32"));
        sizes.add(Global.newArray("ntsr", "UInt32"));
        sizes.add(Global.newArray("ierr", "UInt32"));
        sizes.add(Global.newArray("returnHook", "UFxn"));
        sizes.add(Global.newArray("excContext", "UPtr"));
        sizes.add(Global.newArray("scratch", "A16;TChar"));
        sizes.add(Global.newArray("excPtr", "UPtr"));
        sizes.add(Global.newArray("contextBuf", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.Exception.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.Exception.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.Exception.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Hwi$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.Hwi.Instance_State", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("disableMask", "UInt16"));
        sizes.add(Global.newArray("restoreMask", "UInt16"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("irp", "UIArg"));
        sizes.add(Global.newArray("hookEnv", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.Hwi.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.Hwi.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.Hwi.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.Hwi.Module_State", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("intEvents", "A16;TChar"));
        sizes.add(Global.newArray("ierMask", "UInt16"));
        sizes.add(Global.newArray("intNum", "TInt"));
        sizes.add(Global.newArray("taskSP", "UPtr"));
        sizes.add(Global.newArray("isrStack", "UPtr"));
        sizes.add(Global.newArray("vectorTableBase", "UPtr"));
        sizes.add(Global.newArray("bss", "UPtr"));
        sizes.add(Global.newArray("scw", "TInt"));
        sizes.add(Global.newArray("dispatchTable", "A16;UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.Hwi.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.Hwi.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.Hwi.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimestampProvider$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void MemoryProtect$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.BitRange", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("msb", "TChar"));
        sizes.add(Global.newArray("lsb", "TChar"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.BitRange']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.BitRange']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.BitRange'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Lock", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("mpLk0", "UInt32"));
        sizes.add(Global.newArray("mpLk1", "UInt32"));
        sizes.add(Global.newArray("mpLk2", "UInt32"));
        sizes.add(Global.newArray("mpLk3", "UInt32"));
        sizes.add(Global.newArray("mpLkCmd", "UInt32"));
        sizes.add(Global.newArray("mpLkStat", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Lock']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Lock']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Lock'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Fault", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("mpFar", "UInt32"));
        sizes.add(Global.newArray("mpFsr", "UInt32"));
        sizes.add(Global.newArray("mpFcr", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Fault']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Fault']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Fault'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Key", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("key0", "UInt32"));
        sizes.add(Global.newArray("key1", "UInt32"));
        sizes.add(Global.newArray("key2", "UInt32"));
        sizes.add(Global.newArray("key3", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Key']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Key']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Key'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Controller", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("mpFault", "UPtr"));
        sizes.add(Global.newArray("mpLck", "UPtr"));
        sizes.add(Global.newArray("mppaTab", "UPtr"));
        sizes.add(Global.newArray("mpCfg", "UPtr"));
        sizes.add(Global.newArray("nPages", "UInt32"));
        sizes.add(Global.newArray("evtNum", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Controller']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Controller']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Controller'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Module_State", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("controllers", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.MemoryProtect.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Clobber$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Cache$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.Cache.Size", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("l1pSize", "Nti.sysbios.family.c64p.Cache.L1Size;;0;1;2;3;4"));
        sizes.add(Global.newArray("l1dSize", "Nti.sysbios.family.c64p.Cache.L1Size;;0;1;2;3;4"));
        sizes.add(Global.newArray("l2Size", "Nti.sysbios.family.c64p.Cache.L2Size;;0;1;2;3;4;5;6"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.Cache.Size']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.Cache.Size']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.Cache.Size'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c64p.Cache.Module_State", "ti.sysbios.family.c64p");
        sizes.clear();
        sizes.add(Global.newArray("emifAddr", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c64p.Cache.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c64p.Cache.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c64p.Cache.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Settings$$SIZES()
    {
    }

    void EventCombiner$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c64p/EventCombiner.xs");
        om.bind("ti.sysbios.family.c64p.EventCombiner$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner.Module", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.EventCombiner.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.c64p"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_EVENTS", Proto.Elm.newCNum("(xdc_Int)"), 128L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.c64p"), $$UNDEF, "wh");
            po.addFld("A_invalidEventId", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "A_invalidEventId: Invalid event Id specified"), "w");
            po.addFld("E_unpluggedEvent", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "E_unpluggedEvent: Event# %d is unplugged"), "w");
            po.addFld("EVTMASK", new Proto.Arr(Proto.Elm.newCNum("(xdc_Bits32)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
            po.addFld("events", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c64p.EventCombiner.EventObj", "ti.sysbios.family.c64p"), false, xdc.services.intern.xsr.Enum.intValue(128L)), $$DEFAULT, "wh");
            po.addFld("eventGroupHwiNum", new Proto.Arr(Proto.Elm.newCNum("(xdc_Int)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.EventCombiner$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.EventCombiner$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.EventCombiner$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.EventCombiner$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("dispatchEventGroup", (Proto.Fxn)om.findStrict("ti.sysbios.family.c64p.EventCombiner$$dispatchEventGroup", "ti.sysbios.family.c64p"), Global.get(cap, "dispatchEventGroup"));
        // struct EventCombiner.EventView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner$$EventView", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.EventCombiner.EventView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("eventId", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", $$T_Str, $$UNDEF, "w");
        // typedef EventCombiner.FuncPtr
        om.bind("ti.sysbios.family.c64p.EventCombiner.FuncPtr", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"));
        // struct EventCombiner.EventObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner$$EventObj", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.EventCombiner.EventObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("unmask", $$T_Bool, $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
        // struct EventCombiner.DispatchTabElem
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner$$DispatchTabElem", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.EventCombiner.DispatchTabElem", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
        // struct EventCombiner.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner$$Module_State", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.EventCombiner.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("dispatchTab", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c64p.EventCombiner.DispatchTabElem", "ti.sysbios.family.c64p"), false, xdc.services.intern.xsr.Enum.intValue(128L)), $$DEFAULT, "w");
    }

    void Exception$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c64p/Exception.xs");
        om.bind("ti.sysbios.family.c64p.Exception$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Exception.Module", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Exception.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.c64p"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("EFRSXF", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000001L, "rh");
                po.addFld("EFRIXF", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000002L, "rh");
                po.addFld("EFREXF", Proto.Elm.newCNum("(xdc_Bits32)"), 0x40000000L, "rh");
                po.addFld("EFRNXF", Proto.Elm.newCNum("(xdc_Bits32)"), 0x80000000L, "rh");
                po.addFld("ECRSXF", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000001L, "rh");
                po.addFld("ECRIXF", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000002L, "rh");
                po.addFld("ECREXF", Proto.Elm.newCNum("(xdc_Bits32)"), 0x40000000L, "rh");
                po.addFld("ECRNXF", Proto.Elm.newCNum("(xdc_Bits32)"), 0x80000000L, "rh");
                po.addFld("IERRIFX", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000001L, "rh");
                po.addFld("IERRFPX", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000002L, "rh");
                po.addFld("IERREPX", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000004L, "rh");
                po.addFld("IERROPX", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000008L, "rh");
                po.addFld("IERRRCX", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000010L, "rh");
                po.addFld("IERRRAX", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000020L, "rh");
                po.addFld("IERRPRX", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000040L, "rh");
                po.addFld("IERRLBX", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000080L, "rh");
                po.addFld("IERRMSX", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000100L, "rh");
                po.addFld("TSRGEE", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000004L, "rh");
                po.addFld("TSRXEN", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000008L, "rh");
                po.addFld("TSREXC", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000400L, "rh");
                po.addFld("TSRCXM", Proto.Elm.newCNum("(xdc_Bits32)"), 0x000000C0L, "rh");
                po.addFld("TSRCXMSHIFT", Proto.Elm.newCNum("(xdc_Bits32)"), 6L, "rh");
                po.addFld("TSRCXMSV", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000000L, "rh");
                po.addFld("TSRCXMUS", Proto.Elm.newCNum("(xdc_Bits32)"), 0x00000040L, "rh");
                po.addFld("sizeContextBuf", Proto.Elm.newCNum("(xdc_UInt32)"), 320L, "rh");
                po.addFld("EVTPMCCMPA", Proto.Elm.newCNum("(xdc_UInt)"), 120L, "rh");
                po.addFld("EVTDMCCMPA", Proto.Elm.newCNum("(xdc_UInt)"), 122L, "rh");
                po.addFld("EVTUMCCMPA", Proto.Elm.newCNum("(xdc_UInt)"), 124L, "rh");
                po.addFld("EVTEMCCMPA", Proto.Elm.newCNum("(xdc_UInt)"), 126L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.c64p"), $$UNDEF, "wh");
            po.addFld("E_exceptionMin", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "E_exceptionMin: pc = 0x%08x, sp = 0x%08x.\nTo see more exception detail, use ROV or set 'ti.sysbios.family.c64p.Exception.enablePrint = true;'"), "w");
            po.addFld("E_exceptionMax", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "E_exceptionMax: pc = 0x%08x, sp = 0x%08x."), "w");
            po.addFld("useInternalBuffer", $$T_Bool, false, "w");
            po.addFld("enableExternalMPC", $$T_Bool, false, "w");
            po.addFld("enablePrint", $$T_Bool, true, "w");
            po.addFld("exceptionHook", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), null, "w");
            po.addFld("internalHook", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), null, "w");
            po.addFld("externalHook", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), null, "w");
            po.addFld("nmiHook", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), null, "w");
            po.addFld("returnHook", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), null, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Exception$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Exception$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Exception$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Exception$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Exception.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Exception$$ModuleView", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Exception.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("exception", $$T_Str, $$UNDEF, "w");
        // typedef Exception.FuncPtr
        om.bind("ti.sysbios.family.c64p.Exception.FuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Exception.Context
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Exception$$Context", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Exception.Context", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ILC", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("RILC", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("AMR", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("SSR", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("IRP", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("NRP", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("ITSR", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("NTSR", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("EFR", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("IERR", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B30", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B31", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B28", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B29", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B26", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B27", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B24", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B25", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B22", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B23", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B20", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B21", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B18", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B19", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B16", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B17", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B14", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B15", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B12", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B13", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B10", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B11", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B8", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B9", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B6", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B7", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B4", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B5", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B2", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B3", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B0", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("B1", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A30", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A31", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A28", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A29", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A26", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A27", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A24", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A25", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A22", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A23", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A20", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A21", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A18", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A19", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A16", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A17", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A14", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A15", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A12", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A13", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A10", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A11", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A8", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A9", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A6", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A7", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A4", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A5", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A2", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A3", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A0", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("A1", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Exception.Status
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Exception$$Status", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Exception.Status", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("efr", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("nrp", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("ntsr", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("ierr", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("excContext", new Proto.Adr("ti_sysbios_family_c64p_Exception_Context*", "PS"), $$UNDEF, "w");
        // struct Exception.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Exception$$Module_State", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Exception.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("efr", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("nrp", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("ntsr", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("ierr", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("returnHook", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
                po.addFld("excContext", new Proto.Adr("ti_sysbios_family_c64p_Exception_Context*", "PS"), $$UNDEF, "w");
                po.addFld("scratch", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
                po.addFld("excPtr", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("contextBuf", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), $$DEFAULT, "w");
    }

    void Hwi$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c64p/Hwi.xs");
        om.bind("ti.sysbios.family.c64p.Hwi$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi.Module", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Hwi.Module", om.findStrict("ti.sysbios.interfaces.IHwi.Module", "ti.sysbios.family.c64p"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 16L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.c64p"), $$UNDEF, "wh");
            po.addFld("nonDispatchedInterrupts", new Proto.Map((Proto)om.findStrict("ti.sysbios.family.c64p.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.c64p")), $$DEFAULT, "wh");
            po.addFld("resetVectorAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
            po.addFld("E_alreadyDefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "E_alreadyDefined: Hwi already defined: intr# %d"), "w");
            po.addFld("E_handleNotFound", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "E_handleNotFound: Hwi handle not found: 0x%x"), "w");
            po.addFld("E_allocSCFailed", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "E_allocSCFailed: Alloc secure context failed"), "w");
            po.addFld("E_registerSCFailed", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "E_registerSCFailed: Register secure context failed"), "w");
            po.addFld("E_invalidIntNum", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "E_invalidIntNum: Invalid interrupt number: intr# %d"), "w");
            po.addFld("LM_begin", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.c64p"), Global.newObject("mask", Global.eval("0x0100 | 0x0200"), "msg", "LM_begin: hwi: 0x%x, func: 0x%x, preThread: %d, intNum: %d, irp: 0x%x"), "w");
            po.addFld("LD_end", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.c64p"), Global.newObject("mask", 0x0200L, "msg", "LD_end: hwi: 0x%x"), "w");
            po.addFld("enableException", $$T_Bool, true, "w");
            po.addFld("swiDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("swiRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("taskDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("taskRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("hooks", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c64p.Hwi.HookSet", "ti.sysbios.family.c64p"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("interrupt", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c64p.Hwi.InterruptObj", "ti.sysbios.family.c64p"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.c64p.Hwi$$create", "ti.sysbios.family.c64p"), Global.get("ti$sysbios$family$c64p$Hwi$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.c64p.Hwi$$construct", "ti.sysbios.family.c64p"), Global.get("ti$sysbios$family$c64p$Hwi$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Hwi$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Hwi$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Hwi$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Hwi$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Hwi$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Hwi$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "addHookSet");
                if (fxn != null) po.addFxn("addHookSet", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$addHookSet", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "viewGetStackInfo");
                if (fxn != null) po.addFxn("viewGetStackInfo", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$viewGetStackInfo", "ti.sysbios.family.c64p"), fxn);
                po.addFxn("inUseMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.c64p.Hwi$$inUseMeta", "ti.sysbios.family.c64p"), Global.get(cap, "inUseMeta"));
                po.addFxn("eventMapMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.c64p.Hwi$$eventMapMeta", "ti.sysbios.family.c64p"), Global.get(cap, "eventMapMeta"));
                po.addFxn("plugMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.c64p.Hwi$$plugMeta", "ti.sysbios.family.c64p"), Global.get(cap, "plugMeta"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi.Instance", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Hwi.Instance", om.findStrict("ti.sysbios.interfaces.IHwi.Instance", "ti.sysbios.family.c64p"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 16L, "rh");
        if (isCFG) {
            po.addFld("disableMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("restoreMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.c64p"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$Params", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Hwi.Params", om.findStrict("ti.sysbios.interfaces.IHwi$$Params", "ti.sysbios.family.c64p"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 16L, "rh");
        if (isCFG) {
            po.addFld("disableMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("restoreMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.c64p"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$Object", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Hwi.Object", om.findStrict("ti.sysbios.family.c64p.Hwi.Instance", "ti.sysbios.family.c64p"));
        // typedef Hwi.PlugFuncPtr
        om.bind("ti.sysbios.family.c64p.Hwi.PlugFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Hwi.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$BasicView", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Hwi.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halHwiHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("eventId", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("disableMask", $$T_Str, $$UNDEF, "w");
                po.addFld("restoreMask", $$T_Str, $$UNDEF, "w");
        // struct Hwi.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$ModuleView", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Hwi.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("options", new Proto.Arr($$T_Str, false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("hwiStackPeak", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("hwiStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Hwi.NonDispatchedInterrupt
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$NonDispatchedInterrupt", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Hwi.NonDispatchedInterrupt", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
                po.addFld("enableInt", $$T_Bool, $$UNDEF, "w");
                po.addFld("eventId", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // struct Hwi.InterruptObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$InterruptObj", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Hwi.InterruptObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("used", $$T_Bool, $$UNDEF, "w");
                po.addFld("useDispatcher", $$T_Bool, $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("pfxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
        // struct Hwi.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$Instance_State", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Hwi.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("disableMask", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("restoreMask", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("hookEnv", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "w");
        // struct Hwi.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$Module_State", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Hwi.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("intEvents", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
                po.addFld("ierMask", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("taskSP", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("isrStack", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("vectorTableBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("bss", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("scw", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("dispatchTable", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c64p.Hwi.Handle", "ti.sysbios.family.c64p"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c64p/TimestampProvider.xs");
        om.bind("ti.sysbios.family.c64p.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.TimestampProvider.Module", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.TimestampProvider.Module", om.findStrict("ti.sysbios.interfaces.ITimestamp.Module", "ti.sysbios.family.c64p"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.TimestampProvider$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimestamp$$getFreqMeta", "ti.sysbios.family.c64p"), fxn);
    }

    void MemoryProtect$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c64p/MemoryProtect.xs");
        om.bind("ti.sysbios.family.c64p.MemoryProtect$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Module", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.MemoryProtect.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.c64p"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("MPPA_UX", Proto.Elm.newCNum("(xdc_UInt32)"), 0x00000001L, "rh");
                po.addFld("MPPA_UW", Proto.Elm.newCNum("(xdc_UInt32)"), 0x00000002L, "rh");
                po.addFld("MPPA_UR", Proto.Elm.newCNum("(xdc_UInt32)"), 0x00000004L, "rh");
                po.addFld("MPPA_SX", Proto.Elm.newCNum("(xdc_UInt32)"), 0x00000008L, "rh");
                po.addFld("MPPA_SW", Proto.Elm.newCNum("(xdc_UInt32)"), 0x00000010L, "rh");
                po.addFld("MPPA_SR", Proto.Elm.newCNum("(xdc_UInt32)"), 0x00000020L, "rh");
                po.addFld("MPPA_LOCAL", Proto.Elm.newCNum("(xdc_UInt32)"), 0x00000100L, "rh");
                po.addFld("NONE", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
                po.addFld("UMAP0", Proto.Elm.newCNum("(xdc_UInt)"), 1L, "rh");
                po.addFld("UMAP1", Proto.Elm.newCNum("(xdc_UInt)"), 2L, "rh");
                po.addFld("DMC", Proto.Elm.newCNum("(xdc_UInt)"), 3L, "rh");
                po.addFld("PMC", Proto.Elm.newCNum("(xdc_UInt)"), 4L, "rh");
                po.addFld("UMC", Proto.Elm.newCNum("(xdc_UInt)"), 1L, "rh");
                po.addFld("LCKUNLOCK", Proto.Elm.newCNum("(xdc_UInt)"), 0x00000001L, "rh");
                po.addFld("LCKLOCK", Proto.Elm.newCNum("(xdc_UInt)"), 0x00000002L, "rh");
                po.addFld("LCKKEYR", Proto.Elm.newCNum("(xdc_UInt)"), 0x00000004L, "rh");
                po.addFld("LKSTATLK", Proto.Elm.newCNum("(xdc_UInt)"), 0x00000001L, "rh");
        if (isCFG) {
            po.addFld("key", (Proto)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Key", "ti.sysbios.family.c64p"), Global.newObject("key0", 0x90abcdefL, "key1", 0x12345678L, "key2", 0x87654321L, "key3", 0xfedcba09L), "w");
            po.addFld("regExtMasks", new Proto.Arr(new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.BitRange", "ti.sysbios.family.c64p"), false, xdc.services.intern.xsr.Enum.intValue(2L)), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
            po.addFld("megaByte2MPC", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
            po.addFld("regionCompare", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
            po.addFld("regionEnd", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
            po.addFld("pmcCtrl", (Proto)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Controller", "ti.sysbios.family.c64p"), $$DEFAULT, "w");
            po.addFld("dmcCtrl", (Proto)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Controller", "ti.sysbios.family.c64p"), $$DEFAULT, "w");
            po.addFld("umcCtrl", (Proto)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Controller", "ti.sysbios.family.c64p"), $$DEFAULT, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.MemoryProtect$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.MemoryProtect$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.MemoryProtect$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.MemoryProtect$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct MemoryProtect.BitRange
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$BitRange", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.MemoryProtect.BitRange", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("msb", Proto.Elm.newCNum("(xdc_Char)"), $$UNDEF, "w");
                po.addFld("lsb", Proto.Elm.newCNum("(xdc_Char)"), $$UNDEF, "w");
        // struct MemoryProtect.Lock
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$Lock", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.MemoryProtect.Lock", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("mpLk0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("mpLk1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("mpLk2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("mpLk3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("mpLkCmd", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("mpLkStat", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct MemoryProtect.Fault
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$Fault", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.MemoryProtect.Fault", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("mpFar", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("mpFsr", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("mpFcr", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct MemoryProtect.Key
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$Key", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.MemoryProtect.Key", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("key0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("key1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("key2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("key3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct MemoryProtect.Controller
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$Controller", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.MemoryProtect.Controller", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("mpFault", new Proto.Adr("ti_sysbios_family_c64p_MemoryProtect_Fault*", "PS"), $$UNDEF, "w");
                po.addFld("mpLck", new Proto.Adr("ti_sysbios_family_c64p_MemoryProtect_Lock*", "PS"), $$UNDEF, "w");
                po.addFld("mppaTab", new Proto.Adr("xdc_UInt32*", "Pn"), $$UNDEF, "w");
                po.addFld("mpCfg", new Proto.Adr("xdc_UInt32*", "Pn"), $$UNDEF, "w");
                po.addFld("nPages", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("evtNum", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct MemoryProtect.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$Module_State", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.MemoryProtect.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("controllers", new Proto.Arr(new Proto.Adr("ti_sysbios_family_c64p_MemoryProtect_Controller*", "PS"), false), $$DEFAULT, "w");
    }

    void Clobber$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c64p/Clobber.xs");
        om.bind("ti.sysbios.family.c64p.Clobber$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Clobber.Module", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Clobber.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.c64p"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("postIntrCheck", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Clobber$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Clobber$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Clobber$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Clobber$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Cache$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c64p/Cache.xs");
        om.bind("ti.sysbios.family.c64p.Cache$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Cache.Module", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Cache.Module", om.findStrict("ti.sysbios.interfaces.ICache.Module", "ti.sysbios.family.c64p"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("L2CFG", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01840000L, "rh");
                po.addFld("L1PCFG", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01840020L, "rh");
                po.addFld("L1PCC", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01840024L, "rh");
                po.addFld("L1DCFG", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01840040L, "rh");
                po.addFld("L1DCC", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01840044L, "rh");
                po.addFld("MAR", Proto.Elm.newCNum("(xdc_UInt32)"), 0x01848000L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.c64p"), $$UNDEF, "wh");
            po.addFld("initSize", (Proto)om.findStrict("ti.sysbios.family.c64p.Cache.Size", "ti.sysbios.family.c64p"), Global.newObject("l1pSize", om.find("ti.sysbios.family.c64p.Cache.L1Size_32K"), "l1dSize", om.find("ti.sysbios.family.c64p.Cache.L1Size_32K"), "l2Size", om.find("ti.sysbios.family.c64p.Cache.L2Size_0K")), "w");
            po.addFld("EMIFA_CFG", new Proto.Adr("xdc_UInt*", "Pn"), $$UNDEF, "w");
            po.addFld("EMIFA_BASE", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("EMIFA_LENGTH", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("EMIFB_CFG", new Proto.Adr("xdc_UInt*", "Pn"), $$UNDEF, "w");
            po.addFld("EMIFB_BASE", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("EMIFB_LENGTH", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("EMIFC_CFG", new Proto.Adr("xdc_UInt*", "Pn"), $$UNDEF, "w");
            po.addFld("EMIFC_BASE", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("EMIFC_LENGTH", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("MAR0_31", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("MAR32_63", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("MAR64_95", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("MAR96_127", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("MAR128_159", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("MAR160_191", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("MAR192_223", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("MAR224_255", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("E_invalidL1CacheSize", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "E_invalidL1CacheSize: Invalid L1 cache size %d"), "w");
            po.addFld("E_invalidL2CacheSize", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c64p"), Global.newObject("msg", "E_invalidL2CacheSize: Invalid L2 cache size %d"), "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Cache$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Cache$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Cache$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Cache$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Cache.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Cache$$ModuleView", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Cache.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("L1PCacheSize", $$T_Str, $$UNDEF, "w");
                po.addFld("L1PMode", $$T_Str, $$UNDEF, "w");
                po.addFld("L1DCacheSize", $$T_Str, $$UNDEF, "w");
                po.addFld("L1DMode", $$T_Str, $$UNDEF, "w");
                po.addFld("L2CacheSize", $$T_Str, $$UNDEF, "w");
                po.addFld("L2Mode", $$T_Str, $$UNDEF, "w");
        // struct Cache.MarRegisterView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Cache$$MarRegisterView", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Cache.MarRegisterView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("number", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("addr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("startAddrRange", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("endAddrRange", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Cache.Size
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Cache$$Size", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Cache.Size", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("l1pSize", (Proto)om.findStrict("ti.sysbios.family.c64p.Cache.L1Size", "ti.sysbios.family.c64p"), $$UNDEF, "w");
                po.addFld("l1dSize", (Proto)om.findStrict("ti.sysbios.family.c64p.Cache.L1Size", "ti.sysbios.family.c64p"), $$UNDEF, "w");
                po.addFld("l2Size", (Proto)om.findStrict("ti.sysbios.family.c64p.Cache.L2Size", "ti.sysbios.family.c64p"), $$UNDEF, "w");
        // struct Cache.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Cache$$Module_State", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Cache.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("emifAddr", new Proto.Adr("xdc_UInt32*", "Pn"), $$UNDEF, "w");
    }

    void Settings$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c64p/Settings.xs");
        om.bind("ti.sysbios.family.c64p.Settings$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Settings.Module", "ti.sysbios.family.c64p");
        po.init("ti.sysbios.family.c64p.Settings.Module", om.findStrict("ti.sysbios.interfaces.ISettings.Module", "ti.sysbios.family.c64p"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Settings$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Settings$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c64p.Settings$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getDefaultCoreDelegate");
                if (fxn != null) po.addFxn("getDefaultCoreDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultCoreDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultHwiDelegate");
                if (fxn != null) po.addFxn("getDefaultHwiDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultHwiDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultTimerDelegate");
                if (fxn != null) po.addFxn("getDefaultTimerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimerDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultClockTimerDelegate");
                if (fxn != null) po.addFxn("getDefaultClockTimerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultClockTimerDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultTimerSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultTimerSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimerSupportDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultTimestampDelegate");
                if (fxn != null) po.addFxn("getDefaultTimestampDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimestampDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultTaskSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultTaskSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTaskSupportDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultIntrinsicsSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultIntrinsicsSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultIntrinsicsSupportDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultCacheDelegate");
                if (fxn != null) po.addFxn("getDefaultCacheDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultCacheDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultPowerDelegate");
                if (fxn != null) po.addFxn("getDefaultPowerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultPowerDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultSecondsDelegate");
                if (fxn != null) po.addFxn("getDefaultSecondsDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultSecondsDelegate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultBootModule");
                if (fxn != null) po.addFxn("getDefaultBootModule", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultBootModule", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultMmuModule");
                if (fxn != null) po.addFxn("getDefaultMmuModule", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultMmuModule", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getFamilySettingsXml");
                if (fxn != null) po.addFxn("getFamilySettingsXml", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getFamilySettingsXml", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getDefaultClockTickPeriod");
                if (fxn != null) po.addFxn("getDefaultClockTickPeriod", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultClockTickPeriod", "ti.sysbios.family.c64p"), fxn);
    }

    void EventCombiner$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner", "ti.sysbios.family.c64p");
        vo.bind("DispatchTabElem$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.EventCombiner.DispatchTabElem", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner$$DispatchTabElem", "ti.sysbios.family.c64p");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.EventCombiner.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner$$Module_State", "ti.sysbios.family.c64p");
    }

    void Exception$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Exception", "ti.sysbios.family.c64p");
        vo.bind("Context$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.Exception.Context", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Exception$$Context", "ti.sysbios.family.c64p");
        vo.bind("Status$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.Exception.Status", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Exception$$Status", "ti.sysbios.family.c64p");
        po.bind("excContext$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.Exception.Context", "isScalar", false));
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.Exception.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Exception$$Module_State", "ti.sysbios.family.c64p");
        po.bind("excContext$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.Exception.Context", "isScalar", false));
        po.bind("contextBuf$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Char", "isScalar", true));
    }

    void Hwi$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi", "ti.sysbios.family.c64p");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$Instance_State", "ti.sysbios.family.c64p");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.Hwi.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$Instance_State", "ti.sysbios.family.c64p");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.Hwi.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi$$Module_State", "ti.sysbios.family.c64p");
    }

    void TimestampProvider$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.TimestampProvider", "ti.sysbios.family.c64p");
    }

    void MemoryProtect$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect", "ti.sysbios.family.c64p");
        vo.bind("BitRange$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.MemoryProtect.BitRange", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$BitRange", "ti.sysbios.family.c64p");
        vo.bind("Lock$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.MemoryProtect.Lock", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$Lock", "ti.sysbios.family.c64p");
        vo.bind("Fault$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.MemoryProtect.Fault", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$Fault", "ti.sysbios.family.c64p");
        vo.bind("Key$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.MemoryProtect.Key", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$Key", "ti.sysbios.family.c64p");
        vo.bind("Controller$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.MemoryProtect.Controller", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$Controller", "ti.sysbios.family.c64p");
        po.bind("mpFault$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.MemoryProtect.Fault", "isScalar", false));
        po.bind("mpLck$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.MemoryProtect.Lock", "isScalar", false));
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.MemoryProtect.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$Module_State", "ti.sysbios.family.c64p");
    }

    void Clobber$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Clobber", "ti.sysbios.family.c64p");
    }

    void Cache$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Cache", "ti.sysbios.family.c64p");
        vo.bind("Size$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.Cache.Size", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Cache$$Size", "ti.sysbios.family.c64p");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c64p.Cache.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Cache$$Module_State", "ti.sysbios.family.c64p");
    }

    void Settings$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.c64p.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.c64p"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c64p/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.c64p"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.c64p"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.c64p", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.c64p");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.c64p.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.c64p'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.c64p$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.c64p$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.c64p$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c64p.ae674',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c64p.ae66',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c64p.ae66e',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c64p.ae674', {target: 'ti.targets.elf.C674', suffix: 'e674'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c64p.ae66', {target: 'ti.targets.elf.C66', suffix: 'e66'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c64p.ae66e', {target: 'ti.targets.elf.C66_big_endian', suffix: 'e66e'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void EventCombiner$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner", "ti.sysbios.family.c64p");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner.Module", "ti.sysbios.family.c64p");
        vo.init2(po, "ti.sysbios.family.c64p.EventCombiner", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c64p.EventCombiner$$capsule", "ti.sysbios.family.c64p"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c64p", "ti.sysbios.family.c64p"));
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
        vo.bind("EventView", om.findStrict("ti.sysbios.family.c64p.EventCombiner.EventView", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.EventCombiner.EventView", "ti.sysbios.family.c64p"));
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.family.c64p.EventCombiner.FuncPtr", "ti.sysbios.family.c64p"));
        vo.bind("EventObj", om.findStrict("ti.sysbios.family.c64p.EventCombiner.EventObj", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.EventCombiner.EventObj", "ti.sysbios.family.c64p"));
        mcfgs.add("A_invalidEventId");
        mcfgs.add("E_unpluggedEvent");
        mcfgs.add("EVTMASK");
        vo.bind("DispatchTabElem", om.findStrict("ti.sysbios.family.c64p.EventCombiner.DispatchTabElem", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.EventCombiner.DispatchTabElem", "ti.sysbios.family.c64p"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.c64p.EventCombiner.Module_State", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.EventCombiner.Module_State", "ti.sysbios.family.c64p"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c64p")).add(vo);
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
        vo.bind("disableEvent", om.findStrict("ti.sysbios.family.c64p.EventCombiner.disableEvent", "ti.sysbios.family.c64p"));
        vo.bind("enableEvent", om.findStrict("ti.sysbios.family.c64p.EventCombiner.enableEvent", "ti.sysbios.family.c64p"));
        vo.bind("dispatch", om.findStrict("ti.sysbios.family.c64p.EventCombiner.dispatch", "ti.sysbios.family.c64p"));
        vo.bind("dispatchPlug", om.findStrict("ti.sysbios.family.c64p.EventCombiner.dispatchPlug", "ti.sysbios.family.c64p"));
        vo.bind("unused", om.findStrict("ti.sysbios.family.c64p.EventCombiner.unused", "ti.sysbios.family.c64p"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c64p_EventCombiner_Module__startupDone__E", "ti_sysbios_family_c64p_EventCombiner_disableEvent__E", "ti_sysbios_family_c64p_EventCombiner_enableEvent__E", "ti_sysbios_family_c64p_EventCombiner_dispatch__E", "ti_sysbios_family_c64p_EventCombiner_dispatchPlug__E", "ti_sysbios_family_c64p_EventCombiner_unused__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_unpluggedEvent"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_invalidEventId"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("EventCombiner", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("EventCombiner");
    }

    void Exception$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Exception", "ti.sysbios.family.c64p");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Exception.Module", "ti.sysbios.family.c64p");
        vo.init2(po, "ti.sysbios.family.c64p.Exception", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c64p.Exception$$capsule", "ti.sysbios.family.c64p"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c64p", "ti.sysbios.family.c64p"));
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
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.c64p.Exception.ModuleView", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Exception.ModuleView", "ti.sysbios.family.c64p"));
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.family.c64p.Exception.FuncPtr", "ti.sysbios.family.c64p"));
        vo.bind("Context", om.findStrict("ti.sysbios.family.c64p.Exception.Context", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Exception.Context", "ti.sysbios.family.c64p"));
        vo.bind("Status", om.findStrict("ti.sysbios.family.c64p.Exception.Status", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Exception.Status", "ti.sysbios.family.c64p"));
        mcfgs.add("E_exceptionMin");
        mcfgs.add("E_exceptionMax");
        mcfgs.add("useInternalBuffer");
        mcfgs.add("enableExternalMPC");
        mcfgs.add("enablePrint");
        mcfgs.add("exceptionHook");
        mcfgs.add("internalHook");
        mcfgs.add("externalHook");
        mcfgs.add("nmiHook");
        mcfgs.add("returnHook");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.c64p.Exception.Module_State", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Exception.Module_State", "ti.sysbios.family.c64p"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c64p")).add(vo);
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
        vo.bind("getLastStatus", om.findStrict("ti.sysbios.family.c64p.Exception.getLastStatus", "ti.sysbios.family.c64p"));
        vo.bind("clearLastStatus", om.findStrict("ti.sysbios.family.c64p.Exception.clearLastStatus", "ti.sysbios.family.c64p"));
        vo.bind("setReturnPtr", om.findStrict("ti.sysbios.family.c64p.Exception.setReturnPtr", "ti.sysbios.family.c64p"));
        vo.bind("evtEvtClear", om.findStrict("ti.sysbios.family.c64p.Exception.evtEvtClear", "ti.sysbios.family.c64p"));
        vo.bind("evtExpMaskEnable", om.findStrict("ti.sysbios.family.c64p.Exception.evtExpMaskEnable", "ti.sysbios.family.c64p"));
        vo.bind("dispatch", om.findStrict("ti.sysbios.family.c64p.Exception.dispatch", "ti.sysbios.family.c64p"));
        vo.bind("handler", om.findStrict("ti.sysbios.family.c64p.Exception.handler", "ti.sysbios.family.c64p"));
        vo.bind("internalHandler", om.findStrict("ti.sysbios.family.c64p.Exception.internalHandler", "ti.sysbios.family.c64p"));
        vo.bind("externalHandler", om.findStrict("ti.sysbios.family.c64p.Exception.externalHandler", "ti.sysbios.family.c64p"));
        vo.bind("nmiHandler", om.findStrict("ti.sysbios.family.c64p.Exception.nmiHandler", "ti.sysbios.family.c64p"));
        vo.bind("decodeMpfsr", om.findStrict("ti.sysbios.family.c64p.Exception.decodeMpfsr", "ti.sysbios.family.c64p"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c64p_Exception_Module__startupDone__E", "ti_sysbios_family_c64p_Exception_getLastStatus__E", "ti_sysbios_family_c64p_Exception_clearLastStatus__E", "ti_sysbios_family_c64p_Exception_setReturnPtr__E", "ti_sysbios_family_c64p_Exception_evtEvtClear__E", "ti_sysbios_family_c64p_Exception_evtExpMaskEnable__E", "ti_sysbios_family_c64p_Exception_dispatch__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_exceptionMin", "E_exceptionMax"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Exception", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Exception");
    }

    void Hwi$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi", "ti.sysbios.family.c64p");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi.Module", "ti.sysbios.family.c64p");
        vo.init2(po, "ti.sysbios.family.c64p.Hwi", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c64p.Hwi$$capsule", "ti.sysbios.family.c64p"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.c64p.Hwi.Instance", "ti.sysbios.family.c64p"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.c64p.Hwi.Params", "ti.sysbios.family.c64p"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.c64p.Hwi.Params", "ti.sysbios.family.c64p")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.c64p.Hwi.Handle", "ti.sysbios.family.c64p"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c64p", "ti.sysbios.family.c64p"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.IHwi.FuncPtr", "ti.sysbios.family.c64p"));
        vo.bind("Irp", om.findStrict("ti.sysbios.interfaces.IHwi.Irp", "ti.sysbios.family.c64p"));
        vo.bind("HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.c64p"));
        vo.bind("MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.c64p"));
        vo.bind("StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.c64p"));
        mcfgs.add("dispatcherAutoNestingSupport");
        mcfgs.add("dispatcherSwiSupport");
        mcfgs.add("dispatcherTaskSupport");
        mcfgs.add("dispatcherIrpTrackingSupport");
        vo.bind("PlugFuncPtr", om.findStrict("ti.sysbios.family.c64p.Hwi.PlugFuncPtr", "ti.sysbios.family.c64p"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.c64p.Hwi.BasicView", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Hwi.BasicView", "ti.sysbios.family.c64p"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.c64p.Hwi.ModuleView", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Hwi.ModuleView", "ti.sysbios.family.c64p"));
        vo.bind("NonDispatchedInterrupt", om.findStrict("ti.sysbios.family.c64p.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.c64p"));
        mcfgs.add("E_alreadyDefined");
        mcfgs.add("E_handleNotFound");
        mcfgs.add("E_allocSCFailed");
        mcfgs.add("E_registerSCFailed");
        mcfgs.add("E_invalidIntNum");
        mcfgs.add("LM_begin");
        mcfgs.add("LD_end");
        mcfgs.add("enableException");
        mcfgs.add("swiDisable");
        icfgs.add("swiDisable");
        mcfgs.add("swiRestoreHwi");
        icfgs.add("swiRestoreHwi");
        mcfgs.add("taskDisable");
        icfgs.add("taskDisable");
        mcfgs.add("taskRestoreHwi");
        icfgs.add("taskRestoreHwi");
        mcfgs.add("hooks");
        icfgs.add("hooks");
        vo.bind("InterruptObj", om.findStrict("ti.sysbios.family.c64p.Hwi.InterruptObj", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Hwi.InterruptObj", "ti.sysbios.family.c64p"));
        icfgs.add("interrupt");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.c64p.Hwi.Instance_State", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Hwi.Instance_State", "ti.sysbios.family.c64p"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.c64p.Hwi.Module_State", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Hwi.Module_State", "ti.sysbios.family.c64p"));
        vo.bind("MaskingOption_NONE", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_NONE", "ti.sysbios.family.c64p"));
        vo.bind("MaskingOption_ALL", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_ALL", "ti.sysbios.family.c64p"));
        vo.bind("MaskingOption_SELF", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_SELF", "ti.sysbios.family.c64p"));
        vo.bind("MaskingOption_BITMASK", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_BITMASK", "ti.sysbios.family.c64p"));
        vo.bind("MaskingOption_LOWER", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER", "ti.sysbios.family.c64p"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c64p")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.c64p.Hwi$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$c64p$Hwi$$__initObject"));
        }//isCFG
        vo.bind("getStackInfo", om.findStrict("ti.sysbios.family.c64p.Hwi.getStackInfo", "ti.sysbios.family.c64p"));
        vo.bind("getCoreStackInfo", om.findStrict("ti.sysbios.family.c64p.Hwi.getCoreStackInfo", "ti.sysbios.family.c64p"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.c64p.Hwi.startup", "ti.sysbios.family.c64p"));
        vo.bind("switchFromBootStack", om.findStrict("ti.sysbios.family.c64p.Hwi.switchFromBootStack", "ti.sysbios.family.c64p"));
        vo.bind("post", om.findStrict("ti.sysbios.family.c64p.Hwi.post", "ti.sysbios.family.c64p"));
        vo.bind("getTaskSP", om.findStrict("ti.sysbios.family.c64p.Hwi.getTaskSP", "ti.sysbios.family.c64p"));
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.c64p.Hwi.disableInterrupt", "ti.sysbios.family.c64p"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.c64p.Hwi.enableInterrupt", "ti.sysbios.family.c64p"));
        vo.bind("restoreInterrupt", om.findStrict("ti.sysbios.family.c64p.Hwi.restoreInterrupt", "ti.sysbios.family.c64p"));
        vo.bind("clearInterrupt", om.findStrict("ti.sysbios.family.c64p.Hwi.clearInterrupt", "ti.sysbios.family.c64p"));
        vo.bind("eventMap", om.findStrict("ti.sysbios.family.c64p.Hwi.eventMap", "ti.sysbios.family.c64p"));
        vo.bind("plug", om.findStrict("ti.sysbios.family.c64p.Hwi.plug", "ti.sysbios.family.c64p"));
        vo.bind("getEventId", om.findStrict("ti.sysbios.family.c64p.Hwi.getEventId", "ti.sysbios.family.c64p"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.c64p.Hwi.getHandle", "ti.sysbios.family.c64p"));
        vo.bind("disableIER", om.findStrict("ti.sysbios.family.c64p.Hwi.disableIER", "ti.sysbios.family.c64p"));
        vo.bind("enableIER", om.findStrict("ti.sysbios.family.c64p.Hwi.enableIER", "ti.sysbios.family.c64p"));
        vo.bind("restoreIER", om.findStrict("ti.sysbios.family.c64p.Hwi.restoreIER", "ti.sysbios.family.c64p"));
        vo.bind("getIsrStackAddress", om.findStrict("ti.sysbios.family.c64p.Hwi.getIsrStackAddress", "ti.sysbios.family.c64p"));
        vo.bind("dispatchC", om.findStrict("ti.sysbios.family.c64p.Hwi.dispatchC", "ti.sysbios.family.c64p"));
        vo.bind("dispatchCore", om.findStrict("ti.sysbios.family.c64p.Hwi.dispatchCore", "ti.sysbios.family.c64p"));
        vo.bind("unPluggedInterrupt", om.findStrict("ti.sysbios.family.c64p.Hwi.unPluggedInterrupt", "ti.sysbios.family.c64p"));
        vo.bind("switchAndDispatch", om.findStrict("ti.sysbios.family.c64p.Hwi.switchAndDispatch", "ti.sysbios.family.c64p"));
        vo.bind("setupSC", om.findStrict("ti.sysbios.family.c64p.Hwi.setupSC", "ti.sysbios.family.c64p"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.c64p.Hwi.postInit", "ti.sysbios.family.c64p"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c64p_Hwi_Handle__label__E", "ti_sysbios_family_c64p_Hwi_Module__startupDone__E", "ti_sysbios_family_c64p_Hwi_Object__create__E", "ti_sysbios_family_c64p_Hwi_Object__delete__E", "ti_sysbios_family_c64p_Hwi_Object__get__E", "ti_sysbios_family_c64p_Hwi_Object__first__E", "ti_sysbios_family_c64p_Hwi_Object__next__E", "ti_sysbios_family_c64p_Hwi_Params__init__E", "ti_sysbios_family_c64p_Hwi_getStackInfo__E", "ti_sysbios_family_c64p_Hwi_getCoreStackInfo__E", "ti_sysbios_family_c64p_Hwi_startup__E", "ti_sysbios_family_c64p_Hwi_switchFromBootStack__E", "ti_sysbios_family_c64p_Hwi_post__E", "ti_sysbios_family_c64p_Hwi_getTaskSP__E", "ti_sysbios_family_c64p_Hwi_disableInterrupt__E", "ti_sysbios_family_c64p_Hwi_enableInterrupt__E", "ti_sysbios_family_c64p_Hwi_restoreInterrupt__E", "ti_sysbios_family_c64p_Hwi_clearInterrupt__E", "ti_sysbios_family_c64p_Hwi_getFunc__E", "ti_sysbios_family_c64p_Hwi_setFunc__E", "ti_sysbios_family_c64p_Hwi_getHookContext__E", "ti_sysbios_family_c64p_Hwi_setHookContext__E", "ti_sysbios_family_c64p_Hwi_getIrp__E", "ti_sysbios_family_c64p_Hwi_disable__E", "ti_sysbios_family_c64p_Hwi_enable__E", "ti_sysbios_family_c64p_Hwi_restore__E", "ti_sysbios_family_c64p_Hwi_eventMap__E", "ti_sysbios_family_c64p_Hwi_plug__E", "ti_sysbios_family_c64p_Hwi_getEventId__E", "ti_sysbios_family_c64p_Hwi_getHandle__E", "ti_sysbios_family_c64p_Hwi_disableIER__E", "ti_sysbios_family_c64p_Hwi_enableIER__E", "ti_sysbios_family_c64p_Hwi_restoreIER__E", "ti_sysbios_family_c64p_Hwi_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray("LM_begin", "LD_end"));
        vo.bind("$$errorDescCfgs", Global.newArray("E_alreadyDefined", "E_handleNotFound", "E_allocSCFailed", "E_registerSCFailed", "E_invalidIntNum"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Hwi.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.c64p.Hwi.Object", "ti.sysbios.family.c64p"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Hwi.xdt");
        pkgV.bind("Hwi", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Hwi");
    }

    void TimestampProvider$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.TimestampProvider", "ti.sysbios.family.c64p");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.TimestampProvider.Module", "ti.sysbios.family.c64p");
        vo.init2(po, "ti.sysbios.family.c64p.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c64p.TimestampProvider$$capsule", "ti.sysbios.family.c64p"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c64p", "ti.sysbios.family.c64p"));
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
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c64p")).add(vo);
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
        vo.bind("get32", om.findStrict("ti.sysbios.family.c64p.TimestampProvider.get32", "ti.sysbios.family.c64p"));
        vo.bind("get64", om.findStrict("ti.sysbios.family.c64p.TimestampProvider.get64", "ti.sysbios.family.c64p"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.family.c64p.TimestampProvider.getFreq", "ti.sysbios.family.c64p"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c64p_TimestampProvider_Module__startupDone__E", "ti_sysbios_family_c64p_TimestampProvider_get32__E", "ti_sysbios_family_c64p_TimestampProvider_get64__E", "ti_sysbios_family_c64p_TimestampProvider_getFreq__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("TimestampProvider", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TimestampProvider");
    }

    void MemoryProtect$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect", "ti.sysbios.family.c64p");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Module", "ti.sysbios.family.c64p");
        vo.init2(po, "ti.sysbios.family.c64p.MemoryProtect", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c64p.MemoryProtect$$capsule", "ti.sysbios.family.c64p"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c64p", "ti.sysbios.family.c64p"));
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
        vo.bind("BitRange", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.BitRange", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.MemoryProtect.BitRange", "ti.sysbios.family.c64p"));
        vo.bind("Lock", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Lock", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Lock", "ti.sysbios.family.c64p"));
        vo.bind("Fault", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Fault", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Fault", "ti.sysbios.family.c64p"));
        vo.bind("Key", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Key", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Key", "ti.sysbios.family.c64p"));
        vo.bind("Controller", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Controller", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Controller", "ti.sysbios.family.c64p"));
        mcfgs.add("key");
        icfgs.add("key");
        mcfgs.add("regExtMasks");
        icfgs.add("regExtMasks");
        mcfgs.add("megaByte2MPC");
        icfgs.add("megaByte2MPC");
        mcfgs.add("regionCompare");
        icfgs.add("regionCompare");
        mcfgs.add("regionEnd");
        icfgs.add("regionEnd");
        mcfgs.add("pmcCtrl");
        icfgs.add("pmcCtrl");
        mcfgs.add("dmcCtrl");
        icfgs.add("dmcCtrl");
        mcfgs.add("umcCtrl");
        icfgs.add("umcCtrl");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Module_State", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.MemoryProtect.Module_State", "ti.sysbios.family.c64p"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c64p")).add(vo);
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
        vo.bind("getPA", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.getPA", "ti.sysbios.family.c64p"));
        vo.bind("setPA", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.setPA", "ti.sysbios.family.c64p"));
        vo.bind("getPageSize", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.getPageSize", "ti.sysbios.family.c64p"));
        vo.bind("getPrivMode", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.getPrivMode", "ti.sysbios.family.c64p"));
        vo.bind("setPrivMode", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.setPrivMode", "ti.sysbios.family.c64p"));
        vo.bind("decodeRegion", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.decodeRegion", "ti.sysbios.family.c64p"));
        vo.bind("getAddrPageSize", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.getAddrPageSize", "ti.sysbios.family.c64p"));
        vo.bind("lock", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.lock", "ti.sysbios.family.c64p"));
        vo.bind("makeLocal", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.makeLocal", "ti.sysbios.family.c64p"));
        vo.bind("readPA", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.readPA", "ti.sysbios.family.c64p"));
        vo.bind("unlock", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.unlock", "ti.sysbios.family.c64p"));
        vo.bind("writePA", om.findStrict("ti.sysbios.family.c64p.MemoryProtect.writePA", "ti.sysbios.family.c64p"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c64p_MemoryProtect_Module__startupDone__E", "ti_sysbios_family_c64p_MemoryProtect_getPA__E", "ti_sysbios_family_c64p_MemoryProtect_setPA__E", "ti_sysbios_family_c64p_MemoryProtect_getPageSize__E", "ti_sysbios_family_c64p_MemoryProtect_getPrivMode__E", "ti_sysbios_family_c64p_MemoryProtect_setPrivMode__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("MemoryProtect", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MemoryProtect");
    }

    void Clobber$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Clobber", "ti.sysbios.family.c64p");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Clobber.Module", "ti.sysbios.family.c64p");
        vo.init2(po, "ti.sysbios.family.c64p.Clobber", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c64p.Clobber$$capsule", "ti.sysbios.family.c64p"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c64p", "ti.sysbios.family.c64p"));
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
        mcfgs.add("postIntrCheck");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c64p")).add(vo);
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
        vo.bind("trashRegs", om.findStrict("ti.sysbios.family.c64p.Clobber.trashRegs", "ti.sysbios.family.c64p"));
        vo.bind("postIntr", om.findStrict("ti.sysbios.family.c64p.Clobber.postIntr", "ti.sysbios.family.c64p"));
        vo.bind("checkRegs", om.findStrict("ti.sysbios.family.c64p.Clobber.checkRegs", "ti.sysbios.family.c64p"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c64p_Clobber_Module__startupDone__E", "ti_sysbios_family_c64p_Clobber_trashRegs__E", "ti_sysbios_family_c64p_Clobber_postIntr__E", "ti_sysbios_family_c64p_Clobber_checkRegs__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        loggables.add(Global.newObject("name", "trashRegs", "entry", "0x%x", "exit", ""));
        loggables.add(Global.newObject("name", "postIntr", "entry", "0x%x", "exit", ""));
        loggables.add(Global.newObject("name", "checkRegs", "entry", "0x%x", "exit", "0x%x"));
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Clobber", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Clobber");
    }

    void Cache$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Cache", "ti.sysbios.family.c64p");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Cache.Module", "ti.sysbios.family.c64p");
        vo.init2(po, "ti.sysbios.family.c64p.Cache", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c64p.Cache$$capsule", "ti.sysbios.family.c64p"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c64p", "ti.sysbios.family.c64p"));
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
        vo.bind("Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.c64p"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.c64p.Cache.ModuleView", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Cache.ModuleView", "ti.sysbios.family.c64p"));
        vo.bind("MarRegisterView", om.findStrict("ti.sysbios.family.c64p.Cache.MarRegisterView", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Cache.MarRegisterView", "ti.sysbios.family.c64p"));
        vo.bind("Mode", om.findStrict("ti.sysbios.family.c64p.Cache.Mode", "ti.sysbios.family.c64p"));
        vo.bind("L1Size", om.findStrict("ti.sysbios.family.c64p.Cache.L1Size", "ti.sysbios.family.c64p"));
        vo.bind("L2Size", om.findStrict("ti.sysbios.family.c64p.Cache.L2Size", "ti.sysbios.family.c64p"));
        vo.bind("Mar", om.findStrict("ti.sysbios.family.c64p.Cache.Mar", "ti.sysbios.family.c64p"));
        vo.bind("Size", om.findStrict("ti.sysbios.family.c64p.Cache.Size", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Cache.Size", "ti.sysbios.family.c64p"));
        mcfgs.add("initSize");
        mcfgs.add("EMIFA_CFG");
        mcfgs.add("EMIFA_BASE");
        mcfgs.add("EMIFA_LENGTH");
        mcfgs.add("EMIFB_CFG");
        mcfgs.add("EMIFB_BASE");
        mcfgs.add("EMIFB_LENGTH");
        mcfgs.add("EMIFC_CFG");
        mcfgs.add("EMIFC_BASE");
        mcfgs.add("EMIFC_LENGTH");
        mcfgs.add("MAR0_31");
        mcfgs.add("MAR32_63");
        mcfgs.add("MAR64_95");
        mcfgs.add("MAR96_127");
        mcfgs.add("MAR128_159");
        mcfgs.add("MAR160_191");
        mcfgs.add("MAR192_223");
        mcfgs.add("MAR224_255");
        mcfgs.add("E_invalidL1CacheSize");
        mcfgs.add("E_invalidL2CacheSize");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.c64p.Cache.Module_State", "ti.sysbios.family.c64p"));
        tdefs.add(om.findStrict("ti.sysbios.family.c64p.Cache.Module_State", "ti.sysbios.family.c64p"));
        vo.bind("Type_L1P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1P", "ti.sysbios.family.c64p"));
        vo.bind("Type_L1D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1D", "ti.sysbios.family.c64p"));
        vo.bind("Type_L1", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1", "ti.sysbios.family.c64p"));
        vo.bind("Type_L2P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2P", "ti.sysbios.family.c64p"));
        vo.bind("Type_L2D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2D", "ti.sysbios.family.c64p"));
        vo.bind("Type_L2", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2", "ti.sysbios.family.c64p"));
        vo.bind("Type_ALLP", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLP", "ti.sysbios.family.c64p"));
        vo.bind("Type_ALLD", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLD", "ti.sysbios.family.c64p"));
        vo.bind("Type_ALL", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALL", "ti.sysbios.family.c64p"));
        vo.bind("Mode_FREEZE", om.findStrict("ti.sysbios.family.c64p.Cache.Mode_FREEZE", "ti.sysbios.family.c64p"));
        vo.bind("Mode_BYPASS", om.findStrict("ti.sysbios.family.c64p.Cache.Mode_BYPASS", "ti.sysbios.family.c64p"));
        vo.bind("Mode_NORMAL", om.findStrict("ti.sysbios.family.c64p.Cache.Mode_NORMAL", "ti.sysbios.family.c64p"));
        vo.bind("L1Size_0K", om.findStrict("ti.sysbios.family.c64p.Cache.L1Size_0K", "ti.sysbios.family.c64p"));
        vo.bind("L1Size_4K", om.findStrict("ti.sysbios.family.c64p.Cache.L1Size_4K", "ti.sysbios.family.c64p"));
        vo.bind("L1Size_8K", om.findStrict("ti.sysbios.family.c64p.Cache.L1Size_8K", "ti.sysbios.family.c64p"));
        vo.bind("L1Size_16K", om.findStrict("ti.sysbios.family.c64p.Cache.L1Size_16K", "ti.sysbios.family.c64p"));
        vo.bind("L1Size_32K", om.findStrict("ti.sysbios.family.c64p.Cache.L1Size_32K", "ti.sysbios.family.c64p"));
        vo.bind("L2Size_0K", om.findStrict("ti.sysbios.family.c64p.Cache.L2Size_0K", "ti.sysbios.family.c64p"));
        vo.bind("L2Size_32K", om.findStrict("ti.sysbios.family.c64p.Cache.L2Size_32K", "ti.sysbios.family.c64p"));
        vo.bind("L2Size_64K", om.findStrict("ti.sysbios.family.c64p.Cache.L2Size_64K", "ti.sysbios.family.c64p"));
        vo.bind("L2Size_128K", om.findStrict("ti.sysbios.family.c64p.Cache.L2Size_128K", "ti.sysbios.family.c64p"));
        vo.bind("L2Size_256K", om.findStrict("ti.sysbios.family.c64p.Cache.L2Size_256K", "ti.sysbios.family.c64p"));
        vo.bind("L2Size_512K", om.findStrict("ti.sysbios.family.c64p.Cache.L2Size_512K", "ti.sysbios.family.c64p"));
        vo.bind("L2Size_1024K", om.findStrict("ti.sysbios.family.c64p.Cache.L2Size_1024K", "ti.sysbios.family.c64p"));
        vo.bind("Mar_DISABLE", om.findStrict("ti.sysbios.family.c64p.Cache.Mar_DISABLE", "ti.sysbios.family.c64p"));
        vo.bind("Mar_ENABLE", om.findStrict("ti.sysbios.family.c64p.Cache.Mar_ENABLE", "ti.sysbios.family.c64p"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c64p")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.c64p.Cache.enable", "ti.sysbios.family.c64p"));
        vo.bind("wait", om.findStrict("ti.sysbios.family.c64p.Cache.wait", "ti.sysbios.family.c64p"));
        vo.bind("disable", om.findStrict("ti.sysbios.family.c64p.Cache.disable", "ti.sysbios.family.c64p"));
        vo.bind("setMode", om.findStrict("ti.sysbios.family.c64p.Cache.setMode", "ti.sysbios.family.c64p"));
        vo.bind("getMode", om.findStrict("ti.sysbios.family.c64p.Cache.getMode", "ti.sysbios.family.c64p"));
        vo.bind("setSize", om.findStrict("ti.sysbios.family.c64p.Cache.setSize", "ti.sysbios.family.c64p"));
        vo.bind("getSize", om.findStrict("ti.sysbios.family.c64p.Cache.getSize", "ti.sysbios.family.c64p"));
        vo.bind("getMar", om.findStrict("ti.sysbios.family.c64p.Cache.getMar", "ti.sysbios.family.c64p"));
        vo.bind("setMar", om.findStrict("ti.sysbios.family.c64p.Cache.setMar", "ti.sysbios.family.c64p"));
        vo.bind("inv", om.findStrict("ti.sysbios.family.c64p.Cache.inv", "ti.sysbios.family.c64p"));
        vo.bind("wb", om.findStrict("ti.sysbios.family.c64p.Cache.wb", "ti.sysbios.family.c64p"));
        vo.bind("wbInv", om.findStrict("ti.sysbios.family.c64p.Cache.wbInv", "ti.sysbios.family.c64p"));
        vo.bind("invL1pAll", om.findStrict("ti.sysbios.family.c64p.Cache.invL1pAll", "ti.sysbios.family.c64p"));
        vo.bind("wbAll", om.findStrict("ti.sysbios.family.c64p.Cache.wbAll", "ti.sysbios.family.c64p"));
        vo.bind("wbL1dAll", om.findStrict("ti.sysbios.family.c64p.Cache.wbL1dAll", "ti.sysbios.family.c64p"));
        vo.bind("wbInvAll", om.findStrict("ti.sysbios.family.c64p.Cache.wbInvAll", "ti.sysbios.family.c64p"));
        vo.bind("wbInvL1dAll", om.findStrict("ti.sysbios.family.c64p.Cache.wbInvL1dAll", "ti.sysbios.family.c64p"));
        vo.bind("all", om.findStrict("ti.sysbios.family.c64p.Cache.all", "ti.sysbios.family.c64p"));
        vo.bind("block", om.findStrict("ti.sysbios.family.c64p.Cache.block", "ti.sysbios.family.c64p"));
        vo.bind("getL1DInitSize", om.findStrict("ti.sysbios.family.c64p.Cache.getL1DInitSize", "ti.sysbios.family.c64p"));
        vo.bind("getL1PInitSize", om.findStrict("ti.sysbios.family.c64p.Cache.getL1PInitSize", "ti.sysbios.family.c64p"));
        vo.bind("getL2InitSize", om.findStrict("ti.sysbios.family.c64p.Cache.getL2InitSize", "ti.sysbios.family.c64p"));
        vo.bind("marInit", om.findStrict("ti.sysbios.family.c64p.Cache.marInit", "ti.sysbios.family.c64p"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c64p_Cache_Module__startupDone__E", "ti_sysbios_family_c64p_Cache_enable__E", "ti_sysbios_family_c64p_Cache_wait__E", "ti_sysbios_family_c64p_Cache_disable__E", "ti_sysbios_family_c64p_Cache_setMode__E", "ti_sysbios_family_c64p_Cache_getMode__E", "ti_sysbios_family_c64p_Cache_setSize__E", "ti_sysbios_family_c64p_Cache_getSize__E", "ti_sysbios_family_c64p_Cache_getMar__E", "ti_sysbios_family_c64p_Cache_setMar__E", "ti_sysbios_family_c64p_Cache_inv__E", "ti_sysbios_family_c64p_Cache_wb__E", "ti_sysbios_family_c64p_Cache_wbInv__E", "ti_sysbios_family_c64p_Cache_invL1pAll__E", "ti_sysbios_family_c64p_Cache_wbAll__E", "ti_sysbios_family_c64p_Cache_wbL1dAll__E", "ti_sysbios_family_c64p_Cache_wbInvAll__E", "ti_sysbios_family_c64p_Cache_wbInvL1dAll__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_invalidL1CacheSize", "E_invalidL2CacheSize"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Cache", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Cache");
    }

    void Settings$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Settings", "ti.sysbios.family.c64p");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c64p.Settings.Module", "ti.sysbios.family.c64p");
        vo.init2(po, "ti.sysbios.family.c64p.Settings", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c64p.Settings$$capsule", "ti.sysbios.family.c64p"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c64p", "ti.sysbios.family.c64p"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c64p")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.sysbios.family.c64p.Settings$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Settings", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Settings");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.c64p")).findStrict("PARAMS", "ti.sysbios.family.c64p");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.c64p.Hwi", "ti.sysbios.family.c64p")).findStrict("PARAMS", "ti.sysbios.family.c64p");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c64p.EventCombiner", "ti.sysbios.family.c64p"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c64p.Exception", "ti.sysbios.family.c64p"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c64p.Hwi", "ti.sysbios.family.c64p"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c64p.TimestampProvider", "ti.sysbios.family.c64p"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c64p.MemoryProtect", "ti.sysbios.family.c64p"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c64p.Clobber", "ti.sysbios.family.c64p"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c64p.Cache", "ti.sysbios.family.c64p"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c64p.Settings", "ti.sysbios.family.c64p"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.EventCombiner", "ti.sysbios.family.c64p");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Events", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitEvents", "structName", "EventView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Exception", "ti.sysbios.family.c64p");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Exception", Global.newObject("type", om.find("xdc.rov.ViewInfo.TREE"), "viewInitFxn", "viewInitException", "structName", "Context")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Hwi", "ti.sysbios.family.c64p");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.c64p.Cache", "ti.sysbios.family.c64p");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")}), Global.newArray(new Object[]{"EnableMARs", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitMarRegisters", "structName", "MarRegisterView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.c64p.EventCombiner")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c64p.Exception")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c64p.Hwi")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c64p.TimestampProvider")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c64p.MemoryProtect")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c64p.Clobber")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c64p.Cache")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c64p.Settings")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.c64p")).add(pkgV);
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
        EventCombiner$$OBJECTS();
        Exception$$OBJECTS();
        Hwi$$OBJECTS();
        TimestampProvider$$OBJECTS();
        MemoryProtect$$OBJECTS();
        Clobber$$OBJECTS();
        Cache$$OBJECTS();
        Settings$$OBJECTS();
        EventCombiner$$CONSTS();
        Exception$$CONSTS();
        Hwi$$CONSTS();
        TimestampProvider$$CONSTS();
        MemoryProtect$$CONSTS();
        Clobber$$CONSTS();
        Cache$$CONSTS();
        Settings$$CONSTS();
        EventCombiner$$CREATES();
        Exception$$CREATES();
        Hwi$$CREATES();
        TimestampProvider$$CREATES();
        MemoryProtect$$CREATES();
        Clobber$$CREATES();
        Cache$$CREATES();
        Settings$$CREATES();
        EventCombiner$$FUNCTIONS();
        Exception$$FUNCTIONS();
        Hwi$$FUNCTIONS();
        TimestampProvider$$FUNCTIONS();
        MemoryProtect$$FUNCTIONS();
        Clobber$$FUNCTIONS();
        Cache$$FUNCTIONS();
        Settings$$FUNCTIONS();
        EventCombiner$$SIZES();
        Exception$$SIZES();
        Hwi$$SIZES();
        TimestampProvider$$SIZES();
        MemoryProtect$$SIZES();
        Clobber$$SIZES();
        Cache$$SIZES();
        Settings$$SIZES();
        EventCombiner$$TYPES();
        Exception$$TYPES();
        Hwi$$TYPES();
        TimestampProvider$$TYPES();
        MemoryProtect$$TYPES();
        Clobber$$TYPES();
        Cache$$TYPES();
        Settings$$TYPES();
        if (isROV) {
            EventCombiner$$ROV();
            Exception$$ROV();
            Hwi$$ROV();
            TimestampProvider$$ROV();
            MemoryProtect$$ROV();
            Clobber$$ROV();
            Cache$$ROV();
            Settings$$ROV();
        }//isROV
        $$SINGLETONS();
        EventCombiner$$SINGLETONS();
        Exception$$SINGLETONS();
        Hwi$$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        MemoryProtect$$SINGLETONS();
        Clobber$$SINGLETONS();
        Cache$$SINGLETONS();
        Settings$$SINGLETONS();
        $$INITIALIZATION();
    }
}
