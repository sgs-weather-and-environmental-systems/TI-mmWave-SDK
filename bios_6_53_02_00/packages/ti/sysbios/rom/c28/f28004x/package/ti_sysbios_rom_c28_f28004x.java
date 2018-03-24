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

public class ti_sysbios_rom_c28_f28004x
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.rom");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.interfaces");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.rom.c28.f28004x.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.rom.c28.f28004x", new Value.Obj("ti.sysbios.rom.c28.f28004x", pkgP));
    }

    void F28004x$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.rom.c28.f28004x.F28004x.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.rom.c28.f28004x.F28004x", new Value.Obj("ti.sysbios.rom.c28.f28004x.F28004x", po));
        pkgV.bind("F28004x", vo);
        // decls 
    }

    void F28004x$$CONSTS()
    {
        // module F28004x
        om.bind("ti.sysbios.rom.c28.f28004x.F28004x.getRevision", new Extern("ti_sysbios_rom_c28_f28004x_F28004x_getRevision__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.rom.c28.f28004x.F28004x.checkRevision", new Extern("ti_sysbios_rom_c28_f28004x_F28004x_checkRevision__E", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void F28004x$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void F28004x$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void F28004x$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void F28004x$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/rom/c28/f28004x/F28004x.xs");
        om.bind("ti.sysbios.rom.c28.f28004x.F28004x$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.rom.c28.f28004x.F28004x.Module", "ti.sysbios.rom.c28.f28004x");
        po.init("ti.sysbios.rom.c28.f28004x.F28004x.Module", om.findStrict("ti.sysbios.interfaces.IRomDevice.Module", "ti.sysbios.rom.c28.f28004x"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("libDir", $$T_Str, null, "wh");
            po.addFld("templateName", $$T_Str, "F28004x_rom_makefile.xdt", "wh");
            po.addFld("REVISION", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("REVISION_WORD_ADDRESS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "wh");
            po.addFld("useFlash", $$T_Bool, false, "wh");
            po.addFld("useGolden", $$T_Bool, true, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.rom.c28.f28004x.F28004x$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.rom.c28.f28004x.F28004x$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.rom.c28.f28004x.F28004x$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.rom.c28.f28004x.F28004x$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "loadAppConfig");
                if (fxn != null) po.addFxn("loadAppConfig", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IRomDevice$$loadAppConfig", "ti.sysbios.rom.c28.f28004x"), fxn);
    }

    void F28004x$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.rom.c28.f28004x.F28004x", "ti.sysbios.rom.c28.f28004x");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.rom.c28.f28004x.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.rom.c28.f28004x"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/rom/c28/f28004x/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.rom.c28.f28004x"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.rom.c28.f28004x"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.rom.c28.f28004x"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.rom.c28.f28004x"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.rom.c28.f28004x"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.rom.c28.f28004x"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.rom.c28.f28004x", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.rom.c28.f28004x");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.rom.c28.f28004x.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.rom", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.rom.c28.f28004x'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.rom.c28.f28004x$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.rom.c28.f28004x$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.rom.c28.f28004x$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void F28004x$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.rom.c28.f28004x.F28004x", "ti.sysbios.rom.c28.f28004x");
        po = (Proto.Obj)om.findStrict("ti.sysbios.rom.c28.f28004x.F28004x.Module", "ti.sysbios.rom.c28.f28004x");
        vo.init2(po, "ti.sysbios.rom.c28.f28004x.F28004x", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.rom.c28.f28004x.F28004x$$capsule", "ti.sysbios.rom.c28.f28004x"));
        vo.bind("$package", om.findStrict("ti.sysbios.rom.c28.f28004x", "ti.sysbios.rom.c28.f28004x"));
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
        mcfgs.add("REVISION");
        icfgs.add("useFlash");
        icfgs.add("useGolden");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.rom.c28.f28004x")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("getRevision", om.findStrict("ti.sysbios.rom.c28.f28004x.F28004x.getRevision", "ti.sysbios.rom.c28.f28004x"));
        vo.bind("checkRevision", om.findStrict("ti.sysbios.rom.c28.f28004x.F28004x.checkRevision", "ti.sysbios.rom.c28.f28004x"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_rom_c28_f28004x_F28004x_Module__startupDone__E", "ti_sysbios_rom_c28_f28004x_F28004x_getRevision__E", "ti_sysbios_rom_c28_f28004x_F28004x_checkRevision__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./F28004x.xdt");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./F28004x.xdt");
        pkgV.bind("F28004x", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("F28004x");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.rom.c28.f28004x.F28004x", "ti.sysbios.rom.c28.f28004x"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.rom.c28.f28004x.F28004x")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.rom.c28.f28004x")).add(pkgV);
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
        F28004x$$OBJECTS();
        F28004x$$CONSTS();
        F28004x$$CREATES();
        F28004x$$FUNCTIONS();
        F28004x$$SIZES();
        F28004x$$TYPES();
        if (isROV) {
            F28004x$$ROV();
        }//isROV
        $$SINGLETONS();
        F28004x$$SINGLETONS();
        $$INITIALIZATION();
    }
}
