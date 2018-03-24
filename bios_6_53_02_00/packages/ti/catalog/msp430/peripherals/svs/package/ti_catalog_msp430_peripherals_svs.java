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

public class ti_catalog_msp430_peripherals_svs
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
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.svs.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.svs", new Value.Obj("ti.catalog.msp430.peripherals.svs", pkgP));
    }

    void ISVS$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.svs.ISVS.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.svs.ISVS", new Value.Obj("ti.catalog.msp430.peripherals.svs.ISVS", po));
        pkgV.bind("ISVS", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_t", new Proto.Enm("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_t"));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_t", new Proto.Enm("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_t"));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_t", new Proto.Enm("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_t"));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_t", new Proto.Enm("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_t"));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.PORON_t", new Proto.Enm("ti.catalog.msp430.peripherals.svs.ISVS.PORON_t"));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_t", new Proto.Enm("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_t"));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_t", new Proto.Enm("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_t"));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.svs.ISVS$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.svs.ISVS.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.svs.ISVS$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.svs.ISVS$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.Params", new Proto.Str(po, true));
    }

    void SVS$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.svs.SVS.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.svs.SVS", new Value.Obj("ti.catalog.msp430.peripherals.svs.SVS", po));
        pkgV.bind("SVS", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.VLD3_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_t", "ti.catalog.msp430.peripherals.svs"));
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.VLD2_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_t", "ti.catalog.msp430.peripherals.svs"));
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.VLD1_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_t", "ti.catalog.msp430.peripherals.svs"));
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.VLD0_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_t", "ti.catalog.msp430.peripherals.svs"));
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.PORON_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.PORON_t", "ti.catalog.msp430.peripherals.svs"));
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.SVSON_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_t", "ti.catalog.msp430.peripherals.svs"));
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.SVSOP_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_t", "ti.catalog.msp430.peripherals.svs"));
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.SVSFG_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_t", "ti.catalog.msp430.peripherals.svs"));
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.svs"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.svs.SVS$$SVSCTL_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.SVSCTL_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.svs.SVS.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.svs.SVS$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.svs.SVS$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.svs.SVS.Params", new Proto.Str(po, true));
    }

    void ISVS$$CONSTS()
    {
        // interface ISVS
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.VLD3_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.VLD3", xdc.services.intern.xsr.Enum.intValue(0x80L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.VLD2_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.VLD2", xdc.services.intern.xsr.Enum.intValue(0x40L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.VLD1_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.VLD1", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.VLD0_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.VLD0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.VLD0", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.PORON_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.PORON_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.PORON_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.PORON", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.PORON_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.PORON", xdc.services.intern.xsr.Enum.intValue(0x08L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.SVSON_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.SVSON", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.SVSON", xdc.services.intern.xsr.Enum.intValue(0x04L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.SVSOP", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_t", "ti.catalog.msp430.peripherals.svs"), "ti.catalog.msp430.peripherals.svs.ISVS.SVSFG", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
    }

    void SVS$$CONSTS()
    {
        // module SVS
    }

    void ISVS$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void SVS$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.svs.SVS$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Module", "ti.catalog.msp430.peripherals.svs"), om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Instance", "ti.catalog.msp430.peripherals.svs"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Params", "ti.catalog.msp430.peripherals.svs"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$svs$SVS$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.svs.SVS'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.svs.SVS.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.svs']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.svs.SVS$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Module", "ti.catalog.msp430.peripherals.svs"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS$$Object", "ti.catalog.msp430.peripherals.svs"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Params", "ti.catalog.msp430.peripherals.svs"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$svs$SVS$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.svs.SVS'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ISVS$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SVS$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ISVS$$SIZES()
    {
    }

    void SVS$$SIZES()
    {
    }

    void ISVS$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.Module", "ti.catalog.msp430.peripherals.svs");
        po.init("ti.catalog.msp430.peripherals.svs.ISVS.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.svs"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.Instance", "ti.catalog.msp430.peripherals.svs");
        po.init("ti.catalog.msp430.peripherals.svs.ISVS.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.svs"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS$$Params", "ti.catalog.msp430.peripherals.svs");
        po.init("ti.catalog.msp430.peripherals.svs.ISVS.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.svs"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        // struct ISVS.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.svs");
        po.init("ti.catalog.msp430.peripherals.svs.ISVS.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
    }

    void SVS$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/svs/SVS.xs");
        om.bind("ti.catalog.msp430.peripherals.svs.SVS$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Module", "ti.catalog.msp430.peripherals.svs");
        po.init("ti.catalog.msp430.peripherals.svs.SVS.Module", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.Module", "ti.catalog.msp430.peripherals.svs"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS$$create", "ti.catalog.msp430.peripherals.svs"), Global.get("ti$catalog$msp430$peripherals$svs$SVS$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS$$construct", "ti.catalog.msp430.peripherals.svs"), Global.get("ti$catalog$msp430$peripherals$svs$SVS$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.svs.SVS$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.svs.SVS$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.svs.SVS$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.svs.SVS$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.svs"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.svs"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.svs"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Instance", "ti.catalog.msp430.peripherals.svs");
        po.init("ti.catalog.msp430.peripherals.svs.SVS.Instance", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.Instance", "ti.catalog.msp430.peripherals.svs"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("SVSCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.SVSCTL_t", "ti.catalog.msp430.peripherals.svs"), Global.newObject("VLD3", om.find("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_OFF"), "VLD2", om.find("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_OFF"), "VLD1", om.find("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_OFF"), "VLD0", om.find("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_OFF"), "PORON", om.find("ti.catalog.msp430.peripherals.svs.ISVS.PORON_OFF"), "SVSON", om.find("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_OFF"), "SVSOP", om.find("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_OFF"), "SVSFG", om.find("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.svs"), false), Global.newArray(new Object[]{Global.newObject("register", "SVSCTL", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS$$Params", "ti.catalog.msp430.peripherals.svs");
        po.init("ti.catalog.msp430.peripherals.svs.SVS.Params", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS$$Params", "ti.catalog.msp430.peripherals.svs"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("SVSCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.SVSCTL_t", "ti.catalog.msp430.peripherals.svs"), Global.newObject("VLD3", om.find("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_OFF"), "VLD2", om.find("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_OFF"), "VLD1", om.find("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_OFF"), "VLD0", om.find("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_OFF"), "PORON", om.find("ti.catalog.msp430.peripherals.svs.ISVS.PORON_OFF"), "SVSON", om.find("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_OFF"), "SVSOP", om.find("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_OFF"), "SVSFG", om.find("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.svs"), false), Global.newArray(new Object[]{Global.newObject("register", "SVSCTL", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS$$Object", "ti.catalog.msp430.peripherals.svs");
        po.init("ti.catalog.msp430.peripherals.svs.SVS.Object", om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Instance", "ti.catalog.msp430.peripherals.svs"));
        // struct SVS.SVSCTL_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS$$SVSCTL_t", "ti.catalog.msp430.peripherals.svs");
        po.init("ti.catalog.msp430.peripherals.svs.SVS.SVSCTL_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("VLD3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.VLD3_t", "ti.catalog.msp430.peripherals.svs"), $$UNDEF, "w");
                po.addFld("VLD2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.VLD2_t", "ti.catalog.msp430.peripherals.svs"), $$UNDEF, "w");
                po.addFld("VLD1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.VLD1_t", "ti.catalog.msp430.peripherals.svs"), $$UNDEF, "w");
                po.addFld("VLD0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.VLD0_t", "ti.catalog.msp430.peripherals.svs"), $$UNDEF, "w");
                po.addFld("PORON", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.PORON_t", "ti.catalog.msp430.peripherals.svs"), $$UNDEF, "w");
                po.addFld("SVSON", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.SVSON_t", "ti.catalog.msp430.peripherals.svs"), $$UNDEF, "w");
                po.addFld("SVSOP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.SVSOP_t", "ti.catalog.msp430.peripherals.svs"), $$UNDEF, "w");
                po.addFld("SVSFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.SVSFG_t", "ti.catalog.msp430.peripherals.svs"), $$UNDEF, "w");
    }

    void ISVS$$ROV()
    {
    }

    void SVS$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.svs.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.svs"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.svs", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.svs");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.svs.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.svs'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.svs$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.svs$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.svs$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void ISVS$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS", "ti.catalog.msp430.peripherals.svs");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.Module", "ti.catalog.msp430.peripherals.svs");
        vo.init2(po, "ti.catalog.msp430.peripherals.svs.ISVS", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.Instance", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.Params", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.Params", "ti.catalog.msp430.peripherals.svs")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.svs", "ti.catalog.msp430.peripherals.svs"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD3_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD2_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD1_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD0_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("PORON_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.PORON_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSON_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSOP_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSFG_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.svs"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD3_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD3", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD3", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD2_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD2", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD2", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD1_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD1", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD1", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD0_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD0", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD0", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("PORON_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.PORON_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("PORON", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.PORON", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSON_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSON", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSON", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSOP_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSOP", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSFG", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ISVS", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ISVS");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void SVS$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS", "ti.catalog.msp430.peripherals.svs");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Module", "ti.catalog.msp430.peripherals.svs");
        vo.init2(po, "ti.catalog.msp430.peripherals.svs.SVS", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.svs.SVS$$capsule", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Instance", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Params", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Params", "ti.catalog.msp430.peripherals.svs")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.svs", "ti.catalog.msp430.peripherals.svs"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD3_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD2_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD1_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD0_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("PORON_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.PORON_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSON_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSOP_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSFG_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.svs"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSCTL_t", om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.SVSCTL_t", "ti.catalog.msp430.peripherals.svs"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.SVSCTL_t", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD3_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD3_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD3", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD3", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD2_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD2_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD2", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD2", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD1_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD1_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD1", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD1", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD0_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD0_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("VLD0", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.VLD0", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("PORON_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.PORON_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("PORON", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.PORON", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSON_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSON_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSON", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSON", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSOP_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSOP", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSOP", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG_OFF", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("SVSFG", om.findStrict("ti.catalog.msp430.peripherals.svs.ISVS.SVSFG", "ti.catalog.msp430.peripherals.svs"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.svs");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.svs")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.svs.SVS$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.svs.SVS.Object", "ti.catalog.msp430.peripherals.svs"));
        pkgV.bind("SVS", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SVS");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.svs.SVS", "ti.catalog.msp430.peripherals.svs"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.svs.ISVS")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.svs.SVS")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.svs")).add(pkgV);
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
        ISVS$$OBJECTS();
        SVS$$OBJECTS();
        ISVS$$CONSTS();
        SVS$$CONSTS();
        ISVS$$CREATES();
        SVS$$CREATES();
        ISVS$$FUNCTIONS();
        SVS$$FUNCTIONS();
        ISVS$$SIZES();
        SVS$$SIZES();
        ISVS$$TYPES();
        SVS$$TYPES();
        if (isROV) {
            ISVS$$ROV();
            SVS$$ROV();
        }//isROV
        $$SINGLETONS();
        ISVS$$SINGLETONS();
        SVS$$SINGLETONS();
        $$INITIALIZATION();
    }
}
