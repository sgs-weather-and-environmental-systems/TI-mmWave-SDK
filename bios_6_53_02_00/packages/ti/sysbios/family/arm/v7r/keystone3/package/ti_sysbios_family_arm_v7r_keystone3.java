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

public class ti_sysbios_family_arm_v7r_keystone3
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
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.interfaces");
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3", new Value.Obj("ti.sysbios.family.arm.v7r.keystone3", pkgP));
    }

    void Core$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Core.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Core", new Value.Obj("ti.sysbios.family.arm.v7r.keystone3.Core", po));
        pkgV.bind("Core", vo);
        // decls 
    }

    void Hwi$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi", new Value.Obj("ti.sysbios.family.arm.v7r.keystone3.Hwi", po));
        pkgV.bind("Hwi", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.v7r.keystone3"));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.v7r.keystone3"));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.v7r.keystone3"));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type", new Proto.Enm("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type"));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType", new Proto.Enm("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$InterruptGroup", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptGroup", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$VIM", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.VIM", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$InterruptObj", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Object", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance_State", "ti.sysbios.family.arm.v7r.keystone3"));
        }//isROV
    }

    void TimerSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.TimerSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v7r.keystone3.TimerSupport", new Value.Obj("ti.sysbios.family.arm.v7r.keystone3.TimerSupport", po));
        pkgV.bind("TimerSupport", vo);
        // decls 
    }

    void Core$$CONSTS()
    {
        // module Core
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Core.getId", new Extern("ti_sysbios_family_arm_v7r_keystone3_Core_getId__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Core.interruptCore", new Extern("ti_sysbios_family_arm_v7r_keystone3_Core_interruptCore__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Core.lock", new Extern("ti_sysbios_family_arm_v7r_keystone3_Core_lock__E", "xdc_IArg(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Core.unlock", new Extern("ti_sysbios_family_arm_v7r_keystone3_Core_unlock__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Core.startCore1", new Extern("ti_sysbios_family_arm_v7r_keystone3_Core_startCore1__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Core.resetC", new Extern("ti_sysbios_family_arm_v7r_keystone3_Core_resetC__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void Hwi$$CONSTS()
    {
        // module Hwi
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type_IRQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type", "ti.sysbios.family.arm.v7r.keystone3"), "ti.sysbios.family.arm.v7r.keystone3.Hwi.Type_IRQ", 0));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type_FIQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type", "ti.sysbios.family.arm.v7r.keystone3"), "ti.sysbios.family.arm.v7r.keystone3.Hwi.Type_FIQ", 1));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType_LEVEL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType", "ti.sysbios.family.arm.v7r.keystone3"), "ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType_LEVEL", 0));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType_PULSE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType", "ti.sysbios.family.arm.v7r.keystone3"), "ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType_PULSE", 1));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.vim", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_vim", "ti_sysbios_family_arm_v7r_keystone3_Hwi_VIM*", false, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.getStackInfo", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_getStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.getCoreStackInfo", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_getCoreStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.startup", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.switchFromBootStack", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_switchFromBootStack__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.post", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_post__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.getTaskSP", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_getTaskSP__E", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.disableInterrupt", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_disableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.enableInterrupt", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_enableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.restoreInterrupt", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_restoreInterrupt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.clearInterrupt", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_clearInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.getHandle", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_getHandle__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_Object*(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.enableIRQ", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_enableIRQ__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.disableIRQ", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_disableIRQ__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.restoreIRQ", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_restoreIRQ__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.setPriority", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_setPriority__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.setType", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_setType__E", "xdc_Void(*)(xdc_UInt,ti_sysbios_family_arm_v7r_keystone3_Hwi_Type)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.setTriggerType", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_setTriggerType__E", "xdc_Void(*)(xdc_UInt,ti_sysbios_family_arm_v7r_keystone3_Hwi_TriggerType)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.postInit", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_postInit__I", "xdc_Int(*)(ti_sysbios_family_arm_v7r_keystone3_Hwi_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.initIntController", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_initIntController__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.init", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_init__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.dispatchIRQ", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_dispatchIRQ__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.dispatchFIQC", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_dispatchFIQC__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.dispatchIRQC", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_dispatchIRQC__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.nonPluggedHwiHandler", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_nonPluggedHwiHandler__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.plug", new Extern("ti_sysbios_family_arm_v7r_keystone3_Hwi_plug__I", "xdc_Void(*)(xdc_UInt,xdc_Void(*)(xdc_Void))", true, false));
    }

    void TimerSupport$$CONSTS()
    {
        // module TimerSupport
        om.bind("ti.sysbios.family.arm.v7r.keystone3.TimerSupport.enable", new Extern("ti_sysbios_family_arm_v7r_keystone3_TimerSupport_enable__E", "xdc_Void(*)(xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void Core$$CREATES()
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
            sb.append("ti$sysbios$family$arm$v7r$keystone3$Hwi$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.v7r.keystone3.Hwi.create() called before xdc.useModule('ti.sysbios.family.arm.v7r.keystone3.Hwi')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.intNum, inst.$args.hwiFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module", "ti.sysbios.family.arm.v7r.keystone3"), om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance", "ti.sysbios.family.arm.v7r.keystone3"), 3, 2, false));
                        fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Params", "ti.sysbios.family.arm.v7r.keystone3"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$v7r$keystone3$Hwi$$create = function( intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.v7r.keystone3']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [intNum, hwiFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module", "ti.sysbios.family.arm.v7r.keystone3"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Object", "ti.sysbios.family.arm.v7r.keystone3"), null);
                        fxn.addArg(1, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Params", "ti.sysbios.family.arm.v7r.keystone3"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$v7r$keystone3$Hwi$$construct = function( __obj, intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi'].__initObject(__inst);\n");
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

    void Core$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Hwi$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Hwi.inUseMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$inUseMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module", "ti.sysbios.family.arm.v7r.keystone3"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
    }

    void TimerSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Core$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Hwi$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptGroup", "ti.sysbios.family.arm.v7r.keystone3");
        sizes.clear();
        sizes.add(Global.newArray("RAWSTATUSSET", "UInt32"));
        sizes.add(Global.newArray("ENABLEDSTATUSCLEAR", "UInt32"));
        sizes.add(Global.newArray("ENABLEDSET", "UInt32"));
        sizes.add(Global.newArray("ENABLEDCLEAR", "UInt32"));
        sizes.add(Global.newArray("IRQENABLEDSTATUSCLEAR", "UInt32"));
        sizes.add(Global.newArray("FIQENABLEDSTATUSCLEAR", "UInt32"));
        sizes.add(Global.newArray("INTERRUPTMAP", "UInt32"));
        sizes.add(Global.newArray("TYPEMAP", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptGroup']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptGroup']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptGroup'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.VIM", "ti.sysbios.family.arm.v7r.keystone3");
        sizes.clear();
        sizes.add(Global.newArray("REVISION", "UInt32"));
        sizes.add(Global.newArray("INFO", "UInt32"));
        sizes.add(Global.newArray("PRIOIRQ", "UInt32"));
        sizes.add(Global.newArray("PRIOFIQ", "UInt32"));
        sizes.add(Global.newArray("IRQGROUPSTATUS", "UInt32"));
        sizes.add(Global.newArray("FIQGROUPSTATUS", "UInt32"));
        sizes.add(Global.newArray("IRQVECADDRESS", "UInt32"));
        sizes.add(Global.newArray("FIQVECADDRESS", "UInt32"));
        sizes.add(Global.newArray("ACTIVEIRQ", "UInt32"));
        sizes.add(Global.newArray("ACTIVEFIQ", "UInt32"));
        sizes.add(Global.newArray("hole0", "A2;UInt32"));
        sizes.add(Global.newArray("DECVECADDRESS", "UInt32"));
        sizes.add(Global.newArray("hole1", "A243;UInt32"));
        sizes.add(Global.newArray("GROUP", "A32;Sti.sysbios.family.arm.v7r.keystone3.Hwi;InterruptGroup"));
        sizes.add(Global.newArray("hole2", "A512;UInt32"));
        sizes.add(Global.newArray("PRIORITY", "A1024;UInt32"));
        sizes.add(Global.newArray("VECTOR", "A1024;UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.VIM']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.VIM']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.VIM'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance_State", "ti.sysbios.family.arm.v7r.keystone3");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("type", "Nti.sysbios.family.arm.v7r.keystone3.Hwi.Type;;;"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("intNum", "TInt"));
        sizes.add(Global.newArray("irp", "UIArg"));
        sizes.add(Global.newArray("hookEnv", "UPtr"));
        sizes.add(Global.newArray("priority", "TInt"));
        sizes.add(Global.newArray("triggerType", "Nti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType;;;"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module_State", "ti.sysbios.family.arm.v7r.keystone3");
        sizes.clear();
        sizes.add(Global.newArray("taskSP", "UPtr"));
        sizes.add(Global.newArray("isrStack", "UPtr"));
        sizes.add(Global.newArray("isrStackBase", "UPtr"));
        sizes.add(Global.newArray("isrStackSize", "UPtr"));
        sizes.add(Global.newArray("fiqStack", "UPtr"));
        sizes.add(Global.newArray("fiqStackSize", "USize"));
        sizes.add(Global.newArray("irqStack", "UPtr"));
        sizes.add(Global.newArray("irqStackSize", "USize"));
        sizes.add(Global.newArray("dispatchTable", "UPtr"));
        sizes.add(Global.newArray("spuriousInts", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v7r.keystone3.Hwi.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimerSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Core$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7r/keystone3/Core.xs");
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Core$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core.Module", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Core.Module", om.findStrict("ti.sysbios.interfaces.ICore.Module", "ti.sysbios.family.arm.v7r.keystone3"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("E_mismatchedIds", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v7r.keystone3"), Global.newObject("msg", "E_mismatchedIds: Core_Id: %d does not match hardware core Id: %d"), "w");
            po.addFld("numCores", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
            po.addFld("resetFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), null, "wh");
            po.addFld("overrideHwiResetFunc", $$T_Bool, false, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.Core$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.Core$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.Core$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.Core$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // typedef Core.ResetFuncPtr
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Core.ResetFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
    }

    void Hwi$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7r/keystone3/Hwi.xs");
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module", om.findStrict("ti.sysbios.interfaces.IHwi.Module", "ti.sysbios.family.arm.v7r.keystone3"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("DEFAULT_INT_PRIORITY", Proto.Elm.newCNum("(xdc_UInt)"), 0xFL, "w");
            po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.v7r.keystone3"), $$UNDEF, "wh");
            po.addFld("core0VectorTableAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
            po.addFld("core1VectorTableAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
            po.addFld("resetVectorHandlerAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
            po.addFld("resetFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("undefinedInstFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("swiFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("prefetchAbortFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("dataAbortFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("reservedFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("irqFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("fiqFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("fiqStack", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
            po.addFld("fiqStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 1024L, "wh");
            po.addFld("fiqStackSection", $$T_Str, null, "wh");
            po.addFld("irqStack", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
            po.addFld("irqStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 1024L, "wh");
            po.addFld("irqStackSection", $$T_Str, null, "wh");
            po.addFld("vimBaseAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
            po.addFld("A_badChannelId", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.v7r.keystone3"), Global.newObject("msg", "A_badChannelId: ChannelId is either not re-mappable or invalid."), "w");
            po.addFld("E_alreadyDefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v7r.keystone3"), Global.newObject("msg", "E_alreadyDefined: Hwi already defined: intr# %d"), "w");
            po.addFld("E_badIntNum", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v7r.keystone3"), Global.newObject("msg", "E_badIntNum, intnum: %d is out of range"), "w");
            po.addFld("E_undefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v7r.keystone3"), Global.newObject("msg", "E_undefined: Hwi undefined, intNum: %d"), "w");
            po.addFld("E_unsupportedMaskingOption", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v7r.keystone3"), Global.newObject("msg", "E_unsupportedMaskingOption: Unsupported masking option passed."), "w");
            po.addFld("LM_begin", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arm.v7r.keystone3"), Global.newObject("mask", Global.eval("0x0100 | 0x0200"), "msg", "LM_begin: hwi: 0x%x, func: 0x%x, preThread: %d, intNum: %d, irp: 0x%x"), "w");
            po.addFld("LD_end", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arm.v7r.keystone3"), Global.newObject("mask", 0x0200L, "msg", "LD_end: hwi: 0x%x"), "w");
            po.addFld("lockstepDevice", $$T_Bool, $$UNDEF, "wh");
            po.addFld("intEnable", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), $$DEFAULT, "w");
            po.addFld("swiDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("swiRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("taskDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("taskRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("hooks", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.HookSet", "ti.sysbios.family.arm.v7r.keystone3"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("interrupt", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptObj", "ti.sysbios.family.arm.v7r.keystone3"), false), $$DEFAULT, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$create", "ti.sysbios.family.arm.v7r.keystone3"), Global.get("ti$sysbios$family$arm$v7r$keystone3$Hwi$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$construct", "ti.sysbios.family.arm.v7r.keystone3"), Global.get("ti$sysbios$family$arm$v7r$keystone3$Hwi$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "addHookSet");
                if (fxn != null) po.addFxn("addHookSet", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$addHookSet", "ti.sysbios.family.arm.v7r.keystone3"), fxn);
                fxn = Global.get(cap, "viewGetStackInfo");
                if (fxn != null) po.addFxn("viewGetStackInfo", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$viewGetStackInfo", "ti.sysbios.family.arm.v7r.keystone3"), fxn);
                po.addFxn("inUseMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$inUseMeta", "ti.sysbios.family.arm.v7r.keystone3"), Global.get(cap, "inUseMeta"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance", om.findStrict("ti.sysbios.interfaces.IHwi.Instance", "ti.sysbios.family.arm.v7r.keystone3"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
            po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type", "ti.sysbios.family.arm.v7r.keystone3"), om.find("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type_IRQ"), "w");
            po.addFld("triggerType", (Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType", "ti.sysbios.family.arm.v7r.keystone3"), om.find("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType_LEVEL"), "w");
            po.addFld("maskSetting", (Proto)om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.v7r.keystone3"), om.find("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.v7r.keystone3"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Params", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.Params", om.findStrict("ti.sysbios.interfaces.IHwi$$Params", "ti.sysbios.family.arm.v7r.keystone3"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
            po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type", "ti.sysbios.family.arm.v7r.keystone3"), om.find("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type_IRQ"), "w");
            po.addFld("triggerType", (Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType", "ti.sysbios.family.arm.v7r.keystone3"), om.find("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType_LEVEL"), "w");
            po.addFld("maskSetting", (Proto)om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.v7r.keystone3"), om.find("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.v7r.keystone3"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Object", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.Object", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance", "ti.sysbios.family.arm.v7r.keystone3"));
        // typedef Hwi.VectorFuncPtr
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.VectorFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // typedef Hwi.PlugFuncPtr
        om.bind("ti.sysbios.family.arm.v7r.keystone3.Hwi.PlugFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Hwi.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$BasicView", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halHwiHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("type", $$T_Str, $$UNDEF, "w");
                po.addFld("triggerType", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("status", $$T_Str, $$UNDEF, "w");
        // struct Hwi.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$ModuleView", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("options", new Proto.Arr($$T_Str, false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("hwiStackPeak", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("hwiStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("hwiStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Hwi.InterruptGroup
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$InterruptGroup", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptGroup", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("RAWSTATUSSET", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ENABLEDSTATUSCLEAR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ENABLEDSET", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ENABLEDCLEAR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IRQENABLEDSTATUSCLEAR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("FIQENABLEDSTATUSCLEAR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTERRUPTMAP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TYPEMAP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Hwi.VIM
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$VIM", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.VIM", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("REVISION", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INFO", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PRIOIRQ", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PRIOFIQ", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IRQGROUPSTATUS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("FIQGROUPSTATUS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IRQVECADDRESS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("FIQVECADDRESS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ACTIVEIRQ", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ACTIVEFIQ", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole0", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("DECVECADDRESS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole1", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(243L)), $$DEFAULT, "w");
                po.addFld("GROUP", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptGroup", "ti.sysbios.family.arm.v7r.keystone3"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("hole2", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(512L)), $$DEFAULT, "w");
                po.addFld("PRIORITY", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(1024L)), $$DEFAULT, "w");
                po.addFld("VECTOR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(1024L)), $$DEFAULT, "w");
        // struct Hwi.InterruptObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$InterruptObj", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("used", $$T_Bool, $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
        // struct Hwi.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Instance_State", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type", "ti.sysbios.family.arm.v7r.keystone3"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("hookEnv", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("triggerType", (Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType", "ti.sysbios.family.arm.v7r.keystone3"), $$UNDEF, "w");
        // struct Hwi.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Module_State", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("taskSP", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("isrStack", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("isrStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("isrStackSize", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("fiqStack", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), $$DEFAULT, "w");
                po.addFld("fiqStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("irqStack", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), $$DEFAULT, "w");
                po.addFld("irqStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("dispatchTable", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Handle", "ti.sysbios.family.arm.v7r.keystone3"), false), $$DEFAULT, "w");
                po.addFld("spuriousInts", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
    }

    void TimerSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7r/keystone3/TimerSupport.xs");
        om.bind("ti.sysbios.family.arm.v7r.keystone3.TimerSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.TimerSupport.Module", "ti.sysbios.family.arm.v7r.keystone3");
        po.init("ti.sysbios.family.arm.v7r.keystone3.TimerSupport.Module", om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.family.arm.v7r.keystone3"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.TimerSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.TimerSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.TimerSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7r.keystone3.TimerSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Core$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core", "ti.sysbios.family.arm.v7r.keystone3");
    }

    void Hwi$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi", "ti.sysbios.family.arm.v7r.keystone3");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Instance_State", "ti.sysbios.family.arm.v7r.keystone3");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("InterruptGroup$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptGroup", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$InterruptGroup", "ti.sysbios.family.arm.v7r.keystone3");
        vo.bind("VIM$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v7r.keystone3.Hwi.VIM", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$VIM", "ti.sysbios.family.arm.v7r.keystone3");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Instance_State", "ti.sysbios.family.arm.v7r.keystone3");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v7r.keystone3.Hwi.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$Module_State", "ti.sysbios.family.arm.v7r.keystone3");
        po.bind("fiqStack$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Char", "isScalar", true));
        po.bind("irqStack$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Char", "isScalar", true));
        po.bind("dispatchTable$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
    }

    void TimerSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.TimerSupport", "ti.sysbios.family.arm.v7r.keystone3");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.v7r.keystone3.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.v7r.keystone3"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7r/keystone3/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.v7r.keystone3"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.v7r.keystone3"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.v7r.keystone3"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.v7r.keystone3"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.v7r.keystone3"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.v7r.keystone3"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.v7r.keystone3", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.v7r.keystone3");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.v7r.keystone3.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.v7r.keystone3'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.v7r.keystone3$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.v7r.keystone3$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.v7r.keystone3$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7r.keystone3.aer5f',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7r.keystone3.aer5f', {target: 'ti.targets.arm.elf.R5F', suffix: 'er5f'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Core$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core", "ti.sysbios.family.arm.v7r.keystone3");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core.Module", "ti.sysbios.family.arm.v7r.keystone3");
        vo.init2(po, "ti.sysbios.family.arm.v7r.keystone3.Core", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core$$capsule", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v7r.keystone3", "ti.sysbios.family.arm.v7r.keystone3"));
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
        vo.bind("ResetFuncPtr", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core.ResetFuncPtr", "ti.sysbios.family.arm.v7r.keystone3"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v7r.keystone3")).add(vo);
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
        vo.bind("getId", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core.getId", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("interruptCore", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core.interruptCore", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("lock", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core.lock", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("unlock", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core.unlock", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("startCore1", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core.startCore1", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("resetC", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core.resetC", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v7r_keystone3_Core_Module__startupDone__E", "ti_sysbios_family_arm_v7r_keystone3_Core_getId__E", "ti_sysbios_family_arm_v7r_keystone3_Core_interruptCore__E", "ti_sysbios_family_arm_v7r_keystone3_Core_lock__E", "ti_sysbios_family_arm_v7r_keystone3_Core_unlock__E", "ti_sysbios_family_arm_v7r_keystone3_Core_hwiDisable__E", "ti_sysbios_family_arm_v7r_keystone3_Core_hwiEnable__E", "ti_sysbios_family_arm_v7r_keystone3_Core_hwiRestore__E"));
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

    void Hwi$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi", "ti.sysbios.family.arm.v7r.keystone3");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module", "ti.sysbios.family.arm.v7r.keystone3");
        vo.init2(po, "ti.sysbios.family.arm.v7r.keystone3.Hwi", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi$$capsule", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Params", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Params", "ti.sysbios.family.arm.v7r.keystone3")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Handle", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v7r.keystone3", "ti.sysbios.family.arm.v7r.keystone3"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.IHwi.FuncPtr", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("Irp", om.findStrict("ti.sysbios.interfaces.IHwi.Irp", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.v7r.keystone3"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.v7r.keystone3"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.v7r.keystone3"));
        mcfgs.add("dispatcherAutoNestingSupport");
        mcfgs.add("dispatcherSwiSupport");
        mcfgs.add("dispatcherTaskSupport");
        mcfgs.add("dispatcherIrpTrackingSupport");
        mcfgs.add("DEFAULT_INT_PRIORITY");
        mcfgs.add("NUM_INTERRUPTS");
        vo.bind("VectorFuncPtr", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.VectorFuncPtr", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("PlugFuncPtr", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.PlugFuncPtr", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("Type", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("TriggerType", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.BasicView", "ti.sysbios.family.arm.v7r.keystone3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.BasicView", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.ModuleView", "ti.sysbios.family.arm.v7r.keystone3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.ModuleView", "ti.sysbios.family.arm.v7r.keystone3"));
        mcfgs.add("resetVectorHandlerAddress");
        mcfgs.add("fiqStack");
        mcfgs.add("irqStack");
        mcfgs.add("A_badChannelId");
        mcfgs.add("E_alreadyDefined");
        mcfgs.add("E_badIntNum");
        mcfgs.add("E_undefined");
        mcfgs.add("E_unsupportedMaskingOption");
        mcfgs.add("LM_begin");
        mcfgs.add("LD_end");
        vo.bind("InterruptGroup", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptGroup", "ti.sysbios.family.arm.v7r.keystone3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptGroup", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("VIM", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.VIM", "ti.sysbios.family.arm.v7r.keystone3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.VIM", "ti.sysbios.family.arm.v7r.keystone3"));
        icfgs.add("lockstepDevice");
        vo.bind("vim", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.vim", "ti.sysbios.family.arm.v7r.keystone3"));
        mcfgs.add("intEnable");
        icfgs.add("intEnable");
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
        vo.bind("InterruptObj", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptObj", "ti.sysbios.family.arm.v7r.keystone3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.InterruptObj", "ti.sysbios.family.arm.v7r.keystone3"));
        icfgs.add("interrupt");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance_State", "ti.sysbios.family.arm.v7r.keystone3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Instance_State", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module_State", "ti.sysbios.family.arm.v7r.keystone3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Module_State", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("MaskingOption_NONE", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_NONE", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("MaskingOption_ALL", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_ALL", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("MaskingOption_SELF", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_SELF", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("MaskingOption_BITMASK", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_BITMASK", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("MaskingOption_LOWER", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("Type_IRQ", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type_IRQ", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("Type_FIQ", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Type_FIQ", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("TriggerType_LEVEL", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType_LEVEL", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("TriggerType_PULSE", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.TriggerType_PULSE", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v7r.keystone3")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.v7r.keystone3.Hwi$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$v7r$keystone3$Hwi$$__initObject"));
        }//isCFG
        vo.bind("getStackInfo", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.getStackInfo", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("getCoreStackInfo", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.getCoreStackInfo", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.startup", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("switchFromBootStack", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.switchFromBootStack", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("post", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.post", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("getTaskSP", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.getTaskSP", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.disableInterrupt", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.enableInterrupt", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("restoreInterrupt", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.restoreInterrupt", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("clearInterrupt", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.clearInterrupt", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.getHandle", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("enableIRQ", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.enableIRQ", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("disableIRQ", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.disableIRQ", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("restoreIRQ", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.restoreIRQ", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("setPriority", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.setPriority", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("setType", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.setType", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("setTriggerType", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.setTriggerType", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.postInit", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("initIntController", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.initIntController", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("init", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.init", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("dispatchIRQ", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.dispatchIRQ", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("dispatchFIQC", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.dispatchFIQC", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("dispatchIRQC", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.dispatchIRQC", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("nonPluggedHwiHandler", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.nonPluggedHwiHandler", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("plug", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.plug", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v7r_keystone3_Hwi_Handle__label__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_Module__startupDone__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_Object__create__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_Object__delete__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_Object__get__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_Object__first__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_Object__next__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_Params__init__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_getStackInfo__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_getCoreStackInfo__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_startup__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_switchFromBootStack__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_post__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_getTaskSP__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_disableInterrupt__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_enableInterrupt__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_restoreInterrupt__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_clearInterrupt__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_getFunc__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_setFunc__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_getHookContext__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_setHookContext__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_getIrp__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_disable__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_enable__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_restore__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_getHandle__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_enableIRQ__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_disableIRQ__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_restoreIRQ__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_setPriority__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_setType__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_setTriggerType__E", "ti_sysbios_family_arm_v7r_keystone3_Hwi_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray("LM_begin", "LD_end"));
        vo.bind("$$errorDescCfgs", Global.newArray("E_alreadyDefined", "E_badIntNum", "E_undefined", "E_unsupportedMaskingOption"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_badChannelId"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Hwi.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi.Object", "ti.sysbios.family.arm.v7r.keystone3"));
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

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.TimerSupport", "ti.sysbios.family.arm.v7r.keystone3");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.TimerSupport.Module", "ti.sysbios.family.arm.v7r.keystone3");
        vo.init2(po, "ti.sysbios.family.arm.v7r.keystone3.TimerSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.TimerSupport$$capsule", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v7r.keystone3", "ti.sysbios.family.arm.v7r.keystone3"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v7r.keystone3")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.v7r.keystone3.TimerSupport.enable", "ti.sysbios.family.arm.v7r.keystone3"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v7r_keystone3_TimerSupport_Module__startupDone__E", "ti_sysbios_family_arm_v7r_keystone3_TimerSupport_enable__E"));
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

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.v7r.keystone3")).findStrict("PARAMS", "ti.sysbios.family.arm.v7r.keystone3");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi", "ti.sysbios.family.arm.v7r.keystone3")).findStrict("PARAMS", "ti.sysbios.family.arm.v7r.keystone3");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Core", "ti.sysbios.family.arm.v7r.keystone3"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi", "ti.sysbios.family.arm.v7r.keystone3"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.TimerSupport", "ti.sysbios.family.arm.v7r.keystone3"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7r.keystone3.Hwi", "ti.sysbios.family.arm.v7r.keystone3");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"ChannelMap", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewChannelMap", "structName", "ChannelMapView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v7r.keystone3.Core")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v7r.keystone3.Hwi")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v7r.keystone3.TimerSupport")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.v7r.keystone3")).add(pkgV);
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
        Core$$OBJECTS();
        Hwi$$OBJECTS();
        TimerSupport$$OBJECTS();
        Core$$CONSTS();
        Hwi$$CONSTS();
        TimerSupport$$CONSTS();
        Core$$CREATES();
        Hwi$$CREATES();
        TimerSupport$$CREATES();
        Core$$FUNCTIONS();
        Hwi$$FUNCTIONS();
        TimerSupport$$FUNCTIONS();
        Core$$SIZES();
        Hwi$$SIZES();
        TimerSupport$$SIZES();
        Core$$TYPES();
        Hwi$$TYPES();
        TimerSupport$$TYPES();
        if (isROV) {
            Core$$ROV();
            Hwi$$ROV();
            TimerSupport$$ROV();
        }//isROV
        $$SINGLETONS();
        Core$$SINGLETONS();
        Hwi$$SINGLETONS();
        TimerSupport$$SINGLETONS();
        $$INITIALIZATION();
    }
}
