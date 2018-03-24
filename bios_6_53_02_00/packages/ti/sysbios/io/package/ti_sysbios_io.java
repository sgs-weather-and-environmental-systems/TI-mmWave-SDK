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

public class ti_sysbios_io
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
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
        Global.callFxn("loadPackage", xdcO, "xdc.runtime.knl");
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.knl");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.io.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.io", new Value.Obj("ti.sysbios.io", pkgP));
    }

    void DEV$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.io.DEV.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.io.DEV", new Value.Obj("ti.sysbios.io.DEV", po));
        pkgV.bind("DEV", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.io.DEV$$Fxns", new Proto.Obj());
        om.bind("ti.sysbios.io.DEV.Fxns", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.io.DEV$$DeviceParams", new Proto.Obj());
        om.bind("ti.sysbios.io.DEV.DeviceParams", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.io.DEV$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.io.DEV.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.io.DEV$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.io.DEV.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.io.DEV$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.io.DEV.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.io.DEV.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.io.DEV$$Object", new Proto.Obj());
        om.bind("ti.sysbios.io.DEV.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.io.DEV$$Params", new Proto.Obj());
        om.bind("ti.sysbios.io.DEV.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.io.DEV.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.io.DEV.Object", om.findStrict("ti.sysbios.io.DEV.Instance_State", "ti.sysbios.io"));
        }//isROV
    }

    void GIO$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.io.GIO.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.io.GIO", new Value.Obj("ti.sysbios.io.GIO", po));
        pkgV.bind("GIO", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.io.GIO$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.io.GIO.BasicView", new Proto.Str(spo, false));
        om.bind("ti.sysbios.io.GIO.Model", new Proto.Enm("ti.sysbios.io.GIO.Model"));
        spo = (Proto.Obj)om.bind("ti.sysbios.io.GIO$$AppCallback", new Proto.Obj());
        om.bind("ti.sysbios.io.GIO.AppCallback", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.io.GIO$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.io.GIO.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.io.GIO.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.io.GIO$$Object", new Proto.Obj());
        om.bind("ti.sysbios.io.GIO.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.io.GIO$$Params", new Proto.Obj());
        om.bind("ti.sysbios.io.GIO.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.io.GIO.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.io.GIO.Object", om.findStrict("ti.sysbios.io.GIO.Instance_State", "ti.sysbios.io"));
        }//isROV
    }

    void DEV$$CONSTS()
    {
        // module DEV
        om.bind("ti.sysbios.io.DEV.match", new Extern("ti_sysbios_io_DEV_match__E", "xdc_String(*)(xdc_String,ti_sysbios_io_DEV_Handle*)", true, false));
        om.bind("ti.sysbios.io.DEV.postInit", new Extern("ti_sysbios_io_DEV_postInit__I", "xdc_Int(*)(ti_sysbios_io_DEV_Object*,xdc_runtime_Error_Block*)", true, false));
    }

    void GIO$$CONSTS()
    {
        // module GIO
        om.bind("ti.sysbios.io.GIO.INPUT", 0x1L);
        om.bind("ti.sysbios.io.GIO.OUTPUT", 0x2L);
        om.bind("ti.sysbios.io.GIO.INOUT", 0x3L);
        om.bind("ti.sysbios.io.GIO.Model_STANDARD", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.io.GIO.Model", "ti.sysbios.io"), "ti.sysbios.io.GIO.Model_STANDARD", 0));
        om.bind("ti.sysbios.io.GIO.Model_ISSUERECLAIM", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.io.GIO.Model", "ti.sysbios.io"), "ti.sysbios.io.GIO.Model_ISSUERECLAIM", 1));
        om.bind("ti.sysbios.io.GIO.addDevice", new Extern("ti_sysbios_io_GIO_addDevice__E", "xdc_Int(*)(xdc_String,xdc_Ptr,xdc_Void(*)(xdc_Void),xdc_Int,xdc_Ptr)", true, false));
        om.bind("ti.sysbios.io.GIO.removeDevice", new Extern("ti_sysbios_io_GIO_removeDevice__E", "xdc_Int(*)(xdc_String)", true, false));
    }

    void DEV$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$io$DEV$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.io.DEV.create() called before xdc.useModule('ti.sysbios.io.DEV')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.name, inst.$args.fxns, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.io.DEV$$create", new Proto.Fxn(om.findStrict("ti.sysbios.io.DEV.Module", "ti.sysbios.io"), om.findStrict("ti.sysbios.io.DEV.Instance", "ti.sysbios.io"), 3, 2, false));
                        fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                        fxn.addArg(1, "fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.io.DEV.Params", "ti.sysbios.io"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$io$DEV$$create = function( name, fxns, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.io.DEV'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.io.DEV.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.io']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {name:name, fxns:fxns});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.io.DEV'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [name, fxns]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.io.DEV'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.io.DEV$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.io.DEV.Module", "ti.sysbios.io"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.io.DEV$$Object", "ti.sysbios.io"), null);
                        fxn.addArg(1, "name", $$T_Str, $$UNDEF);
                        fxn.addArg(2, "fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.io.DEV.Params", "ti.sysbios.io"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$io$DEV$$construct = function( __obj, name, fxns, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.io.DEV'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {name:name, fxns:fxns});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.io.DEV'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.io.DEV'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void GIO$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$io$GIO$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.io.GIO.create() called before xdc.useModule('ti.sysbios.io.GIO')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.name, inst.$args.mode, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.io.GIO$$create", new Proto.Fxn(om.findStrict("ti.sysbios.io.GIO.Module", "ti.sysbios.io"), om.findStrict("ti.sysbios.io.GIO.Instance", "ti.sysbios.io"), 3, 2, false));
                        fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                        fxn.addArg(1, "mode", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.io.GIO.Params", "ti.sysbios.io"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$io$GIO$$create = function( name, mode, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.io.GIO'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.io.GIO.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.io']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {name:name, mode:mode});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.io.GIO'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [name, mode]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.io.GIO'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.io.GIO$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.io.GIO.Module", "ti.sysbios.io"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.io.GIO$$Object", "ti.sysbios.io"), null);
                        fxn.addArg(1, "name", $$T_Str, $$UNDEF);
                        fxn.addArg(2, "mode", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.io.GIO.Params", "ti.sysbios.io"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$io$GIO$$construct = function( __obj, name, mode, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.io.GIO'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {name:name, mode:mode});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.io.GIO'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.io.GIO'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void DEV$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GIO$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn GIO.addDeviceMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.io.GIO$$addDeviceMeta", new Proto.Fxn(om.findStrict("ti.sysbios.io.GIO.Module", "ti.sysbios.io"), null, 5, 5, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "fxns", $$T_Str, $$UNDEF);
                fxn.addArg(2, "initFxn", $$T_Str, $$UNDEF);
                fxn.addArg(3, "devid", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(4, "params", $$T_Str, $$UNDEF);
    }

    void DEV$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.io.DEV.Fxns", "ti.sysbios.io");
        sizes.clear();
        sizes.add(Global.newArray("mdBindDev", "UFxn"));
        sizes.add(Global.newArray("mdUnBindDev", "UFxn"));
        sizes.add(Global.newArray("mdControlChan", "UFxn"));
        sizes.add(Global.newArray("mdCreateChan", "UFxn"));
        sizes.add(Global.newArray("mdDeleteChan", "UFxn"));
        sizes.add(Global.newArray("mdSubmitChan", "UFxn"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.io.DEV.Fxns']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.io.DEV.Fxns']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.io.DEV.Fxns'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.io.DEV.DeviceParams", "ti.sysbios.io");
        sizes.clear();
        sizes.add(Global.newArray("dummy", "TInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.io.DEV.DeviceParams']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.io.DEV.DeviceParams']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.io.DEV.DeviceParams'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.io.DEV.Instance_State", "ti.sysbios.io");
        sizes.clear();
        sizes.add(Global.newArray("name", "UPtr"));
        sizes.add(Global.newArray("fxns", "UPtr"));
        sizes.add(Global.newArray("initFxn", "UFxn"));
        sizes.add(Global.newArray("devid", "TInt"));
        sizes.add(Global.newArray("deviceParams", "UPtr"));
        sizes.add(Global.newArray("devp", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.io.DEV.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.io.DEV.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.io.DEV.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.io.DEV.Module_State", "ti.sysbios.io");
        sizes.clear();
        sizes.add(Global.newArray("table", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.io.DEV.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.io.DEV.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.io.DEV.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void GIO$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.io.GIO.AppCallback", "ti.sysbios.io");
        sizes.clear();
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("arg", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.io.GIO.AppCallback']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.io.GIO.AppCallback']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.io.GIO.AppCallback'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.io.GIO.Instance_State", "ti.sysbios.io");
        sizes.clear();
        sizes.add(Global.newArray("name", "UPtr"));
        sizes.add(Global.newArray("mode", "UInt"));
        sizes.add(Global.newArray("model", "UInt"));
        sizes.add(Global.newArray("timeout", "UInt"));
        sizes.add(Global.newArray("packetHeap", "UPtr"));
        sizes.add(Global.newArray("sync", "UPtr"));
        sizes.add(Global.newArray("userSync", "UShort"));
        sizes.add(Global.newArray("userPackets", "UShort"));
        sizes.add(Global.newArray("packets", "UPtr"));
        sizes.add(Global.newArray("numPackets", "TInt"));
        sizes.add(Global.newArray("freeCount", "TInt"));
        sizes.add(Global.newArray("doneCount", "TInt"));
        sizes.add(Global.newArray("submitCount", "TInt"));
        sizes.add(Global.newArray("fxns", "UPtr"));
        sizes.add(Global.newArray("mdChan", "UPtr"));
        sizes.add(Global.newArray("doneList", "Sti.sysbios.knl.Queue;Instance_State"));
        sizes.add(Global.newArray("freeList", "Sti.sysbios.knl.Queue;Instance_State"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.io.GIO.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.io.GIO.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.io.GIO.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void DEV$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/io/DEV.xs");
        om.bind("ti.sysbios.io.DEV$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV.Module", "ti.sysbios.io");
        po.init("ti.sysbios.io.DEV.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.io"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("tableSize", Proto.Elm.newCNum("(xdc_UInt)"), 8L, "w");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.io"), $$UNDEF, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.io.DEV$$create", "ti.sysbios.io"), Global.get("ti$sysbios$io$DEV$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.io.DEV$$construct", "ti.sysbios.io"), Global.get("ti$sysbios$io$DEV$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.io.DEV$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.io.DEV$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.io.DEV$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.io.DEV$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.io.DEV$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.io.DEV$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV.Instance", "ti.sysbios.io");
        po.init("ti.sysbios.io.DEV.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("deviceParams", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
            po.addFld("initFxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), null, "w");
            po.addFld("devid", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.io"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$Params", "ti.sysbios.io");
        po.init("ti.sysbios.io.DEV.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("deviceParams", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
            po.addFld("initFxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), null, "w");
            po.addFld("devid", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.io"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$Object", "ti.sysbios.io");
        po.init("ti.sysbios.io.DEV.Object", om.findStrict("ti.sysbios.io.DEV.Instance", "ti.sysbios.io"));
        // typedef DEV.InitFxn
        om.bind("ti.sysbios.io.DEV.InitFxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct DEV.Fxns
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$Fxns", "ti.sysbios.io");
        po.init("ti.sysbios.io.DEV.Fxns", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("mdBindDev", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF, "w");
                po.addFld("mdUnBindDev", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF, "w");
                po.addFld("mdControlChan", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF, "w");
                po.addFld("mdCreateChan", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF, "w");
                po.addFld("mdDeleteChan", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF, "w");
                po.addFld("mdSubmitChan", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF, "w");
        // struct DEV.DeviceParams
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$DeviceParams", "ti.sysbios.io");
        po.init("ti.sysbios.io.DEV.DeviceParams", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("dummy", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // struct DEV.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$BasicView", "ti.sysbios.io");
        po.init("ti.sysbios.io.DEV.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("initFxn", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("devid", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("deviceParams", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("devp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct DEV.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$Instance_State", "ti.sysbios.io");
        po.init("ti.sysbios.io.DEV.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("fxns", new Proto.Adr("ti_sysbios_io_DEV_Fxns*", "PS"), $$UNDEF, "w");
                po.addFld("initFxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
                po.addFld("devid", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("deviceParams", new Proto.Adr("ti_sysbios_io_DEV_DeviceParams*", "PS"), $$UNDEF, "w");
                po.addFld("devp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct DEV.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$Module_State", "ti.sysbios.io");
        po.init("ti.sysbios.io.DEV.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("table", new Proto.Arr((Proto)om.findStrict("ti.sysbios.io.DEV.Handle", "ti.sysbios.io"), false), $$DEFAULT, "w");
    }

    void GIO$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/io/GIO.xs");
        om.bind("ti.sysbios.io.GIO$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.GIO.Module", "ti.sysbios.io");
        po.init("ti.sysbios.io.GIO.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.io"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INPUT", Proto.Elm.newCNum("(xdc_UInt)"), 0x1L, "rh");
                po.addFld("OUTPUT", Proto.Elm.newCNum("(xdc_UInt)"), 0x2L, "rh");
                po.addFld("INOUT", Proto.Elm.newCNum("(xdc_UInt)"), 0x3L, "rh");
        if (isCFG) {
            po.addFld("E_notFound", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.io"), Global.newObject("msg", "E_notFound: %s name not found"), "w");
            po.addFld("E_createFailed", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.io"), Global.newObject("msg", "E_createFailed: mdCreateChan returned error %d"), "w");
            po.addFld("A_badModel", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.io"), Global.newObject("msg", "A_badModel: invalid use of API for current I/O model"), "w");
            po.addFld("deviceTableSize", Proto.Elm.newCNum("(xdc_Int)"), 8L, "w");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.io"), $$UNDEF, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.io.GIO$$create", "ti.sysbios.io"), Global.get("ti$sysbios$io$GIO$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.io.GIO$$construct", "ti.sysbios.io"), Global.get("ti$sysbios$io$GIO$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.io.GIO$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.io.GIO$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.io.GIO$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.io.GIO$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.io.GIO$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.io.GIO$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                po.addFxn("addDeviceMeta", (Proto.Fxn)om.findStrict("ti.sysbios.io.GIO$$addDeviceMeta", "ti.sysbios.io"), Global.get(cap, "addDeviceMeta"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.GIO.Instance", "ti.sysbios.io");
        po.init("ti.sysbios.io.GIO.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INPUT", Proto.Elm.newCNum("(xdc_UInt)"), 0x1L, "rh");
                po.addFld("OUTPUT", Proto.Elm.newCNum("(xdc_UInt)"), 0x2L, "rh");
                po.addFld("INOUT", Proto.Elm.newCNum("(xdc_UInt)"), 0x3L, "rh");
        if (isCFG) {
            po.addFld("model", (Proto)om.findStrict("ti.sysbios.io.GIO.Model", "ti.sysbios.io"), om.find("ti.sysbios.io.GIO.Model_STANDARD"), "w");
            po.addFld("numPackets", Proto.Elm.newCNum("(xdc_Int)"), 2L, "w");
            po.addFld("timeout", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "w");
            po.addFld("sync", (Proto)om.findStrict("xdc.runtime.knl.ISync.Handle", "ti.sysbios.io"), null, "w");
            po.addFld("chanParams", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
            po.addFld("packets", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.io"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.GIO$$Params", "ti.sysbios.io");
        po.init("ti.sysbios.io.GIO.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INPUT", Proto.Elm.newCNum("(xdc_UInt)"), 0x1L, "rh");
                po.addFld("OUTPUT", Proto.Elm.newCNum("(xdc_UInt)"), 0x2L, "rh");
                po.addFld("INOUT", Proto.Elm.newCNum("(xdc_UInt)"), 0x3L, "rh");
        if (isCFG) {
            po.addFld("model", (Proto)om.findStrict("ti.sysbios.io.GIO.Model", "ti.sysbios.io"), om.find("ti.sysbios.io.GIO.Model_STANDARD"), "w");
            po.addFld("numPackets", Proto.Elm.newCNum("(xdc_Int)"), 2L, "w");
            po.addFld("timeout", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "w");
            po.addFld("sync", (Proto)om.findStrict("xdc.runtime.knl.ISync.Handle", "ti.sysbios.io"), null, "w");
            po.addFld("chanParams", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
            po.addFld("packets", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.io"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.GIO$$Object", "ti.sysbios.io");
        po.init("ti.sysbios.io.GIO.Object", om.findStrict("ti.sysbios.io.GIO.Instance", "ti.sysbios.io"));
        // typedef GIO.InitFxn
        om.bind("ti.sysbios.io.GIO.InitFxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct GIO.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.GIO$$BasicView", "ti.sysbios.io");
        po.init("ti.sysbios.io.GIO.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("freeCount", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("doneCount", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("submitCount", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("model", $$T_Str, $$UNDEF, "w");
                po.addFld("mode", $$T_Str, $$UNDEF, "w");
                po.addFld("userSuppliedSync", $$T_Bool, $$UNDEF, "w");
        // typedef GIO.TappCallBack
        om.bind("ti.sysbios.io.GIO.TappCallBack", new Proto.Adr("xdc_Void(*)(xdc_Ptr,xdc_Int,xdc_Ptr,xdc_SizeT)", "PFv"));
        // struct GIO.AppCallback
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.GIO$$AppCallback", "ti.sysbios.io");
        po.init("ti.sysbios.io.GIO.AppCallback", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_Ptr,xdc_Int,xdc_Ptr,xdc_SizeT)", "PFv"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct GIO.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.GIO$$Instance_State", "ti.sysbios.io");
        po.init("ti.sysbios.io.GIO.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("mode", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("model", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("timeout", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("packetHeap", (Proto)om.findStrict("xdc.runtime.IHeap.Handle", "ti.sysbios.io"), $$UNDEF, "w");
                po.addFld("sync", (Proto)om.findStrict("xdc.runtime.knl.ISync.Handle", "ti.sysbios.io"), $$UNDEF, "w");
                po.addFld("userSync", $$T_Bool, $$UNDEF, "w");
                po.addFld("userPackets", $$T_Bool, $$UNDEF, "w");
                po.addFld("packets", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("numPackets", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("freeCount", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("doneCount", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("submitCount", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("mdChan", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFldV("doneList", (Proto)om.findStrict("ti.sysbios.knl.Queue.Object", "ti.sysbios.io"), $$DEFAULT, "wh", $$objFldGet, $$objFldSet);
                po.addFld("Object_field_doneList", (Proto)om.findStrict("ti.sysbios.knl.Queue.Object", "ti.sysbios.io"), $$DEFAULT, "w");
                po.addFldV("freeList", (Proto)om.findStrict("ti.sysbios.knl.Queue.Object", "ti.sysbios.io"), $$DEFAULT, "wh", $$objFldGet, $$objFldSet);
                po.addFld("Object_field_freeList", (Proto)om.findStrict("ti.sysbios.knl.Queue.Object", "ti.sysbios.io"), $$DEFAULT, "w");
    }

    void DEV$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.io.DEV", "ti.sysbios.io");
        vo.bind("Fxns$fetchDesc", Global.newObject("type", "ti.sysbios.io.DEV.Fxns", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$Fxns", "ti.sysbios.io");
        vo.bind("DeviceParams$fetchDesc", Global.newObject("type", "ti.sysbios.io.DEV.DeviceParams", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$DeviceParams", "ti.sysbios.io");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.io.DEV.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$Instance_State", "ti.sysbios.io");
        po.bind("fxns$fetchDesc", Global.newObject("type", "ti.sysbios.io.DEV.Fxns", "isScalar", false));
        po.bind("deviceParams$fetchDesc", Global.newObject("type", "ti.sysbios.io.DEV.DeviceParams", "isScalar", false));
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.io.DEV.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV$$Module_State", "ti.sysbios.io");
        po.bind("table$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
    }

    void GIO$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.io.GIO", "ti.sysbios.io");
        vo.bind("AppCallback$fetchDesc", Global.newObject("type", "ti.sysbios.io.GIO.AppCallback", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.GIO$$AppCallback", "ti.sysbios.io");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.io.GIO.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.GIO$$Instance_State", "ti.sysbios.io");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.io.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.io"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/io/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.io"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.io"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.io"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.io"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.io"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.io"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.io", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.io");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.io.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.io'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.io$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.io$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.io$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.ae28FP',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.a28L',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.a28FP',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.ae430X',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.ar430XS',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.ae64P',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.ae674',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.ae66',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.ae66e',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aearp32',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aearp32F',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.ae9',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aea8fnv',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aer5f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aer4f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aer4ft',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aem3',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aem4',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aem4f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.am3g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.am4g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.am4fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aa8fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aa9fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aa15fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.aa53fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.arm3',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.arm4',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.arm4f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.io.ae71',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.io.aem3',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.io.aem4',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.ae28FP', {target: 'ti.targets.elf.C28_float', suffix: 'e28FP'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.a28L', {target: 'ti.targets.C28_large', suffix: '28L'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.a28FP', {target: 'ti.targets.C28_float', suffix: '28FP'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.ae430X', {target: 'ti.targets.msp430.elf.MSP430X', suffix: 'e430X'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.ar430XS', {target: 'iar.targets.msp430.MSP430X_small', suffix: 'r430XS'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.ae64P', {target: 'ti.targets.elf.C64P', suffix: 'e64P'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.ae674', {target: 'ti.targets.elf.C674', suffix: 'e674'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.ae66', {target: 'ti.targets.elf.C66', suffix: 'e66'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.ae66e', {target: 'ti.targets.elf.C66_big_endian', suffix: 'e66e'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aearp32', {target: 'ti.targets.arp32.elf.ARP32', suffix: 'earp32'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aearp32F', {target: 'ti.targets.arp32.elf.ARP32_far', suffix: 'earp32F'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.ae9', {target: 'ti.targets.arm.elf.Arm9', suffix: 'e9'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aea8fnv', {target: 'ti.targets.arm.elf.A8Fnv', suffix: 'ea8fnv'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aer5f', {target: 'ti.targets.arm.elf.R5F', suffix: 'er5f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aer4f', {target: 'ti.targets.arm.elf.R4F', suffix: 'er4f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aer4ft', {target: 'ti.targets.arm.elf.R4Ft', suffix: 'er4ft'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aem4f', {target: 'ti.targets.arm.elf.M4F', suffix: 'em4f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.am3g', {target: 'gnu.targets.arm.M3', suffix: 'm3g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.am4g', {target: 'gnu.targets.arm.M4', suffix: 'm4g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.am4fg', {target: 'gnu.targets.arm.M4F', suffix: 'm4fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aa8fg', {target: 'gnu.targets.arm.A8F', suffix: 'a8fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aa9fg', {target: 'gnu.targets.arm.A9F', suffix: 'a9fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.aa53fg', {target: 'gnu.targets.arm.A53F', suffix: 'a53fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.arm3', {target: 'iar.targets.arm.M3', suffix: 'rm3'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.arm4', {target: 'iar.targets.arm.M4', suffix: 'rm4'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.arm4f', {target: 'iar.targets.arm.M4F', suffix: 'rm4f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.io.ae71', {target: 'ti.targets.elf.nda.C71', suffix: 'e71'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.io.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.io.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void DEV$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.io.DEV", "ti.sysbios.io");
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.DEV.Module", "ti.sysbios.io");
        vo.init2(po, "ti.sysbios.io.DEV", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.io.DEV$$capsule", "ti.sysbios.io"));
        vo.bind("Instance", om.findStrict("ti.sysbios.io.DEV.Instance", "ti.sysbios.io"));
        vo.bind("Params", om.findStrict("ti.sysbios.io.DEV.Params", "ti.sysbios.io"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.io.DEV.Params", "ti.sysbios.io")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.io.DEV.Handle", "ti.sysbios.io"));
        vo.bind("$package", om.findStrict("ti.sysbios.io", "ti.sysbios.io"));
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
        vo.bind("InitFxn", om.findStrict("ti.sysbios.io.DEV.InitFxn", "ti.sysbios.io"));
        vo.bind("Fxns", om.findStrict("ti.sysbios.io.DEV.Fxns", "ti.sysbios.io"));
        tdefs.add(om.findStrict("ti.sysbios.io.DEV.Fxns", "ti.sysbios.io"));
        vo.bind("DeviceParams", om.findStrict("ti.sysbios.io.DEV.DeviceParams", "ti.sysbios.io"));
        tdefs.add(om.findStrict("ti.sysbios.io.DEV.DeviceParams", "ti.sysbios.io"));
        mcfgs.add("tableSize");
        vo.bind("BasicView", om.findStrict("ti.sysbios.io.DEV.BasicView", "ti.sysbios.io"));
        tdefs.add(om.findStrict("ti.sysbios.io.DEV.BasicView", "ti.sysbios.io"));
        vo.bind("Instance_State", om.findStrict("ti.sysbios.io.DEV.Instance_State", "ti.sysbios.io"));
        tdefs.add(om.findStrict("ti.sysbios.io.DEV.Instance_State", "ti.sysbios.io"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.io.DEV.Module_State", "ti.sysbios.io"));
        tdefs.add(om.findStrict("ti.sysbios.io.DEV.Module_State", "ti.sysbios.io"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.io")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("ti.sysbios.io.DEV$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$io$DEV$$__initObject"));
        }//isCFG
        vo.bind("match", om.findStrict("ti.sysbios.io.DEV.match", "ti.sysbios.io"));
        vo.bind("postInit", om.findStrict("ti.sysbios.io.DEV.postInit", "ti.sysbios.io"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_io_DEV_Handle__label__E", "ti_sysbios_io_DEV_Module__startupDone__E", "ti_sysbios_io_DEV_Object__create__E", "ti_sysbios_io_DEV_Object__delete__E", "ti_sysbios_io_DEV_Object__get__E", "ti_sysbios_io_DEV_Object__first__E", "ti_sysbios_io_DEV_Object__next__E", "ti_sysbios_io_DEV_Params__init__E", "ti_sysbios_io_DEV_match__E", "ti_sysbios_io_DEV_getName__E", "ti_sysbios_io_DEV_getFxns__E", "ti_sysbios_io_DEV_getInitFxn__E", "ti_sysbios_io_DEV_getDevid__E", "ti_sysbios_io_DEV_getDeviceParams__E", "ti_sysbios_io_DEV_getDevp__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.io.DEV.Object", "ti.sysbios.io"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("DEV", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("DEV");
    }

    void GIO$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.io.GIO", "ti.sysbios.io");
        po = (Proto.Obj)om.findStrict("ti.sysbios.io.GIO.Module", "ti.sysbios.io");
        vo.init2(po, "ti.sysbios.io.GIO", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.io.GIO$$capsule", "ti.sysbios.io"));
        vo.bind("Instance", om.findStrict("ti.sysbios.io.GIO.Instance", "ti.sysbios.io"));
        vo.bind("Params", om.findStrict("ti.sysbios.io.GIO.Params", "ti.sysbios.io"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.io.GIO.Params", "ti.sysbios.io")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.io.GIO.Handle", "ti.sysbios.io"));
        vo.bind("$package", om.findStrict("ti.sysbios.io", "ti.sysbios.io"));
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
        vo.bind("InitFxn", om.findStrict("ti.sysbios.io.GIO.InitFxn", "ti.sysbios.io"));
        mcfgs.add("E_notFound");
        mcfgs.add("E_createFailed");
        mcfgs.add("A_badModel");
        mcfgs.add("deviceTableSize");
        vo.bind("BasicView", om.findStrict("ti.sysbios.io.GIO.BasicView", "ti.sysbios.io"));
        tdefs.add(om.findStrict("ti.sysbios.io.GIO.BasicView", "ti.sysbios.io"));
        vo.bind("Model", om.findStrict("ti.sysbios.io.GIO.Model", "ti.sysbios.io"));
        vo.bind("TappCallBack", om.findStrict("ti.sysbios.io.GIO.TappCallBack", "ti.sysbios.io"));
        vo.bind("AppCallback", om.findStrict("ti.sysbios.io.GIO.AppCallback", "ti.sysbios.io"));
        tdefs.add(om.findStrict("ti.sysbios.io.GIO.AppCallback", "ti.sysbios.io"));
        vo.bind("Instance_State", om.findStrict("ti.sysbios.io.GIO.Instance_State", "ti.sysbios.io"));
        tdefs.add(om.findStrict("ti.sysbios.io.GIO.Instance_State", "ti.sysbios.io"));
        vo.bind("Model_STANDARD", om.findStrict("ti.sysbios.io.GIO.Model_STANDARD", "ti.sysbios.io"));
        vo.bind("Model_ISSUERECLAIM", om.findStrict("ti.sysbios.io.GIO.Model_ISSUERECLAIM", "ti.sysbios.io"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.io")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("ti.sysbios.io.GIO$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$io$GIO$$__initObject"));
        }//isCFG
        vo.bind("addDevice", om.findStrict("ti.sysbios.io.GIO.addDevice", "ti.sysbios.io"));
        vo.bind("removeDevice", om.findStrict("ti.sysbios.io.GIO.removeDevice", "ti.sysbios.io"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_io_GIO_Handle__label__E", "ti_sysbios_io_GIO_Module__startupDone__E", "ti_sysbios_io_GIO_Object__create__E", "ti_sysbios_io_GIO_Object__delete__E", "ti_sysbios_io_GIO_Object__get__E", "ti_sysbios_io_GIO_Object__first__E", "ti_sysbios_io_GIO_Object__next__E", "ti_sysbios_io_GIO_Params__init__E", "ti_sysbios_io_GIO_addDevice__E", "ti_sysbios_io_GIO_removeDevice__E", "ti_sysbios_io_GIO_abort__E", "ti_sysbios_io_GIO_control__E", "ti_sysbios_io_GIO_flush__E", "ti_sysbios_io_GIO_issue__E", "ti_sysbios_io_GIO_reclaim__E", "ti_sysbios_io_GIO_read__E", "ti_sysbios_io_GIO_write__E", "ti_sysbios_io_GIO_submit__E", "ti_sysbios_io_GIO_prime__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_notFound", "E_createFailed"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_badModel"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.io.GIO.Object", "ti.sysbios.io"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GIO", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GIO");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.io")).findStrict("PARAMS", "ti.sysbios.io");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.io.DEV", "ti.sysbios.io")).findStrict("PARAMS", "ti.sysbios.io");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.io.GIO", "ti.sysbios.io")).findStrict("PARAMS", "ti.sysbios.io");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.io.DEV", "ti.sysbios.io"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.io.GIO", "ti.sysbios.io"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.io.DEV", "ti.sysbios.io");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.io.GIO", "ti.sysbios.io");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.io.DEV")).bless();
        ((Value.Obj)om.getv("ti.sysbios.io.GIO")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.io")).add(pkgV);
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
        DEV$$OBJECTS();
        GIO$$OBJECTS();
        DEV$$CONSTS();
        GIO$$CONSTS();
        DEV$$CREATES();
        GIO$$CREATES();
        DEV$$FUNCTIONS();
        GIO$$FUNCTIONS();
        DEV$$SIZES();
        GIO$$SIZES();
        DEV$$TYPES();
        GIO$$TYPES();
        if (isROV) {
            DEV$$ROV();
            GIO$$ROV();
        }//isROV
        $$SINGLETONS();
        DEV$$SINGLETONS();
        GIO$$SINGLETONS();
        $$INITIALIZATION();
    }
}
