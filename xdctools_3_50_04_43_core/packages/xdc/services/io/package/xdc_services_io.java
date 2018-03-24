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

public class xdc_services_io
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
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.services.io.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.services.io", new Value.Obj("xdc.services.io", pkgP));
    }

    void File$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.services.io.File.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.services.io.File", new Value.Obj("xdc.services.io.File", po));
        pkgV.bind("File", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.services.io.File.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.services.io.File$$Object", new Proto.Obj());
        om.bind("xdc.services.io.File.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.services.io.File$$Params", new Proto.Obj());
        om.bind("xdc.services.io.File.Params", new Proto.Str(po, true));
    }

    void File$$CONSTS()
    {
        // module File
    }

    void File$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$create", new Proto.Fxn(om.findStrict("xdc.services.io.File.Module", "xdc.services.io"), om.findStrict("xdc.services.io.File.Instance", "xdc.services.io"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.services.io.File.Params", "xdc.services.io"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$services$io$File$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.services.io.File'];\n");
            sb.append("var __inst = xdc.om['xdc.services.io.File.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.services.io']);\n");
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
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$construct", new Proto.Fxn(om.findStrict("xdc.services.io.File.Module", "xdc.services.io"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.services.io.File$$Object", "xdc.services.io"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.services.io.File.Params", "xdc.services.io"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$services$io$File$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.services.io.File'];\n");
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

    void File$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn File.exists
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$exists", new Proto.Fxn(om.findStrict("xdc.services.io.File.Module", "xdc.services.io"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
        // fxn File.getDOSPath
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$getDOSPath", new Proto.Fxn(om.findStrict("xdc.services.io.File.Module", "xdc.services.io"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "longPath", $$T_Str, $$UNDEF);
        // fxn File.isDirectory
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$isDirectory", new Proto.Fxn(om.findStrict("xdc.services.io.File.Module", "xdc.services.io"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
        // fxn File.isFile
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$isFile", new Proto.Fxn(om.findStrict("xdc.services.io.File.Module", "xdc.services.io"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
        // fxn File.ls
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$ls", new Proto.Fxn(om.findStrict("xdc.services.io.File.Module", "xdc.services.io"), $$T_Obj, 2, 2, false));
                fxn.addArg(0, "root", $$T_Str, $$UNDEF);
                fxn.addArg(1, "regExp", $$T_Obj, $$UNDEF);
        // fxn File.getCanonicalPath
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$getCanonicalPath", new Proto.Fxn(om.findStrict("xdc.services.io.File.Module", "xdc.services.io"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
        // fxn File.open
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$open", new Proto.Fxn(om.findStrict("xdc.services.io.File.Module", "xdc.services.io"), (Proto)om.findStrict("xdc.services.io.File.Instance", "xdc.services.io"), 2, 2, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "mode", $$T_Str, $$UNDEF);
        // fxn File.getStream
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$getStream", new Proto.Fxn(om.findStrict("xdc.services.io.File.Instance", "xdc.services.io"), $$T_Obj, 0, 0, false));
        // fxn File.readLine
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$readLine", new Proto.Fxn(om.findStrict("xdc.services.io.File.Instance", "xdc.services.io"), $$T_Str, 0, 0, false));
        // fxn File.writeLine
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$writeLine", new Proto.Fxn(om.findStrict("xdc.services.io.File.Instance", "xdc.services.io"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "out", $$T_Str, $$UNDEF);
        // fxn File.printf
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$printf", new Proto.Fxn(om.findStrict("xdc.services.io.File.Instance", "xdc.services.io"), null, 1, 1, true));
                fxn.addArg(0, "fmt", $$T_Str, $$UNDEF);
        // fxn File.close
        fxn = (Proto.Fxn)om.bind("xdc.services.io.File$$close", new Proto.Fxn(om.findStrict("xdc.services.io.File.Instance", "xdc.services.io"), null, 0, 0, false));
    }

    void File$$SIZES()
    {
    }

    void File$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/services/io/File.xs");
        om.bind("xdc.services.io.File$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.services.io.File.Module", "xdc.services.io");
        po.init("xdc.services.io.File.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.services.io.File$$create", "xdc.services.io"), Global.get("xdc$services$io$File$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.services.io.File$$construct", "xdc.services.io"), Global.get("xdc$services$io$File$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.services.io.File$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.services.io.File$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.services.io.File$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.services.io.File$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("exists", (Proto.Fxn)om.findStrict("xdc.services.io.File$$exists", "xdc.services.io"), Global.get(cap, "exists"));
                po.addFxn("getDOSPath", (Proto.Fxn)om.findStrict("xdc.services.io.File$$getDOSPath", "xdc.services.io"), Global.get(cap, "getDOSPath"));
                po.addFxn("isDirectory", (Proto.Fxn)om.findStrict("xdc.services.io.File$$isDirectory", "xdc.services.io"), Global.get(cap, "isDirectory"));
                po.addFxn("isFile", (Proto.Fxn)om.findStrict("xdc.services.io.File$$isFile", "xdc.services.io"), Global.get(cap, "isFile"));
                po.addFxn("ls", (Proto.Fxn)om.findStrict("xdc.services.io.File$$ls", "xdc.services.io"), Global.get(cap, "ls"));
                po.addFxn("getCanonicalPath", (Proto.Fxn)om.findStrict("xdc.services.io.File$$getCanonicalPath", "xdc.services.io"), Global.get(cap, "getCanonicalPath"));
                po.addFxn("open", (Proto.Fxn)om.findStrict("xdc.services.io.File$$open", "xdc.services.io"), Global.get(cap, "open"));
        po = (Proto.Obj)om.findStrict("xdc.services.io.File.Instance", "xdc.services.io");
        po.init("xdc.services.io.File.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getStream", (Proto.Fxn)om.findStrict("xdc.services.io.File$$getStream", "xdc.services.io"), Global.get(cap, "getStream"));
                po.addFxn("readLine", (Proto.Fxn)om.findStrict("xdc.services.io.File$$readLine", "xdc.services.io"), Global.get(cap, "readLine"));
                po.addFxn("writeLine", (Proto.Fxn)om.findStrict("xdc.services.io.File$$writeLine", "xdc.services.io"), Global.get(cap, "writeLine"));
                po.addFxn("printf", (Proto.Fxn)om.findStrict("xdc.services.io.File$$printf", "xdc.services.io"), Global.get(cap, "printf"));
                po.addFxn("close", (Proto.Fxn)om.findStrict("xdc.services.io.File$$close", "xdc.services.io"), Global.get(cap, "close"));
        po = (Proto.Obj)om.findStrict("xdc.services.io.File$$Params", "xdc.services.io");
        po.init("xdc.services.io.File.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.services.io.File$$Object", "xdc.services.io");
        po.init("xdc.services.io.File.Object", om.findStrict("xdc.services.io.File.Instance", "xdc.services.io"));
                po.addFxn("getStream", (Proto.Fxn)om.findStrict("xdc.services.io.File$$getStream", "xdc.services.io"), Global.get(cap, "getStream"));
                po.addFxn("readLine", (Proto.Fxn)om.findStrict("xdc.services.io.File$$readLine", "xdc.services.io"), Global.get(cap, "readLine"));
                po.addFxn("writeLine", (Proto.Fxn)om.findStrict("xdc.services.io.File$$writeLine", "xdc.services.io"), Global.get(cap, "writeLine"));
                po.addFxn("printf", (Proto.Fxn)om.findStrict("xdc.services.io.File$$printf", "xdc.services.io"), Global.get(cap, "printf"));
                po.addFxn("close", (Proto.Fxn)om.findStrict("xdc.services.io.File$$close", "xdc.services.io"), Global.get(cap, "close"));
    }

    void File$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.services.io.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.services.io"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/services/io/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "xdc.services.io"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "xdc.services.io"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "xdc.services.io"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "xdc.services.io"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "xdc.services.io"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "xdc.services.io"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "xdc.services.io", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.services.io");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.services.io.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.services.io'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.services.io$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.services.io$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.services.io$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'release/Doss.lib',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['release/Doss.lib', {target: 'microsoft.targets.VC98', suffix: '86'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void File$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.services.io.File", "xdc.services.io");
        po = (Proto.Obj)om.findStrict("xdc.services.io.File.Module", "xdc.services.io");
        vo.init2(po, "xdc.services.io.File", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.services.io.File$$capsule", "xdc.services.io"));
        vo.bind("Instance", om.findStrict("xdc.services.io.File.Instance", "xdc.services.io"));
        vo.bind("Params", om.findStrict("xdc.services.io.File.Params", "xdc.services.io"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.services.io.File.Params", "xdc.services.io")).newInstance());
        vo.bind("$package", om.findStrict("xdc.services.io", "xdc.services.io"));
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
        ((Value.Arr)om.findStrict("$modules", "xdc.services.io")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.services.io.File$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.services.io.File.Object", "xdc.services.io"));
        pkgV.bind("File", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("File");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.services.io.File", "xdc.services.io"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.services.io.File")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.services.io")).add(pkgV);
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
        File$$OBJECTS();
        File$$CONSTS();
        File$$CREATES();
        File$$FUNCTIONS();
        File$$SIZES();
        File$$TYPES();
        if (isROV) {
            File$$ROV();
        }//isROV
        $$SINGLETONS();
        File$$SINGLETONS();
        $$INITIALIZATION();
    }
}
