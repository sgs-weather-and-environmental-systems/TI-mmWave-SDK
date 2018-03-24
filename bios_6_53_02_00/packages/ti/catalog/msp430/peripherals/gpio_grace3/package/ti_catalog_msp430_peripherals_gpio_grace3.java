/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D05
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class ti_catalog_msp430_peripherals_gpio_grace3
{
    static final String VERS = "@(#) xdc-D05\n";

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
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.clock");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3", new Value.Obj("ti.catalog.msp430.peripherals.gpio_grace3", pkgP));
    }

    void IGPIO$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO", new Value.Obj("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO", po));
        pkgV.bind("IGPIO", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$regIntVect_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Params", new Proto.Str(po, true));
    }

    void GPIO_MSP430FR5739_35_31_29_25_21$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21", new Value.Obj("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21", po));
        pkgV.bind("GPIO_MSP430FR5739_35_31_29_25_21", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Params", new Proto.Str(po, true));
    }

    void GPIO_MSP430FR5738_34_30_28_24_20$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20", new Value.Obj("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20", po));
        pkgV.bind("GPIO_MSP430FR5738_34_30_28_24_20", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Params", new Proto.Str(po, true));
    }

    void GPIO_MSP430FR5737_33_27_23$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23", new Value.Obj("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23", po));
        pkgV.bind("GPIO_MSP430FR5737_33_27_23", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Params", new Proto.Str(po, true));
    }

    void GPIO_MSP430FR5736_32_26_22$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22", new Value.Obj("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22", po));
        pkgV.bind("GPIO_MSP430FR5736_32_26_22", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Params", new Proto.Str(po, true));
    }

    void GPIO_MSP430FR59xx_FR58xx$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx", new Value.Obj("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx", po));
        pkgV.bind("GPIO_MSP430FR59xx_FR58xx", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Params", new Proto.Str(po, true));
    }

    void IGPIO$$CONSTS()
    {
        // interface IGPIO
    }

    void GPIO_MSP430FR5739_35_31_29_25_21$$CONSTS()
    {
        // module GPIO_MSP430FR5739_35_31_29_25_21
    }

    void GPIO_MSP430FR5738_34_30_28_24_20$$CONSTS()
    {
        // module GPIO_MSP430FR5738_34_30_28_24_20
    }

    void GPIO_MSP430FR5737_33_27_23$$CONSTS()
    {
        // module GPIO_MSP430FR5737_33_27_23
    }

    void GPIO_MSP430FR5736_32_26_22$$CONSTS()
    {
        // module GPIO_MSP430FR5736_32_26_22
    }

    void GPIO_MSP430FR59xx_FR58xx$$CONSTS()
    {
        // module GPIO_MSP430FR59xx_FR58xx
    }

    void IGPIO$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void GPIO_MSP430FR5739_35_31_29_25_21$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Module", "ti.catalog.msp430.peripherals.gpio_grace3"), om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Params", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5739_35_31_29_25_21$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.gpio_grace3']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Module", "ti.catalog.msp430.peripherals.gpio_grace3"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$Object", "ti.catalog.msp430.peripherals.gpio_grace3"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Params", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5739_35_31_29_25_21$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void GPIO_MSP430FR5738_34_30_28_24_20$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Module", "ti.catalog.msp430.peripherals.gpio_grace3"), om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Params", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5738_34_30_28_24_20$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.gpio_grace3']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Module", "ti.catalog.msp430.peripherals.gpio_grace3"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$Object", "ti.catalog.msp430.peripherals.gpio_grace3"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Params", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5738_34_30_28_24_20$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void GPIO_MSP430FR5737_33_27_23$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Module", "ti.catalog.msp430.peripherals.gpio_grace3"), om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Params", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5737_33_27_23$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.gpio_grace3']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Module", "ti.catalog.msp430.peripherals.gpio_grace3"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$Object", "ti.catalog.msp430.peripherals.gpio_grace3"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Params", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5737_33_27_23$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void GPIO_MSP430FR5736_32_26_22$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Module", "ti.catalog.msp430.peripherals.gpio_grace3"), om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Params", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5736_32_26_22$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.gpio_grace3']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Module", "ti.catalog.msp430.peripherals.gpio_grace3"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$Object", "ti.catalog.msp430.peripherals.gpio_grace3"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Params", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5736_32_26_22$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void GPIO_MSP430FR59xx_FR58xx$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Module", "ti.catalog.msp430.peripherals.gpio_grace3"), om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Params", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR59xx_FR58xx$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.gpio_grace3']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Module", "ti.catalog.msp430.peripherals.gpio_grace3"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$Object", "ti.catalog.msp430.peripherals.gpio_grace3"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Params", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR59xx_FR58xx$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IGPIO$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GPIO_MSP430FR5739_35_31_29_25_21$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GPIO_MSP430FR5738_34_30_28_24_20$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GPIO_MSP430FR5737_33_27_23$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GPIO_MSP430FR5736_32_26_22$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GPIO_MSP430FR59xx_FR58xx$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IGPIO$$SIZES()
    {
    }

    void GPIO_MSP430FR5739_35_31_29_25_21$$SIZES()
    {
    }

    void GPIO_MSP430FR5738_34_30_28_24_20$$SIZES()
    {
    }

    void GPIO_MSP430FR5737_33_27_23$$SIZES()
    {
    }

    void GPIO_MSP430FR5736_32_26_22$$SIZES()
    {
    }

    void GPIO_MSP430FR59xx_FR58xx$$SIZES()
    {
    }

    void IGPIO$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/gpio_grace3/IGPIO.xs");
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Instance", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$Params", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "wh");
        // struct IGPIO.regIntVect_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("registerName", $$T_Str, $$UNDEF, "w");
                po.addFld("registerDescription", $$T_Str, $$UNDEF, "w");
                po.addFld("isrToggleString", $$T_Str, $$UNDEF, "w");
                po.addFld("priorityName", $$T_Str, $$UNDEF, "w");
                po.addFld("interruptEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("interruptHandler", $$T_Bool, $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
    }

    void GPIO_MSP430FR5739_35_31_29_25_21$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/gpio_grace3/GPIO_MSP430FR5739_35_31_29_25_21.xs");
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Module", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Module", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$create", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.get("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5739_35_31_29_25_21$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$construct", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.get("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5739_35_31_29_25_21$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Instance", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF, "wh");
        po.addFld("numPortInterrupts", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$Params", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF, "wh");
        po.addFld("numPortInterrupts", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$Object", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Object", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
    }

    void GPIO_MSP430FR5738_34_30_28_24_20$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/gpio_grace3/GPIO_MSP430FR5738_34_30_28_24_20.xs");
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Module", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Module", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$create", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.get("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5738_34_30_28_24_20$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$construct", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.get("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5738_34_30_28_24_20$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Instance", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF, "wh");
        po.addFld("numPortInterrupts", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$Params", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF, "wh");
        po.addFld("numPortInterrupts", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$Object", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Object", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
    }

    void GPIO_MSP430FR5737_33_27_23$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/gpio_grace3/GPIO_MSP430FR5737_33_27_23.xs");
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Module", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Module", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$create", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.get("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5737_33_27_23$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$construct", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.get("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5737_33_27_23$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Instance", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF, "wh");
        po.addFld("numPortInterrupts", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$Params", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF, "wh");
        po.addFld("numPortInterrupts", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$Object", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Object", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
    }

    void GPIO_MSP430FR5736_32_26_22$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/gpio_grace3/GPIO_MSP430FR5736_32_26_22.xs");
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Module", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Module", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$create", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.get("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5736_32_26_22$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$construct", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.get("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR5736_32_26_22$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Instance", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF, "wh");
        po.addFld("numPortInterrupts", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$Params", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF, "wh");
        po.addFld("numPortInterrupts", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$Object", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Object", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
    }

    void GPIO_MSP430FR59xx_FR58xx$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/gpio_grace3/GPIO_MSP430FR59xx_FR58xx.xs");
        om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Module", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Module", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$create", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.get("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR59xx_FR58xx$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$construct", "ti.catalog.msp430.peripherals.gpio_grace3"), Global.get("ti$catalog$msp430$peripherals$gpio_grace3$GPIO_MSP430FR59xx_FR58xx$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.gpio_grace3"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Instance", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF, "wh");
        po.addFld("numPortInterrupts", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$Params", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"), $$UNDEF, "wh");
        po.addFld("numPortInterrupts", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$Object", "ti.catalog.msp430.peripherals.gpio_grace3");
        po.init("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Object", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
    }

    void IGPIO$$ROV()
    {
    }

    void GPIO_MSP430FR5739_35_31_29_25_21$$ROV()
    {
    }

    void GPIO_MSP430FR5738_34_30_28_24_20$$ROV()
    {
    }

    void GPIO_MSP430FR5737_33_27_23$$ROV()
    {
    }

    void GPIO_MSP430FR5736_32_26_22$$ROV()
    {
    }

    void GPIO_MSP430FR59xx_FR58xx$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.gpio_grace3.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.gpio_grace3"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.gpio_grace3", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.gpio_grace3");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.gpio_grace3.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.gpio_grace3$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.gpio_grace3$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IGPIO$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO", "ti.catalog.msp430.peripherals.gpio_grace3");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        vo.init2(po, "ti.catalog.msp430.peripherals.gpio_grace3.IGPIO", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO$$capsule", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.Params", "ti.catalog.msp430.peripherals.gpio_grace3")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IGPIO", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IGPIO");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void GPIO_MSP430FR5739_35_31_29_25_21$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21", "ti.catalog.msp430.peripherals.gpio_grace3");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        vo.init2(po, "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$capsule", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Params", "ti.catalog.msp430.peripherals.gpio_grace3")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.gpio_grace3");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.gpio_grace3")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21.Object", "ti.catalog.msp430.peripherals.gpio_grace3"));
        pkgV.bind("GPIO_MSP430FR5739_35_31_29_25_21", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GPIO_MSP430FR5739_35_31_29_25_21");
    }

    void GPIO_MSP430FR5738_34_30_28_24_20$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20", "ti.catalog.msp430.peripherals.gpio_grace3");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        vo.init2(po, "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$capsule", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Params", "ti.catalog.msp430.peripherals.gpio_grace3")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.gpio_grace3");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.gpio_grace3")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20.Object", "ti.catalog.msp430.peripherals.gpio_grace3"));
        pkgV.bind("GPIO_MSP430FR5738_34_30_28_24_20", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GPIO_MSP430FR5738_34_30_28_24_20");
    }

    void GPIO_MSP430FR5737_33_27_23$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23", "ti.catalog.msp430.peripherals.gpio_grace3");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        vo.init2(po, "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$capsule", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Params", "ti.catalog.msp430.peripherals.gpio_grace3")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.gpio_grace3");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.gpio_grace3")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23.Object", "ti.catalog.msp430.peripherals.gpio_grace3"));
        pkgV.bind("GPIO_MSP430FR5737_33_27_23", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GPIO_MSP430FR5737_33_27_23");
    }

    void GPIO_MSP430FR5736_32_26_22$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22", "ti.catalog.msp430.peripherals.gpio_grace3");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        vo.init2(po, "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$capsule", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Params", "ti.catalog.msp430.peripherals.gpio_grace3")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.gpio_grace3");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.gpio_grace3")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22.Object", "ti.catalog.msp430.peripherals.gpio_grace3"));
        pkgV.bind("GPIO_MSP430FR5736_32_26_22", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GPIO_MSP430FR5736_32_26_22");
    }

    void GPIO_MSP430FR59xx_FR58xx$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx", "ti.catalog.msp430.peripherals.gpio_grace3");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Module", "ti.catalog.msp430.peripherals.gpio_grace3");
        vo.init2(po, "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$capsule", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Instance", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Params", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Params", "ti.catalog.msp430.peripherals.gpio_grace3")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO.regIntVect_t", "ti.catalog.msp430.peripherals.gpio_grace3"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.gpio_grace3");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.gpio_grace3")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx.Object", "ti.catalog.msp430.peripherals.gpio_grace3"));
        pkgV.bind("GPIO_MSP430FR59xx_FR58xx", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GPIO_MSP430FR59xx_FR58xx");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21", "ti.catalog.msp430.peripherals.gpio_grace3"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20", "ti.catalog.msp430.peripherals.gpio_grace3"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23", "ti.catalog.msp430.peripherals.gpio_grace3"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22", "ti.catalog.msp430.peripherals.gpio_grace3"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx", "ti.catalog.msp430.peripherals.gpio_grace3"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.gpio_grace3.IGPIO")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.gpio_grace3")).add(pkgV);
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
        IGPIO$$OBJECTS();
        GPIO_MSP430FR5739_35_31_29_25_21$$OBJECTS();
        GPIO_MSP430FR5738_34_30_28_24_20$$OBJECTS();
        GPIO_MSP430FR5737_33_27_23$$OBJECTS();
        GPIO_MSP430FR5736_32_26_22$$OBJECTS();
        GPIO_MSP430FR59xx_FR58xx$$OBJECTS();
        IGPIO$$CONSTS();
        GPIO_MSP430FR5739_35_31_29_25_21$$CONSTS();
        GPIO_MSP430FR5738_34_30_28_24_20$$CONSTS();
        GPIO_MSP430FR5737_33_27_23$$CONSTS();
        GPIO_MSP430FR5736_32_26_22$$CONSTS();
        GPIO_MSP430FR59xx_FR58xx$$CONSTS();
        IGPIO$$CREATES();
        GPIO_MSP430FR5739_35_31_29_25_21$$CREATES();
        GPIO_MSP430FR5738_34_30_28_24_20$$CREATES();
        GPIO_MSP430FR5737_33_27_23$$CREATES();
        GPIO_MSP430FR5736_32_26_22$$CREATES();
        GPIO_MSP430FR59xx_FR58xx$$CREATES();
        IGPIO$$FUNCTIONS();
        GPIO_MSP430FR5739_35_31_29_25_21$$FUNCTIONS();
        GPIO_MSP430FR5738_34_30_28_24_20$$FUNCTIONS();
        GPIO_MSP430FR5737_33_27_23$$FUNCTIONS();
        GPIO_MSP430FR5736_32_26_22$$FUNCTIONS();
        GPIO_MSP430FR59xx_FR58xx$$FUNCTIONS();
        IGPIO$$SIZES();
        GPIO_MSP430FR5739_35_31_29_25_21$$SIZES();
        GPIO_MSP430FR5738_34_30_28_24_20$$SIZES();
        GPIO_MSP430FR5737_33_27_23$$SIZES();
        GPIO_MSP430FR5736_32_26_22$$SIZES();
        GPIO_MSP430FR59xx_FR58xx$$SIZES();
        IGPIO$$TYPES();
        GPIO_MSP430FR5739_35_31_29_25_21$$TYPES();
        GPIO_MSP430FR5738_34_30_28_24_20$$TYPES();
        GPIO_MSP430FR5737_33_27_23$$TYPES();
        GPIO_MSP430FR5736_32_26_22$$TYPES();
        GPIO_MSP430FR59xx_FR58xx$$TYPES();
        if (isROV) {
            IGPIO$$ROV();
            GPIO_MSP430FR5739_35_31_29_25_21$$ROV();
            GPIO_MSP430FR5738_34_30_28_24_20$$ROV();
            GPIO_MSP430FR5737_33_27_23$$ROV();
            GPIO_MSP430FR5736_32_26_22$$ROV();
            GPIO_MSP430FR59xx_FR58xx$$ROV();
        }//isROV
        $$SINGLETONS();
        IGPIO$$SINGLETONS();
        GPIO_MSP430FR5739_35_31_29_25_21$$SINGLETONS();
        GPIO_MSP430FR5738_34_30_28_24_20$$SINGLETONS();
        GPIO_MSP430FR5737_33_27_23$$SINGLETONS();
        GPIO_MSP430FR5736_32_26_22$$SINGLETONS();
        GPIO_MSP430FR59xx_FR58xx$$SINGLETONS();
        $$INITIALIZATION();
    }
}
