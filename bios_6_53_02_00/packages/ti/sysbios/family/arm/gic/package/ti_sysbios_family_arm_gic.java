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

public class ti_sysbios_family_arm_gic
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
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.gic", new Value.Obj("ti.sysbios.family.arm.gic", pkgP));
    }

    void Hwi$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi", new Value.Obj("ti.sysbios.family.arm.gic.Hwi", po));
        pkgV.bind("Hwi", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.gic.Hwi.HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.gic"));
        om.bind("ti.sysbios.family.arm.gic.Hwi.MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.gic"));
        om.bind("ti.sysbios.family.arm.gic.Hwi.StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.gic"));
        om.bind("ti.sysbios.family.arm.gic.Hwi.Type", new Proto.Enm("ti.sysbios.family.arm.gic.Hwi.Type"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gic.Hwi.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi$$DetailedView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gic.Hwi.DetailedView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gic.Hwi.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi$$Gicd", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gic.Hwi.Gicd", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi$$Gicc", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gic.Hwi.Gicc", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi$$InterruptObj", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gic.Hwi.InterruptObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gic.Hwi.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gic.Hwi.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.gic.Hwi.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gic.Hwi.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.gic.Hwi$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.gic.Hwi.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.gic.Hwi.Object", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Instance_State", "ti.sysbios.family.arm.gic"));
        }//isROV
    }

    void Hwi$$CONSTS()
    {
        // module Hwi
        om.bind("ti.sysbios.family.arm.gic.Hwi.Type_IRQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Type", "ti.sysbios.family.arm.gic"), "ti.sysbios.family.arm.gic.Hwi.Type_IRQ", 0));
        om.bind("ti.sysbios.family.arm.gic.Hwi.Type_FIQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Type", "ti.sysbios.family.arm.gic"), "ti.sysbios.family.arm.gic.Hwi.Type_FIQ", 1));
        om.bind("ti.sysbios.family.arm.gic.Hwi.gicd", new Extern("ti_sysbios_family_arm_gic_Hwi_gicd", "ti_sysbios_family_arm_gic_Hwi_Gicd*", false, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.gicc", new Extern("ti_sysbios_family_arm_gic_Hwi_gicc", "ti_sysbios_family_arm_gic_Hwi_Gicc*", false, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.getStackInfo", new Extern("ti_sysbios_family_arm_gic_Hwi_getStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.getCoreStackInfo", new Extern("ti_sysbios_family_arm_gic_Hwi_getCoreStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.startup", new Extern("ti_sysbios_family_arm_gic_Hwi_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.switchFromBootStack", new Extern("ti_sysbios_family_arm_gic_Hwi_switchFromBootStack__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.post", new Extern("ti_sysbios_family_arm_gic_Hwi_post__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.getTaskSP", new Extern("ti_sysbios_family_arm_gic_Hwi_getTaskSP__E", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.disableInterrupt", new Extern("ti_sysbios_family_arm_gic_Hwi_disableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.enableInterrupt", new Extern("ti_sysbios_family_arm_gic_Hwi_enableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.restoreInterrupt", new Extern("ti_sysbios_family_arm_gic_Hwi_restoreInterrupt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.clearInterrupt", new Extern("ti_sysbios_family_arm_gic_Hwi_clearInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.disableFxn", new Extern("ti_sysbios_family_arm_gic_Hwi_disableFxn__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.enableFxn", new Extern("ti_sysbios_family_arm_gic_Hwi_enableFxn__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.restoreFxn", new Extern("ti_sysbios_family_arm_gic_Hwi_restoreFxn__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.getHandle", new Extern("ti_sysbios_family_arm_gic_Hwi_getHandle__E", "ti_sysbios_family_arm_gic_Hwi_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.init", new Extern("ti_sysbios_family_arm_gic_Hwi_init__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.initIntControllerCoreX", new Extern("ti_sysbios_family_arm_gic_Hwi_initIntControllerCoreX__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.raiseSGI", new Extern("ti_sysbios_family_arm_gic_Hwi_raiseSGI__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.setPriority", new Extern("ti_sysbios_family_arm_gic_Hwi_setPriority__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.postInit", new Extern("ti_sysbios_family_arm_gic_Hwi_postInit__I", "xdc_Int(*)(ti_sysbios_family_arm_gic_Hwi_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.initIntControllerCore0", new Extern("ti_sysbios_family_arm_gic_Hwi_initIntControllerCore0__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.initFIQStack", new Extern("ti_sysbios_family_arm_gic_Hwi_initFIQStack__I", "xdc_Void(*)(xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.dispatchFIQC", new Extern("ti_sysbios_family_arm_gic_Hwi_dispatchFIQC__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.dispatchIRQ", new Extern("ti_sysbios_family_arm_gic_Hwi_dispatchIRQ__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.dispatchIRQC", new Extern("ti_sysbios_family_arm_gic_Hwi_dispatchIRQC__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.gic.Hwi.nonPluggedHwiHandler", new Extern("ti_sysbios_family_arm_gic_Hwi_nonPluggedHwiHandler__I", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void Hwi$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$gic$Hwi$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.gic.Hwi.create() called before xdc.useModule('ti.sysbios.family.arm.gic.Hwi')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.intNum, inst.$args.hwiFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.gic.Hwi$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.gic.Hwi.Module", "ti.sysbios.family.arm.gic"), om.findStrict("ti.sysbios.family.arm.gic.Hwi.Instance", "ti.sysbios.family.arm.gic"), 3, 2, false));
                        fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Params", "ti.sysbios.family.arm.gic"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$gic$Hwi$$create = function( intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.gic.Hwi'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.gic.Hwi.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.gic']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.gic.Hwi'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [intNum, hwiFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.gic.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.gic.Hwi$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.gic.Hwi.Module", "ti.sysbios.family.arm.gic"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Object", "ti.sysbios.family.arm.gic"), null);
                        fxn.addArg(1, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Params", "ti.sysbios.family.arm.gic"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$gic$Hwi$$construct = function( __obj, intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.gic.Hwi'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.gic.Hwi'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.gic.Hwi'].__initObject(__inst);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.gic.Hwi$$inUseMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.gic.Hwi.Module", "ti.sysbios.family.arm.gic"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
    }

    void Hwi$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Gicd", "ti.sysbios.family.arm.gic");
        sizes.clear();
        sizes.add(Global.newArray("CTLR", "UInt32"));
        sizes.add(Global.newArray("TYPER", "UInt32"));
        sizes.add(Global.newArray("IIDR", "UInt32"));
        sizes.add(Global.newArray("hole0", "A29;UInt32"));
        sizes.add(Global.newArray("IGROUPR", "A32;UInt32"));
        sizes.add(Global.newArray("ISENABLER", "A32;UInt32"));
        sizes.add(Global.newArray("ICENABLER", "A32;UInt32"));
        sizes.add(Global.newArray("ISPENDR", "A32;UInt32"));
        sizes.add(Global.newArray("ICPENDR", "A32;UInt32"));
        sizes.add(Global.newArray("ISACTIVER", "A32;UInt32"));
        sizes.add(Global.newArray("ICACTIVER", "A32;UInt32"));
        sizes.add(Global.newArray("IPRIORITYR", "A255;UInt32"));
        sizes.add(Global.newArray("hole1", "A1;UInt32"));
        sizes.add(Global.newArray("ITARGETSR", "A255;UInt32"));
        sizes.add(Global.newArray("hole2", "A1;UInt32"));
        sizes.add(Global.newArray("ICFGR", "A64;UInt32"));
        sizes.add(Global.newArray("PPISR", "UInt32"));
        sizes.add(Global.newArray("SPISR", "A7;UInt32"));
        sizes.add(Global.newArray("hole3", "A120;UInt32"));
        sizes.add(Global.newArray("SGIR", "UInt32"));
        sizes.add(Global.newArray("hole4", "A3;UInt32"));
        sizes.add(Global.newArray("CPENDSGIR", "A4;UInt32"));
        sizes.add(Global.newArray("SPENDSGIR", "A4;UInt32"));
        sizes.add(Global.newArray("hole5", "A40;UInt32"));
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
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Gicd']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Gicd']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Gicd'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Gicc", "ti.sysbios.family.arm.gic");
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
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Gicc']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Gicc']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Gicc'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Instance_State", "ti.sysbios.family.arm.gic");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("type", "Nti.sysbios.family.arm.gic.Hwi.Type;;;"));
        sizes.add(Global.newArray("priority", "UInt"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("irp", "UIArg"));
        sizes.add(Global.newArray("hookEnv", "UPtr"));
        sizes.add(Global.newArray("triggerSensitivity", "UInt"));
        sizes.add(Global.newArray("targetProcList", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Module_State", "ti.sysbios.family.arm.gic");
        sizes.clear();
        sizes.add(Global.newArray("taskSP", "UPtr"));
        sizes.add(Global.newArray("isrStack", "UPtr"));
        sizes.add(Global.newArray("hwiStack", "UPtr"));
        sizes.add(Global.newArray("isrStackSize", "UPtr"));
        sizes.add(Global.newArray("iser", "A32;UInt32"));
        sizes.add(Global.newArray("icfgr", "UPtr"));
        sizes.add(Global.newArray("itargetsr", "UPtr"));
        sizes.add(Global.newArray("spuriousInts", "UInt"));
        sizes.add(Global.newArray("lastSpuriousInt", "UInt"));
        sizes.add(Global.newArray("irp", "UInt"));
        sizes.add(Global.newArray("isrStackBase", "UPtr"));
        sizes.add(Global.newArray("dispatchTable", "UPtr"));
        sizes.add(Global.newArray("curIntId", "UInt"));
        sizes.add(Global.newArray("igroupr", "UPtr"));
        sizes.add(Global.newArray("fiqStack", "UPtr"));
        sizes.add(Global.newArray("fiqStackSize", "USize"));
        sizes.add(Global.newArray("intAffinity", "UPtr"));
        sizes.add(Global.newArray("nonPluggedHwi", "Sti.sysbios.family.arm.gic.Hwi;Instance_State"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.gic.Hwi.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Hwi$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/gic/Hwi.xs");
        om.bind("ti.sysbios.family.arm.gic.Hwi$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Module", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.Module", om.findStrict("ti.sysbios.interfaces.IHwi.Module", "ti.sysbios.family.arm.gic"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("enableSecureMode", $$T_Bool, false, "w");
            po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("NUM_PRIORITY_BITS", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("MIN_INT_PRIORITY", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("DEFAULT_INT_PRIORITY", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("BPR", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("ABPR", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.gic"), $$UNDEF, "wh");
            po.addFld("resetFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("undefinedInstFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("svcFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("prefetchAbortFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("dataAbortFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("reservedFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("irqFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("fiqFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("enableAsidTagging", $$T_Bool, false, "w");
            po.addFld("initGicd", $$T_Bool, true, "w");
            po.addFld("irqStackSection", $$T_Str, null, "wh");
            po.addFld("fiqStack", new Proto.Adr("xdc_Ptr", "Pv"), null, "wh");
            po.addFld("fiqStacks", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "wh");
            po.addFld("fiqStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 1024L, "wh");
            po.addFld("fiqStackSection", $$T_Str, null, "wh");
            po.addFld("A_badSGIIntNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.gic"), Global.newObject("msg", "A_badSGIIntNum: SGI intNum should be <= 15."), "w");
            po.addFld("E_alreadyDefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.gic"), Global.newObject("msg", "E_alreadyDefined: Hwi already defined, intnum: %d"), "w");
            po.addFld("E_handleNotFound", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.gic"), Global.newObject("msg", "E_handleNotFound: Hwi handle not found: 0x%x"), "w");
            po.addFld("E_undefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.gic"), Global.newObject("msg", "E_undefined: Hwi undefined, intnum: %d"), "w");
            po.addFld("E_badIntNum", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.gic"), Global.newObject("msg", "E_badIntNum, intnum: %d is out of range"), "w");
            po.addFld("LM_begin", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arm.gic"), Global.newObject("mask", Global.eval("0x0100 | 0x0200"), "msg", "LM_begin: hwi: 0x%x, func: 0x%x, preThread: %d, intNum: %d, irp: 0x%x"), "w");
            po.addFld("LD_end", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arm.gic"), Global.newObject("mask", 0x0200L, "msg", "LD_end: hwi: 0x%x"), "w");
            po.addFld("intAffinity", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false), $$DEFAULT, "wh");
            po.addFld("swiDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("swiRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("taskDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("taskRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("hooks", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.HookSet", "ti.sysbios.family.arm.gic"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("interrupt", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.InterruptObj", "ti.sysbios.family.arm.gic"), false), $$DEFAULT, "wh");
            po.addFld("gicdBaseAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
            po.addFld("giccBaseAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$create", "ti.sysbios.family.arm.gic"), Global.get("ti$sysbios$family$arm$gic$Hwi$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$construct", "ti.sysbios.family.arm.gic"), Global.get("ti$sysbios$family$arm$gic$Hwi$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gic.Hwi$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gic.Hwi$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gic.Hwi$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gic.Hwi$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gic.Hwi$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.gic.Hwi$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "addHookSet");
                if (fxn != null) po.addFxn("addHookSet", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$addHookSet", "ti.sysbios.family.arm.gic"), fxn);
                fxn = Global.get(cap, "viewGetStackInfo");
                if (fxn != null) po.addFxn("viewGetStackInfo", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$viewGetStackInfo", "ti.sysbios.family.arm.gic"), fxn);
                po.addFxn("inUseMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$inUseMeta", "ti.sysbios.family.arm.gic"), Global.get(cap, "inUseMeta"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Instance", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.Instance", om.findStrict("ti.sysbios.interfaces.IHwi.Instance", "ti.sysbios.family.arm.gic"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Type", "ti.sysbios.family.arm.gic"), om.find("ti.sysbios.family.arm.gic.Hwi.Type_IRQ"), "w");
            po.addFld("triggerSensitivity", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "w");
            po.addFld("targetProcList", Proto.Elm.newCNum("(xdc_UInt)"), 0x0L, "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
            po.addFld("maskSetting", (Proto)om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.gic"), om.find("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.gic"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Params", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.Params", om.findStrict("ti.sysbios.interfaces.IHwi$$Params", "ti.sysbios.family.arm.gic"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Type", "ti.sysbios.family.arm.gic"), om.find("ti.sysbios.family.arm.gic.Hwi.Type_IRQ"), "w");
            po.addFld("triggerSensitivity", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "w");
            po.addFld("targetProcList", Proto.Elm.newCNum("(xdc_UInt)"), 0x0L, "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
            po.addFld("maskSetting", (Proto)om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.gic"), om.find("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.gic"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Object", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.Object", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Instance", "ti.sysbios.family.arm.gic"));
        // typedef Hwi.VectorFuncPtr
        om.bind("ti.sysbios.family.arm.gic.Hwi.VectorFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Hwi.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$BasicView", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.BasicView", null);
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
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$DetailedView", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.DetailedView", null);
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
                po.addFld("targetProcList", $$T_Str, $$UNDEF, "w");
        // struct Hwi.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$ModuleView", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("options", new Proto.Arr($$T_Str, false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("spuriousInterrupts", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("lastSpuriousInterrupt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("hwiStackPeak", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("hwiStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Hwi.Gicd
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Gicd", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.Gicd", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("CTLR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TYPER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IIDR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole0", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(29L)), $$DEFAULT, "w");
                po.addFld("IGROUPR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ISENABLER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ICENABLER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ISPENDR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ICPENDR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ISACTIVER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("ICACTIVER", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("IPRIORITYR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(255L)), $$DEFAULT, "w");
                po.addFld("hole1", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(1L)), $$DEFAULT, "w");
                po.addFld("ITARGETSR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(255L)), $$DEFAULT, "w");
                po.addFld("hole2", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(1L)), $$DEFAULT, "w");
                po.addFld("ICFGR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("PPISR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SPISR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(7L)), $$DEFAULT, "w");
                po.addFld("hole3", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(120L)), $$DEFAULT, "w");
                po.addFld("SGIR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole4", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "w");
                po.addFld("CPENDSGIR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("SPENDSGIR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("hole5", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(40L)), $$DEFAULT, "w");
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
        // struct Hwi.Gicc
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Gicc", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.Gicc", null);
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
        // struct Hwi.InterruptObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$InterruptObj", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.InterruptObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("used", $$T_Bool, $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
        // struct Hwi.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Instance_State", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Type", "ti.sysbios.family.arm.gic"), $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("hookEnv", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "w");
                po.addFld("triggerSensitivity", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("targetProcList", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Hwi.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Module_State", "ti.sysbios.family.arm.gic");
        po.init("ti.sysbios.family.arm.gic.Hwi.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("taskSP", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false), $$DEFAULT, "w");
                po.addFld("isrStack", new Proto.Arr(new Proto.Adr("xdc_Char*", "Pn"), false), $$DEFAULT, "w");
                po.addFld("hwiStack", new Proto.Arr(new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), false), $$DEFAULT, "w");
                po.addFld("isrStackSize", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("iser", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("icfgr", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), $$DEFAULT, "w");
                po.addFld("itargetsr", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), $$DEFAULT, "w");
                po.addFld("spuriousInts", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("lastSpuriousInt", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("irp", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("isrStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("dispatchTable", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Handle", "ti.sysbios.family.arm.gic"), false), $$DEFAULT, "w");
                po.addFld("curIntId", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("igroupr", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), $$DEFAULT, "w");
                po.addFld("fiqStack", new Proto.Arr(new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), false), $$DEFAULT, "w");
                po.addFld("fiqStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("intAffinity", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false), $$DEFAULT, "w");
                po.addFldV("nonPluggedHwi", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Object", "ti.sysbios.family.arm.gic"), $$DEFAULT, "wh", $$objFldGet, $$objFldSet);
                po.addFld("Object_field_nonPluggedHwi", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Object", "ti.sysbios.family.arm.gic"), $$DEFAULT, "w");
    }

    void Hwi$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi", "ti.sysbios.family.arm.gic");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Instance_State", "ti.sysbios.family.arm.gic");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Gicd$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gic.Hwi.Gicd", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Gicd", "ti.sysbios.family.arm.gic");
        vo.bind("Gicc$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gic.Hwi.Gicc", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Gicc", "ti.sysbios.family.arm.gic");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gic.Hwi.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Instance_State", "ti.sysbios.family.arm.gic");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.gic.Hwi.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi$$Module_State", "ti.sysbios.family.arm.gic");
        po.bind("icfgr$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt32", "isScalar", true));
        po.bind("itargetsr$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt32", "isScalar", true));
        po.bind("dispatchTable$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
        po.bind("igroupr$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt32", "isScalar", true));
        po.bind("intAffinity$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt8", "isScalar", true));
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.gic.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.gic"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/gic/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.gic"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.gic"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.gic"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.gic"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.gic"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.gic"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.gic", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.gic");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.gic.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.gic'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.gic$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.gic$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.gic$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.gic.aa9fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.gic.aa15fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.gic.aa9fg', {target: 'gnu.targets.arm.A9F', suffix: 'a9fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.gic.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Hwi$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi", "ti.sysbios.family.arm.gic");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Module", "ti.sysbios.family.arm.gic");
        vo.init2(po, "ti.sysbios.family.arm.gic.Hwi", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.gic.Hwi$$capsule", "ti.sysbios.family.arm.gic"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Instance", "ti.sysbios.family.arm.gic"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Params", "ti.sysbios.family.arm.gic"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Params", "ti.sysbios.family.arm.gic")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Handle", "ti.sysbios.family.arm.gic"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.gic", "ti.sysbios.family.arm.gic"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.IHwi.FuncPtr", "ti.sysbios.family.arm.gic"));
        vo.bind("Irp", om.findStrict("ti.sysbios.interfaces.IHwi.Irp", "ti.sysbios.family.arm.gic"));
        vo.bind("HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.gic"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arm.gic"));
        vo.bind("MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arm.gic"));
        vo.bind("StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.gic"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arm.gic"));
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
        mcfgs.add("ABPR");
        vo.bind("Type", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Type", "ti.sysbios.family.arm.gic"));
        vo.bind("VectorFuncPtr", om.findStrict("ti.sysbios.family.arm.gic.Hwi.VectorFuncPtr", "ti.sysbios.family.arm.gic"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.gic.Hwi.BasicView", "ti.sysbios.family.arm.gic"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gic.Hwi.BasicView", "ti.sysbios.family.arm.gic"));
        vo.bind("DetailedView", om.findStrict("ti.sysbios.family.arm.gic.Hwi.DetailedView", "ti.sysbios.family.arm.gic"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gic.Hwi.DetailedView", "ti.sysbios.family.arm.gic"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.gic.Hwi.ModuleView", "ti.sysbios.family.arm.gic"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gic.Hwi.ModuleView", "ti.sysbios.family.arm.gic"));
        vo.bind("Gicd", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Gicd", "ti.sysbios.family.arm.gic"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gic.Hwi.Gicd", "ti.sysbios.family.arm.gic"));
        vo.bind("gicd", om.findStrict("ti.sysbios.family.arm.gic.Hwi.gicd", "ti.sysbios.family.arm.gic"));
        vo.bind("Gicc", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Gicc", "ti.sysbios.family.arm.gic"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gic.Hwi.Gicc", "ti.sysbios.family.arm.gic"));
        vo.bind("gicc", om.findStrict("ti.sysbios.family.arm.gic.Hwi.gicc", "ti.sysbios.family.arm.gic"));
        mcfgs.add("enableAsidTagging");
        mcfgs.add("initGicd");
        mcfgs.add("A_badSGIIntNum");
        mcfgs.add("E_alreadyDefined");
        mcfgs.add("E_handleNotFound");
        mcfgs.add("E_undefined");
        mcfgs.add("E_badIntNum");
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
        vo.bind("InterruptObj", om.findStrict("ti.sysbios.family.arm.gic.Hwi.InterruptObj", "ti.sysbios.family.arm.gic"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gic.Hwi.InterruptObj", "ti.sysbios.family.arm.gic"));
        icfgs.add("interrupt");
        icfgs.add("gicdBaseAddress");
        icfgs.add("giccBaseAddress");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Instance_State", "ti.sysbios.family.arm.gic"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gic.Hwi.Instance_State", "ti.sysbios.family.arm.gic"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Module_State", "ti.sysbios.family.arm.gic"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.gic.Hwi.Module_State", "ti.sysbios.family.arm.gic"));
        vo.bind("MaskingOption_NONE", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_NONE", "ti.sysbios.family.arm.gic"));
        vo.bind("MaskingOption_ALL", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_ALL", "ti.sysbios.family.arm.gic"));
        vo.bind("MaskingOption_SELF", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_SELF", "ti.sysbios.family.arm.gic"));
        vo.bind("MaskingOption_BITMASK", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_BITMASK", "ti.sysbios.family.arm.gic"));
        vo.bind("MaskingOption_LOWER", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER", "ti.sysbios.family.arm.gic"));
        vo.bind("Type_IRQ", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Type_IRQ", "ti.sysbios.family.arm.gic"));
        vo.bind("Type_FIQ", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Type_FIQ", "ti.sysbios.family.arm.gic"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.gic")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.gic.Hwi$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$gic$Hwi$$__initObject"));
        }//isCFG
        vo.bind("getStackInfo", om.findStrict("ti.sysbios.family.arm.gic.Hwi.getStackInfo", "ti.sysbios.family.arm.gic"));
        vo.bind("getCoreStackInfo", om.findStrict("ti.sysbios.family.arm.gic.Hwi.getCoreStackInfo", "ti.sysbios.family.arm.gic"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.gic.Hwi.startup", "ti.sysbios.family.arm.gic"));
        vo.bind("switchFromBootStack", om.findStrict("ti.sysbios.family.arm.gic.Hwi.switchFromBootStack", "ti.sysbios.family.arm.gic"));
        vo.bind("post", om.findStrict("ti.sysbios.family.arm.gic.Hwi.post", "ti.sysbios.family.arm.gic"));
        vo.bind("getTaskSP", om.findStrict("ti.sysbios.family.arm.gic.Hwi.getTaskSP", "ti.sysbios.family.arm.gic"));
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.arm.gic.Hwi.disableInterrupt", "ti.sysbios.family.arm.gic"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.arm.gic.Hwi.enableInterrupt", "ti.sysbios.family.arm.gic"));
        vo.bind("restoreInterrupt", om.findStrict("ti.sysbios.family.arm.gic.Hwi.restoreInterrupt", "ti.sysbios.family.arm.gic"));
        vo.bind("clearInterrupt", om.findStrict("ti.sysbios.family.arm.gic.Hwi.clearInterrupt", "ti.sysbios.family.arm.gic"));
        vo.bind("disableFxn", om.findStrict("ti.sysbios.family.arm.gic.Hwi.disableFxn", "ti.sysbios.family.arm.gic"));
        vo.bind("enableFxn", om.findStrict("ti.sysbios.family.arm.gic.Hwi.enableFxn", "ti.sysbios.family.arm.gic"));
        vo.bind("restoreFxn", om.findStrict("ti.sysbios.family.arm.gic.Hwi.restoreFxn", "ti.sysbios.family.arm.gic"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arm.gic.Hwi.getHandle", "ti.sysbios.family.arm.gic"));
        vo.bind("init", om.findStrict("ti.sysbios.family.arm.gic.Hwi.init", "ti.sysbios.family.arm.gic"));
        vo.bind("initIntControllerCoreX", om.findStrict("ti.sysbios.family.arm.gic.Hwi.initIntControllerCoreX", "ti.sysbios.family.arm.gic"));
        vo.bind("raiseSGI", om.findStrict("ti.sysbios.family.arm.gic.Hwi.raiseSGI", "ti.sysbios.family.arm.gic"));
        vo.bind("setPriority", om.findStrict("ti.sysbios.family.arm.gic.Hwi.setPriority", "ti.sysbios.family.arm.gic"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.gic.Hwi.postInit", "ti.sysbios.family.arm.gic"));
        vo.bind("initIntControllerCore0", om.findStrict("ti.sysbios.family.arm.gic.Hwi.initIntControllerCore0", "ti.sysbios.family.arm.gic"));
        vo.bind("initFIQStack", om.findStrict("ti.sysbios.family.arm.gic.Hwi.initFIQStack", "ti.sysbios.family.arm.gic"));
        vo.bind("dispatchFIQC", om.findStrict("ti.sysbios.family.arm.gic.Hwi.dispatchFIQC", "ti.sysbios.family.arm.gic"));
        vo.bind("dispatchIRQ", om.findStrict("ti.sysbios.family.arm.gic.Hwi.dispatchIRQ", "ti.sysbios.family.arm.gic"));
        vo.bind("dispatchIRQC", om.findStrict("ti.sysbios.family.arm.gic.Hwi.dispatchIRQC", "ti.sysbios.family.arm.gic"));
        vo.bind("nonPluggedHwiHandler", om.findStrict("ti.sysbios.family.arm.gic.Hwi.nonPluggedHwiHandler", "ti.sysbios.family.arm.gic"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_gic_Hwi_Handle__label__E", "ti_sysbios_family_arm_gic_Hwi_Module__startupDone__E", "ti_sysbios_family_arm_gic_Hwi_Object__create__E", "ti_sysbios_family_arm_gic_Hwi_Object__delete__E", "ti_sysbios_family_arm_gic_Hwi_Object__get__E", "ti_sysbios_family_arm_gic_Hwi_Object__first__E", "ti_sysbios_family_arm_gic_Hwi_Object__next__E", "ti_sysbios_family_arm_gic_Hwi_Params__init__E", "ti_sysbios_family_arm_gic_Hwi_getStackInfo__E", "ti_sysbios_family_arm_gic_Hwi_getCoreStackInfo__E", "ti_sysbios_family_arm_gic_Hwi_startup__E", "ti_sysbios_family_arm_gic_Hwi_switchFromBootStack__E", "ti_sysbios_family_arm_gic_Hwi_post__E", "ti_sysbios_family_arm_gic_Hwi_getTaskSP__E", "ti_sysbios_family_arm_gic_Hwi_disableInterrupt__E", "ti_sysbios_family_arm_gic_Hwi_enableInterrupt__E", "ti_sysbios_family_arm_gic_Hwi_restoreInterrupt__E", "ti_sysbios_family_arm_gic_Hwi_clearInterrupt__E", "ti_sysbios_family_arm_gic_Hwi_getFunc__E", "ti_sysbios_family_arm_gic_Hwi_setFunc__E", "ti_sysbios_family_arm_gic_Hwi_getHookContext__E", "ti_sysbios_family_arm_gic_Hwi_setHookContext__E", "ti_sysbios_family_arm_gic_Hwi_getIrp__E", "ti_sysbios_family_arm_gic_Hwi_disable__E", "ti_sysbios_family_arm_gic_Hwi_enable__E", "ti_sysbios_family_arm_gic_Hwi_restore__E", "ti_sysbios_family_arm_gic_Hwi_enableIRQ__E", "ti_sysbios_family_arm_gic_Hwi_disableIRQ__E", "ti_sysbios_family_arm_gic_Hwi_restoreIRQ__E", "ti_sysbios_family_arm_gic_Hwi_enableFIQ__E", "ti_sysbios_family_arm_gic_Hwi_disableFIQ__E", "ti_sysbios_family_arm_gic_Hwi_restoreFIQ__E", "ti_sysbios_family_arm_gic_Hwi_disableFxn__E", "ti_sysbios_family_arm_gic_Hwi_enableFxn__E", "ti_sysbios_family_arm_gic_Hwi_restoreFxn__E", "ti_sysbios_family_arm_gic_Hwi_getHandle__E", "ti_sysbios_family_arm_gic_Hwi_init__E", "ti_sysbios_family_arm_gic_Hwi_initIntControllerCoreX__E", "ti_sysbios_family_arm_gic_Hwi_raiseSGI__E", "ti_sysbios_family_arm_gic_Hwi_setPriority__E", "ti_sysbios_family_arm_gic_Hwi_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray("LM_begin", "LD_end"));
        vo.bind("$$errorDescCfgs", Global.newArray("E_alreadyDefined", "E_handleNotFound", "E_undefined", "E_badIntNum"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_badSGIIntNum"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Hwi.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.gic.Hwi.Object", "ti.sysbios.family.arm.gic"));
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
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.gic")).findStrict("PARAMS", "ti.sysbios.family.arm.gic");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.gic.Hwi", "ti.sysbios.family.arm.gic")).findStrict("PARAMS", "ti.sysbios.family.arm.gic");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.gic.Hwi", "ti.sysbios.family.arm.gic"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.gic.Hwi", "ti.sysbios.family.arm.gic");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Detailed", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitDetailed", "structName", "DetailedView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.gic.Hwi")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.gic")).add(pkgV);
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
