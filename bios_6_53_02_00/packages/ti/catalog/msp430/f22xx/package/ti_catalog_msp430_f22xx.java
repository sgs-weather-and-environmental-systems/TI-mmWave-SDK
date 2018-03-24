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

public class ti_catalog_msp430_f22xx
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
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
        Global.callFxn("loadPackage", xdcO, "ti.catalog");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.timer");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.clock");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.communication");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.adc");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.watchdog");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.oa");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.gpio");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.memory");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.special_function");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.interrupt");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.f22xx", new Value.Obj("ti.catalog.msp430.f22xx", pkgP));
    }

    void IMSP430x22xx$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx", new Value.Obj("ti.catalog.msp430.f22xx.IMSP430x22xx", po));
        pkgV.bind("IMSP430x22xx", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx.Params", new Proto.Str(po, true));
    }

    void MSP430F223x$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F223x.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F223x", new Value.Obj("ti.catalog.msp430.f22xx.MSP430F223x", po));
        pkgV.bind("MSP430F223x", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f22xx.MSP430F223x.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F223x$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f22xx.MSP430F223x.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F223x$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f22xx.MSP430F223x.Params", new Proto.Str(po, true));
    }

    void MSP430F225x$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F225x.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F225x", new Value.Obj("ti.catalog.msp430.f22xx.MSP430F225x", po));
        pkgV.bind("MSP430F225x", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f22xx.MSP430F225x.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F225x$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f22xx.MSP430F225x.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F225x$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f22xx.MSP430F225x.Params", new Proto.Str(po, true));
    }

    void MSP430F2274$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F2274.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F2274", new Value.Obj("ti.catalog.msp430.f22xx.MSP430F2274", po));
        pkgV.bind("MSP430F2274", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f22xx.MSP430F2274.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F2274$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f22xx.MSP430F2274.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f22xx.MSP430F2274$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f22xx.MSP430F2274.Params", new Proto.Str(po, true));
    }

    void IMSP430x22xx$$CONSTS()
    {
        // interface IMSP430x22xx
    }

    void MSP430F223x$$CONSTS()
    {
        // module MSP430F223x
    }

    void MSP430F225x$$CONSTS()
    {
        // module MSP430F225x
    }

    void MSP430F2274$$CONSTS()
    {
        // module MSP430F2274
    }

    void IMSP430x22xx$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MSP430F223x$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f22xx.MSP430F223x$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Module", "ti.catalog.msp430.f22xx"), om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Instance", "ti.catalog.msp430.f22xx"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Params", "ti.catalog.msp430.f22xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f22xx$MSP430F223x$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f22xx.MSP430F223x'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.f22xx.MSP430F223x.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.f22xx']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.timer_A3 = __mod.PARAMS.timer_A3;\n");
            sb.append("__inst.timer_B3 = __mod.PARAMS.timer_B3;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.usci_A0_UART = __mod.PARAMS.usci_A0_UART;\n");
            sb.append("__inst.usci_A0_SPI = __mod.PARAMS.usci_A0_SPI;\n");
            sb.append("__inst.usci_B0_SPI = __mod.PARAMS.usci_B0_SPI;\n");
            sb.append("__inst.usci_B0_I2C = __mod.PARAMS.usci_B0_I2C;\n");
            sb.append("__inst.adc10 = __mod.PARAMS.adc10;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.oa = __mod.PARAMS.oa;\n");
            sb.append("__inst.gpio = __mod.PARAMS.gpio;\n");
            sb.append("__inst.flash = __mod.PARAMS.flash;\n");
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.interruptEnableRegister2 = __mod.PARAMS.interruptEnableRegister2;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f22xx.MSP430F223x$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Module", "ti.catalog.msp430.f22xx"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x$$Object", "ti.catalog.msp430.f22xx"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Params", "ti.catalog.msp430.f22xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f22xx$MSP430F223x$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f22xx.MSP430F223x'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.timer_A3 = __mod.PARAMS.timer_A3;\n");
            sb.append("__inst.timer_B3 = __mod.PARAMS.timer_B3;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.usci_A0_UART = __mod.PARAMS.usci_A0_UART;\n");
            sb.append("__inst.usci_A0_SPI = __mod.PARAMS.usci_A0_SPI;\n");
            sb.append("__inst.usci_B0_SPI = __mod.PARAMS.usci_B0_SPI;\n");
            sb.append("__inst.usci_B0_I2C = __mod.PARAMS.usci_B0_I2C;\n");
            sb.append("__inst.adc10 = __mod.PARAMS.adc10;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.oa = __mod.PARAMS.oa;\n");
            sb.append("__inst.gpio = __mod.PARAMS.gpio;\n");
            sb.append("__inst.flash = __mod.PARAMS.flash;\n");
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.interruptEnableRegister2 = __mod.PARAMS.interruptEnableRegister2;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void MSP430F225x$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f22xx.MSP430F225x$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Module", "ti.catalog.msp430.f22xx"), om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Instance", "ti.catalog.msp430.f22xx"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Params", "ti.catalog.msp430.f22xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f22xx$MSP430F225x$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f22xx.MSP430F225x'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.f22xx.MSP430F225x.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.f22xx']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.timer_A3 = __mod.PARAMS.timer_A3;\n");
            sb.append("__inst.timer_B3 = __mod.PARAMS.timer_B3;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.usci_A0_UART = __mod.PARAMS.usci_A0_UART;\n");
            sb.append("__inst.usci_A0_SPI = __mod.PARAMS.usci_A0_SPI;\n");
            sb.append("__inst.usci_B0_SPI = __mod.PARAMS.usci_B0_SPI;\n");
            sb.append("__inst.usci_B0_I2C = __mod.PARAMS.usci_B0_I2C;\n");
            sb.append("__inst.adc10 = __mod.PARAMS.adc10;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.oa = __mod.PARAMS.oa;\n");
            sb.append("__inst.gpio = __mod.PARAMS.gpio;\n");
            sb.append("__inst.flash = __mod.PARAMS.flash;\n");
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.interruptEnableRegister2 = __mod.PARAMS.interruptEnableRegister2;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f22xx.MSP430F225x$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Module", "ti.catalog.msp430.f22xx"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x$$Object", "ti.catalog.msp430.f22xx"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Params", "ti.catalog.msp430.f22xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f22xx$MSP430F225x$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f22xx.MSP430F225x'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.timer_A3 = __mod.PARAMS.timer_A3;\n");
            sb.append("__inst.timer_B3 = __mod.PARAMS.timer_B3;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.usci_A0_UART = __mod.PARAMS.usci_A0_UART;\n");
            sb.append("__inst.usci_A0_SPI = __mod.PARAMS.usci_A0_SPI;\n");
            sb.append("__inst.usci_B0_SPI = __mod.PARAMS.usci_B0_SPI;\n");
            sb.append("__inst.usci_B0_I2C = __mod.PARAMS.usci_B0_I2C;\n");
            sb.append("__inst.adc10 = __mod.PARAMS.adc10;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.oa = __mod.PARAMS.oa;\n");
            sb.append("__inst.gpio = __mod.PARAMS.gpio;\n");
            sb.append("__inst.flash = __mod.PARAMS.flash;\n");
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.interruptEnableRegister2 = __mod.PARAMS.interruptEnableRegister2;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void MSP430F2274$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f22xx.MSP430F2274$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Module", "ti.catalog.msp430.f22xx"), om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Instance", "ti.catalog.msp430.f22xx"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Params", "ti.catalog.msp430.f22xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f22xx$MSP430F2274$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f22xx.MSP430F2274'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.f22xx.MSP430F2274.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.f22xx']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.timer_A3 = __mod.PARAMS.timer_A3;\n");
            sb.append("__inst.timer_B3 = __mod.PARAMS.timer_B3;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.usci_A0_UART = __mod.PARAMS.usci_A0_UART;\n");
            sb.append("__inst.usci_A0_SPI = __mod.PARAMS.usci_A0_SPI;\n");
            sb.append("__inst.usci_B0_SPI = __mod.PARAMS.usci_B0_SPI;\n");
            sb.append("__inst.usci_B0_I2C = __mod.PARAMS.usci_B0_I2C;\n");
            sb.append("__inst.adc10 = __mod.PARAMS.adc10;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.oa = __mod.PARAMS.oa;\n");
            sb.append("__inst.gpio = __mod.PARAMS.gpio;\n");
            sb.append("__inst.flash = __mod.PARAMS.flash;\n");
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.interruptEnableRegister2 = __mod.PARAMS.interruptEnableRegister2;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f22xx.MSP430F2274$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Module", "ti.catalog.msp430.f22xx"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274$$Object", "ti.catalog.msp430.f22xx"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Params", "ti.catalog.msp430.f22xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f22xx$MSP430F2274$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f22xx.MSP430F2274'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.timer_A3 = __mod.PARAMS.timer_A3;\n");
            sb.append("__inst.timer_B3 = __mod.PARAMS.timer_B3;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.usci_A0_UART = __mod.PARAMS.usci_A0_UART;\n");
            sb.append("__inst.usci_A0_SPI = __mod.PARAMS.usci_A0_SPI;\n");
            sb.append("__inst.usci_B0_SPI = __mod.PARAMS.usci_B0_SPI;\n");
            sb.append("__inst.usci_B0_I2C = __mod.PARAMS.usci_B0_I2C;\n");
            sb.append("__inst.adc10 = __mod.PARAMS.adc10;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.oa = __mod.PARAMS.oa;\n");
            sb.append("__inst.gpio = __mod.PARAMS.gpio;\n");
            sb.append("__inst.flash = __mod.PARAMS.flash;\n");
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.interruptEnableRegister2 = __mod.PARAMS.interruptEnableRegister2;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IMSP430x22xx$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430F223x$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430F225x$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430F2274$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IMSP430x22xx$$SIZES()
    {
    }

    void MSP430F223x$$SIZES()
    {
    }

    void MSP430F225x$$SIZES()
    {
    }

    void MSP430F2274$$SIZES()
    {
    }

    void IMSP430x22xx$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/f22xx/IMSP430x22xx.xs");
        om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Module", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.IMSP430x22xx.Module", om.findStrict("ti.catalog.msp430.IMSP430.Module", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.f22xx.IMSP430x22xx$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Instance", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.IMSP430x22xx.Instance", om.findStrict("ti.catalog.msp430.IMSP430.Instance", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("timer_A3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("timer_B3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("usci_A0_UART", (Proto)om.findStrict("ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("usci_A0_SPI", (Proto)om.findStrict("ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("usci_B0_SPI", (Proto)om.findStrict("ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("usci_B0_I2C", (Proto)om.findStrict("ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("adc10", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("wdtPlus", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("oa", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("gpio", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F22x4.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("flash", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("interruptEnableRegister1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("interruptEnableRegister2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("interruptController", (Proto)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("commonMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f22xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"PERIPHERALS_8BIT", Global.newObject("comment", "Memory mapped I/O registers", "name", "PERIPHERALS_8BIT", "base", 0x0010L, "len", 0x00F0L, "space", "io", "access", "RW")}), Global.newArray(new Object[]{"PERIPHERALS_16BIT", Global.newObject("comment", "Memory mapped I/O registers", "name", "PERIPHERALS_16BIT", "base", 0x0100L, "len", 0x0100L, "space", "io", "access", "RW")}), Global.newArray(new Object[]{"BSLSKEY", Global.newObject("comment", "Boot loader security key", "name", "BSLSKEY", "base", 0xFFDEL, "len", 0x0002L, "space", "data", "access", "RI")}), Global.newArray(new Object[]{"INT00", Global.newObject("comment", "Reserved Vector (int00)", "name", "INT00", "base", 0xFFE0L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT01", Global.newObject("comment", "Reserved Vector (int01)", "name", "INT01", "base", 0xFFE2L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT02", Global.newObject("comment", "I/O Port P1 Vector (int02)", "name", "INT02", "base", 0xFFE4L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT03", Global.newObject("comment", "I/O Port P2 Vector (int03)", "name", "INT03", "base", 0xFFE6L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT04", Global.newObject("comment", "Reserved Vector (int04)", "name", "INT04", "base", 0xFFE8L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT05", Global.newObject("comment", "ADC10 Vector (int05)", "name", "INT05", "base", 0xFFEAL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT06", Global.newObject("comment", "USCI_A0/B0 Transmit Vector (int06)", "name", "INT06", "base", 0xFFECL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT07", Global.newObject("comment", "USCI_A0/B0 Receive Vector (int07)", "name", "INT07", "base", 0xFFEEL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT08", Global.newObject("comment", "Timer_A3 TBCCR1 Vector (int08)", "name", "INT08", "base", 0xFFF0L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT09", Global.newObject("comment", "Timer_A3 TBCCR0 Vector (int09)", "name", "INT09", "base", 0xFFF2L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT10", Global.newObject("comment", "Watchdog Vector (int10)", "name", "INT10", "base", 0xFFF4L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT11", Global.newObject("comment", "Reserved Vector (int11)", "name", "INT11", "base", 0xFFF6L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT12", Global.newObject("comment", "Timer_B3 TBCCR1 Vector (int12)", "name", "INT12", "base", 0xFFF8L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT13", Global.newObject("comment", "Timer_B3 TBCCR0 Vector (int13)", "name", "INT13", "base", 0xFFFAL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT14", Global.newObject("comment", "NMI Vector (int14)", "name", "INT14", "base", 0xFFFCL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"RESET", Global.newObject("comment", "Reset Vector (int15)", "name", "RESET", "base", 0xFFFEL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INFOA", Global.newObject("comment", "INFO Flash Memory Segment A", "name", "INFOA", "base", 0x10C0L, "len", 0x0040L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INFOB", Global.newObject("comment", "INFO Flash Memory Segment B", "name", "INFOB", "base", 0x1080L, "len", 0x0040L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INFOC", Global.newObject("comment", "INFO Flash Memory Segment C", "name", "INFOC", "base", 0x1040L, "len", 0x0040L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INFOD", Global.newObject("comment", "INFO Flash Memory Segment D", "name", "INFOD", "base", 0x1000L, "len", 0x0040L, "space", "data", "access", "RW")})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f22xx"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f22xx"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx$$Params", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.IMSP430x22xx.Params", om.findStrict("ti.catalog.msp430.IMSP430$$Params", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("timer_A3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("timer_B3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("usci_A0_UART", (Proto)om.findStrict("ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("usci_A0_SPI", (Proto)om.findStrict("ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("usci_B0_SPI", (Proto)om.findStrict("ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("usci_B0_I2C", (Proto)om.findStrict("ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("adc10", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("wdtPlus", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("oa", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("gpio", (Proto)om.findStrict("ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F22x4.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("flash", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("interruptEnableRegister1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("interruptEnableRegister2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("interruptController", (Proto)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance", "ti.catalog.msp430.f22xx"), $$UNDEF, "wh");
        po.addFld("commonMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f22xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"PERIPHERALS_8BIT", Global.newObject("comment", "Memory mapped I/O registers", "name", "PERIPHERALS_8BIT", "base", 0x0010L, "len", 0x00F0L, "space", "io", "access", "RW")}), Global.newArray(new Object[]{"PERIPHERALS_16BIT", Global.newObject("comment", "Memory mapped I/O registers", "name", "PERIPHERALS_16BIT", "base", 0x0100L, "len", 0x0100L, "space", "io", "access", "RW")}), Global.newArray(new Object[]{"BSLSKEY", Global.newObject("comment", "Boot loader security key", "name", "BSLSKEY", "base", 0xFFDEL, "len", 0x0002L, "space", "data", "access", "RI")}), Global.newArray(new Object[]{"INT00", Global.newObject("comment", "Reserved Vector (int00)", "name", "INT00", "base", 0xFFE0L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT01", Global.newObject("comment", "Reserved Vector (int01)", "name", "INT01", "base", 0xFFE2L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT02", Global.newObject("comment", "I/O Port P1 Vector (int02)", "name", "INT02", "base", 0xFFE4L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT03", Global.newObject("comment", "I/O Port P2 Vector (int03)", "name", "INT03", "base", 0xFFE6L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT04", Global.newObject("comment", "Reserved Vector (int04)", "name", "INT04", "base", 0xFFE8L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT05", Global.newObject("comment", "ADC10 Vector (int05)", "name", "INT05", "base", 0xFFEAL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT06", Global.newObject("comment", "USCI_A0/B0 Transmit Vector (int06)", "name", "INT06", "base", 0xFFECL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT07", Global.newObject("comment", "USCI_A0/B0 Receive Vector (int07)", "name", "INT07", "base", 0xFFEEL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT08", Global.newObject("comment", "Timer_A3 TBCCR1 Vector (int08)", "name", "INT08", "base", 0xFFF0L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT09", Global.newObject("comment", "Timer_A3 TBCCR0 Vector (int09)", "name", "INT09", "base", 0xFFF2L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT10", Global.newObject("comment", "Watchdog Vector (int10)", "name", "INT10", "base", 0xFFF4L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT11", Global.newObject("comment", "Reserved Vector (int11)", "name", "INT11", "base", 0xFFF6L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT12", Global.newObject("comment", "Timer_B3 TBCCR1 Vector (int12)", "name", "INT12", "base", 0xFFF8L, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT13", Global.newObject("comment", "Timer_B3 TBCCR0 Vector (int13)", "name", "INT13", "base", 0xFFFAL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT14", Global.newObject("comment", "NMI Vector (int14)", "name", "INT14", "base", 0xFFFCL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"RESET", Global.newObject("comment", "Reset Vector (int15)", "name", "RESET", "base", 0xFFFEL, "len", 0x0002L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INFOA", Global.newObject("comment", "INFO Flash Memory Segment A", "name", "INFOA", "base", 0x10C0L, "len", 0x0040L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INFOB", Global.newObject("comment", "INFO Flash Memory Segment B", "name", "INFOB", "base", 0x1080L, "len", 0x0040L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INFOC", Global.newObject("comment", "INFO Flash Memory Segment C", "name", "INFOC", "base", 0x1040L, "len", 0x0040L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INFOD", Global.newObject("comment", "INFO Flash Memory Segment D", "name", "INFOD", "base", 0x1000L, "len", 0x0040L, "space", "data", "access", "RW")})}), "wh");
    }

    void MSP430F223x$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Module", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F223x.Module", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Module", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x$$create", "ti.catalog.msp430.f22xx"), Global.get("ti$catalog$msp430$f22xx$MSP430F223x$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x$$construct", "ti.catalog.msp430.f22xx"), Global.get("ti$catalog$msp430$f22xx$MSP430F223x$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Instance", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F223x.Instance", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Instance", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("deviceMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f22xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x200L, "len", 0x200L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0xE000L, "len", 0x1FDEL, "space", "code", "access", "RWX")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f22xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f22xx"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x$$Params", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F223x.Params", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx$$Params", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("deviceMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f22xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x200L, "len", 0x200L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0xE000L, "len", 0x1FDEL, "space", "code", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x$$Object", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F223x.Object", om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Instance", "ti.catalog.msp430.f22xx"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f22xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f22xx"), $$UNDEF);
    }

    void MSP430F225x$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Module", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F225x.Module", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Module", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x$$create", "ti.catalog.msp430.f22xx"), Global.get("ti$catalog$msp430$f22xx$MSP430F225x$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x$$construct", "ti.catalog.msp430.f22xx"), Global.get("ti$catalog$msp430$f22xx$MSP430F225x$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Instance", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F225x.Instance", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Instance", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("deviceMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f22xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x200L, "len", 0x200L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0xC000L, "len", 0x3FDEL, "space", "code", "access", "RWX")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f22xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f22xx"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x$$Params", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F225x.Params", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx$$Params", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("deviceMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f22xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x200L, "len", 0x200L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0xC000L, "len", 0x3FDEL, "space", "code", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x$$Object", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F225x.Object", om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Instance", "ti.catalog.msp430.f22xx"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f22xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f22xx"), $$UNDEF);
    }

    void MSP430F2274$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Module", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F2274.Module", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Module", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274$$create", "ti.catalog.msp430.f22xx"), Global.get("ti$catalog$msp430$f22xx$MSP430F2274$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274$$construct", "ti.catalog.msp430.f22xx"), Global.get("ti$catalog$msp430$f22xx$MSP430F2274$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Instance", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F2274.Instance", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Instance", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f22xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x200L, "len", 0x400L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x8000L, "len", 0x7FDEL, "space", "code", "access", "RWX")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f22xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f22xx"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274$$Params", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F2274.Params", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx$$Params", "ti.catalog.msp430.f22xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f22xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x200L, "len", 0x400L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x8000L, "len", 0x7FDEL, "space", "code", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274$$Object", "ti.catalog.msp430.f22xx");
        po.init("ti.catalog.msp430.f22xx.MSP430F2274.Object", om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Instance", "ti.catalog.msp430.f22xx"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f22xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f22xx"), $$UNDEF);
    }

    void IMSP430x22xx$$ROV()
    {
    }

    void MSP430F223x$$ROV()
    {
    }

    void MSP430F225x$$ROV()
    {
    }

    void MSP430F2274$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.f22xx.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.f22xx"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/f22xx/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.catalog.msp430.f22xx"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.catalog.msp430.f22xx"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.catalog.msp430.f22xx"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.catalog.msp430.f22xx"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.catalog.msp430.f22xx"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.catalog.msp430.f22xx"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.catalog.msp430.f22xx", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.f22xx");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.f22xx.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.platform", Global.newArray()));
        imports.add(Global.newArray("ti.catalog", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.f22xx'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.f22xx$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.f22xx$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.f22xx$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IMSP430x22xx$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx", "ti.catalog.msp430.f22xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Module", "ti.catalog.msp430.f22xx");
        vo.init2(po, "ti.catalog.msp430.f22xx.IMSP430x22xx", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx$$capsule", "ti.catalog.msp430.f22xx"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Instance", "ti.catalog.msp430.f22xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Params", "ti.catalog.msp430.f22xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f22xx.IMSP430x22xx.Params", "ti.catalog.msp430.f22xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f22xx", "ti.catalog.msp430.f22xx"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IMSP430x22xx", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IMSP430x22xx");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void MSP430F223x$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x", "ti.catalog.msp430.f22xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Module", "ti.catalog.msp430.f22xx");
        vo.init2(po, "ti.catalog.msp430.f22xx.MSP430F223x", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Instance", "ti.catalog.msp430.f22xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Params", "ti.catalog.msp430.f22xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Params", "ti.catalog.msp430.f22xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f22xx", "ti.catalog.msp430.f22xx"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.f22xx");
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.f22xx")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.f22xx.MSP430F223x$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x.Object", "ti.catalog.msp430.f22xx"));
        pkgV.bind("MSP430F223x", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430F223x");
    }

    void MSP430F225x$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x", "ti.catalog.msp430.f22xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Module", "ti.catalog.msp430.f22xx");
        vo.init2(po, "ti.catalog.msp430.f22xx.MSP430F225x", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Instance", "ti.catalog.msp430.f22xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Params", "ti.catalog.msp430.f22xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Params", "ti.catalog.msp430.f22xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f22xx", "ti.catalog.msp430.f22xx"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.f22xx");
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.f22xx")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.f22xx.MSP430F225x$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x.Object", "ti.catalog.msp430.f22xx"));
        pkgV.bind("MSP430F225x", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430F225x");
    }

    void MSP430F2274$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274", "ti.catalog.msp430.f22xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Module", "ti.catalog.msp430.f22xx");
        vo.init2(po, "ti.catalog.msp430.f22xx.MSP430F2274", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Instance", "ti.catalog.msp430.f22xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Params", "ti.catalog.msp430.f22xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Params", "ti.catalog.msp430.f22xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f22xx", "ti.catalog.msp430.f22xx"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.f22xx");
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.f22xx")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.f22xx.MSP430F2274$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274.Object", "ti.catalog.msp430.f22xx"));
        pkgV.bind("MSP430F2274", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430F2274");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.f22xx.MSP430F223x", "ti.catalog.msp430.f22xx"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.f22xx.MSP430F225x", "ti.catalog.msp430.f22xx"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.f22xx.MSP430F2274", "ti.catalog.msp430.f22xx"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.f22xx.IMSP430x22xx")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.f22xx.MSP430F223x")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.f22xx.MSP430F225x")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.f22xx.MSP430F2274")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.f22xx")).add(pkgV);
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
        IMSP430x22xx$$OBJECTS();
        MSP430F223x$$OBJECTS();
        MSP430F225x$$OBJECTS();
        MSP430F2274$$OBJECTS();
        IMSP430x22xx$$CONSTS();
        MSP430F223x$$CONSTS();
        MSP430F225x$$CONSTS();
        MSP430F2274$$CONSTS();
        IMSP430x22xx$$CREATES();
        MSP430F223x$$CREATES();
        MSP430F225x$$CREATES();
        MSP430F2274$$CREATES();
        IMSP430x22xx$$FUNCTIONS();
        MSP430F223x$$FUNCTIONS();
        MSP430F225x$$FUNCTIONS();
        MSP430F2274$$FUNCTIONS();
        IMSP430x22xx$$SIZES();
        MSP430F223x$$SIZES();
        MSP430F225x$$SIZES();
        MSP430F2274$$SIZES();
        IMSP430x22xx$$TYPES();
        MSP430F223x$$TYPES();
        MSP430F225x$$TYPES();
        MSP430F2274$$TYPES();
        if (isROV) {
            IMSP430x22xx$$ROV();
            MSP430F223x$$ROV();
            MSP430F225x$$ROV();
            MSP430F2274$$ROV();
        }//isROV
        $$SINGLETONS();
        IMSP430x22xx$$SINGLETONS();
        MSP430F223x$$SINGLETONS();
        MSP430F225x$$SINGLETONS();
        MSP430F2274$$SINGLETONS();
        $$INITIALIZATION();
    }
}
