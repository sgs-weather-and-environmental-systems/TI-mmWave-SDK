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

public class ti_targets_arp32_elf
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
        pkgP = (Proto.Obj)om.bind("ti.targets.arp32.elf.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.targets.arp32.elf", new Value.Obj("ti.targets.arp32.elf", pkgP));
    }

    void IARP32$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.targets.arp32.elf.IARP32.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.targets.arp32.elf.IARP32", new Value.Obj("ti.targets.arp32.elf.IARP32", po));
        pkgV.bind("IARP32", vo);
        // decls 
        om.bind("ti.targets.arp32.elf.IARP32.Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.IARP32.Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"));
    }

    void ARP32$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.targets.arp32.elf.ARP32.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.targets.arp32.elf.ARP32", new Value.Obj("ti.targets.arp32.elf.ARP32", po));
        pkgV.bind("ARP32", vo);
        // decls 
        om.bind("ti.targets.arp32.elf.ARP32.Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32.Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"));
    }

    void ARP32_far$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.targets.arp32.elf.ARP32_far.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.targets.arp32.elf.ARP32_far", new Value.Obj("ti.targets.arp32.elf.ARP32_far", po));
        pkgV.bind("ARP32_far", vo);
        // decls 
        om.bind("ti.targets.arp32.elf.ARP32_far.Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"));
        om.bind("ti.targets.arp32.elf.ARP32_far.Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"));
    }

    void IARP32$$CONSTS()
    {
        // interface IARP32
    }

    void ARP32$$CONSTS()
    {
        // module ARP32
    }

    void ARP32_far$$CONSTS()
    {
        // module ARP32_far
    }

    void IARP32$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ARP32$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ARP32_far$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IARP32$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ARP32$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ARP32_far$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IARP32$$SIZES()
    {
    }

    void ARP32$$SIZES()
    {
    }

    void ARP32_far$$SIZES()
    {
    }

    void IARP32$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/targets/arp32/elf/IARP32.xs");
        om.bind("ti.targets.arp32.elf.IARP32$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.targets.arp32.elf.IARP32.Module", "ti.targets.arp32.elf");
        po.init("ti.targets.arp32.elf.IARP32.Module", om.findStrict("ti.targets.ITarget.Module", "ti.targets.arp32.elf"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("isa", $$T_Str, "arp32", "rh");
        po.addFld("rts", $$T_Str, "ti.targets.arp32.rts", "rh");
        po.addFld("platform", $$T_Str, "ti.platforms.simARP32", "wh");
        po.addFld("ar", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"), Global.newObject("cmd", "ar-arp32", "opts", "rq"), "rh");
        po.addFld("lnk", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"), Global.newObject("cmd", "cl-arp32", "opts", "-z"), "rh");
        po.addFld("vers", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"), Global.newObject("cmd", "cl-arp32", "opts", "--compiler_revision"), "rh");
        po.addFld("asmOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"), Global.newObject("prefix", "-qq", "suffix", ""), "wh");
        po.addFld("ccOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"), Global.newObject("prefix", "-qq -pdsw225", "suffix", ""), "wh");
        po.addFld("ccConfigOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"), Global.newObject("prefix", "$(ccOpts.prefix)", "suffix", "$(ccOpts.suffix)"), "wh");
        po.addFld("includeOpts", $$T_Str, "-I$(rootDir)/include", "wh");
        po.addFld("sectMap", new Proto.Map($$T_Str), Global.newArray(new Object[]{Global.newArray(new Object[]{".text", "code"}), Global.newArray(new Object[]{".stack", "stack"}), Global.newArray(new Object[]{".bss", "data"}), Global.newArray(new Object[]{".cinit", "data"}), Global.newArray(new Object[]{".init_array", "data"}), Global.newArray(new Object[]{".const", "data"}), Global.newArray(new Object[]{".data", "data"}), Global.newArray(new Object[]{".switch", "data"}), Global.newArray(new Object[]{".sysmem", "data"}), Global.newArray(new Object[]{".far", "data"}), Global.newArray(new Object[]{".args", "data"}), Global.newArray(new Object[]{".cio", "data"}), Global.newArray(new Object[]{".fardata", "data"}), Global.newArray(new Object[]{".rodata", "data"})}), "rh");
        po.addFld("splitMap", new Proto.Map($$T_Bool), Global.newArray(new Object[]{Global.newArray(new Object[]{".text", true}), Global.newArray(new Object[]{".switch", true}), Global.newArray(new Object[]{".cio", true})}), "rh");
        po.addFld("bitsPerChar", Proto.Elm.newCNum("(xdc_Int)"), 8L, "rh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.arp32.elf")), Global.newArray(new Object[]{Global.newArray(new Object[]{"debug", Global.newObject("compileOpts", Global.newObject("copts", "--symdebug:dwarf", "defs", "-D_DEBUG_=1"))}), Global.newArray(new Object[]{"release", Global.newObject("compileOpts", Global.newObject("copts", "-O2"))}), Global.newArray(new Object[]{"profile", Global.newObject("compileOpts", Global.newObject("copts", "--symdebug:dwarf"))}), Global.newArray(new Object[]{"coverage", Global.newObject("compileOpts", Global.newObject("copts", "--symdebug:dwarf"))})}), "wh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.arp32.elf"), Global.newObject("t_IArg", Global.newObject("size", 4L, "align", 4L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 8L, "align", 4L), "t_Float", Global.newObject("size", 4L, "align", 4L), "t_Fxn", Global.newObject("size", 4L, "align", 4L), "t_Int", Global.newObject("size", 4L, "align", 4L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 4L), "t_Int64", Global.newObject("size", 8L, "align", 4L), "t_Long", Global.newObject("size", 4L, "align", 4L), "t_LDouble", Global.newObject("size", 8L, "align", 4L), "t_LLong", Global.newObject("size", 8L, "align", 4L), "t_Ptr", Global.newObject("size", 4L, "align", 4L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 4L, "align", 4L)), "rh");
        po.addFld("stdInclude", $$T_Str, "ti/targets/arp32/elf/std.h", "wh");
        po.addFld("binaryParser", $$T_Str, "ti.targets.omf.elf.Elf32", "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.targets.arp32.elf.IARP32$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.targets.arp32.elf.IARP32$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.targets.arp32.elf.IARP32$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "asmName");
                if (fxn != null) po.addFxn("asmName", (Proto.Fxn)om.findStrict("ti.targets.ITarget$$asmName", "ti.targets.arp32.elf"), fxn);
    }

    void ARP32$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.targets.arp32.elf.ARP32.Module", "ti.targets.arp32.elf");
        po.init("ti.targets.arp32.elf.ARP32.Module", om.findStrict("ti.targets.arp32.elf.IARP32.Module", "ti.targets.arp32.elf"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "ARP32", "rh");
        po.addFld("suffix", $$T_Str, "earp32", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"), Global.newObject("endian", "little", "dataModel", "far_aggregates", "shortEnums", true), "rh");
        po.addFld("cc", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"), Global.newObject("cmd", "cl-arp32 -c --gen_func_subsections", "opts", "--mem_model:data=far_aggregates --silicon_version=v210"), "rh");
        po.addFld("asm", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"), Global.newObject("cmd", "cl-arp32 -c --gen_func_subsections", "opts", "--mem_model:data=far_aggregates --silicon_version=v210"), "rh");
                po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("asmName", (Proto.Fxn)om.findStrict("ti.targets.ITarget$$asmName", "ti.targets.arp32.elf"), $$UNDEF);
    }

    void ARP32_far$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.targets.arp32.elf.ARP32_far.Module", "ti.targets.arp32.elf");
        po.init("ti.targets.arp32.elf.ARP32_far.Module", om.findStrict("ti.targets.arp32.elf.IARP32.Module", "ti.targets.arp32.elf"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "ARP32_far", "rh");
        po.addFld("suffix", $$T_Str, "earp32F", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"), Global.newObject("endian", "little", "dataModel", "far", "shortEnums", true), "rh");
        po.addFld("cc", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"), Global.newObject("cmd", "cl-arp32 -c --gen_func_subsections", "opts", "--mem_model:data=far --silicon_version=v210"), "rh");
        po.addFld("asm", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"), Global.newObject("cmd", "cl-arp32 -c --gen_func_subsections", "opts", "--mem_model:data=far --silicon_version=v210"), "rh");
                po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "ti.targets.arp32.elf"), $$UNDEF);
                po.addFxn("asmName", (Proto.Fxn)om.findStrict("ti.targets.ITarget$$asmName", "ti.targets.arp32.elf"), $$UNDEF);
    }

    void IARP32$$ROV()
    {
    }

    void ARP32$$ROV()
    {
    }

    void ARP32_far$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.targets.arp32.elf.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.targets.arp32.elf"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/targets/arp32/elf/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.targets.arp32.elf"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.targets.arp32.elf"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.targets.arp32.elf", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.targets.arp32.elf");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.targets.arp32.elf.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.bld", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.targets.arp32.elf'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.targets.arp32.elf$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.targets.arp32.elf$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.targets.arp32.elf$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IARP32$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.targets.arp32.elf.IARP32", "ti.targets.arp32.elf");
        po = (Proto.Obj)om.findStrict("ti.targets.arp32.elf.IARP32.Module", "ti.targets.arp32.elf");
        vo.init2(po, "ti.targets.arp32.elf.IARP32", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("ti.targets.arp32.elf.IARP32$$capsule", "ti.targets.arp32.elf"));
        vo.bind("$package", om.findStrict("ti.targets.arp32.elf", "ti.targets.arp32.elf"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.arp32.elf"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.arp32.elf"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.arp32.elf"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.arp32.elf"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.arp32.elf"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.arp32.elf"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.arp32.elf"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.arp32.elf"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "ti.targets.arp32.elf"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.arp32.elf"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.arp32.elf"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IARP32", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IARP32");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ARP32$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.targets.arp32.elf.ARP32", "ti.targets.arp32.elf");
        po = (Proto.Obj)om.findStrict("ti.targets.arp32.elf.ARP32.Module", "ti.targets.arp32.elf");
        vo.init2(po, "ti.targets.arp32.elf.ARP32", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.targets.arp32.elf", "ti.targets.arp32.elf"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.arp32.elf"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.arp32.elf"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.arp32.elf"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.arp32.elf"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.arp32.elf"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.arp32.elf"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.arp32.elf"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.arp32.elf"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "ti.targets.arp32.elf"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.arp32.elf"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.arp32.elf"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.targets.arp32.elf");
        inherits.add("ti.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.targets.arp32.elf")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.targets.arp32.elf.ARP32$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("ARP32", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ARP32");
    }

    void ARP32_far$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.targets.arp32.elf.ARP32_far", "ti.targets.arp32.elf");
        po = (Proto.Obj)om.findStrict("ti.targets.arp32.elf.ARP32_far.Module", "ti.targets.arp32.elf");
        vo.init2(po, "ti.targets.arp32.elf.ARP32_far", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.targets.arp32.elf", "ti.targets.arp32.elf"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "ti.targets.arp32.elf"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.arp32.elf"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.arp32.elf"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.arp32.elf"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.arp32.elf"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.arp32.elf"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.arp32.elf"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.arp32.elf"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.arp32.elf"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "ti.targets.arp32.elf"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.arp32.elf"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.arp32.elf"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.arp32.elf"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.arp32.elf"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.targets.arp32.elf");
        inherits.add("ti.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.targets.arp32.elf")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.targets.arp32.elf.ARP32_far$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("ARP32_far", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ARP32_far");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.targets.arp32.elf.ARP32", "ti.targets.arp32.elf"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.targets.arp32.elf.ARP32_far", "ti.targets.arp32.elf"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.targets.arp32.elf.IARP32")).bless();
        ((Value.Obj)om.getv("ti.targets.arp32.elf.ARP32")).bless();
        ((Value.Obj)om.getv("ti.targets.arp32.elf.ARP32_far")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.targets.arp32.elf")).add(pkgV);
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
        IARP32$$OBJECTS();
        ARP32$$OBJECTS();
        ARP32_far$$OBJECTS();
        IARP32$$CONSTS();
        ARP32$$CONSTS();
        ARP32_far$$CONSTS();
        IARP32$$CREATES();
        ARP32$$CREATES();
        ARP32_far$$CREATES();
        IARP32$$FUNCTIONS();
        ARP32$$FUNCTIONS();
        ARP32_far$$FUNCTIONS();
        IARP32$$SIZES();
        ARP32$$SIZES();
        ARP32_far$$SIZES();
        IARP32$$TYPES();
        ARP32$$TYPES();
        ARP32_far$$TYPES();
        if (isROV) {
            IARP32$$ROV();
            ARP32$$ROV();
            ARP32_far$$ROV();
        }//isROV
        $$SINGLETONS();
        IARP32$$SINGLETONS();
        ARP32$$SINGLETONS();
        ARP32_far$$SINGLETONS();
        $$INITIALIZATION();
    }
}
