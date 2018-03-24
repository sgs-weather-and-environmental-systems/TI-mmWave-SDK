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

public class ti_sysbios_family_arm_da830
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
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.da830", new Value.Obj("ti.sysbios.family.arm.da830", pkgP));
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.da830.TimestampProvider", new Value.Obj("ti.sysbios.family.arm.da830.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.CountType", new Proto.Enm("ti.sysbios.family.arm.da830.TimestampProvider.CountType"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.TimestampProvider$$IceCrusherRegs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.IceCrusherRegs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.TimestampProvider$$Module_View", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.Module_View", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.TimestampProvider$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.Module_State", new Proto.Str(spo, false));
    }

    void Hwi$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi", new Value.Obj("ti.sysbios.family.arm.da830.Hwi", po));
        pkgV.bind("Hwi", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.da830.Hwi.HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.da830"));
        om.bind("ti.sysbios.family.arm.da830.Hwi.MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.da830"));
        om.bind("ti.sysbios.family.arm.da830.Hwi.StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.da830"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi$$CPINTC", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.Hwi.CPINTC", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.Hwi.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.Hwi.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi$$NonDispatchedInterrupt", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.Hwi.NonDispatchedInterrupt", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi$$InterruptObj", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.Hwi.InterruptObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.Hwi.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.Hwi.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.da830.Hwi.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.Hwi.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Hwi$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.Hwi.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.da830.Hwi.Object", om.findStrict("ti.sysbios.family.arm.da830.Hwi.Instance_State", "ti.sysbios.family.arm.da830"));
        }//isROV
    }

    void TimerSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.TimerSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.da830.TimerSupport", new Value.Obj("ti.sysbios.family.arm.da830.TimerSupport", po));
        pkgV.bind("TimerSupport", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc", new Proto.Enm("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.TimerSupport$$Emulation", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.TimerSupport.Emulation", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.TimerSupport$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.TimerSupport.Module_State", new Proto.Str(spo, false));
    }

    void Clobber$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Clobber.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.da830.Clobber", new Value.Obj("ti.sysbios.family.arm.da830.Clobber", po));
        pkgV.bind("Clobber", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.da830.Clobber$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.da830.Clobber.Module_State", new Proto.Str(spo, false));
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.CountType_CYCLES", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.CountType", "ti.sysbios.family.arm.da830"), "ti.sysbios.family.arm.da830.TimestampProvider.CountType_CYCLES", 0));
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.CountType_INSTRUCTIONS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.CountType", "ti.sysbios.family.arm.da830"), "ti.sysbios.family.arm.da830.TimestampProvider.CountType_INSTRUCTIONS", 1));
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.iceRegs", new Extern("ti_sysbios_family_arm_da830_TimestampProvider_iceRegs", "ti_sysbios_family_arm_da830_TimestampProvider_IceCrusherRegs*", false, false));
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.get32", new Extern("ti_sysbios_family_arm_da830_TimestampProvider_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.get64", new Extern("ti_sysbios_family_arm_da830_TimestampProvider_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.getFreq", new Extern("ti_sysbios_family_arm_da830_TimestampProvider_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.overflowHandler", new Extern("ti_sysbios_family_arm_da830_TimestampProvider_overflowHandler__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider.releaseCounters", new Extern("ti_sysbios_family_arm_da830_TimestampProvider_releaseCounters__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void Hwi$$CONSTS()
    {
        // module Hwi
        om.bind("ti.sysbios.family.arm.da830.Hwi.NUM_INTERRUPTS", 101L);
        om.bind("ti.sysbios.family.arm.da830.Hwi.cpIntc", new Extern("ti_sysbios_family_arm_da830_Hwi_cpIntc", "ti_sysbios_family_arm_da830_Hwi_CPINTC*", false, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.getStackInfo", new Extern("ti_sysbios_family_arm_da830_Hwi_getStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.getCoreStackInfo", new Extern("ti_sysbios_family_arm_da830_Hwi_getCoreStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.startup", new Extern("ti_sysbios_family_arm_da830_Hwi_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.switchFromBootStack", new Extern("ti_sysbios_family_arm_da830_Hwi_switchFromBootStack__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.post", new Extern("ti_sysbios_family_arm_da830_Hwi_post__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.getTaskSP", new Extern("ti_sysbios_family_arm_da830_Hwi_getTaskSP__E", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.disableInterrupt", new Extern("ti_sysbios_family_arm_da830_Hwi_disableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.enableInterrupt", new Extern("ti_sysbios_family_arm_da830_Hwi_enableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.restoreInterrupt", new Extern("ti_sysbios_family_arm_da830_Hwi_restoreInterrupt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.clearInterrupt", new Extern("ti_sysbios_family_arm_da830_Hwi_clearInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.plug", new Extern("ti_sysbios_family_arm_da830_Hwi_plug__E", "xdc_Void(*)(xdc_UInt,xdc_Void(*)(xdc_Void))", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.getHandle", new Extern("ti_sysbios_family_arm_da830_Hwi_getHandle__E", "ti_sysbios_family_arm_da830_Hwi_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.enableFIQ", new Extern("ti_sysbios_family_arm_da830_Hwi_enableFIQ__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.disableFIQ", new Extern("ti_sysbios_family_arm_da830_Hwi_disableFIQ__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.restoreFIQ", new Extern("ti_sysbios_family_arm_da830_Hwi_restoreFIQ__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.enableIRQ", new Extern("ti_sysbios_family_arm_da830_Hwi_enableIRQ__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.disableIRQ", new Extern("ti_sysbios_family_arm_da830_Hwi_disableIRQ__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.restoreIRQ", new Extern("ti_sysbios_family_arm_da830_Hwi_restoreIRQ__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.beginIRQ", new Extern("ti_sysbios_family_arm_da830_Hwi_beginIRQ__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.endIRQ", new Extern("ti_sysbios_family_arm_da830_Hwi_endIRQ__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.beginFIQ", new Extern("ti_sysbios_family_arm_da830_Hwi_beginFIQ__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.endFIQ", new Extern("ti_sysbios_family_arm_da830_Hwi_endFIQ__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.setPriority", new Extern("ti_sysbios_family_arm_da830_Hwi_setPriority__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.postInit", new Extern("ti_sysbios_family_arm_da830_Hwi_postInit__I", "xdc_Int(*)(ti_sysbios_family_arm_da830_Hwi_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.initIntController", new Extern("ti_sysbios_family_arm_da830_Hwi_initIntController__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.init", new Extern("ti_sysbios_family_arm_da830_Hwi_init__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.dispatchIRQ", new Extern("ti_sysbios_family_arm_da830_Hwi_dispatchIRQ__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.dispatchIRQC", new Extern("ti_sysbios_family_arm_da830_Hwi_dispatchIRQC__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.dispatchFIQC", new Extern("ti_sysbios_family_arm_da830_Hwi_dispatchFIQC__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.spuriousInt", new Extern("ti_sysbios_family_arm_da830_Hwi_spuriousInt__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.handlerNONE", new Extern("ti_sysbios_family_arm_da830_Hwi_handlerNONE__I", "xdc_Void(*)(ti_sysbios_family_arm_da830_Hwi_Handle,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.handlerALL", new Extern("ti_sysbios_family_arm_da830_Hwi_handlerALL__I", "xdc_Void(*)(ti_sysbios_family_arm_da830_Hwi_Handle,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.handlerLOWER", new Extern("ti_sysbios_family_arm_da830_Hwi_handlerLOWER__I", "xdc_Void(*)(ti_sysbios_family_arm_da830_Hwi_Handle,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Hwi.handlerSELF", new Extern("ti_sysbios_family_arm_da830_Hwi_handlerSELF__I", "xdc_Void(*)(ti_sysbios_family_arm_da830_Hwi_Handle,xdc_UInt)", true, false));
    }

    void TimerSupport$$CONSTS()
    {
        // module TimerSupport
        om.bind("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc_ARM", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc", "ti.sysbios.family.arm.da830"), "ti.sysbios.family.arm.da830.TimerSupport.SuspSrc_ARM", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc_DSP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc", "ti.sysbios.family.arm.da830"), "ti.sysbios.family.arm.da830.TimerSupport.SuspSrc_DSP", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.arm.da830.TimerSupport.enable", new Extern("ti_sysbios_family_arm_da830_TimerSupport_enable__E", "xdc_Void(*)(xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void Clobber$$CONSTS()
    {
        // module Clobber
        om.bind("ti.sysbios.family.arm.da830.Clobber.trashRegs", new Extern("ti_sysbios_family_arm_da830_Clobber_trashRegs__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Clobber.postIntr", new Extern("ti_sysbios_family_arm_da830_Clobber_postIntr__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Clobber.checkRegs", new Extern("ti_sysbios_family_arm_da830_Clobber_checkRegs__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.da830.Clobber.timerFunc", new Extern("ti_sysbios_family_arm_da830_Clobber_timerFunc__E", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void TimestampProvider$$CREATES()
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
            sb.append("ti$sysbios$family$arm$da830$Hwi$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.da830.Hwi.create() called before xdc.useModule('ti.sysbios.family.arm.da830.Hwi')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.intNum, inst.$args.hwiFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.da830.Hwi$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.da830.Hwi.Module", "ti.sysbios.family.arm.da830"), om.findStrict("ti.sysbios.family.arm.da830.Hwi.Instance", "ti.sysbios.family.arm.da830"), 3, 2, false));
                        fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.da830.Hwi.Params", "ti.sysbios.family.arm.da830"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$da830$Hwi$$create = function( intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.da830.Hwi'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.da830.Hwi.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.da830']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.da830.Hwi'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [intNum, hwiFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.da830.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.da830.Hwi$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.da830.Hwi.Module", "ti.sysbios.family.arm.da830"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$Object", "ti.sysbios.family.arm.da830"), null);
                        fxn.addArg(1, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.da830.Hwi.Params", "ti.sysbios.family.arm.da830"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$da830$Hwi$$construct = function( __obj, intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.da830.Hwi'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.da830.Hwi'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.da830.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void TimerSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Clobber$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TimestampProvider$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Hwi$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Hwi.inUseMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.da830.Hwi$$inUseMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.da830.Hwi.Module", "ti.sysbios.family.arm.da830"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
        // fxn Hwi.plugMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.da830.Hwi$$plugMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.da830.Hwi.Module", "ti.sysbios.family.arm.da830"), null, 2, 2, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "fxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF);
    }

    void TimerSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Clobber$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TimestampProvider$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.IceCrusherRegs", "ti.sysbios.family.arm.da830");
        sizes.clear();
        sizes.add(Global.newArray("VER", "UInt32"));
        sizes.add(Global.newArray("DBGCFG", "UInt32"));
        sizes.add(Global.newArray("DBGCNTL", "UInt32"));
        sizes.add(Global.newArray("RES_0C", "UInt32"));
        sizes.add(Global.newArray("TRIGCNTL", "UInt32"));
        sizes.add(Global.newArray("RSTCNTL", "UInt32"));
        sizes.add(Global.newArray("THRDIDCLM", "UInt32"));
        sizes.add(Global.newArray("THRDID", "UInt32"));
        sizes.add(Global.newArray("INTCNTL", "UInt32"));
        sizes.add(Global.newArray("ETMCNTL", "UInt32"));
        sizes.add(Global.newArray("ETMPID", "UInt32"));
        sizes.add(Global.newArray("TEST", "UInt32"));
        sizes.add(Global.newArray("SWBRKCTL", "UInt32"));
        sizes.add(Global.newArray("SWBRKVAL", "UInt32"));
        sizes.add(Global.newArray("RES_38", "UInt32"));
        sizes.add(Global.newArray("RES_3C", "UInt32"));
        sizes.add(Global.newArray("BCNT0CTRL", "UInt32"));
        sizes.add(Global.newArray("BCNT0", "UInt32"));
        sizes.add(Global.newArray("RES_48", "UInt32"));
        sizes.add(Global.newArray("RES_4C", "UInt32"));
        sizes.add(Global.newArray("BCNT1CTRL", "UInt32"));
        sizes.add(Global.newArray("BCNT1", "UInt32"));
        sizes.add(Global.newArray("RES_58", "A10;UInt32"));
        sizes.add(Global.newArray("HWBRK0CTL", "UInt32"));
        sizes.add(Global.newArray("HWBRK0ADR", "UInt32"));
        sizes.add(Global.newArray("HWBRK0ADRMASK", "UInt32"));
        sizes.add(Global.newArray("RES_8C", "UInt32"));
        sizes.add(Global.newArray("HWBRK1CTL", "UInt32"));
        sizes.add(Global.newArray("HWBRK1ADR", "UInt32"));
        sizes.add(Global.newArray("HWBRK1ADRMASK", "UInt32"));
        sizes.add(Global.newArray("RES_9C", "UInt32"));
        sizes.add(Global.newArray("HWBRK2CTL", "UInt32"));
        sizes.add(Global.newArray("HWBRK2ADR", "UInt32"));
        sizes.add(Global.newArray("HWBRK2ADRMASK", "UInt32"));
        sizes.add(Global.newArray("RES_AC", "UInt32"));
        sizes.add(Global.newArray("HWBRK3CTL", "UInt32"));
        sizes.add(Global.newArray("HWBRK3ADR", "UInt32"));
        sizes.add(Global.newArray("HWBRK3ADRMASK", "UInt32"));
        sizes.add(Global.newArray("RES_BC", "A14;UInt32"));
        sizes.add(Global.newArray("OS_LOCKSTS", "UInt32"));
        sizes.add(Global.newArray("OS_LOCK", "UInt32"));
        sizes.add(Global.newArray("DCON", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.da830.TimestampProvider.IceCrusherRegs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.da830.TimestampProvider.IceCrusherRegs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.da830.TimestampProvider.IceCrusherRegs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.Module_State", "ti.sysbios.family.arm.da830");
        sizes.clear();
        sizes.add(Global.newArray("upper32Bits", "UInt32"));
        sizes.add(Global.newArray("hwi", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.da830.TimestampProvider.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.da830.TimestampProvider.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.da830.TimestampProvider.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Hwi$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.da830.Hwi.CPINTC", "ti.sysbios.family.arm.da830");
        sizes.clear();
        sizes.add(Global.newArray("REV", "UInt32"));
        sizes.add(Global.newArray("CR", "UInt32"));
        sizes.add(Global.newArray("RES_08", "UInt32"));
        sizes.add(Global.newArray("HCR", "UInt32"));
        sizes.add(Global.newArray("GER", "UInt32"));
        sizes.add(Global.newArray("RES_14", "UInt32"));
        sizes.add(Global.newArray("RES_18", "UInt32"));
        sizes.add(Global.newArray("GNLR", "UInt32"));
        sizes.add(Global.newArray("SISR", "UInt32"));
        sizes.add(Global.newArray("SICR", "UInt32"));
        sizes.add(Global.newArray("EISR", "UInt32"));
        sizes.add(Global.newArray("EICR", "UInt32"));
        sizes.add(Global.newArray("GWER", "UInt32"));
        sizes.add(Global.newArray("HIEISR", "UInt32"));
        sizes.add(Global.newArray("HIDISR", "UInt32"));
        sizes.add(Global.newArray("RES_3C", "UInt32"));
        sizes.add(Global.newArray("PPR", "UInt32"));
        sizes.add(Global.newArray("RES_44", "UInt32"));
        sizes.add(Global.newArray("RES_48", "UInt32"));
        sizes.add(Global.newArray("RES_4C", "UInt32"));
        sizes.add(Global.newArray("VBR", "UPtr"));
        sizes.add(Global.newArray("VSR", "UInt32"));
        sizes.add(Global.newArray("VNR", "UPtr"));
        sizes.add(Global.newArray("RES_5C", "A9;UInt32"));
        sizes.add(Global.newArray("GPIR", "TInt32"));
        sizes.add(Global.newArray("GPVR", "UPtr"));
        sizes.add(Global.newArray("RES_88", "UInt32"));
        sizes.add(Global.newArray("RES_8C", "UInt32"));
        sizes.add(Global.newArray("GSIER", "UInt32"));
        sizes.add(Global.newArray("SPIR", "UInt32"));
        sizes.add(Global.newArray("RES_98", "A26;UInt32"));
        sizes.add(Global.newArray("PPMR", "A64;UInt32"));
        sizes.add(Global.newArray("SRSR", "A32;UInt32"));
        sizes.add(Global.newArray("SECR", "A32;UInt32"));
        sizes.add(Global.newArray("ESR", "A32;UInt32"));
        sizes.add(Global.newArray("ECR", "A32;UInt32"));
        sizes.add(Global.newArray("CMR", "A1024;UInt8"));
        sizes.add(Global.newArray("HIMR", "A256;UInt8"));
        sizes.add(Global.newArray("HIPIR", "A256;UInt32"));
        sizes.add(Global.newArray("PR", "A32;UInt32"));
        sizes.add(Global.newArray("TR", "A32;UInt32"));
        sizes.add(Global.newArray("WER", "A64;UInt32"));
        sizes.add(Global.newArray("DSR", "A64;UInt32"));
        sizes.add(Global.newArray("SER", "A32;UInt32"));
        sizes.add(Global.newArray("SDR", "A32;UInt32"));
        sizes.add(Global.newArray("HINLR", "A256;UInt32"));
        sizes.add(Global.newArray("HIER", "A8;UInt32"));
        sizes.add(Global.newArray("RES_1520", "A56;UInt32"));
        sizes.add(Global.newArray("HIPVR", "A256;UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.da830.Hwi.CPINTC']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.da830.Hwi.CPINTC']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.da830.Hwi.CPINTC'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.da830.Hwi.Instance_State", "ti.sysbios.family.arm.da830");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("intNum", "TInt"));
        sizes.add(Global.newArray("handler", "UFxn"));
        sizes.add(Global.newArray("irp", "UIArg"));
        sizes.add(Global.newArray("hookEnv", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.da830.Hwi.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.da830.Hwi.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.da830.Hwi.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.da830.Hwi.Module_State", "ti.sysbios.family.arm.da830");
        sizes.clear();
        sizes.add(Global.newArray("er", "A4;UInt32"));
        sizes.add(Global.newArray("irp", "UInt"));
        sizes.add(Global.newArray("priorities", "A101;UInt8"));
        sizes.add(Global.newArray("taskSP", "UPtr"));
        sizes.add(Global.newArray("vectorTableBase", "UPtr"));
        sizes.add(Global.newArray("isrStack", "UPtr"));
        sizes.add(Global.newArray("isrStackBase", "UPtr"));
        sizes.add(Global.newArray("isrStackSize", "UPtr"));
        sizes.add(Global.newArray("fiqStack", "UPtr"));
        sizes.add(Global.newArray("fiqStackSize", "USize"));
        sizes.add(Global.newArray("dispatchTable", "A101;UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.da830.Hwi.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.da830.Hwi.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.da830.Hwi.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimerSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.Emulation", "ti.sysbios.family.arm.da830");
        sizes.clear();
        sizes.add(Global.newArray("suspSrc", "Nti.sysbios.family.arm.da830.TimerSupport.SuspSrc;;0;1"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.da830.TimerSupport.Emulation']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.da830.TimerSupport.Emulation']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.da830.TimerSupport.Emulation'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.Module_State", "ti.sysbios.family.arm.da830");
        sizes.clear();
        sizes.add(Global.newArray("suspSrc", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.da830.TimerSupport.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.da830.TimerSupport.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.da830.TimerSupport.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Clobber$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.da830.Clobber.Module_State", "ti.sysbios.family.arm.da830");
        sizes.clear();
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("intComplete", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.da830.Clobber.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.da830.Clobber.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.da830.Clobber.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/da830/TimestampProvider.xs");
        om.bind("ti.sysbios.family.arm.da830.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.Module", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.TimestampProvider.Module", om.findStrict("ti.sysbios.interfaces.ITimestamp.Module", "ti.sysbios.family.arm.da830"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("A_counterInUse", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.da830"), Global.newObject("msg", "A_counterInUse: Benchmark counter already claimed."), "w");
            po.addFld("A_intControlInUse", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.da830"), Global.newObject("msg", "A_intCOntrolInUse: iceCrusher Int Control Register already claimed."), "w");
            po.addFld("benchmarkCounterId", Proto.Elm.newCNum("(xdc_UInt)"), 1L, "w");
            po.addFld("countType", (Proto)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.CountType", "ti.sysbios.family.arm.da830"), om.find("ti.sysbios.family.arm.da830.TimestampProvider.CountType_CYCLES"), "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.TimestampProvider$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimestamp$$getFreqMeta", "ti.sysbios.family.arm.da830"), fxn);
        // struct TimestampProvider.IceCrusherRegs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider$$IceCrusherRegs", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.TimestampProvider.IceCrusherRegs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("VER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("DBGCFG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("DBGCNTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_0C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TRIGCNTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RSTCNTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("THRDIDCLM", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("THRDID", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTCNTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ETMCNTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ETMPID", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TEST", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SWBRKCTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SWBRKVAL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_38", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_3C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BCNT0CTRL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BCNT0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_48", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_4C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BCNT1CTRL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BCNT1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_58", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(10L)), $$DEFAULT, "w");
                po.addFld("HWBRK0CTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK0ADR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK0ADRMASK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_8C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK1CTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK1ADR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK1ADRMASK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_9C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK2CTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK2ADR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK2ADRMASK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_AC", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK3CTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK3ADR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HWBRK3ADRMASK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_BC", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(14L)), $$DEFAULT, "w");
                po.addFld("OS_LOCKSTS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("OS_LOCK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("DCON", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct TimestampProvider.Module_View
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider$$Module_View", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.TimestampProvider.Module_View", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("upper32Bits", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct TimestampProvider.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider$$Module_State", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.TimestampProvider.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("upper32Bits", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.family.arm.da830.Hwi.Handle", "ti.sysbios.family.arm.da830"), $$UNDEF, "w");
    }

    void Hwi$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/da830/Hwi.xs");
        om.bind("ti.sysbios.family.arm.da830.Hwi$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi.Module", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.Module", om.findStrict("ti.sysbios.interfaces.IHwi.Module", "ti.sysbios.family.arm.da830"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 101L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.da830"), $$UNDEF, "wh");
            po.addFld("A_unsupportedMaskingOption", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.da830"), Global.newObject("msg", "A_unsupportedMaskingOption: unsupported maskSetting."), "w");
            po.addFld("resetFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("undefinedInstFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("swiFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("prefetchAbortFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("dataAbortFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("reservedFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("irqFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("fiqFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("nonDispatchedInterrupts", new Proto.Map((Proto)om.findStrict("ti.sysbios.family.arm.da830.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.arm.da830")), $$DEFAULT, "wh");
            po.addFld("fiqStack", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
            po.addFld("fiqStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 1024L, "wh");
            po.addFld("fiqStackSection", $$T_Str, null, "wh");
            po.addFld("irqStack", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
            po.addFld("irqStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 256L, "wh");
            po.addFld("irqStackSection", $$T_Str, null, "wh");
            po.addFld("vectorTableAddress", new Proto.Adr("xdc_Ptr", "Pv"), 0xffff0040L, "wh");
            po.addFld("E_alreadyDefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.da830"), Global.newObject("msg", "E_alreadyDefined: Hwi already defined: intr# %d"), "w");
            po.addFld("LM_begin", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arm.da830"), Global.newObject("mask", Global.eval("0x0100 | 0x0200"), "msg", "LM_begin: hwi: 0x%x, func: 0x%x, preThread: %d, intNum: %d, irp: 0x%x"), "w");
            po.addFld("LD_end", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arm.da830"), Global.newObject("mask", 0x0200L, "msg", "LD_end: hwi: 0x%x"), "w");
            po.addFld("swiDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("swiRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("taskDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("taskRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("hooks", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.da830.Hwi.HookSet", "ti.sysbios.family.arm.da830"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("interrupt", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.da830.Hwi.InterruptObj", "ti.sysbios.family.arm.da830"), false, xdc.services.intern.xsr.Enum.intValue(101L)), $$DEFAULT, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$create", "ti.sysbios.family.arm.da830"), Global.get("ti$sysbios$family$arm$da830$Hwi$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$construct", "ti.sysbios.family.arm.da830"), Global.get("ti$sysbios$family$arm$da830$Hwi$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.Hwi$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.Hwi$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.Hwi$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.Hwi$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.Hwi$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.Hwi$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "addHookSet");
                if (fxn != null) po.addFxn("addHookSet", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$addHookSet", "ti.sysbios.family.arm.da830"), fxn);
                fxn = Global.get(cap, "viewGetStackInfo");
                if (fxn != null) po.addFxn("viewGetStackInfo", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$viewGetStackInfo", "ti.sysbios.family.arm.da830"), fxn);
                po.addFxn("inUseMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$inUseMeta", "ti.sysbios.family.arm.da830"), Global.get(cap, "inUseMeta"));
                po.addFxn("plugMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$plugMeta", "ti.sysbios.family.arm.da830"), Global.get(cap, "plugMeta"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi.Instance", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.Instance", om.findStrict("ti.sysbios.interfaces.IHwi.Instance", "ti.sysbios.family.arm.da830"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 101L, "rh");
        if (isCFG) {
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), 31L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.da830"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$Params", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.Params", om.findStrict("ti.sysbios.interfaces.IHwi$$Params", "ti.sysbios.family.arm.da830"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 101L, "rh");
        if (isCFG) {
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), 31L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.da830"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$Object", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.Object", om.findStrict("ti.sysbios.family.arm.da830.Hwi.Instance", "ti.sysbios.family.arm.da830"));
        // typedef Hwi.VectorFuncPtr
        om.bind("ti.sysbios.family.arm.da830.Hwi.VectorFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // typedef Hwi.PlugFuncPtr
        om.bind("ti.sysbios.family.arm.da830.Hwi.PlugFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Hwi.CPINTC
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$CPINTC", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.CPINTC", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("REV", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_08", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HCR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_14", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_18", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GNLR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SISR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SICR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EISR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EICR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GWER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HIEISR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HIDISR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_3C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PPR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_44", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_48", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_4C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("VBR", new Proto.Adr("xdc_Ptr*", "PPv"), $$UNDEF, "w");
                po.addFld("VSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("VNR", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("RES_5C", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(9L)), $$DEFAULT, "w");
                po.addFld("GPIR", Proto.Elm.newCNum("(xdc_Int32)"), $$UNDEF, "w");
                po.addFld("GPVR", new Proto.Adr("xdc_Ptr*", "PPv"), $$UNDEF, "w");
                po.addFld("RES_88", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_8C", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GSIER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SPIR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_98", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(26L)), $$DEFAULT, "w");
                po.addFld("PPMR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("SRSR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("SECR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ESR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ECR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("CMR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false, xdc.services.intern.xsr.Enum.intValue(1024L)), $$DEFAULT, "w");
                po.addFld("HIMR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
                po.addFld("HIPIR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
                po.addFld("PR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("TR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("WER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("DSR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("SER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("SDR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("HINLR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
                po.addFld("HIER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("RES_1520", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(56L)), $$DEFAULT, "w");
                po.addFld("HIPVR", new Proto.Arr(new Proto.Adr("xdc_Ptr*", "PPv"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
        // struct Hwi.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$BasicView", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halHwiHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("status", $$T_Str, $$UNDEF, "w");
        // struct Hwi.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$ModuleView", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("options", new Proto.Arr($$T_Str, false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("hwiStackPeak", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("hwiStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("priorities", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt)"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
        // struct Hwi.NonDispatchedInterrupt
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$NonDispatchedInterrupt", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.NonDispatchedInterrupt", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("enableInt", $$T_Bool, $$UNDEF, "w");
        // typedef Hwi.HandlerFuncPtr
        om.bind("ti.sysbios.family.arm.da830.Hwi.HandlerFuncPtr", new Proto.Adr("xdc_Void(*)(ti_sysbios_family_arm_da830_Hwi_Handle,xdc_UInt)", "PFv"));
        // struct Hwi.InterruptObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$InterruptObj", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.InterruptObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("used", $$T_Bool, $$UNDEF, "w");
                po.addFld("useDispatcher", $$T_Bool, $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("pfxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
        // struct Hwi.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$Instance_State", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("handler", new Proto.Adr("xdc_Void(*)(ti_sysbios_family_arm_da830_Hwi_Handle,xdc_UInt)", "PFv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("hookEnv", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "w");
        // struct Hwi.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$Module_State", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Hwi.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("er", new Proto.Arr(Proto.Elm.newCNum("(xdc_Bits32)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("irp", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("priorities", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false, xdc.services.intern.xsr.Enum.intValue(101L)), $$DEFAULT, "w");
                po.addFld("taskSP", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("vectorTableBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("isrStack", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("isrStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("isrStackSize", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("fiqStack", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), $$DEFAULT, "w");
                po.addFld("fiqStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("dispatchTable", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.da830.Hwi.Handle", "ti.sysbios.family.arm.da830"), false, xdc.services.intern.xsr.Enum.intValue(101L)), $$DEFAULT, "w");
    }

    void TimerSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/da830/TimerSupport.xs");
        om.bind("ti.sysbios.family.arm.da830.TimerSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.Module", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.TimerSupport.Module", om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.family.arm.da830"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("timer", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.Emulation", "ti.sysbios.family.arm.da830"), false), Global.newArray(new Object[]{}), "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.TimerSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.TimerSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.TimerSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.TimerSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct TimerSupport.Emulation
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport$$Emulation", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.TimerSupport.Emulation", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("suspSrc", (Proto)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc", "ti.sysbios.family.arm.da830"), $$UNDEF, "w");
        // struct TimerSupport.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport$$Module_State", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.TimerSupport.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("suspSrc", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc", "ti.sysbios.family.arm.da830"), false), $$DEFAULT, "w");
    }

    void Clobber$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/da830/Clobber.xs");
        om.bind("ti.sysbios.family.arm.da830.Clobber$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Clobber.Module", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Clobber.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.da830"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("postIntrCheck", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.Clobber$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.Clobber$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.Clobber$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.da830.Clobber$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Clobber.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Clobber$$Module_State", "ti.sysbios.family.arm.da830");
        po.init("ti.sysbios.family.arm.da830.Clobber.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("intComplete", $$T_Bool, $$UNDEF, "w");
    }

    void TimestampProvider$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider", "ti.sysbios.family.arm.da830");
        vo.bind("IceCrusherRegs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.da830.TimestampProvider.IceCrusherRegs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider$$IceCrusherRegs", "ti.sysbios.family.arm.da830");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.da830.TimestampProvider.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider$$Module_State", "ti.sysbios.family.arm.da830");
    }

    void Hwi$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi", "ti.sysbios.family.arm.da830");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$Instance_State", "ti.sysbios.family.arm.da830");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("CPINTC$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.da830.Hwi.CPINTC", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$CPINTC", "ti.sysbios.family.arm.da830");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.da830.Hwi.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$Instance_State", "ti.sysbios.family.arm.da830");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.da830.Hwi.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi$$Module_State", "ti.sysbios.family.arm.da830");
        po.bind("fiqStack$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Char", "isScalar", true));
    }

    void TimerSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport", "ti.sysbios.family.arm.da830");
        vo.bind("Emulation$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.da830.TimerSupport.Emulation", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport$$Emulation", "ti.sysbios.family.arm.da830");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.da830.TimerSupport.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport$$Module_State", "ti.sysbios.family.arm.da830");
        po.bind("suspSrc$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_SuspSrc", "isScalar", true));
    }

    void Clobber$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.da830.Clobber", "ti.sysbios.family.arm.da830");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.da830.Clobber.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Clobber$$Module_State", "ti.sysbios.family.arm.da830");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.da830.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.da830"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/da830/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.da830"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.da830"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.da830"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.da830"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.da830"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.da830"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.da830", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.da830");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.da830.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.da830'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.da830$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.da830$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.da830$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.da830.ae9',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.da830.ae9', {target: 'ti.targets.arm.elf.Arm9', suffix: 'e9'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void TimestampProvider$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider", "ti.sysbios.family.arm.da830");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.Module", "ti.sysbios.family.arm.da830");
        vo.init2(po, "ti.sysbios.family.arm.da830.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider$$capsule", "ti.sysbios.family.arm.da830"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.da830", "ti.sysbios.family.arm.da830"));
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
        vo.bind("CountType", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.CountType", "ti.sysbios.family.arm.da830"));
        vo.bind("IceCrusherRegs", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.IceCrusherRegs", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.IceCrusherRegs", "ti.sysbios.family.arm.da830"));
        vo.bind("iceRegs", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.iceRegs", "ti.sysbios.family.arm.da830"));
        vo.bind("Module_View", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.Module_View", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.Module_View", "ti.sysbios.family.arm.da830"));
        mcfgs.add("A_counterInUse");
        mcfgs.add("A_intControlInUse");
        mcfgs.add("benchmarkCounterId");
        mcfgs.add("countType");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.Module_State", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.Module_State", "ti.sysbios.family.arm.da830"));
        vo.bind("CountType_CYCLES", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.CountType_CYCLES", "ti.sysbios.family.arm.da830"));
        vo.bind("CountType_INSTRUCTIONS", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.CountType_INSTRUCTIONS", "ti.sysbios.family.arm.da830"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.da830")).add(vo);
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
        vo.bind("get32", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.get32", "ti.sysbios.family.arm.da830"));
        vo.bind("get64", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.get64", "ti.sysbios.family.arm.da830"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.getFreq", "ti.sysbios.family.arm.da830"));
        vo.bind("overflowHandler", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.overflowHandler", "ti.sysbios.family.arm.da830"));
        vo.bind("releaseCounters", om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider.releaseCounters", "ti.sysbios.family.arm.da830"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_da830_TimestampProvider_Module__startupDone__E", "ti_sysbios_family_arm_da830_TimestampProvider_get32__E", "ti_sysbios_family_arm_da830_TimestampProvider_get64__E", "ti_sysbios_family_arm_da830_TimestampProvider_getFreq__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_counterInUse", "A_intControlInUse"));
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

    void Hwi$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi", "ti.sysbios.family.arm.da830");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi.Module", "ti.sysbios.family.arm.da830");
        vo.init2(po, "ti.sysbios.family.arm.da830.Hwi", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.da830.Hwi$$capsule", "ti.sysbios.family.arm.da830"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.da830.Hwi.Instance", "ti.sysbios.family.arm.da830"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.da830.Hwi.Params", "ti.sysbios.family.arm.da830"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.da830.Hwi.Params", "ti.sysbios.family.arm.da830")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.da830.Hwi.Handle", "ti.sysbios.family.arm.da830"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.da830", "ti.sysbios.family.arm.da830"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.IHwi.FuncPtr", "ti.sysbios.family.arm.da830"));
        vo.bind("Irp", om.findStrict("ti.sysbios.interfaces.IHwi.Irp", "ti.sysbios.family.arm.da830"));
        vo.bind("HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.da830"));
        vo.bind("MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.da830"));
        vo.bind("StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.da830"));
        mcfgs.add("dispatcherAutoNestingSupport");
        mcfgs.add("dispatcherSwiSupport");
        mcfgs.add("dispatcherTaskSupport");
        mcfgs.add("dispatcherIrpTrackingSupport");
        vo.bind("VectorFuncPtr", om.findStrict("ti.sysbios.family.arm.da830.Hwi.VectorFuncPtr", "ti.sysbios.family.arm.da830"));
        vo.bind("PlugFuncPtr", om.findStrict("ti.sysbios.family.arm.da830.Hwi.PlugFuncPtr", "ti.sysbios.family.arm.da830"));
        vo.bind("CPINTC", om.findStrict("ti.sysbios.family.arm.da830.Hwi.CPINTC", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.Hwi.CPINTC", "ti.sysbios.family.arm.da830"));
        vo.bind("cpIntc", om.findStrict("ti.sysbios.family.arm.da830.Hwi.cpIntc", "ti.sysbios.family.arm.da830"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.da830.Hwi.BasicView", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.Hwi.BasicView", "ti.sysbios.family.arm.da830"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.da830.Hwi.ModuleView", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.Hwi.ModuleView", "ti.sysbios.family.arm.da830"));
        mcfgs.add("A_unsupportedMaskingOption");
        vo.bind("NonDispatchedInterrupt", om.findStrict("ti.sysbios.family.arm.da830.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.arm.da830"));
        mcfgs.add("fiqStack");
        mcfgs.add("irqStack");
        mcfgs.add("E_alreadyDefined");
        mcfgs.add("LM_begin");
        mcfgs.add("LD_end");
        vo.bind("HandlerFuncPtr", om.findStrict("ti.sysbios.family.arm.da830.Hwi.HandlerFuncPtr", "ti.sysbios.family.arm.da830"));
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
        vo.bind("InterruptObj", om.findStrict("ti.sysbios.family.arm.da830.Hwi.InterruptObj", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.Hwi.InterruptObj", "ti.sysbios.family.arm.da830"));
        icfgs.add("interrupt");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.da830.Hwi.Instance_State", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.Hwi.Instance_State", "ti.sysbios.family.arm.da830"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.da830.Hwi.Module_State", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.Hwi.Module_State", "ti.sysbios.family.arm.da830"));
        vo.bind("MaskingOption_NONE", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_NONE", "ti.sysbios.family.arm.da830"));
        vo.bind("MaskingOption_ALL", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_ALL", "ti.sysbios.family.arm.da830"));
        vo.bind("MaskingOption_SELF", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_SELF", "ti.sysbios.family.arm.da830"));
        vo.bind("MaskingOption_BITMASK", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_BITMASK", "ti.sysbios.family.arm.da830"));
        vo.bind("MaskingOption_LOWER", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER", "ti.sysbios.family.arm.da830"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.da830")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.da830.Hwi$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$da830$Hwi$$__initObject"));
        }//isCFG
        vo.bind("getStackInfo", om.findStrict("ti.sysbios.family.arm.da830.Hwi.getStackInfo", "ti.sysbios.family.arm.da830"));
        vo.bind("getCoreStackInfo", om.findStrict("ti.sysbios.family.arm.da830.Hwi.getCoreStackInfo", "ti.sysbios.family.arm.da830"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.da830.Hwi.startup", "ti.sysbios.family.arm.da830"));
        vo.bind("switchFromBootStack", om.findStrict("ti.sysbios.family.arm.da830.Hwi.switchFromBootStack", "ti.sysbios.family.arm.da830"));
        vo.bind("post", om.findStrict("ti.sysbios.family.arm.da830.Hwi.post", "ti.sysbios.family.arm.da830"));
        vo.bind("getTaskSP", om.findStrict("ti.sysbios.family.arm.da830.Hwi.getTaskSP", "ti.sysbios.family.arm.da830"));
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.arm.da830.Hwi.disableInterrupt", "ti.sysbios.family.arm.da830"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.arm.da830.Hwi.enableInterrupt", "ti.sysbios.family.arm.da830"));
        vo.bind("restoreInterrupt", om.findStrict("ti.sysbios.family.arm.da830.Hwi.restoreInterrupt", "ti.sysbios.family.arm.da830"));
        vo.bind("clearInterrupt", om.findStrict("ti.sysbios.family.arm.da830.Hwi.clearInterrupt", "ti.sysbios.family.arm.da830"));
        vo.bind("plug", om.findStrict("ti.sysbios.family.arm.da830.Hwi.plug", "ti.sysbios.family.arm.da830"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arm.da830.Hwi.getHandle", "ti.sysbios.family.arm.da830"));
        vo.bind("enableFIQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.enableFIQ", "ti.sysbios.family.arm.da830"));
        vo.bind("disableFIQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.disableFIQ", "ti.sysbios.family.arm.da830"));
        vo.bind("restoreFIQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.restoreFIQ", "ti.sysbios.family.arm.da830"));
        vo.bind("enableIRQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.enableIRQ", "ti.sysbios.family.arm.da830"));
        vo.bind("disableIRQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.disableIRQ", "ti.sysbios.family.arm.da830"));
        vo.bind("restoreIRQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.restoreIRQ", "ti.sysbios.family.arm.da830"));
        vo.bind("beginIRQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.beginIRQ", "ti.sysbios.family.arm.da830"));
        vo.bind("endIRQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.endIRQ", "ti.sysbios.family.arm.da830"));
        vo.bind("beginFIQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.beginFIQ", "ti.sysbios.family.arm.da830"));
        vo.bind("endFIQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.endFIQ", "ti.sysbios.family.arm.da830"));
        vo.bind("setPriority", om.findStrict("ti.sysbios.family.arm.da830.Hwi.setPriority", "ti.sysbios.family.arm.da830"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.da830.Hwi.postInit", "ti.sysbios.family.arm.da830"));
        vo.bind("initIntController", om.findStrict("ti.sysbios.family.arm.da830.Hwi.initIntController", "ti.sysbios.family.arm.da830"));
        vo.bind("init", om.findStrict("ti.sysbios.family.arm.da830.Hwi.init", "ti.sysbios.family.arm.da830"));
        vo.bind("dispatchIRQ", om.findStrict("ti.sysbios.family.arm.da830.Hwi.dispatchIRQ", "ti.sysbios.family.arm.da830"));
        vo.bind("dispatchIRQC", om.findStrict("ti.sysbios.family.arm.da830.Hwi.dispatchIRQC", "ti.sysbios.family.arm.da830"));
        vo.bind("dispatchFIQC", om.findStrict("ti.sysbios.family.arm.da830.Hwi.dispatchFIQC", "ti.sysbios.family.arm.da830"));
        vo.bind("spuriousInt", om.findStrict("ti.sysbios.family.arm.da830.Hwi.spuriousInt", "ti.sysbios.family.arm.da830"));
        vo.bind("handlerNONE", om.findStrict("ti.sysbios.family.arm.da830.Hwi.handlerNONE", "ti.sysbios.family.arm.da830"));
        vo.bind("handlerALL", om.findStrict("ti.sysbios.family.arm.da830.Hwi.handlerALL", "ti.sysbios.family.arm.da830"));
        vo.bind("handlerLOWER", om.findStrict("ti.sysbios.family.arm.da830.Hwi.handlerLOWER", "ti.sysbios.family.arm.da830"));
        vo.bind("handlerSELF", om.findStrict("ti.sysbios.family.arm.da830.Hwi.handlerSELF", "ti.sysbios.family.arm.da830"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_da830_Hwi_Handle__label__E", "ti_sysbios_family_arm_da830_Hwi_Module__startupDone__E", "ti_sysbios_family_arm_da830_Hwi_Object__create__E", "ti_sysbios_family_arm_da830_Hwi_Object__delete__E", "ti_sysbios_family_arm_da830_Hwi_Object__get__E", "ti_sysbios_family_arm_da830_Hwi_Object__first__E", "ti_sysbios_family_arm_da830_Hwi_Object__next__E", "ti_sysbios_family_arm_da830_Hwi_Params__init__E", "ti_sysbios_family_arm_da830_Hwi_getStackInfo__E", "ti_sysbios_family_arm_da830_Hwi_getCoreStackInfo__E", "ti_sysbios_family_arm_da830_Hwi_startup__E", "ti_sysbios_family_arm_da830_Hwi_switchFromBootStack__E", "ti_sysbios_family_arm_da830_Hwi_post__E", "ti_sysbios_family_arm_da830_Hwi_getTaskSP__E", "ti_sysbios_family_arm_da830_Hwi_disableInterrupt__E", "ti_sysbios_family_arm_da830_Hwi_enableInterrupt__E", "ti_sysbios_family_arm_da830_Hwi_restoreInterrupt__E", "ti_sysbios_family_arm_da830_Hwi_clearInterrupt__E", "ti_sysbios_family_arm_da830_Hwi_getFunc__E", "ti_sysbios_family_arm_da830_Hwi_setFunc__E", "ti_sysbios_family_arm_da830_Hwi_getHookContext__E", "ti_sysbios_family_arm_da830_Hwi_setHookContext__E", "ti_sysbios_family_arm_da830_Hwi_getIrp__E", "ti_sysbios_family_arm_da830_Hwi_disable__E", "ti_sysbios_family_arm_da830_Hwi_enable__E", "ti_sysbios_family_arm_da830_Hwi_restore__E", "ti_sysbios_family_arm_da830_Hwi_plug__E", "ti_sysbios_family_arm_da830_Hwi_getHandle__E", "ti_sysbios_family_arm_da830_Hwi_enableFIQ__E", "ti_sysbios_family_arm_da830_Hwi_disableFIQ__E", "ti_sysbios_family_arm_da830_Hwi_restoreFIQ__E", "ti_sysbios_family_arm_da830_Hwi_enableIRQ__E", "ti_sysbios_family_arm_da830_Hwi_disableIRQ__E", "ti_sysbios_family_arm_da830_Hwi_restoreIRQ__E", "ti_sysbios_family_arm_da830_Hwi_beginIRQ__E", "ti_sysbios_family_arm_da830_Hwi_endIRQ__E", "ti_sysbios_family_arm_da830_Hwi_beginFIQ__E", "ti_sysbios_family_arm_da830_Hwi_endFIQ__E", "ti_sysbios_family_arm_da830_Hwi_setPriority__E", "ti_sysbios_family_arm_da830_Hwi_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray("LM_begin", "LD_end"));
        vo.bind("$$errorDescCfgs", Global.newArray("E_alreadyDefined"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_unsupportedMaskingOption"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Hwi.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.da830.Hwi.Object", "ti.sysbios.family.arm.da830"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Hwi.xdt");
        pkgV.bind("Hwi", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Hwi");
    }

    void TimerSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport", "ti.sysbios.family.arm.da830");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.Module", "ti.sysbios.family.arm.da830");
        vo.init2(po, "ti.sysbios.family.arm.da830.TimerSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.da830.TimerSupport$$capsule", "ti.sysbios.family.arm.da830"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.da830", "ti.sysbios.family.arm.da830"));
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
        vo.bind("SuspSrc", om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc", "ti.sysbios.family.arm.da830"));
        vo.bind("Emulation", om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.Emulation", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.Emulation", "ti.sysbios.family.arm.da830"));
        mcfgs.add("timer");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.Module_State", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.Module_State", "ti.sysbios.family.arm.da830"));
        vo.bind("SuspSrc_ARM", om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc_ARM", "ti.sysbios.family.arm.da830"));
        vo.bind("SuspSrc_DSP", om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.SuspSrc_DSP", "ti.sysbios.family.arm.da830"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.da830")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.da830.TimerSupport.enable", "ti.sysbios.family.arm.da830"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_da830_TimerSupport_Module__startupDone__E", "ti_sysbios_family_arm_da830_TimerSupport_enable__E"));
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
        pkgV.bind("TimerSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TimerSupport");
    }

    void Clobber$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.da830.Clobber", "ti.sysbios.family.arm.da830");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.da830.Clobber.Module", "ti.sysbios.family.arm.da830");
        vo.init2(po, "ti.sysbios.family.arm.da830.Clobber", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.da830.Clobber$$capsule", "ti.sysbios.family.arm.da830"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.da830", "ti.sysbios.family.arm.da830"));
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
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.da830.Clobber.Module_State", "ti.sysbios.family.arm.da830"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.da830.Clobber.Module_State", "ti.sysbios.family.arm.da830"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.da830")).add(vo);
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
        vo.bind("trashRegs", om.findStrict("ti.sysbios.family.arm.da830.Clobber.trashRegs", "ti.sysbios.family.arm.da830"));
        vo.bind("postIntr", om.findStrict("ti.sysbios.family.arm.da830.Clobber.postIntr", "ti.sysbios.family.arm.da830"));
        vo.bind("checkRegs", om.findStrict("ti.sysbios.family.arm.da830.Clobber.checkRegs", "ti.sysbios.family.arm.da830"));
        vo.bind("timerFunc", om.findStrict("ti.sysbios.family.arm.da830.Clobber.timerFunc", "ti.sysbios.family.arm.da830"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_da830_Clobber_Module__startupDone__E", "ti_sysbios_family_arm_da830_Clobber_trashRegs__E", "ti_sysbios_family_arm_da830_Clobber_postIntr__E", "ti_sysbios_family_arm_da830_Clobber_checkRegs__E", "ti_sysbios_family_arm_da830_Clobber_timerFunc__E"));
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
        loggables.add(Global.newObject("name", "timerFunc", "entry", "%p", "exit", ""));
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Clobber", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Clobber");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.da830")).findStrict("PARAMS", "ti.sysbios.family.arm.da830");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.da830.Hwi", "ti.sysbios.family.arm.da830")).findStrict("PARAMS", "ti.sysbios.family.arm.da830");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.da830.TimestampProvider", "ti.sysbios.family.arm.da830"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.da830.Hwi", "ti.sysbios.family.arm.da830"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.da830.TimerSupport", "ti.sysbios.family.arm.da830"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.da830.Clobber", "ti.sysbios.family.arm.da830"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.da830.Hwi", "ti.sysbios.family.arm.da830");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.da830.TimestampProvider")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.da830.Hwi")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.da830.TimerSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.da830.Clobber")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.da830")).add(pkgV);
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
        TimestampProvider$$OBJECTS();
        Hwi$$OBJECTS();
        TimerSupport$$OBJECTS();
        Clobber$$OBJECTS();
        TimestampProvider$$CONSTS();
        Hwi$$CONSTS();
        TimerSupport$$CONSTS();
        Clobber$$CONSTS();
        TimestampProvider$$CREATES();
        Hwi$$CREATES();
        TimerSupport$$CREATES();
        Clobber$$CREATES();
        TimestampProvider$$FUNCTIONS();
        Hwi$$FUNCTIONS();
        TimerSupport$$FUNCTIONS();
        Clobber$$FUNCTIONS();
        TimestampProvider$$SIZES();
        Hwi$$SIZES();
        TimerSupport$$SIZES();
        Clobber$$SIZES();
        TimestampProvider$$TYPES();
        Hwi$$TYPES();
        TimerSupport$$TYPES();
        Clobber$$TYPES();
        if (isROV) {
            TimestampProvider$$ROV();
            Hwi$$ROV();
            TimerSupport$$ROV();
            Clobber$$ROV();
        }//isROV
        $$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        Hwi$$SINGLETONS();
        TimerSupport$$SINGLETONS();
        Clobber$$SINGLETONS();
        $$INITIALIZATION();
    }
}
