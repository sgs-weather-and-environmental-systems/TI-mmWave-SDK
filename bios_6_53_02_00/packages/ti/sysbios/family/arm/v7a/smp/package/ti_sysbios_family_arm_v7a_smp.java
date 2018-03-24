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

public class ti_sysbios_family_arm_v7a_smp
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
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.smp.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.v7a.smp", new Value.Obj("ti.sysbios.family.arm.v7a.smp", pkgP));
    }

    void GateSmp$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp", new Value.Obj("ti.sysbios.family.arm.v7a.smp.GateSmp", po));
        pkgV.bind("GateSmp", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp.Object", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance_State", "ti.sysbios.family.arm.v7a.smp"));
        }//isROV
    }

    void GateSmp$$CONSTS()
    {
        // module GateSmp
        om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp.query", new Extern("ti_sysbios_family_arm_v7a_smp_GateSmp_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp.startup", new Extern("ti_sysbios_family_arm_v7a_smp_GateSmp_startup__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void GateSmp$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$v7a$smp$GateSmp$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.v7a.smp.GateSmp.create() called before xdc.useModule('ti.sysbios.family.arm.v7a.smp.GateSmp')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Module", "ti.sysbios.family.arm.v7a.smp"), om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance", "ti.sysbios.family.arm.v7a.smp"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Params", "ti.sysbios.family.arm.v7a.smp"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$v7a$smp$GateSmp$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.v7a.smp.GateSmp'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.v7a.smp.GateSmp.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.v7a.smp']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.v7a.smp.GateSmp'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.v7a.smp.GateSmp'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Module", "ti.sysbios.family.arm.v7a.smp"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp$$Object", "ti.sysbios.family.arm.v7a.smp"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Params", "ti.sysbios.family.arm.v7a.smp"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$v7a$smp$GateSmp$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.v7a.smp.GateSmp'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.v7a.smp.GateSmp'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.v7a.smp.GateSmp'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void GateSmp$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateSmp$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance_State", "ti.sysbios.family.arm.v7a.smp");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("gateWord", "UInt32"));
        sizes.add(Global.newArray("owner", "UInt"));
        sizes.add(Global.newArray("stalls", "UInt"));
        sizes.add(Global.newArray("noStalls", "UInt"));
        sizes.add(Global.newArray("totalStalls", "UInt"));
        sizes.add(Global.newArray("maxStall", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v7a.smp.GateSmp.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v7a.smp.GateSmp.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v7a.smp.GateSmp.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void GateSmp$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7a/smp/GateSmp.xs");
        om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Module", "ti.sysbios.family.arm.v7a.smp");
        po.init("ti.sysbios.family.arm.v7a.smp.GateSmp.Module", om.findStrict("xdc.runtime.IGateProvider.Module", "ti.sysbios.family.arm.v7a.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.v7a.smp"), $$UNDEF, "wh");
            po.addFld("enableStats", $$T_Bool, false, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp$$create", "ti.sysbios.family.arm.v7a.smp"), Global.get("ti$sysbios$family$arm$v7a$smp$GateSmp$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp$$construct", "ti.sysbios.family.arm.v7a.smp"), Global.get("ti$sysbios$family$arm$v7a$smp$GateSmp$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.smp.GateSmp$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "queryMeta");
                if (fxn != null) po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "ti.sysbios.family.arm.v7a.smp"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance", "ti.sysbios.family.arm.v7a.smp");
        po.init("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance", om.findStrict("xdc.runtime.IGateProvider.Instance", "ti.sysbios.family.arm.v7a.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.v7a.smp"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp$$Params", "ti.sysbios.family.arm.v7a.smp");
        po.init("ti.sysbios.family.arm.v7a.smp.GateSmp.Params", om.findStrict("xdc.runtime.IGateProvider$$Params", "ti.sysbios.family.arm.v7a.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.v7a.smp"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp$$Object", "ti.sysbios.family.arm.v7a.smp");
        po.init("ti.sysbios.family.arm.v7a.smp.GateSmp.Object", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance", "ti.sysbios.family.arm.v7a.smp"));
        // struct GateSmp.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp$$BasicView", "ti.sysbios.family.arm.v7a.smp");
        po.init("ti.sysbios.family.arm.v7a.smp.GateSmp.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("owner", $$T_Str, $$UNDEF, "w");
                po.addFld("gateValue", $$T_Str, $$UNDEF, "w");
                po.addFld("stalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("noStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("totalStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("maxStall", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct GateSmp.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp$$Instance_State", "ti.sysbios.family.arm.v7a.smp");
        po.init("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("gateWord", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("owner", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("stalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("noStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("totalStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("maxStall", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
    }

    void GateSmp$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp", "ti.sysbios.family.arm.v7a.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp$$Instance_State", "ti.sysbios.family.arm.v7a.smp");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v7a.smp.GateSmp.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp$$Instance_State", "ti.sysbios.family.arm.v7a.smp");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.v7a.smp.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.v7a.smp"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7a/smp/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.v7a.smp"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.v7a.smp"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.v7a.smp"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.v7a.smp"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.v7a.smp"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.v7a.smp"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.v7a.smp", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.v7a.smp");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.v7a.smp.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.v7a.smp'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.v7a.smp$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.v7a.smp$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.v7a.smp$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7a.smp.aa15fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7a.smp.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void GateSmp$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp", "ti.sysbios.family.arm.v7a.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Module", "ti.sysbios.family.arm.v7a.smp");
        vo.init2(po, "ti.sysbios.family.arm.v7a.smp.GateSmp", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp$$capsule", "ti.sysbios.family.arm.v7a.smp"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance", "ti.sysbios.family.arm.v7a.smp"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Params", "ti.sysbios.family.arm.v7a.smp"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Params", "ti.sysbios.family.arm.v7a.smp")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Handle", "ti.sysbios.family.arm.v7a.smp"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v7a.smp", "ti.sysbios.family.arm.v7a.smp"));
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
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.BasicView", "ti.sysbios.family.arm.v7a.smp"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.BasicView", "ti.sysbios.family.arm.v7a.smp"));
        mcfgs.add("enableStats");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance_State", "ti.sysbios.family.arm.v7a.smp"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Instance_State", "ti.sysbios.family.arm.v7a.smp"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v7a.smp")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.v7a.smp.GateSmp$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$v7a$smp$GateSmp$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.query", "ti.sysbios.family.arm.v7a.smp"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.startup", "ti.sysbios.family.arm.v7a.smp"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v7a_smp_GateSmp_Handle__label__E", "ti_sysbios_family_arm_v7a_smp_GateSmp_Module__startupDone__E", "ti_sysbios_family_arm_v7a_smp_GateSmp_Object__create__E", "ti_sysbios_family_arm_v7a_smp_GateSmp_Object__delete__E", "ti_sysbios_family_arm_v7a_smp_GateSmp_Object__get__E", "ti_sysbios_family_arm_v7a_smp_GateSmp_Object__first__E", "ti_sysbios_family_arm_v7a_smp_GateSmp_Object__next__E", "ti_sysbios_family_arm_v7a_smp_GateSmp_Params__init__E", "ti_sysbios_family_arm_v7a_smp_GateSmp_query__E", "ti_sysbios_family_arm_v7a_smp_GateSmp_enter__E", "ti_sysbios_family_arm_v7a_smp_GateSmp_leave__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Object", "ti.sysbios.family.arm.v7a.smp"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GateSmp", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateSmp");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.v7a.smp")).findStrict("PARAMS", "ti.sysbios.family.arm.v7a.smp");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp", "ti.sysbios.family.arm.v7a.smp")).findStrict("PARAMS", "ti.sysbios.family.arm.v7a.smp");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp", "ti.sysbios.family.arm.v7a.smp"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp", "ti.sysbios.family.arm.v7a.smp");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v7a.smp.GateSmp")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.v7a.smp")).add(pkgV);
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
        GateSmp$$OBJECTS();
        GateSmp$$CONSTS();
        GateSmp$$CREATES();
        GateSmp$$FUNCTIONS();
        GateSmp$$SIZES();
        GateSmp$$TYPES();
        if (isROV) {
            GateSmp$$ROV();
        }//isROV
        $$SINGLETONS();
        GateSmp$$SINGLETONS();
        $$INITIALIZATION();
    }
}
