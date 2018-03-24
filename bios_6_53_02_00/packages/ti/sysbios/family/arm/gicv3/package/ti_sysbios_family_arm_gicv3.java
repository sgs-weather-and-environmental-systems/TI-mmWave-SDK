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

public class ti_sysbios_family_arm_gicv3
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
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.gicv3", new Value.Obj("ti.sysbios.family.arm.gicv3", pkgP));
    }

    void Hwi$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi", new Value.Obj("ti.sysbios.family.arm.gicv3.Hwi", po));
        pkgV.bind("Hwi", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.gicv3"));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.gicv3"));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.gicv3"));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.ExcType", new Proto.Enm("ti.sysbios.family.arm.gicv3.Hwi.ExcType"));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Type", new Proto.Enm("ti.sysbios.family.arm.gicv3.Hwi.Type"));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode", new Proto.Enm("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$IntAffinity", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.IntAffinity", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$SgiIntAffinity", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.SgiIntAffinity", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$DetailedView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.DetailedView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$ExcContext", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.ExcContext", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$Gicd", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Gicd", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$Gicr", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Gicr", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$Gics", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Gics", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$Gicc", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Gicc", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$GicRegisterMap", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.GicRegisterMap", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$InterruptObj", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.InterruptObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.gicv3.Hwi.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.gicv3.Hwi.Object", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Instance_State", "ti.sysbios.family.arm.gicv3"));
        }//isROV
    }

    void Hwi$$CONSTS()
    {
        // module Hwi
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.ExcType_Synchronous", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ExcType", "ti.sysbios.family.arm.gicv3"), "ti.sysbios.family.arm.gicv3.Hwi.ExcType_Synchronous", 0));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.ExcType_SError", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ExcType", "ti.sysbios.family.arm.gicv3"), "ti.sysbios.family.arm.gicv3.Hwi.ExcType_SError", 1));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Type_IRQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Type", "ti.sysbios.family.arm.gicv3"), "ti.sysbios.family.arm.gicv3.Hwi.Type_IRQ", 0));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.Type_FIQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Type", "ti.sysbios.family.arm.gicv3"), "ti.sysbios.family.arm.gicv3.Hwi.Type_FIQ", 1));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode_NODE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode", "ti.sysbios.family.arm.gicv3"), "ti.sysbios.family.arm.gicv3.Hwi.RoutingMode_NODE", 0));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode_ALL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode", "ti.sysbios.family.arm.gicv3"), "ti.sysbios.family.arm.gicv3.Hwi.RoutingMode_ALL", 1));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.gicd", new Extern("ti_sysbios_family_arm_gicv3_Hwi_gicd", "ti_sysbios_family_arm_gicv3_Hwi_Gicd*", false, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.getStackInfo", new Extern("ti_sysbios_family_arm_gicv3_Hwi_getStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.getCoreStackInfo", new Extern("ti_sysbios_family_arm_gicv3_Hwi_getCoreStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.startup", new Extern("ti_sysbios_family_arm_gicv3_Hwi_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.switchFromBootStack", new Extern("ti_sysbios_family_arm_gicv3_Hwi_switchFromBootStack__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.post", new Extern("ti_sysbios_family_arm_gicv3_Hwi_post__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.getTaskSP", new Extern("ti_sysbios_family_arm_gicv3_Hwi_getTaskSP__E", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.disableInterrupt", new Extern("ti_sysbios_family_arm_gicv3_Hwi_disableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.enableInterrupt", new Extern("ti_sysbios_family_arm_gicv3_Hwi_enableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.restoreInterrupt", new Extern("ti_sysbios_family_arm_gicv3_Hwi_restoreInterrupt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.clearInterrupt", new Extern("ti_sysbios_family_arm_gicv3_Hwi_clearInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.disableFxn", new Extern("ti_sysbios_family_arm_gicv3_Hwi_disableFxn__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.enableFxn", new Extern("ti_sysbios_family_arm_gicv3_Hwi_enableFxn__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.restoreFxn", new Extern("ti_sysbios_family_arm_gicv3_Hwi_restoreFxn__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.getHandle", new Extern("ti_sysbios_family_arm_gicv3_Hwi_getHandle__E", "ti_sysbios_family_arm_gicv3_Hwi_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.init", new Extern("ti_sysbios_family_arm_gicv3_Hwi_init__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.raiseSGI", new Extern("ti_sysbios_family_arm_gicv3_Hwi_raiseSGI__E", "xdc_Void(*)(ti_sysbios_family_arm_gicv3_Hwi_SgiIntAffinity,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.setPriority", new Extern("ti_sysbios_family_arm_gicv3_Hwi_setPriority__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.dispatchIRQ", new Extern("ti_sysbios_family_arm_gicv3_Hwi_dispatchIRQ__I", "xdc_Void(*)(xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.dispatchIRQC", new Extern("ti_sysbios_family_arm_gicv3_Hwi_dispatchIRQC__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.excDumpContext", new Extern("ti_sysbios_family_arm_gicv3_Hwi_excDumpContext__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.excHandler", new Extern("ti_sysbios_family_arm_gicv3_Hwi_excHandler__I", "xdc_Void(*)(xdc_UInt64*,ti_sysbios_family_arm_gicv3_Hwi_ExcType)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.initIntController", new Extern("ti_sysbios_family_arm_gicv3_Hwi_initIntController__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.initStacks", new Extern("ti_sysbios_family_arm_gicv3_Hwi_initStacks__I", "xdc_Void(*)(xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.nonPluggedHwiHandler", new Extern("ti_sysbios_family_arm_gicv3_Hwi_nonPluggedHwiHandler__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.postInit", new Extern("ti_sysbios_family_arm_gicv3_Hwi_postInit__I", "xdc_Int(*)(ti_sysbios_family_arm_gicv3_Hwi_Object*,xdc_runtime_Error_Block*)", true, false));
    }

    void Hwi$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$gicv3$Hwi$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.gicv3.Hwi.create() called before xdc.useModule('ti.sysbios.family.arm.gicv3.Hwi')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.intNum, inst.$args.hwiFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Module", "ti.sysbios.family.arm.gicv3"), om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Instance", "ti.sysbios.family.arm.gicv3"), 3, 2, false));
                        fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Params", "ti.sysbios.family.arm.gicv3"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$gicv3$Hwi$$create = function( intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.gicv3.Hwi'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.gicv3']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.gicv3.Hwi'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [intNum, hwiFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.gicv3.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Module", "ti.sysbios.family.arm.gicv3"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Object", "ti.sysbios.family.arm.gicv3"), null);
                        fxn.addArg(1, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Params", "ti.sysbios.family.arm.gicv3"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$gicv3$Hwi$$construct = function( __obj, intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.gicv3.Hwi'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.gicv3.Hwi'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.gicv3.Hwi'].__initObject(__inst);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.gicv3.Hwi$$inUseMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Module", "ti.sysbios.family.arm.gicv3"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
    }

    void Hwi$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.IntAffinity", "ti.sysbios.family.arm.gicv3");
        sizes.clear();
        sizes.add(Global.newArray("aff0", "UInt8"));
        sizes.add(Global.newArray("aff1", "UInt8"));
        sizes.add(Global.newArray("routingMode", "Nti.sysbios.family.arm.gicv3.Hwi.RoutingMode;;;"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.IntAffinity']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.IntAffinity']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.IntAffinity'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.SgiIntAffinity", "ti.sysbios.family.arm.gicv3");
        sizes.clear();
        sizes.add(Global.newArray("targetList", "UInt8"));
        sizes.add(Global.newArray("aff1", "UInt8"));
        sizes.add(Global.newArray("routingMode", "Nti.sysbios.family.arm.gicv3.Hwi.RoutingMode;;;"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.SgiIntAffinity']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.SgiIntAffinity']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.SgiIntAffinity'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ExcContext", "ti.sysbios.family.arm.gicv3");
        sizes.clear();
        sizes.add(Global.newArray("threadType", "Nti.sysbios.BIOS.ThreadType;;;;;"));
        sizes.add(Global.newArray("threadHandle", "UPtr"));
        sizes.add(Global.newArray("threadStack", "UPtr"));
        sizes.add(Global.newArray("threadStackSize", "USize"));
        sizes.add(Global.newArray("type", "Nti.sysbios.family.arm.gicv3.Hwi.ExcType;;;"));
        sizes.add(Global.newArray("x0", "UPtr"));
        sizes.add(Global.newArray("x1", "UPtr"));
        sizes.add(Global.newArray("x2", "UPtr"));
        sizes.add(Global.newArray("x3", "UPtr"));
        sizes.add(Global.newArray("x4", "UPtr"));
        sizes.add(Global.newArray("x5", "UPtr"));
        sizes.add(Global.newArray("x6", "UPtr"));
        sizes.add(Global.newArray("x7", "UPtr"));
        sizes.add(Global.newArray("x8", "UPtr"));
        sizes.add(Global.newArray("x9", "UPtr"));
        sizes.add(Global.newArray("x10", "UPtr"));
        sizes.add(Global.newArray("x11", "UPtr"));
        sizes.add(Global.newArray("x12", "UPtr"));
        sizes.add(Global.newArray("x13", "UPtr"));
        sizes.add(Global.newArray("x14", "UPtr"));
        sizes.add(Global.newArray("x15", "UPtr"));
        sizes.add(Global.newArray("x16", "UPtr"));
        sizes.add(Global.newArray("x17", "UPtr"));
        sizes.add(Global.newArray("x18", "UPtr"));
        sizes.add(Global.newArray("x19", "UPtr"));
        sizes.add(Global.newArray("x20", "UPtr"));
        sizes.add(Global.newArray("x21", "UPtr"));
        sizes.add(Global.newArray("x22", "UPtr"));
        sizes.add(Global.newArray("x23", "UPtr"));
        sizes.add(Global.newArray("x24", "UPtr"));
        sizes.add(Global.newArray("x25", "UPtr"));
        sizes.add(Global.newArray("x26", "UPtr"));
        sizes.add(Global.newArray("x27", "UPtr"));
        sizes.add(Global.newArray("x28", "UPtr"));
        sizes.add(Global.newArray("x29", "UPtr"));
        sizes.add(Global.newArray("x30", "UPtr"));
        sizes.add(Global.newArray("sp", "UPtr"));
        sizes.add(Global.newArray("elr", "UPtr"));
        sizes.add(Global.newArray("spsr", "UPtr"));
        sizes.add(Global.newArray("esr", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.ExcContext']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.ExcContext']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.ExcContext'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gicd", "ti.sysbios.family.arm.gicv3");
        sizes.clear();
        sizes.add(Global.newArray("CTLR", "UInt32"));
        sizes.add(Global.newArray("TYPER", "UInt32"));
        sizes.add(Global.newArray("IIDR", "UInt32"));
        sizes.add(Global.newArray("hole0", "A13;UInt32"));
        sizes.add(Global.newArray("SETSPI_NSR", "UInt32"));
        sizes.add(Global.newArray("hole1", "UInt32"));
        sizes.add(Global.newArray("CLRSPI_NSR", "UInt32"));
        sizes.add(Global.newArray("hole2", "UInt32"));
        sizes.add(Global.newArray("SETSPI_SR", "UInt32"));
        sizes.add(Global.newArray("hole3", "UInt32"));
        sizes.add(Global.newArray("CLRSPI_SR", "UInt32"));
        sizes.add(Global.newArray("hole4", "A9;UInt32"));
        sizes.add(Global.newArray("IGROUPR", "A32;UInt32"));
        sizes.add(Global.newArray("ISENABLER", "A32;UInt32"));
        sizes.add(Global.newArray("ICENABLER", "A32;UInt32"));
        sizes.add(Global.newArray("ISPENDR", "A32;UInt32"));
        sizes.add(Global.newArray("ICPENDR", "A32;UInt32"));
        sizes.add(Global.newArray("ISACTIVER", "A32;UInt32"));
        sizes.add(Global.newArray("ICACTIVER", "A32;UInt32"));
        sizes.add(Global.newArray("IPRIORITYR", "A992;UInt8"));
        sizes.add(Global.newArray("hole5", "A8;UInt32"));
        sizes.add(Global.newArray("ITARGETSR", "A8;UInt32"));
        sizes.add(Global.newArray("hole6", "A248;UInt32"));
        sizes.add(Global.newArray("ICFGR", "A64;UInt32"));
        sizes.add(Global.newArray("IGRPMODR", "A32;UInt32"));
        sizes.add(Global.newArray("hole7", "A32;UInt32"));
        sizes.add(Global.newArray("NSACR", "A64;UInt32"));
        sizes.add(Global.newArray("SGIR", "UInt32"));
        sizes.add(Global.newArray("hole8", "A3;UInt32"));
        sizes.add(Global.newArray("CPENDSGIR", "A4;UInt32"));
        sizes.add(Global.newArray("SPENDSGIR", "A4;UInt32"));
        sizes.add(Global.newArray("hole9", "A5172;UInt32"));
        sizes.add(Global.newArray("IROUTER", "A992;UInt64"));
        sizes.add(Global.newArray("hole10", "A4160;UInt32"));
        sizes.add(Global.newArray("ESTATUSR", "UInt32"));
        sizes.add(Global.newArray("ERRTESTR", "UInt32"));
        sizes.add(Global.newArray("hole11", "A31;UInt32"));
        sizes.add(Global.newArray("SPISR", "A30;UInt32"));
        sizes.add(Global.newArray("hole12", "A4021;UInt32"));
        sizes.add(Global.newArray("PIDR4", "UInt32"));
        sizes.add(Global.newArray("PIDR5", "UInt32"));
        sizes.add(Global.newArray("PIDR6", "UInt32"));
        sizes.add(Global.newArray("PIDR7", "UInt32"));
        sizes.add(Global.newArray("PIDR0", "UInt32"));
        sizes.add(Global.newArray("PIDR1", "UInt32"));
        sizes.add(Global.newArray("PIDR2", "UInt32"));
        sizes.add(Global.newArray("PIDR3", "UInt32"));
        sizes.add(Global.newArray("CIDR0", "UInt32"));
        sizes.add(Global.newArray("CIDR1", "UInt32"));
        sizes.add(Global.newArray("CIDR2", "UInt32"));
        sizes.add(Global.newArray("CIDR3", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gicd']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gicd']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gicd'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gicr", "ti.sysbios.family.arm.gicv3");
        sizes.clear();
        sizes.add(Global.newArray("CTLR", "UInt32"));
        sizes.add(Global.newArray("IIDR", "UInt32"));
        sizes.add(Global.newArray("TYPER", "A2;UInt32"));
        sizes.add(Global.newArray("hole0", "UInt32"));
        sizes.add(Global.newArray("WAKER", "UInt32"));
        sizes.add(Global.newArray("hole1", "A22;UInt32"));
        sizes.add(Global.newArray("PROPBASER", "A2;UInt32"));
        sizes.add(Global.newArray("PENDBASER", "A2;UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gicr']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gicr']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gicr'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gics", "ti.sysbios.family.arm.gicv3");
        sizes.clear();
        sizes.add(Global.newArray("hole0", "A32;UInt32"));
        sizes.add(Global.newArray("IGROUPR0", "UInt32"));
        sizes.add(Global.newArray("hole1", "A31;UInt32"));
        sizes.add(Global.newArray("ISENABLER0", "UInt32"));
        sizes.add(Global.newArray("hole2", "A31;UInt32"));
        sizes.add(Global.newArray("ICENABLER0", "UInt32"));
        sizes.add(Global.newArray("hole3", "A31;UInt32"));
        sizes.add(Global.newArray("ISPENDR0", "UInt32"));
        sizes.add(Global.newArray("hole4", "A31;UInt32"));
        sizes.add(Global.newArray("ICPENDR0", "UInt32"));
        sizes.add(Global.newArray("hole5", "A31;UInt32"));
        sizes.add(Global.newArray("ISACTIVER0", "UInt32"));
        sizes.add(Global.newArray("hole6", "A31;UInt32"));
        sizes.add(Global.newArray("ICACTIVER0", "UInt32"));
        sizes.add(Global.newArray("hole7", "A31;UInt32"));
        sizes.add(Global.newArray("IPRIORITYR", "A32;UInt8"));
        sizes.add(Global.newArray("hole8", "A504;UInt32"));
        sizes.add(Global.newArray("ICFGR", "A2;UInt32"));
        sizes.add(Global.newArray("hole9", "A62;UInt32"));
        sizes.add(Global.newArray("IGRPMODR0", "UInt32"));
        sizes.add(Global.newArray("hole10", "A63;UInt32"));
        sizes.add(Global.newArray("NSACR", "UInt32"));
        sizes.add(Global.newArray("hole11", "A11391;UInt32"));
        sizes.add(Global.newArray("MISCSTATUSR", "UInt32"));
        sizes.add(Global.newArray("hole12", "A31;UInt32"));
        sizes.add(Global.newArray("PPISR", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gics']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gics']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gics'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gicc", "ti.sysbios.family.arm.gicv3");
        sizes.clear();
        sizes.add(Global.newArray("CTLR", "UInt32"));
        sizes.add(Global.newArray("PMR", "UInt32"));
        sizes.add(Global.newArray("BPR", "UInt32"));
        sizes.add(Global.newArray("IAR", "UInt32"));
        sizes.add(Global.newArray("EOIR", "UInt32"));
        sizes.add(Global.newArray("RPR", "UInt32"));
        sizes.add(Global.newArray("HPPIR", "UInt32"));
        sizes.add(Global.newArray("ABPR", "UInt32"));
        sizes.add(Global.newArray("AIAR", "UInt32"));
        sizes.add(Global.newArray("AEOIR", "UInt32"));
        sizes.add(Global.newArray("AHPPIR", "UInt32"));
        sizes.add(Global.newArray("hole0", "A41;UInt32"));
        sizes.add(Global.newArray("APR0", "UInt32"));
        sizes.add(Global.newArray("hole1", "A3;UInt32"));
        sizes.add(Global.newArray("NSAPR0", "UInt32"));
        sizes.add(Global.newArray("hole2", "A6;UInt32"));
        sizes.add(Global.newArray("IIDR", "UInt32"));
        sizes.add(Global.newArray("hole3", "A960;UInt32"));
        sizes.add(Global.newArray("DIR", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gicc']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gicc']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Gicc'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.GicRegisterMap", "ti.sysbios.family.arm.gicv3");
        sizes.clear();
        sizes.add(Global.newArray("gicr", "UPtr"));
        sizes.add(Global.newArray("gics", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.GicRegisterMap']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.GicRegisterMap']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.GicRegisterMap'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Instance_State", "ti.sysbios.family.arm.gicv3");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("type", "Nti.sysbios.family.arm.gicv3.Hwi.Type;;;"));
        sizes.add(Global.newArray("priority", "UInt"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("irp", "UIArg"));
        sizes.add(Global.newArray("hookEnv", "UPtr"));
        sizes.add(Global.newArray("triggerSensitivity", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Module_State", "ti.sysbios.family.arm.gicv3");
        sizes.clear();
        sizes.add(Global.newArray("isrStack", "UPtr"));
        sizes.add(Global.newArray("hwiStack", "UPtr"));
        sizes.add(Global.newArray("isrStackSize", "UPtr"));
        sizes.add(Global.newArray("iser", "A32;UInt32"));
        sizes.add(Global.newArray("icfgr", "UPtr"));
        sizes.add(Global.newArray("spuriousInts", "UInt"));
        sizes.add(Global.newArray("lastSpuriousInt", "UInt"));
        sizes.add(Global.newArray("irp", "UInt"));
        sizes.add(Global.newArray("isrStackBase", "UPtr"));
        sizes.add(Global.newArray("dispatchTable", "UPtr"));
        sizes.add(Global.newArray("curIntId", "UInt"));
        sizes.add(Global.newArray("intAffinity", "UPtr"));
        sizes.add(Global.newArray("excActive", "UPtr"));
        sizes.add(Global.newArray("excContext", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gicv3.Hwi.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Hwi$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/gicv3/Hwi.xs");
        om.bind("ti.sysbios.family.arm.gicv3.Hwi$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Module", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.Module", om.findStrict("ti.sysbios.interfaces.IHwi.Module", "ti.sysbios.family.arm.gicv3"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("enableSecureMode", $$T_Bool, false, "w");
            po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("NUM_PRIORITY_BITS", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("MIN_INT_PRIORITY", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("DEFAULT_INT_PRIORITY", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("BPR", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.gicv3"), $$UNDEF, "wh");
            po.addFld("enableDecode", $$T_Bool, true, "w");
            po.addFld("excContextBuffer", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "wh");
            po.addFld("syncExcHookFunc", new Proto.Arr(new Proto.Adr("xdc_Void(*)(ti_sysbios_family_arm_gicv3_Hwi_ExcContext*)", "PFv"), false), $$DEFAULT, "w");
            po.addFld("sErrorExcHookFunc", new Proto.Arr(new Proto.Adr("xdc_Void(*)(ti_sysbios_family_arm_gicv3_Hwi_ExcContext*)", "PFv"), false), $$DEFAULT, "w");
            po.addFld("irqStackSection", $$T_Str, null, "wh");
            po.addFld("A_badSGIIntNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.gicv3"), Global.newObject("msg", "A_badSGIIntNum: SGI intNum should be <= 15."), "w");
            po.addFld("E_alreadyDefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.gicv3"), Global.newObject("msg", "E_alreadyDefined: Hwi already defined, intnum: %d"), "w");
            po.addFld("E_handleNotFound", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.gicv3"), Global.newObject("msg", "E_handleNotFound: Hwi handle not found: 0x%x"), "w");
            po.addFld("E_undefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.gicv3"), Global.newObject("msg", "E_undefined: Hwi undefined, intnum: %d"), "w");
            po.addFld("E_badIntNum", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.gicv3"), Global.newObject("msg", "E_badIntNum, intnum: %d is out of range"), "w");
            po.addFld("LM_begin", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arm.gicv3"), Global.newObject("mask", Global.eval("0x0100 | 0x0200"), "msg", "LM_begin: hwi: 0x%x, func: 0x%x, preThread: %d, intNum: %d, irp: 0x%x"), "w");
            po.addFld("LD_end", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arm.gicv3"), Global.newObject("mask", 0x0200L, "msg", "LD_end: hwi: 0x%x"), "w");
            po.addFld("intAffinity", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.IntAffinity", "ti.sysbios.family.arm.gicv3"), false), $$DEFAULT, "wh");
            po.addFld("gicMap", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.GicRegisterMap", "ti.sysbios.family.arm.gicv3"), false), $$DEFAULT, "w");
            po.addFld("NUM_GICD_ENABLE_REGS", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("initGicd", $$T_Bool, true, "w");
            po.addFld("swiDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("swiRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("taskDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("taskRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("hooks", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.HookSet", "ti.sysbios.family.arm.gicv3"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("interrupt", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.InterruptObj", "ti.sysbios.family.arm.gicv3"), false), $$DEFAULT, "wh");
            po.addFld("gicdBaseAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
            po.addFld("gicrBaseAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$create", "ti.sysbios.family.arm.gicv3"), Global.get("ti$sysbios$family$arm$gicv3$Hwi$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$construct", "ti.sysbios.family.arm.gicv3"), Global.get("ti$sysbios$family$arm$gicv3$Hwi$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gicv3.Hwi$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gicv3.Hwi$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gicv3.Hwi$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gicv3.Hwi$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gicv3.Hwi$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gicv3.Hwi$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "addHookSet");
                if (fxn != null) po.addFxn("addHookSet", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$addHookSet", "ti.sysbios.family.arm.gicv3"), fxn);
                fxn = Global.get(cap, "viewGetStackInfo");
                if (fxn != null) po.addFxn("viewGetStackInfo", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$viewGetStackInfo", "ti.sysbios.family.arm.gicv3"), fxn);
                po.addFxn("inUseMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$inUseMeta", "ti.sysbios.family.arm.gicv3"), Global.get(cap, "inUseMeta"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Instance", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.Instance", om.findStrict("ti.sysbios.interfaces.IHwi.Instance", "ti.sysbios.family.arm.gicv3"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Type", "ti.sysbios.family.arm.gicv3"), om.find("ti.sysbios.family.arm.gicv3.Hwi.Type_IRQ"), "w");
            po.addFld("triggerSensitivity", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
            po.addFld("maskSetting", (Proto)om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.gicv3"), om.find("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.gicv3"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Params", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.Params", om.findStrict("ti.sysbios.interfaces.IHwi$$Params", "ti.sysbios.family.arm.gicv3"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Type", "ti.sysbios.family.arm.gicv3"), om.find("ti.sysbios.family.arm.gicv3.Hwi.Type_IRQ"), "w");
            po.addFld("triggerSensitivity", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
            po.addFld("maskSetting", (Proto)om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.gicv3"), om.find("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.gicv3"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Object", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.Object", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Instance", "ti.sysbios.family.arm.gicv3"));
        // struct Hwi.IntAffinity
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$IntAffinity", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.IntAffinity", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("aff0", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("aff1", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("routingMode", (Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode", "ti.sysbios.family.arm.gicv3"), $$UNDEF, "w");
        // struct Hwi.SgiIntAffinity
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$SgiIntAffinity", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.SgiIntAffinity", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("targetList", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("aff1", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("routingMode", (Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode", "ti.sysbios.family.arm.gicv3"), $$UNDEF, "w");
        // typedef Hwi.ExceptionHookFuncPtr
        om.bind("ti.sysbios.family.arm.gicv3.Hwi.ExceptionHookFuncPtr", new Proto.Adr("xdc_Void(*)(ti_sysbios_family_arm_gicv3_Hwi_ExcContext*)", "PFv"));
        // struct Hwi.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$BasicView", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halHwiHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("absolutePriority", $$T_Str, $$UNDEF, "w");
                po.addFld("relativeGrpPriority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("relativeSubPriority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
        // struct Hwi.DetailedView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$DetailedView", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.DetailedView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halHwiHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("absolutePriority", $$T_Str, $$UNDEF, "w");
                po.addFld("relativeGrpPriority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("relativeSubPriority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("enabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("pending", $$T_Bool, $$UNDEF, "w");
                po.addFld("triggerSensitivity", $$T_Str, $$UNDEF, "w");
        // struct Hwi.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$ModuleView", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("options", new Proto.Arr($$T_Str, false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("spuriousInterrupts", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("lastSpuriousInterrupt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("hwiStackPeak", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("hwiStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Hwi.ExcContext
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$ExcContext", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.ExcContext", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("threadType", (Proto)om.findStrict("ti.sysbios.BIOS.ThreadType", "ti.sysbios.family.arm.gicv3"), $$UNDEF, "w");
                po.addFld("threadHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("threadStack", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("threadStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ExcType", "ti.sysbios.family.arm.gicv3"), $$UNDEF, "w");
                po.addFld("x0", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x1", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x2", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x3", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x4", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x5", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x6", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x7", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x8", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x9", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x10", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x11", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x12", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x13", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x14", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x15", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x16", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x17", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x18", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x19", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x20", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x21", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x22", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x23", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x24", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x25", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x26", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x27", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x28", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x29", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("x30", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("sp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("elr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("spsr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("esr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Hwi.Gicd
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Gicd", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.Gicd", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("CTLR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TYPER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IIDR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole0", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(13L)), $$DEFAULT, "w");
                po.addFld("SETSPI_NSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CLRSPI_NSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SETSPI_SR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CLRSPI_SR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole4", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(9L)), $$DEFAULT, "w");
                po.addFld("IGROUPR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ISENABLER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ICENABLER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ISPENDR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ICPENDR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ISACTIVER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ICACTIVER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("IPRIORITYR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false, xdc.services.intern.xsr.Enum.intValue(992L)), $$DEFAULT, "w");
                po.addFld("hole5", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("ITARGETSR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("hole6", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(248L)), $$DEFAULT, "w");
                po.addFld("ICFGR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("IGRPMODR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("hole7", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("NSACR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("SGIR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole8", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "w");
                po.addFld("CPENDSGIR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("SPENDSGIR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("hole9", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(5172L)), $$DEFAULT, "w");
                po.addFld("IROUTER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt64)"), false, xdc.services.intern.xsr.Enum.intValue(992L)), $$DEFAULT, "w");
                po.addFld("hole10", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(4160L)), $$DEFAULT, "w");
                po.addFld("ESTATUSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ERRTESTR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole11", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(31L)), $$DEFAULT, "w");
                po.addFld("SPISR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(30L)), $$DEFAULT, "w");
                po.addFld("hole12", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(4021L)), $$DEFAULT, "w");
                po.addFld("PIDR4", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PIDR5", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PIDR6", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PIDR7", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PIDR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PIDR1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PIDR2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PIDR3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CIDR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CIDR1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CIDR2", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CIDR3", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Hwi.Gicr
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Gicr", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.Gicr", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("CTLR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IIDR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TYPER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("hole0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("WAKER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole1", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(22L)), $$DEFAULT, "w");
                po.addFld("PROPBASER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("PENDBASER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
        // struct Hwi.Gics
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Gics", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.Gics", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("hole0", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("IGROUPR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole1", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(31L)), $$DEFAULT, "w");
                po.addFld("ISENABLER0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole2", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(31L)), $$DEFAULT, "w");
                po.addFld("ICENABLER0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole3", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(31L)), $$DEFAULT, "w");
                po.addFld("ISPENDR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole4", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(31L)), $$DEFAULT, "w");
                po.addFld("ICPENDR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole5", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(31L)), $$DEFAULT, "w");
                po.addFld("ISACTIVER0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole6", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(31L)), $$DEFAULT, "w");
                po.addFld("ICACTIVER0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole7", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(31L)), $$DEFAULT, "w");
                po.addFld("IPRIORITYR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("hole8", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(504L)), $$DEFAULT, "w");
                po.addFld("ICFGR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("hole9", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(62L)), $$DEFAULT, "w");
                po.addFld("IGRPMODR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole10", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(63L)), $$DEFAULT, "w");
                po.addFld("NSACR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole11", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(11391L)), $$DEFAULT, "w");
                po.addFld("MISCSTATUSR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole12", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(31L)), $$DEFAULT, "w");
                po.addFld("PPISR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Hwi.Gicc
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Gicc", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.Gicc", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("CTLR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("PMR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BPR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IAR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EOIR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RPR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("HPPIR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ABPR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("AIAR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("AEOIR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("AHPPIR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole0", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(41L)), $$DEFAULT, "w");
                po.addFld("APR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole1", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "w");
                po.addFld("NSAPR0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole2", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(6L)), $$DEFAULT, "w");
                po.addFld("IIDR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole3", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(960L)), $$DEFAULT, "w");
                po.addFld("DIR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Hwi.GicRegisterMap
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$GicRegisterMap", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.GicRegisterMap", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("gicr", new Proto.Adr("ti_sysbios_family_arm_gicv3_Hwi_Gicr*", "PS"), $$UNDEF, "w");
                po.addFld("gics", new Proto.Adr("ti_sysbios_family_arm_gicv3_Hwi_Gics*", "PS"), $$UNDEF, "w");
        // struct Hwi.InterruptObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$InterruptObj", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.InterruptObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("used", $$T_Bool, $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
        // struct Hwi.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Instance_State", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Type", "ti.sysbios.family.arm.gicv3"), $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("hookEnv", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "w");
                po.addFld("triggerSensitivity", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Hwi.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Module_State", "ti.sysbios.family.arm.gicv3");
        po.init("ti.sysbios.family.arm.gicv3.Hwi.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("isrStack", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false), $$DEFAULT, "w");
                po.addFld("hwiStack", new Proto.Arr(new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), false), $$DEFAULT, "w");
                po.addFld("isrStackSize", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("iser", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("icfgr", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), $$DEFAULT, "w");
                po.addFld("spuriousInts", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("lastSpuriousInt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("irp", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("isrStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("dispatchTable", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Handle", "ti.sysbios.family.arm.gicv3"), false), $$DEFAULT, "w");
                po.addFld("curIntId", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("intAffinity", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.IntAffinity", "ti.sysbios.family.arm.gicv3"), false), $$DEFAULT, "w");
                po.addFld("excActive", new Proto.Arr($$T_Bool, false), $$DEFAULT, "w");
                po.addFld("excContext", new Proto.Arr(new Proto.Adr("ti_sysbios_family_arm_gicv3_Hwi_ExcContext*", "PS"), false), $$DEFAULT, "w");
    }

    void Hwi$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi", "ti.sysbios.family.arm.gicv3");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Instance_State", "ti.sysbios.family.arm.gicv3");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("IntAffinity$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.IntAffinity", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$IntAffinity", "ti.sysbios.family.arm.gicv3");
        vo.bind("SgiIntAffinity$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.SgiIntAffinity", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$SgiIntAffinity", "ti.sysbios.family.arm.gicv3");
        vo.bind("ExcContext$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.ExcContext", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$ExcContext", "ti.sysbios.family.arm.gicv3");
        vo.bind("Gicd$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.Gicd", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Gicd", "ti.sysbios.family.arm.gicv3");
        vo.bind("Gicr$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.Gicr", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Gicr", "ti.sysbios.family.arm.gicv3");
        vo.bind("Gics$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.Gics", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Gics", "ti.sysbios.family.arm.gicv3");
        vo.bind("Gicc$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.Gicc", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Gicc", "ti.sysbios.family.arm.gicv3");
        vo.bind("GicRegisterMap$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.GicRegisterMap", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$GicRegisterMap", "ti.sysbios.family.arm.gicv3");
        po.bind("gicr$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.Gicr", "isScalar", false));
        po.bind("gics$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.Gics", "isScalar", false));
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Instance_State", "ti.sysbios.family.arm.gicv3");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$Module_State", "ti.sysbios.family.arm.gicv3");
        po.bind("icfgr$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt32", "isScalar", true));
        po.bind("dispatchTable$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
        po.bind("intAffinity$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gicv3.Hwi.IntAffinity", "isScalar", false));
        po.bind("excActive$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Bool", "isScalar", true));
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.gicv3.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.gicv3"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/gicv3/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.gicv3"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.gicv3"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.gicv3"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.gicv3"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.gicv3"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.gicv3"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.gicv3", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.gicv3");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.gicv3.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.gicv3'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.gicv3$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.gicv3$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.gicv3$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.gicv3.aa53fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.gicv3.aa53fg', {target: 'gnu.targets.arm.A53F', suffix: 'a53fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Hwi$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi", "ti.sysbios.family.arm.gicv3");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Module", "ti.sysbios.family.arm.gicv3");
        vo.init2(po, "ti.sysbios.family.arm.gicv3.Hwi", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi$$capsule", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Instance", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Params", "ti.sysbios.family.arm.gicv3"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Params", "ti.sysbios.family.arm.gicv3")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Handle", "ti.sysbios.family.arm.gicv3"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.gicv3", "ti.sysbios.family.arm.gicv3"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.IHwi.FuncPtr", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Irp", om.findStrict("ti.sysbios.interfaces.IHwi.Irp", "ti.sysbios.family.arm.gicv3"));
        vo.bind("HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.gicv3"));
        vo.bind("MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.gicv3"));
        vo.bind("StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.gicv3"));
        mcfgs.add("dispatcherAutoNestingSupport");
        mcfgs.add("dispatcherSwiSupport");
        mcfgs.add("dispatcherTaskSupport");
        mcfgs.add("dispatcherIrpTrackingSupport");
        mcfgs.add("enableSecureMode");
        mcfgs.add("NUM_INTERRUPTS");
        mcfgs.add("NUM_PRIORITY_BITS");
        mcfgs.add("MIN_INT_PRIORITY");
        mcfgs.add("DEFAULT_INT_PRIORITY");
        mcfgs.add("BPR");
        vo.bind("ExcType", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ExcType", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Type", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Type", "ti.sysbios.family.arm.gicv3"));
        vo.bind("RoutingMode", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode", "ti.sysbios.family.arm.gicv3"));
        vo.bind("IntAffinity", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.IntAffinity", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.IntAffinity", "ti.sysbios.family.arm.gicv3"));
        vo.bind("SgiIntAffinity", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.SgiIntAffinity", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.SgiIntAffinity", "ti.sysbios.family.arm.gicv3"));
        vo.bind("ExceptionHookFuncPtr", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ExceptionHookFuncPtr", "ti.sysbios.family.arm.gicv3"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.BasicView", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.BasicView", "ti.sysbios.family.arm.gicv3"));
        vo.bind("DetailedView", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.DetailedView", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.DetailedView", "ti.sysbios.family.arm.gicv3"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ModuleView", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ModuleView", "ti.sysbios.family.arm.gicv3"));
        vo.bind("ExcContext", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ExcContext", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ExcContext", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Gicd", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gicd", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gicd", "ti.sysbios.family.arm.gicv3"));
        vo.bind("gicd", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.gicd", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Gicr", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gicr", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gicr", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Gics", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gics", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gics", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Gicc", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gicc", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Gicc", "ti.sysbios.family.arm.gicv3"));
        mcfgs.add("enableDecode");
        mcfgs.add("syncExcHookFunc");
        mcfgs.add("sErrorExcHookFunc");
        mcfgs.add("A_badSGIIntNum");
        mcfgs.add("E_alreadyDefined");
        mcfgs.add("E_handleNotFound");
        mcfgs.add("E_undefined");
        mcfgs.add("E_badIntNum");
        mcfgs.add("LM_begin");
        mcfgs.add("LD_end");
        vo.bind("GicRegisterMap", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.GicRegisterMap", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.GicRegisterMap", "ti.sysbios.family.arm.gicv3"));
        mcfgs.add("gicMap");
        icfgs.add("gicMap");
        mcfgs.add("NUM_GICD_ENABLE_REGS");
        icfgs.add("NUM_GICD_ENABLE_REGS");
        mcfgs.add("initGicd");
        icfgs.add("initGicd");
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
        vo.bind("InterruptObj", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.InterruptObj", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.InterruptObj", "ti.sysbios.family.arm.gicv3"));
        icfgs.add("interrupt");
        icfgs.add("gicdBaseAddress");
        icfgs.add("gicrBaseAddress");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Instance_State", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Instance_State", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Module_State", "ti.sysbios.family.arm.gicv3"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Module_State", "ti.sysbios.family.arm.gicv3"));
        vo.bind("MaskingOption_NONE", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_NONE", "ti.sysbios.family.arm.gicv3"));
        vo.bind("MaskingOption_ALL", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_ALL", "ti.sysbios.family.arm.gicv3"));
        vo.bind("MaskingOption_SELF", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_SELF", "ti.sysbios.family.arm.gicv3"));
        vo.bind("MaskingOption_BITMASK", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_BITMASK", "ti.sysbios.family.arm.gicv3"));
        vo.bind("MaskingOption_LOWER", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER", "ti.sysbios.family.arm.gicv3"));
        vo.bind("ExcType_Synchronous", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ExcType_Synchronous", "ti.sysbios.family.arm.gicv3"));
        vo.bind("ExcType_SError", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.ExcType_SError", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Type_IRQ", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Type_IRQ", "ti.sysbios.family.arm.gicv3"));
        vo.bind("Type_FIQ", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Type_FIQ", "ti.sysbios.family.arm.gicv3"));
        vo.bind("RoutingMode_NODE", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode_NODE", "ti.sysbios.family.arm.gicv3"));
        vo.bind("RoutingMode_ALL", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.RoutingMode_ALL", "ti.sysbios.family.arm.gicv3"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.gicv3")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.gicv3.Hwi$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$gicv3$Hwi$$__initObject"));
        }//isCFG
        vo.bind("getStackInfo", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.getStackInfo", "ti.sysbios.family.arm.gicv3"));
        vo.bind("getCoreStackInfo", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.getCoreStackInfo", "ti.sysbios.family.arm.gicv3"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.startup", "ti.sysbios.family.arm.gicv3"));
        vo.bind("switchFromBootStack", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.switchFromBootStack", "ti.sysbios.family.arm.gicv3"));
        vo.bind("post", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.post", "ti.sysbios.family.arm.gicv3"));
        vo.bind("getTaskSP", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.getTaskSP", "ti.sysbios.family.arm.gicv3"));
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.disableInterrupt", "ti.sysbios.family.arm.gicv3"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.enableInterrupt", "ti.sysbios.family.arm.gicv3"));
        vo.bind("restoreInterrupt", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.restoreInterrupt", "ti.sysbios.family.arm.gicv3"));
        vo.bind("clearInterrupt", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.clearInterrupt", "ti.sysbios.family.arm.gicv3"));
        vo.bind("disableFxn", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.disableFxn", "ti.sysbios.family.arm.gicv3"));
        vo.bind("enableFxn", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.enableFxn", "ti.sysbios.family.arm.gicv3"));
        vo.bind("restoreFxn", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.restoreFxn", "ti.sysbios.family.arm.gicv3"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.getHandle", "ti.sysbios.family.arm.gicv3"));
        vo.bind("init", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.init", "ti.sysbios.family.arm.gicv3"));
        vo.bind("raiseSGI", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.raiseSGI", "ti.sysbios.family.arm.gicv3"));
        vo.bind("setPriority", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.setPriority", "ti.sysbios.family.arm.gicv3"));
        vo.bind("dispatchIRQ", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.dispatchIRQ", "ti.sysbios.family.arm.gicv3"));
        vo.bind("dispatchIRQC", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.dispatchIRQC", "ti.sysbios.family.arm.gicv3"));
        vo.bind("excDumpContext", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.excDumpContext", "ti.sysbios.family.arm.gicv3"));
        vo.bind("excHandler", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.excHandler", "ti.sysbios.family.arm.gicv3"));
        vo.bind("initIntController", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.initIntController", "ti.sysbios.family.arm.gicv3"));
        vo.bind("initStacks", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.initStacks", "ti.sysbios.family.arm.gicv3"));
        vo.bind("nonPluggedHwiHandler", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.nonPluggedHwiHandler", "ti.sysbios.family.arm.gicv3"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.postInit", "ti.sysbios.family.arm.gicv3"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_gicv3_Hwi_Handle__label__E", "ti_sysbios_family_arm_gicv3_Hwi_Module__startupDone__E", "ti_sysbios_family_arm_gicv3_Hwi_Object__create__E", "ti_sysbios_family_arm_gicv3_Hwi_Object__delete__E", "ti_sysbios_family_arm_gicv3_Hwi_Object__get__E", "ti_sysbios_family_arm_gicv3_Hwi_Object__first__E", "ti_sysbios_family_arm_gicv3_Hwi_Object__next__E", "ti_sysbios_family_arm_gicv3_Hwi_Params__init__E", "ti_sysbios_family_arm_gicv3_Hwi_getStackInfo__E", "ti_sysbios_family_arm_gicv3_Hwi_getCoreStackInfo__E", "ti_sysbios_family_arm_gicv3_Hwi_startup__E", "ti_sysbios_family_arm_gicv3_Hwi_switchFromBootStack__E", "ti_sysbios_family_arm_gicv3_Hwi_post__E", "ti_sysbios_family_arm_gicv3_Hwi_getTaskSP__E", "ti_sysbios_family_arm_gicv3_Hwi_disableInterrupt__E", "ti_sysbios_family_arm_gicv3_Hwi_enableInterrupt__E", "ti_sysbios_family_arm_gicv3_Hwi_restoreInterrupt__E", "ti_sysbios_family_arm_gicv3_Hwi_clearInterrupt__E", "ti_sysbios_family_arm_gicv3_Hwi_getFunc__E", "ti_sysbios_family_arm_gicv3_Hwi_setFunc__E", "ti_sysbios_family_arm_gicv3_Hwi_getHookContext__E", "ti_sysbios_family_arm_gicv3_Hwi_setHookContext__E", "ti_sysbios_family_arm_gicv3_Hwi_getIrp__E", "ti_sysbios_family_arm_gicv3_Hwi_disable__E", "ti_sysbios_family_arm_gicv3_Hwi_enable__E", "ti_sysbios_family_arm_gicv3_Hwi_restore__E", "ti_sysbios_family_arm_gicv3_Hwi_enableIRQ__E", "ti_sysbios_family_arm_gicv3_Hwi_disableIRQ__E", "ti_sysbios_family_arm_gicv3_Hwi_restoreIRQ__E", "ti_sysbios_family_arm_gicv3_Hwi_disableFxn__E", "ti_sysbios_family_arm_gicv3_Hwi_enableFxn__E", "ti_sysbios_family_arm_gicv3_Hwi_restoreFxn__E", "ti_sysbios_family_arm_gicv3_Hwi_getHandle__E", "ti_sysbios_family_arm_gicv3_Hwi_init__E", "ti_sysbios_family_arm_gicv3_Hwi_raiseSGI__E", "ti_sysbios_family_arm_gicv3_Hwi_setPriority__E", "ti_sysbios_family_arm_gicv3_Hwi_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray("LM_begin", "LD_end"));
        vo.bind("$$errorDescCfgs", Global.newArray("E_alreadyDefined", "E_handleNotFound", "E_undefined", "E_badIntNum"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_badSGIIntNum"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Object", "ti.sysbios.family.arm.gicv3"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Hwi", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Hwi");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.gicv3")).findStrict("PARAMS", "ti.sysbios.family.arm.gicv3");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi", "ti.sysbios.family.arm.gicv3")).findStrict("PARAMS", "ti.sysbios.family.arm.gicv3");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi", "ti.sysbios.family.arm.gicv3"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi", "ti.sysbios.family.arm.gicv3");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Detailed", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitDetailed", "structName", "DetailedView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.gicv3.Hwi")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.gicv3")).add(pkgV);
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
