/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D21
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class xdc_cfg
{
    static final String VERS = "@(#) xdc-D21\n";

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
        Global.callFxn("loadPackage", xdcO, "xdc.services.global");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.cfg.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.cfg", new Value.Obj("xdc.cfg", pkgP));
    }

    void Program$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.cfg.Program.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.cfg.Program", new Value.Obj("xdc.cfg.Program", po));
        pkgV.bind("Program", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.cfg.Program$$GenerationOptions", new Proto.Obj());
        om.bind("xdc.cfg.Program.GenerationOptions", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.cfg.Program$$SectionSpec", new Proto.Obj());
        om.bind("xdc.cfg.Program.SectionSpec", new Proto.Str(spo, true));
    }

    void Main$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.cfg.Main.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.cfg.Main", new Value.Obj("xdc.cfg.Main", po));
        pkgV.bind("Main", vo);
        // decls 
    }

    void SourceDir$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.cfg.SourceDir.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.cfg.SourceDir", new Value.Obj("xdc.cfg.SourceDir", po));
        pkgV.bind("SourceDir", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.cfg.SourceDir.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.cfg.SourceDir$$Object", new Proto.Obj());
        om.bind("xdc.cfg.SourceDir.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.cfg.SourceDir$$Params", new Proto.Obj());
        om.bind("xdc.cfg.SourceDir.Params", new Proto.Str(po, true));
    }

    void Program$$CONSTS()
    {
        // module Program
    }

    void Main$$CONSTS()
    {
        // module Main
    }

    void SourceDir$$CONSTS()
    {
        // module SourceDir
    }

    void Program$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Main$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void SourceDir$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.cfg.SourceDir$$create", new Proto.Fxn(om.findStrict("xdc.cfg.SourceDir.Module", "xdc.cfg"), om.findStrict("xdc.cfg.SourceDir.Instance", "xdc.cfg"), 2, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.cfg.SourceDir.Params", "xdc.cfg"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$cfg$SourceDir$$create = function( name, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.cfg.SourceDir'];\n");
            sb.append("var __inst = xdc.om['xdc.cfg.SourceDir.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.cfg']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {name:name});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.sourceDir = __mod.PARAMS.sourceDir;\n");
            sb.append("__inst.libraryName = __mod.PARAMS.libraryName;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [name]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.cfg.SourceDir$$construct", new Proto.Fxn(om.findStrict("xdc.cfg.SourceDir.Module", "xdc.cfg"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.cfg.SourceDir$$Object", "xdc.cfg"), null);
                fxn.addArg(1, "name", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.cfg.SourceDir.Params", "xdc.cfg"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$cfg$SourceDir$$construct = function( __obj, name, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.cfg.SourceDir'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {name:name});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.sourceDir = __mod.PARAMS.sourceDir;\n");
            sb.append("__inst.libraryName = __mod.PARAMS.libraryName;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Program$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Program.exportModule
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Program$$exportModule", new Proto.Fxn(om.findStrict("xdc.cfg.Program.Module", "xdc.cfg"), null, 1, 1, false));
                fxn.addArg(0, "modName", $$T_Str, $$UNDEF);
        // fxn Program.getSectMap
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Program$$getSectMap", new Proto.Fxn(om.findStrict("xdc.cfg.Program.Module", "xdc.cfg"), null, 0, -1, false));
        // fxn Program.importAssembly
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Program$$importAssembly", new Proto.Fxn(om.findStrict("xdc.cfg.Program.Module", "xdc.cfg"), null, 1, 1, false));
                fxn.addArg(0, "asmName", $$T_Str, $$UNDEF);
        // fxn Program.targetModules
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Program$$targetModules", new Proto.Fxn(om.findStrict("xdc.cfg.Program.Module", "xdc.cfg"), null, 0, -1, false));
    }

    void Main$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Main.init
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Main$$init", new Proto.Fxn(om.findStrict("xdc.cfg.Main.Module", "xdc.cfg"), null, 0, 0, false));
        // fxn Main.setExecutable
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Main$$setExecutable", new Proto.Fxn(om.findStrict("xdc.cfg.Main.Module", "xdc.cfg"), $$T_Str, 2, 2, false));
                fxn.addArg(0, "cfgScript", $$T_Str, $$UNDEF);
                fxn.addArg(1, "pathPrefix", $$T_Str, $$UNDEF);
        // fxn Main.runStringCfg
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Main$$runStringCfg", new Proto.Fxn(om.findStrict("xdc.cfg.Main.Module", "xdc.cfg"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "userScript", $$T_Str, $$UNDEF);
        // fxn Main.runCfg
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Main$$runCfg", new Proto.Fxn(om.findStrict("xdc.cfg.Main.Module", "xdc.cfg"), $$T_Str, 0, 0, false));
        // fxn Main.validate
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Main$$validate", new Proto.Fxn(om.findStrict("xdc.cfg.Main.Module", "xdc.cfg"), $$T_Str, 0, 0, false));
        // fxn Main.genFiles
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Main$$genFiles", new Proto.Fxn(om.findStrict("xdc.cfg.Main.Module", "xdc.cfg"), $$T_Str, 2, 2, false));
                fxn.addArg(0, "executable", $$T_Obj, $$UNDEF);
                fxn.addArg(1, "prefix", $$T_Str, $$UNDEF);
        // fxn Main.main
        fxn = (Proto.Fxn)om.bind("xdc.cfg.Main$$main", new Proto.Fxn(om.findStrict("xdc.cfg.Main.Module", "xdc.cfg"), null, 0, -1, false));
    }

    void SourceDir$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn SourceDir.getRelativePath
        fxn = (Proto.Fxn)om.bind("xdc.cfg.SourceDir$$getRelativePath", new Proto.Fxn(om.findStrict("xdc.cfg.SourceDir.Module", "xdc.cfg"), $$T_Str, 2, 2, false));
                fxn.addArg(0, "fm", $$T_Str, $$UNDEF);
                fxn.addArg(1, "to", $$T_Str, $$UNDEF);
        // fxn SourceDir.build
        fxn = (Proto.Fxn)om.bind("xdc.cfg.SourceDir$$build", new Proto.Fxn(om.findStrict("xdc.cfg.SourceDir.Module", "xdc.cfg"), Proto.Elm.newCNum("(xdc_Int)"), 0, 0, false));
        // fxn SourceDir.getName
        fxn = (Proto.Fxn)om.bind("xdc.cfg.SourceDir$$getName", new Proto.Fxn(om.findStrict("xdc.cfg.SourceDir.Instance", "xdc.cfg"), $$T_Str, 0, 0, false));
        // fxn SourceDir.getGenSourceDir
        fxn = (Proto.Fxn)om.bind("xdc.cfg.SourceDir$$getGenSourceDir", new Proto.Fxn(om.findStrict("xdc.cfg.SourceDir.Instance", "xdc.cfg"), $$T_Str, 0, 0, false));
        // fxn SourceDir.getGenLibraryName
        fxn = (Proto.Fxn)om.bind("xdc.cfg.SourceDir$$getGenLibraryName", new Proto.Fxn(om.findStrict("xdc.cfg.SourceDir.Instance", "xdc.cfg"), $$T_Str, 0, 0, false));
    }

    void Program$$SIZES()
    {
    }

    void Main$$SIZES()
    {
    }

    void SourceDir$$SIZES()
    {
    }

    void Program$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/cfg/Program.xs");
        om.bind("xdc.cfg.Program$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.cfg.Program.Module", "xdc.cfg");
        po.init("xdc.cfg.Program.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("gen", (Proto)om.findStrict("xdc.cfg.Program.GenerationOptions", "xdc.cfg"), $$DEFAULT, "wh");
        po.addFld("globalSection", $$T_Str, null, "wh");
        po.addFld("sysStack", Proto.Elm.newCNum("(xdc_UInt)"), 0x1000L, "wh");
        po.addFld("stack", Proto.Elm.newCNum("(xdc_UInt)"), 0x1000L, "wh");
        po.addFld("heap", Proto.Elm.newCNum("(xdc_UInt)"), 0x1000L, "wh");
        po.addFld("argSize", Proto.Elm.newCNum("(xdc_UInt)"), 0x200L, "wh");
        po.addFld("execCmd", $$T_Str, $$UNDEF, "wh");
        po.addFld("linkTemplate", $$T_Str, null, "wh");
        po.addFld("main", new Proto.Adr("xdc_Int(*)(xdc_Int,xdc_Char*[])", "PFn"), $$UNDEF, "wh");
        po.addFld("sectMap", new Proto.Map($$T_Obj), $$DEFAULT, "wh");
        po.addFld("sectionsExclude", $$T_Str, null, "wh");
        po.addFld("memoryExclude", $$T_Bool, false, "wh");
        po.addFld("sectionsTemplate", $$T_Str, null, "wh");
        po.addFld("system", $$T_Obj, $$UNDEF, "wh");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("cfgBase", $$T_Str, $$UNDEF, "wh");
        po.addFld("buildPackage", $$T_Str, $$UNDEF, "wh");
        po.addFld("endian", $$T_Str, null, "wh");
        po.addFld("codeModel", $$T_Str, null, "wh");
        po.addFld("dataModel", $$T_Str, null, "wh");
        po.addFld("build", $$T_Obj, $$UNDEF, "wh");
        po.addFld("cpu", (Proto)om.findStrict("xdc.platform.IExeContext.Instance", "xdc.cfg"), $$UNDEF, "wh");
        po.addFld("platformName", $$T_Str, $$UNDEF, "wh");
        po.addFld("platform", (Proto)om.findStrict("xdc.platform.IPlatform.Instance", "xdc.cfg"), $$UNDEF, "wh");
        po.addFld("global", new Proto.Map($$T_Obj), $$DEFAULT, "wh");
        po.addFld("symbol", new Proto.Map($$T_Obj), $$DEFAULT, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.cfg.Program$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.cfg.Program$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.cfg.Program$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("exportModule", (Proto.Fxn)om.findStrict("xdc.cfg.Program$$exportModule", "xdc.cfg"), Global.get(cap, "exportModule"));
                po.addFxn("getSectMap", (Proto.Fxn)om.findStrict("xdc.cfg.Program$$getSectMap", "xdc.cfg"), Global.get(cap, "getSectMap"));
                po.addFxn("importAssembly", (Proto.Fxn)om.findStrict("xdc.cfg.Program$$importAssembly", "xdc.cfg"), Global.get(cap, "importAssembly"));
                po.addFxn("targetModules", (Proto.Fxn)om.findStrict("xdc.cfg.Program$$targetModules", "xdc.cfg"), Global.get(cap, "targetModules"));
        // struct Program.GenerationOptions
        po = (Proto.Obj)om.findStrict("xdc.cfg.Program$$GenerationOptions", "xdc.cfg");
        po.init("xdc.cfg.Program.GenerationOptions", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("debuggerFiles", $$T_Bool, $$UNDEF, "w");
        // struct Program.SectionSpec
        po = (Proto.Obj)om.findStrict("xdc.cfg.Program$$SectionSpec", "xdc.cfg");
        po.init("xdc.cfg.Program.SectionSpec", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("runSegment", $$T_Str, $$UNDEF, "w");
                po.addFld("loadSegment", $$T_Str, $$UNDEF, "w");
                po.addFld("runAddress", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("loadAddress", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("runAlign", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("loadAlign", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("type", $$T_Str, $$UNDEF, "w");
                po.addFld("fill", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
    }

    void Main$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/cfg/Main.xs");
        om.bind("xdc.cfg.Main$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.cfg.Main.Module", "xdc.cfg");
        po.init("xdc.cfg.Main.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.cfg.Main$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.cfg.Main$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.cfg.Main$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("init", (Proto.Fxn)om.findStrict("xdc.cfg.Main$$init", "xdc.cfg"), Global.get(cap, "init"));
                po.addFxn("setExecutable", (Proto.Fxn)om.findStrict("xdc.cfg.Main$$setExecutable", "xdc.cfg"), Global.get(cap, "setExecutable"));
                po.addFxn("runStringCfg", (Proto.Fxn)om.findStrict("xdc.cfg.Main$$runStringCfg", "xdc.cfg"), Global.get(cap, "runStringCfg"));
                po.addFxn("runCfg", (Proto.Fxn)om.findStrict("xdc.cfg.Main$$runCfg", "xdc.cfg"), Global.get(cap, "runCfg"));
                po.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.cfg.Main$$validate", "xdc.cfg"), Global.get(cap, "validate"));
                po.addFxn("genFiles", (Proto.Fxn)om.findStrict("xdc.cfg.Main$$genFiles", "xdc.cfg"), Global.get(cap, "genFiles"));
                po.addFxn("main", (Proto.Fxn)om.findStrict("xdc.cfg.Main$$main", "xdc.cfg"), Global.get(cap, "main"));
    }

    void SourceDir$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/cfg/SourceDir.xs");
        om.bind("xdc.cfg.SourceDir$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.cfg.SourceDir.Module", "xdc.cfg");
        po.init("xdc.cfg.SourceDir.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("outputDir", $$T_Str, $$UNDEF, "wh");
        po.addFld("toBuildDir", $$T_Str, $$UNDEF, "wh");
        po.addFld("makefileName", $$T_Str, "makefile.libs", "wh");
        po.addFld("verbose", Proto.Elm.newCNum("(xdc_Int)"), 0L, "wh");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.cfg.SourceDir$$create", "xdc.cfg"), Global.get("xdc$cfg$SourceDir$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.cfg.SourceDir$$construct", "xdc.cfg"), Global.get("xdc$cfg$SourceDir$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.cfg.SourceDir$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.cfg.SourceDir$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.cfg.SourceDir$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.cfg.SourceDir$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("getRelativePath", (Proto.Fxn)om.findStrict("xdc.cfg.SourceDir$$getRelativePath", "xdc.cfg"), Global.get(cap, "getRelativePath"));
                po.addFxn("build", (Proto.Fxn)om.findStrict("xdc.cfg.SourceDir$$build", "xdc.cfg"), Global.get(cap, "build"));
        po = (Proto.Obj)om.findStrict("xdc.cfg.SourceDir.Instance", "xdc.cfg");
        po.init("xdc.cfg.SourceDir.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("sourceDir", $$T_Str, $$UNDEF, "wh");
        po.addFld("libraryName", $$T_Str, $$UNDEF, "wh");
        po.addFld("buildLibs", $$T_Bool, true, "wh");
                po.addFxn("getName", (Proto.Fxn)om.findStrict("xdc.cfg.SourceDir$$getName", "xdc.cfg"), Global.get(cap, "getName"));
                po.addFxn("getGenSourceDir", (Proto.Fxn)om.findStrict("xdc.cfg.SourceDir$$getGenSourceDir", "xdc.cfg"), Global.get(cap, "getGenSourceDir"));
                po.addFxn("getGenLibraryName", (Proto.Fxn)om.findStrict("xdc.cfg.SourceDir$$getGenLibraryName", "xdc.cfg"), Global.get(cap, "getGenLibraryName"));
        po = (Proto.Obj)om.findStrict("xdc.cfg.SourceDir$$Params", "xdc.cfg");
        po.init("xdc.cfg.SourceDir.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("sourceDir", $$T_Str, $$UNDEF, "wh");
        po.addFld("libraryName", $$T_Str, $$UNDEF, "wh");
        po.addFld("buildLibs", $$T_Bool, true, "wh");
        po = (Proto.Obj)om.findStrict("xdc.cfg.SourceDir$$Object", "xdc.cfg");
        po.init("xdc.cfg.SourceDir.Object", om.findStrict("xdc.cfg.SourceDir.Instance", "xdc.cfg"));
                po.addFxn("getName", (Proto.Fxn)om.findStrict("xdc.cfg.SourceDir$$getName", "xdc.cfg"), Global.get(cap, "getName"));
                po.addFxn("getGenSourceDir", (Proto.Fxn)om.findStrict("xdc.cfg.SourceDir$$getGenSourceDir", "xdc.cfg"), Global.get(cap, "getGenSourceDir"));
                po.addFxn("getGenLibraryName", (Proto.Fxn)om.findStrict("xdc.cfg.SourceDir$$getGenLibraryName", "xdc.cfg"), Global.get(cap, "getGenLibraryName"));
    }

    void Program$$ROV()
    {
    }

    void Main$$ROV()
    {
    }

    void SourceDir$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.cfg.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.cfg"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.cfg", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.cfg");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.cfg.");
        pkgV.bind("$vers", Global.newArray(1, 0, 2));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.services.global", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.cfg'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.cfg$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.cfg$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.cfg$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Program$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.cfg.Program", "xdc.cfg");
        po = (Proto.Obj)om.findStrict("xdc.cfg.Program.Module", "xdc.cfg");
        vo.init2(po, "xdc.cfg.Program", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.cfg.Program$$capsule", "xdc.cfg"));
        vo.bind("$package", om.findStrict("xdc.cfg", "xdc.cfg"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("GenerationOptions", om.findStrict("xdc.cfg.Program.GenerationOptions", "xdc.cfg"));
        tdefs.add(om.findStrict("xdc.cfg.Program.GenerationOptions", "xdc.cfg"));
        vo.bind("SectionSpec", om.findStrict("xdc.cfg.Program.SectionSpec", "xdc.cfg"));
        tdefs.add(om.findStrict("xdc.cfg.Program.SectionSpec", "xdc.cfg"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.cfg")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.cfg.Program$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Program.xdt");
        atmap.seal("length");
        vo.bind("TEMPLATE$", "./Program.xdt");
        pkgV.bind("Program", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Program");
    }

    void Main$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.cfg.Main", "xdc.cfg");
        po = (Proto.Obj)om.findStrict("xdc.cfg.Main.Module", "xdc.cfg");
        vo.init2(po, "xdc.cfg.Main", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.cfg.Main$$capsule", "xdc.cfg"));
        vo.bind("$package", om.findStrict("xdc.cfg", "xdc.cfg"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.cfg")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.cfg.Main$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Main", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Main");
    }

    void SourceDir$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.cfg.SourceDir", "xdc.cfg");
        po = (Proto.Obj)om.findStrict("xdc.cfg.SourceDir.Module", "xdc.cfg");
        vo.init2(po, "xdc.cfg.SourceDir", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.cfg.SourceDir$$capsule", "xdc.cfg"));
        vo.bind("Instance", om.findStrict("xdc.cfg.SourceDir.Instance", "xdc.cfg"));
        vo.bind("Params", om.findStrict("xdc.cfg.SourceDir.Params", "xdc.cfg"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.cfg.SourceDir.Params", "xdc.cfg")).newInstance());
        vo.bind("$package", om.findStrict("xdc.cfg", "xdc.cfg"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.cfg")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.cfg.SourceDir$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./SourceDir.xdt");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.cfg.SourceDir.Object", "xdc.cfg"));
        vo.bind("TEMPLATE$", "./SourceDir.xdt");
        pkgV.bind("SourceDir", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SourceDir");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.cfg.Program", "xdc.cfg"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.cfg.Main", "xdc.cfg"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.cfg.SourceDir", "xdc.cfg"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.cfg.Program")).bless();
        ((Value.Obj)om.getv("xdc.cfg.Main")).bless();
        ((Value.Obj)om.getv("xdc.cfg.SourceDir")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.cfg")).add(pkgV);
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
        Program$$OBJECTS();
        Main$$OBJECTS();
        SourceDir$$OBJECTS();
        Program$$CONSTS();
        Main$$CONSTS();
        SourceDir$$CONSTS();
        Program$$CREATES();
        Main$$CREATES();
        SourceDir$$CREATES();
        Program$$FUNCTIONS();
        Main$$FUNCTIONS();
        SourceDir$$FUNCTIONS();
        Program$$SIZES();
        Main$$SIZES();
        SourceDir$$SIZES();
        Program$$TYPES();
        Main$$TYPES();
        SourceDir$$TYPES();
        if (isROV) {
            Program$$ROV();
            Main$$ROV();
            SourceDir$$ROV();
        }//isROV
        $$SINGLETONS();
        Program$$SINGLETONS();
        Main$$SINGLETONS();
        SourceDir$$SINGLETONS();
        $$INITIALIZATION();
    }
}
