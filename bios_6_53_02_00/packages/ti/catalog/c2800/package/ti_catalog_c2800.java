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

public class ti_catalog_c2800
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
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "ti.catalog");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.c2800.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.c2800", new Value.Obj("ti.catalog.c2800", pkgP));
    }

    void ITMS320C28xx$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28xx.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320C28xx", new Value.Obj("ti.catalog.c2800.ITMS320C28xx", po));
        pkgV.bind("ITMS320C28xx", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320C28xx.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28xx$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28xx.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28xx$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28xx.Params", new Proto.Str(po, true));
    }

    void TMS320C2801$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2801.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C2801", new Value.Obj("ti.catalog.c2800.TMS320C2801", po));
        pkgV.bind("TMS320C2801", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C2801.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2801$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2801.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2801$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2801.Params", new Proto.Str(po, true));
    }

    void TMS320C2802$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2802.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C2802", new Value.Obj("ti.catalog.c2800.TMS320C2802", po));
        pkgV.bind("TMS320C2802", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C2802.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2802$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2802.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2802$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2802.Params", new Proto.Str(po, true));
    }

    void TMS320C2806$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2806.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C2806", new Value.Obj("ti.catalog.c2800.TMS320C2806", po));
        pkgV.bind("TMS320C2806", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C2806.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2806$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2806.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2806$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2806.Params", new Proto.Str(po, true));
    }

    void TMS320C2808$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2808.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C2808", new Value.Obj("ti.catalog.c2800.TMS320C2808", po));
        pkgV.bind("TMS320C2808", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C2808.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2808$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2808.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2808$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2808.Params", new Proto.Str(po, true));
    }

    void TMS320C2809$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2809.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C2809", new Value.Obj("ti.catalog.c2800.TMS320C2809", po));
        pkgV.bind("TMS320C2809", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C2809.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2809$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2809.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2809$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2809.Params", new Proto.Str(po, true));
    }

    void TMS320C2810$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2810.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C2810", new Value.Obj("ti.catalog.c2800.TMS320C2810", po));
        pkgV.bind("TMS320C2810", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C2810.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2810$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2810.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2810$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2810.Params", new Proto.Str(po, true));
    }

    void TMS320C2811$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2811.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C2811", new Value.Obj("ti.catalog.c2800.TMS320C2811", po));
        pkgV.bind("TMS320C2811", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C2811.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2811$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2811.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2811$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2811.Params", new Proto.Str(po, true));
    }

    void TMS320C2812$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2812.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C2812", new Value.Obj("ti.catalog.c2800.TMS320C2812", po));
        pkgV.bind("TMS320C2812", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C2812.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2812$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2812.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C2812$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C2812.Params", new Proto.Str(po, true));
    }

    void TMS320C28015$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28015.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28015", new Value.Obj("ti.catalog.c2800.TMS320C28015", po));
        pkgV.bind("TMS320C28015", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28015.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28015$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28015.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28015$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28015.Params", new Proto.Str(po, true));
    }

    void TMS320C28016$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28016.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28016", new Value.Obj("ti.catalog.c2800.TMS320C28016", po));
        pkgV.bind("TMS320C28016", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28016.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28016$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28016.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28016$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28016.Params", new Proto.Str(po, true));
    }

    void TMS320C28232$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28232.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28232", new Value.Obj("ti.catalog.c2800.TMS320C28232", po));
        pkgV.bind("TMS320C28232", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28232.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28232$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28232.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28232$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28232.Params", new Proto.Str(po, true));
    }

    void TMS320C28234$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28234.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28234", new Value.Obj("ti.catalog.c2800.TMS320C28234", po));
        pkgV.bind("TMS320C28234", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28234.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28234$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28234.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28234$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28234.Params", new Proto.Str(po, true));
    }

    void TMS320C28235$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28235.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28235", new Value.Obj("ti.catalog.c2800.TMS320C28235", po));
        pkgV.bind("TMS320C28235", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28235.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28235$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28235.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28235$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28235.Params", new Proto.Str(po, true));
    }

    void ITMS320C283xx$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C283xx.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320C283xx", new Value.Obj("ti.catalog.c2800.ITMS320C283xx", po));
        pkgV.bind("ITMS320C283xx", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320C283xx.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C283xx$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C283xx.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C283xx$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C283xx.Params", new Proto.Str(po, true));
    }

    void TMS320C28332$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28332.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28332", new Value.Obj("ti.catalog.c2800.TMS320C28332", po));
        pkgV.bind("TMS320C28332", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28332.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28332$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28332.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28332$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28332.Params", new Proto.Str(po, true));
    }

    void TMS320C28334$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28334.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28334", new Value.Obj("ti.catalog.c2800.TMS320C28334", po));
        pkgV.bind("TMS320C28334", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28334.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28334$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28334.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28334$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28334.Params", new Proto.Str(po, true));
    }

    void TMS320C28335$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28335.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28335", new Value.Obj("ti.catalog.c2800.TMS320C28335", po));
        pkgV.bind("TMS320C28335", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28335.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28335$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28335.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28335$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28335.Params", new Proto.Str(po, true));
    }

    void TMS320C28020$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28020.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28020", new Value.Obj("ti.catalog.c2800.TMS320C28020", po));
        pkgV.bind("TMS320C28020", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28020.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28020$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28020.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28020$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28020.Params", new Proto.Str(po, true));
    }

    void TMS320C28021$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28021.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28021", new Value.Obj("ti.catalog.c2800.TMS320C28021", po));
        pkgV.bind("TMS320C28021", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28021.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28021$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28021.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28021$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28021.Params", new Proto.Str(po, true));
    }

    void ITMS320C28026$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28026.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320C28026", new Value.Obj("ti.catalog.c2800.ITMS320C28026", po));
        pkgV.bind("ITMS320C28026", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320C28026.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28026$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28026.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28026$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28026.Params", new Proto.Str(po, true));
    }

    void TMS320C28022$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28022.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28022", new Value.Obj("ti.catalog.c2800.TMS320C28022", po));
        pkgV.bind("TMS320C28022", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28022.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28022$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28022.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28022$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28022.Params", new Proto.Str(po, true));
    }

    void TMS320C28026$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28026.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28026", new Value.Obj("ti.catalog.c2800.TMS320C28026", po));
        pkgV.bind("TMS320C28026", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28026.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28026$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28026.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28026$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28026.Params", new Proto.Str(po, true));
    }

    void ITMS320C28027$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28027.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320C28027", new Value.Obj("ti.catalog.c2800.ITMS320C28027", po));
        pkgV.bind("ITMS320C28027", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320C28027.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28027$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28027.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28027$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28027.Params", new Proto.Str(po, true));
    }

    void TMS320C28023$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28023.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28023", new Value.Obj("ti.catalog.c2800.TMS320C28023", po));
        pkgV.bind("TMS320C28023", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28023.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28023$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28023.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28023$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28023.Params", new Proto.Str(po, true));
    }

    void TMS320C28027$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28027.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28027", new Value.Obj("ti.catalog.c2800.TMS320C28027", po));
        pkgV.bind("TMS320C28027", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28027.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28027$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28027.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28027$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28027.Params", new Proto.Str(po, true));
    }

    void TMS320C28030$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28030.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28030", new Value.Obj("ti.catalog.c2800.TMS320C28030", po));
        pkgV.bind("TMS320C28030", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28030.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28030$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28030.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28030$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28030.Params", new Proto.Str(po, true));
    }

    void TMS320C28031$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28031.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28031", new Value.Obj("ti.catalog.c2800.TMS320C28031", po));
        pkgV.bind("TMS320C28031", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28031.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28031$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28031.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28031$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28031.Params", new Proto.Str(po, true));
    }

    void ITMS320C28032$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28032.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320C28032", new Value.Obj("ti.catalog.c2800.ITMS320C28032", po));
        pkgV.bind("ITMS320C28032", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320C28032.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28032$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28032.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28032$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28032.Params", new Proto.Str(po, true));
    }

    void TMS320C28032$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28032.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28032", new Value.Obj("ti.catalog.c2800.TMS320C28032", po));
        pkgV.bind("TMS320C28032", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28032.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28032$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28032.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28032$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28032.Params", new Proto.Str(po, true));
    }

    void TMS320C28033$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28033.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28033", new Value.Obj("ti.catalog.c2800.TMS320C28033", po));
        pkgV.bind("TMS320C28033", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28033.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28033$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28033.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28033$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28033.Params", new Proto.Str(po, true));
    }

    void ITMS320C28034$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28034.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320C28034", new Value.Obj("ti.catalog.c2800.ITMS320C28034", po));
        pkgV.bind("ITMS320C28034", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320C28034.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28034$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28034.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28034$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28034.Params", new Proto.Str(po, true));
    }

    void TMS320C28034$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28034.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28034", new Value.Obj("ti.catalog.c2800.TMS320C28034", po));
        pkgV.bind("TMS320C28034", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28034.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28034$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28034.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28034$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28034.Params", new Proto.Str(po, true));
    }

    void TMS320C28035$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28035.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28035", new Value.Obj("ti.catalog.c2800.TMS320C28035", po));
        pkgV.bind("TMS320C28035", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28035.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28035$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28035.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28035$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28035.Params", new Proto.Str(po, true));
    }

    void TMS320C28044$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28044.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28044", new Value.Obj("ti.catalog.c2800.TMS320C28044", po));
        pkgV.bind("TMS320C28044", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28044.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28044$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28044.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28044$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28044.Params", new Proto.Str(po, true));
    }

    void ITMS320C28342$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28342.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320C28342", new Value.Obj("ti.catalog.c2800.ITMS320C28342", po));
        pkgV.bind("ITMS320C28342", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320C28342.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28342$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28342.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28342$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28342.Params", new Proto.Str(po, true));
    }

    void TMS320C28341$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28341.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28341", new Value.Obj("ti.catalog.c2800.TMS320C28341", po));
        pkgV.bind("TMS320C28341", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28341.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28341$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28341.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28341$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28341.Params", new Proto.Str(po, true));
    }

    void TMS320C28342$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28342.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28342", new Value.Obj("ti.catalog.c2800.TMS320C28342", po));
        pkgV.bind("TMS320C28342", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28342.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28342$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28342.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28342$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28342.Params", new Proto.Str(po, true));
    }

    void ITMS320C28344$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28344.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320C28344", new Value.Obj("ti.catalog.c2800.ITMS320C28344", po));
        pkgV.bind("ITMS320C28344", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320C28344.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28344$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28344.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28344$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28344.Params", new Proto.Str(po, true));
    }

    void TMS320C28343$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28343.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28343", new Value.Obj("ti.catalog.c2800.TMS320C28343", po));
        pkgV.bind("TMS320C28343", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28343.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28343$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28343.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28343$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28343.Params", new Proto.Str(po, true));
    }

    void TMS320C28344$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28344.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28344", new Value.Obj("ti.catalog.c2800.TMS320C28344", po));
        pkgV.bind("TMS320C28344", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28344.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28344$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28344.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28344$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28344.Params", new Proto.Str(po, true));
    }

    void ITMS320C28346$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28346.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320C28346", new Value.Obj("ti.catalog.c2800.ITMS320C28346", po));
        pkgV.bind("ITMS320C28346", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320C28346.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28346$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28346.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320C28346$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320C28346.Params", new Proto.Str(po, true));
    }

    void TMS320C28345$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28345.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28345", new Value.Obj("ti.catalog.c2800.TMS320C28345", po));
        pkgV.bind("TMS320C28345", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28345.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28345$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28345.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28345$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28345.Params", new Proto.Str(po, true));
    }

    void TMS320C28346$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28346.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320C28346", new Value.Obj("ti.catalog.c2800.TMS320C28346", po));
        pkgV.bind("TMS320C28346", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320C28346.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28346$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28346.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320C28346$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320C28346.Params", new Proto.Str(po, true));
    }

    void TMS320F28062$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28062.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320F28062", new Value.Obj("ti.catalog.c2800.TMS320F28062", po));
        pkgV.bind("TMS320F28062", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320F28062.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28062$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28062.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28062$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28062.Params", new Proto.Str(po, true));
    }

    void TMS320F28063$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28063.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320F28063", new Value.Obj("ti.catalog.c2800.TMS320F28063", po));
        pkgV.bind("TMS320F28063", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320F28063.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28063$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28063.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28063$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28063.Params", new Proto.Str(po, true));
    }

    void ITMS320F28065$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320F28065.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320F28065", new Value.Obj("ti.catalog.c2800.ITMS320F28065", po));
        pkgV.bind("ITMS320F28065", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320F28065.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320F28065$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320F28065.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320F28065$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320F28065.Params", new Proto.Str(po, true));
    }

    void TMS320F28064$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28064.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320F28064", new Value.Obj("ti.catalog.c2800.TMS320F28064", po));
        pkgV.bind("TMS320F28064", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320F28064.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28064$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28064.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28064$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28064.Params", new Proto.Str(po, true));
    }

    void TMS320F28065$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28065.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320F28065", new Value.Obj("ti.catalog.c2800.TMS320F28065", po));
        pkgV.bind("TMS320F28065", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320F28065.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28065$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28065.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28065$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28065.Params", new Proto.Str(po, true));
    }

    void TMS320F28066$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28066.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320F28066", new Value.Obj("ti.catalog.c2800.TMS320F28066", po));
        pkgV.bind("TMS320F28066", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320F28066.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28066$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28066.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28066$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28066.Params", new Proto.Str(po, true));
    }

    void ITMS320F28069$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320F28069.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.ITMS320F28069", new Value.Obj("ti.catalog.c2800.ITMS320F28069", po));
        pkgV.bind("ITMS320F28069", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.ITMS320F28069.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320F28069$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320F28069.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.ITMS320F28069$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.ITMS320F28069.Params", new Proto.Str(po, true));
    }

    void TMS320F28067$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28067.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320F28067", new Value.Obj("ti.catalog.c2800.TMS320F28067", po));
        pkgV.bind("TMS320F28067", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320F28067.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28067$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28067.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28067$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28067.Params", new Proto.Str(po, true));
    }

    void TMS320F28068$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28068.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320F28068", new Value.Obj("ti.catalog.c2800.TMS320F28068", po));
        pkgV.bind("TMS320F28068", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320F28068.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28068$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28068.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28068$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28068.Params", new Proto.Str(po, true));
    }

    void TMS320F28069$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28069.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.TMS320F28069", new Value.Obj("ti.catalog.c2800.TMS320F28069", po));
        pkgV.bind("TMS320F28069", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.TMS320F28069.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28069$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28069.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.TMS320F28069$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.TMS320F28069.Params", new Proto.Str(po, true));
    }

    void F28M35x$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c2800.F28M35x.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c2800.F28M35x", new Value.Obj("ti.catalog.c2800.F28M35x", po));
        pkgV.bind("F28M35x", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c2800.F28M35x.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c2800.F28M35x$$Object", new Proto.Obj());
        om.bind("ti.catalog.c2800.F28M35x.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c2800.F28M35x$$Params", new Proto.Obj());
        om.bind("ti.catalog.c2800.F28M35x.Params", new Proto.Str(po, true));
    }

    void ITMS320C28xx$$CONSTS()
    {
        // interface ITMS320C28xx
    }

    void TMS320C2801$$CONSTS()
    {
        // module TMS320C2801
    }

    void TMS320C2802$$CONSTS()
    {
        // module TMS320C2802
    }

    void TMS320C2806$$CONSTS()
    {
        // module TMS320C2806
    }

    void TMS320C2808$$CONSTS()
    {
        // module TMS320C2808
    }

    void TMS320C2809$$CONSTS()
    {
        // module TMS320C2809
    }

    void TMS320C2810$$CONSTS()
    {
        // module TMS320C2810
    }

    void TMS320C2811$$CONSTS()
    {
        // module TMS320C2811
    }

    void TMS320C2812$$CONSTS()
    {
        // module TMS320C2812
    }

    void TMS320C28015$$CONSTS()
    {
        // module TMS320C28015
    }

    void TMS320C28016$$CONSTS()
    {
        // module TMS320C28016
    }

    void TMS320C28232$$CONSTS()
    {
        // module TMS320C28232
    }

    void TMS320C28234$$CONSTS()
    {
        // module TMS320C28234
    }

    void TMS320C28235$$CONSTS()
    {
        // module TMS320C28235
    }

    void ITMS320C283xx$$CONSTS()
    {
        // interface ITMS320C283xx
    }

    void TMS320C28332$$CONSTS()
    {
        // module TMS320C28332
    }

    void TMS320C28334$$CONSTS()
    {
        // module TMS320C28334
    }

    void TMS320C28335$$CONSTS()
    {
        // module TMS320C28335
    }

    void TMS320C28020$$CONSTS()
    {
        // module TMS320C28020
    }

    void TMS320C28021$$CONSTS()
    {
        // module TMS320C28021
    }

    void ITMS320C28026$$CONSTS()
    {
        // interface ITMS320C28026
    }

    void TMS320C28022$$CONSTS()
    {
        // module TMS320C28022
    }

    void TMS320C28026$$CONSTS()
    {
        // module TMS320C28026
    }

    void ITMS320C28027$$CONSTS()
    {
        // interface ITMS320C28027
    }

    void TMS320C28023$$CONSTS()
    {
        // module TMS320C28023
    }

    void TMS320C28027$$CONSTS()
    {
        // module TMS320C28027
    }

    void TMS320C28030$$CONSTS()
    {
        // module TMS320C28030
    }

    void TMS320C28031$$CONSTS()
    {
        // module TMS320C28031
    }

    void ITMS320C28032$$CONSTS()
    {
        // interface ITMS320C28032
    }

    void TMS320C28032$$CONSTS()
    {
        // module TMS320C28032
    }

    void TMS320C28033$$CONSTS()
    {
        // module TMS320C28033
    }

    void ITMS320C28034$$CONSTS()
    {
        // interface ITMS320C28034
    }

    void TMS320C28034$$CONSTS()
    {
        // module TMS320C28034
    }

    void TMS320C28035$$CONSTS()
    {
        // module TMS320C28035
    }

    void TMS320C28044$$CONSTS()
    {
        // module TMS320C28044
    }

    void ITMS320C28342$$CONSTS()
    {
        // interface ITMS320C28342
    }

    void TMS320C28341$$CONSTS()
    {
        // module TMS320C28341
    }

    void TMS320C28342$$CONSTS()
    {
        // module TMS320C28342
    }

    void ITMS320C28344$$CONSTS()
    {
        // interface ITMS320C28344
    }

    void TMS320C28343$$CONSTS()
    {
        // module TMS320C28343
    }

    void TMS320C28344$$CONSTS()
    {
        // module TMS320C28344
    }

    void ITMS320C28346$$CONSTS()
    {
        // interface ITMS320C28346
    }

    void TMS320C28345$$CONSTS()
    {
        // module TMS320C28345
    }

    void TMS320C28346$$CONSTS()
    {
        // module TMS320C28346
    }

    void TMS320F28062$$CONSTS()
    {
        // module TMS320F28062
    }

    void TMS320F28063$$CONSTS()
    {
        // module TMS320F28063
    }

    void ITMS320F28065$$CONSTS()
    {
        // interface ITMS320F28065
    }

    void TMS320F28064$$CONSTS()
    {
        // module TMS320F28064
    }

    void TMS320F28065$$CONSTS()
    {
        // module TMS320F28065
    }

    void TMS320F28066$$CONSTS()
    {
        // module TMS320F28066
    }

    void ITMS320F28069$$CONSTS()
    {
        // interface ITMS320F28069
    }

    void TMS320F28067$$CONSTS()
    {
        // module TMS320F28067
    }

    void TMS320F28068$$CONSTS()
    {
        // module TMS320F28068
    }

    void TMS320F28069$$CONSTS()
    {
        // module TMS320F28069
    }

    void F28M35x$$CONSTS()
    {
        // module F28M35x
    }

    void ITMS320C28xx$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320C2801$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2801$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2801.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C2801.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2801.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2801$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2801'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C2801.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2801$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2801.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2801$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2801.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2801$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2801'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C2802$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2802$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2802.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C2802.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2802.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2802$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2802'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C2802.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2802$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2802.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2802$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2802.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2802$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2802'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C2806$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2806$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2806.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C2806.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2806.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2806$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2806'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C2806.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2806$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2806.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2806$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2806.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2806$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2806'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C2808$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2808$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2808.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C2808.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2808.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2808$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2808'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C2808.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2808$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2808.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2808$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2808.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2808$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2808'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C2809$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2809$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2809.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C2809.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2809.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2809$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2809'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C2809.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2809$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2809.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2809$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2809.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2809$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2809'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C2810$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2810$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2810.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C2810.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2810.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2810$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2810'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C2810.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2810$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2810.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2810$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2810.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2810$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2810'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C2811$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2811$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2811.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C2811.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2811.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2811$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2811'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C2811.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2811$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2811.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2811$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2811.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2811$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2811'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C2812$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2812$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2812.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C2812.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2812.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2812$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2812'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C2812.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C2812$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C2812.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2812$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C2812.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C2812$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C2812'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28015$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28015$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28015.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28015.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28015.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28015$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28015'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28015.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28015$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28015.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28015$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28015.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28015$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28015'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28016$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28016$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28016.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28016.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28016.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28016$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28016'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28016.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28016$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28016.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28016$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28016.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28016$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28016'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28232$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28232$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28232.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28232.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28232.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28232$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28232'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28232.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28232$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28232.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28232$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28232.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28232$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28232'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28234$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28234$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28234.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28234.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28234.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28234$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28234'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28234.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28234$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28234.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28234$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28234.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28234$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28234'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28235$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28235$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28235.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28235.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28235.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28235$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28235'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28235.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28235$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28235.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28235$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28235.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28235$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28235'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320C283xx$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320C28332$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28332$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28332.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28332.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28332.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28332$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28332'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28332.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28332$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28332.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28332$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28332.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28332$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28332'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28334$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28334$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28334.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28334.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28334.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28334$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28334'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28334.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28334$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28334.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28334$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28334.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28334$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28334'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28335$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28335$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28335.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28335.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28335.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28335$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28335'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28335.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28335$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28335.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28335$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28335.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28335$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28335'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28020$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28020$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28020.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28020.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28020.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28020$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28020'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28020.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28020$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28020.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28020$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28020.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28020$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28020'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28021$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28021$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28021.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28021.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28021.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28021$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28021'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28021.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28021$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28021.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28021$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28021.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28021$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28021'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320C28026$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320C28022$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28022$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28022.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28022.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28022.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28022$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28022'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28022.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28022$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28022.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28022$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28022.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28022$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28022'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28026$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28026$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28026.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28026.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28026.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28026$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28026'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28026.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28026$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28026.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28026$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28026.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28026$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28026'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320C28027$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320C28023$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28023$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28023.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28023.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28023.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28023$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28023'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28023.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28023$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28023.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28023$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28023.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28023$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28023'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28027$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28027$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28027.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28027.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28027.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28027$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28027'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28027.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28027$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28027.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28027$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28027.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28027$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28027'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28030$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28030$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28030.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28030.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28030.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28030$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28030'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28030.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28030$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28030.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28030$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28030.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28030$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28030'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28031$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28031$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28031.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28031.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28031.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28031$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28031'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28031.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28031$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28031.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28031$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28031.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28031$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28031'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320C28032$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320C28032$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28032$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28032.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28032.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28032.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28032$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28032'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28032.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28032$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28032.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28032$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28032.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28032$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28032'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28033$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28033$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28033.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28033.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28033.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28033$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28033'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28033.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28033$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28033.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28033$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28033.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28033$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28033'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320C28034$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320C28034$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28034$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28034.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28034.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28034.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28034$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28034'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28034.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28034$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28034.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28034$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28034.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28034$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28034'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28035$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28035$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28035.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28035.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28035.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28035$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28035'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28035.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28035$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28035.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28035$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28035.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28035$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28035'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28044$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28044$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28044.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28044.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28044.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28044$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28044'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28044.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28044$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28044.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28044$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28044.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28044$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28044'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320C28342$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320C28341$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28341$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28341.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28341.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28341.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28341$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28341'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28341.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28341$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28341.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28341$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28341.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28341$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28341'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28342$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28342$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28342.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28342.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28342.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28342$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28342'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28342.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28342$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28342.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28342$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28342.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28342$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28342'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320C28344$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320C28343$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28343$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28343.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28343.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28343.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28343$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28343'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28343.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28343$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28343.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28343$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28343.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28343$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28343'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28344$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28344$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28344.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28344.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28344.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28344$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28344'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28344.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28344$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28344.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28344$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28344.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28344$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28344'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320C28346$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320C28345$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28345$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28345.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28345.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28345.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28345$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28345'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28345.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28345$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28345.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28345$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28345.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28345$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28345'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320C28346$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28346$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28346.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320C28346.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28346.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28346$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28346'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320C28346.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320C28346$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320C28346.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28346$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320C28346.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320C28346$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320C28346'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320F28062$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28062$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28062.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320F28062.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28062.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28062$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28062'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320F28062.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28062$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28062.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28062$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28062.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28062$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28062'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320F28063$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28063$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28063.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320F28063.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28063.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28063$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28063'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320F28063.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28063$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28063.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28063$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28063.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28063$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28063'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320F28065$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320F28064$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28064$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28064.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320F28064.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28064.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28064$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28064'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320F28064.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28064$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28064.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28064$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28064.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28064$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28064'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320F28065$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28065$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28065.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320F28065.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28065.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28065$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28065'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320F28065.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28065$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28065.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28065$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28065.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28065$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28065'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320F28066$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28066$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28066.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320F28066.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28066.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28066$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28066'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320F28066.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28066$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28066.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28066$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28066.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28066$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28066'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320F28069$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320F28067$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28067$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28067.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320F28067.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28067.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28067$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28067'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320F28067.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28067$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28067.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28067$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28067.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28067$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28067'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320F28068$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28068$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28068.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320F28068.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28068.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28068$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28068'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320F28068.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28068$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28068.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28068$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28068.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28068$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28068'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TMS320F28069$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28069$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28069.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.TMS320F28069.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28069.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28069$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28069'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.TMS320F28069.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.TMS320F28069$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.TMS320F28069.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28069$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.TMS320F28069.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$TMS320F28069$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.TMS320F28069'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void F28M35x$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.F28M35x$$create", new Proto.Fxn(om.findStrict("ti.catalog.c2800.F28M35x.Module", "ti.catalog.c2800"), om.findStrict("ti.catalog.c2800.F28M35x.Instance", "ti.catalog.c2800"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c2800.F28M35x.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$F28M35x$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.F28M35x'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c2800.F28M35x.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c2800']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.c2800.F28M35x$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c2800.F28M35x.Module", "ti.catalog.c2800"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c2800.F28M35x$$Object", "ti.catalog.c2800"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c2800.F28M35x.Params", "ti.catalog.c2800"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c2800$F28M35x$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c2800.F28M35x'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITMS320C28xx$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C2801$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C2802$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C2806$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C2808$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C2809$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C2810$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C2811$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C2812$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28015$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28016$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28232$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28234$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28235$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320C283xx$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28332$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28334$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28335$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28020$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28021$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320C28026$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28022$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28026$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320C28027$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28023$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28027$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28030$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28031$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320C28032$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28032$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28033$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320C28034$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28034$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28035$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28044$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320C28342$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28341$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28342$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320C28344$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28343$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28344$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320C28346$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28345$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C28346$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320F28062$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320F28063$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320F28065$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320F28064$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320F28065$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320F28066$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320F28069$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320F28067$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320F28068$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320F28069$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void F28M35x$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITMS320C28xx$$SIZES()
    {
    }

    void TMS320C2801$$SIZES()
    {
    }

    void TMS320C2802$$SIZES()
    {
    }

    void TMS320C2806$$SIZES()
    {
    }

    void TMS320C2808$$SIZES()
    {
    }

    void TMS320C2809$$SIZES()
    {
    }

    void TMS320C2810$$SIZES()
    {
    }

    void TMS320C2811$$SIZES()
    {
    }

    void TMS320C2812$$SIZES()
    {
    }

    void TMS320C28015$$SIZES()
    {
    }

    void TMS320C28016$$SIZES()
    {
    }

    void TMS320C28232$$SIZES()
    {
    }

    void TMS320C28234$$SIZES()
    {
    }

    void TMS320C28235$$SIZES()
    {
    }

    void ITMS320C283xx$$SIZES()
    {
    }

    void TMS320C28332$$SIZES()
    {
    }

    void TMS320C28334$$SIZES()
    {
    }

    void TMS320C28335$$SIZES()
    {
    }

    void TMS320C28020$$SIZES()
    {
    }

    void TMS320C28021$$SIZES()
    {
    }

    void ITMS320C28026$$SIZES()
    {
    }

    void TMS320C28022$$SIZES()
    {
    }

    void TMS320C28026$$SIZES()
    {
    }

    void ITMS320C28027$$SIZES()
    {
    }

    void TMS320C28023$$SIZES()
    {
    }

    void TMS320C28027$$SIZES()
    {
    }

    void TMS320C28030$$SIZES()
    {
    }

    void TMS320C28031$$SIZES()
    {
    }

    void ITMS320C28032$$SIZES()
    {
    }

    void TMS320C28032$$SIZES()
    {
    }

    void TMS320C28033$$SIZES()
    {
    }

    void ITMS320C28034$$SIZES()
    {
    }

    void TMS320C28034$$SIZES()
    {
    }

    void TMS320C28035$$SIZES()
    {
    }

    void TMS320C28044$$SIZES()
    {
    }

    void ITMS320C28342$$SIZES()
    {
    }

    void TMS320C28341$$SIZES()
    {
    }

    void TMS320C28342$$SIZES()
    {
    }

    void ITMS320C28344$$SIZES()
    {
    }

    void TMS320C28343$$SIZES()
    {
    }

    void TMS320C28344$$SIZES()
    {
    }

    void ITMS320C28346$$SIZES()
    {
    }

    void TMS320C28345$$SIZES()
    {
    }

    void TMS320C28346$$SIZES()
    {
    }

    void TMS320F28062$$SIZES()
    {
    }

    void TMS320F28063$$SIZES()
    {
    }

    void ITMS320F28065$$SIZES()
    {
    }

    void TMS320F28064$$SIZES()
    {
    }

    void TMS320F28065$$SIZES()
    {
    }

    void TMS320F28066$$SIZES()
    {
    }

    void ITMS320F28069$$SIZES()
    {
    }

    void TMS320F28067$$SIZES()
    {
    }

    void TMS320F28068$$SIZES()
    {
    }

    void TMS320F28069$$SIZES()
    {
    }

    void F28M35x$$SIZES()
    {
    }

    void ITMS320C28xx$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/c2800/ITMS320C28xx.xs");
        om.bind("ti.catalog.c2800.ITMS320C28xx$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28xx.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.c2800.ITMS320C28xx$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.c2800.ITMS320C28xx$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.c2800.ITMS320C28xx$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.c2800.ITMS320C28xx$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28xx.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "2800", "wh");
        po.addFld("isa", $$T_Str, "28", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 2L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 2L, "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28xx.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "2800", "wh");
        po.addFld("isa", $$T_Str, "28", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 2L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 2L, "wh");
    }

    void TMS320C2801$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2801.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2801.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2801$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2801$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2801$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2801$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2801.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2801.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3F4000L, "len", 0x004000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2801$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2801.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3F4000L, "len", 0x004000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2801$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2801.Object", om.findStrict("ti.catalog.c2800.TMS320C2801.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C2802$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2802.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2802.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2802$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2802$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2802$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2802$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2802.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2802.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3F0000L, "len", 0x008000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2802$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2802.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3F0000L, "len", 0x008000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2802$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2802.Object", om.findStrict("ti.catalog.c2800.TMS320C2802.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C2806$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2806.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2806.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2806$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2806$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2806$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2806$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2806.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2806.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L0SARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L1SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L1SARAM", "base", 0x9000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3F0000L, "len", 0x007f80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FC000L, "len", 0x003FC0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2806$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2806.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L0SARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L1SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L1SARAM", "base", 0x9000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3F0000L, "len", 0x007f80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FC000L, "len", 0x003FC0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2806$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2806.Object", om.findStrict("ti.catalog.c2800.TMS320C2806.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C2808$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2808.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2808.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2808$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2808$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2808$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2808$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2808.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2808.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3E8000L, "len", 0x00ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"H0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H0SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2808$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2808.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3E8000L, "len", 0x00ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"H0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H0SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2808$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2808.Object", om.findStrict("ti.catalog.c2800.TMS320C2808.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C2809$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2809.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2809.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2809$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2809$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2809$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2809$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2809.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2809.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3D8000L, "len", 0x01ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"H0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H0SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2809$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2809.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3D8000L, "len", 0x01ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"H0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H0SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2809$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2809.Object", om.findStrict("ti.catalog.c2800.TMS320C2809.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C2810$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2810.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2810.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2810$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2810$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2810$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2810$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2810.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2810.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "2K X 16 OTP memory", "name", "OTP", "base", 0x3d7800L, "len", 0x400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3d8000L, "len", 0x1ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"H0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H0SARAM", "base", 0x3f8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3ff000L, "len", 0xfc0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2810$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2810.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "2K X 16 OTP memory", "name", "OTP", "base", 0x3d7800L, "len", 0x400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3d8000L, "len", 0x1ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"H0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H0SARAM", "base", 0x3f8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3ff000L, "len", 0xfc0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2810$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2810.Object", om.findStrict("ti.catalog.c2800.TMS320C2810.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C2811$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2811.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2811.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2811$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2811$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2811$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2811$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2811.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2811.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "2K X 16 OTP memory", "name", "OTP", "base", 0x3d7800L, "len", 0x400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3d8000L, "len", 0x1ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"H0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H0SARAM", "base", 0x3f8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3ff000L, "len", 0xfc0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2811$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2811.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "2K X 16 OTP memory", "name", "OTP", "base", 0x3d7800L, "len", 0x400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3d8000L, "len", 0x1ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"H0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H0SARAM", "base", 0x3f8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3ff000L, "len", 0xfc0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2811$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2811.Object", om.findStrict("ti.catalog.c2800.TMS320C2811.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C2812$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2812.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2812.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2812$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2812$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C2812$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C2812$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2812.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2812.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "2K X 16 OTP memory", "name", "OTP", "base", 0x3d7800L, "len", 0x400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3d8000L, "len", 0x1ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"H0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H0SARAM", "base", 0x3f8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3ff000L, "len", 0xfc0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2812$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2812.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "2K X 16 OTP memory", "name", "OTP", "base", 0x3d7800L, "len", 0x400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3d8000L, "len", 0x1ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"H0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H0SARAM", "base", 0x3f8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3ff000L, "len", 0xfc0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2812$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C2812.Object", om.findStrict("ti.catalog.c2800.TMS320C2812.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28015$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28015.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28015.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28015$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28015$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28015$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28015$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28015.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28015.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3F4000L, "len", 0x003f80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28015$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28015.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3F4000L, "len", 0x003f80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28015$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28015.Object", om.findStrict("ti.catalog.c2800.TMS320C28015.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28016$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28016.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28016.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28016$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28016$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28016$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28016$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28016.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28016.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3F4000L, "len", 0x003f80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28016$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28016.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3F4000L, "len", 0x003f80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28016$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28016.Object", om.findStrict("ti.catalog.c2800.TMS320C28016.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28232$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28232.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28232.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28232$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28232$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28232$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28232$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28232.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28232.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x330000L, "len", 0x00ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28232$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28232.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x330000L, "len", 0x00ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28232$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28232.Object", om.findStrict("ti.catalog.c2800.TMS320C28232.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28234$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28234.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28234.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28234$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28234$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28234$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28234$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28234.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28234.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x320000L, "len", 0x01ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28234$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28234.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x320000L, "len", 0x01ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28234$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28234.Object", om.findStrict("ti.catalog.c2800.TMS320C28234.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28235$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28235.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28235.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28235$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28235$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28235$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28235$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28235.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28235.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "256K X 16 Flash memory", "name", "FLASH", "base", 0x300000L, "len", 0x03ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28235$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28235.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "256K X 16 Flash memory", "name", "FLASH", "base", 0x300000L, "len", 0x03ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28235$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28235.Object", om.findStrict("ti.catalog.c2800.TMS320C28235.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320C283xx$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C283xx.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C283xx.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("isa", $$T_Str, "28FP", "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C283xx.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("isa", $$T_Str, "28FP", "wh");
    }

    void TMS320C28332$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28332.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28332.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28332$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28332$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28332$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28332$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28332.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28332.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x330000L, "len", 0x00ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28332$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28332.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x330000L, "len", 0x00ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28332$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28332.Object", om.findStrict("ti.catalog.c2800.TMS320C28332.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28334$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28334.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28334.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28334$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28334$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28334$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28334$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28334.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28334.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x320000L, "len", 0x01ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28334$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28334.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x320000L, "len", 0x01ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28334$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28334.Object", om.findStrict("ti.catalog.c2800.TMS320C28334.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28335$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28335.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28335.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28335$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28335$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28335$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28335$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28335.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28335.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "256K X 16 Flash memory", "name", "FLASH", "base", 0x300000L, "len", 0x03ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28335$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28335.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x380400L, "len", 0x400L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "256K X 16 Flash memory", "name", "FLASH", "base", 0x300000L, "len", 0x03ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x33fff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28335$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28335.Object", om.findStrict("ti.catalog.c2800.TMS320C28335.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28020$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28020.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28020.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28020$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28020$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28020$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28020$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28020.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28020.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "L0 SARAM (1K x 16)", "name", "LSARAM", "base", 0x8000L, "len", 0x0400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3f4000L, "len", 0x003f80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28020$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28020.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "L0 SARAM (1K x 16)", "name", "LSARAM", "base", 0x8000L, "len", 0x0400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3f4000L, "len", 0x003f80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28020$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28020.Object", om.findStrict("ti.catalog.c2800.TMS320C28020.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28021$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28021.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28021.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28021$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28021$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28021$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28021$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28021.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28021.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "L0 SARAM (3K x 16)", "name", "LSARAM", "base", 0x8000L, "len", 0x0c00L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3f0000L, "len", 0x007f80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28021$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28021.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "L0 SARAM (3K x 16)", "name", "LSARAM", "base", 0x8000L, "len", 0x0c00L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3f0000L, "len", 0x007f80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28021$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28021.Object", om.findStrict("ti.catalog.c2800.TMS320C28021.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320C28026$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28026.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28026.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28026.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28026.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "L0 SARAM (4K x 16)", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3f4000L, "len", 0x003f80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28026$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28026.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "L0 SARAM (4K x 16)", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3f4000L, "len", 0x003f80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
    }

    void TMS320C28022$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28022.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28022.Module", om.findStrict("ti.catalog.c2800.ITMS320C28026.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28022$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28022$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28022$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28022$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28022.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28022.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28026.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28022$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28022.Params", om.findStrict("ti.catalog.c2800.ITMS320C28026$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28022$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28022.Object", om.findStrict("ti.catalog.c2800.TMS320C28022.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28026$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28026.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28026.Module", om.findStrict("ti.catalog.c2800.ITMS320C28026.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28026$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28026$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28026$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28026$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28026.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28026.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28026.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28026$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28026.Params", om.findStrict("ti.catalog.c2800.ITMS320C28026$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28026$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28026.Object", om.findStrict("ti.catalog.c2800.TMS320C28026.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320C28027$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28027.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28027.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28027.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28027.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "L0 SARAM (4K x 16)", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3f0000L, "len", 0x007f80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28027$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28027.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "L0 SARAM (4K x 16)", "name", "LSARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3f0000L, "len", 0x007f80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
    }

    void TMS320C28023$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28023.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28023.Module", om.findStrict("ti.catalog.c2800.ITMS320C28027.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28023$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28023$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28023$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28023$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28023.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28023.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28027.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28023$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28023.Params", om.findStrict("ti.catalog.c2800.ITMS320C28027$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28023$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28023.Object", om.findStrict("ti.catalog.c2800.TMS320C28023.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28027$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28027.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28027.Module", om.findStrict("ti.catalog.c2800.ITMS320C28027.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28027$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28027$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28027$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28027$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28027.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28027.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28027.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28027$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28027.Params", om.findStrict("ti.catalog.c2800.ITMS320C28027$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28027$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28027.Object", om.findStrict("ti.catalog.c2800.TMS320C28027.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28030$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28030.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28030.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28030$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28030$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28030$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28030$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28030.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28030.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"DPSARAM", Global.newObject("comment", "On-Chip DPSARAM Memory", "name", "DPSARAM", "base", 0x9000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3F4000L, "len", 0x003f80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"L0SARAM", Global.newObject("comment", "On-Chip L0 SARAM Memory", "name", "L0SARAM", "base", 0x3F8000L, "len", 0x000800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FE000L, "len", 0x001FC0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28030$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28030.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"DPSARAM", Global.newObject("comment", "On-Chip DPSARAM Memory", "name", "DPSARAM", "base", 0x9000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "16K X 16 Flash memory", "name", "FLASH", "base", 0x3F4000L, "len", 0x003f80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"L0SARAM", Global.newObject("comment", "On-Chip L0 SARAM Memory", "name", "L0SARAM", "base", 0x3F8000L, "len", 0x000800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FE000L, "len", 0x001FC0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28030$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28030.Object", om.findStrict("ti.catalog.c2800.TMS320C28030.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28031$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28031.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28031.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28031$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28031$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28031$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28031$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28031.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28031.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"DPSARAM", Global.newObject("comment", "On-Chip DPSARAM Memory", "name", "DPSARAM", "base", 0x8800L, "len", 0x1800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3F0000L, "len", 0x007f80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"L0SARAM", Global.newObject("comment", "On-Chip L0 SARAM Memory", "name", "L0SARAM", "base", 0x3F8000L, "len", 0x000800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FE000L, "len", 0x001FC0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28031$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28031.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"DPSARAM", Global.newObject("comment", "On-Chip DPSARAM Memory", "name", "DPSARAM", "base", 0x8800L, "len", 0x1800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3F0000L, "len", 0x007f80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"L0SARAM", Global.newObject("comment", "On-Chip L0 SARAM Memory", "name", "L0SARAM", "base", 0x3F8000L, "len", 0x000800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FE000L, "len", 0x001FC0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28031$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28031.Object", om.findStrict("ti.catalog.c2800.TMS320C28031.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320C28032$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28032.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28032.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28032.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28032.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"DPSARAM", Global.newObject("comment", "DPSARAM (6K x 16)", "name", "DPSARAM", "base", 0x8800L, "len", 0xa000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3f0000L, "len", 0x007f80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28032$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28032.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "LSARAM", "base", 0x8000L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"DPSARAM", Global.newObject("comment", "DPSARAM (6K x 16)", "name", "DPSARAM", "base", 0x8800L, "len", 0xa000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "32K X 16 Flash memory", "name", "FLASH", "base", 0x3f0000L, "len", 0x007f80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
    }

    void TMS320C28032$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28032.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28032.Module", om.findStrict("ti.catalog.c2800.ITMS320C28032.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28032$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28032$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28032$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28032$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28032.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28032.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28032.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28032$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28032.Params", om.findStrict("ti.catalog.c2800.ITMS320C28032$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28032$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28032.Object", om.findStrict("ti.catalog.c2800.TMS320C28032.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28033$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28033.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28033.Module", om.findStrict("ti.catalog.c2800.ITMS320C28032.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28033$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28033$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28033$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28033$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28033.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28033.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28032.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28033$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28033.Params", om.findStrict("ti.catalog.c2800.ITMS320C28032$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28033$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28033.Object", om.findStrict("ti.catalog.c2800.TMS320C28033.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320C28034$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28034.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28034.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28034.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28034.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "LSARAM (2K x 16)", "name", "LSARAM", "base", 0x8000L, "len", 0x0800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"DPSARAM", Global.newObject("comment", "DPSARAM (6K x 16)", "name", "DPSARAM", "base", 0x8800L, "len", 0x1800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3e8000L, "len", 0x00ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28034$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28034.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"LSARAM", Global.newObject("comment", "LSARAM (2K x 16)", "name", "LSARAM", "base", 0x8000L, "len", 0x0800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"DPSARAM", Global.newObject("comment", "DPSARAM (6K x 16)", "name", "DPSARAM", "base", 0x8800L, "len", 0x1800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3e8000L, "len", 0x00ff80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x001fc0L, "page", 0L, "space", "code")})}), "wh");
    }

    void TMS320C28034$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28034.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28034.Module", om.findStrict("ti.catalog.c2800.ITMS320C28034.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28034$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28034$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28034$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28034$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28034.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28034.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28034.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28034$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28034.Params", om.findStrict("ti.catalog.c2800.ITMS320C28034$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28034$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28034.Object", om.findStrict("ti.catalog.c2800.TMS320C28034.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28035$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28035.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28035.Module", om.findStrict("ti.catalog.c2800.ITMS320C28034.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28035$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28035$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28035$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28035$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28035.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28035.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28034.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28035$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28035.Params", om.findStrict("ti.catalog.c2800.ITMS320C28034$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28035$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28035.Object", om.findStrict("ti.catalog.c2800.TMS320C28035.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28044$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28044.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28044.Module", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28044$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28044$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28044$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28044$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28044.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28044.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L0SARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L1SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L1SARAM", "base", 0x9000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3E8000L, "len", 0x00ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28044$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28044.Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L0SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L0SARAM", "base", 0x8000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L1SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L1SARAM", "base", 0x9000L, "len", 0x1000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x000400L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3E8000L, "len", 0x00ff80L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3FF000L, "len", 0x000FC0L, "page", 0L, "space", "code/data")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28044$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28044.Object", om.findStrict("ti.catalog.c2800.TMS320C28044.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320C28342$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28342.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28342.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28342.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28342.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x8000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"H01SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H01SARAM", "base", 0x300000L, "len", 0x010000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28342$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28342.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x8000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"H01SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H01SARAM", "base", 0x300000L, "len", 0x010000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
    }

    void TMS320C28341$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28341.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28341.Module", om.findStrict("ti.catalog.c2800.ITMS320C28342.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28341$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28341$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28341$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28341$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28341.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28341.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28342.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28341$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28341.Params", om.findStrict("ti.catalog.c2800.ITMS320C28342$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28341$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28341.Object", om.findStrict("ti.catalog.c2800.TMS320C28341.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28342$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28342.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28342.Module", om.findStrict("ti.catalog.c2800.ITMS320C28342.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28342$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28342$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28342$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28342$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28342.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28342.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28342.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28342$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28342.Params", om.findStrict("ti.catalog.c2800.ITMS320C28342$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28342$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28342.Object", om.findStrict("ti.catalog.c2800.TMS320C28342.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320C28344$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28344.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28344.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28344.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28344.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x8000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0x10000L, "len", 0x8000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"H01SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H01SARAM", "base", 0x300000L, "len", 0x010000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28344$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28344.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x8000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0x10000L, "len", 0x8000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"H01SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H01SARAM", "base", 0x300000L, "len", 0x010000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
    }

    void TMS320C28343$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28343.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28343.Module", om.findStrict("ti.catalog.c2800.ITMS320C28344.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28343$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28343$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28343$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28343$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28343.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28343.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28344.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28343$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28343.Params", om.findStrict("ti.catalog.c2800.ITMS320C28344$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28343$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28343.Object", om.findStrict("ti.catalog.c2800.TMS320C28343.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28344$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28344.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28344.Module", om.findStrict("ti.catalog.c2800.ITMS320C28344.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28344$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28344$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28344$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28344$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28344.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28344.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28344.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28344$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28344.Params", om.findStrict("ti.catalog.c2800.ITMS320C28344$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28344$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28344.Object", om.findStrict("ti.catalog.c2800.TMS320C28344.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320C28346$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28346.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28346.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28346.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28346.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x8000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0x10000L, "len", 0x8000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"H05SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H05SARAM", "base", 0x300000L, "len", 0x030000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28346$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320C28346.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x8000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L47SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L47SARAM", "base", 0x10000L, "len", 0x8000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"H05SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "H05SARAM", "base", 0x300000L, "len", 0x030000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3fe000L, "len", 0x1fc0L, "page", 0L, "space", "code")})}), "wh");
    }

    void TMS320C28345$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28345.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28345.Module", om.findStrict("ti.catalog.c2800.ITMS320C28346.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28345$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28345$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28345$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28345$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28345.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28345.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28346.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28345$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28345.Params", om.findStrict("ti.catalog.c2800.ITMS320C28346$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28345$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28345.Object", om.findStrict("ti.catalog.c2800.TMS320C28345.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320C28346$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28346.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28346.Module", om.findStrict("ti.catalog.c2800.ITMS320C28346.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28346$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28346$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320C28346$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320C28346$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28346.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28346.Instance", om.findStrict("ti.catalog.c2800.ITMS320C28346.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28346$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28346.Params", om.findStrict("ti.catalog.c2800.ITMS320C28346$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28346$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320C28346.Object", om.findStrict("ti.catalog.c2800.TMS320C28346.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320F28062$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28062.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28062.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28062$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28062$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28062$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28062$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28062.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28062.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03DPSARAM", Global.newObject("comment", "L0-L3 DPSARAM (8K x 16)", "name", "L03DPSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L4SARAM", Global.newObject("comment", "L4 SARAM (8K x 16)", "name", "L4SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L5DPSARAM", Global.newObject("comment", "L5 DPSARAM (8K x 16)", "name", "L5DPSARAM", "base", 0xC000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x0003FAL, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3E8000L, "len", 0x00FF80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3F8000L, "len", 0x007FC0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28062$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28062.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03DPSARAM", Global.newObject("comment", "L0-L3 DPSARAM (8K x 16)", "name", "L03DPSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L4SARAM", Global.newObject("comment", "L4 SARAM (8K x 16)", "name", "L4SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L5DPSARAM", Global.newObject("comment", "L5 DPSARAM (8K x 16)", "name", "L5DPSARAM", "base", 0xC000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x0003FAL, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3E8000L, "len", 0x00FF80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3F8000L, "len", 0x007FC0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28062$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28062.Object", om.findStrict("ti.catalog.c2800.TMS320F28062.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320F28063$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28063.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28063.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28063$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28063$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28063$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28063$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28063.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28063.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03DPSARAM", Global.newObject("comment", "L0-L3 DPSARAM (8K x 16)", "name", "L03DPSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L4SARAM", Global.newObject("comment", "L4 SARAM (8K x 16)", "name", "L4SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L56DPSARAM", Global.newObject("comment", "L5-L6 DPSARAM (16K x 16)", "name", "L56DPSARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x0003FAL, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3E8000L, "len", 0x00FF80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3F8000L, "len", 0x007FC0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28063$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28063.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03DPSARAM", Global.newObject("comment", "L0-L3 DPSARAM (8K x 16)", "name", "L03DPSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L4SARAM", Global.newObject("comment", "L4 SARAM (8K x 16)", "name", "L4SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L56DPSARAM", Global.newObject("comment", "L5-L6 DPSARAM (16K x 16)", "name", "L56DPSARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x0003FAL, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3E8000L, "len", 0x00FF80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3F8000L, "len", 0x007FC0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28063$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28063.Object", om.findStrict("ti.catalog.c2800.TMS320F28063.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320F28065$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320F28065.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320F28065.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320F28065.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320F28065.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03DPSARAM", Global.newObject("comment", "L0-L3 DPSARAM (8K x 16)", "name", "L03DPSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L4SARAM", Global.newObject("comment", "L4 SARAM (8K x 16)", "name", "L4SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L56DPSARAM", Global.newObject("comment", "L5-L6 DPSARAM (16K x 16)", "name", "L56DPSARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L78DPSARAM", Global.newObject("comment", "L7-L8 DPSARAM (16K x 16)", "name", "L78DPSARAM", "base", 0x10000L, "len", 0x04000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x0003FAL, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3E8000L, "len", 0x00FF80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3F8000L, "len", 0x007FC0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320F28065$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320F28065.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03DPSARAM", Global.newObject("comment", "L0-L3 DPSARAM (8K x 16)", "name", "L03DPSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L4SARAM", Global.newObject("comment", "L4 SARAM (8K x 16)", "name", "L4SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L56DPSARAM", Global.newObject("comment", "L5-L6 DPSARAM (16K x 16)", "name", "L56DPSARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L78DPSARAM", Global.newObject("comment", "L7-L8 DPSARAM (16K x 16)", "name", "L78DPSARAM", "base", 0x10000L, "len", 0x04000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x0003FAL, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "64K X 16 Flash memory", "name", "FLASH", "base", 0x3E8000L, "len", 0x00FF80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3F8000L, "len", 0x007FC0L, "page", 0L, "space", "code")})}), "wh");
    }

    void TMS320F28064$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28064.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28064.Module", om.findStrict("ti.catalog.c2800.ITMS320F28065.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28064$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28064$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28064$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28064$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28064.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28064.Instance", om.findStrict("ti.catalog.c2800.ITMS320F28065.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28064$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28064.Params", om.findStrict("ti.catalog.c2800.ITMS320F28065$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28064$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28064.Object", om.findStrict("ti.catalog.c2800.TMS320F28064.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320F28065$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28065.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28065.Module", om.findStrict("ti.catalog.c2800.ITMS320F28065.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28065$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28065$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28065$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28065$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28065.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28065.Instance", om.findStrict("ti.catalog.c2800.ITMS320F28065.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28065$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28065.Params", om.findStrict("ti.catalog.c2800.ITMS320F28065$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28065$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28065.Object", om.findStrict("ti.catalog.c2800.TMS320F28065.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320F28066$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28066.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28066.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28066$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28066$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28066$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28066$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28066.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28066.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03DPSARAM", Global.newObject("comment", "L0-L3 DPSARAM (8K x 16)", "name", "L03DPSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L4SARAM", Global.newObject("comment", "L4 SARAM (8K x 16)", "name", "L4SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L56DPSARAM", Global.newObject("comment", "L5-L6 DPSARAM (16K x 16)", "name", "L56DPSARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x0003FAL, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3D8000L, "len", 0x01FF80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3F8000L, "len", 0x007FC0L, "page", 0L, "space", "code")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28066$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28066.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03DPSARAM", Global.newObject("comment", "L0-L3 DPSARAM (8K x 16)", "name", "L03DPSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L4SARAM", Global.newObject("comment", "L4 SARAM (8K x 16)", "name", "L4SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L56DPSARAM", Global.newObject("comment", "L5-L6 DPSARAM (16K x 16)", "name", "L56DPSARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x0003FAL, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3D8000L, "len", 0x01FF80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3F8000L, "len", 0x007FC0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28066$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28066.Object", om.findStrict("ti.catalog.c2800.TMS320F28066.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320F28069$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320F28069.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320F28069.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320F28069.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320F28069.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03DPSARAM", Global.newObject("comment", "L0-L3 DPSARAM (8K x 16)", "name", "L03DPSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L4SARAM", Global.newObject("comment", "L4 SARAM (8K x 16)", "name", "L4SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L56DPSARAM", Global.newObject("comment", "L5-L6 DPSARAM (16K x 16)", "name", "L56DPSARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L78DPSARAM", Global.newObject("comment", "L7-L8 DPSARAM (16K x 16)", "name", "L78DPSARAM", "base", 0x10000L, "len", 0x04000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x0003FAL, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3D8000L, "len", 0x01FF80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3F8000L, "len", 0x007FC0L, "page", 0L, "space", "code")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320F28069$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.ITMS320F28069.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"MSARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "MSARAM", "base", 0x0L, "len", 0x800L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 1L, "space", "data")}), Global.newArray(new Object[]{"L03DPSARAM", Global.newObject("comment", "L0-L3 DPSARAM (8K x 16)", "name", "L03DPSARAM", "base", 0x8000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L4SARAM", Global.newObject("comment", "L4 SARAM (8K x 16)", "name", "L4SARAM", "base", 0xA000L, "len", 0x2000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L56DPSARAM", Global.newObject("comment", "L5-L6 DPSARAM (16K x 16)", "name", "L56DPSARAM", "base", 0xC000L, "len", 0x4000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"L78DPSARAM", Global.newObject("comment", "L7-L8 DPSARAM (16K x 16)", "name", "L78DPSARAM", "base", 0x10000L, "len", 0x04000L, "page", 0L, "space", "code/data")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x3D7800L, "len", 0x0003FAL, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "128K X 16 Flash memory", "name", "FLASH", "base", 0x3D8000L, "len", 0x01FF80L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "FLASH boot entry point", "name", "BEGIN", "base", 0x3f7ff6L, "len", 0x000002L, "page", 0L, "space", "code")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3F8000L, "len", 0x007FC0L, "page", 0L, "space", "code")})}), "wh");
    }

    void TMS320F28067$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28067.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28067.Module", om.findStrict("ti.catalog.c2800.ITMS320F28069.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28067$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28067$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28067$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28067$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28067.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28067.Instance", om.findStrict("ti.catalog.c2800.ITMS320F28069.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28067$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28067.Params", om.findStrict("ti.catalog.c2800.ITMS320F28069$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28067$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28067.Object", om.findStrict("ti.catalog.c2800.TMS320F28067.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320F28068$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28068.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28068.Module", om.findStrict("ti.catalog.c2800.ITMS320F28069.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28068$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28068$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28068$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28068$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28068.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28068.Instance", om.findStrict("ti.catalog.c2800.ITMS320F28069.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28068$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28068.Params", om.findStrict("ti.catalog.c2800.ITMS320F28069$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28068$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28068.Object", om.findStrict("ti.catalog.c2800.TMS320F28068.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void TMS320F28069$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28069.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28069.Module", om.findStrict("ti.catalog.c2800.ITMS320F28069.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28069$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28069$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.TMS320F28069$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$TMS320F28069$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28069.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28069.Instance", om.findStrict("ti.catalog.c2800.ITMS320F28069.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28069$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28069.Params", om.findStrict("ti.catalog.c2800.ITMS320F28069$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28069$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.TMS320F28069.Object", om.findStrict("ti.catalog.c2800.TMS320F28069.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void F28M35x$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.F28M35x.Module", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.F28M35x.Module", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c2800.F28M35x$$create", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$F28M35x$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c2800.F28M35x$$construct", "ti.catalog.c2800"), Global.get("ti$catalog$c2800$F28M35x$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.F28M35x.Instance", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.F28M35x.Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"M01SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "M01SARAM", "base", 0x0L, "len", 0x800L, "page", 1L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 0L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 1L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"S07SHRAM", Global.newObject("comment", "On-Chip Shared RAM Memory", "name", "S07SHRAM", "base", 0xC000L, "len", 0x8000L, "page", 1L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"CTOMMSGRAM", Global.newObject("comment", "C28 to M3 MSG RAM Memory", "name", "CTOMMSGRAM", "base", 0x3F800L, "len", 0x00400L, "page", 1L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"MTOCMSGRAM", Global.newObject("comment", "M3 to C28 MSG RAM Memory", "name", "MTOCMSGRAM", "base", 0x3FC00L, "len", 0x00400L, "page", 1L, "space", "data", "access", "R")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x240400L, "len", 0x000400L, "page", 0L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "256K X 16 Flash memory", "name", "FLASH", "base", 0x100000L, "len", 0x03fffeL, "page", 0L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "Used for Flash boot", "name", "BEGIN", "base", 0x13fffeL, "len", 0x000002L, "page", 0L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3f8000L, "len", 0x008000L, "page", 0L, "space", "code", "access", "RX")})}), "wh");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.F28M35x$$Params", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.F28M35x.Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx$$Params", "ti.catalog.c2800"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c2800")), Global.newArray(new Object[]{Global.newArray(new Object[]{"M01SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "M01SARAM", "base", 0x0L, "len", 0x800L, "page", 1L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"PIEVECT", Global.newObject("comment", "On-Chip PIEVECT RAM Memory", "name", "PIEVECT", "base", 0xD00L, "len", 0x100L, "page", 0L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"L03SARAM", Global.newObject("comment", "On-Chip RAM Memory", "name", "L03SARAM", "base", 0x8000L, "len", 0x4000L, "page", 1L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"S07SHRAM", Global.newObject("comment", "On-Chip Shared RAM Memory", "name", "S07SHRAM", "base", 0xC000L, "len", 0x8000L, "page", 1L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"CTOMMSGRAM", Global.newObject("comment", "C28 to M3 MSG RAM Memory", "name", "CTOMMSGRAM", "base", 0x3F800L, "len", 0x00400L, "page", 1L, "space", "data", "access", "RW")}), Global.newArray(new Object[]{"MTOCMSGRAM", Global.newObject("comment", "M3 to C28 MSG RAM Memory", "name", "MTOCMSGRAM", "base", 0x3FC00L, "len", 0x00400L, "page", 1L, "space", "data", "access", "R")}), Global.newArray(new Object[]{"OTP", Global.newObject("comment", "1K X 16 OTP memory", "name", "OTP", "base", 0x240400L, "len", 0x000400L, "page", 0L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"FLASH", Global.newObject("comment", "256K X 16 Flash memory", "name", "FLASH", "base", 0x100000L, "len", 0x03fffeL, "page", 0L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"BEGIN", Global.newObject("comment", "Used for Flash boot", "name", "BEGIN", "base", 0x13fffeL, "len", 0x000002L, "page", 0L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"BOOTROM", Global.newObject("comment", "On-Chip Boot ROM", "name", "BOOTROM", "base", 0x3f8000L, "len", 0x008000L, "page", 0L, "space", "code", "access", "RX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.F28M35x$$Object", "ti.catalog.c2800");
        po.init("ti.catalog.c2800.F28M35x.Object", om.findStrict("ti.catalog.c2800.F28M35x.Instance", "ti.catalog.c2800"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c2800"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c2800"), $$UNDEF);
    }

    void ITMS320C28xx$$ROV()
    {
    }

    void TMS320C2801$$ROV()
    {
    }

    void TMS320C2802$$ROV()
    {
    }

    void TMS320C2806$$ROV()
    {
    }

    void TMS320C2808$$ROV()
    {
    }

    void TMS320C2809$$ROV()
    {
    }

    void TMS320C2810$$ROV()
    {
    }

    void TMS320C2811$$ROV()
    {
    }

    void TMS320C2812$$ROV()
    {
    }

    void TMS320C28015$$ROV()
    {
    }

    void TMS320C28016$$ROV()
    {
    }

    void TMS320C28232$$ROV()
    {
    }

    void TMS320C28234$$ROV()
    {
    }

    void TMS320C28235$$ROV()
    {
    }

    void ITMS320C283xx$$ROV()
    {
    }

    void TMS320C28332$$ROV()
    {
    }

    void TMS320C28334$$ROV()
    {
    }

    void TMS320C28335$$ROV()
    {
    }

    void TMS320C28020$$ROV()
    {
    }

    void TMS320C28021$$ROV()
    {
    }

    void ITMS320C28026$$ROV()
    {
    }

    void TMS320C28022$$ROV()
    {
    }

    void TMS320C28026$$ROV()
    {
    }

    void ITMS320C28027$$ROV()
    {
    }

    void TMS320C28023$$ROV()
    {
    }

    void TMS320C28027$$ROV()
    {
    }

    void TMS320C28030$$ROV()
    {
    }

    void TMS320C28031$$ROV()
    {
    }

    void ITMS320C28032$$ROV()
    {
    }

    void TMS320C28032$$ROV()
    {
    }

    void TMS320C28033$$ROV()
    {
    }

    void ITMS320C28034$$ROV()
    {
    }

    void TMS320C28034$$ROV()
    {
    }

    void TMS320C28035$$ROV()
    {
    }

    void TMS320C28044$$ROV()
    {
    }

    void ITMS320C28342$$ROV()
    {
    }

    void TMS320C28341$$ROV()
    {
    }

    void TMS320C28342$$ROV()
    {
    }

    void ITMS320C28344$$ROV()
    {
    }

    void TMS320C28343$$ROV()
    {
    }

    void TMS320C28344$$ROV()
    {
    }

    void ITMS320C28346$$ROV()
    {
    }

    void TMS320C28345$$ROV()
    {
    }

    void TMS320C28346$$ROV()
    {
    }

    void TMS320F28062$$ROV()
    {
    }

    void TMS320F28063$$ROV()
    {
    }

    void ITMS320F28065$$ROV()
    {
    }

    void TMS320F28064$$ROV()
    {
    }

    void TMS320F28065$$ROV()
    {
    }

    void TMS320F28066$$ROV()
    {
    }

    void ITMS320F28069$$ROV()
    {
    }

    void TMS320F28067$$ROV()
    {
    }

    void TMS320F28068$$ROV()
    {
    }

    void TMS320F28069$$ROV()
    {
    }

    void F28M35x$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.c2800.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.c2800"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/c2800/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.catalog.c2800"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.catalog.c2800"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.catalog.c2800"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.catalog.c2800"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.catalog.c2800"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.catalog.c2800"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.catalog.c2800", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.c2800");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.c2800.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.platform", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.c2800'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.c2800$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.c2800$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.c2800$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void ITMS320C28xx$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28xx", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28xx.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320C28xx", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("ti.catalog.c2800.ITMS320C28xx$$capsule", "ti.catalog.c2800"));
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320C28xx.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320C28xx.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320C28xx", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320C28xx");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320C2801$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C2801", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2801.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C2801", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C2801.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C2801.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C2801.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C2801$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C2801.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C2801", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C2801");
    }

    void TMS320C2802$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C2802", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2802.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C2802", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C2802.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C2802.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C2802.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C2802$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C2802.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C2802", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C2802");
    }

    void TMS320C2806$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C2806", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2806.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C2806", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C2806.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C2806.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C2806.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C2806$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C2806.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C2806", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C2806");
    }

    void TMS320C2808$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C2808", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2808.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C2808", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C2808.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C2808.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C2808.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C2808$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C2808.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C2808", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C2808");
    }

    void TMS320C2809$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C2809", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2809.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C2809", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C2809.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C2809.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C2809.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C2809$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C2809.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C2809", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C2809");
    }

    void TMS320C2810$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C2810", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2810.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C2810", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C2810.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C2810.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C2810.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C2810$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C2810.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C2810", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C2810");
    }

    void TMS320C2811$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C2811", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2811.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C2811", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C2811.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C2811.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C2811.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C2811$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C2811.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C2811", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C2811");
    }

    void TMS320C2812$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C2812", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C2812.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C2812", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C2812.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C2812.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C2812.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C2812$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C2812.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C2812", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C2812");
    }

    void TMS320C28015$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28015", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28015.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28015", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28015.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28015.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28015.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28015$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28015.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28015", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28015");
    }

    void TMS320C28016$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28016", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28016.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28016", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28016.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28016.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28016.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28016$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28016.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28016", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28016");
    }

    void TMS320C28232$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28232", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28232.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28232", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28232.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28232.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28232.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28232$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28232.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28232", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28232");
    }

    void TMS320C28234$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28234", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28234.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28234", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28234.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28234.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28234.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28234$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28234.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28234", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28234");
    }

    void TMS320C28235$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28235", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28235.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28235", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28235.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28235.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28235.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28235$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28235.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28235", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28235");
    }

    void ITMS320C283xx$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320C283xx", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C283xx.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320C283xx", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320C283xx.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320C283xx.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320C283xx", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320C283xx");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320C28332$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28332", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28332.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28332", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28332.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28332.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28332.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28332$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28332.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28332", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28332");
    }

    void TMS320C28334$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28334", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28334.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28334", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28334.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28334.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28334.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28334$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28334.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28334", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28334");
    }

    void TMS320C28335$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28335", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28335.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28335", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28335.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28335.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28335.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28335$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28335.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28335", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28335");
    }

    void TMS320C28020$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28020", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28020.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28020", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28020.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28020.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28020.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28020$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28020.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28020", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28020");
    }

    void TMS320C28021$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28021", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28021.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28021", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28021.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28021.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28021.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28021$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28021.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28021", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28021");
    }

    void ITMS320C28026$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28026", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28026.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320C28026", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320C28026.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320C28026.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320C28026.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320C28026", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320C28026");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320C28022$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28022", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28022.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28022", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28022.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28022.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28022.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28022$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28022.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28022", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28022");
    }

    void TMS320C28026$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28026", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28026.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28026", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28026.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28026.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28026.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28026$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28026.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28026", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28026");
    }

    void ITMS320C28027$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28027", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28027.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320C28027", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320C28027.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320C28027.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320C28027.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320C28027", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320C28027");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320C28023$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28023", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28023.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28023", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28023.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28023.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28023.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28023$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28023.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28023", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28023");
    }

    void TMS320C28027$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28027", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28027.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28027", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28027.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28027.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28027.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28027$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28027.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28027", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28027");
    }

    void TMS320C28030$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28030", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28030.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28030", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28030.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28030.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28030.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28030$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28030.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28030", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28030");
    }

    void TMS320C28031$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28031", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28031.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28031", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28031.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28031.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28031.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28031$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28031.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28031", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28031");
    }

    void ITMS320C28032$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28032", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28032.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320C28032", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320C28032.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320C28032.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320C28032.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320C28032", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320C28032");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320C28032$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28032", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28032.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28032", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28032.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28032.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28032.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28032$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28032.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28032", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28032");
    }

    void TMS320C28033$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28033", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28033.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28033", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28033.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28033.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28033.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28033$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28033.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28033", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28033");
    }

    void ITMS320C28034$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28034", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28034.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320C28034", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320C28034.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320C28034.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320C28034.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320C28034", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320C28034");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320C28034$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28034", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28034.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28034", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28034.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28034.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28034.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28034$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28034.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28034", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28034");
    }

    void TMS320C28035$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28035", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28035.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28035", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28035.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28035.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28035.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28035$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28035.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28035", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28035");
    }

    void TMS320C28044$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28044", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28044.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28044", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28044.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28044.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28044.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28044$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28044.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28044", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28044");
    }

    void ITMS320C28342$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28342", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28342.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320C28342", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320C28342.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320C28342.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320C28342.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320C28342", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320C28342");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320C28341$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28341", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28341.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28341", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28341.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28341.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28341.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28341$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28341.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28341", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28341");
    }

    void TMS320C28342$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28342", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28342.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28342", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28342.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28342.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28342.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28342$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28342.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28342", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28342");
    }

    void ITMS320C28344$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28344", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28344.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320C28344", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320C28344.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320C28344.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320C28344.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320C28344", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320C28344");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320C28343$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28343", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28343.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28343", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28343.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28343.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28343.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28343$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28343.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28343", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28343");
    }

    void TMS320C28344$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28344", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28344.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28344", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28344.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28344.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28344.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28344$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28344.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28344", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28344");
    }

    void ITMS320C28346$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28346", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320C28346.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320C28346", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320C28346.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320C28346.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320C28346.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320C28346", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320C28346");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320C28345$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28345", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28345.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28345", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28345.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28345.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28345.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28345$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28345.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28345", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28345");
    }

    void TMS320C28346$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320C28346", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320C28346.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320C28346", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320C28346.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320C28346.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320C28346.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320C28346$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320C28346.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320C28346", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C28346");
    }

    void TMS320F28062$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320F28062", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28062.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320F28062", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320F28062.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320F28062.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320F28062.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320F28062$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320F28062.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320F28062", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320F28062");
    }

    void TMS320F28063$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320F28063", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28063.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320F28063", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320F28063.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320F28063.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320F28063.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320F28063$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320F28063.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320F28063", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320F28063");
    }

    void ITMS320F28065$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320F28065", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320F28065.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320F28065", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320F28065.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320F28065.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320F28065.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320F28065", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320F28065");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320F28064$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320F28064", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28064.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320F28064", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320F28064.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320F28064.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320F28064.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320F28064$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320F28064.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320F28064", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320F28064");
    }

    void TMS320F28065$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320F28065", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28065.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320F28065", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320F28065.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320F28065.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320F28065.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320F28065$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320F28065.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320F28065", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320F28065");
    }

    void TMS320F28066$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320F28066", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28066.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320F28066", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320F28066.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320F28066.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320F28066.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320F28066$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320F28066.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320F28066", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320F28066");
    }

    void ITMS320F28069$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.ITMS320F28069", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.ITMS320F28069.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.ITMS320F28069", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.ITMS320F28069.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.ITMS320F28069.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.ITMS320F28069.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITMS320F28069", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITMS320F28069");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void TMS320F28067$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320F28067", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28067.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320F28067", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320F28067.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320F28067.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320F28067.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320F28067$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320F28067.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320F28067", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320F28067");
    }

    void TMS320F28068$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320F28068", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28068.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320F28068", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320F28068.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320F28068.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320F28068.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320F28068$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320F28068.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320F28068", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320F28068");
    }

    void TMS320F28069$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.TMS320F28069", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.TMS320F28069.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.TMS320F28069", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.TMS320F28069.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.TMS320F28069.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.TMS320F28069.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.TMS320F28069$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.TMS320F28069.Object", "ti.catalog.c2800"));
        pkgV.bind("TMS320F28069", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320F28069");
    }

    void F28M35x$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c2800.F28M35x", "ti.catalog.c2800");
        po = (Proto.Obj)om.findStrict("ti.catalog.c2800.F28M35x.Module", "ti.catalog.c2800");
        vo.init2(po, "ti.catalog.c2800.F28M35x", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.c2800.F28M35x.Instance", "ti.catalog.c2800"));
        vo.bind("Params", om.findStrict("ti.catalog.c2800.F28M35x.Params", "ti.catalog.c2800"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c2800.F28M35x.Params", "ti.catalog.c2800")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c2800", "ti.catalog.c2800"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog.c2800");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c2800")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c2800.F28M35x$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c2800.F28M35x.Object", "ti.catalog.c2800"));
        pkgV.bind("F28M35x", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("F28M35x");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C2801", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C2802", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C2806", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C2808", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C2809", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C2810", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C2811", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C2812", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28015", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28016", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28232", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28234", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28235", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28332", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28334", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28335", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28020", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28021", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28022", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28026", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28023", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28027", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28030", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28031", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28032", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28033", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28034", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28035", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28044", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28341", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28342", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28343", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28344", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28345", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320C28346", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320F28062", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320F28063", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320F28064", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320F28065", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320F28066", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320F28067", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320F28068", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.TMS320F28069", "ti.catalog.c2800"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c2800.F28M35x", "ti.catalog.c2800"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320C28xx")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C2801")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C2802")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C2806")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C2808")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C2809")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C2810")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C2811")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C2812")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28015")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28016")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28232")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28234")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28235")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320C283xx")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28332")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28334")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28335")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28020")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28021")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320C28026")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28022")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28026")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320C28027")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28023")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28027")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28030")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28031")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320C28032")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28032")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28033")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320C28034")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28034")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28035")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28044")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320C28342")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28341")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28342")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320C28344")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28343")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28344")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320C28346")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28345")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320C28346")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320F28062")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320F28063")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320F28065")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320F28064")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320F28065")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320F28066")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.ITMS320F28069")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320F28067")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320F28068")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.TMS320F28069")).bless();
        ((Value.Obj)om.getv("ti.catalog.c2800.F28M35x")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.c2800")).add(pkgV);
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
        ITMS320C28xx$$OBJECTS();
        TMS320C2801$$OBJECTS();
        TMS320C2802$$OBJECTS();
        TMS320C2806$$OBJECTS();
        TMS320C2808$$OBJECTS();
        TMS320C2809$$OBJECTS();
        TMS320C2810$$OBJECTS();
        TMS320C2811$$OBJECTS();
        TMS320C2812$$OBJECTS();
        TMS320C28015$$OBJECTS();
        TMS320C28016$$OBJECTS();
        TMS320C28232$$OBJECTS();
        TMS320C28234$$OBJECTS();
        TMS320C28235$$OBJECTS();
        ITMS320C283xx$$OBJECTS();
        TMS320C28332$$OBJECTS();
        TMS320C28334$$OBJECTS();
        TMS320C28335$$OBJECTS();
        TMS320C28020$$OBJECTS();
        TMS320C28021$$OBJECTS();
        ITMS320C28026$$OBJECTS();
        TMS320C28022$$OBJECTS();
        TMS320C28026$$OBJECTS();
        ITMS320C28027$$OBJECTS();
        TMS320C28023$$OBJECTS();
        TMS320C28027$$OBJECTS();
        TMS320C28030$$OBJECTS();
        TMS320C28031$$OBJECTS();
        ITMS320C28032$$OBJECTS();
        TMS320C28032$$OBJECTS();
        TMS320C28033$$OBJECTS();
        ITMS320C28034$$OBJECTS();
        TMS320C28034$$OBJECTS();
        TMS320C28035$$OBJECTS();
        TMS320C28044$$OBJECTS();
        ITMS320C28342$$OBJECTS();
        TMS320C28341$$OBJECTS();
        TMS320C28342$$OBJECTS();
        ITMS320C28344$$OBJECTS();
        TMS320C28343$$OBJECTS();
        TMS320C28344$$OBJECTS();
        ITMS320C28346$$OBJECTS();
        TMS320C28345$$OBJECTS();
        TMS320C28346$$OBJECTS();
        TMS320F28062$$OBJECTS();
        TMS320F28063$$OBJECTS();
        ITMS320F28065$$OBJECTS();
        TMS320F28064$$OBJECTS();
        TMS320F28065$$OBJECTS();
        TMS320F28066$$OBJECTS();
        ITMS320F28069$$OBJECTS();
        TMS320F28067$$OBJECTS();
        TMS320F28068$$OBJECTS();
        TMS320F28069$$OBJECTS();
        F28M35x$$OBJECTS();
        ITMS320C28xx$$CONSTS();
        TMS320C2801$$CONSTS();
        TMS320C2802$$CONSTS();
        TMS320C2806$$CONSTS();
        TMS320C2808$$CONSTS();
        TMS320C2809$$CONSTS();
        TMS320C2810$$CONSTS();
        TMS320C2811$$CONSTS();
        TMS320C2812$$CONSTS();
        TMS320C28015$$CONSTS();
        TMS320C28016$$CONSTS();
        TMS320C28232$$CONSTS();
        TMS320C28234$$CONSTS();
        TMS320C28235$$CONSTS();
        ITMS320C283xx$$CONSTS();
        TMS320C28332$$CONSTS();
        TMS320C28334$$CONSTS();
        TMS320C28335$$CONSTS();
        TMS320C28020$$CONSTS();
        TMS320C28021$$CONSTS();
        ITMS320C28026$$CONSTS();
        TMS320C28022$$CONSTS();
        TMS320C28026$$CONSTS();
        ITMS320C28027$$CONSTS();
        TMS320C28023$$CONSTS();
        TMS320C28027$$CONSTS();
        TMS320C28030$$CONSTS();
        TMS320C28031$$CONSTS();
        ITMS320C28032$$CONSTS();
        TMS320C28032$$CONSTS();
        TMS320C28033$$CONSTS();
        ITMS320C28034$$CONSTS();
        TMS320C28034$$CONSTS();
        TMS320C28035$$CONSTS();
        TMS320C28044$$CONSTS();
        ITMS320C28342$$CONSTS();
        TMS320C28341$$CONSTS();
        TMS320C28342$$CONSTS();
        ITMS320C28344$$CONSTS();
        TMS320C28343$$CONSTS();
        TMS320C28344$$CONSTS();
        ITMS320C28346$$CONSTS();
        TMS320C28345$$CONSTS();
        TMS320C28346$$CONSTS();
        TMS320F28062$$CONSTS();
        TMS320F28063$$CONSTS();
        ITMS320F28065$$CONSTS();
        TMS320F28064$$CONSTS();
        TMS320F28065$$CONSTS();
        TMS320F28066$$CONSTS();
        ITMS320F28069$$CONSTS();
        TMS320F28067$$CONSTS();
        TMS320F28068$$CONSTS();
        TMS320F28069$$CONSTS();
        F28M35x$$CONSTS();
        ITMS320C28xx$$CREATES();
        TMS320C2801$$CREATES();
        TMS320C2802$$CREATES();
        TMS320C2806$$CREATES();
        TMS320C2808$$CREATES();
        TMS320C2809$$CREATES();
        TMS320C2810$$CREATES();
        TMS320C2811$$CREATES();
        TMS320C2812$$CREATES();
        TMS320C28015$$CREATES();
        TMS320C28016$$CREATES();
        TMS320C28232$$CREATES();
        TMS320C28234$$CREATES();
        TMS320C28235$$CREATES();
        ITMS320C283xx$$CREATES();
        TMS320C28332$$CREATES();
        TMS320C28334$$CREATES();
        TMS320C28335$$CREATES();
        TMS320C28020$$CREATES();
        TMS320C28021$$CREATES();
        ITMS320C28026$$CREATES();
        TMS320C28022$$CREATES();
        TMS320C28026$$CREATES();
        ITMS320C28027$$CREATES();
        TMS320C28023$$CREATES();
        TMS320C28027$$CREATES();
        TMS320C28030$$CREATES();
        TMS320C28031$$CREATES();
        ITMS320C28032$$CREATES();
        TMS320C28032$$CREATES();
        TMS320C28033$$CREATES();
        ITMS320C28034$$CREATES();
        TMS320C28034$$CREATES();
        TMS320C28035$$CREATES();
        TMS320C28044$$CREATES();
        ITMS320C28342$$CREATES();
        TMS320C28341$$CREATES();
        TMS320C28342$$CREATES();
        ITMS320C28344$$CREATES();
        TMS320C28343$$CREATES();
        TMS320C28344$$CREATES();
        ITMS320C28346$$CREATES();
        TMS320C28345$$CREATES();
        TMS320C28346$$CREATES();
        TMS320F28062$$CREATES();
        TMS320F28063$$CREATES();
        ITMS320F28065$$CREATES();
        TMS320F28064$$CREATES();
        TMS320F28065$$CREATES();
        TMS320F28066$$CREATES();
        ITMS320F28069$$CREATES();
        TMS320F28067$$CREATES();
        TMS320F28068$$CREATES();
        TMS320F28069$$CREATES();
        F28M35x$$CREATES();
        ITMS320C28xx$$FUNCTIONS();
        TMS320C2801$$FUNCTIONS();
        TMS320C2802$$FUNCTIONS();
        TMS320C2806$$FUNCTIONS();
        TMS320C2808$$FUNCTIONS();
        TMS320C2809$$FUNCTIONS();
        TMS320C2810$$FUNCTIONS();
        TMS320C2811$$FUNCTIONS();
        TMS320C2812$$FUNCTIONS();
        TMS320C28015$$FUNCTIONS();
        TMS320C28016$$FUNCTIONS();
        TMS320C28232$$FUNCTIONS();
        TMS320C28234$$FUNCTIONS();
        TMS320C28235$$FUNCTIONS();
        ITMS320C283xx$$FUNCTIONS();
        TMS320C28332$$FUNCTIONS();
        TMS320C28334$$FUNCTIONS();
        TMS320C28335$$FUNCTIONS();
        TMS320C28020$$FUNCTIONS();
        TMS320C28021$$FUNCTIONS();
        ITMS320C28026$$FUNCTIONS();
        TMS320C28022$$FUNCTIONS();
        TMS320C28026$$FUNCTIONS();
        ITMS320C28027$$FUNCTIONS();
        TMS320C28023$$FUNCTIONS();
        TMS320C28027$$FUNCTIONS();
        TMS320C28030$$FUNCTIONS();
        TMS320C28031$$FUNCTIONS();
        ITMS320C28032$$FUNCTIONS();
        TMS320C28032$$FUNCTIONS();
        TMS320C28033$$FUNCTIONS();
        ITMS320C28034$$FUNCTIONS();
        TMS320C28034$$FUNCTIONS();
        TMS320C28035$$FUNCTIONS();
        TMS320C28044$$FUNCTIONS();
        ITMS320C28342$$FUNCTIONS();
        TMS320C28341$$FUNCTIONS();
        TMS320C28342$$FUNCTIONS();
        ITMS320C28344$$FUNCTIONS();
        TMS320C28343$$FUNCTIONS();
        TMS320C28344$$FUNCTIONS();
        ITMS320C28346$$FUNCTIONS();
        TMS320C28345$$FUNCTIONS();
        TMS320C28346$$FUNCTIONS();
        TMS320F28062$$FUNCTIONS();
        TMS320F28063$$FUNCTIONS();
        ITMS320F28065$$FUNCTIONS();
        TMS320F28064$$FUNCTIONS();
        TMS320F28065$$FUNCTIONS();
        TMS320F28066$$FUNCTIONS();
        ITMS320F28069$$FUNCTIONS();
        TMS320F28067$$FUNCTIONS();
        TMS320F28068$$FUNCTIONS();
        TMS320F28069$$FUNCTIONS();
        F28M35x$$FUNCTIONS();
        ITMS320C28xx$$SIZES();
        TMS320C2801$$SIZES();
        TMS320C2802$$SIZES();
        TMS320C2806$$SIZES();
        TMS320C2808$$SIZES();
        TMS320C2809$$SIZES();
        TMS320C2810$$SIZES();
        TMS320C2811$$SIZES();
        TMS320C2812$$SIZES();
        TMS320C28015$$SIZES();
        TMS320C28016$$SIZES();
        TMS320C28232$$SIZES();
        TMS320C28234$$SIZES();
        TMS320C28235$$SIZES();
        ITMS320C283xx$$SIZES();
        TMS320C28332$$SIZES();
        TMS320C28334$$SIZES();
        TMS320C28335$$SIZES();
        TMS320C28020$$SIZES();
        TMS320C28021$$SIZES();
        ITMS320C28026$$SIZES();
        TMS320C28022$$SIZES();
        TMS320C28026$$SIZES();
        ITMS320C28027$$SIZES();
        TMS320C28023$$SIZES();
        TMS320C28027$$SIZES();
        TMS320C28030$$SIZES();
        TMS320C28031$$SIZES();
        ITMS320C28032$$SIZES();
        TMS320C28032$$SIZES();
        TMS320C28033$$SIZES();
        ITMS320C28034$$SIZES();
        TMS320C28034$$SIZES();
        TMS320C28035$$SIZES();
        TMS320C28044$$SIZES();
        ITMS320C28342$$SIZES();
        TMS320C28341$$SIZES();
        TMS320C28342$$SIZES();
        ITMS320C28344$$SIZES();
        TMS320C28343$$SIZES();
        TMS320C28344$$SIZES();
        ITMS320C28346$$SIZES();
        TMS320C28345$$SIZES();
        TMS320C28346$$SIZES();
        TMS320F28062$$SIZES();
        TMS320F28063$$SIZES();
        ITMS320F28065$$SIZES();
        TMS320F28064$$SIZES();
        TMS320F28065$$SIZES();
        TMS320F28066$$SIZES();
        ITMS320F28069$$SIZES();
        TMS320F28067$$SIZES();
        TMS320F28068$$SIZES();
        TMS320F28069$$SIZES();
        F28M35x$$SIZES();
        ITMS320C28xx$$TYPES();
        TMS320C2801$$TYPES();
        TMS320C2802$$TYPES();
        TMS320C2806$$TYPES();
        TMS320C2808$$TYPES();
        TMS320C2809$$TYPES();
        TMS320C2810$$TYPES();
        TMS320C2811$$TYPES();
        TMS320C2812$$TYPES();
        TMS320C28015$$TYPES();
        TMS320C28016$$TYPES();
        TMS320C28232$$TYPES();
        TMS320C28234$$TYPES();
        TMS320C28235$$TYPES();
        ITMS320C283xx$$TYPES();
        TMS320C28332$$TYPES();
        TMS320C28334$$TYPES();
        TMS320C28335$$TYPES();
        TMS320C28020$$TYPES();
        TMS320C28021$$TYPES();
        ITMS320C28026$$TYPES();
        TMS320C28022$$TYPES();
        TMS320C28026$$TYPES();
        ITMS320C28027$$TYPES();
        TMS320C28023$$TYPES();
        TMS320C28027$$TYPES();
        TMS320C28030$$TYPES();
        TMS320C28031$$TYPES();
        ITMS320C28032$$TYPES();
        TMS320C28032$$TYPES();
        TMS320C28033$$TYPES();
        ITMS320C28034$$TYPES();
        TMS320C28034$$TYPES();
        TMS320C28035$$TYPES();
        TMS320C28044$$TYPES();
        ITMS320C28342$$TYPES();
        TMS320C28341$$TYPES();
        TMS320C28342$$TYPES();
        ITMS320C28344$$TYPES();
        TMS320C28343$$TYPES();
        TMS320C28344$$TYPES();
        ITMS320C28346$$TYPES();
        TMS320C28345$$TYPES();
        TMS320C28346$$TYPES();
        TMS320F28062$$TYPES();
        TMS320F28063$$TYPES();
        ITMS320F28065$$TYPES();
        TMS320F28064$$TYPES();
        TMS320F28065$$TYPES();
        TMS320F28066$$TYPES();
        ITMS320F28069$$TYPES();
        TMS320F28067$$TYPES();
        TMS320F28068$$TYPES();
        TMS320F28069$$TYPES();
        F28M35x$$TYPES();
        if (isROV) {
            ITMS320C28xx$$ROV();
            TMS320C2801$$ROV();
            TMS320C2802$$ROV();
            TMS320C2806$$ROV();
            TMS320C2808$$ROV();
            TMS320C2809$$ROV();
            TMS320C2810$$ROV();
            TMS320C2811$$ROV();
            TMS320C2812$$ROV();
            TMS320C28015$$ROV();
            TMS320C28016$$ROV();
            TMS320C28232$$ROV();
            TMS320C28234$$ROV();
            TMS320C28235$$ROV();
            ITMS320C283xx$$ROV();
            TMS320C28332$$ROV();
            TMS320C28334$$ROV();
            TMS320C28335$$ROV();
            TMS320C28020$$ROV();
            TMS320C28021$$ROV();
            ITMS320C28026$$ROV();
            TMS320C28022$$ROV();
            TMS320C28026$$ROV();
            ITMS320C28027$$ROV();
            TMS320C28023$$ROV();
            TMS320C28027$$ROV();
            TMS320C28030$$ROV();
            TMS320C28031$$ROV();
            ITMS320C28032$$ROV();
            TMS320C28032$$ROV();
            TMS320C28033$$ROV();
            ITMS320C28034$$ROV();
            TMS320C28034$$ROV();
            TMS320C28035$$ROV();
            TMS320C28044$$ROV();
            ITMS320C28342$$ROV();
            TMS320C28341$$ROV();
            TMS320C28342$$ROV();
            ITMS320C28344$$ROV();
            TMS320C28343$$ROV();
            TMS320C28344$$ROV();
            ITMS320C28346$$ROV();
            TMS320C28345$$ROV();
            TMS320C28346$$ROV();
            TMS320F28062$$ROV();
            TMS320F28063$$ROV();
            ITMS320F28065$$ROV();
            TMS320F28064$$ROV();
            TMS320F28065$$ROV();
            TMS320F28066$$ROV();
            ITMS320F28069$$ROV();
            TMS320F28067$$ROV();
            TMS320F28068$$ROV();
            TMS320F28069$$ROV();
            F28M35x$$ROV();
        }//isROV
        $$SINGLETONS();
        ITMS320C28xx$$SINGLETONS();
        TMS320C2801$$SINGLETONS();
        TMS320C2802$$SINGLETONS();
        TMS320C2806$$SINGLETONS();
        TMS320C2808$$SINGLETONS();
        TMS320C2809$$SINGLETONS();
        TMS320C2810$$SINGLETONS();
        TMS320C2811$$SINGLETONS();
        TMS320C2812$$SINGLETONS();
        TMS320C28015$$SINGLETONS();
        TMS320C28016$$SINGLETONS();
        TMS320C28232$$SINGLETONS();
        TMS320C28234$$SINGLETONS();
        TMS320C28235$$SINGLETONS();
        ITMS320C283xx$$SINGLETONS();
        TMS320C28332$$SINGLETONS();
        TMS320C28334$$SINGLETONS();
        TMS320C28335$$SINGLETONS();
        TMS320C28020$$SINGLETONS();
        TMS320C28021$$SINGLETONS();
        ITMS320C28026$$SINGLETONS();
        TMS320C28022$$SINGLETONS();
        TMS320C28026$$SINGLETONS();
        ITMS320C28027$$SINGLETONS();
        TMS320C28023$$SINGLETONS();
        TMS320C28027$$SINGLETONS();
        TMS320C28030$$SINGLETONS();
        TMS320C28031$$SINGLETONS();
        ITMS320C28032$$SINGLETONS();
        TMS320C28032$$SINGLETONS();
        TMS320C28033$$SINGLETONS();
        ITMS320C28034$$SINGLETONS();
        TMS320C28034$$SINGLETONS();
        TMS320C28035$$SINGLETONS();
        TMS320C28044$$SINGLETONS();
        ITMS320C28342$$SINGLETONS();
        TMS320C28341$$SINGLETONS();
        TMS320C28342$$SINGLETONS();
        ITMS320C28344$$SINGLETONS();
        TMS320C28343$$SINGLETONS();
        TMS320C28344$$SINGLETONS();
        ITMS320C28346$$SINGLETONS();
        TMS320C28345$$SINGLETONS();
        TMS320C28346$$SINGLETONS();
        TMS320F28062$$SINGLETONS();
        TMS320F28063$$SINGLETONS();
        ITMS320F28065$$SINGLETONS();
        TMS320F28064$$SINGLETONS();
        TMS320F28065$$SINGLETONS();
        TMS320F28066$$SINGLETONS();
        ITMS320F28069$$SINGLETONS();
        TMS320F28067$$SINGLETONS();
        TMS320F28068$$SINGLETONS();
        TMS320F28069$$SINGLETONS();
        F28M35x$$SINGLETONS();
        $$INITIALIZATION();
    }
}
