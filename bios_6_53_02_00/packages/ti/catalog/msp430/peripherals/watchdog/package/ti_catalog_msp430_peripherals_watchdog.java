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

public class ti_catalog_msp430_peripherals_watchdog
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
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.clock");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.special_function");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog", new Value.Obj("ti.catalog.msp430.peripherals.watchdog", pkgP));
    }

    void IWDT$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.IWDT.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.IWDT", new Value.Obj("ti.catalog.msp430.peripherals.watchdog.IWDT", po));
        pkgV.bind("IWDT", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.IWDT$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.watchdog.IWDT.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.watchdog.IWDT.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.IWDT$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.watchdog.IWDT.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.IWDT$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.watchdog.IWDT.Params", new Proto.Str(po, true));
    }

    void WDTplus$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus", new Value.Obj("ti.catalog.msp430.peripherals.watchdog.WDTplus", po));
        pkgV.bind("WDTplus", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog"));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW_t", new Proto.Enm("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW_t"));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_t", new Proto.Enm("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_t"));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_t", new Proto.Enm("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_t"));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_t", new Proto.Enm("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_t"));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_t", new Proto.Enm("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_t"));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_t", new Proto.Enm("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_t"));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_t", new Proto.Enm("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus$$WDTCTL_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCTL_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.Params", new Proto.Str(po, true));
    }

    void WDT_A$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A", new Value.Obj("ti.catalog.msp430.peripherals.watchdog.WDT_A", po));
        pkgV.bind("WDT_A", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A.Params", new Proto.Str(po, true));
    }

    void IWDT$$CONSTS()
    {
        // interface IWDT
    }

    void WDTplus$$CONSTS()
    {
        // module WDTplus
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW", xdc.services.intern.xsr.Enum.intValue(0x5A00L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_t", "ti.catalog.msp430.peripherals.watchdog"), "ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
    }

    void WDT_A$$CONSTS()
    {
        // module WDT_A
    }

    void IWDT$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void WDTplus$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Module", "ti.catalog.msp430.peripherals.watchdog"), om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance", "ti.catalog.msp430.peripherals.watchdog"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Params", "ti.catalog.msp430.peripherals.watchdog"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$watchdog$WDTplus$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.watchdog.WDTplus'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.watchdog']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Module", "ti.catalog.msp430.peripherals.watchdog"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus$$Object", "ti.catalog.msp430.peripherals.watchdog"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Params", "ti.catalog.msp430.peripherals.watchdog"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$watchdog$WDTplus$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.watchdog.WDTplus'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void WDT_A$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Module", "ti.catalog.msp430.peripherals.watchdog"), om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Instance", "ti.catalog.msp430.peripherals.watchdog"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Params", "ti.catalog.msp430.peripherals.watchdog"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$watchdog$WDT_A$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.watchdog.WDT_A'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.watchdog.WDT_A.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.watchdog']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Module", "ti.catalog.msp430.peripherals.watchdog"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A$$Object", "ti.catalog.msp430.peripherals.watchdog"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Params", "ti.catalog.msp430.peripherals.watchdog"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$watchdog$WDT_A$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.watchdog.WDT_A'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IWDT$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void WDTplus$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void WDT_A$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IWDT$$SIZES()
    {
    }

    void WDTplus$$SIZES()
    {
    }

    void WDT_A$$SIZES()
    {
    }

    void IWDT$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.Module", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.IWDT.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.watchdog"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.Instance", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.IWDT.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.watchdog"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT$$Params", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.IWDT.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.watchdog"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        // struct IWDT.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.IWDT.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
    }

    void WDTplus$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/watchdog/WDTplus.xs");
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Module", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.WDTplus.Module", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.Module", "ti.catalog.msp430.peripherals.watchdog"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus$$create", "ti.catalog.msp430.peripherals.watchdog"), Global.get("ti$catalog$msp430$peripherals$watchdog$WDTplus$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus$$construct", "ti.catalog.msp430.peripherals.watchdog"), Global.get("ti$catalog$msp430$peripherals$watchdog$WDTplus$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.watchdog.WDTplus$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.watchdog"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.watchdog"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.watchdog"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.Instance", "ti.catalog.msp430.peripherals.watchdog"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("WDTCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCTL_t", "ti.catalog.msp430.peripherals.watchdog"), Global.newObject("WDTPW", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW"), "WDTHOLD", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_OFF"), "WDTNMIES", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_OFF"), "WDTNMI", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_OFF"), "WDTTMSEL", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_OFF"), "WDTCNTCL", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_OFF"), "WDTSSEL", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_OFF"), "WDTIS0", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_OFF"), "WDTIS1", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog"), false), Global.newArray(new Object[]{Global.newObject("register", "WDTCTL", "regForceSet", true)}), "rh");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus$$Params", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.WDTplus.Params", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT$$Params", "ti.catalog.msp430.peripherals.watchdog"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("WDTCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCTL_t", "ti.catalog.msp430.peripherals.watchdog"), Global.newObject("WDTPW", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW"), "WDTHOLD", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_OFF"), "WDTNMIES", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_OFF"), "WDTNMI", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_OFF"), "WDTTMSEL", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_OFF"), "WDTCNTCL", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_OFF"), "WDTSSEL", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_OFF"), "WDTIS0", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_OFF"), "WDTIS1", om.find("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog"), false), Global.newArray(new Object[]{Global.newObject("register", "WDTCTL", "regForceSet", true)}), "rh");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus$$Object", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.WDTplus.Object", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance", "ti.catalog.msp430.peripherals.watchdog"));
        // struct WDTplus.WDTCTL_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus$$WDTCTL_t", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCTL_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("WDTPW", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW_t", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "w");
                po.addFld("WDTHOLD", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_t", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "w");
                po.addFld("WDTNMIES", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_t", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "w");
                po.addFld("WDTNMI", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_t", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "w");
                po.addFld("WDTTMSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_t", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "w");
                po.addFld("WDTCNTCL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_t", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "w");
                po.addFld("WDTSSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_t", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "w");
                po.addFld("WDTIS0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_t", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "w");
                po.addFld("WDTIS1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_t", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "w");
    }

    void WDT_A$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/watchdog/WDT_A.xs");
        om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Module", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.WDT_A.Module", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.Module", "ti.catalog.msp430.peripherals.watchdog"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A$$create", "ti.catalog.msp430.peripherals.watchdog"), Global.get("ti$catalog$msp430$peripherals$watchdog$WDT_A$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A$$construct", "ti.catalog.msp430.peripherals.watchdog"), Global.get("ti$catalog$msp430$peripherals$watchdog$WDT_A$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.watchdog.WDT_A$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.watchdog"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.watchdog"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.watchdog"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Instance", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.WDT_A.Instance", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.Instance", "ti.catalog.msp430.peripherals.watchdog"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A$$Params", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.WDT_A.Params", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT$$Params", "ti.catalog.msp430.peripherals.watchdog"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.watchdog"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A$$Object", "ti.catalog.msp430.peripherals.watchdog");
        po.init("ti.catalog.msp430.peripherals.watchdog.WDT_A.Object", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Instance", "ti.catalog.msp430.peripherals.watchdog"));
    }

    void IWDT$$ROV()
    {
    }

    void WDTplus$$ROV()
    {
    }

    void WDT_A$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.watchdog.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.watchdog"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.watchdog", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.watchdog");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.watchdog.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.catalog.msp430.peripherals.clock", Global.newArray()));
        imports.add(Global.newArray("ti.catalog.msp430.peripherals.special_function", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.watchdog'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.watchdog$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.watchdog$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.watchdog$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IWDT$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT", "ti.catalog.msp430.peripherals.watchdog");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.Module", "ti.catalog.msp430.peripherals.watchdog");
        vo.init2(po, "ti.catalog.msp430.peripherals.watchdog.IWDT", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.Instance", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.Params", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.Params", "ti.catalog.msp430.peripherals.watchdog")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.watchdog", "ti.catalog.msp430.peripherals.watchdog"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IWDT", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IWDT");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void WDTplus$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus", "ti.catalog.msp430.peripherals.watchdog");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Module", "ti.catalog.msp430.peripherals.watchdog");
        vo.init2(po, "ti.catalog.msp430.peripherals.watchdog.WDTplus", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus$$capsule", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Params", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Params", "ti.catalog.msp430.peripherals.watchdog")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.watchdog", "ti.catalog.msp430.peripherals.watchdog"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTPW_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTHOLD_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTNMIES_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTNMI_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTTMSEL_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTCNTCL_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTIS1_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTIS0_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTCTL_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCTL_t", "ti.catalog.msp430.peripherals.watchdog"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCTL_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTPW_OFF", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW_OFF", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTPW", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTPW", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTHOLD_OFF", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD_OFF", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTHOLD", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTHOLD", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTNMIES_OFF", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES_OFF", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTNMIES", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMIES", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTNMI_OFF", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI_OFF", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTNMI", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTNMI", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTTMSEL_OFF", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL_OFF", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTTMSEL", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTTMSEL", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTCNTCL_OFF", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL_OFF", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTCNTCL", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTCNTCL", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTSSEL_OFF", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL_OFF", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTSSEL", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTSSEL", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTIS1_OFF", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1_OFF", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTIS1", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS1", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTIS0_OFF", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0_OFF", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("WDTIS0", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.WDTIS0", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.watchdog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.watchdog")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.watchdog.WDTplus$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus.Object", "ti.catalog.msp430.peripherals.watchdog"));
        pkgV.bind("WDTplus", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("WDTplus");
    }

    void WDT_A$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A", "ti.catalog.msp430.peripherals.watchdog");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Module", "ti.catalog.msp430.peripherals.watchdog");
        vo.init2(po, "ti.catalog.msp430.peripherals.watchdog.WDT_A", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A$$capsule", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Instance", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Params", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Params", "ti.catalog.msp430.peripherals.watchdog")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.watchdog", "ti.catalog.msp430.peripherals.watchdog"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.watchdog.IWDT.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.watchdog"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.watchdog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.watchdog")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.watchdog.WDT_A$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A.Object", "ti.catalog.msp430.peripherals.watchdog"));
        pkgV.bind("WDT_A", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("WDT_A");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDTplus", "ti.catalog.msp430.peripherals.watchdog"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.watchdog.WDT_A", "ti.catalog.msp430.peripherals.watchdog"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.watchdog.IWDT")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.watchdog.WDTplus")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.watchdog.WDT_A")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.watchdog")).add(pkgV);
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
        IWDT$$OBJECTS();
        WDTplus$$OBJECTS();
        WDT_A$$OBJECTS();
        IWDT$$CONSTS();
        WDTplus$$CONSTS();
        WDT_A$$CONSTS();
        IWDT$$CREATES();
        WDTplus$$CREATES();
        WDT_A$$CREATES();
        IWDT$$FUNCTIONS();
        WDTplus$$FUNCTIONS();
        WDT_A$$FUNCTIONS();
        IWDT$$SIZES();
        WDTplus$$SIZES();
        WDT_A$$SIZES();
        IWDT$$TYPES();
        WDTplus$$TYPES();
        WDT_A$$TYPES();
        if (isROV) {
            IWDT$$ROV();
            WDTplus$$ROV();
            WDT_A$$ROV();
        }//isROV
        $$SINGLETONS();
        IWDT$$SINGLETONS();
        WDTplus$$SINGLETONS();
        WDT_A$$SINGLETONS();
        $$INITIALIZATION();
    }
}
