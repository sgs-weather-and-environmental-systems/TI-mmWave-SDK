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

public class ti_sysbios_family_arm_ducati_dm8148
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
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.interfaces");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.dm8148.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.dm8148", new Value.Obj("ti.sysbios.family.arm.ducati.dm8148", pkgP));
    }

    void IntMux$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.dm8148.IntMux.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.dm8148.IntMux", new Value.Obj("ti.sysbios.family.arm.ducati.dm8148.IntMux", po));
        pkgV.bind("IntMux", vo);
        // decls 
    }

    void IntMux$$CONSTS()
    {
        // module IntMux
        om.bind("ti.sysbios.family.arm.ducati.dm8148.IntMux.setEvent", new Extern("ti_sysbios_family_arm_ducati_dm8148_IntMux_setEvent__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.dm8148.IntMux.initIntMux", new Extern("ti_sysbios_family_arm_ducati_dm8148_IntMux_initIntMux__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void IntMux$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IntMux$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn IntMux.setEventMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.ducati.dm8148.IntMux$$setEventMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.ducati.dm8148.IntMux.Module", "ti.sysbios.family.arm.ducati.dm8148"), null, 2, 2, false));
                fxn.addArg(0, "intMuxNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "eventNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
    }

    void IntMux$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void IntMux$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/dm8148/IntMux.xs");
        om.bind("ti.sysbios.family.arm.ducati.dm8148.IntMux$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.dm8148.IntMux.Module", "ti.sysbios.family.arm.ducati.dm8148");
        po.init("ti.sysbios.family.arm.ducati.dm8148.IntMux.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.ducati.dm8148"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("A_badIntNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.ducati.dm8148"), Global.newObject("msg", "A_badIntNum: intNum must be <= 56"), "w");
            po.addFld("A_badEventNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.ducati.dm8148"), Global.newObject("msg", "A_badIntNum: eventNum must be <= 47"), "w");
            po.addFld("intMuxBaseAddr", new Proto.Adr("xdc_Ptr", "Pv"), 0x48140F54L, "w");
            po.addFld("intMux", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false, xdc.services.intern.xsr.Enum.intValue(57L)), $$DEFAULT, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.dm8148.IntMux$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.dm8148.IntMux$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.dm8148.IntMux$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.dm8148.IntMux$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("setEventMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.ducati.dm8148.IntMux$$setEventMeta", "ti.sysbios.family.arm.ducati.dm8148"), Global.get(cap, "setEventMeta"));
    }

    void IntMux$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.dm8148.IntMux", "ti.sysbios.family.arm.ducati.dm8148");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.ducati.dm8148.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.ducati.dm8148"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/dm8148/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.ducati.dm8148"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.ducati.dm8148"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.ducati.dm8148"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.ducati.dm8148"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.ducati.dm8148"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.ducati.dm8148"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.ducati.dm8148", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.ducati.dm8148");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.ducati.dm8148.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.ducati.dm8148'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.ducati.dm8148$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.ducati.dm8148$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.ducati.dm8148$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.dm8148.aem3',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.dm8148.am3g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.dm8148.arm3',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.dm8148.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.dm8148.am3g', {target: 'gnu.targets.arm.M3', suffix: 'm3g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.dm8148.arm3', {target: 'iar.targets.arm.M3', suffix: 'rm3'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IntMux$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.dm8148.IntMux", "ti.sysbios.family.arm.ducati.dm8148");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.dm8148.IntMux.Module", "ti.sysbios.family.arm.ducati.dm8148");
        vo.init2(po, "ti.sysbios.family.arm.ducati.dm8148.IntMux", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.ducati.dm8148.IntMux$$capsule", "ti.sysbios.family.arm.ducati.dm8148"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.ducati.dm8148", "ti.sysbios.family.arm.ducati.dm8148"));
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
        mcfgs.add("A_badIntNum");
        mcfgs.add("A_badEventNum");
        mcfgs.add("intMuxBaseAddr");
        mcfgs.add("intMux");
        icfgs.add("intMux");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.ducati.dm8148")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("setEvent", om.findStrict("ti.sysbios.family.arm.ducati.dm8148.IntMux.setEvent", "ti.sysbios.family.arm.ducati.dm8148"));
        vo.bind("initIntMux", om.findStrict("ti.sysbios.family.arm.ducati.dm8148.IntMux.initIntMux", "ti.sysbios.family.arm.ducati.dm8148"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_ducati_dm8148_IntMux_Module__startupDone__E", "ti_sysbios_family_arm_ducati_dm8148_IntMux_setEvent__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_badIntNum", "A_badEventNum"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("IntMux", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IntMux");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.ducati.dm8148.IntMux", "ti.sysbios.family.arm.ducati.dm8148"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.ducati.dm8148.IntMux")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.ducati.dm8148")).add(pkgV);
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
        IntMux$$OBJECTS();
        IntMux$$CONSTS();
        IntMux$$CREATES();
        IntMux$$FUNCTIONS();
        IntMux$$SIZES();
        IntMux$$TYPES();
        if (isROV) {
            IntMux$$ROV();
        }//isROV
        $$SINGLETONS();
        IntMux$$SINGLETONS();
        $$INITIALIZATION();
    }
}
