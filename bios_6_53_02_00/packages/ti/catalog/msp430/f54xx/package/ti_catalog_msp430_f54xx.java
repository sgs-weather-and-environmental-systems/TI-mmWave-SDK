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

public class ti_catalog_msp430_f54xx
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
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.special_function");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.timer");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.watchdog");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.interrupt");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.f54xx", new Value.Obj("ti.catalog.msp430.f54xx", pkgP));
    }

    void IMSP430F54xx$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx", new Value.Obj("ti.catalog.msp430.f54xx.IMSP430F54xx", po));
        pkgV.bind("IMSP430F54xx", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx.Params", new Proto.Str(po, true));
    }

    void MSP430F5418$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5418.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5418", new Value.Obj("ti.catalog.msp430.f54xx.MSP430F5418", po));
        pkgV.bind("MSP430F5418", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f54xx.MSP430F5418.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5418$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5418.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5418$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5418.Params", new Proto.Str(po, true));
    }

    void MSP430F5419$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5419.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5419", new Value.Obj("ti.catalog.msp430.f54xx.MSP430F5419", po));
        pkgV.bind("MSP430F5419", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f54xx.MSP430F5419.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5419$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5419.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5419$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5419.Params", new Proto.Str(po, true));
    }

    void MSP430F5435$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5435.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5435", new Value.Obj("ti.catalog.msp430.f54xx.MSP430F5435", po));
        pkgV.bind("MSP430F5435", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f54xx.MSP430F5435.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5435$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5435.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5435$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5435.Params", new Proto.Str(po, true));
    }

    void MSP430F5436$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5436.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5436", new Value.Obj("ti.catalog.msp430.f54xx.MSP430F5436", po));
        pkgV.bind("MSP430F5436", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f54xx.MSP430F5436.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5436$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5436.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5436$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5436.Params", new Proto.Str(po, true));
    }

    void MSP430F5437$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5437.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5437", new Value.Obj("ti.catalog.msp430.f54xx.MSP430F5437", po));
        pkgV.bind("MSP430F5437", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f54xx.MSP430F5437.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5437$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5437.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5437$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5437.Params", new Proto.Str(po, true));
    }

    void MSP430F5438$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5438.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5438", new Value.Obj("ti.catalog.msp430.f54xx.MSP430F5438", po));
        pkgV.bind("MSP430F5438", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.f54xx.MSP430F5438.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5438$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5438.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.f54xx.MSP430F5438$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.f54xx.MSP430F5438.Params", new Proto.Str(po, true));
    }

    void IMSP430F54xx$$CONSTS()
    {
        // interface IMSP430F54xx
    }

    void MSP430F5418$$CONSTS()
    {
        // module MSP430F5418
    }

    void MSP430F5419$$CONSTS()
    {
        // module MSP430F5419
    }

    void MSP430F5435$$CONSTS()
    {
        // module MSP430F5435
    }

    void MSP430F5436$$CONSTS()
    {
        // module MSP430F5436
    }

    void MSP430F5437$$CONSTS()
    {
        // module MSP430F5437
    }

    void MSP430F5438$$CONSTS()
    {
        // module MSP430F5438
    }

    void IMSP430F54xx$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MSP430F5418$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5418$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Module", "ti.catalog.msp430.f54xx"), om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Instance", "ti.catalog.msp430.f54xx"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5418$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5418'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.f54xx.MSP430F5418.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.f54xx']);\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5418$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Module", "ti.catalog.msp430.f54xx"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418$$Object", "ti.catalog.msp430.f54xx"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5418$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5418'];\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void MSP430F5419$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5419$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Module", "ti.catalog.msp430.f54xx"), om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Instance", "ti.catalog.msp430.f54xx"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5419$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5419'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.f54xx.MSP430F5419.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.f54xx']);\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5419$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Module", "ti.catalog.msp430.f54xx"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419$$Object", "ti.catalog.msp430.f54xx"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5419$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5419'];\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void MSP430F5435$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5435$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Module", "ti.catalog.msp430.f54xx"), om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Instance", "ti.catalog.msp430.f54xx"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5435$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5435'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.f54xx.MSP430F5435.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.f54xx']);\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5435$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Module", "ti.catalog.msp430.f54xx"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435$$Object", "ti.catalog.msp430.f54xx"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5435$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5435'];\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void MSP430F5436$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5436$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Module", "ti.catalog.msp430.f54xx"), om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Instance", "ti.catalog.msp430.f54xx"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5436$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5436'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.f54xx.MSP430F5436.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.f54xx']);\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5436$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Module", "ti.catalog.msp430.f54xx"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436$$Object", "ti.catalog.msp430.f54xx"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5436$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5436'];\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void MSP430F5437$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5437$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Module", "ti.catalog.msp430.f54xx"), om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Instance", "ti.catalog.msp430.f54xx"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5437$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5437'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.f54xx.MSP430F5437.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.f54xx']);\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5437$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Module", "ti.catalog.msp430.f54xx"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437$$Object", "ti.catalog.msp430.f54xx"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5437$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5437'];\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void MSP430F5438$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5438$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Module", "ti.catalog.msp430.f54xx"), om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Instance", "ti.catalog.msp430.f54xx"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5438$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5438'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.f54xx.MSP430F5438.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.f54xx']);\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.f54xx.MSP430F5438$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Module", "ti.catalog.msp430.f54xx"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438$$Object", "ti.catalog.msp430.f54xx"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Params", "ti.catalog.msp430.f54xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$f54xx$MSP430F5438$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.f54xx.MSP430F5438'];\n");
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
            sb.append("__inst.interruptEnableRegister1 = __mod.PARAMS.interruptEnableRegister1;\n");
            sb.append("__inst.TA0 = __mod.PARAMS.TA0;\n");
            sb.append("__inst.TA1 = __mod.PARAMS.TA1;\n");
            sb.append("__inst.TB0 = __mod.PARAMS.TB0;\n");
            sb.append("__inst.wdtPlus = __mod.PARAMS.wdtPlus;\n");
            sb.append("__inst.interruptController = __mod.PARAMS.interruptController;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IMSP430F54xx$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430F5418$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430F5419$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430F5435$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430F5436$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430F5437$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430F5438$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IMSP430F54xx$$SIZES()
    {
    }

    void MSP430F5418$$SIZES()
    {
    }

    void MSP430F5419$$SIZES()
    {
    }

    void MSP430F5435$$SIZES()
    {
    }

    void MSP430F5436$$SIZES()
    {
    }

    void MSP430F5437$$SIZES()
    {
    }

    void MSP430F5438$$SIZES()
    {
    }

    void IMSP430F54xx$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/f54xx/IMSP430F54xx.xs");
        om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Module", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.IMSP430F54xx.Module", om.findStrict("ti.catalog.msp430.IMSP430.Module", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.f54xx.IMSP430F54xx$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Instance", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.IMSP430F54xx.Instance", om.findStrict("ti.catalog.msp430.IMSP430.Instance", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "MSP430X", "wh");
        po.addFld("isa", $$T_Str, "430|430X", "wh");
        po.addFld("interruptEnableRegister1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("TA0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("TA1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("TB0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("wdtPlus", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("interruptController", (Proto)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("commonMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"PERIPHERALS", Global.newObject("comment", "Memory mapped peripherals", "name", "PERIPHERALS", "base", 0x0L, "len", 0x1000L, "space", "io", "access", "RW")}), Global.newArray(new Object[]{"BSL", Global.newObject("comment", "Bootstrap loader (flash)", "name", "BSL", "base", 0x1000L, "len", 0x800L, "space", "code", "access", "RW")}), Global.newArray(new Object[]{"INFO", Global.newObject("comment", "Information memory (flash)", "name", "INFO", "base", 0x1800L, "len", 0x200L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT00", Global.newObject("comment", "Reserved Vector", "name", "INT00", "base", 0xFF80L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT01", Global.newObject("comment", "Reserved Vector", "name", "INT01", "base", 0xFF82L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT02", Global.newObject("comment", "Reserved Vector", "name", "INT02", "base", 0xFF84L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT03", Global.newObject("comment", "Reserved Vector", "name", "INT03", "base", 0xFF86L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT04", Global.newObject("comment", "Reserved Vector", "name", "INT04", "base", 0xFF88L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT05", Global.newObject("comment", "Reserved Vector", "name", "INT05", "base", 0xFF8AL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT06", Global.newObject("comment", "Reserved Vector", "name", "INT06", "base", 0xFF8CL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT07", Global.newObject("comment", "Reserved Vector", "name", "INT07", "base", 0xFF8EL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT08", Global.newObject("comment", "Reserved Vector", "name", "INT08", "base", 0xFF90L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT09", Global.newObject("comment", "Reserved Vector", "name", "INT09", "base", 0xFF92L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT10", Global.newObject("comment", "Reserved Vector", "name", "INT10", "base", 0xFF94L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT11", Global.newObject("comment", "Reserved Vector", "name", "INT11", "base", 0xFF96L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT12", Global.newObject("comment", "Reserved Vector", "name", "INT12", "base", 0xFF98L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT13", Global.newObject("comment", "Reserved Vector", "name", "INT13", "base", 0xFF9AL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT14", Global.newObject("comment", "Reserved Vector", "name", "INT14", "base", 0xFF9CL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT15", Global.newObject("comment", "Reserved Vector", "name", "INT15", "base", 0xFF9EL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT16", Global.newObject("comment", "Reserved Vector", "name", "INT16", "base", 0xFFA0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT17", Global.newObject("comment", "Reserved Vector", "name", "INT17", "base", 0xFFA2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT18", Global.newObject("comment", "Reserved Vector", "name", "INT18", "base", 0xFFA4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT19", Global.newObject("comment", "Reserved Vector", "name", "INT19", "base", 0xFFA6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT20", Global.newObject("comment", "Reserved Vector", "name", "INT20", "base", 0xFFA8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT21", Global.newObject("comment", "Reserved Vector", "name", "INT21", "base", 0xFFAAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT22", Global.newObject("comment", "Reserved Vector", "name", "INT22", "base", 0xFFACL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT23", Global.newObject("comment", "Reserved Vector", "name", "INT23", "base", 0xFFAEL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT24", Global.newObject("comment", "Reserved Vector", "name", "INT24", "base", 0xFFB0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT25", Global.newObject("comment", "Reserved Vector", "name", "INT25", "base", 0xFFB2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT26", Global.newObject("comment", "Reserved Vector", "name", "INT26", "base", 0xFFB4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT27", Global.newObject("comment", "Reserved Vector", "name", "INT27", "base", 0xFFB6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT28", Global.newObject("comment", "Reserved Vector", "name", "INT28", "base", 0xFFB8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT29", Global.newObject("comment", "Reserved Vector", "name", "INT29", "base", 0xFFBAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT30", Global.newObject("comment", "Reserved Vector", "name", "INT30", "base", 0xFFBCL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT31", Global.newObject("comment", "Reserved Vector", "name", "INT31", "base", 0xFFBEL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT32", Global.newObject("comment", "Reserved Vector", "name", "INT32", "base", 0xFFC0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT33", Global.newObject("comment", "Reserved Vector", "name", "INT33", "base", 0xFFC2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT34", Global.newObject("comment", "Reserved Vector", "name", "INT34", "base", 0xFFC4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT35", Global.newObject("comment", "Reserved Vector", "name", "INT35", "base", 0xFFC6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT36", Global.newObject("comment", "Reserved Vector", "name", "INT36", "base", 0xFFC8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT37", Global.newObject("comment", "Reserved Vector", "name", "INT37", "base", 0xFFCAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT38", Global.newObject("comment", "Reserved Vector", "name", "INT38", "base", 0xFFCCL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT39", Global.newObject("comment", "Reserved Vector", "name", "INT39", "base", 0xFFCEL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT40", Global.newObject("comment", "Reserved Vector", "name", "INT40", "base", 0xFFD0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT41", Global.newObject("comment", "RTC_A Vector", "name", "INT41", "base", 0xFFD2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT42", Global.newObject("comment", "I/O Port P2 Vector", "name", "INT42", "base", 0xFFD4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT43", Global.newObject("comment", "USCI_B3 Receive/Transmit Vector", "name", "INT43", "base", 0xFFD6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT44", Global.newObject("comment", "USCI_A3 Receive/Transmit Vector", "name", "INT44", "base", 0xFFD8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT45", Global.newObject("comment", "USCI_B1 Receive/Transmit Vector", "name", "INT45", "base", 0xFFDAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT46", Global.newObject("comment", "USCI_A1 Receive/Transmit Vector", "name", "INT46", "base", 0xFFDCL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT47", Global.newObject("comment", "I/O Port P1 Vector", "name", "INT47", "base", 0xFFDEL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT48", Global.newObject("comment", "TA1 CCR1-CCR2 Vector", "name", "INT48", "base", 0xFFE0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT49", Global.newObject("comment", "TA1 CCR0 Vector", "name", "INT49", "base", 0xFFE2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT50", Global.newObject("comment", "DMA Vector", "name", "INT50", "base", 0xFFE4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT51", Global.newObject("comment", "USCI_B2 Receive/Transmit Vector", "name", "INT51", "base", 0xFFE6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT52", Global.newObject("comment", "USCI_A2 Receive/Transmit Vector", "name", "INT52", "base", 0xFFE8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT53", Global.newObject("comment", "TA0 CCR1-CCR4 Vector", "name", "INT53", "base", 0xFFEAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT54", Global.newObject("comment", "TA0 CCR0 Vector", "name", "INT54", "base", 0xFFECL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT55", Global.newObject("comment", "ADC12_A Vector", "name", "INT55", "base", 0xFFEEL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT56", Global.newObject("comment", "USCI_B0 Receive/Transmit Vector", "name", "INT56", "base", 0xFFF0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT57", Global.newObject("comment", "USCI_A0 Receive/Transmit Vector", "name", "INT57", "base", 0xFFF2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT58", Global.newObject("comment", "Watchdog Timer_A Interval Timer Mode Vector", "name", "INT58", "base", 0xFFF4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT59", Global.newObject("comment", "TB0 CCR1-CCR6 Vector", "name", "INT59", "base", 0xFFF6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT60", Global.newObject("comment", "TB0 CCR0 Vector", "name", "INT60", "base", 0xFFF8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT61", Global.newObject("comment", "User NMI Vector", "name", "INT61", "base", 0xFFFAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT62", Global.newObject("comment", "System NMI Vector", "name", "INT62", "base", 0xFFFCL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"RESET", Global.newObject("comment", "Reset Vector", "name", "RESET", "base", 0xFFFEL, "len", 0x2L, "space", "data")})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx$$Params", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.IMSP430F54xx.Params", om.findStrict("ti.catalog.msp430.IMSP430$$Params", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "MSP430X", "wh");
        po.addFld("isa", $$T_Str, "430|430X", "wh");
        po.addFld("interruptEnableRegister1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("TA0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("TA1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("TB0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("wdtPlus", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("interruptController", (Proto)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance", "ti.catalog.msp430.f54xx"), $$UNDEF, "wh");
        po.addFld("commonMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"PERIPHERALS", Global.newObject("comment", "Memory mapped peripherals", "name", "PERIPHERALS", "base", 0x0L, "len", 0x1000L, "space", "io", "access", "RW")}), Global.newArray(new Object[]{"BSL", Global.newObject("comment", "Bootstrap loader (flash)", "name", "BSL", "base", 0x1000L, "len", 0x800L, "space", "code", "access", "RW")}), Global.newArray(new Object[]{"INFO", Global.newObject("comment", "Information memory (flash)", "name", "INFO", "base", 0x1800L, "len", 0x200L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"INT00", Global.newObject("comment", "Reserved Vector", "name", "INT00", "base", 0xFF80L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT01", Global.newObject("comment", "Reserved Vector", "name", "INT01", "base", 0xFF82L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT02", Global.newObject("comment", "Reserved Vector", "name", "INT02", "base", 0xFF84L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT03", Global.newObject("comment", "Reserved Vector", "name", "INT03", "base", 0xFF86L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT04", Global.newObject("comment", "Reserved Vector", "name", "INT04", "base", 0xFF88L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT05", Global.newObject("comment", "Reserved Vector", "name", "INT05", "base", 0xFF8AL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT06", Global.newObject("comment", "Reserved Vector", "name", "INT06", "base", 0xFF8CL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT07", Global.newObject("comment", "Reserved Vector", "name", "INT07", "base", 0xFF8EL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT08", Global.newObject("comment", "Reserved Vector", "name", "INT08", "base", 0xFF90L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT09", Global.newObject("comment", "Reserved Vector", "name", "INT09", "base", 0xFF92L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT10", Global.newObject("comment", "Reserved Vector", "name", "INT10", "base", 0xFF94L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT11", Global.newObject("comment", "Reserved Vector", "name", "INT11", "base", 0xFF96L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT12", Global.newObject("comment", "Reserved Vector", "name", "INT12", "base", 0xFF98L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT13", Global.newObject("comment", "Reserved Vector", "name", "INT13", "base", 0xFF9AL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT14", Global.newObject("comment", "Reserved Vector", "name", "INT14", "base", 0xFF9CL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT15", Global.newObject("comment", "Reserved Vector", "name", "INT15", "base", 0xFF9EL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT16", Global.newObject("comment", "Reserved Vector", "name", "INT16", "base", 0xFFA0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT17", Global.newObject("comment", "Reserved Vector", "name", "INT17", "base", 0xFFA2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT18", Global.newObject("comment", "Reserved Vector", "name", "INT18", "base", 0xFFA4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT19", Global.newObject("comment", "Reserved Vector", "name", "INT19", "base", 0xFFA6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT20", Global.newObject("comment", "Reserved Vector", "name", "INT20", "base", 0xFFA8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT21", Global.newObject("comment", "Reserved Vector", "name", "INT21", "base", 0xFFAAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT22", Global.newObject("comment", "Reserved Vector", "name", "INT22", "base", 0xFFACL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT23", Global.newObject("comment", "Reserved Vector", "name", "INT23", "base", 0xFFAEL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT24", Global.newObject("comment", "Reserved Vector", "name", "INT24", "base", 0xFFB0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT25", Global.newObject("comment", "Reserved Vector", "name", "INT25", "base", 0xFFB2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT26", Global.newObject("comment", "Reserved Vector", "name", "INT26", "base", 0xFFB4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT27", Global.newObject("comment", "Reserved Vector", "name", "INT27", "base", 0xFFB6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT28", Global.newObject("comment", "Reserved Vector", "name", "INT28", "base", 0xFFB8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT29", Global.newObject("comment", "Reserved Vector", "name", "INT29", "base", 0xFFBAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT30", Global.newObject("comment", "Reserved Vector", "name", "INT30", "base", 0xFFBCL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT31", Global.newObject("comment", "Reserved Vector", "name", "INT31", "base", 0xFFBEL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT32", Global.newObject("comment", "Reserved Vector", "name", "INT32", "base", 0xFFC0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT33", Global.newObject("comment", "Reserved Vector", "name", "INT33", "base", 0xFFC2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT34", Global.newObject("comment", "Reserved Vector", "name", "INT34", "base", 0xFFC4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT35", Global.newObject("comment", "Reserved Vector", "name", "INT35", "base", 0xFFC6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT36", Global.newObject("comment", "Reserved Vector", "name", "INT36", "base", 0xFFC8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT37", Global.newObject("comment", "Reserved Vector", "name", "INT37", "base", 0xFFCAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT38", Global.newObject("comment", "Reserved Vector", "name", "INT38", "base", 0xFFCCL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT39", Global.newObject("comment", "Reserved Vector", "name", "INT39", "base", 0xFFCEL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT40", Global.newObject("comment", "Reserved Vector", "name", "INT40", "base", 0xFFD0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT41", Global.newObject("comment", "RTC_A Vector", "name", "INT41", "base", 0xFFD2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT42", Global.newObject("comment", "I/O Port P2 Vector", "name", "INT42", "base", 0xFFD4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT43", Global.newObject("comment", "USCI_B3 Receive/Transmit Vector", "name", "INT43", "base", 0xFFD6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT44", Global.newObject("comment", "USCI_A3 Receive/Transmit Vector", "name", "INT44", "base", 0xFFD8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT45", Global.newObject("comment", "USCI_B1 Receive/Transmit Vector", "name", "INT45", "base", 0xFFDAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT46", Global.newObject("comment", "USCI_A1 Receive/Transmit Vector", "name", "INT46", "base", 0xFFDCL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT47", Global.newObject("comment", "I/O Port P1 Vector", "name", "INT47", "base", 0xFFDEL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT48", Global.newObject("comment", "TA1 CCR1-CCR2 Vector", "name", "INT48", "base", 0xFFE0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT49", Global.newObject("comment", "TA1 CCR0 Vector", "name", "INT49", "base", 0xFFE2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT50", Global.newObject("comment", "DMA Vector", "name", "INT50", "base", 0xFFE4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT51", Global.newObject("comment", "USCI_B2 Receive/Transmit Vector", "name", "INT51", "base", 0xFFE6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT52", Global.newObject("comment", "USCI_A2 Receive/Transmit Vector", "name", "INT52", "base", 0xFFE8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT53", Global.newObject("comment", "TA0 CCR1-CCR4 Vector", "name", "INT53", "base", 0xFFEAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT54", Global.newObject("comment", "TA0 CCR0 Vector", "name", "INT54", "base", 0xFFECL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT55", Global.newObject("comment", "ADC12_A Vector", "name", "INT55", "base", 0xFFEEL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT56", Global.newObject("comment", "USCI_B0 Receive/Transmit Vector", "name", "INT56", "base", 0xFFF0L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT57", Global.newObject("comment", "USCI_A0 Receive/Transmit Vector", "name", "INT57", "base", 0xFFF2L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT58", Global.newObject("comment", "Watchdog Timer_A Interval Timer Mode Vector", "name", "INT58", "base", 0xFFF4L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT59", Global.newObject("comment", "TB0 CCR1-CCR6 Vector", "name", "INT59", "base", 0xFFF6L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT60", Global.newObject("comment", "TB0 CCR0 Vector", "name", "INT60", "base", 0xFFF8L, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT61", Global.newObject("comment", "User NMI Vector", "name", "INT61", "base", 0xFFFAL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"INT62", Global.newObject("comment", "System NMI Vector", "name", "INT62", "base", 0xFFFCL, "len", 0x2L, "space", "data")}), Global.newArray(new Object[]{"RESET", Global.newObject("comment", "Reset Vector", "name", "RESET", "base", 0xFFFEL, "len", 0x2L, "space", "data")})}), "wh");
    }

    void MSP430F5418$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Module", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5418.Module", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Module", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418$$create", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5418$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418$$construct", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5418$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Instance", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5418.Instance", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Instance", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x15C00L, "space", "code", "access", "RWX")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418$$Params", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5418.Params", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx$$Params", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x15C00L, "space", "code", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418$$Object", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5418.Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Instance", "ti.catalog.msp430.f54xx"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
    }

    void MSP430F5419$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Module", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5419.Module", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Module", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419$$create", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5419$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419$$construct", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5419$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Instance", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5419.Instance", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Instance", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x15C00L, "space", "code", "access", "RWX")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419$$Params", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5419.Params", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx$$Params", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x15C00L, "space", "code", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419$$Object", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5419.Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Instance", "ti.catalog.msp430.f54xx"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
    }

    void MSP430F5435$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Module", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5435.Module", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Module", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435$$create", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5435$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435$$construct", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5435$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Instance", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5435.Instance", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Instance", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x25C00L, "space", "code", "access", "RWX")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435$$Params", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5435.Params", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx$$Params", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x25C00L, "space", "code", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435$$Object", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5435.Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Instance", "ti.catalog.msp430.f54xx"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
    }

    void MSP430F5436$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Module", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5436.Module", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Module", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436$$create", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5436$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436$$construct", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5436$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Instance", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5436.Instance", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Instance", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x25C00L, "space", "code", "access", "RWX")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436$$Params", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5436.Params", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx$$Params", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x25C00L, "space", "code", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436$$Object", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5436.Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Instance", "ti.catalog.msp430.f54xx"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
    }

    void MSP430F5437$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Module", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5437.Module", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Module", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437$$create", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5437$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437$$construct", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5437$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Instance", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5437.Instance", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Instance", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x35C00L, "space", "code", "access", "RWX")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437$$Params", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5437.Params", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx$$Params", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x35C00L, "space", "code", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437$$Object", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5437.Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Instance", "ti.catalog.msp430.f54xx"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
    }

    void MSP430F5438$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Module", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5438.Module", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Module", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438$$create", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5438$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438$$construct", "ti.catalog.msp430.f54xx"), Global.get("ti$catalog$msp430$f54xx$MSP430F5438$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Instance", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5438.Instance", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Instance", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x35C00L, "space", "code", "access", "RWX")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438$$Params", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5438.Params", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx$$Params", "ti.catalog.msp430.f54xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.msp430.f54xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"RAM", Global.newObject("comment", "Data RAM", "name", "RAM", "base", 0x1C00L, "len", 0x4000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "Program FLASH", "name", "FLASH", "base", 0x5C00L, "len", 0xA380L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH2", Global.newObject("comment", "Extended Program FLASH", "name", "FLASH2", "base", 0x10000L, "len", 0x35C00L, "space", "code", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438$$Object", "ti.catalog.msp430.f54xx");
        po.init("ti.catalog.msp430.f54xx.MSP430F5438.Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Instance", "ti.catalog.msp430.f54xx"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430.f54xx"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430.f54xx"), $$UNDEF);
    }

    void IMSP430F54xx$$ROV()
    {
    }

    void MSP430F5418$$ROV()
    {
    }

    void MSP430F5419$$ROV()
    {
    }

    void MSP430F5435$$ROV()
    {
    }

    void MSP430F5436$$ROV()
    {
    }

    void MSP430F5437$$ROV()
    {
    }

    void MSP430F5438$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.f54xx.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.f54xx"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/f54xx/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.catalog.msp430.f54xx"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.catalog.msp430.f54xx"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.catalog.msp430.f54xx"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.catalog.msp430.f54xx"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.catalog.msp430.f54xx"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.catalog.msp430.f54xx"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.catalog.msp430.f54xx", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.f54xx");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.f54xx.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.platform", Global.newArray()));
        imports.add(Global.newArray("ti.catalog", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.f54xx'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.f54xx$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.f54xx$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.f54xx$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IMSP430F54xx$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx", "ti.catalog.msp430.f54xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Module", "ti.catalog.msp430.f54xx");
        vo.init2(po, "ti.catalog.msp430.f54xx.IMSP430F54xx", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx$$capsule", "ti.catalog.msp430.f54xx"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Instance", "ti.catalog.msp430.f54xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Params", "ti.catalog.msp430.f54xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f54xx.IMSP430F54xx.Params", "ti.catalog.msp430.f54xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f54xx", "ti.catalog.msp430.f54xx"));
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
        pkgV.bind("IMSP430F54xx", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IMSP430F54xx");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void MSP430F5418$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418", "ti.catalog.msp430.f54xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Module", "ti.catalog.msp430.f54xx");
        vo.init2(po, "ti.catalog.msp430.f54xx.MSP430F5418", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Instance", "ti.catalog.msp430.f54xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Params", "ti.catalog.msp430.f54xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Params", "ti.catalog.msp430.f54xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f54xx", "ti.catalog.msp430.f54xx"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.f54xx");
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.f54xx")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.f54xx.MSP430F5418$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418.Object", "ti.catalog.msp430.f54xx"));
        pkgV.bind("MSP430F5418", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430F5418");
    }

    void MSP430F5419$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419", "ti.catalog.msp430.f54xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Module", "ti.catalog.msp430.f54xx");
        vo.init2(po, "ti.catalog.msp430.f54xx.MSP430F5419", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Instance", "ti.catalog.msp430.f54xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Params", "ti.catalog.msp430.f54xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Params", "ti.catalog.msp430.f54xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f54xx", "ti.catalog.msp430.f54xx"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.f54xx");
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.f54xx")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.f54xx.MSP430F5419$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419.Object", "ti.catalog.msp430.f54xx"));
        pkgV.bind("MSP430F5419", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430F5419");
    }

    void MSP430F5435$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435", "ti.catalog.msp430.f54xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Module", "ti.catalog.msp430.f54xx");
        vo.init2(po, "ti.catalog.msp430.f54xx.MSP430F5435", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Instance", "ti.catalog.msp430.f54xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Params", "ti.catalog.msp430.f54xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Params", "ti.catalog.msp430.f54xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f54xx", "ti.catalog.msp430.f54xx"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.f54xx");
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.f54xx")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.f54xx.MSP430F5435$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435.Object", "ti.catalog.msp430.f54xx"));
        pkgV.bind("MSP430F5435", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430F5435");
    }

    void MSP430F5436$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436", "ti.catalog.msp430.f54xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Module", "ti.catalog.msp430.f54xx");
        vo.init2(po, "ti.catalog.msp430.f54xx.MSP430F5436", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Instance", "ti.catalog.msp430.f54xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Params", "ti.catalog.msp430.f54xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Params", "ti.catalog.msp430.f54xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f54xx", "ti.catalog.msp430.f54xx"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.f54xx");
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.f54xx")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.f54xx.MSP430F5436$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436.Object", "ti.catalog.msp430.f54xx"));
        pkgV.bind("MSP430F5436", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430F5436");
    }

    void MSP430F5437$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437", "ti.catalog.msp430.f54xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Module", "ti.catalog.msp430.f54xx");
        vo.init2(po, "ti.catalog.msp430.f54xx.MSP430F5437", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Instance", "ti.catalog.msp430.f54xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Params", "ti.catalog.msp430.f54xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Params", "ti.catalog.msp430.f54xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f54xx", "ti.catalog.msp430.f54xx"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.f54xx");
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.f54xx")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.f54xx.MSP430F5437$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437.Object", "ti.catalog.msp430.f54xx"));
        pkgV.bind("MSP430F5437", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430F5437");
    }

    void MSP430F5438$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438", "ti.catalog.msp430.f54xx");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Module", "ti.catalog.msp430.f54xx");
        vo.init2(po, "ti.catalog.msp430.f54xx.MSP430F5438", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Instance", "ti.catalog.msp430.f54xx"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Params", "ti.catalog.msp430.f54xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Params", "ti.catalog.msp430.f54xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.f54xx", "ti.catalog.msp430.f54xx"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.f54xx");
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.f54xx")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.f54xx.MSP430F5438$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438.Object", "ti.catalog.msp430.f54xx"));
        pkgV.bind("MSP430F5438", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430F5438");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5418", "ti.catalog.msp430.f54xx"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5419", "ti.catalog.msp430.f54xx"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5435", "ti.catalog.msp430.f54xx"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5436", "ti.catalog.msp430.f54xx"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5437", "ti.catalog.msp430.f54xx"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.f54xx.MSP430F5438", "ti.catalog.msp430.f54xx"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.f54xx.IMSP430F54xx")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.f54xx.MSP430F5418")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.f54xx.MSP430F5419")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.f54xx.MSP430F5435")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.f54xx.MSP430F5436")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.f54xx.MSP430F5437")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.f54xx.MSP430F5438")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.f54xx")).add(pkgV);
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
        IMSP430F54xx$$OBJECTS();
        MSP430F5418$$OBJECTS();
        MSP430F5419$$OBJECTS();
        MSP430F5435$$OBJECTS();
        MSP430F5436$$OBJECTS();
        MSP430F5437$$OBJECTS();
        MSP430F5438$$OBJECTS();
        IMSP430F54xx$$CONSTS();
        MSP430F5418$$CONSTS();
        MSP430F5419$$CONSTS();
        MSP430F5435$$CONSTS();
        MSP430F5436$$CONSTS();
        MSP430F5437$$CONSTS();
        MSP430F5438$$CONSTS();
        IMSP430F54xx$$CREATES();
        MSP430F5418$$CREATES();
        MSP430F5419$$CREATES();
        MSP430F5435$$CREATES();
        MSP430F5436$$CREATES();
        MSP430F5437$$CREATES();
        MSP430F5438$$CREATES();
        IMSP430F54xx$$FUNCTIONS();
        MSP430F5418$$FUNCTIONS();
        MSP430F5419$$FUNCTIONS();
        MSP430F5435$$FUNCTIONS();
        MSP430F5436$$FUNCTIONS();
        MSP430F5437$$FUNCTIONS();
        MSP430F5438$$FUNCTIONS();
        IMSP430F54xx$$SIZES();
        MSP430F5418$$SIZES();
        MSP430F5419$$SIZES();
        MSP430F5435$$SIZES();
        MSP430F5436$$SIZES();
        MSP430F5437$$SIZES();
        MSP430F5438$$SIZES();
        IMSP430F54xx$$TYPES();
        MSP430F5418$$TYPES();
        MSP430F5419$$TYPES();
        MSP430F5435$$TYPES();
        MSP430F5436$$TYPES();
        MSP430F5437$$TYPES();
        MSP430F5438$$TYPES();
        if (isROV) {
            IMSP430F54xx$$ROV();
            MSP430F5418$$ROV();
            MSP430F5419$$ROV();
            MSP430F5435$$ROV();
            MSP430F5436$$ROV();
            MSP430F5437$$ROV();
            MSP430F5438$$ROV();
        }//isROV
        $$SINGLETONS();
        IMSP430F54xx$$SINGLETONS();
        MSP430F5418$$SINGLETONS();
        MSP430F5419$$SINGLETONS();
        MSP430F5435$$SINGLETONS();
        MSP430F5436$$SINGLETONS();
        MSP430F5437$$SINGLETONS();
        MSP430F5438$$SINGLETONS();
        $$INITIALIZATION();
    }
}
