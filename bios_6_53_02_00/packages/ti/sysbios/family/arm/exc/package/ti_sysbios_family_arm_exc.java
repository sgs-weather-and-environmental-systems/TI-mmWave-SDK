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

public class ti_sysbios_family_arm_exc
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.interfaces");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
        Global.callFxn("loadPackage", xdcO, "ti.sysbios");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.exc.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.exc", new Value.Obj("ti.sysbios.family.arm.exc", pkgP));
    }

    void Exception$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.exc.Exception.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.exc.Exception", new Value.Obj("ti.sysbios.family.arm.exc.Exception", po));
        pkgV.bind("Exception", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.exc.Exception.Type", new Proto.Enm("ti.sysbios.family.arm.exc.Exception.Type"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.exc.Exception$$ExcContext", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.exc.Exception.ExcContext", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.exc.Exception$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.exc.Exception.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.exc.Exception$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.exc.Exception.Module_State", new Proto.Str(spo, false));
    }

    void Exception$$CONSTS()
    {
        // module Exception
        om.bind("ti.sysbios.family.arm.exc.Exception.Type_Supervisor", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.exc.Exception.Type", "ti.sysbios.family.arm.exc"), "ti.sysbios.family.arm.exc.Exception.Type_Supervisor", xdc.services.intern.xsr.Enum.intValue(0x13L)+0));
        om.bind("ti.sysbios.family.arm.exc.Exception.Type_PreAbort", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.exc.Exception.Type", "ti.sysbios.family.arm.exc"), "ti.sysbios.family.arm.exc.Exception.Type_PreAbort", xdc.services.intern.xsr.Enum.intValue(0x17L)+0));
        om.bind("ti.sysbios.family.arm.exc.Exception.Type_DataAbort", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.exc.Exception.Type", "ti.sysbios.family.arm.exc"), "ti.sysbios.family.arm.exc.Exception.Type_DataAbort", xdc.services.intern.xsr.Enum.intValue(0x18L)+0));
        om.bind("ti.sysbios.family.arm.exc.Exception.Type_UndefInst", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.exc.Exception.Type", "ti.sysbios.family.arm.exc"), "ti.sysbios.family.arm.exc.Exception.Type_UndefInst", xdc.services.intern.xsr.Enum.intValue(0x1bL)+0));
        om.bind("ti.sysbios.family.arm.exc.Exception.initCoreX", new Extern("ti_sysbios_family_arm_exc_Exception_initCoreX__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.exc.Exception.initCore0", new Extern("ti_sysbios_family_arm_exc_Exception_initCore0__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.exc.Exception.excHandlerAsm", new Extern("ti_sysbios_family_arm_exc_Exception_excHandlerAsm__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.exc.Exception.excHandlerDataAsm", new Extern("ti_sysbios_family_arm_exc_Exception_excHandlerDataAsm__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.exc.Exception.excHandler", new Extern("ti_sysbios_family_arm_exc_Exception_excHandler__I", "xdc_Void(*)(xdc_UInt*,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.exc.Exception.excDumpContext", new Extern("ti_sysbios_family_arm_exc_Exception_excDumpContext__I", "xdc_Void(*)(xdc_UInt)", true, false));
    }

    void Exception$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Exception$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Exception$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.exc.Exception.ExcContext", "ti.sysbios.family.arm.exc");
        sizes.clear();
        sizes.add(Global.newArray("threadType", "Nti.sysbios.BIOS.ThreadType;;;;;"));
        sizes.add(Global.newArray("threadHandle", "UPtr"));
        sizes.add(Global.newArray("threadStack", "UPtr"));
        sizes.add(Global.newArray("threadStackSize", "USize"));
        sizes.add(Global.newArray("type", "Nti.sysbios.family.arm.exc.Exception.Type;;0x13;0x17;0x18;0x1b"));
        sizes.add(Global.newArray("r0", "UPtr"));
        sizes.add(Global.newArray("r1", "UPtr"));
        sizes.add(Global.newArray("r2", "UPtr"));
        sizes.add(Global.newArray("r3", "UPtr"));
        sizes.add(Global.newArray("r4", "UPtr"));
        sizes.add(Global.newArray("r5", "UPtr"));
        sizes.add(Global.newArray("r6", "UPtr"));
        sizes.add(Global.newArray("r7", "UPtr"));
        sizes.add(Global.newArray("r8", "UPtr"));
        sizes.add(Global.newArray("r9", "UPtr"));
        sizes.add(Global.newArray("r10", "UPtr"));
        sizes.add(Global.newArray("r11", "UPtr"));
        sizes.add(Global.newArray("r12", "UPtr"));
        sizes.add(Global.newArray("sp", "UPtr"));
        sizes.add(Global.newArray("lr", "UPtr"));
        sizes.add(Global.newArray("pc", "UPtr"));
        sizes.add(Global.newArray("psr", "UPtr"));
        sizes.add(Global.newArray("dfsr", "UPtr"));
        sizes.add(Global.newArray("ifsr", "UPtr"));
        sizes.add(Global.newArray("dfar", "UPtr"));
        sizes.add(Global.newArray("ifar", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.exc.Exception.ExcContext']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.exc.Exception.ExcContext']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.exc.Exception.ExcContext'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.exc.Exception.Module_State", "ti.sysbios.family.arm.exc");
        sizes.clear();
        sizes.add(Global.newArray("excActive", "UPtr"));
        sizes.add(Global.newArray("excContext", "UPtr"));
        sizes.add(Global.newArray("excStackBuffers", "UPtr"));
        sizes.add(Global.newArray("excStack", "UPtr"));
        sizes.add(Global.newArray("excStackSize", "USize"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.exc.Exception.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.exc.Exception.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.exc.Exception.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Exception$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/exc/Exception.xs");
        om.bind("ti.sysbios.family.arm.exc.Exception$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.exc.Exception.Module", "ti.sysbios.family.arm.exc");
        po.init("ti.sysbios.family.arm.exc.Exception.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.exc"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.exc"), $$UNDEF, "wh");
            po.addFld("E_swi", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.exc"), Global.newObject("msg", "E_swi: pc = 0x%08x, lr = 0x%08x."), "w");
            po.addFld("E_prefetchAbort", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.exc"), Global.newObject("msg", "E_prefetchAbort: pc = 0x%08x, lr = 0x%08x."), "w");
            po.addFld("E_dataAbort", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.exc"), Global.newObject("msg", "E_dataAbort: pc = 0x%08x, lr = 0x%08x."), "w");
            po.addFld("E_undefinedInstruction", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.exc"), Global.newObject("msg", "E_undefinedInstruction: pc = 0x%08x, lr = 0x%08x."), "w");
            po.addFld("enableDecode", $$T_Bool, true, "w");
            po.addFld("excStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "wh");
            po.addFld("excStackSection", $$T_Str, null, "wh");
            po.addFld("excContextBuffer", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
            po.addFld("excContextBuffers", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "wh");
            po.addFld("excStackBuffer", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
            po.addFld("excStackBuffers", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "wh");
            po.addFld("excHookFunc", new Proto.Adr("xdc_Void(*)(ti_sysbios_family_arm_exc_Exception_ExcContext*)", "PFv"), null, "w");
            po.addFld("excHookFuncs", new Proto.Arr(new Proto.Adr("xdc_Void(*)(ti_sysbios_family_arm_exc_Exception_ExcContext*)", "PFv"), false), $$DEFAULT, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.exc.Exception$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.exc.Exception$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.exc.Exception$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.exc.Exception$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // typedef Exception.ExceptionHookFuncPtr
        om.bind("ti.sysbios.family.arm.exc.Exception.ExceptionHookFuncPtr", new Proto.Adr("xdc_Void(*)(ti_sysbios_family_arm_exc_Exception_ExcContext*)", "PFv"));
        // struct Exception.ExcContext
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.exc.Exception$$ExcContext", "ti.sysbios.family.arm.exc");
        po.init("ti.sysbios.family.arm.exc.Exception.ExcContext", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("threadType", (Proto)om.findStrict("ti.sysbios.BIOS.ThreadType", "ti.sysbios.family.arm.exc"), $$UNDEF, "w");
                po.addFld("threadHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("threadStack", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("threadStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.exc.Exception.Type", "ti.sysbios.family.arm.exc"), $$UNDEF, "w");
                po.addFld("r0", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r1", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r2", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r3", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r4", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r5", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r6", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r7", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r8", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r9", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r10", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r11", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("r12", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("sp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("lr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("pc", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("psr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("dfsr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("ifsr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("dfar", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("ifar", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Exception.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.exc.Exception$$ModuleView", "ti.sysbios.family.arm.exc");
        po.init("ti.sysbios.family.arm.exc.Exception.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("exception", $$T_Str, $$UNDEF, "w");
        // struct Exception.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.exc.Exception$$Module_State", "ti.sysbios.family.arm.exc");
        po.init("ti.sysbios.family.arm.exc.Exception.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("excActive", new Proto.Arr($$T_Bool, false), $$DEFAULT, "w");
                po.addFld("excContext", new Proto.Arr(new Proto.Adr("ti_sysbios_family_arm_exc_Exception_ExcContext*", "PS"), false), $$DEFAULT, "w");
                po.addFld("excStackBuffers", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "w");
                po.addFld("excStack", new Proto.Arr(new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), false), $$DEFAULT, "w");
                po.addFld("excStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
    }

    void Exception$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.exc.Exception", "ti.sysbios.family.arm.exc");
        vo.bind("ExcContext$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.exc.Exception.ExcContext", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.exc.Exception$$ExcContext", "ti.sysbios.family.arm.exc");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.exc.Exception.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.exc.Exception$$Module_State", "ti.sysbios.family.arm.exc");
        po.bind("excActive$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Bool", "isScalar", true));
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.exc.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.exc"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/exc/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.exc"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.exc"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.exc"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.exc"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.exc"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.exc"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.exc", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.exc");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.exc.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.exc'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.exc$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.exc$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.exc$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.exc.ae9',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.exc.aea8fnv',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.exc.aa15fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.exc.ae9', {target: 'ti.targets.arm.elf.Arm9', suffix: 'e9'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.exc.aea8fnv', {target: 'ti.targets.arm.elf.A8Fnv', suffix: 'ea8fnv'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.exc.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Exception$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.exc.Exception", "ti.sysbios.family.arm.exc");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.exc.Exception.Module", "ti.sysbios.family.arm.exc");
        vo.init2(po, "ti.sysbios.family.arm.exc.Exception", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.exc.Exception$$capsule", "ti.sysbios.family.arm.exc"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.exc", "ti.sysbios.family.arm.exc"));
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
        vo.bind("ExceptionHookFuncPtr", om.findStrict("ti.sysbios.family.arm.exc.Exception.ExceptionHookFuncPtr", "ti.sysbios.family.arm.exc"));
        vo.bind("Type", om.findStrict("ti.sysbios.family.arm.exc.Exception.Type", "ti.sysbios.family.arm.exc"));
        vo.bind("ExcContext", om.findStrict("ti.sysbios.family.arm.exc.Exception.ExcContext", "ti.sysbios.family.arm.exc"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.exc.Exception.ExcContext", "ti.sysbios.family.arm.exc"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.exc.Exception.ModuleView", "ti.sysbios.family.arm.exc"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.exc.Exception.ModuleView", "ti.sysbios.family.arm.exc"));
        mcfgs.add("E_swi");
        mcfgs.add("E_prefetchAbort");
        mcfgs.add("E_dataAbort");
        mcfgs.add("E_undefinedInstruction");
        mcfgs.add("enableDecode");
        mcfgs.add("excHookFunc");
        mcfgs.add("excHookFuncs");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.exc.Exception.Module_State", "ti.sysbios.family.arm.exc"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.exc.Exception.Module_State", "ti.sysbios.family.arm.exc"));
        vo.bind("Type_Supervisor", om.findStrict("ti.sysbios.family.arm.exc.Exception.Type_Supervisor", "ti.sysbios.family.arm.exc"));
        vo.bind("Type_PreAbort", om.findStrict("ti.sysbios.family.arm.exc.Exception.Type_PreAbort", "ti.sysbios.family.arm.exc"));
        vo.bind("Type_DataAbort", om.findStrict("ti.sysbios.family.arm.exc.Exception.Type_DataAbort", "ti.sysbios.family.arm.exc"));
        vo.bind("Type_UndefInst", om.findStrict("ti.sysbios.family.arm.exc.Exception.Type_UndefInst", "ti.sysbios.family.arm.exc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.exc")).add(vo);
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
        vo.bind("initCoreX", om.findStrict("ti.sysbios.family.arm.exc.Exception.initCoreX", "ti.sysbios.family.arm.exc"));
        vo.bind("initCore0", om.findStrict("ti.sysbios.family.arm.exc.Exception.initCore0", "ti.sysbios.family.arm.exc"));
        vo.bind("excHandlerAsm", om.findStrict("ti.sysbios.family.arm.exc.Exception.excHandlerAsm", "ti.sysbios.family.arm.exc"));
        vo.bind("excHandlerDataAsm", om.findStrict("ti.sysbios.family.arm.exc.Exception.excHandlerDataAsm", "ti.sysbios.family.arm.exc"));
        vo.bind("excHandler", om.findStrict("ti.sysbios.family.arm.exc.Exception.excHandler", "ti.sysbios.family.arm.exc"));
        vo.bind("excDumpContext", om.findStrict("ti.sysbios.family.arm.exc.Exception.excDumpContext", "ti.sysbios.family.arm.exc"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_exc_Exception_Module__startupDone__E", "ti_sysbios_family_arm_exc_Exception_initCoreX__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_swi", "E_prefetchAbort", "E_dataAbort", "E_undefinedInstruction"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Exception", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Exception");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.exc.Exception", "ti.sysbios.family.arm.exc"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.exc.Exception", "ti.sysbios.family.arm.exc");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.TREE"), "viewInitFxn", "viewInitBasic", "structName", "ExcContext")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.exc.Exception")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.exc")).add(pkgV);
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
        Exception$$OBJECTS();
        Exception$$CONSTS();
        Exception$$CREATES();
        Exception$$FUNCTIONS();
        Exception$$SIZES();
        Exception$$TYPES();
        if (isROV) {
            Exception$$ROV();
        }//isROV
        $$SINGLETONS();
        Exception$$SINGLETONS();
        $$INITIALIZATION();
    }
}
