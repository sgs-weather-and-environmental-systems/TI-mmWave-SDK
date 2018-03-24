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

public class ti_targets_elf_nda
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
        Global.callFxn("loadPackage", xdcO, "ti.targets.elf");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.targets.elf.nda.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.targets.elf.nda", new Value.Obj("ti.targets.elf.nda", pkgP));
    }

    void C71$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.targets.elf.nda.C71.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.targets.elf.nda.C71", new Value.Obj("ti.targets.elf.nda.C71", po));
        pkgV.bind("C71", vo);
        // decls 
        om.bind("ti.targets.elf.nda.C71.Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.elf.nda"));
        om.bind("ti.targets.elf.nda.C71.Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.elf.nda"));
    }

    void C71$$CONSTS()
    {
        // module C71
    }

    void C71$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void C71$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void C71$$SIZES()
    {
    }

    void C71$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.targets.elf.nda.C71.Module", "ti.targets.elf.nda");
        po.init("ti.targets.elf.nda.C71.Module", om.findStrict("ti.targets.elf.ITarget.Module", "ti.targets.elf.nda"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "C71", "rh");
        po.addFld("suffix", $$T_Str, "e71", "rh");
        po.addFld("isa", $$T_Str, "71", "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "ti.targets.elf.nda"), Global.newObject("endian", "little"), "rh");
        po.addFld("rts", $$T_Str, "ti.targets.nda.rts7000", "rh");
        po.addFld("ar", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.elf.nda"), Global.newObject("cmd", "ar7x", "opts", "rq"), "rh");
        po.addFld("cc", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.elf.nda"), Global.newObject("cmd", "cl7x -c", "opts", "-mv7100 --abi=eabi"), "rh");
        po.addFld("vers", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.elf.nda"), Global.newObject("cmd", "cl7x", "opts", "--compiler_revision"), "rh");
        po.addFld("asm", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.elf.nda"), Global.newObject("cmd", "cl7x -c", "opts", "-mv7100 --abi=eabi"), "rh");
        po.addFld("lnk", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.elf.nda"), Global.newObject("cmd", "cl7x", "opts", "-z"), "rh");
        po.addFld("asmOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.elf.nda"), Global.newObject("prefix", "-qq", "suffix", ""), "wh");
        po.addFld("ccOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.elf.nda"), Global.newObject("prefix", "-qq -pdsw225", "suffix", ""), "wh");
        po.addFld("ccConfigOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.elf.nda"), Global.newObject("prefix", "$(ccOpts.prefix) -mo", "suffix", "$(ccOpts.suffix)"), "wh");
        po.addFld("includeOpts", $$T_Str, "-I$(rootDir)/include", "wh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.elf.nda"), Global.newObject("t_IArg", Global.newObject("size", 4L, "align", 4L), "t_Char", Global.newObject("size", 1L, "align", 1L), "t_Double", Global.newObject("size", 8L, "align", 8L), "t_Float", Global.newObject("size", 4L, "align", 4L), "t_Fxn", Global.newObject("size", 8L, "align", 8L), "t_Int", Global.newObject("size", 4L, "align", 4L), "t_Int8", Global.newObject("size", 1L, "align", 1L), "t_Int16", Global.newObject("size", 2L, "align", 2L), "t_Int32", Global.newObject("size", 4L, "align", 4L), "t_Int40", Global.newObject("size", 8L, "align", 8L), "t_Int64", Global.newObject("size", 8L, "align", 8L), "t_Long", Global.newObject("size", 8L, "align", 8L), "t_LDouble", Global.newObject("size", 8L, "align", 8L), "t_LLong", Global.newObject("size", 8L, "align", 8L), "t_Ptr", Global.newObject("size", 8L, "align", 8L), "t_Short", Global.newObject("size", 2L, "align", 2L), "t_Size", Global.newObject("size", 8L, "align", 8L)), "rh");
        po.addFld("stdInclude", $$T_Str, "ti/targets/elf/nda/std.h", "wh");
        po.addFld("bitsPerChar", Proto.Elm.newCNum("(xdc_Int)"), 8L, "rh");
                po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "ti.targets.elf.nda"), $$UNDEF);
                po.addFxn("asmName", (Proto.Fxn)om.findStrict("ti.targets.ITarget$$asmName", "ti.targets.elf.nda"), $$UNDEF);
    }

    void C71$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.targets.elf.nda.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.targets.elf.nda"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/targets/elf/nda/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.targets.elf.nda"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.targets.elf.nda"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.targets.elf.nda"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.targets.elf.nda"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.targets.elf.nda"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.targets.elf.nda"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.targets.elf.nda", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.targets.elf.nda");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.targets.elf.nda.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.bld", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.targets.elf.nda'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.targets.elf.nda$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.targets.elf.nda$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.targets.elf.nda$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void C71$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.targets.elf.nda.C71", "ti.targets.elf.nda");
        po = (Proto.Obj)om.findStrict("ti.targets.elf.nda.C71.Module", "ti.targets.elf.nda");
        vo.init2(po, "ti.targets.elf.nda.C71", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.targets.elf.nda", "ti.targets.elf.nda"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "ti.targets.elf.nda"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "ti.targets.elf.nda"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "ti.targets.elf.nda"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "ti.targets.elf.nda"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "ti.targets.elf.nda"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "ti.targets.elf.nda"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "ti.targets.elf.nda"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "ti.targets.elf.nda"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "ti.targets.elf.nda"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "ti.targets.elf.nda"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "ti.targets.elf.nda"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "ti.targets.elf.nda"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "ti.targets.elf.nda"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.elf.nda"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "ti.targets.elf.nda"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.targets.elf");
        inherits.add("ti.targets");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.targets.elf.nda")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.targets.elf.nda.C71$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "xdc/bld/stddefs.xdt");
        atmap.seal("length");
        pkgV.bind("C71", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("C71");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.targets.elf.nda.C71", "ti.targets.elf.nda"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.targets.elf.nda.C71")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.targets.elf.nda")).add(pkgV);
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
        C71$$OBJECTS();
        C71$$CONSTS();
        C71$$CREATES();
        C71$$FUNCTIONS();
        C71$$SIZES();
        C71$$TYPES();
        if (isROV) {
            C71$$ROV();
        }//isROV
        $$SINGLETONS();
        C71$$SINGLETONS();
        $$INITIALIZATION();
    }
}
