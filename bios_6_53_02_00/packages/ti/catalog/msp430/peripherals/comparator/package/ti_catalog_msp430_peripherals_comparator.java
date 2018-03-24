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

public class ti_catalog_msp430_peripherals_comparator
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
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.comparator", new Value.Obj("ti.catalog.msp430.peripherals.comparator", pkgP));
    }

    void IComparator$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.IComparator", new Value.Obj("ti.catalog.msp430.peripherals.comparator.IComparator", po));
        pkgV.bind("IComparator", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.IComparator$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.IComparator$$regIntVect_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.IComparator$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.IComparator$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.Params", new Proto.Str(po, true));
    }

    void Comparator_Aplus$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus", new Value.Obj("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus", po));
        pkgV.bind("Comparator_Aplus", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAEX_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CARSEL_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAREF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAON_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAIES_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAIE_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CASHORT_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.P2CA4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.P2CA3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.P2CA2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.P2CA1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.P2CA0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD7_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD6_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD5_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$CACTL1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$CACTL2_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL2_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$CAPD_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Params", new Proto.Str(po, true));
    }

    void Comparator_D$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D", new Value.Obj("ti.catalog.msp430.peripherals.comparator.Comparator_D", po));
        pkgV.bind("Comparator_D", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAEX_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CARSEL_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAREF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAON_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAIES_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAIE_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CASHORT_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.P2CA4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.P2CA3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.P2CA2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.P2CA1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.P2CA0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAPD7_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAPD6_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAPD5_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAPD4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAPD3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAPD2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAPD1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CAPD0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$CDIEALL_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIEALL_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$CDIFGALL_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFGALL_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.Params", new Proto.Str(po, true));
    }

    void Comparator_E$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E", new Value.Obj("ti.catalog.msp430.peripherals.comparator.Comparator_E", po));
        pkgV.bind("Comparator_E", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAEX_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CARSEL_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAREF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAON_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAIES_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAIE_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CASHORT_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.P2CA4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.P2CA3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.P2CA2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.P2CA1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.P2CA0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAPD7_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAPD6_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAPD5_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAPD4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAPD3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAPD2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAPD1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.CAPD0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E.Params", new Proto.Str(po, true));
    }

    void IComparator$$CONSTS()
    {
        // interface IComparator
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAEX", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_1", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_2", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_3", xdc.services.intern.xsr.Enum.intValue(0x0030L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAON_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAON", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAON", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAIES", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAIE", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAF_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAF", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
    }

    void Comparator_Aplus$$CONSTS()
    {
        // module Comparator_Aplus
    }

    void Comparator_D$$CONSTS()
    {
        // module Comparator_D
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE", xdc.services.intern.xsr.Enum.intValue(0x0200L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_t", "ti.catalog.msp430.peripherals.comparator"), "ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
    }

    void Comparator_E$$CONSTS()
    {
        // module Comparator_E
    }

    void IComparator$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Comparator_Aplus$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Module", "ti.catalog.msp430.peripherals.comparator"), om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Instance", "ti.catalog.msp430.peripherals.comparator"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Params", "ti.catalog.msp430.peripherals.comparator"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$comparator$Comparator_Aplus$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.comparator.Comparator_Aplus'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.comparator']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Module", "ti.catalog.msp430.peripherals.comparator"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$Object", "ti.catalog.msp430.peripherals.comparator"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Params", "ti.catalog.msp430.peripherals.comparator"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$comparator$Comparator_Aplus$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.comparator.Comparator_Aplus'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Comparator_D$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Module", "ti.catalog.msp430.peripherals.comparator"), om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Instance", "ti.catalog.msp430.peripherals.comparator"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Params", "ti.catalog.msp430.peripherals.comparator"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$comparator$Comparator_D$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.comparator.Comparator_D'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.comparator.Comparator_D.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.comparator']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Module", "ti.catalog.msp430.peripherals.comparator"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D$$Object", "ti.catalog.msp430.peripherals.comparator"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Params", "ti.catalog.msp430.peripherals.comparator"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$comparator$Comparator_D$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.comparator.Comparator_D'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Comparator_E$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Module", "ti.catalog.msp430.peripherals.comparator"), om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Instance", "ti.catalog.msp430.peripherals.comparator"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Params", "ti.catalog.msp430.peripherals.comparator"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$comparator$Comparator_E$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.comparator.Comparator_E'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.comparator.Comparator_E.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.comparator']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Module", "ti.catalog.msp430.peripherals.comparator"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E$$Object", "ti.catalog.msp430.peripherals.comparator"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Params", "ti.catalog.msp430.peripherals.comparator"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$comparator$Comparator_E$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.comparator.Comparator_E'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IComparator$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Comparator_Aplus$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Comparator_D$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Comparator_E$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IComparator$$SIZES()
    {
    }

    void Comparator_Aplus$$SIZES()
    {
    }

    void Comparator_D$$SIZES()
    {
    }

    void Comparator_E$$SIZES()
    {
    }

    void IComparator$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Module", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.IComparator.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Instance", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.IComparator.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator$$Params", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.IComparator.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        // struct IComparator.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
        // struct IComparator.regIntVect_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator$$regIntVect_t", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("registerName", $$T_Str, $$UNDEF, "w");
                po.addFld("registerDescription", $$T_Str, $$UNDEF, "w");
                po.addFld("isrToggleString", $$T_Str, $$UNDEF, "w");
                po.addFld("priorityName", $$T_Str, $$UNDEF, "w");
                po.addFld("interruptEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("interruptHandler", $$T_Bool, $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
    }

    void Comparator_Aplus$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/comparator/Comparator_Aplus.xs");
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Module", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Module", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Module", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$create", "ti.catalog.msp430.peripherals.comparator"), Global.get("ti$catalog$msp430$peripherals$comparator$Comparator_Aplus$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$construct", "ti.catalog.msp430.peripherals.comparator"), Global.get("ti$catalog$msp430$peripherals$comparator$Comparator_Aplus$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.comparator"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.comparator"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.comparator"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Instance", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Instance", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Instance", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("CACTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL1_t", "ti.catalog.msp430.peripherals.comparator"), Global.newObject("CAEX", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_OFF"), "CARSEL", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_OFF"), "CAREF", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_0"), "CAON", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_OFF"), "CAIES", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_OFF"), "CAIE", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_OFF"), "CAIFG", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_OFF")), "wh");
        po.addFld("CACTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL2_t", "ti.catalog.msp430.peripherals.comparator"), Global.newObject("CASHORT", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_OFF"), "P2CA4", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_OFF"), "P2CA3", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_OFF"), "P2CA2", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_OFF"), "P2CA1", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_OFF"), "P2CA0", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_OFF"), "CAF", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_OFF")), "wh");
        po.addFld("CAPD", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD_t", "ti.catalog.msp430.peripherals.comparator"), Global.newObject("CAPD7", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_OFF"), "CAPD6", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_OFF"), "CAPD5", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_OFF"), "CAPD4", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_OFF"), "CAPD3", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_OFF"), "CAPD2", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_OFF"), "CAPD1", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_OFF"), "CAPD0", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_OFF")), "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"), false, xdc.services.intern.xsr.Enum.intValue(1L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"), false), Global.newArray(new Object[]{Global.newObject("register", "CACTL1", "regForceSet", false), Global.newObject("register", "CACTL2", "regForceSet", false), Global.newObject("register", "CAPD", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$Params", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Params", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator$$Params", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("CACTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL1_t", "ti.catalog.msp430.peripherals.comparator"), Global.newObject("CAEX", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_OFF"), "CARSEL", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_OFF"), "CAREF", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_0"), "CAON", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_OFF"), "CAIES", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_OFF"), "CAIE", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_OFF"), "CAIFG", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_OFF")), "wh");
        po.addFld("CACTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL2_t", "ti.catalog.msp430.peripherals.comparator"), Global.newObject("CASHORT", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_OFF"), "P2CA4", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_OFF"), "P2CA3", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_OFF"), "P2CA2", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_OFF"), "P2CA1", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_OFF"), "P2CA0", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_OFF"), "CAF", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_OFF")), "wh");
        po.addFld("CAPD", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD_t", "ti.catalog.msp430.peripherals.comparator"), Global.newObject("CAPD7", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_OFF"), "CAPD6", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_OFF"), "CAPD5", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_OFF"), "CAPD4", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_OFF"), "CAPD3", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_OFF"), "CAPD2", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_OFF"), "CAPD1", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_OFF"), "CAPD0", om.find("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_OFF")), "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"), false, xdc.services.intern.xsr.Enum.intValue(1L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"), false), Global.newArray(new Object[]{Global.newObject("register", "CACTL1", "regForceSet", false), Global.newObject("register", "CACTL2", "regForceSet", false), Global.newObject("register", "CAPD", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$Object", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Object", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Instance", "ti.catalog.msp430.peripherals.comparator"));
        // struct Comparator_Aplus.CACTL1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$CACTL1_t", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("CAEX", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAEX_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CARSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CARSEL_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAREF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAREF_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAON", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAON_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAIES", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAIES_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAIE_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAIFG_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
        // struct Comparator_Aplus.CACTL2_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$CACTL2_t", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL2_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("CASHORT", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CASHORT_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("P2CA4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.P2CA4_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("P2CA3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.P2CA3_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("P2CA2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.P2CA2_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("P2CA1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.P2CA1_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("P2CA0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.P2CA0_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAF_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
        // struct Comparator_Aplus.CAPD_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$CAPD_t", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("CAPD7", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD7_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAPD6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD6_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAPD5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD5_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAPD4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD4_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAPD3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD3_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAPD2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD2_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAPD1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD1_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CAPD0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD0_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
    }

    void Comparator_D$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/comparator/Comparator_D.xs");
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Module", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_D.Module", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Module", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D$$create", "ti.catalog.msp430.peripherals.comparator"), Global.get("ti$catalog$msp430$peripherals$comparator$Comparator_D$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D$$construct", "ti.catalog.msp430.peripherals.comparator"), Global.get("ti$catalog$msp430$peripherals$comparator$Comparator_D$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_D$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.comparator"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.comparator"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.comparator"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Instance", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_D.Instance", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Instance", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "wh");
        po.addFld("CDIEALL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIEALL_t", "ti.catalog.msp430.peripherals.comparator"), Global.newObject("CDIE", om.find("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_OFF"), "CDIIE", om.find("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_OFF")), "wh");
        po.addFld("CDIFGALL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFGALL_t", "ti.catalog.msp430.peripherals.comparator"), Global.newObject("CDIFG", om.find("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_OFF"), "CDIIFG", om.find("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"), false), Global.newArray(new Object[]{Global.newObject("register", "CDIEALL", "regForceSet", false), Global.newObject("register", "CDIFGALL", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D$$Params", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_D.Params", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator$$Params", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "wh");
        po.addFld("CDIEALL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIEALL_t", "ti.catalog.msp430.peripherals.comparator"), Global.newObject("CDIE", om.find("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_OFF"), "CDIIE", om.find("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_OFF")), "wh");
        po.addFld("CDIFGALL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFGALL_t", "ti.catalog.msp430.peripherals.comparator"), Global.newObject("CDIFG", om.find("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_OFF"), "CDIIFG", om.find("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"), false), Global.newArray(new Object[]{Global.newObject("register", "CDIEALL", "regForceSet", false), Global.newObject("register", "CDIFGALL", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D$$Object", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_D.Object", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Instance", "ti.catalog.msp430.peripherals.comparator"));
        // struct Comparator_D.CDIEALL_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D$$CDIEALL_t", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIEALL_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("CDIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CDIIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
        // struct Comparator_D.CDIFGALL_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D$$CDIFGALL_t", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFGALL_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("CDIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
                po.addFld("CDIIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_t", "ti.catalog.msp430.peripherals.comparator"), $$UNDEF, "w");
    }

    void Comparator_E$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/comparator/Comparator_E.xs");
        om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Module", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_E.Module", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Module", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E$$create", "ti.catalog.msp430.peripherals.comparator"), Global.get("ti$catalog$msp430$peripherals$comparator$Comparator_E$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E$$construct", "ti.catalog.msp430.peripherals.comparator"), Global.get("ti$catalog$msp430$peripherals$comparator$Comparator_E$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.comparator.Comparator_E$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.comparator"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.comparator"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.comparator"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Instance", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_E.Instance", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Instance", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"), false), Global.newArray(new Object[]{}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E$$Params", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_E.Params", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator$$Params", "ti.catalog.msp430.peripherals.comparator"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"), false), Global.newArray(new Object[]{}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E$$Object", "ti.catalog.msp430.peripherals.comparator");
        po.init("ti.catalog.msp430.peripherals.comparator.Comparator_E.Object", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Instance", "ti.catalog.msp430.peripherals.comparator"));
    }

    void IComparator$$ROV()
    {
    }

    void Comparator_Aplus$$ROV()
    {
    }

    void Comparator_D$$ROV()
    {
    }

    void Comparator_E$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.comparator.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.comparator"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.comparator", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.comparator");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.comparator.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.comparator'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.comparator$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.comparator$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.comparator$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IComparator$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator", "ti.catalog.msp430.peripherals.comparator");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Module", "ti.catalog.msp430.peripherals.comparator");
        vo.init2(po, "ti.catalog.msp430.peripherals.comparator.IComparator", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Instance", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Params", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.Params", "ti.catalog.msp430.peripherals.comparator")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.comparator", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IComparator", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IComparator");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void Comparator_Aplus$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus", "ti.catalog.msp430.peripherals.comparator");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Module", "ti.catalog.msp430.peripherals.comparator");
        vo.init2(po, "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$capsule", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Instance", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Params", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Params", "ti.catalog.msp430.peripherals.comparator")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.comparator", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CACTL1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL1_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL1_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CACTL2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL2_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CACTL2_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.CAPD_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.comparator");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.comparator")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus.Object", "ti.catalog.msp430.peripherals.comparator"));
        pkgV.bind("Comparator_Aplus", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Comparator_Aplus");
    }

    void Comparator_D$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D", "ti.catalog.msp430.peripherals.comparator");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Module", "ti.catalog.msp430.peripherals.comparator");
        vo.init2(po, "ti.catalog.msp430.peripherals.comparator.Comparator_D", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D$$capsule", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Instance", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Params", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Params", "ti.catalog.msp430.peripherals.comparator")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.comparator", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIE_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIIE_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIFG_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIIFG_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIEALL_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIEALL_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIEALL_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIFGALL_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFGALL_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFGALL_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIE", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIE", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIIE", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIE", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIFG", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIFG", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CDIIFG", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.CDIIFG", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.comparator");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.comparator")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.comparator.Comparator_D$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D.Object", "ti.catalog.msp430.peripherals.comparator"));
        pkgV.bind("Comparator_D", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Comparator_D");
    }

    void Comparator_E$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E", "ti.catalog.msp430.peripherals.comparator");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Module", "ti.catalog.msp430.peripherals.comparator");
        vo.init2(po, "ti.catalog.msp430.peripherals.comparator.Comparator_E", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E$$capsule", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Instance", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Params", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Params", "ti.catalog.msp430.peripherals.comparator")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.comparator", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.regIntVect_t", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAEX", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAEX", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CARSEL", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CARSEL", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAREF_3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAREF_3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAON", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAON", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIES", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIES", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIE", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIE", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAIFG", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAIFG", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CASHORT", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CASHORT", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA4", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA4", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("P2CA0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.P2CA0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD7", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD7", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD6", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD6", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD5", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD5", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD4", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD4", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD3", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD3", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD2", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD2", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD1", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD1", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0_OFF", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0_OFF", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("CAPD0", om.findStrict("ti.catalog.msp430.peripherals.comparator.IComparator.CAPD0", "ti.catalog.msp430.peripherals.comparator"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.comparator");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.comparator")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.comparator.Comparator_E$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E.Object", "ti.catalog.msp430.peripherals.comparator"));
        pkgV.bind("Comparator_E", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Comparator_E");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus", "ti.catalog.msp430.peripherals.comparator"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_D", "ti.catalog.msp430.peripherals.comparator"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.comparator.Comparator_E", "ti.catalog.msp430.peripherals.comparator"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.comparator.IComparator")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.comparator.Comparator_Aplus")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.comparator.Comparator_D")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.comparator.Comparator_E")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.comparator")).add(pkgV);
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
        IComparator$$OBJECTS();
        Comparator_Aplus$$OBJECTS();
        Comparator_D$$OBJECTS();
        Comparator_E$$OBJECTS();
        IComparator$$CONSTS();
        Comparator_Aplus$$CONSTS();
        Comparator_D$$CONSTS();
        Comparator_E$$CONSTS();
        IComparator$$CREATES();
        Comparator_Aplus$$CREATES();
        Comparator_D$$CREATES();
        Comparator_E$$CREATES();
        IComparator$$FUNCTIONS();
        Comparator_Aplus$$FUNCTIONS();
        Comparator_D$$FUNCTIONS();
        Comparator_E$$FUNCTIONS();
        IComparator$$SIZES();
        Comparator_Aplus$$SIZES();
        Comparator_D$$SIZES();
        Comparator_E$$SIZES();
        IComparator$$TYPES();
        Comparator_Aplus$$TYPES();
        Comparator_D$$TYPES();
        Comparator_E$$TYPES();
        if (isROV) {
            IComparator$$ROV();
            Comparator_Aplus$$ROV();
            Comparator_D$$ROV();
            Comparator_E$$ROV();
        }//isROV
        $$SINGLETONS();
        IComparator$$SINGLETONS();
        Comparator_Aplus$$SINGLETONS();
        Comparator_D$$SINGLETONS();
        Comparator_E$$SINGLETONS();
        $$INITIALIZATION();
    }
}
