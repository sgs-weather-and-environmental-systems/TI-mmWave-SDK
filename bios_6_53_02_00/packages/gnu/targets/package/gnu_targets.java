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

public class gnu_targets
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
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("gnu.targets.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("gnu.targets", new Value.Obj("gnu.targets", pkgP));
    }

    void ITarget$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("gnu.targets.ITarget.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("gnu.targets.ITarget", new Value.Obj("gnu.targets.ITarget", po));
        pkgV.bind("ITarget", vo);
        // decls 
        om.bind("gnu.targets.ITarget.Model", om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        om.bind("gnu.targets.ITarget.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        om.bind("gnu.targets.ITarget.Extension", om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        om.bind("gnu.targets.ITarget.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        om.bind("gnu.targets.ITarget.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        om.bind("gnu.targets.ITarget.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        om.bind("gnu.targets.ITarget.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        om.bind("gnu.targets.ITarget.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        om.bind("gnu.targets.ITarget.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        om.bind("gnu.targets.ITarget.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        om.bind("gnu.targets.ITarget.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        om.bind("gnu.targets.ITarget.Command", om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        om.bind("gnu.targets.ITarget.Options", om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
    }

    void Linux86$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("gnu.targets.Linux86.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("gnu.targets.Linux86", new Value.Obj("gnu.targets.Linux86", po));
        pkgV.bind("Linux86", vo);
        // decls 
        om.bind("gnu.targets.Linux86.Model", om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        om.bind("gnu.targets.Linux86.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        om.bind("gnu.targets.Linux86.Extension", om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        om.bind("gnu.targets.Linux86.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        om.bind("gnu.targets.Linux86.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        om.bind("gnu.targets.Linux86.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        om.bind("gnu.targets.Linux86.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        om.bind("gnu.targets.Linux86.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        om.bind("gnu.targets.Linux86.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        om.bind("gnu.targets.Linux86.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        om.bind("gnu.targets.Linux86.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        om.bind("gnu.targets.Linux86.Command", om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        om.bind("gnu.targets.Linux86.Options", om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
    }

    void Linux86_64$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("gnu.targets.Linux86_64.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("gnu.targets.Linux86_64", new Value.Obj("gnu.targets.Linux86_64", po));
        pkgV.bind("Linux86_64", vo);
        // decls 
        om.bind("gnu.targets.Linux86_64.Model", om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.Extension", om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.Command", om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        om.bind("gnu.targets.Linux86_64.Options", om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
    }

    void Mingw$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("gnu.targets.Mingw.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("gnu.targets.Mingw", new Value.Obj("gnu.targets.Mingw", po));
        pkgV.bind("Mingw", vo);
        // decls 
        om.bind("gnu.targets.Mingw.Model", om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        om.bind("gnu.targets.Mingw.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        om.bind("gnu.targets.Mingw.Extension", om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        om.bind("gnu.targets.Mingw.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        om.bind("gnu.targets.Mingw.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        om.bind("gnu.targets.Mingw.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        om.bind("gnu.targets.Mingw.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        om.bind("gnu.targets.Mingw.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        om.bind("gnu.targets.Mingw.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        om.bind("gnu.targets.Mingw.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        om.bind("gnu.targets.Mingw.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        om.bind("gnu.targets.Mingw.Command", om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        om.bind("gnu.targets.Mingw.Options", om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
    }

    void MacOS86_64$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("gnu.targets.MacOS86_64.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("gnu.targets.MacOS86_64", new Value.Obj("gnu.targets.MacOS86_64", po));
        pkgV.bind("MacOS86_64", vo);
        // decls 
        om.bind("gnu.targets.MacOS86_64.Model", om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.Extension", om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.Command", om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        om.bind("gnu.targets.MacOS86_64.Options", om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
    }

    void ITarget$$CONSTS()
    {
        // interface ITarget
    }

    void Linux86$$CONSTS()
    {
        // module Linux86
    }

    void Linux86_64$$CONSTS()
    {
        // module Linux86_64
    }

    void Mingw$$CONSTS()
    {
        // module Mingw
    }

    void MacOS86_64$$CONSTS()
    {
        // module MacOS86_64
    }

    void ITarget$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Linux86$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Linux86_64$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Mingw$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MacOS86_64$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ITarget$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ITarget.initVers
        fxn = (Proto.Fxn)om.bind("gnu.targets.ITarget$$initVers", new Proto.Fxn(om.findStrict("gnu.targets.ITarget.Module", "gnu.targets"), $$T_Str, 0, 0, false));
        // fxn ITarget.asmName
        fxn = (Proto.Fxn)om.bind("gnu.targets.ITarget$$asmName", new Proto.Fxn(om.findStrict("gnu.targets.ITarget.Module", "gnu.targets"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "CName", $$T_Str, $$UNDEF);
    }

    void Linux86$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Linux86_64$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Mingw$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MacOS86_64$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITarget$$SIZES()
    {
    }

    void Linux86$$SIZES()
    {
    }

    void Linux86_64$$SIZES()
    {
    }

    void Mingw$$SIZES()
    {
    }

    void MacOS86_64$$SIZES()
    {
    }

    void ITarget$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "gnu/targets/ITarget.xs");
        om.bind("gnu.targets.ITarget$$capsule", cap);
        po = (Proto.Obj)om.findStrict("gnu.targets.ITarget.Module", "gnu.targets");
        po.init("gnu.targets.ITarget.Module", om.findStrict("xdc.bld.ITarget3.Module", "gnu.targets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("stdInclude", $$T_Str, "gnu/targets/std.h", "rh");
        po.addFld("dllExt", $$T_Str, ".so", "wh");
        po.addFld("GCCVERS", $$T_Str, null, "wh");
        po.addFld("BINVERS", $$T_Str, null, "wh");
        po.addFld("version", $$T_Str, $$UNDEF, "wh");
        po.addFld("GCCTARG", $$T_Str, null, "wh");
        po.addFld("LONGNAME", $$T_Str, null, "wh");
        po.addFld("CYGWIN", $$T_Bool, false, "rh");
        po.addFld("noStdLinkScript", $$T_Bool, false, "wh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets")), Global.newArray(new Object[]{Global.newArray(new Object[]{"debug", Global.newObject("compileOpts", Global.newObject("copts", "-g", "defs", "-D_DEBUG_=1"), "linkOpts", "-g")}), Global.newArray(new Object[]{"release", Global.newObject("compileOpts", Global.newObject("copts", "-O2 -ffunction-sections -fdata-sections"), "linkOpts", "-Wl,--gc-sections")}), Global.newArray(new Object[]{"profile", Global.newObject("compileOpts", Global.newObject("copts", "-g -pg"), "linkOpts", "-pg")}), Global.newArray(new Object[]{"coverage", Global.newObject("compileOpts", Global.newObject("copts", "-fprofile-arcs -ftest-coverage"), "linkOpts", "-fprofile-arcs -ftest-coverage")})}), "wh");
        po.addFld("versionMap", new Proto.Map($$T_Str), Global.newArray(new Object[]{Global.newArray(new Object[]{"gcc3.2", "1,0,3.2,0"})}), "wh");
        po.addFld("remoteHost", $$T_Str, $$UNDEF, "wh");
        po.addFld("ar", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/ar", "opts", "cr"), "rh");
        po.addFld("lnk", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc", "opts", ""), "rh");
        po.addFld("lnkOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"), Global.newObject("prefix", "", "suffix", "-Wl,-Map=$(XDCCFGDIR)/$@.map -lstdc++ -L$(rootDir)/lib"), "wh");
        po.addFld("cc", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc -c -MD -MF $@.dep", "opts", ""), "rh");
        po.addFld("asm", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc -c -x assembler", "opts", ""), "rh");
        po.addFld("includeOpts", $$T_Str, "", "wh");
        po.addFld("binaryParser", $$T_Str, "ti.targets.omf.elf.Elf32", "wh");
        po.addFld("bspLib", $$T_Str, null, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("gnu.targets.ITarget$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("gnu.targets.ITarget$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("gnu.targets.ITarget$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "gnu.targets"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "gnu.targets"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "gnu.targets"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "gnu.targets"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "gnu.targets"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "gnu.targets"), fxn);
                fxn = Global.get(cap, "initVers");
                if (fxn != null) po.addFxn("initVers", (Proto.Fxn)om.findStrict("gnu.targets.ITarget$$initVers", "gnu.targets"), fxn);
                fxn = Global.get(cap, "asmName");
                if (fxn != null) po.addFxn("asmName", (Proto.Fxn)om.findStrict("gnu.targets.ITarget$$asmName", "gnu.targets"), fxn);
    }

    void Linux86$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "gnu/targets/Linux86.xs");
        om.bind("gnu.targets.Linux86$$capsule", cap);
        po = (Proto.Obj)om.findStrict("gnu.targets.Linux86.Module", "gnu.targets");
        po.init("gnu.targets.Linux86.Module", om.findStrict("gnu.targets.ITarget.Module", "gnu.targets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "Linux86", "rh");
        po.addFld("os", $$T_Str, "Linux", "rh");
        po.addFld("suffix", $$T_Str, "86U", "rh");
        po.addFld("isa", $$T_Str, "i686", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"), Global.newObject("endian", "little"), "rh");
        po.addFld("rts", $$T_Str, "gnu.targets.rts86U", "rh");
        po.addFld("platform", $$T_Str, "host.platforms.PC", "wh");
        po.addFld("cc", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc -c -MD -MF $@.dep", "opts", "-m32"), "rh");
        po.addFld("asm", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc -c -x assembler", "opts", "-m32"), "rh");
        po.addFld("lnk", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc", "opts", "-m32"), "rh");
        po.addFld("ccOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"), Global.newObject("prefix", "-fPIC -Wunused", "suffix", "-Dfar="), "wh");
        po.addFld("includeOpts", $$T_Str, "-isystem $(rootDir)/include", "wh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"), Global.newObject("t_IArg", Global.newObject("size", 4L, "align", 4L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 8L, "align", 4L), "t_Float", Global.newObject("size", 4L, "align", 4L), "t_Fxn", Global.newObject("size", 4L, "align", 4L), "t_Int", Global.newObject("size", 4L, "align", 4L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 4L), "t_Int64", Global.newObject("size", 8L, "align", 4L), "t_Long", Global.newObject("size", 4L, "align", 4L), "t_LDouble", Global.newObject("size", 12L, "align", 4L), "t_LLong", Global.newObject("size", 8L, "align", 4L), "t_Ptr", Global.newObject("size", 4L, "align", 4L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 4L, "align", 4L)), "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("gnu.targets.Linux86$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("gnu.targets.Linux86$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("gnu.targets.Linux86$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "gnu.targets"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "gnu.targets"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "gnu.targets"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "gnu.targets"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "gnu.targets"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "gnu.targets"), fxn);
                fxn = Global.get(cap, "initVers");
                if (fxn != null) po.addFxn("initVers", (Proto.Fxn)om.findStrict("gnu.targets.ITarget$$initVers", "gnu.targets"), fxn);
                fxn = Global.get(cap, "asmName");
                if (fxn != null) po.addFxn("asmName", (Proto.Fxn)om.findStrict("gnu.targets.ITarget$$asmName", "gnu.targets"), fxn);
    }

    void Linux86_64$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("gnu.targets.Linux86_64.Module", "gnu.targets");
        po.init("gnu.targets.Linux86_64.Module", om.findStrict("gnu.targets.ITarget.Module", "gnu.targets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "Linux86_64", "rh");
        po.addFld("os", $$T_Str, "Linux", "rh");
        po.addFld("suffix", $$T_Str, "86_64U", "rh");
        po.addFld("isa", $$T_Str, "i686", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"), Global.newObject("endian", "little"), "rh");
        po.addFld("rts", $$T_Str, "gnu.targets.rts86U", "rh");
        po.addFld("platform", $$T_Str, "host.platforms.PC", "wh");
        po.addFld("arrayTypeVaList", $$T_Bool, true, "rh");
        po.addFld("cc", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc -c -MD -MF $@.dep", "opts", "-m64"), "rh");
        po.addFld("asm", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc -c -x assembler", "opts", "-m64"), "rh");
        po.addFld("lnk", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc", "opts", "-m64"), "rh");
        po.addFld("ccOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"), Global.newObject("prefix", "-fPIC -Wunused", "suffix", "-Dfar="), "wh");
        po.addFld("lnkOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"), Global.newObject("prefix", "", "suffix", "-Wl,-Map=$(XDCCFGDIR)/$@.map -lstdc++ -L$(rootDir)/lib64"), "wh");
        po.addFld("includeOpts", $$T_Str, "-isystem $(rootDir)/include", "wh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"), Global.newObject("t_IArg", Global.newObject("size", 8L, "align", 8L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 8L, "align", 8L), "t_Float", Global.newObject("size", 4L, "align", 4L), "t_Fxn", Global.newObject("size", 8L, "align", 8L), "t_Int", Global.newObject("size", 4L, "align", 4L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 4L), "t_Int64", Global.newObject("size", 8L, "align", 8L), "t_Long", Global.newObject("size", 8L, "align", 8L), "t_LDouble", Global.newObject("size", 16L, "align", 16L), "t_LLong", Global.newObject("size", 8L, "align", 8L), "t_Ptr", Global.newObject("size", 8L, "align", 8L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 8L, "align", 8L)), "rh");
                po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "gnu.targets"), $$UNDEF);
                po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "gnu.targets"), $$UNDEF);
                po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "gnu.targets"), $$UNDEF);
                po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "gnu.targets"), $$UNDEF);
                po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "gnu.targets"), $$UNDEF);
                po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "gnu.targets"), $$UNDEF);
                po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "gnu.targets"), $$UNDEF);
                po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "gnu.targets"), $$UNDEF);
                po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "gnu.targets"), $$UNDEF);
                po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "gnu.targets"), $$UNDEF);
                po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "gnu.targets"), $$UNDEF);
                po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "gnu.targets"), $$UNDEF);
                po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "gnu.targets"), $$UNDEF);
                po.addFxn("initVers", (Proto.Fxn)om.findStrict("gnu.targets.ITarget$$initVers", "gnu.targets"), $$UNDEF);
                po.addFxn("asmName", (Proto.Fxn)om.findStrict("gnu.targets.ITarget$$asmName", "gnu.targets"), $$UNDEF);
    }

    void Mingw$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "gnu/targets/Mingw.xs");
        om.bind("gnu.targets.Mingw$$capsule", cap);
        po = (Proto.Obj)om.findStrict("gnu.targets.Mingw.Module", "gnu.targets");
        po.init("gnu.targets.Mingw.Module", om.findStrict("gnu.targets.ITarget.Module", "gnu.targets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "Mingw", "rh");
        po.addFld("os", $$T_Str, "Windows", "rh");
        po.addFld("suffix", $$T_Str, "86GW", "rh");
        po.addFld("isa", $$T_Str, "x86", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"), Global.newObject("endian", "little"), "rh");
        po.addFld("rts", $$T_Str, "gnu.targets.rts86GW", "rh");
        po.addFld("platform", $$T_Str, "host.platforms.PC", "wh");
        po.addFld("cmdPrefix", $$T_Str, "", "wh");
        po.addFld("ccOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"), Global.newObject("prefix", "-Wunused", "suffix", "-Dfar= "), "wh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"), Global.newObject("t_IArg", Global.newObject("size", 4L, "align", 4L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 8L, "align", 4L), "t_Float", Global.newObject("size", 4L, "align", 4L), "t_Fxn", Global.newObject("size", 4L, "align", 4L), "t_Int", Global.newObject("size", 4L, "align", 4L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 4L), "t_Int64", Global.newObject("size", 8L, "align", 4L), "t_Long", Global.newObject("size", 4L, "align", 4L), "t_LDouble", Global.newObject("size", 12L, "align", 4L), "t_LLong", Global.newObject("size", 8L, "align", 4L), "t_Ptr", Global.newObject("size", 4L, "align", 4L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 4L, "align", 4L)), "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("gnu.targets.Mingw$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("gnu.targets.Mingw$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("gnu.targets.Mingw$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "gnu.targets"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "gnu.targets"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "gnu.targets"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "gnu.targets"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "gnu.targets"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "gnu.targets"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "gnu.targets"), fxn);
                fxn = Global.get(cap, "initVers");
                if (fxn != null) po.addFxn("initVers", (Proto.Fxn)om.findStrict("gnu.targets.ITarget$$initVers", "gnu.targets"), fxn);
                fxn = Global.get(cap, "asmName");
                if (fxn != null) po.addFxn("asmName", (Proto.Fxn)om.findStrict("gnu.targets.ITarget$$asmName", "gnu.targets"), fxn);
    }

    void MacOS86_64$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("gnu.targets.MacOS86_64.Module", "gnu.targets");
        po.init("gnu.targets.MacOS86_64.Module", om.findStrict("gnu.targets.ITarget.Module", "gnu.targets"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "MacOS86_64", "rh");
        po.addFld("os", $$T_Str, "MacOS", "rh");
        po.addFld("suffix", $$T_Str, "86_64M", "rh");
        po.addFld("isa", $$T_Str, "i686", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"), Global.newObject("endian", "little"), "rh");
        po.addFld("rts", $$T_Str, "gnu.targets.rts86M", "rh");
        po.addFld("platform", $$T_Str, "host.platforms.macos", "wh");
        po.addFld("arrayTypeVaList", $$T_Bool, true, "rh");
        po.addFld("cc", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc -c -MD -MF $@.dep", "opts", "-m64"), "rh");
        po.addFld("asm", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc -c -x assembler", "opts", "-m64"), "rh");
        po.addFld("lnk", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"), Global.newObject("cmd", "$(rootDir)/bin/gcc", "opts", "-m64"), "rh");
        po.addFld("cmdPrefix", $$T_Str, "", "wh");
        po.addFld("ccOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"), Global.newObject("prefix", "-fPIC -Wunused", "suffix", "-Dfar="), "wh");
        po.addFld("lnkOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"), Global.newObject("prefix", "", "suffix", "-lstdc++ -L$(rootDir)/lib"), "wh");
        po.addFld("includeOpts", $$T_Str, "-isystem $(rootDir)/include", "wh");
        po.addFld("BINVERS", $$T_Str, "", "wh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets")), Global.newArray(new Object[]{Global.newArray(new Object[]{"debug", Global.newObject("compileOpts", Global.newObject("copts", "-g", "defs", "-D_DEBUG_=1"), "linkOpts", "")}), Global.newArray(new Object[]{"release", Global.newObject("compileOpts", Global.newObject("copts", "-O2 -ffunction-sections -fdata-sections"), "linkOpts", "")})}), "wh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"), Global.newObject("t_IArg", Global.newObject("size", 8L, "align", 8L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 8L, "align", 8L), "t_Float", Global.newObject("size", 4L, "align", 4L), "t_Fxn", Global.newObject("size", 8L, "align", 8L), "t_Int", Global.newObject("size", 4L, "align", 4L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 4L), "t_Int64", Global.newObject("size", 8L, "align", 8L), "t_Long", Global.newObject("size", 8L, "align", 8L), "t_LDouble", Global.newObject("size", 16L, "align", 16L), "t_LLong", Global.newObject("size", 8L, "align", 8L), "t_Ptr", Global.newObject("size", 8L, "align", 8L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 8L, "align", 8L)), "rh");
                po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "gnu.targets"), $$UNDEF);
                po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "gnu.targets"), $$UNDEF);
                po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "gnu.targets"), $$UNDEF);
                po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "gnu.targets"), $$UNDEF);
                po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "gnu.targets"), $$UNDEF);
                po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "gnu.targets"), $$UNDEF);
                po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "gnu.targets"), $$UNDEF);
                po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "gnu.targets"), $$UNDEF);
                po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "gnu.targets"), $$UNDEF);
                po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "gnu.targets"), $$UNDEF);
                po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "gnu.targets"), $$UNDEF);
                po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "gnu.targets"), $$UNDEF);
                po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "gnu.targets"), $$UNDEF);
                po.addFxn("initVers", (Proto.Fxn)om.findStrict("gnu.targets.ITarget$$initVers", "gnu.targets"), $$UNDEF);
                po.addFxn("asmName", (Proto.Fxn)om.findStrict("gnu.targets.ITarget$$asmName", "gnu.targets"), $$UNDEF);
    }

    void ITarget$$ROV()
    {
    }

    void Linux86$$ROV()
    {
    }

    void Linux86_64$$ROV()
    {
    }

    void Mingw$$ROV()
    {
    }

    void MacOS86_64$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("gnu.targets.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "gnu.targets"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "gnu/targets/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "gnu.targets"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "gnu.targets"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "gnu.targets"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "gnu.targets"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "gnu.targets"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "gnu.targets", Value.DEFAULT, false);
        pkgV.bind("$name", "gnu.targets");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "gnu.targets.");
        pkgV.bind("$vers", Global.newArray(1, 0, 1));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.bld", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['gnu.targets'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('gnu.targets$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['gnu.targets$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['gnu.targets$$stat$root'];\n");
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

        vo = (Value.Obj)om.findStrict("gnu.targets.ITarget", "gnu.targets");
        po = (Proto.Obj)om.findStrict("gnu.targets.ITarget.Module", "gnu.targets");
        vo.init2(po, "gnu.targets.ITarget", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("gnu.targets.ITarget$$capsule", "gnu.targets"));
        vo.bind("$package", om.findStrict("gnu.targets", "gnu.targets"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "gnu.targets"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
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

    void Linux86$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("gnu.targets.Linux86", "gnu.targets");
        po = (Proto.Obj)om.findStrict("gnu.targets.Linux86.Module", "gnu.targets");
        vo.init2(po, "gnu.targets.Linux86", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("gnu.targets.Linux86$$capsule", "gnu.targets"));
        vo.bind("$package", om.findStrict("gnu.targets", "gnu.targets"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "gnu.targets"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("gnu.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "gnu.targets")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("gnu.targets.Linux86$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("Linux86", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Linux86");
    }

    void Linux86_64$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("gnu.targets.Linux86_64", "gnu.targets");
        po = (Proto.Obj)om.findStrict("gnu.targets.Linux86_64.Module", "gnu.targets");
        vo.init2(po, "gnu.targets.Linux86_64", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("gnu.targets", "gnu.targets"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "gnu.targets"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("gnu.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "gnu.targets")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("gnu.targets.Linux86_64$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("Linux86_64", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Linux86_64");
    }

    void Mingw$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("gnu.targets.Mingw", "gnu.targets");
        po = (Proto.Obj)om.findStrict("gnu.targets.Mingw.Module", "gnu.targets");
        vo.init2(po, "gnu.targets.Mingw", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("gnu.targets.Mingw$$capsule", "gnu.targets"));
        vo.bind("$package", om.findStrict("gnu.targets", "gnu.targets"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "gnu.targets"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("gnu.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "gnu.targets")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("gnu.targets.Mingw$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("Mingw", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Mingw");
    }

    void MacOS86_64$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("gnu.targets.MacOS86_64", "gnu.targets");
        po = (Proto.Obj)om.findStrict("gnu.targets.MacOS86_64.Module", "gnu.targets");
        vo.init2(po, "gnu.targets.MacOS86_64", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("gnu.targets", "gnu.targets"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "gnu.targets"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "gnu.targets"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "gnu.targets"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "gnu.targets"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "gnu.targets"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "gnu.targets"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "gnu.targets"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "gnu.targets"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "gnu.targets"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "gnu.targets"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "gnu.targets"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "gnu.targets"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "gnu.targets"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "gnu.targets"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("gnu.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "gnu.targets")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("gnu.targets.MacOS86_64$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("MacOS86_64", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MacOS86_64");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("gnu.targets.Linux86", "gnu.targets"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("gnu.targets.Linux86_64", "gnu.targets"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("gnu.targets.Mingw", "gnu.targets"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("gnu.targets.MacOS86_64", "gnu.targets"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("gnu.targets.ITarget")).bless();
        ((Value.Obj)om.getv("gnu.targets.Linux86")).bless();
        ((Value.Obj)om.getv("gnu.targets.Linux86_64")).bless();
        ((Value.Obj)om.getv("gnu.targets.Mingw")).bless();
        ((Value.Obj)om.getv("gnu.targets.MacOS86_64")).bless();
        ((Value.Arr)om.findStrict("$packages", "gnu.targets")).add(pkgV);
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
        Linux86$$OBJECTS();
        Linux86_64$$OBJECTS();
        Mingw$$OBJECTS();
        MacOS86_64$$OBJECTS();
        ITarget$$CONSTS();
        Linux86$$CONSTS();
        Linux86_64$$CONSTS();
        Mingw$$CONSTS();
        MacOS86_64$$CONSTS();
        ITarget$$CREATES();
        Linux86$$CREATES();
        Linux86_64$$CREATES();
        Mingw$$CREATES();
        MacOS86_64$$CREATES();
        ITarget$$FUNCTIONS();
        Linux86$$FUNCTIONS();
        Linux86_64$$FUNCTIONS();
        Mingw$$FUNCTIONS();
        MacOS86_64$$FUNCTIONS();
        ITarget$$SIZES();
        Linux86$$SIZES();
        Linux86_64$$SIZES();
        Mingw$$SIZES();
        MacOS86_64$$SIZES();
        ITarget$$TYPES();
        Linux86$$TYPES();
        Linux86_64$$TYPES();
        Mingw$$TYPES();
        MacOS86_64$$TYPES();
        if (isROV) {
            ITarget$$ROV();
            Linux86$$ROV();
            Linux86_64$$ROV();
            Mingw$$ROV();
            MacOS86_64$$ROV();
        }//isROV
        $$SINGLETONS();
        ITarget$$SINGLETONS();
        Linux86$$SINGLETONS();
        Linux86_64$$SINGLETONS();
        Mingw$$SINGLETONS();
        MacOS86_64$$SINGLETONS();
        $$INITIALIZATION();
    }
}
