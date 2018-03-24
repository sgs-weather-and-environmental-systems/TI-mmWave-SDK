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

public class ti_catalog_msp430_peripherals_interrupt
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
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.interrupt.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.interrupt", new Value.Obj("ti.catalog.msp430.peripherals.interrupt", pkgP));
    }

    void Interrupt_Controller$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller", new Value.Obj("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller", po));
        pkgV.bind("Interrupt_Controller", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Params", new Proto.Str(po, true));
    }

    void Interrupt_Controller$$CONSTS()
    {
        // module Interrupt_Controller
    }

    void Interrupt_Controller$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Module", "ti.catalog.msp430.peripherals.interrupt"), om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance", "ti.catalog.msp430.peripherals.interrupt"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Params", "ti.catalog.msp430.peripherals.interrupt"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$interrupt$Interrupt_Controller$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.interrupt']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.numInterrupts = __mod.PARAMS.numInterrupts;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Module", "ti.catalog.msp430.peripherals.interrupt"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller$$Object", "ti.catalog.msp430.peripherals.interrupt"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Params", "ti.catalog.msp430.peripherals.interrupt"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$interrupt$Interrupt_Controller$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.numInterrupts = __mod.PARAMS.numInterrupts;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Interrupt_Controller$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Interrupt_Controller$$SIZES()
    {
    }

    void Interrupt_Controller$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Module", "ti.catalog.msp430.peripherals.interrupt");
        po.init("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.interrupt"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller$$create", "ti.catalog.msp430.peripherals.interrupt"), Global.get("ti$catalog$msp430$peripherals$interrupt$Interrupt_Controller$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller$$construct", "ti.catalog.msp430.peripherals.interrupt"), Global.get("ti$catalog$msp430$peripherals$interrupt$Interrupt_Controller$$construct"));
                po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.interrupt"), $$UNDEF);
                po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.interrupt"), $$UNDEF);
                po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.interrupt"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance", "ti.catalog.msp430.peripherals.interrupt");
        po.init("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.interrupt"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("numInterrupts", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller$$Params", "ti.catalog.msp430.peripherals.interrupt");
        po.init("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.interrupt"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("numInterrupts", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller$$Object", "ti.catalog.msp430.peripherals.interrupt");
        po.init("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Object", om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance", "ti.catalog.msp430.peripherals.interrupt"));
    }

    void Interrupt_Controller$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.interrupt.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.interrupt"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.interrupt", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.interrupt");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.interrupt.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.interrupt'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.interrupt$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.interrupt$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.interrupt$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Interrupt_Controller$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller", "ti.catalog.msp430.peripherals.interrupt");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Module", "ti.catalog.msp430.peripherals.interrupt");
        vo.init2(po, "ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance", "ti.catalog.msp430.peripherals.interrupt"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Params", "ti.catalog.msp430.peripherals.interrupt"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Params", "ti.catalog.msp430.peripherals.interrupt")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.interrupt", "ti.catalog.msp430.peripherals.interrupt"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.interrupt"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.interrupt"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.interrupt")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Object", "ti.catalog.msp430.peripherals.interrupt"));
        pkgV.bind("Interrupt_Controller", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Interrupt_Controller");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller", "ti.catalog.msp430.peripherals.interrupt"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.interrupt")).add(pkgV);
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
        Interrupt_Controller$$OBJECTS();
        Interrupt_Controller$$CONSTS();
        Interrupt_Controller$$CREATES();
        Interrupt_Controller$$FUNCTIONS();
        Interrupt_Controller$$SIZES();
        Interrupt_Controller$$TYPES();
        if (isROV) {
            Interrupt_Controller$$ROV();
        }//isROV
        $$SINGLETONS();
        Interrupt_Controller$$SINGLETONS();
        $$INITIALIZATION();
    }
}
