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

public class ti_sysbios_family_arm_a8_intcps
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.a8.intcps", new Value.Obj("ti.sysbios.family.arm.a8.intcps", pkgP));
    }

    void Hwi$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi", new Value.Obj("ti.sysbios.family.arm.a8.intcps.Hwi", po));
        pkgV.bind("Hwi", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.a8.intcps"));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.a8.intcps"));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.a8.intcps"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$DetailedView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.DetailedView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.ModuleView", new Proto.Str(spo, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Type", new Proto.Enm("ti.sysbios.family.arm.a8.intcps.Hwi.Type"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$Intc", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Intc", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$InterruptObj", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.InterruptObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Object", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Instance_State", "ti.sysbios.family.arm.a8.intcps"));
        }//isROV
    }

    void Hwi$$CONSTS()
    {
        // module Hwi
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.NUM_INTERRUPTS", 128L);
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Type_IRQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Type", "ti.sysbios.family.arm.a8.intcps"), "ti.sysbios.family.arm.a8.intcps.Hwi.Type_IRQ", 0));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.Type_FIQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Type", "ti.sysbios.family.arm.a8.intcps"), "ti.sysbios.family.arm.a8.intcps.Hwi.Type_FIQ", 1));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.intc", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_intc", "ti_sysbios_family_arm_a8_intcps_Hwi_Intc*", false, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.getStackInfo", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_getStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.getCoreStackInfo", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_getCoreStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.startup", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.switchFromBootStack", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_switchFromBootStack__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.getTaskSP", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_getTaskSP__E", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.disableInterrupt", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_disableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.enableInterrupt", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_enableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.restoreInterrupt", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_restoreInterrupt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.clearInterrupt", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_clearInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.post", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_post__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.clearPostedInterrupt", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_clearPostedInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.getHandle", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_getHandle__E", "ti_sysbios_family_arm_a8_intcps_Hwi_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.enableFIQ", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_enableFIQ__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.disableFIQ", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_disableFIQ__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.restoreFIQ", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_restoreFIQ__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.enableIRQ", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_enableIRQ__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.disableIRQ", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_disableIRQ__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.restoreIRQ", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_restoreIRQ__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.disableMIR0", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_disableMIR0__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.disableMIR1", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_disableMIR1__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.disableMIR2", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_disableMIR2__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.disableMIR3", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_disableMIR3__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.enableMIR0", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_enableMIR0__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.enableMIR1", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_enableMIR1__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.enableMIR2", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_enableMIR2__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.enableMIR3", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_enableMIR3__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.restoreMIR0", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_restoreMIR0__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.restoreMIR1", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_restoreMIR1__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.restoreMIR2", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_restoreMIR2__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.restoreMIR3", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_restoreMIR3__E", "xdc_Bits32(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.setPriority", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_setPriority__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.setType", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_setType__E", "xdc_Void(*)(xdc_UInt,ti_sysbios_family_arm_a8_intcps_Hwi_Type)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.postInit", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_postInit__I", "xdc_Int(*)(ti_sysbios_family_arm_a8_intcps_Hwi_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.initIntController", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_initIntController__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.init", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_init__I", "xdc_Void(*)(xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.initVbar", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_initVbar__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.dispatchIRQ", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_dispatchIRQ__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.dispatchIRQC", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_dispatchIRQC__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.dispatchFIQC", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_dispatchFIQC__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.nonPluggedHwiHandler", new Extern("ti_sysbios_family_arm_a8_intcps_Hwi_nonPluggedHwiHandler__I", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void Hwi$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$a8$intcps$Hwi$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.a8.intcps.Hwi.create() called before xdc.useModule('ti.sysbios.family.arm.a8.intcps.Hwi')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.intNum, inst.$args.hwiFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Module", "ti.sysbios.family.arm.a8.intcps"), om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Instance", "ti.sysbios.family.arm.a8.intcps"), 3, 2, false));
                        fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Params", "ti.sysbios.family.arm.a8.intcps"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$a8$intcps$Hwi$$create = function( intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.a8.intcps']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [intNum, hwiFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Module", "ti.sysbios.family.arm.a8.intcps"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$Object", "ti.sysbios.family.arm.a8.intcps"), null);
                        fxn.addArg(1, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Params", "ti.sysbios.family.arm.a8.intcps"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$a8$intcps$Hwi$$construct = function( __obj, intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Hwi$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Hwi.inUseMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$inUseMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Module", "ti.sysbios.family.arm.a8.intcps"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
    }

    void Hwi$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Intc", "ti.sysbios.family.arm.a8.intcps");
        sizes.clear();
        sizes.add(Global.newArray("REVISION", "UInt32"));
        sizes.add(Global.newArray("hole0", "A3;UInt32"));
        sizes.add(Global.newArray("SYSCONFIG", "UInt32"));
        sizes.add(Global.newArray("SYSSTATUS", "UInt32"));
        sizes.add(Global.newArray("hole1", "A10;UInt32"));
        sizes.add(Global.newArray("SIR_IRQ", "UInt32"));
        sizes.add(Global.newArray("SIR_FIQ", "UInt32"));
        sizes.add(Global.newArray("CONTROL", "UInt32"));
        sizes.add(Global.newArray("PROTECTION", "UInt32"));
        sizes.add(Global.newArray("IDLE", "UInt32"));
        sizes.add(Global.newArray("hole2", "A3;UInt32"));
        sizes.add(Global.newArray("IRQ_PRIORITY", "UInt32"));
        sizes.add(Global.newArray("FIQ_PRIORITY", "UInt32"));
        sizes.add(Global.newArray("THRESHOLD", "UInt32"));
        sizes.add(Global.newArray("hole3", "A5;UInt32"));
        sizes.add(Global.newArray("ITR0", "UInt32"));
        sizes.add(Global.newArray("MIR0", "UInt32"));
        sizes.add(Global.newArray("MIR_CLEAR0", "UInt32"));
        sizes.add(Global.newArray("MIR_SET0", "UInt32"));
        sizes.add(Global.newArray("ISR_SET0", "UInt32"));
        sizes.add(Global.newArray("ISR_CLEAR0", "UInt32"));
        sizes.add(Global.newArray("PENDING_IRQ0", "UInt32"));
        sizes.add(Global.newArray("PENDING_FIQ0", "UInt32"));
        sizes.add(Global.newArray("ITR1", "UInt32"));
        sizes.add(Global.newArray("MIR1", "UInt32"));
        sizes.add(Global.newArray("MIR_CLEAR1", "UInt32"));
        sizes.add(Global.newArray("MIR_SET1", "UInt32"));
        sizes.add(Global.newArray("ISR_SET1", "UInt32"));
        sizes.add(Global.newArray("ISR_CLEAR1", "UInt32"));
        sizes.add(Global.newArray("PENDING_IRQ1", "UInt32"));
        sizes.add(Global.newArray("PENDING_FIQ1", "UInt32"));
        sizes.add(Global.newArray("ITR2", "UInt32"));
        sizes.add(Global.newArray("MIR2", "UInt32"));
        sizes.add(Global.newArray("MIR_CLEAR2", "UInt32"));
        sizes.add(Global.newArray("MIR_SET2", "UInt32"));
        sizes.add(Global.newArray("ISR_SET2", "UInt32"));
        sizes.add(Global.newArray("ISR_CLEAR2", "UInt32"));
        sizes.add(Global.newArray("PENDING_IRQ2", "UInt32"));
        sizes.add(Global.newArray("PENDING_FIQ2", "UInt32"));
        sizes.add(Global.newArray("ITR3", "UInt32"));
        sizes.add(Global.newArray("MIR3", "UInt32"));
        sizes.add(Global.newArray("MIR_CLEAR3", "UInt32"));
        sizes.add(Global.newArray("MIR_SET3", "UInt32"));
        sizes.add(Global.newArray("ISR_SET3", "UInt32"));
        sizes.add(Global.newArray("ISR_CLEAR3", "UInt32"));
        sizes.add(Global.newArray("PENDING_IRQ3", "UInt32"));
        sizes.add(Global.newArray("PENDING_FIQ3", "UInt32"));
        sizes.add(Global.newArray("ILR", "A128;UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi.Intc']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi.Intc']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi.Intc'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Instance_State", "ti.sysbios.family.arm.a8.intcps");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("type", "Nti.sysbios.family.arm.a8.intcps.Hwi.Type;;;"));
        sizes.add(Global.newArray("priority", "UInt"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("irp", "UIArg"));
        sizes.add(Global.newArray("hookEnv", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Module_State", "ti.sysbios.family.arm.a8.intcps");
        sizes.clear();
        sizes.add(Global.newArray("taskSP", "UPtr"));
        sizes.add(Global.newArray("isrStack", "UPtr"));
        sizes.add(Global.newArray("mir0Mask", "UInt32"));
        sizes.add(Global.newArray("mir1Mask", "UInt32"));
        sizes.add(Global.newArray("mir2Mask", "UInt32"));
        sizes.add(Global.newArray("mir3Mask", "UInt32"));
        sizes.add(Global.newArray("spuriousInts", "UInt"));
        sizes.add(Global.newArray("lastSpuriousInt", "UInt"));
        sizes.add(Global.newArray("irp", "UInt"));
        sizes.add(Global.newArray("isrStackBase", "UPtr"));
        sizes.add(Global.newArray("isrStackSize", "UPtr"));
        sizes.add(Global.newArray("fiqStack", "UPtr"));
        sizes.add(Global.newArray("fiqStackSize", "USize"));
        sizes.add(Global.newArray("dispatchTable", "A128;UPtr"));
        sizes.add(Global.newArray("nonPluggedHwi", "Sti.sysbios.family.arm.a8.intcps.Hwi;Instance_State"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a8.intcps.Hwi.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Hwi$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a8/intcps/Hwi.xs");
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Module", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.Module", om.findStrict("ti.sysbios.interfaces.IHwi.Module", "ti.sysbios.family.arm.a8.intcps"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 128L, "rh");
        if (isCFG) {
            po.addFld("NUM_PRIORITIES", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.a8.intcps"), $$UNDEF, "wh");
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
            po.addFld("mir0Mask", Proto.Elm.newCNum("(xdc_Bits32)"), 0xffffffffL, "w");
            po.addFld("mir1Mask", Proto.Elm.newCNum("(xdc_Bits32)"), 0xffffffffL, "w");
            po.addFld("mir2Mask", Proto.Elm.newCNum("(xdc_Bits32)"), 0xffffffffL, "w");
            po.addFld("mir3Mask", Proto.Elm.newCNum("(xdc_Bits32)"), 0xffffffffL, "w");
            po.addFld("enableAsidTagging", $$T_Bool, false, "w");
            po.addFld("E_alreadyDefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.a8.intcps"), Global.newObject("msg", "E_alreadyDefined: Hwi already defined, intnum: %d"), "w");
            po.addFld("E_handleNotFound", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.a8.intcps"), Global.newObject("msg", "E_handleNotFound: Hwi handle not found: 0x%x"), "w");
            po.addFld("E_undefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.a8.intcps"), Global.newObject("msg", "E_undefined: Hwi undefined, intnum: %d"), "w");
            po.addFld("E_badIntNum", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.a8.intcps"), Global.newObject("msg", "E_badIntNum, intnum: %d is out of range"), "w");
            po.addFld("E_invalidPriority", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.a8.intcps"), Global.newObject("msg", "E_invalidPriority, priority: %d is either invalid or not supported"), "w");
            po.addFld("LM_begin", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arm.a8.intcps"), Global.newObject("mask", Global.eval("0x0100 | 0x0200"), "msg", "LM_begin: hwi: 0x%x, func: 0x%x, preThread: %d, intNum: %d, irp: 0x%x"), "w");
            po.addFld("LD_end", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arm.a8.intcps"), Global.newObject("mask", 0x0200L, "msg", "LD_end: hwi: 0x%x"), "w");
            po.addFld("swiDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("swiRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("taskDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("taskRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("hooks", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.HookSet", "ti.sysbios.family.arm.a8.intcps"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("interrupt", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.InterruptObj", "ti.sysbios.family.arm.a8.intcps"), false, xdc.services.intern.xsr.Enum.intValue(128L)), $$DEFAULT, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$create", "ti.sysbios.family.arm.a8.intcps"), Global.get("ti$sysbios$family$arm$a8$intcps$Hwi$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$construct", "ti.sysbios.family.arm.a8.intcps"), Global.get("ti$sysbios$family$arm$a8$intcps$Hwi$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.intcps.Hwi$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "addHookSet");
                if (fxn != null) po.addFxn("addHookSet", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$addHookSet", "ti.sysbios.family.arm.a8.intcps"), fxn);
                fxn = Global.get(cap, "viewGetStackInfo");
                if (fxn != null) po.addFxn("viewGetStackInfo", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$viewGetStackInfo", "ti.sysbios.family.arm.a8.intcps"), fxn);
                po.addFxn("inUseMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$inUseMeta", "ti.sysbios.family.arm.a8.intcps"), Global.get(cap, "inUseMeta"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Instance", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.Instance", om.findStrict("ti.sysbios.interfaces.IHwi.Instance", "ti.sysbios.family.arm.a8.intcps"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 128L, "rh");
        if (isCFG) {
            po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Type", "ti.sysbios.family.arm.a8.intcps"), om.find("ti.sysbios.family.arm.a8.intcps.Hwi.Type_IRQ"), "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
            po.addFld("maskSetting", (Proto)om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.a8.intcps"), om.find("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.a8.intcps"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$Params", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.Params", om.findStrict("ti.sysbios.interfaces.IHwi$$Params", "ti.sysbios.family.arm.a8.intcps"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 128L, "rh");
        if (isCFG) {
            po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Type", "ti.sysbios.family.arm.a8.intcps"), om.find("ti.sysbios.family.arm.a8.intcps.Hwi.Type_IRQ"), "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
            po.addFld("maskSetting", (Proto)om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.a8.intcps"), om.find("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.a8.intcps"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$Object", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.Object", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Instance", "ti.sysbios.family.arm.a8.intcps"));
        // typedef Hwi.VectorFuncPtr
        om.bind("ti.sysbios.family.arm.a8.intcps.Hwi.VectorFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Hwi.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$BasicView", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halHwiHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
        // struct Hwi.DetailedView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$DetailedView", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.DetailedView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halHwiHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("enabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("pending", $$T_Bool, $$UNDEF, "w");
        // struct Hwi.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$ModuleView", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("options", new Proto.Arr($$T_Str, false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("spuriousInterrupts", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("lastSpuriousInterrupt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("hwiStackPeak", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("hwiStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Hwi.Intc
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$Intc", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.Intc", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("REVISION", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole0", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "w");
                po.addFld("SYSCONFIG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SYSSTATUS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole1", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(10L)), $$DEFAULT, "w");
                po.addFld("SIR_IRQ", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SIR_FIQ", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CONTROL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PROTECTION", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IDLE", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole2", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "w");
                po.addFld("IRQ_PRIORITY", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("FIQ_PRIORITY", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("THRESHOLD", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole3", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(5L)), $$DEFAULT, "w");
                po.addFld("ITR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR_CLEAR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR_SET0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISR_SET0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISR_CLEAR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PENDING_IRQ0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PENDING_FIQ0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ITR1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR_CLEAR1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR_SET1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISR_SET1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISR_CLEAR1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PENDING_IRQ1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PENDING_FIQ1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ITR2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR_CLEAR2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR_SET2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISR_SET2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISR_CLEAR2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PENDING_IRQ2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PENDING_FIQ2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ITR3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR_CLEAR3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("MIR_SET3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISR_SET3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ISR_CLEAR3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PENDING_IRQ3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PENDING_FIQ3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ILR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(128L)), $$DEFAULT, "w");
        // struct Hwi.InterruptObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$InterruptObj", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.InterruptObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("used", $$T_Bool, $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
        // struct Hwi.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$Instance_State", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Type", "ti.sysbios.family.arm.a8.intcps"), $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("hookEnv", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "w");
        // struct Hwi.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$Module_State", "ti.sysbios.family.arm.a8.intcps");
        po.init("ti.sysbios.family.arm.a8.intcps.Hwi.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("taskSP", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("isrStack", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("mir0Mask", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("mir1Mask", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("mir2Mask", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("mir3Mask", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("spuriousInts", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("lastSpuriousInt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("irp", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("isrStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("isrStackSize", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("fiqStack", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), $$DEFAULT, "w");
                po.addFld("fiqStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("dispatchTable", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Handle", "ti.sysbios.family.arm.a8.intcps"), false, xdc.services.intern.xsr.Enum.intValue(128L)), $$DEFAULT, "w");
                po.addFldV("nonPluggedHwi", (Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Object", "ti.sysbios.family.arm.a8.intcps"), $$DEFAULT, "wh", $$objFldGet, $$objFldSet);
                po.addFld("Object_field_nonPluggedHwi", (Proto)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Object", "ti.sysbios.family.arm.a8.intcps"), $$DEFAULT, "w");
    }

    void Hwi$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi", "ti.sysbios.family.arm.a8.intcps");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$Instance_State", "ti.sysbios.family.arm.a8.intcps");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Intc$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a8.intcps.Hwi.Intc", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$Intc", "ti.sysbios.family.arm.a8.intcps");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a8.intcps.Hwi.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$Instance_State", "ti.sysbios.family.arm.a8.intcps");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a8.intcps.Hwi.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$Module_State", "ti.sysbios.family.arm.a8.intcps");
        po.bind("fiqStack$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Char", "isScalar", true));
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.a8.intcps.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.a8.intcps"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a8/intcps/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.a8.intcps"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.a8.intcps"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.a8.intcps"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.a8.intcps"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.a8.intcps"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.a8.intcps"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.a8.intcps", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.a8.intcps");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.a8.intcps.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.a8.intcps'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.a8.intcps$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.a8.intcps$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.a8.intcps$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a8.intcps.aea8fnv',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a8.intcps.aa8fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a8.intcps.aea8fnv', {target: 'ti.targets.arm.elf.A8Fnv', suffix: 'ea8fnv'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a8.intcps.aa8fg', {target: 'gnu.targets.arm.A8F', suffix: 'a8fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Hwi$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi", "ti.sysbios.family.arm.a8.intcps");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Module", "ti.sysbios.family.arm.a8.intcps");
        vo.init2(po, "ti.sysbios.family.arm.a8.intcps.Hwi", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi$$capsule", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Instance", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Params", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Params", "ti.sysbios.family.arm.a8.intcps")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Handle", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a8.intcps", "ti.sysbios.family.arm.a8.intcps"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.IHwi.FuncPtr", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("Irp", om.findStrict("ti.sysbios.interfaces.IHwi.Irp", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.a8.intcps"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.a8.intcps"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.a8.intcps"));
        mcfgs.add("dispatcherAutoNestingSupport");
        mcfgs.add("dispatcherSwiSupport");
        mcfgs.add("dispatcherTaskSupport");
        mcfgs.add("dispatcherIrpTrackingSupport");
        mcfgs.add("NUM_PRIORITIES");
        vo.bind("VectorFuncPtr", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.VectorFuncPtr", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.BasicView", "ti.sysbios.family.arm.a8.intcps"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.BasicView", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("DetailedView", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.DetailedView", "ti.sysbios.family.arm.a8.intcps"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.DetailedView", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.ModuleView", "ti.sysbios.family.arm.a8.intcps"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.ModuleView", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("Type", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Type", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("Intc", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Intc", "ti.sysbios.family.arm.a8.intcps"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Intc", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("intc", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.intc", "ti.sysbios.family.arm.a8.intcps"));
        mcfgs.add("fiqStack");
        mcfgs.add("mir0Mask");
        mcfgs.add("mir1Mask");
        mcfgs.add("mir2Mask");
        mcfgs.add("mir3Mask");
        mcfgs.add("enableAsidTagging");
        mcfgs.add("E_alreadyDefined");
        mcfgs.add("E_handleNotFound");
        mcfgs.add("E_undefined");
        mcfgs.add("E_badIntNum");
        mcfgs.add("E_invalidPriority");
        mcfgs.add("LM_begin");
        mcfgs.add("LD_end");
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
        vo.bind("InterruptObj", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.InterruptObj", "ti.sysbios.family.arm.a8.intcps"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.InterruptObj", "ti.sysbios.family.arm.a8.intcps"));
        icfgs.add("interrupt");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Instance_State", "ti.sysbios.family.arm.a8.intcps"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Instance_State", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Module_State", "ti.sysbios.family.arm.a8.intcps"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Module_State", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("MaskingOption_NONE", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_NONE", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("MaskingOption_ALL", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_ALL", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("MaskingOption_SELF", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_SELF", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("MaskingOption_BITMASK", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_BITMASK", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("MaskingOption_LOWER", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("Type_IRQ", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Type_IRQ", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("Type_FIQ", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Type_FIQ", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a8.intcps")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.a8.intcps.Hwi$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$a8$intcps$Hwi$$__initObject"));
        }//isCFG
        vo.bind("getStackInfo", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.getStackInfo", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("getCoreStackInfo", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.getCoreStackInfo", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.startup", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("switchFromBootStack", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.switchFromBootStack", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("getTaskSP", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.getTaskSP", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.disableInterrupt", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.enableInterrupt", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("restoreInterrupt", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.restoreInterrupt", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("clearInterrupt", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.clearInterrupt", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("post", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.post", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("clearPostedInterrupt", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.clearPostedInterrupt", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.getHandle", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("enableFIQ", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.enableFIQ", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("disableFIQ", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.disableFIQ", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("restoreFIQ", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.restoreFIQ", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("enableIRQ", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.enableIRQ", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("disableIRQ", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.disableIRQ", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("restoreIRQ", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.restoreIRQ", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("disableMIR0", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.disableMIR0", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("disableMIR1", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.disableMIR1", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("disableMIR2", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.disableMIR2", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("disableMIR3", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.disableMIR3", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("enableMIR0", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.enableMIR0", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("enableMIR1", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.enableMIR1", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("enableMIR2", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.enableMIR2", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("enableMIR3", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.enableMIR3", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("restoreMIR0", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.restoreMIR0", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("restoreMIR1", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.restoreMIR1", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("restoreMIR2", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.restoreMIR2", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("restoreMIR3", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.restoreMIR3", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("setPriority", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.setPriority", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("setType", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.setType", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.postInit", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("initIntController", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.initIntController", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("init", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.init", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("initVbar", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.initVbar", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("dispatchIRQ", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.dispatchIRQ", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("dispatchIRQC", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.dispatchIRQC", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("dispatchFIQC", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.dispatchFIQC", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("nonPluggedHwiHandler", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.nonPluggedHwiHandler", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a8_intcps_Hwi_Handle__label__E", "ti_sysbios_family_arm_a8_intcps_Hwi_Module__startupDone__E", "ti_sysbios_family_arm_a8_intcps_Hwi_Object__create__E", "ti_sysbios_family_arm_a8_intcps_Hwi_Object__delete__E", "ti_sysbios_family_arm_a8_intcps_Hwi_Object__get__E", "ti_sysbios_family_arm_a8_intcps_Hwi_Object__first__E", "ti_sysbios_family_arm_a8_intcps_Hwi_Object__next__E", "ti_sysbios_family_arm_a8_intcps_Hwi_Params__init__E", "ti_sysbios_family_arm_a8_intcps_Hwi_getStackInfo__E", "ti_sysbios_family_arm_a8_intcps_Hwi_getCoreStackInfo__E", "ti_sysbios_family_arm_a8_intcps_Hwi_startup__E", "ti_sysbios_family_arm_a8_intcps_Hwi_switchFromBootStack__E", "ti_sysbios_family_arm_a8_intcps_Hwi_getTaskSP__E", "ti_sysbios_family_arm_a8_intcps_Hwi_disableInterrupt__E", "ti_sysbios_family_arm_a8_intcps_Hwi_enableInterrupt__E", "ti_sysbios_family_arm_a8_intcps_Hwi_restoreInterrupt__E", "ti_sysbios_family_arm_a8_intcps_Hwi_clearInterrupt__E", "ti_sysbios_family_arm_a8_intcps_Hwi_getFunc__E", "ti_sysbios_family_arm_a8_intcps_Hwi_setFunc__E", "ti_sysbios_family_arm_a8_intcps_Hwi_getHookContext__E", "ti_sysbios_family_arm_a8_intcps_Hwi_setHookContext__E", "ti_sysbios_family_arm_a8_intcps_Hwi_getIrp__E", "ti_sysbios_family_arm_a8_intcps_Hwi_disable__E", "ti_sysbios_family_arm_a8_intcps_Hwi_enable__E", "ti_sysbios_family_arm_a8_intcps_Hwi_restore__E", "ti_sysbios_family_arm_a8_intcps_Hwi_post__E", "ti_sysbios_family_arm_a8_intcps_Hwi_clearPostedInterrupt__E", "ti_sysbios_family_arm_a8_intcps_Hwi_getHandle__E", "ti_sysbios_family_arm_a8_intcps_Hwi_enableFIQ__E", "ti_sysbios_family_arm_a8_intcps_Hwi_disableFIQ__E", "ti_sysbios_family_arm_a8_intcps_Hwi_restoreFIQ__E", "ti_sysbios_family_arm_a8_intcps_Hwi_enableIRQ__E", "ti_sysbios_family_arm_a8_intcps_Hwi_disableIRQ__E", "ti_sysbios_family_arm_a8_intcps_Hwi_restoreIRQ__E", "ti_sysbios_family_arm_a8_intcps_Hwi_disableMIR0__E", "ti_sysbios_family_arm_a8_intcps_Hwi_disableMIR1__E", "ti_sysbios_family_arm_a8_intcps_Hwi_disableMIR2__E", "ti_sysbios_family_arm_a8_intcps_Hwi_disableMIR3__E", "ti_sysbios_family_arm_a8_intcps_Hwi_enableMIR0__E", "ti_sysbios_family_arm_a8_intcps_Hwi_enableMIR1__E", "ti_sysbios_family_arm_a8_intcps_Hwi_enableMIR2__E", "ti_sysbios_family_arm_a8_intcps_Hwi_enableMIR3__E", "ti_sysbios_family_arm_a8_intcps_Hwi_restoreMIR0__E", "ti_sysbios_family_arm_a8_intcps_Hwi_restoreMIR1__E", "ti_sysbios_family_arm_a8_intcps_Hwi_restoreMIR2__E", "ti_sysbios_family_arm_a8_intcps_Hwi_restoreMIR3__E", "ti_sysbios_family_arm_a8_intcps_Hwi_setPriority__E", "ti_sysbios_family_arm_a8_intcps_Hwi_setType__E", "ti_sysbios_family_arm_a8_intcps_Hwi_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray("LM_begin", "LD_end"));
        vo.bind("$$errorDescCfgs", Global.newArray("E_alreadyDefined", "E_handleNotFound", "E_undefined", "E_badIntNum", "E_invalidPriority"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Hwi.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi.Object", "ti.sysbios.family.arm.a8.intcps"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Hwi.xdt");
        pkgV.bind("Hwi", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Hwi");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.a8.intcps")).findStrict("PARAMS", "ti.sysbios.family.arm.a8.intcps");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi", "ti.sysbios.family.arm.a8.intcps")).findStrict("PARAMS", "ti.sysbios.family.arm.a8.intcps");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi", "ti.sysbios.family.arm.a8.intcps"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.intcps.Hwi", "ti.sysbios.family.arm.a8.intcps");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Detailed", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitDetailed", "structName", "DetailedView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a8.intcps.Hwi")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.a8.intcps")).add(pkgV);
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
        Hwi$$OBJECTS();
        Hwi$$CONSTS();
        Hwi$$CREATES();
        Hwi$$FUNCTIONS();
        Hwi$$SIZES();
        Hwi$$TYPES();
        if (isROV) {
            Hwi$$ROV();
        }//isROV
        $$SINGLETONS();
        Hwi$$SINGLETONS();
        $$INITIALIZATION();
    }
}
