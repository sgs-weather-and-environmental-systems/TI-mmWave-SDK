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

public class xdc_productview
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
        Global.callFxn("loadPackage", xdcO, "xdc.tools");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.productview.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.productview", new Value.Obj("xdc.productview", pkgP));
    }

    void ProductView$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.productview.ProductView.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.productview.ProductView", new Value.Obj("xdc.productview.ProductView", po));
        pkgV.bind("ProductView", vo);
        // decls 
        om.bind("xdc.productview.ProductView.ProductElemDesc", om.findStrict("xdc.tools.IProductView.ProductElemDesc", "xdc.productview"));
    }

    void ProductView$$CONSTS()
    {
        // module ProductView
    }

    void ProductView$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ProductView$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ProductView$$SIZES()
    {
    }

    void ProductView$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/productview/ProductView.xs");
        om.bind("xdc.productview.ProductView$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.productview.ProductView.Module", "xdc.productview");
        po.init("xdc.productview.ProductView.Module", om.findStrict("xdc.tools.IProductView.Module", "xdc.productview"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("xdc_cfg_Program", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Defaults", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_System", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Startup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Main", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Registry", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_SysCallback", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_SysMin", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_SysStd", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_TimestampStd", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_TimestampNull", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Log", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_LoggerBuf", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_LoggerCallback", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_LoggerSys", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Assert", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Diags", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Error", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Timestamp", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Text", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_Memory", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_HeapMin", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_HeapStd", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_GateNull", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdc_runtime_knl_SyncGeneric", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("systemGroup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("diagnosticsGroup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("memoryGroup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("synchronizationGroup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("syncsGroup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("gatesGroup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("heapsGroup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("loggersGroup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("systemProvidersGroup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("timestampProvidersGroup", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        po.addFld("xdctoolsProduct", (Proto)om.findStrict("xdc.productview.ProductView.ProductElemDesc", "xdc.productview"), $$DEFAULT, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.productview.ProductView$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.productview.ProductView$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.productview.ProductView$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getProductDescriptor");
                if (fxn != null) po.addFxn("getProductDescriptor", (Proto.Fxn)om.findStrict("xdc.tools.IProductView$$getProductDescriptor", "xdc.productview"), fxn);
    }

    void ProductView$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.productview.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.productview"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.productview", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.productview");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.productview.");
        pkgV.bind("$vers", Global.newArray());
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.productview'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.productview$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.productview$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.productview$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void ProductView$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.productview.ProductView", "xdc.productview");
        po = (Proto.Obj)om.findStrict("xdc.productview.ProductView.Module", "xdc.productview");
        vo.init2(po, "xdc.productview.ProductView", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.productview.ProductView$$capsule", "xdc.productview"));
        vo.bind("$package", om.findStrict("xdc.productview", "xdc.productview"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("ProductElemDesc", om.findStrict("xdc.tools.IProductView.ProductElemDesc", "xdc.productview"));
        tdefs.add(om.findStrict("xdc.tools.IProductView.ProductElemDesc", "xdc.productview"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.tools");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.productview")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.productview.ProductView$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("ProductView", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ProductView");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.productview.ProductView", "xdc.productview"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.productview.ProductView")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.productview")).add(pkgV);
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
        ProductView$$OBJECTS();
        ProductView$$CONSTS();
        ProductView$$CREATES();
        ProductView$$FUNCTIONS();
        ProductView$$SIZES();
        ProductView$$TYPES();
        if (isROV) {
            ProductView$$ROV();
        }//isROV
        $$SINGLETONS();
        ProductView$$SINGLETONS();
        $$INITIALIZATION();
    }
}
