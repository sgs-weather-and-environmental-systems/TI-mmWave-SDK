/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-A65
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class xdctools
{
    static final String VERS = "@(#) xdc-A65\n";

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
        pkgP = (Proto.Obj)om.bind("xdctools.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdctools", new Value.Obj("xdctools", pkgP));
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdctools.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdctools"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdctools", Value.DEFAULT, false);
        pkgV.bind("$name", "xdctools");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdctools.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("*xdc.tools.check", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.echo", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.echo.sg", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.configuro.sg", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.path", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.path.sg", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.product", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.product.plugingen", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.product.trexgen", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.repoman", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.repoman.sg", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.platformWizard", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.platformWizard.memoryMap", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.loader", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.sg.eclipse", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.sg.widgets", Global.newArray()));
        imports.add(Global.newArray("*xdc.tools.gbl", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdctools'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdctools$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdctools$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdctools$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Arr)om.findStrict("$packages", "xdctools")).add(pkgV);
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
        if (isROV) {
        }//isROV
        $$SINGLETONS();
        $$INITIALIZATION();
    }
}
