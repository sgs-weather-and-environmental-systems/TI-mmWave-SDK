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

public class ti_targets_msp430
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
        Global.callFxn("loadPackage", xdcO, "xdc.bld");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "ti.targets");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.targets.msp430.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.targets.msp430", new Value.Obj("ti.targets.msp430", pkgP));
    }

    void MSP430$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.targets.msp430.MSP430.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.targets.msp430.MSP430", new Value.Obj("ti.targets.msp430.MSP430", po));
        pkgV.bind("MSP430", vo);
        // decls 
        om.bind("ti.targets.msp430.MSP430.Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430.Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
    }

    void MSP430X$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.targets.msp430.MSP430X.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.targets.msp430.MSP430X", new Value.Obj("ti.targets.msp430.MSP430X", po));
        pkgV.bind("MSP430X", vo);
        // decls 
        om.bind("ti.targets.msp430.MSP430X.Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X.Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
    }

    void MSP430X_small$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.targets.msp430.MSP430X_small.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.targets.msp430.MSP430X_small", new Value.Obj("ti.targets.msp430.MSP430X_small", po));
        pkgV.bind("MSP430X_small", vo);
        // decls 
        om.bind("ti.targets.msp430.MSP430X_small.Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.MSP430X_small.Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
    }

    void Generic$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.targets.msp430.Generic.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.targets.msp430.Generic", new Value.Obj("ti.targets.msp430.Generic", po));
        pkgV.bind("Generic", vo);
        // decls 
        om.bind("ti.targets.msp430.Generic.Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        om.bind("ti.targets.msp430.Generic.Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
    }

    void MSP430$$CONSTS()
    {
        // module MSP430
    }

    void MSP430X$$CONSTS()
    {
        // module MSP430X
    }

    void MSP430X_small$$CONSTS()
    {
        // module MSP430X_small
    }

    void Generic$$CONSTS()
    {
        // module Generic
    }

    void MSP430$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MSP430X$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MSP430X_small$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Generic$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MSP430$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430X$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430X_small$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Generic$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Generic.asmName
        fxn = (Proto.Fxn)om.bind("ti.targets.msp430.Generic$$asmName", new Proto.Fxn(om.findStrict("ti.targets.msp430.Generic.Module", "ti.targets.msp430"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "CName", $$T_Str, $$UNDEF);
    }

    void MSP430$$SIZES()
    {
    }

    void MSP430X$$SIZES()
    {
    }

    void MSP430X_small$$SIZES()
    {
    }

    void Generic$$SIZES()
    {
    }

    void MSP430$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/targets/msp430/MSP430.xs");
        om.bind("ti.targets.msp430.MSP430$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.targets.msp430.MSP430.Module", "ti.targets.msp430");
        po.init("ti.targets.msp430.MSP430.Module", om.findStrict("ti.targets.ITarget.Module", "ti.targets.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "MSP430", "rh");
        po.addFld("suffix", $$T_Str, "430", "rh");
        po.addFld("isa", $$T_Str, "430", "rh");
        po.addFld("rts", $$T_Str, "ti.targets.msp430.rts430", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"), Global.newObject("endian", "little", "codeModel", "small", "dataModel", "small"), "rh");
        po.addFld("stdInclude", $$T_Str, "ti/targets/msp430/std.h", "rh");
        po.addFld("ar", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "ar430", "opts", "rq"), "rh");
        po.addFld("cc", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430 -c", "opts", " -vmsp"), "rh");
        po.addFld("vers", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430", "opts", "--compiler_revision"), "rh");
        po.addFld("asm", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430 -c", "opts", " -vmsp"), "rh");
        po.addFld("lnk", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430", "opts", "-z"), "rh");
        po.addFld("asmOpts", (Proto)om.findStrict("ti.targets.ITarget.Options", "ti.targets.msp430"), Global.newObject("prefix", "-qq", "suffix", ""), "wh");
        po.addFld("ccOpts", (Proto)om.findStrict("ti.targets.ITarget.Options", "ti.targets.msp430"), Global.newObject("prefix", "-qq -pdsw225", "suffix", ""), "wh");
        po.addFld("ccConfigOpts", (Proto)om.findStrict("ti.targets.ITarget.Options", "ti.targets.msp430"), Global.newObject("prefix", "$(ccOpts.prefix)", "suffix", "$(ccOpts.suffix)"), "wh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430")), Global.newArray(new Object[]{Global.newArray(new Object[]{"debug", Global.newObject("compileOpts", Global.newObject("copts", "-g", "defs", "-D_DEBUG_=1"))}), Global.newArray(new Object[]{"release", Global.newObject("compileOpts", Global.newObject("copts", "-O2 -g --optimize_with_debug"))}), Global.newArray(new Object[]{"profile", Global.newObject("compileOpts", Global.newObject("copts", "-gp"))}), Global.newArray(new Object[]{"coverage", Global.newObject("compileOpts", Global.newObject("copts", "-gp"))})}), "wh");
        po.addFld("includeOpts", $$T_Str, "-I$(rootDir)/include ", "wh");
        po.addFld("sectMap", new Proto.Map($$T_Str), Global.newArray(new Object[]{Global.newArray(new Object[]{".text", "code"}), Global.newArray(new Object[]{".cinit", "code"}), Global.newArray(new Object[]{".const", "code"}), Global.newArray(new Object[]{".pinit", "code"}), Global.newArray(new Object[]{".bss", "data"}), Global.newArray(new Object[]{".sysmem", "data"}), Global.newArray(new Object[]{".stack", "stack"}), Global.newArray(new Object[]{".args", "data"}), Global.newArray(new Object[]{".cio", "data"}), Global.newArray(new Object[]{".reset", "data"})}), "rh");
        po.addFld("splitMap", new Proto.Map($$T_Bool), Global.newArray(new Object[]{Global.newArray(new Object[]{".text", true}), Global.newArray(new Object[]{".const", true}), Global.newArray(new Object[]{".args", true}), Global.newArray(new Object[]{".cio", true})}), "rh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"), Global.newObject("t_IArg", Global.newObject("size", 2L, "align", 2L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 4L, "align", 2L), "t_Float", Global.newObject("size", 4L, "align", 2L), "t_Fxn", Global.newObject("size", 2L, "align", 2L), "t_Int", Global.newObject("size", 2L, "align", 2L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 2L), "t_Long", Global.newObject("size", 4L, "align", 2L), "t_LDouble", Global.newObject("size", 4L, "align", 2L), "t_LLong", Global.newObject("size", 8L, "align", 2L), "t_Ptr", Global.newObject("size", 2L, "align", 2L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 2L, "align", 2L)), "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.targets.msp430.MSP430$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.targets.msp430.MSP430$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.targets.msp430.MSP430$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "asmName");
                if (fxn != null) po.addFxn("asmName", (Proto.Fxn)om.findStrict("ti.targets.ITarget$$asmName", "ti.targets.msp430"), fxn);
    }

    void MSP430X$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/targets/msp430/MSP430X.xs");
        om.bind("ti.targets.msp430.MSP430X$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.targets.msp430.MSP430X.Module", "ti.targets.msp430");
        po.init("ti.targets.msp430.MSP430X.Module", om.findStrict("ti.targets.ITarget.Module", "ti.targets.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "MSP430X", "rh");
        po.addFld("suffix", $$T_Str, "430X", "rh");
        po.addFld("isa", $$T_Str, "430X", "rh");
        po.addFld("rts", $$T_Str, "ti.targets.msp430.rts430", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"), Global.newObject("endian", "little", "codeModel", "large", "dataModel", "restricted"), "rh");
        po.addFld("stdInclude", $$T_Str, "ti/targets/msp430/std.h", "rh");
        po.addFld("ar", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "ar430", "opts", "rq"), "rh");
        po.addFld("cc", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430 -c", "opts", " -vmspx --near_data=none --code_model=large --data_model=restricted"), "rh");
        po.addFld("vers", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430", "opts", "--compiler_revision"), "rh");
        po.addFld("asm", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430 -c", "opts", " -vmspx --near_data=none --code_model=large --data_model=restricted"), "rh");
        po.addFld("lnk", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430", "opts", "-z"), "rh");
        po.addFld("asmOpts", (Proto)om.findStrict("ti.targets.ITarget.Options", "ti.targets.msp430"), Global.newObject("prefix", "-qq", "suffix", ""), "wh");
        po.addFld("ccOpts", (Proto)om.findStrict("ti.targets.ITarget.Options", "ti.targets.msp430"), Global.newObject("prefix", "-qq -pdsw225", "suffix", ""), "wh");
        po.addFld("ccConfigOpts", (Proto)om.findStrict("ti.targets.ITarget.Options", "ti.targets.msp430"), Global.newObject("prefix", "$(ccOpts.prefix)", "suffix", "$(ccOpts.suffix)"), "wh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430")), Global.newArray(new Object[]{Global.newArray(new Object[]{"debug", Global.newObject("compileOpts", Global.newObject("copts", "-g", "defs", "-D_DEBUG_=1"))}), Global.newArray(new Object[]{"release", Global.newObject("compileOpts", Global.newObject("copts", "-O2 -g --optimize_with_debug"))}), Global.newArray(new Object[]{"profile", Global.newObject("compileOpts", Global.newObject("copts", "-gp"))}), Global.newArray(new Object[]{"coverage", Global.newObject("compileOpts", Global.newObject("copts", "-gp"))})}), "wh");
        po.addFld("includeOpts", $$T_Str, "-I$(rootDir)/include ", "wh");
        po.addFld("sectMap", new Proto.Map($$T_Str), Global.newArray(new Object[]{Global.newArray(new Object[]{".text", "code"}), Global.newArray(new Object[]{".cinit", "code"}), Global.newArray(new Object[]{".const", "code"}), Global.newArray(new Object[]{".pinit", "code"}), Global.newArray(new Object[]{".bss", "data"}), Global.newArray(new Object[]{".sysmem", "data"}), Global.newArray(new Object[]{".stack", "stack"}), Global.newArray(new Object[]{".args", "data"}), Global.newArray(new Object[]{".cio", "data"}), Global.newArray(new Object[]{".reset", "data"})}), "rh");
        po.addFld("splitMap", new Proto.Map($$T_Bool), Global.newArray(new Object[]{Global.newArray(new Object[]{".text", true}), Global.newArray(new Object[]{".const", true}), Global.newArray(new Object[]{".args", true}), Global.newArray(new Object[]{".cio", true})}), "rh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"), Global.newObject("t_IArg", Global.newObject("size", 4L, "align", 2L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 4L, "align", 2L), "t_Float", Global.newObject("size", 4L, "align", 2L), "t_Fxn", Global.newObject("size", 4L, "align", 2L), "t_Int", Global.newObject("size", 2L, "align", 2L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 2L), "t_Long", Global.newObject("size", 4L, "align", 2L), "t_LDouble", Global.newObject("size", 4L, "align", 2L), "t_LLong", Global.newObject("size", 8L, "align", 2L), "t_Ptr", Global.newObject("size", 4L, "align", 2L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 2L, "align", 2L)), "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.targets.msp430.MSP430X$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.targets.msp430.MSP430X$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.targets.msp430.MSP430X$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "asmName");
                if (fxn != null) po.addFxn("asmName", (Proto.Fxn)om.findStrict("ti.targets.ITarget$$asmName", "ti.targets.msp430"), fxn);
    }

    void MSP430X_small$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/targets/msp430/MSP430X_small.xs");
        om.bind("ti.targets.msp430.MSP430X_small$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.targets.msp430.MSP430X_small.Module", "ti.targets.msp430");
        po.init("ti.targets.msp430.MSP430X_small.Module", om.findStrict("ti.targets.ITarget.Module", "ti.targets.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "MSP430X_small", "rh");
        po.addFld("suffix", $$T_Str, "430XS", "rh");
        po.addFld("isa", $$T_Str, "430X", "rh");
        po.addFld("rts", $$T_Str, "ti.targets.msp430.rts430", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"), Global.newObject("endian", "little", "dataModel", "small", "codeModel", "small"), "rh");
        po.addFld("stdInclude", $$T_Str, "ti/targets/msp430/std.h", "rh");
        po.addFld("ar", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "ar430", "opts", "rq"), "rh");
        po.addFld("cc", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430 -c", "opts", " -vmspx --code_model=small --data_model=small"), "rh");
        po.addFld("vers", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430", "opts", "--compiler_revision"), "rh");
        po.addFld("asm", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430 -c", "opts", " -vmspx --code_model=small --data_model=small"), "rh");
        po.addFld("lnk", (Proto)om.findStrict("ti.targets.ITarget.Command", "ti.targets.msp430"), Global.newObject("cmd", "cl430", "opts", "-z"), "rh");
        po.addFld("asmOpts", (Proto)om.findStrict("ti.targets.ITarget.Options", "ti.targets.msp430"), Global.newObject("prefix", "-qq", "suffix", ""), "wh");
        po.addFld("ccOpts", (Proto)om.findStrict("ti.targets.ITarget.Options", "ti.targets.msp430"), Global.newObject("prefix", "-qq -pdsw225", "suffix", ""), "wh");
        po.addFld("ccConfigOpts", (Proto)om.findStrict("ti.targets.ITarget.Options", "ti.targets.msp430"), Global.newObject("prefix", "$(ccOpts.prefix)", "suffix", "$(ccOpts.suffix)"), "wh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430")), Global.newArray(new Object[]{Global.newArray(new Object[]{"debug", Global.newObject("compileOpts", Global.newObject("copts", "-g", "defs", "-D_DEBUG_=1"))}), Global.newArray(new Object[]{"release", Global.newObject("compileOpts", Global.newObject("copts", "-O2 -g --optimize_with_debug"))}), Global.newArray(new Object[]{"profile", Global.newObject("compileOpts", Global.newObject("copts", "-gp"))}), Global.newArray(new Object[]{"coverage", Global.newObject("compileOpts", Global.newObject("copts", "-gp"))})}), "wh");
        po.addFld("includeOpts", $$T_Str, "-I$(rootDir)/include ", "wh");
        po.addFld("sectMap", new Proto.Map($$T_Str), Global.newArray(new Object[]{Global.newArray(new Object[]{".text", "code"}), Global.newArray(new Object[]{".cinit", "code"}), Global.newArray(new Object[]{".const", "code"}), Global.newArray(new Object[]{".pinit", "code"}), Global.newArray(new Object[]{".bss", "data"}), Global.newArray(new Object[]{".sysmem", "data"}), Global.newArray(new Object[]{".stack", "stack"}), Global.newArray(new Object[]{".args", "data"}), Global.newArray(new Object[]{".cio", "data"}), Global.newArray(new Object[]{".reset", "data"})}), "rh");
        po.addFld("splitMap", new Proto.Map($$T_Bool), Global.newArray(new Object[]{Global.newArray(new Object[]{".text", true}), Global.newArray(new Object[]{".const", true}), Global.newArray(new Object[]{".args", true}), Global.newArray(new Object[]{".cio", true})}), "rh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"), Global.newObject("t_IArg", Global.newObject("size", 2L, "align", 2L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 4L, "align", 2L), "t_Float", Global.newObject("size", 4L, "align", 2L), "t_Fxn", Global.newObject("size", 2L, "align", 2L), "t_Int", Global.newObject("size", 2L, "align", 2L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 2L), "t_Long", Global.newObject("size", 4L, "align", 2L), "t_LDouble", Global.newObject("size", 4L, "align", 2L), "t_LLong", Global.newObject("size", 8L, "align", 2L), "t_Ptr", Global.newObject("size", 2L, "align", 2L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 2L, "align", 2L)), "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.targets.msp430.MSP430X_small$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.targets.msp430.MSP430X_small$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.targets.msp430.MSP430X_small$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "asmName");
                if (fxn != null) po.addFxn("asmName", (Proto.Fxn)om.findStrict("ti.targets.ITarget$$asmName", "ti.targets.msp430"), fxn);
    }

    void Generic$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/targets/msp430/Generic.xs");
        om.bind("ti.targets.msp430.Generic$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.targets.msp430.Generic.Module", "ti.targets.msp430");
        po.init("ti.targets.msp430.Generic.Module", om.findStrict("xdc.bld.ITarget2.Module", "ti.targets.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "Generic", "rh");
        po.addFld("suffix", $$T_Str, "430", "rh");
        po.addFld("isa", $$T_Str, "430", "rh");
        po.addFld("rts", $$T_Str, "ti.targets.msp430.rts430", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"), Global.newObject("endian", "little"), "rh");
        po.addFld("stdInclude", $$T_Str, "ti/targets/msp430/std.h", "rh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430")), Global.newArray(new Object[]{Global.newArray(new Object[]{"debug", Global.newObject("compileOpts", Global.newObject("copts", "", "defs", "-D_DEBUG_=1"))}), Global.newArray(new Object[]{"release", Global.newObject("compileOpts", Global.newObject("copts", ""))})}), "wh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"), Global.newObject("t_IArg", Global.newObject("size", 2L, "align", 2L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 4L, "align", 2L), "t_Float", Global.newObject("size", 4L, "align", 2L), "t_Fxn", Global.newObject("size", 2L, "align", 2L), "t_Int", Global.newObject("size", 2L, "align", 2L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 2L), "t_Long", Global.newObject("size", 4L, "align", 2L), "t_LDouble", Global.newObject("size", 4L, "align", 2L), "t_LLong", Global.newObject("size", 8L, "align", 2L), "t_Ptr", Global.newObject("size", 2L, "align", 2L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 2L, "align", 2L)), "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.targets.msp430.Generic$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.targets.msp430.Generic$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.targets.msp430.Generic$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "ti.targets.msp430"), fxn);
                po.addFxn("asmName", (Proto.Fxn)om.findStrict("ti.targets.msp430.Generic$$asmName", "ti.targets.msp430"), Global.get(cap, "asmName"));
    }

    void MSP430$$ROV()
    {
    }

    void MSP430X$$ROV()
    {
    }

    void MSP430X_small$$ROV()
    {
    }

    void Generic$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.targets.msp430.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.targets.msp430"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/targets/msp430/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.targets.msp430"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.targets.msp430"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.targets.msp430", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.targets.msp430");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.targets.msp430.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.bld", Global.newArray(1, 0, 2)));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.targets.msp430'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.targets.msp430$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.targets.msp430$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.targets.msp430$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void MSP430$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.targets.msp430.MSP430", "ti.targets.msp430");
        po = (Proto.Obj)om.findStrict("ti.targets.msp430.MSP430.Module", "ti.targets.msp430");
        vo.init2(po, "ti.targets.msp430.MSP430", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.targets.msp430.MSP430$$capsule", "ti.targets.msp430"));
        vo.bind("$package", om.findStrict("ti.targets.msp430", "ti.targets.msp430"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "ti.targets.msp430"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.targets.msp430")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.targets.msp430.MSP430$$instance$static$init", null) ? 1 : 0);
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

    void MSP430X$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.targets.msp430.MSP430X", "ti.targets.msp430");
        po = (Proto.Obj)om.findStrict("ti.targets.msp430.MSP430X.Module", "ti.targets.msp430");
        vo.init2(po, "ti.targets.msp430.MSP430X", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.targets.msp430.MSP430X$$capsule", "ti.targets.msp430"));
        vo.bind("$package", om.findStrict("ti.targets.msp430", "ti.targets.msp430"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "ti.targets.msp430"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.targets.msp430")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.targets.msp430.MSP430X$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("MSP430X", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430X");
    }

    void MSP430X_small$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.targets.msp430.MSP430X_small", "ti.targets.msp430");
        po = (Proto.Obj)om.findStrict("ti.targets.msp430.MSP430X_small.Module", "ti.targets.msp430");
        vo.init2(po, "ti.targets.msp430.MSP430X_small", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.targets.msp430.MSP430X_small$$capsule", "ti.targets.msp430"));
        vo.bind("$package", om.findStrict("ti.targets.msp430", "ti.targets.msp430"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "ti.targets.msp430"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.targets.msp430")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.targets.msp430.MSP430X_small$$instance$static$init", null) ? 1 : 0);
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

    void Generic$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.targets.msp430.Generic", "ti.targets.msp430");
        po = (Proto.Obj)om.findStrict("ti.targets.msp430.Generic.Module", "ti.targets.msp430");
        vo.init2(po, "ti.targets.msp430.Generic", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.targets.msp430.Generic$$capsule", "ti.targets.msp430"));
        vo.bind("$package", om.findStrict("ti.targets.msp430", "ti.targets.msp430"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "ti.targets.msp430"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.msp430"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.msp430"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.msp430"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.msp430"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.msp430"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.msp430"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.msp430"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.msp430"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "ti.targets.msp430"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.msp430"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.msp430"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.msp430"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.targets.msp430")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.targets.msp430.Generic$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("Generic", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Generic");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.targets.msp430.MSP430", "ti.targets.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.targets.msp430.MSP430X", "ti.targets.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.targets.msp430.MSP430X_small", "ti.targets.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.targets.msp430.Generic", "ti.targets.msp430"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.targets.msp430.MSP430")).bless();
        ((Value.Obj)om.getv("ti.targets.msp430.MSP430X")).bless();
        ((Value.Obj)om.getv("ti.targets.msp430.MSP430X_small")).bless();
        ((Value.Obj)om.getv("ti.targets.msp430.Generic")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.targets.msp430")).add(pkgV);
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
        MSP430$$OBJECTS();
        MSP430X$$OBJECTS();
        MSP430X_small$$OBJECTS();
        Generic$$OBJECTS();
        MSP430$$CONSTS();
        MSP430X$$CONSTS();
        MSP430X_small$$CONSTS();
        Generic$$CONSTS();
        MSP430$$CREATES();
        MSP430X$$CREATES();
        MSP430X_small$$CREATES();
        Generic$$CREATES();
        MSP430$$FUNCTIONS();
        MSP430X$$FUNCTIONS();
        MSP430X_small$$FUNCTIONS();
        Generic$$FUNCTIONS();
        MSP430$$SIZES();
        MSP430X$$SIZES();
        MSP430X_small$$SIZES();
        Generic$$SIZES();
        MSP430$$TYPES();
        MSP430X$$TYPES();
        MSP430X_small$$TYPES();
        Generic$$TYPES();
        if (isROV) {
            MSP430$$ROV();
            MSP430X$$ROV();
            MSP430X_small$$ROV();
            Generic$$ROV();
        }//isROV
        $$SINGLETONS();
        MSP430$$SINGLETONS();
        MSP430X$$SINGLETONS();
        MSP430X_small$$SINGLETONS();
        Generic$$SINGLETONS();
        $$INITIALIZATION();
    }
}
