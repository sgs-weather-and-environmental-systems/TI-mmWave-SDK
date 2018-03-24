/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-A65
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class xdc_tools_sg_widgets
{
    static final String VERS = "@(#) xdc-A65\n";

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
        Global.callFxn("loadPackage", xdcO, "xdc.tools.sg");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.tools.sg.widgets", new Value.Obj("xdc.tools.sg.widgets", pkgP));
    }

    void Widget$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Widget.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.sg.widgets.Widget", new Value.Obj("xdc.tools.sg.widgets.Widget", po));
        pkgV.bind("Widget", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.sg.widgets.Widget.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Widget$$Object", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.Widget.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Widget$$Params", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.Widget.Params", new Proto.Str(po, true));
    }

    void Cap$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Cap.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.sg.widgets.Cap", new Value.Obj("xdc.tools.sg.widgets.Cap", po));
        pkgV.bind("Cap", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.sg.widgets.Cap.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Cap$$Object", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.Cap.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Cap$$Params", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.Cap.Params", new Proto.Str(po, true));
    }

    void Tab$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Tab.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.sg.widgets.Tab", new Value.Obj("xdc.tools.sg.widgets.Tab", po));
        pkgV.bind("Tab", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.sg.widgets.Tab.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Tab$$Object", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.Tab.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Tab$$Params", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.Tab.Params", new Proto.Str(po, true));
    }

    void Wizard$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Wizard.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.sg.widgets.Wizard", new Value.Obj("xdc.tools.sg.widgets.Wizard", po));
        pkgV.bind("Wizard", vo);
        // decls 
        om.bind("xdc.tools.sg.widgets.Wizard.Status", new Proto.Enm("xdc.tools.sg.widgets.Wizard.Status"));
        // insts 
        Object insP = om.bind("xdc.tools.sg.widgets.Wizard.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Wizard$$Object", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.Wizard.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.Wizard$$Params", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.Wizard.Params", new Proto.Str(po, true));
    }

    void PathEditor$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.PathEditor.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.sg.widgets.PathEditor", new Value.Obj("xdc.tools.sg.widgets.PathEditor", po));
        pkgV.bind("PathEditor", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.sg.widgets.PathEditor.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.PathEditor$$Object", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.PathEditor.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.PathEditor$$Params", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.PathEditor.Params", new Proto.Str(po, true));
    }

    void DB$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.DB.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.tools.sg.widgets.DB", new Value.Obj("xdc.tools.sg.widgets.DB", po));
        pkgV.bind("DB", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.tools.sg.widgets.DB.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.DB$$Object", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.DB.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.tools.sg.widgets.DB$$Params", new Proto.Obj());
        om.bind("xdc.tools.sg.widgets.DB.Params", new Proto.Str(po, true));
    }

    void Widget$$CONSTS()
    {
        // interface Widget
    }

    void Cap$$CONSTS()
    {
        // interface Cap
    }

    void Tab$$CONSTS()
    {
        // module Tab
    }

    void Wizard$$CONSTS()
    {
        // module Wizard
        om.bind("xdc.tools.sg.widgets.Wizard.FINISHED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.tools.sg.widgets.Wizard.Status", "xdc.tools.sg.widgets"), "xdc.tools.sg.widgets.Wizard.FINISHED", 0));
        om.bind("xdc.tools.sg.widgets.Wizard.CANCELED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.tools.sg.widgets.Wizard.Status", "xdc.tools.sg.widgets"), "xdc.tools.sg.widgets.Wizard.CANCELED", 1));
    }

    void PathEditor$$CONSTS()
    {
        // module PathEditor
        om.bind("xdc.tools.sg.widgets.PathEditor.PATH_CHANGED", 100023L);
    }

    void DB$$CONSTS()
    {
        // module DB
    }

    void Widget$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Cap$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Tab$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.Tab$$create", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.Tab.Module", "xdc.tools.sg.widgets"), om.findStrict("xdc.tools.sg.widgets.Tab.Instance", "xdc.tools.sg.widgets"), 4, 3, false));
                fxn.addArg(0, "parent", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "capsuleName", $$T_Str, $$UNDEF);
                fxn.addArg(2, "params", $$T_Obj, $$UNDEF);
                fxn.addArg(3, "__params", (Proto)om.findStrict("xdc.tools.sg.widgets.Tab.Params", "xdc.tools.sg.widgets"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$sg$widgets$Tab$$create = function( parent, capsuleName, params, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.sg.widgets.Tab'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.sg.widgets.Tab.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools.sg.widgets']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {parent:parent, capsuleName:capsuleName, params:params});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.control = __mod.PARAMS.control;\n");
            sb.append("__inst.capsule = __mod.PARAMS.capsule;\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.title = __mod.PARAMS.title;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [parent, capsuleName, params]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.Tab$$construct", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.Tab.Module", "xdc.tools.sg.widgets"), null, 5, 3, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.sg.widgets.Tab$$Object", "xdc.tools.sg.widgets"), null);
                fxn.addArg(1, "parent", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "capsuleName", $$T_Str, $$UNDEF);
                fxn.addArg(3, "params", $$T_Obj, $$UNDEF);
                fxn.addArg(4, "__params", (Proto)om.findStrict("xdc.tools.sg.widgets.Tab.Params", "xdc.tools.sg.widgets"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$sg$widgets$Tab$$construct = function( __obj, parent, capsuleName, params, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.sg.widgets.Tab'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {parent:parent, capsuleName:capsuleName, params:params});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.control = __mod.PARAMS.control;\n");
            sb.append("__inst.capsule = __mod.PARAMS.capsule;\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.title = __mod.PARAMS.title;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Wizard$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.Wizard$$create", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.Wizard.Module", "xdc.tools.sg.widgets"), om.findStrict("xdc.tools.sg.widgets.Wizard.Instance", "xdc.tools.sg.widgets"), 2, 1, false));
                fxn.addArg(0, "parent", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.tools.sg.widgets.Wizard.Params", "xdc.tools.sg.widgets"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$sg$widgets$Wizard$$create = function( parent, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.sg.widgets.Wizard'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.sg.widgets.Wizard.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools.sg.widgets']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {parent:parent});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.control = __mod.PARAMS.control;\n");
            sb.append("__inst.content = __mod.PARAMS.content;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [parent]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.Wizard$$construct", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.Wizard.Module", "xdc.tools.sg.widgets"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.sg.widgets.Wizard$$Object", "xdc.tools.sg.widgets"), null);
                fxn.addArg(1, "parent", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.tools.sg.widgets.Wizard.Params", "xdc.tools.sg.widgets"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$sg$widgets$Wizard$$construct = function( __obj, parent, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.sg.widgets.Wizard'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {parent:parent});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.control = __mod.PARAMS.control;\n");
            sb.append("__inst.content = __mod.PARAMS.content;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void PathEditor$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.PathEditor$$create", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.PathEditor.Module", "xdc.tools.sg.widgets"), om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets"), 2, 1, false));
                fxn.addArg(0, "parent", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.tools.sg.widgets.PathEditor.Params", "xdc.tools.sg.widgets"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$sg$widgets$PathEditor$$create = function( parent, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.sg.widgets.PathEditor'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.sg.widgets.PathEditor.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools.sg.widgets']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {parent:parent});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.control = __mod.PARAMS.control;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [parent]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.PathEditor$$construct", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.PathEditor.Module", "xdc.tools.sg.widgets"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.sg.widgets.PathEditor$$Object", "xdc.tools.sg.widgets"), null);
                fxn.addArg(1, "parent", $$T_Obj, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.tools.sg.widgets.PathEditor.Params", "xdc.tools.sg.widgets"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$sg$widgets$PathEditor$$construct = function( __obj, parent, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.sg.widgets.PathEditor'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {parent:parent});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.control = __mod.PARAMS.control;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void DB$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.DB$$create", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.DB.Module", "xdc.tools.sg.widgets"), om.findStrict("xdc.tools.sg.widgets.DB.Instance", "xdc.tools.sg.widgets"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.tools.sg.widgets.DB.Params", "xdc.tools.sg.widgets"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$sg$widgets$DB$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.sg.widgets.DB'];\n");
            sb.append("var __inst = xdc.om['xdc.tools.sg.widgets.DB.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.tools.sg.widgets']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.DB$$construct", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.DB.Module", "xdc.tools.sg.widgets"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.tools.sg.widgets.DB$$Object", "xdc.tools.sg.widgets"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.tools.sg.widgets.DB.Params", "xdc.tools.sg.widgets"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$tools$sg$widgets$DB$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.tools.sg.widgets.DB'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Widget$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Widget.dispose
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.Widget$$dispose", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.Widget.Instance", "xdc.tools.sg.widgets"), null, 0, 0, false));
        // fxn Widget.isValid
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.Widget$$isValid", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.Widget.Instance", "xdc.tools.sg.widgets"), $$T_Bool, 0, 0, false));
    }

    void Cap$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Cap.setCapsule
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.Cap$$setCapsule", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.Cap.Instance", "xdc.tools.sg.widgets"), null, 1, 1, false));
                fxn.addArg(0, "capsuleName", $$T_Str, $$UNDEF);
    }

    void Tab$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Wizard$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Wizard.activate
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.Wizard$$activate", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.Wizard.Instance", "xdc.tools.sg.widgets"), null, 1, 1, false));
                fxn.addArg(0, "i", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn Wizard.getStatus
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.Wizard$$getStatus", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.Wizard.Instance", "xdc.tools.sg.widgets"), (Proto)om.findStrict("xdc.tools.sg.widgets.Wizard.Status", "xdc.tools.sg.widgets"), 0, 0, false));
        // fxn Wizard.isDone
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.Wizard$$isDone", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.Wizard.Instance", "xdc.tools.sg.widgets"), $$T_Bool, 0, 0, false));
    }

    void PathEditor$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn PathEditor.getPath
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.PathEditor$$getPath", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets"), $$T_Obj, 0, 0, false));
        // fxn PathEditor.getUserPath
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.PathEditor$$getUserPath", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets"), $$T_Obj, 0, 0, false));
        // fxn PathEditor.setPath
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.PathEditor$$setPath", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets"), null, 1, 1, false));
                fxn.addArg(0, "path", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn PathEditor.setUserPath
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.PathEditor$$setUserPath", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets"), null, 1, 1, false));
                fxn.addArg(0, "path", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn PathEditor.add
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.PathEditor$$add", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets"), null, 1, 1, false));
                fxn.addArg(0, "dir", $$T_Str, $$UNDEF);
        // fxn PathEditor.remove
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.PathEditor$$remove", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets"), null, 1, 1, false));
                fxn.addArg(0, "index", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
        // fxn PathEditor.move
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.PathEditor$$move", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets"), null, 2, 2, false));
                fxn.addArg(0, "index", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                fxn.addArg(1, "toBefore", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
    }

    void DB$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn DB.getPath
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.DB$$getPath", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.DB.Instance", "xdc.tools.sg.widgets"), $$T_Obj, 0, 0, false));
        // fxn DB.setPath
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.DB$$setPath", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.DB.Instance", "xdc.tools.sg.widgets"), null, 1, 1, false));
                fxn.addArg(0, "path", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn DB.getUnits
        fxn = (Proto.Fxn)om.bind("xdc.tools.sg.widgets.DB$$getUnits", new Proto.Fxn(om.findStrict("xdc.tools.sg.widgets.DB.Instance", "xdc.tools.sg.widgets"), $$T_Obj, 1, 1, false));
                fxn.addArg(0, "childOf", $$T_Str, $$UNDEF);
    }

    void Widget$$SIZES()
    {
    }

    void Cap$$SIZES()
    {
    }

    void Tab$$SIZES()
    {
    }

    void Wizard$$SIZES()
    {
    }

    void PathEditor$$SIZES()
    {
    }

    void DB$$SIZES()
    {
    }

    void Widget$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/sg/widgets/Widget.xs");
        om.bind("xdc.tools.sg.widgets.Widget$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Widget.Module", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Widget.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Widget$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Widget$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Widget$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Widget$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Widget.Instance", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Widget.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("control", $$T_Obj, $$UNDEF, "rh");
                fxn = Global.get(cap, "dispose");
                if (fxn != null) po.addFxn("dispose", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$dispose", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "isValid");
                if (fxn != null) po.addFxn("isValid", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$isValid", "xdc.tools.sg.widgets"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Widget$$Params", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Widget.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("control", $$T_Obj, $$UNDEF, "rh");
    }

    void Cap$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/sg/widgets/Cap.xs");
        om.bind("xdc.tools.sg.widgets.Cap$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Cap.Module", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Cap.Module", om.findStrict("xdc.tools.sg.widgets.Widget.Module", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Cap$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Cap$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Cap$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Cap$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Cap.Instance", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Cap.Instance", om.findStrict("xdc.tools.sg.widgets.Widget.Instance", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("capsule", $$T_Obj, $$UNDEF, "rh");
                fxn = Global.get(cap, "dispose");
                if (fxn != null) po.addFxn("dispose", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$dispose", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "isValid");
                if (fxn != null) po.addFxn("isValid", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$isValid", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "setCapsule");
                if (fxn != null) po.addFxn("setCapsule", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Cap$$setCapsule", "xdc.tools.sg.widgets"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Cap$$Params", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Cap.Params", om.findStrict("xdc.tools.sg.widgets.Widget$$Params", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("capsule", $$T_Obj, $$UNDEF, "rh");
    }

    void Tab$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/sg/widgets/Tab.xs");
        om.bind("xdc.tools.sg.widgets.Tab$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Tab.Module", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Tab.Module", om.findStrict("xdc.tools.sg.widgets.Cap.Module", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Tab$$create", "xdc.tools.sg.widgets"), Global.get("xdc$tools$sg$widgets$Tab$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Tab$$construct", "xdc.tools.sg.widgets"), Global.get("xdc$tools$sg$widgets$Tab$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Tab$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Tab$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Tab$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Tab$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Tab.Instance", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Tab.Instance", om.findStrict("xdc.tools.sg.widgets.Cap.Instance", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("title", $$T_Str, $$UNDEF, "wh");
                fxn = Global.get(cap, "dispose");
                if (fxn != null) po.addFxn("dispose", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$dispose", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "isValid");
                if (fxn != null) po.addFxn("isValid", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$isValid", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "setCapsule");
                if (fxn != null) po.addFxn("setCapsule", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Cap$$setCapsule", "xdc.tools.sg.widgets"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Tab$$Params", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Tab.Params", om.findStrict("xdc.tools.sg.widgets.Cap$$Params", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("title", $$T_Str, $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Tab$$Object", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Tab.Object", om.findStrict("xdc.tools.sg.widgets.Tab.Instance", "xdc.tools.sg.widgets"));
                fxn = Global.get(cap, "dispose");
                if (fxn != null) po.addFxn("dispose", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$dispose", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "isValid");
                if (fxn != null) po.addFxn("isValid", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$isValid", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "setCapsule");
                if (fxn != null) po.addFxn("setCapsule", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Cap$$setCapsule", "xdc.tools.sg.widgets"), fxn);
    }

    void Wizard$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/sg/widgets/Wizard.xs");
        om.bind("xdc.tools.sg.widgets.Wizard$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Wizard.Module", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Wizard.Module", om.findStrict("xdc.tools.sg.widgets.Widget.Module", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Wizard$$create", "xdc.tools.sg.widgets"), Global.get("xdc$tools$sg$widgets$Wizard$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Wizard$$construct", "xdc.tools.sg.widgets"), Global.get("xdc$tools$sg$widgets$Wizard$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Wizard$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Wizard$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Wizard$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.Wizard$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Wizard.Instance", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Wizard.Instance", om.findStrict("xdc.tools.sg.widgets.Widget.Instance", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("content", $$T_Obj, $$UNDEF, "wh");
                fxn = Global.get(cap, "dispose");
                if (fxn != null) po.addFxn("dispose", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$dispose", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "isValid");
                if (fxn != null) po.addFxn("isValid", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$isValid", "xdc.tools.sg.widgets"), fxn);
                po.addFxn("activate", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Wizard$$activate", "xdc.tools.sg.widgets"), Global.get(cap, "activate"));
                po.addFxn("getStatus", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Wizard$$getStatus", "xdc.tools.sg.widgets"), Global.get(cap, "getStatus"));
                po.addFxn("isDone", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Wizard$$isDone", "xdc.tools.sg.widgets"), Global.get(cap, "isDone"));
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Wizard$$Params", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Wizard.Params", om.findStrict("xdc.tools.sg.widgets.Widget$$Params", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("content", $$T_Obj, $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Wizard$$Object", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.Wizard.Object", om.findStrict("xdc.tools.sg.widgets.Wizard.Instance", "xdc.tools.sg.widgets"));
                fxn = Global.get(cap, "dispose");
                if (fxn != null) po.addFxn("dispose", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$dispose", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "isValid");
                if (fxn != null) po.addFxn("isValid", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$isValid", "xdc.tools.sg.widgets"), fxn);
                po.addFxn("activate", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Wizard$$activate", "xdc.tools.sg.widgets"), Global.get(cap, "activate"));
                po.addFxn("getStatus", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Wizard$$getStatus", "xdc.tools.sg.widgets"), Global.get(cap, "getStatus"));
                po.addFxn("isDone", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Wizard$$isDone", "xdc.tools.sg.widgets"), Global.get(cap, "isDone"));
    }

    void PathEditor$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/sg/widgets/PathEditor.xs");
        om.bind("xdc.tools.sg.widgets.PathEditor$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.PathEditor.Module", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.PathEditor.Module", om.findStrict("xdc.tools.sg.widgets.Widget.Module", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("PATH_CHANGED", Proto.Elm.newCNum("(xdc_Int)"), 100023L, "rh");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$create", "xdc.tools.sg.widgets"), Global.get("xdc$tools$sg$widgets$PathEditor$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$construct", "xdc.tools.sg.widgets"), Global.get("xdc$tools$sg$widgets$PathEditor$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.PathEditor$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.PathEditor$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.PathEditor$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.PathEditor$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.PathEditor.Instance", om.findStrict("xdc.tools.sg.widgets.Widget.Instance", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("PATH_CHANGED", Proto.Elm.newCNum("(xdc_Int)"), 100023L, "rh");
        po.addFld("addXDCRepositories", $$T_Bool, true, "wh");
                fxn = Global.get(cap, "dispose");
                if (fxn != null) po.addFxn("dispose", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$dispose", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "isValid");
                if (fxn != null) po.addFxn("isValid", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$isValid", "xdc.tools.sg.widgets"), fxn);
                po.addFxn("getPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$getPath", "xdc.tools.sg.widgets"), Global.get(cap, "getPath"));
                po.addFxn("getUserPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$getUserPath", "xdc.tools.sg.widgets"), Global.get(cap, "getUserPath"));
                po.addFxn("setPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$setPath", "xdc.tools.sg.widgets"), Global.get(cap, "setPath"));
                po.addFxn("setUserPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$setUserPath", "xdc.tools.sg.widgets"), Global.get(cap, "setUserPath"));
                po.addFxn("add", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$add", "xdc.tools.sg.widgets"), Global.get(cap, "add"));
                po.addFxn("remove", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$remove", "xdc.tools.sg.widgets"), Global.get(cap, "remove"));
                po.addFxn("move", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$move", "xdc.tools.sg.widgets"), Global.get(cap, "move"));
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.PathEditor$$Params", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.PathEditor.Params", om.findStrict("xdc.tools.sg.widgets.Widget$$Params", "xdc.tools.sg.widgets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("PATH_CHANGED", Proto.Elm.newCNum("(xdc_Int)"), 100023L, "rh");
        po.addFld("addXDCRepositories", $$T_Bool, true, "wh");
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.PathEditor$$Object", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.PathEditor.Object", om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets"));
                fxn = Global.get(cap, "dispose");
                if (fxn != null) po.addFxn("dispose", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$dispose", "xdc.tools.sg.widgets"), fxn);
                fxn = Global.get(cap, "isValid");
                if (fxn != null) po.addFxn("isValid", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.Widget$$isValid", "xdc.tools.sg.widgets"), fxn);
                po.addFxn("getPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$getPath", "xdc.tools.sg.widgets"), Global.get(cap, "getPath"));
                po.addFxn("getUserPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$getUserPath", "xdc.tools.sg.widgets"), Global.get(cap, "getUserPath"));
                po.addFxn("setPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$setPath", "xdc.tools.sg.widgets"), Global.get(cap, "setPath"));
                po.addFxn("setUserPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$setUserPath", "xdc.tools.sg.widgets"), Global.get(cap, "setUserPath"));
                po.addFxn("add", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$add", "xdc.tools.sg.widgets"), Global.get(cap, "add"));
                po.addFxn("remove", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$remove", "xdc.tools.sg.widgets"), Global.get(cap, "remove"));
                po.addFxn("move", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.PathEditor$$move", "xdc.tools.sg.widgets"), Global.get(cap, "move"));
    }

    void DB$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/tools/sg/widgets/DB.xs");
        om.bind("xdc.tools.sg.widgets.DB$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.DB.Module", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.DB.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.DB$$create", "xdc.tools.sg.widgets"), Global.get("xdc$tools$sg$widgets$DB$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.DB$$construct", "xdc.tools.sg.widgets"), Global.get("xdc$tools$sg$widgets$DB$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.DB$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.DB$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.DB$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.tools.sg.widgets.DB$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.DB.Instance", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.DB.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.DB$$getPath", "xdc.tools.sg.widgets"), Global.get(cap, "getPath"));
                po.addFxn("setPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.DB$$setPath", "xdc.tools.sg.widgets"), Global.get(cap, "setPath"));
                po.addFxn("getUnits", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.DB$$getUnits", "xdc.tools.sg.widgets"), Global.get(cap, "getUnits"));
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.DB$$Params", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.DB.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.DB$$Object", "xdc.tools.sg.widgets");
        po.init("xdc.tools.sg.widgets.DB.Object", om.findStrict("xdc.tools.sg.widgets.DB.Instance", "xdc.tools.sg.widgets"));
                po.addFxn("getPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.DB$$getPath", "xdc.tools.sg.widgets"), Global.get(cap, "getPath"));
                po.addFxn("setPath", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.DB$$setPath", "xdc.tools.sg.widgets"), Global.get(cap, "setPath"));
                po.addFxn("getUnits", (Proto.Fxn)om.findStrict("xdc.tools.sg.widgets.DB$$getUnits", "xdc.tools.sg.widgets"), Global.get(cap, "getUnits"));
    }

    void Widget$$ROV()
    {
    }

    void Cap$$ROV()
    {
    }

    void Tab$$ROV()
    {
    }

    void Wizard$$ROV()
    {
    }

    void PathEditor$$ROV()
    {
    }

    void DB$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.tools.sg.widgets.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.tools.sg.widgets"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.tools.sg.widgets", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.tools.sg.widgets");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.tools.sg.widgets.");
        pkgV.bind("$vers", Global.newArray());
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.tools.sg", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.tools.sg.widgets'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.tools.sg.widgets$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.tools.sg.widgets$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.tools.sg.widgets$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Widget$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.sg.widgets.Widget", "xdc.tools.sg.widgets");
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Widget.Module", "xdc.tools.sg.widgets");
        vo.init2(po, "xdc.tools.sg.widgets.Widget", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.tools.sg.widgets.Widget$$capsule", "xdc.tools.sg.widgets"));
        vo.bind("Instance", om.findStrict("xdc.tools.sg.widgets.Widget.Instance", "xdc.tools.sg.widgets"));
        vo.bind("Params", om.findStrict("xdc.tools.sg.widgets.Widget.Params", "xdc.tools.sg.widgets"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.sg.widgets.Widget.Params", "xdc.tools.sg.widgets")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.sg.widgets", "xdc.tools.sg.widgets"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("Widget", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Widget");
        vo.seal(null);
    }

    void Cap$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.sg.widgets.Cap", "xdc.tools.sg.widgets");
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Cap.Module", "xdc.tools.sg.widgets");
        vo.init2(po, "xdc.tools.sg.widgets.Cap", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.tools.sg.widgets.Cap$$capsule", "xdc.tools.sg.widgets"));
        vo.bind("Instance", om.findStrict("xdc.tools.sg.widgets.Cap.Instance", "xdc.tools.sg.widgets"));
        vo.bind("Params", om.findStrict("xdc.tools.sg.widgets.Cap.Params", "xdc.tools.sg.widgets"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.sg.widgets.Cap.Params", "xdc.tools.sg.widgets")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.sg.widgets", "xdc.tools.sg.widgets"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.tools.sg.widgets");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("Cap", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Cap");
        vo.seal(null);
    }

    void Tab$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.sg.widgets.Tab", "xdc.tools.sg.widgets");
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Tab.Module", "xdc.tools.sg.widgets");
        vo.init2(po, "xdc.tools.sg.widgets.Tab", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.sg.widgets.Tab$$capsule", "xdc.tools.sg.widgets"));
        vo.bind("Instance", om.findStrict("xdc.tools.sg.widgets.Tab.Instance", "xdc.tools.sg.widgets"));
        vo.bind("Params", om.findStrict("xdc.tools.sg.widgets.Tab.Params", "xdc.tools.sg.widgets"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.sg.widgets.Tab.Params", "xdc.tools.sg.widgets")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.sg.widgets", "xdc.tools.sg.widgets"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.tools.sg.widgets");
        inherits.add("xdc.tools.sg.widgets");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.sg.widgets")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.sg.widgets.Tab$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.sg.widgets.Tab.Object", "xdc.tools.sg.widgets"));
        pkgV.bind("Tab", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Tab");
    }

    void Wizard$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.sg.widgets.Wizard", "xdc.tools.sg.widgets");
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.Wizard.Module", "xdc.tools.sg.widgets");
        vo.init2(po, "xdc.tools.sg.widgets.Wizard", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.sg.widgets.Wizard$$capsule", "xdc.tools.sg.widgets"));
        vo.bind("Instance", om.findStrict("xdc.tools.sg.widgets.Wizard.Instance", "xdc.tools.sg.widgets"));
        vo.bind("Params", om.findStrict("xdc.tools.sg.widgets.Wizard.Params", "xdc.tools.sg.widgets"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.sg.widgets.Wizard.Params", "xdc.tools.sg.widgets")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.sg.widgets", "xdc.tools.sg.widgets"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Status", om.findStrict("xdc.tools.sg.widgets.Wizard.Status", "xdc.tools.sg.widgets"));
        vo.bind("FINISHED", om.findStrict("xdc.tools.sg.widgets.Wizard.FINISHED", "xdc.tools.sg.widgets"));
        vo.bind("CANCELED", om.findStrict("xdc.tools.sg.widgets.Wizard.CANCELED", "xdc.tools.sg.widgets"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.tools.sg.widgets");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.sg.widgets")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.sg.widgets.Wizard$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.sg.widgets.Wizard.Object", "xdc.tools.sg.widgets"));
        pkgV.bind("Wizard", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Wizard");
    }

    void PathEditor$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.sg.widgets.PathEditor", "xdc.tools.sg.widgets");
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.PathEditor.Module", "xdc.tools.sg.widgets");
        vo.init2(po, "xdc.tools.sg.widgets.PathEditor", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.sg.widgets.PathEditor$$capsule", "xdc.tools.sg.widgets"));
        vo.bind("Instance", om.findStrict("xdc.tools.sg.widgets.PathEditor.Instance", "xdc.tools.sg.widgets"));
        vo.bind("Params", om.findStrict("xdc.tools.sg.widgets.PathEditor.Params", "xdc.tools.sg.widgets"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.sg.widgets.PathEditor.Params", "xdc.tools.sg.widgets")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.sg.widgets", "xdc.tools.sg.widgets"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.tools.sg.widgets");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.sg.widgets")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.sg.widgets.PathEditor$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.sg.widgets.PathEditor.Object", "xdc.tools.sg.widgets"));
        pkgV.bind("PathEditor", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("PathEditor");
    }

    void DB$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.tools.sg.widgets.DB", "xdc.tools.sg.widgets");
        po = (Proto.Obj)om.findStrict("xdc.tools.sg.widgets.DB.Module", "xdc.tools.sg.widgets");
        vo.init2(po, "xdc.tools.sg.widgets.DB", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.tools.sg.widgets.DB$$capsule", "xdc.tools.sg.widgets"));
        vo.bind("Instance", om.findStrict("xdc.tools.sg.widgets.DB.Instance", "xdc.tools.sg.widgets"));
        vo.bind("Params", om.findStrict("xdc.tools.sg.widgets.DB.Params", "xdc.tools.sg.widgets"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.tools.sg.widgets.DB.Params", "xdc.tools.sg.widgets")).newInstance());
        vo.bind("$package", om.findStrict("xdc.tools.sg.widgets", "xdc.tools.sg.widgets"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.tools.sg.widgets")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.tools.sg.widgets.DB$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.tools.sg.widgets.DB.Object", "xdc.tools.sg.widgets"));
        pkgV.bind("DB", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("DB");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.sg.widgets.Tab", "xdc.tools.sg.widgets"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.sg.widgets.Wizard", "xdc.tools.sg.widgets"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.sg.widgets.PathEditor", "xdc.tools.sg.widgets"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.tools.sg.widgets.DB", "xdc.tools.sg.widgets"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.tools.sg.widgets.Widget")).bless();
        ((Value.Obj)om.getv("xdc.tools.sg.widgets.Cap")).bless();
        ((Value.Obj)om.getv("xdc.tools.sg.widgets.Tab")).bless();
        ((Value.Obj)om.getv("xdc.tools.sg.widgets.Wizard")).bless();
        ((Value.Obj)om.getv("xdc.tools.sg.widgets.PathEditor")).bless();
        ((Value.Obj)om.getv("xdc.tools.sg.widgets.DB")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.tools.sg.widgets")).add(pkgV);
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
        Widget$$OBJECTS();
        Cap$$OBJECTS();
        Tab$$OBJECTS();
        Wizard$$OBJECTS();
        PathEditor$$OBJECTS();
        DB$$OBJECTS();
        Widget$$CONSTS();
        Cap$$CONSTS();
        Tab$$CONSTS();
        Wizard$$CONSTS();
        PathEditor$$CONSTS();
        DB$$CONSTS();
        Widget$$CREATES();
        Cap$$CREATES();
        Tab$$CREATES();
        Wizard$$CREATES();
        PathEditor$$CREATES();
        DB$$CREATES();
        Widget$$FUNCTIONS();
        Cap$$FUNCTIONS();
        Tab$$FUNCTIONS();
        Wizard$$FUNCTIONS();
        PathEditor$$FUNCTIONS();
        DB$$FUNCTIONS();
        Widget$$SIZES();
        Cap$$SIZES();
        Tab$$SIZES();
        Wizard$$SIZES();
        PathEditor$$SIZES();
        DB$$SIZES();
        Widget$$TYPES();
        Cap$$TYPES();
        Tab$$TYPES();
        Wizard$$TYPES();
        PathEditor$$TYPES();
        DB$$TYPES();
        if (isROV) {
            Widget$$ROV();
            Cap$$ROV();
            Tab$$ROV();
            Wizard$$ROV();
            PathEditor$$ROV();
            DB$$ROV();
        }//isROV
        $$SINGLETONS();
        Widget$$SINGLETONS();
        Cap$$SINGLETONS();
        Tab$$SINGLETONS();
        Wizard$$SINGLETONS();
        PathEditor$$SINGLETONS();
        DB$$SINGLETONS();
        $$INITIALIZATION();
    }
}
