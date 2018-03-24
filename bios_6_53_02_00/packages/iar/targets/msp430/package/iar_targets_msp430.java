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

public class iar_targets_msp430
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
        Global.callFxn("loadPackage", xdcO, "xdc.bld");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("iar.targets.msp430.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("iar.targets.msp430", new Value.Obj("iar.targets.msp430", pkgP));
    }

    void ITarget$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("iar.targets.msp430.ITarget.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("iar.targets.msp430.ITarget", new Value.Obj("iar.targets.msp430.ITarget", po));
        pkgV.bind("ITarget", vo);
        // decls 
        om.bind("iar.targets.msp430.ITarget.Model", om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.Extension", om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.Command", om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.ITarget.Options", om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
    }

    void MSP430$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("iar.targets.msp430.MSP430.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("iar.targets.msp430.MSP430", new Value.Obj("iar.targets.msp430.MSP430", po));
        pkgV.bind("MSP430", vo);
        // decls 
        om.bind("iar.targets.msp430.MSP430.Model", om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.Extension", om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.Command", om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430.Options", om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
    }

    void MSP430X_large$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("iar.targets.msp430.MSP430X_large.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("iar.targets.msp430.MSP430X_large", new Value.Obj("iar.targets.msp430.MSP430X_large", po));
        pkgV.bind("MSP430X_large", vo);
        // decls 
        om.bind("iar.targets.msp430.MSP430X_large.Model", om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.Extension", om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.Command", om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_large.Options", om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
    }

    void MSP430X_small$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("iar.targets.msp430.MSP430X_small.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("iar.targets.msp430.MSP430X_small", new Value.Obj("iar.targets.msp430.MSP430X_small", po));
        pkgV.bind("MSP430X_small", vo);
        // decls 
        om.bind("iar.targets.msp430.MSP430X_small.Model", om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.Extension", om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.Command", om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        om.bind("iar.targets.msp430.MSP430X_small.Options", om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
    }

    void ITarget$$CONSTS()
    {
        // interface ITarget
    }

    void MSP430$$CONSTS()
    {
        // module MSP430
    }

    void MSP430X_large$$CONSTS()
    {
        // module MSP430X_large
    }

    void MSP430X_small$$CONSTS()
    {
        // module MSP430X_small
    }

    void ITarget$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MSP430$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MSP430X_large$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MSP430X_small$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ITarget$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430X_large$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430X_small$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITarget$$SIZES()
    {
    }

    void MSP430$$SIZES()
    {
    }

    void MSP430X_large$$SIZES()
    {
    }

    void MSP430X_small$$SIZES()
    {
    }

    void ITarget$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "iar/targets/msp430/ITarget.xs");
        om.bind("iar.targets.msp430.ITarget$$capsule", cap);
        po = (Proto.Obj)om.findStrict("iar.targets.msp430.ITarget.Module", "iar.targets.msp430");
        po.init("iar.targets.msp430.ITarget.Module", om.findStrict("xdc.bld.ITarget3.Module", "iar.targets.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("rts", $$T_Str, "iar.targets.msp430.rts", "rh");
        po.addFld("stdInclude", $$T_Str, "iar/targets/msp430/std.h", "wh");
        po.addFld("platform", $$T_Str, "ti.platforms.msp430:MSP430F5438:1", "wh");
        po.addFld("binDir", $$T_Str, "$(rootDir)/bin/", "wh");
        po.addFld("ccOpts", (Proto)om.findStrict("iar.targets.msp430.ITarget.Options", "iar.targets.msp430"), Global.newObject("prefix", "--silent", "suffix", "--diag_suppress=Pa050,Go005"), "wh");
        po.addFld("asmOpts", (Proto)om.findStrict("iar.targets.msp430.ITarget.Options", "iar.targets.msp430"), Global.newObject("prefix", "-S", "suffix", ""), "wh");
        po.addFld("ar", (Proto)om.findStrict("iar.targets.msp430.ITarget.Command", "iar.targets.msp430"), Global.newObject("cmd", "xar", "opts", ""), "rh");
        po.addFld("arOpts", (Proto)om.findStrict("iar.targets.msp430.ITarget.Options", "iar.targets.msp430"), Global.newObject("prefix", "", "suffix", ""), "wh");
        po.addFld("xlib", (Proto)om.findStrict("iar.targets.msp430.ITarget.Command", "iar.targets.msp430"), Global.newObject("cmd", "xlib", "opts", "-c"), "rh");
        po.addFld("xlibOpts", (Proto)om.findStrict("iar.targets.msp430.ITarget.Options", "iar.targets.msp430"), Global.newObject("prefix", "", "suffix", "\"MAKE-LIBRARY $@\""), "wh");
        po.addFld("lnk", (Proto)om.findStrict("iar.targets.msp430.ITarget.Command", "iar.targets.msp430"), Global.newObject("cmd", "xlink", "opts", ""), "rh");
        po.addFld("lnkOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"), Global.newObject("prefix", "-S", "suffix", "-xens -l $(XDCCFGDIR)/$@.map -rt -e_PrintfSmall=_Printf -e_ScanfSmall=_Scanf -s __program_start"), "wh");
        po.addFld("vers", (Proto)om.findStrict("iar.targets.msp430.ITarget.Command", "iar.targets.msp430"), Global.newObject("cmd", "icc430", "opts", "-v"), "rh");
        po.addFld("extensions", new Proto.Map((Proto)om.findStrict("iar.targets.msp430.ITarget.Extension", "iar.targets.msp430")), Global.newArray(new Object[]{Global.newArray(new Object[]{".asm", Global.newObject("suf", ".asm", "typ", "asm")}), Global.newArray(new Object[]{".c", Global.newObject("suf", ".c", "typ", "c")}), Global.newArray(new Object[]{".cpp", Global.newObject("suf", ".cpp", "typ", "cpp")}), Global.newArray(new Object[]{".cxx", Global.newObject("suf", ".cxx", "typ", "cpp")}), Global.newArray(new Object[]{".C", Global.newObject("suf", ".C", "typ", "cpp")}), Global.newArray(new Object[]{".cc", Global.newObject("suf", ".cc", "typ", "cpp")}), Global.newArray(new Object[]{".s43", Global.newObject("suf", ".s43", "typ", "asm")})}), "wh");
        po.addFld("includeOpts", $$T_Str, "", "wh");
        po.addFld("cmdPrefix", $$T_Str, "", "wh");
        po.addFld("alignDirectiveSupported", $$T_Bool, true, "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("iar.targets.msp430.ITarget$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("iar.targets.msp430.ITarget$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("iar.targets.msp430.ITarget$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "iar.targets.msp430"), fxn);
    }

    void MSP430$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("iar.targets.msp430.MSP430.Module", "iar.targets.msp430");
        po.init("iar.targets.msp430.MSP430.Module", om.findStrict("iar.targets.msp430.ITarget.Module", "iar.targets.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "MSP430", "rh");
        po.addFld("suffix", $$T_Str, "r430", "rh");
        po.addFld("isa", $$T_Str, "430", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"), Global.newObject("endian", "little", "codeModel", "small", "dataModel", "small", "shortEnums", true), "rh");
        po.addFld("cc", (Proto)om.findStrict("iar.targets.msp430.MSP430.Command", "iar.targets.msp430"), Global.newObject("cmd", "icc430", "opts", "-e --core=430 --data_model=small"), "rh");
        po.addFld("asm", (Proto)om.findStrict("iar.targets.msp430.MSP430.Command", "iar.targets.msp430"), Global.newObject("cmd", "a430", "opts", "--data_model small"), "rh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430")), Global.newArray(new Object[]{Global.newArray(new Object[]{"debug", Global.newObject("compileOpts", Global.newObject("copts", "--debug --dlib_config $(rootDir)/lib/dlib/dl430fn.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430fn.r43")}), Global.newArray(new Object[]{"release", Global.newObject("compileOpts", Global.newObject("copts", "-Ohs --dlib_config $(rootDir)/lib/dlib/dl430fn.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430fn.r43")}), Global.newArray(new Object[]{"debug_full", Global.newObject("compileOpts", Global.newObject("copts", "--debug --dlib_config $(rootDir)/lib/dlib/dl430ff.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430ff.r43")}), Global.newArray(new Object[]{"release_full", Global.newObject("compileOpts", Global.newObject("copts", "-Ohs --dlib_config $(rootDir)/lib/dlib/dl430ff.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430ff.r43")})}), "wh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"), Global.newObject("t_IArg", Global.newObject("size", 2L, "align", 2L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 4L, "align", 2L), "t_Float", Global.newObject("size", 4L, "align", 2L), "t_Fxn", Global.newObject("size", 2L, "align", 2L), "t_Int", Global.newObject("size", 2L, "align", 2L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 2L), "t_Long", Global.newObject("size", 4L, "align", 2L), "t_LDouble", Global.newObject("size", 4L, "align", 2L), "t_LLong", Global.newObject("size", 8L, "align", 2L), "t_Ptr", Global.newObject("size", 2L, "align", 2L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 2L, "align", 2L)), "rh");
                po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "iar.targets.msp430"), $$UNDEF);
                po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "iar.targets.msp430"), $$UNDEF);
    }

    void MSP430X_large$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "iar/targets/msp430/MSP430X_large.xs");
        om.bind("iar.targets.msp430.MSP430X_large$$capsule", cap);
        po = (Proto.Obj)om.findStrict("iar.targets.msp430.MSP430X_large.Module", "iar.targets.msp430");
        po.init("iar.targets.msp430.MSP430X_large.Module", om.findStrict("iar.targets.msp430.ITarget.Module", "iar.targets.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "MSP430X_large", "rh");
        po.addFld("suffix", $$T_Str, "r430XL", "rh");
        po.addFld("isa", $$T_Str, "430X", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"), Global.newObject("endian", "little", "codeModel", "large", "dataModel", "large", "shortEnums", true), "rh");
        po.addFld("cc", (Proto)om.findStrict("iar.targets.msp430.MSP430X_large.Command", "iar.targets.msp430"), Global.newObject("cmd", "icc430", "opts", "-e --core=430X --data_model=large"), "rh");
        po.addFld("asm", (Proto)om.findStrict("iar.targets.msp430.MSP430X_large.Command", "iar.targets.msp430"), Global.newObject("cmd", "a430", "opts", "-v1 --data_model large --code_model large -D__LARGE_DATA_MODEL__ -DUSE_LARGE_CODE_MODEL=1"), "rh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430")), Global.newArray(new Object[]{Global.newArray(new Object[]{"debug", Global.newObject("compileOpts", Global.newObject("copts", "--debug --dlib_config $(rootDir)/lib/dlib/dl430xllfn.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430xllfn.r43")}), Global.newArray(new Object[]{"release", Global.newObject("compileOpts", Global.newObject("copts", "-Ohs --dlib_config $(rootDir)/lib/dlib/dl430xllfn.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430xllfn.r43")}), Global.newArray(new Object[]{"debug_full", Global.newObject("compileOpts", Global.newObject("copts", "--debug --dlib_config $(rootDir)/lib/dlib/dl430xllff.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430xllff.r43")}), Global.newArray(new Object[]{"release_full", Global.newObject("compileOpts", Global.newObject("copts", "-Ohs --dlib_config $(rootDir)/lib/dlib/dl430xllff.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430xllff.r43")})}), "wh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"), Global.newObject("t_IArg", Global.newObject("size", 4L, "align", 2L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 4L, "align", 2L), "t_Float", Global.newObject("size", 4L, "align", 2L), "t_Fxn", Global.newObject("size", 4L, "align", 2L), "t_Int", Global.newObject("size", 2L, "align", 2L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 2L), "t_Long", Global.newObject("size", 4L, "align", 2L), "t_LDouble", Global.newObject("size", 4L, "align", 2L), "t_LLong", Global.newObject("size", 8L, "align", 2L), "t_Ptr", Global.newObject("size", 4L, "align", 2L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 4L, "align", 2L)), "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("iar.targets.msp430.MSP430X_large$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("iar.targets.msp430.MSP430X_large$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("iar.targets.msp430.MSP430X_large$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "iar.targets.msp430"), fxn);
    }

    void MSP430X_small$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "iar/targets/msp430/MSP430X_small.xs");
        om.bind("iar.targets.msp430.MSP430X_small$$capsule", cap);
        po = (Proto.Obj)om.findStrict("iar.targets.msp430.MSP430X_small.Module", "iar.targets.msp430");
        po.init("iar.targets.msp430.MSP430X_small.Module", om.findStrict("iar.targets.msp430.ITarget.Module", "iar.targets.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "MSP430X_small", "rh");
        po.addFld("suffix", $$T_Str, "r430XS", "rh");
        po.addFld("isa", $$T_Str, "430X", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"), Global.newObject("endian", "little", "codeModel", "large", "dataModel", "small", "shortEnums", true), "rh");
        po.addFld("cc", (Proto)om.findStrict("iar.targets.msp430.MSP430X_small.Command", "iar.targets.msp430"), Global.newObject("cmd", "icc430", "opts", "-e --core=430X --data_model=small --save_reg20"), "rh");
        po.addFld("asm", (Proto)om.findStrict("iar.targets.msp430.MSP430X_small.Command", "iar.targets.msp430"), Global.newObject("cmd", "a430", "opts", "-v1 --data_model small --code_model large -D__SMALL_DATA_MODEL__ -DUSE_LARGE_CODE_MODEL=1"), "rh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430")), Global.newArray(new Object[]{Global.newArray(new Object[]{"debug", Global.newObject("compileOpts", Global.newObject("copts", "--debug --dlib_config $(rootDir)/lib/dlib/dl430xlsfn.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430xlsfn.r43")}), Global.newArray(new Object[]{"release", Global.newObject("compileOpts", Global.newObject("copts", "-Ohs --dlib_config $(rootDir)/lib/dlib/dl430xlsfn.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430xlsfn.r43")}), Global.newArray(new Object[]{"debug_full", Global.newObject("compileOpts", Global.newObject("copts", "--debug --dlib_config $(rootDir)/lib/dlib/dl430xlsff.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430xlsff.r43")}), Global.newArray(new Object[]{"release_full", Global.newObject("compileOpts", Global.newObject("copts", "-Ohs --dlib_config $(rootDir)/lib/dlib/dl430xlsff.h"), "linkOpts", "$(rootDir)/lib/dlib/dl430xlsff.r43")})}), "wh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"), Global.newObject("t_IArg", Global.newObject("size", 4L, "align", 2L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 4L, "align", 2L), "t_Float", Global.newObject("size", 4L, "align", 2L), "t_Fxn", Global.newObject("size", 4L, "align", 2L), "t_Int", Global.newObject("size", 2L, "align", 2L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 2L), "t_Long", Global.newObject("size", 4L, "align", 2L), "t_LDouble", Global.newObject("size", 4L, "align", 2L), "t_LLong", Global.newObject("size", 8L, "align", 2L), "t_Ptr", Global.newObject("size", 2L, "align", 2L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 2L, "align", 2L)), "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("iar.targets.msp430.MSP430X_small$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("iar.targets.msp430.MSP430X_small$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("iar.targets.msp430.MSP430X_small$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "iar.targets.msp430"), fxn);
    }

    void ITarget$$ROV()
    {
    }

    void MSP430$$ROV()
    {
    }

    void MSP430X_large$$ROV()
    {
    }

    void MSP430X_small$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("iar.targets.msp430.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "iar.targets.msp430"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "iar/targets/msp430/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "iar.targets.msp430"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "iar.targets.msp430"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "iar.targets.msp430", Value.DEFAULT, false);
        pkgV.bind("$name", "iar.targets.msp430");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "iar.targets.msp430.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['iar.targets.msp430'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('iar.targets.msp430$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['iar.targets.msp430$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['iar.targets.msp430$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void ITarget$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("iar.targets.msp430.ITarget", "iar.targets.msp430");
        po = (Proto.Obj)om.findStrict("iar.targets.msp430.ITarget.Module", "iar.targets.msp430");
        vo.init2(po, "iar.targets.msp430.ITarget", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("iar.targets.msp430.ITarget$$capsule", "iar.targets.msp430"));
        vo.bind("$package", om.findStrict("iar.targets.msp430", "iar.targets.msp430"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "iar.targets.msp430"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITarget", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITarget");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void MSP430$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("iar.targets.msp430.MSP430", "iar.targets.msp430");
        po = (Proto.Obj)om.findStrict("iar.targets.msp430.MSP430.Module", "iar.targets.msp430");
        vo.init2(po, "iar.targets.msp430.MSP430", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("iar.targets.msp430", "iar.targets.msp430"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "iar.targets.msp430"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("iar.targets.msp430");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "iar.targets.msp430")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("iar.targets.msp430.MSP430$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("MSP430", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430");
    }

    void MSP430X_large$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("iar.targets.msp430.MSP430X_large", "iar.targets.msp430");
        po = (Proto.Obj)om.findStrict("iar.targets.msp430.MSP430X_large.Module", "iar.targets.msp430");
        vo.init2(po, "iar.targets.msp430.MSP430X_large", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("iar.targets.msp430.MSP430X_large$$capsule", "iar.targets.msp430"));
        vo.bind("$package", om.findStrict("iar.targets.msp430", "iar.targets.msp430"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "iar.targets.msp430"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("iar.targets.msp430");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "iar.targets.msp430")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("iar.targets.msp430.MSP430X_large$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("MSP430X_large", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430X_large");
    }

    void MSP430X_small$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("iar.targets.msp430.MSP430X_small", "iar.targets.msp430");
        po = (Proto.Obj)om.findStrict("iar.targets.msp430.MSP430X_small.Module", "iar.targets.msp430");
        vo.init2(po, "iar.targets.msp430.MSP430X_small", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("iar.targets.msp430.MSP430X_small$$capsule", "iar.targets.msp430"));
        vo.bind("$package", om.findStrict("iar.targets.msp430", "iar.targets.msp430"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "iar.targets.msp430"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "iar.targets.msp430"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "iar.targets.msp430"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "iar.targets.msp430"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "iar.targets.msp430"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "iar.targets.msp430"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "iar.targets.msp430"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "iar.targets.msp430"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "iar.targets.msp430"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "iar.targets.msp430"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "iar.targets.msp430"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "iar.targets.msp430"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "iar.targets.msp430"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "iar.targets.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("iar.targets.msp430");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "iar.targets.msp430")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("iar.targets.msp430.MSP430X_small$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("MSP430X_small", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430X_small");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("iar.targets.msp430.MSP430", "iar.targets.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("iar.targets.msp430.MSP430X_large", "iar.targets.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("iar.targets.msp430.MSP430X_small", "iar.targets.msp430"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("iar.targets.msp430.ITarget")).bless();
        ((Value.Obj)om.getv("iar.targets.msp430.MSP430")).bless();
        ((Value.Obj)om.getv("iar.targets.msp430.MSP430X_large")).bless();
        ((Value.Obj)om.getv("iar.targets.msp430.MSP430X_small")).bless();
        ((Value.Arr)om.findStrict("$packages", "iar.targets.msp430")).add(pkgV);
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
        ITarget$$OBJECTS();
        MSP430$$OBJECTS();
        MSP430X_large$$OBJECTS();
        MSP430X_small$$OBJECTS();
        ITarget$$CONSTS();
        MSP430$$CONSTS();
        MSP430X_large$$CONSTS();
        MSP430X_small$$CONSTS();
        ITarget$$CREATES();
        MSP430$$CREATES();
        MSP430X_large$$CREATES();
        MSP430X_small$$CREATES();
        ITarget$$FUNCTIONS();
        MSP430$$FUNCTIONS();
        MSP430X_large$$FUNCTIONS();
        MSP430X_small$$FUNCTIONS();
        ITarget$$SIZES();
        MSP430$$SIZES();
        MSP430X_large$$SIZES();
        MSP430X_small$$SIZES();
        ITarget$$TYPES();
        MSP430$$TYPES();
        MSP430X_large$$TYPES();
        MSP430X_small$$TYPES();
        if (isROV) {
            ITarget$$ROV();
            MSP430$$ROV();
            MSP430X_large$$ROV();
            MSP430X_small$$ROV();
        }//isROV
        $$SINGLETONS();
        ITarget$$SINGLETONS();
        MSP430$$SINGLETONS();
        MSP430X_large$$SINGLETONS();
        MSP430X_small$$SINGLETONS();
        $$INITIALIZATION();
    }
}
