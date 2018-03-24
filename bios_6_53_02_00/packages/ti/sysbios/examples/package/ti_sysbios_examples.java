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

public class ti_sysbios_examples
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
        Global.callFxn("loadPackage", xdcO, "xdc.tools.product");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.examples.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.examples", new Value.Obj("ti.sysbios.examples", pkgP));
    }

    void Examples$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.examples.Examples.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.examples.Examples", new Value.Obj("ti.sysbios.examples.Examples", po));
        pkgV.bind("Examples", vo);
        // decls 
        om.bind("ti.sysbios.examples.Examples.FileDesc", om.findStrict("xdc.tools.product.IProductTemplate.FileDesc", "ti.sysbios.examples"));
        om.bind("ti.sysbios.examples.Examples.Board", om.findStrict("xdc.tools.product.IProductTemplate.Board", "ti.sysbios.examples"));
        om.bind("ti.sysbios.examples.Examples.Filter", om.findStrict("xdc.tools.product.IProductTemplate.Filter", "ti.sysbios.examples"));
        om.bind("ti.sysbios.examples.Examples.TemplateInfo", om.findStrict("xdc.tools.product.IProductTemplate.TemplateInfo", "ti.sysbios.examples"));
        om.bind("ti.sysbios.examples.Examples.TemplateGroup", om.findStrict("xdc.tools.product.IProductTemplate.TemplateGroup", "ti.sysbios.examples"));
    }

    void Examples$$CONSTS()
    {
        // module Examples
    }

    void Examples$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Examples$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Examples$$SIZES()
    {
    }

    void Examples$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/examples/Examples.xs");
        om.bind("ti.sysbios.examples.Examples$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.examples.Examples.Module", "ti.sysbios.examples");
        po.init("ti.sysbios.examples.Examples.Module", om.findStrict("xdc.tools.product.IProductTemplate.Module", "ti.sysbios.examples"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.examples.Examples$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.examples.Examples$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.examples.Examples$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Examples$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.examples.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.examples"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.sysbios.examples", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.examples");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.examples.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.examples'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.examples$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.examples$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.examples$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Examples$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.examples.Examples", "ti.sysbios.examples");
        po = (Proto.Obj)om.findStrict("ti.sysbios.examples.Examples.Module", "ti.sysbios.examples");
        vo.init2(po, "ti.sysbios.examples.Examples", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.examples.Examples$$capsule", "ti.sysbios.examples"));
        vo.bind("$package", om.findStrict("ti.sysbios.examples", "ti.sysbios.examples"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("FileDesc", om.findStrict("xdc.tools.product.IProductTemplate.FileDesc", "ti.sysbios.examples"));
        tdefs.add(om.findStrict("xdc.tools.product.IProductTemplate.FileDesc", "ti.sysbios.examples"));
        vo.bind("Board", om.findStrict("xdc.tools.product.IProductTemplate.Board", "ti.sysbios.examples"));
        tdefs.add(om.findStrict("xdc.tools.product.IProductTemplate.Board", "ti.sysbios.examples"));
        vo.bind("Filter", om.findStrict("xdc.tools.product.IProductTemplate.Filter", "ti.sysbios.examples"));
        tdefs.add(om.findStrict("xdc.tools.product.IProductTemplate.Filter", "ti.sysbios.examples"));
        vo.bind("TemplateInfo", om.findStrict("xdc.tools.product.IProductTemplate.TemplateInfo", "ti.sysbios.examples"));
        tdefs.add(om.findStrict("xdc.tools.product.IProductTemplate.TemplateInfo", "ti.sysbios.examples"));
        vo.bind("TemplateGroup", om.findStrict("xdc.tools.product.IProductTemplate.TemplateGroup", "ti.sysbios.examples"));
        tdefs.add(om.findStrict("xdc.tools.product.IProductTemplate.TemplateGroup", "ti.sysbios.examples"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.tools.product");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.examples")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.sysbios.examples.Examples$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Examples", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Examples");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.examples.Examples", "ti.sysbios.examples"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.examples.Examples")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.examples")).add(pkgV);
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
        Examples$$OBJECTS();
        Examples$$CONSTS();
        Examples$$CREATES();
        Examples$$FUNCTIONS();
        Examples$$SIZES();
        Examples$$TYPES();
        if (isROV) {
            Examples$$ROV();
        }//isROV
        $$SINGLETONS();
        Examples$$SINGLETONS();
        $$INITIALIZATION();
    }
}
