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

public class ti_catalog_msp430_peripherals_timer
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
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.clock");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer", new Value.Obj("ti.catalog.msp430.peripherals.timer", pkgP));
    }

    void ITimer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer", new Value.Obj("ti.catalog.msp430.peripherals.timer.ITimer", po));
        pkgV.bind("ITimer", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer$$regIntVect_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.ITimer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer.Params", new Proto.Str(po, true));
    }

    void ITimer_A$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A", new Value.Obj("ti.catalog.msp430.peripherals.timer.ITimer_A", po));
        pkgV.bind("ITimer_A", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A$$TACTL_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A$$TACCTLx_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.Params", new Proto.Str(po, true));
    }

    void Timer_A2$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer_A2", po));
        pkgV.bind("Timer_A2", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2.Params", new Proto.Str(po, true));
    }

    void Timer1_A2$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer1_A2", po));
        pkgV.bind("Timer1_A2", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2.Params", new Proto.Str(po, true));
    }

    void Timer_A5$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer_A5", po));
        pkgV.bind("Timer_A5", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5.Params", new Proto.Str(po, true));
    }

    void Timer0_A5$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer0_A5", po));
        pkgV.bind("Timer0_A5", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5.Params", new Proto.Str(po, true));
    }

    void Timer_A3$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer_A3", po));
        pkgV.bind("Timer_A3", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3.Params", new Proto.Str(po, true));
    }

    void Timer0_A3$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer0_A3", po));
        pkgV.bind("Timer0_A3", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3.Params", new Proto.Str(po, true));
    }

    void Timer1_A3$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer1_A3", po));
        pkgV.bind("Timer1_A3", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3.Params", new Proto.Str(po, true));
    }

    void Timer2_A3$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer2_A3", po));
        pkgV.bind("Timer2_A3", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3.Params", new Proto.Str(po, true));
    }

    void ITimer_B$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B", new Value.Obj("ti.catalog.msp430.peripherals.timer.ITimer_B", po));
        pkgV.bind("ITimer_B", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", new Proto.Enm("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B$$TBCTL_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B$$TBCCTLx_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.Params", new Proto.Str(po, true));
    }

    void Timer_B3$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer_B3", po));
        pkgV.bind("Timer_B3", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.IVValues", new Proto.Enm("ti.catalog.msp430.peripherals.timer.Timer_B3.IVValues"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.Params", new Proto.Str(po, true));
    }

    void Timer_B7$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer_B7", po));
        pkgV.bind("Timer_B7", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues", new Proto.Enm("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.Params", new Proto.Str(po, true));
    }

    void Timer0_B7$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer0_B7", po));
        pkgV.bind("Timer0_B7", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues", new Proto.Enm("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.Params", new Proto.Str(po, true));
    }

    void Timer0_B3$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer0_B3", po));
        pkgV.bind("Timer0_B3", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3.Params", new Proto.Str(po, true));
    }

    void Timer1_B3$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer1_B3", po));
        pkgV.bind("Timer1_B3", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3.Params", new Proto.Str(po, true));
    }

    void Timer2_B3$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer2_B3", po));
        pkgV.bind("Timer2_B3", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3.Params", new Proto.Str(po, true));
    }

    void Timer2_A2$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer2_A2", po));
        pkgV.bind("Timer2_A2", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2.Params", new Proto.Str(po, true));
    }

    void Timer3_A2$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer3_A2", po));
        pkgV.bind("Timer3_A2", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2.Params", new Proto.Str(po, true));
    }

    void Timer3_A5$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5", new Value.Obj("ti.catalog.msp430.peripherals.timer.Timer3_A5", po));
        pkgV.bind("Timer3_A5", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5.Params", new Proto.Str(po, true));
    }

    void ITimer$$CONSTS()
    {
        // interface ITimer
    }

    void ITimer_A$$CONSTS()
    {
        // interface ITimer_A
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x100"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", xdc.services.intern.xsr.Enum.intValue((0x000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", xdc.services.intern.xsr.Enum.intValue((0x0001L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x10"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x40")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x40")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x40")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x40"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x4000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x4000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x4000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x4000"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x1000"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", xdc.services.intern.xsr.Enum.intValue(0x0800L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", xdc.services.intern.xsr.Enum.intValue(0x0400L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", xdc.services.intern.xsr.Enum.intValue((0x0010L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", xdc.services.intern.xsr.Enum.intValue((0x0008L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", xdc.services.intern.xsr.Enum.intValue((0x0008L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", xdc.services.intern.xsr.Enum.intValue((0x0004L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.COV", xdc.services.intern.xsr.Enum.intValue((0x0002L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", xdc.services.intern.xsr.Enum.intValue((0x0001L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", xdc.services.intern.xsr.Enum.intValue(Global.eval("7 * 0x20"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", xdc.services.intern.xsr.Enum.intValue(0x0006L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", xdc.services.intern.xsr.Enum.intValue(0x000AL)+0));
    }

    void Timer_A2$$CONSTS()
    {
        // module Timer_A2
    }

    void Timer1_A2$$CONSTS()
    {
        // module Timer1_A2
    }

    void Timer_A5$$CONSTS()
    {
        // module Timer_A5
    }

    void Timer0_A5$$CONSTS()
    {
        // module Timer0_A5
    }

    void Timer_A3$$CONSTS()
    {
        // module Timer_A3
    }

    void Timer0_A3$$CONSTS()
    {
        // module Timer0_A3
    }

    void Timer1_A3$$CONSTS()
    {
        // module Timer1_A3
    }

    void Timer2_A3$$CONSTS()
    {
        // module Timer2_A3
    }

    void ITimer_B$$CONSTS()
    {
        // interface ITimer_B
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x100"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x100"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x100"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF", xdc.services.intern.xsr.Enum.intValue((0x000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG", xdc.services.intern.xsr.Enum.intValue((0x0001L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.MC_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.MC_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.MC_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x10"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x40")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.ID_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x40")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.ID_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x40")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.ID_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x40"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x4000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CM_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x4000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CM_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x4000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CM_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x4000"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x1000"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.SCS", xdc.services.intern.xsr.Enum.intValue(0x0800L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x1000"))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI", xdc.services.intern.xsr.Enum.intValue(0x0400L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CAP", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE", xdc.services.intern.xsr.Enum.intValue((0x0010L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF", xdc.services.intern.xsr.Enum.intValue((0x0008L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CCI", xdc.services.intern.xsr.Enum.intValue((0x0008L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.OUT", xdc.services.intern.xsr.Enum.intValue((0x0004L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.COV", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.COV", xdc.services.intern.xsr.Enum.intValue((0x0002L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG", xdc.services.intern.xsr.Enum.intValue((0x0001L))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_7", xdc.services.intern.xsr.Enum.intValue(Global.eval("7 * 0x20"))+0));
    }

    void Timer_B3$$CONSTS()
    {
        // module Timer_B3
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_NONE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_NONE", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_TBCCR1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_TBCCR1", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_TBCCR2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_TBCCR2", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_6", xdc.services.intern.xsr.Enum.intValue(0x0006L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_8", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_TBIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_TBIFG", xdc.services.intern.xsr.Enum.intValue(0x000AL)+0));
    }

    void Timer_B7$$CONSTS()
    {
        // module Timer_B7
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_NONE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_NONE", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR1", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR2", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR3", xdc.services.intern.xsr.Enum.intValue(0x0006L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR4", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR5", xdc.services.intern.xsr.Enum.intValue(0x000AL)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR6", xdc.services.intern.xsr.Enum.intValue(0x000CL)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBIFG", xdc.services.intern.xsr.Enum.intValue(0x000EL)+0));
    }

    void Timer0_B7$$CONSTS()
    {
        // module Timer0_B7
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_NONE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_NONE", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR1", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR2", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR3", xdc.services.intern.xsr.Enum.intValue(0x0006L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR4", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR5", xdc.services.intern.xsr.Enum.intValue(0x000AL)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR6", xdc.services.intern.xsr.Enum.intValue(0x000CL)+0));
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues", "ti.catalog.msp430.peripherals.timer"), "ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBIFG", xdc.services.intern.xsr.Enum.intValue(0x000EL)+0));
    }

    void Timer0_B3$$CONSTS()
    {
        // module Timer0_B3
    }

    void Timer1_B3$$CONSTS()
    {
        // module Timer1_B3
    }

    void Timer2_B3$$CONSTS()
    {
        // module Timer2_B3
    }

    void Timer2_A2$$CONSTS()
    {
        // module Timer2_A2
    }

    void Timer3_A2$$CONSTS()
    {
        // module Timer3_A2
    }

    void Timer3_A5$$CONSTS()
    {
        // module Timer3_A5
    }

    void ITimer$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ITimer_A$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Timer_A2$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer_A2$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_A2'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_A2.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer_A2$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_A2'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer1_A2$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer1_A2$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer1_A2'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer1_A2.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer1_A2$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer1_A2'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer_A5$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer_A5$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_A5'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_A5.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A5$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer_A5$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_A5'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer0_A5$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer0_A5$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_A5'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_A5.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A5$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer0_A5$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_A5'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer_A3$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer_A3$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_A3'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_A3.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer_A3$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_A3'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer0_A3$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer0_A3$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_A3'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_A3.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer0_A3$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_A3'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer1_A3$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer1_A3$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer1_A3'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer1_A3.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer1_A3$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer1_A3'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer2_A3$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer2_A3$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer2_A3'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer2_A3.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A3$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer2_A3$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer2_A3'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITimer_B$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Timer_B3$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer_B3$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_B3'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_B3.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer_B3$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_B3'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer_B7$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer_B7$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_B7'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_B7.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer_B7$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer_B7'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer0_B7$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer0_B7$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_B7'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_B7.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer0_B7$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_B7'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer0_B3$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer0_B3$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_B3'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_B3.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer0_B3$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer0_B3'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer1_B3$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer1_B3$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer1_B3'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer1_B3.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer1_B3$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer1_B3'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer2_B3$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer2_B3$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer2_B3'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer2_B3.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer2_B3$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer2_B3'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer2_A2$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer2_A2$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer2_A2'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer2_A2.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer2_A2$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer2_A2'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer3_A2$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer3_A2$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer3_A2'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer3_A2.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer3_A2$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer3_A2'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Timer3_A5$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Module", "ti.catalog.msp430.peripherals.timer"), om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Instance", "ti.catalog.msp430.peripherals.timer"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer3_A5$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer3_A5'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.timer.Timer3_A5.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.timer']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Module", "ti.catalog.msp430.peripherals.timer"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5$$Object", "ti.catalog.msp430.peripherals.timer"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Params", "ti.catalog.msp430.peripherals.timer"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$timer$Timer3_A5$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.timer.Timer3_A5'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.intNum = __mod.PARAMS.intNum;\n");
            sb.append("__inst.numberOfTimers = __mod.PARAMS.numberOfTimers;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITimer$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ITimer.setTxxCCRx
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Instance", "ti.catalog.msp430.peripherals.timer"), null, 2, 2, false));
                fxn.addArg(0, "ccrNumber", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF);
                fxn.addArg(1, "value", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF);
        // fxn ITimer.getTxxCCRx
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Instance", "ti.catalog.msp430.peripherals.timer"), Proto.Elm.newCNum("(xdc_Bits16)"), 1, 1, false));
                fxn.addArg(0, "ccrNumber", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF);
    }

    void ITimer_A$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer_A2$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer1_A2$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer_A5$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer0_A5$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer_A3$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer0_A3$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer1_A3$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer2_A3$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITimer_B$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer_B3$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer_B7$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer0_B7$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer0_B3$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer1_B3$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer2_B3$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer2_A2$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer3_A2$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer3_A5$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITimer$$SIZES()
    {
    }

    void ITimer_A$$SIZES()
    {
    }

    void Timer_A2$$SIZES()
    {
    }

    void Timer1_A2$$SIZES()
    {
    }

    void Timer_A5$$SIZES()
    {
    }

    void Timer0_A5$$SIZES()
    {
    }

    void Timer_A3$$SIZES()
    {
    }

    void Timer0_A3$$SIZES()
    {
    }

    void Timer1_A3$$SIZES()
    {
    }

    void Timer2_A3$$SIZES()
    {
    }

    void ITimer_B$$SIZES()
    {
    }

    void Timer_B3$$SIZES()
    {
    }

    void Timer_B7$$SIZES()
    {
    }

    void Timer0_B7$$SIZES()
    {
    }

    void Timer0_B3$$SIZES()
    {
    }

    void Timer1_B3$$SIZES()
    {
    }

    void Timer2_B3$$SIZES()
    {
    }

    void Timer2_A2$$SIZES()
    {
    }

    void Timer3_A2$$SIZES()
    {
    }

    void Timer3_A5$$SIZES()
    {
    }

    void ITimer$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("numberOfTimers", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "wh");
        po.addFld("isInternal", $$T_Bool, false, "wh");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("numberOfTimers", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "wh");
        po.addFld("isInternal", $$T_Bool, false, "wh");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "wh");
        // struct ITimer.regIntVect_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$regIntVect_t", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("registerName", $$T_Str, $$UNDEF, "w");
                po.addFld("registerDescription", $$T_Str, $$UNDEF, "w");
                po.addFld("isrToggleString", $$T_Str, $$UNDEF, "w");
                po.addFld("priorityName", $$T_Str, $$UNDEF, "w");
                po.addFld("interruptEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("interruptHandler", $$T_Bool, $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // struct ITimer.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
    }

    void ITimer_A$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/ITimer_A.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.ITimer_A$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TACLK", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("INCLK", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer_A.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TACLK", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("INCLK", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        // struct ITimer_A.TACTL_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$TACTL_t", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("TASSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("ID", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("MC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("TACLR", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("TAIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("TAIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
        // struct ITimer_A.TACCTLx_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$TACCTLx_t", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("CM", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CCIS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("SCS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("SCCI", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CAP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("OUTMOD", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CCIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CCI", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("OUT", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("COV", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CCIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
    }

    void Timer_A2$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer_A2.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A2.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer_A2$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer_A2$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_A2$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A2.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TACTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TACCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TACTL", "regForceSet", false), Global.newObject("register", "TACCTL0", "regForceSet", false), Global.newObject("register", "TACCTL1", "regForceSet", false), Global.newObject("register", "TACCR0", "regForceSet", false), Global.newObject("register", "TACCR1", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A2.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TACTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TACCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TACTL", "regForceSet", false), Global.newObject("register", "TACCTL0", "regForceSet", false), Global.newObject("register", "TACCTL1", "regForceSet", false), Global.newObject("register", "TACCR0", "regForceSet", false), Global.newObject("register", "TACCR1", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A2.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer1_A2$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer1_A2.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_A2.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer1_A2$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer1_A2$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A2$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_A2.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA1CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA1CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA1CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA1CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA1CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA1CTL", "regForceSet", false), Global.newObject("register", "TA1CCTL0", "regForceSet", false), Global.newObject("register", "TA1CCTL1", "regForceSet", false), Global.newObject("register", "TA1CCR0", "regForceSet", false), Global.newObject("register", "TA1CCR1", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_A2.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA1CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA1CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA1CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA1CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA1CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA1CTL", "regForceSet", false), Global.newObject("register", "TA1CCTL0", "regForceSet", false), Global.newObject("register", "TA1CCTL1", "regForceSet", false), Global.newObject("register", "TA1CCR0", "regForceSet", false), Global.newObject("register", "TA1CCR1", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_A2.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer_A5$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A5.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer_A5$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer_A5$$construct"));
                po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A5.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "TimerA5", "wh");
        po.addFld("TAxCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TACCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(6L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TACTL", "regForceSet", false), Global.newObject("register", "TACCTL0", "regForceSet", false), Global.newObject("register", "TACCTL1", "regForceSet", false), Global.newObject("register", "TACCTL2", "regForceSet", false), Global.newObject("register", "TACCTL3", "regForceSet", false), Global.newObject("register", "TACCTL4", "regForceSet", false), Global.newObject("register", "TACCR0", "regForceSet", false), Global.newObject("register", "TACCR1", "regForceSet", false), Global.newObject("register", "TACCR2", "regForceSet", false), Global.newObject("register", "TACCR3", "regForceSet", false), Global.newObject("register", "TACCR4", "regForceSet", false)}), "rh");
                po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A5.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "TimerA5", "wh");
        po.addFld("TAxCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TACCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(6L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TACTL", "regForceSet", false), Global.newObject("register", "TACCTL0", "regForceSet", false), Global.newObject("register", "TACCTL1", "regForceSet", false), Global.newObject("register", "TACCTL2", "regForceSet", false), Global.newObject("register", "TACCTL3", "regForceSet", false), Global.newObject("register", "TACCTL4", "regForceSet", false), Global.newObject("register", "TACCR0", "regForceSet", false), Global.newObject("register", "TACCR1", "regForceSet", false), Global.newObject("register", "TACCR2", "regForceSet", false), Global.newObject("register", "TACCR3", "regForceSet", false), Global.newObject("register", "TACCR4", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A5.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
    }

    void Timer0_A5$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_A5.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer0_A5$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer0_A5$$construct"));
                po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_A5.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "TimerA5", "wh");
        po.addFld("TA0CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA0CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(6L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA0CTL", "regForceSet", false), Global.newObject("register", "TA0CCTL0", "regForceSet", false), Global.newObject("register", "TA0CCTL1", "regForceSet", false), Global.newObject("register", "TA0CCTL2", "regForceSet", false), Global.newObject("register", "TA0CCTL3", "regForceSet", false), Global.newObject("register", "TA0CCTL4", "regForceSet", false), Global.newObject("register", "TA0CCR0", "regForceSet", false), Global.newObject("register", "TA0CCR1", "regForceSet", false), Global.newObject("register", "TA0CCR2", "regForceSet", false), Global.newObject("register", "TA0CCR3", "regForceSet", false), Global.newObject("register", "TA0CCR4", "regForceSet", false)}), "rh");
                po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_A5.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, "TimerA5", "wh");
        po.addFld("TA0CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA0CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(6L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA0CTL", "regForceSet", false), Global.newObject("register", "TA0CCTL0", "regForceSet", false), Global.newObject("register", "TA0CCTL1", "regForceSet", false), Global.newObject("register", "TA0CCTL2", "regForceSet", false), Global.newObject("register", "TA0CCTL3", "regForceSet", false), Global.newObject("register", "TA0CCTL4", "regForceSet", false), Global.newObject("register", "TA0CCR0", "regForceSet", false), Global.newObject("register", "TA0CCR1", "regForceSet", false), Global.newObject("register", "TA0CCR2", "regForceSet", false), Global.newObject("register", "TA0CCR3", "regForceSet", false), Global.newObject("register", "TA0CCR4", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_A5.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
    }

    void Timer_A3$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer_A3.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A3.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer_A3$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer_A3$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_A3$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A3.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TACTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TACCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TACTL", "regForceSet", false), Global.newObject("register", "TACCTL0", "regForceSet", false), Global.newObject("register", "TACCTL1", "regForceSet", false), Global.newObject("register", "TACCTL2", "regForceSet", false), Global.newObject("register", "TACCR0", "regForceSet", false), Global.newObject("register", "TACCR1", "regForceSet", false), Global.newObject("register", "TACCR2", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A3.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TACTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TACCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TACCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TACCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TACTL", "regForceSet", false), Global.newObject("register", "TACCTL0", "regForceSet", false), Global.newObject("register", "TACCTL1", "regForceSet", false), Global.newObject("register", "TACCTL2", "regForceSet", false), Global.newObject("register", "TACCR0", "regForceSet", false), Global.newObject("register", "TACCR1", "regForceSet", false), Global.newObject("register", "TACCR2", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_A3.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer0_A3$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer0_A3.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_A3.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer0_A3$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer0_A3$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_A3$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_A3.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA0CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA0CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA0CTL", "regForceSet", false), Global.newObject("register", "TA0CCTL0", "regForceSet", false), Global.newObject("register", "TA0CCTL1", "regForceSet", false), Global.newObject("register", "TA0CCTL2", "regForceSet", false), Global.newObject("register", "TA0CCR0", "regForceSet", false), Global.newObject("register", "TA0CCR1", "regForceSet", false), Global.newObject("register", "TA0CCR2", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_A3.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA0CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA0CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA0CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA0CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA0CTL", "regForceSet", false), Global.newObject("register", "TA0CCTL0", "regForceSet", false), Global.newObject("register", "TA0CCTL1", "regForceSet", false), Global.newObject("register", "TA0CCTL2", "regForceSet", false), Global.newObject("register", "TA0CCR0", "regForceSet", false), Global.newObject("register", "TA0CCR1", "regForceSet", false), Global.newObject("register", "TA0CCR2", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_A3.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer1_A3$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer1_A3.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_A3.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer1_A3$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer1_A3$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_A3$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_A3.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA1CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA1CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA1CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA1CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA1CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA1CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA1CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA1CTL", "regForceSet", false), Global.newObject("register", "TA1CCTL0", "regForceSet", false), Global.newObject("register", "TA1CCTL1", "regForceSet", false), Global.newObject("register", "TA1CCTL2", "regForceSet", false), Global.newObject("register", "TA1CCR0", "regForceSet", false), Global.newObject("register", "TA1CCR1", "regForceSet", false), Global.newObject("register", "TA1CCR2", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_A3.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA1CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA1CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA1CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA1CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA1CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA1CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA1CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA1CTL", "regForceSet", false), Global.newObject("register", "TA1CCTL0", "regForceSet", false), Global.newObject("register", "TA1CCTL1", "regForceSet", false), Global.newObject("register", "TA1CCTL2", "regForceSet", false), Global.newObject("register", "TA1CCR0", "regForceSet", false), Global.newObject("register", "TA1CCR1", "regForceSet", false), Global.newObject("register", "TA1CCR2", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_A3.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer2_A3$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_A3.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer2_A3$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer2_A3$$construct"));
                po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_A3.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA2CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA2CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA2CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA2CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA2CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA2CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA2CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA2CTL", "regForceSet", false), Global.newObject("register", "TA2CCTL0", "regForceSet", false), Global.newObject("register", "TA2CCTL1", "regForceSet", false), Global.newObject("register", "TA2CCTL2", "regForceSet", false), Global.newObject("register", "TA2CCR0", "regForceSet", false), Global.newObject("register", "TA2CCR1", "regForceSet", false), Global.newObject("register", "TA2CCR2", "regForceSet", false)}), "rh");
                po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_A3.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA2CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA2CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA2CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA2CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA2CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA2CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA2CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA2CTL", "regForceSet", false), Global.newObject("register", "TA2CCTL0", "regForceSet", false), Global.newObject("register", "TA2CCTL1", "regForceSet", false), Global.newObject("register", "TA2CCTL2", "regForceSet", false), Global.newObject("register", "TA2CCR0", "regForceSet", false), Global.newObject("register", "TA2CCR1", "regForceSet", false), Global.newObject("register", "TA2CCR2", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_A3.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
                po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), $$UNDEF);
    }

    void ITimer_B$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/ITimer_B.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer_B.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.ITimer_B$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer_B.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TBCLK", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("INCLK", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer_B.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TBCLK", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("INCLK", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        // struct ITimer_B.TBCTL_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B$$TBCTL_t", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("TBCLGRP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CNTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("TBSSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("ID", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("MC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("TBCLR", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("TBIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("TBIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
        // struct ITimer_B.TBCCTLx_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B$$TBCCTLx_t", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("CM", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CCIS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("SCS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CLLD", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CAP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("OUTMOD", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CCIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CCI", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("OUT", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("COV", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
                po.addFld("CCIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"), $$UNDEF, "w");
    }

    void Timer_B3$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer_B3.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_B3.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer_B3$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer_B3$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_B3$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_B3.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TBCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TBCLGRP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0"), "CNTL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0"), "TBSSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0"), "TBCLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF"), "TBIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF"), "TBIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF")), "wh");
        po.addFld("TBCCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TBCTL", "regForceSet", false), Global.newObject("register", "TBCCTL0", "regForceSet", false), Global.newObject("register", "TBCCTL1", "regForceSet", false), Global.newObject("register", "TBCCTL2", "regForceSet", false), Global.newObject("register", "TBCCR0", "regForceSet", false), Global.newObject("register", "TBCCR1", "regForceSet", false), Global.newObject("register", "TBCCR2", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_B3.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TBCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TBCLGRP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0"), "CNTL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0"), "TBSSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0"), "TBCLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF"), "TBIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF"), "TBIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF")), "wh");
        po.addFld("TBCCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TBCTL", "regForceSet", false), Global.newObject("register", "TBCCTL0", "regForceSet", false), Global.newObject("register", "TBCCTL1", "regForceSet", false), Global.newObject("register", "TBCCTL2", "regForceSet", false), Global.newObject("register", "TBCCR0", "regForceSet", false), Global.newObject("register", "TBCCR1", "regForceSet", false), Global.newObject("register", "TBCCR2", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_B3.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer_B7$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer_B7.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_B7.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer_B7$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer_B7$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer_B7$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_B7.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TBCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TBCLGRP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0"), "CNTL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0"), "TBSSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0"), "TBCLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF"), "TBIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF"), "TBIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF")), "wh");
        po.addFld("TBCCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR5", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR6", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TBCTL", "regForceSet", false), Global.newObject("register", "TBCCTL0", "regForceSet", false), Global.newObject("register", "TBCCTL1", "regForceSet", false), Global.newObject("register", "TBCCTL2", "regForceSet", false), Global.newObject("register", "TBCCTL3", "regForceSet", false), Global.newObject("register", "TBCCTL4", "regForceSet", false), Global.newObject("register", "TBCCTL5", "regForceSet", false), Global.newObject("register", "TBCCTL6", "regForceSet", false), Global.newObject("register", "TBCCR0", "regForceSet", false), Global.newObject("register", "TBCCR1", "regForceSet", false), Global.newObject("register", "TBCCR2", "regForceSet", false), Global.newObject("register", "TBCCR3", "regForceSet", false), Global.newObject("register", "TBCCR4", "regForceSet", false), Global.newObject("register", "TBCCR5", "regForceSet", false), Global.newObject("register", "TBCCR6", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_B7.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TBCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TBCLGRP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0"), "CNTL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0"), "TBSSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0"), "TBCLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF"), "TBIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF"), "TBIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF")), "wh");
        po.addFld("TBCCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCTL6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TBCCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR5", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TBCCR6", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TBCTL", "regForceSet", false), Global.newObject("register", "TBCCTL0", "regForceSet", false), Global.newObject("register", "TBCCTL1", "regForceSet", false), Global.newObject("register", "TBCCTL2", "regForceSet", false), Global.newObject("register", "TBCCTL3", "regForceSet", false), Global.newObject("register", "TBCCTL4", "regForceSet", false), Global.newObject("register", "TBCCTL5", "regForceSet", false), Global.newObject("register", "TBCCTL6", "regForceSet", false), Global.newObject("register", "TBCCR0", "regForceSet", false), Global.newObject("register", "TBCCR1", "regForceSet", false), Global.newObject("register", "TBCCR2", "regForceSet", false), Global.newObject("register", "TBCCR3", "regForceSet", false), Global.newObject("register", "TBCCR4", "regForceSet", false), Global.newObject("register", "TBCCR5", "regForceSet", false), Global.newObject("register", "TBCCR6", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer_B7.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer0_B7$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer0_B7.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_B7.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer0_B7$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer0_B7$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B7$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_B7.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TB0CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TBCLGRP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0"), "CNTL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0"), "TBSSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0"), "TBCLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF"), "TBIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF"), "TBIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF")), "wh");
        po.addFld("TB0CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR5", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR6", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TB0CTL", "regForceSet", false), Global.newObject("register", "TB0CCTL0", "regForceSet", false), Global.newObject("register", "TB0CCTL1", "regForceSet", false), Global.newObject("register", "TB0CCTL2", "regForceSet", false), Global.newObject("register", "TB0CCTL3", "regForceSet", false), Global.newObject("register", "TB0CCTL4", "regForceSet", false), Global.newObject("register", "TB0CCTL5", "regForceSet", false), Global.newObject("register", "TB0CCTL6", "regForceSet", false), Global.newObject("register", "TB0CCR0", "regForceSet", false), Global.newObject("register", "TB0CCR1", "regForceSet", false), Global.newObject("register", "TB0CCR2", "regForceSet", false), Global.newObject("register", "TB0CCR3", "regForceSet", false), Global.newObject("register", "TB0CCR4", "regForceSet", false), Global.newObject("register", "TB0CCR5", "regForceSet", false), Global.newObject("register", "TB0CCR6", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_B7.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TB0CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TBCLGRP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0"), "CNTL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0"), "TBSSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0"), "TBCLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF"), "TBIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF"), "TBIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF")), "wh");
        po.addFld("TB0CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR5", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR6", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TB0CTL", "regForceSet", false), Global.newObject("register", "TB0CCTL0", "regForceSet", false), Global.newObject("register", "TB0CCTL1", "regForceSet", false), Global.newObject("register", "TB0CCTL2", "regForceSet", false), Global.newObject("register", "TB0CCTL3", "regForceSet", false), Global.newObject("register", "TB0CCTL4", "regForceSet", false), Global.newObject("register", "TB0CCTL5", "regForceSet", false), Global.newObject("register", "TB0CCTL6", "regForceSet", false), Global.newObject("register", "TB0CCR0", "regForceSet", false), Global.newObject("register", "TB0CCR1", "regForceSet", false), Global.newObject("register", "TB0CCR2", "regForceSet", false), Global.newObject("register", "TB0CCR3", "regForceSet", false), Global.newObject("register", "TB0CCR4", "regForceSet", false), Global.newObject("register", "TB0CCR5", "regForceSet", false), Global.newObject("register", "TB0CCR6", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_B7.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer0_B3$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer0_B3.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_B3.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer0_B3$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer0_B3$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer0_B3$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_B3.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TB0CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TBCLGRP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0"), "CNTL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0"), "TBSSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0"), "TBCLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF"), "TBIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF"), "TBIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF")), "wh");
        po.addFld("TB0CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TB0CTL", "regForceSet", false), Global.newObject("register", "TB0CCTL0", "regForceSet", false), Global.newObject("register", "TB0CCTL1", "regForceSet", false), Global.newObject("register", "TB0CCTL2", "regForceSet", false), Global.newObject("register", "TB0CCR0", "regForceSet", false), Global.newObject("register", "TB0CCR1", "regForceSet", false), Global.newObject("register", "TB0CCR2", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_B3.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TB0CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TBCLGRP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0"), "CNTL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0"), "TBSSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0"), "TBCLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF"), "TBIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF"), "TBIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF")), "wh");
        po.addFld("TB0CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF"), "CLLD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF")), "wh");
        po.addFld("TB0CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TB0CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TB0CTL", "regForceSet", false), Global.newObject("register", "TB0CCTL0", "regForceSet", false), Global.newObject("register", "TB0CCTL1", "regForceSet", false), Global.newObject("register", "TB0CCTL2", "regForceSet", false), Global.newObject("register", "TB0CCR0", "regForceSet", false), Global.newObject("register", "TB0CCR1", "regForceSet", false), Global.newObject("register", "TB0CCR2", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer0_B3.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer1_B3$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer1_B3.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_B3.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer1_B3$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer1_B3$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer1_B3$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_B3.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_B3.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer1_B3.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer2_B3$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer2_B3.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_B3.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer2_B3$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer2_B3$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer2_B3$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_B3.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_B3.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_B3.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer2_A2$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer2_A2.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_A2.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer2_A2$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer2_A2$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer2_A2$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_A2.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA2CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA2CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA2CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA2CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA2CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA2CTL", "regForceSet", false), Global.newObject("register", "TA2CCTL0", "regForceSet", false), Global.newObject("register", "TA2CCTL1", "regForceSet", false), Global.newObject("register", "TA2CCR0", "regForceSet", false), Global.newObject("register", "TA2CCR1", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_A2.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA2CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA2CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA2CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA2CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA2CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA2CTL", "regForceSet", false), Global.newObject("register", "TA2CCTL0", "regForceSet", false), Global.newObject("register", "TA2CCTL1", "regForceSet", false), Global.newObject("register", "TA2CCR0", "regForceSet", false), Global.newObject("register", "TA2CCR1", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer2_A2.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer3_A2$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer3_A2.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer3_A2.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer3_A2$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer3_A2$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A2$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer3_A2.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA3CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA3CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA3CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA3CTL", "regForceSet", false), Global.newObject("register", "TA3CCTL0", "regForceSet", false), Global.newObject("register", "TA3CCTL1", "regForceSet", false), Global.newObject("register", "TA3CCR0", "regForceSet", false), Global.newObject("register", "TA3CCR1", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer3_A2.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA3CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA3CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA3CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA3CTL", "regForceSet", false), Global.newObject("register", "TA3CCTL0", "regForceSet", false), Global.newObject("register", "TA3CCTL1", "regForceSet", false), Global.newObject("register", "TA3CCR0", "regForceSet", false), Global.newObject("register", "TA3CCR1", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer3_A2.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void Timer3_A5$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/timer/Timer3_A5.xs");
        om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Module", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer3_A5.Module", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5$$create", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer3_A5$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5$$construct", "ti.catalog.msp430.peripherals.timer"), Global.get("ti$catalog$msp430$peripherals$timer$Timer3_A5$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.timer.Timer3_A5$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Instance", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer3_A5.Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA3CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA3CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA3CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA3CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA3CCR3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA3CCR4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(6L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA3CTL", "regForceSet", false), Global.newObject("register", "TA3CCTL0", "regForceSet", false), Global.newObject("register", "TA3CCTL1", "regForceSet", false), Global.newObject("register", "TA3CCR0", "regForceSet", false), Global.newObject("register", "TA3CCR1", "regForceSet", false), Global.newObject("register", "TA3CCR2", "regForceSet", false), Global.newObject("register", "TA3CCR3", "regForceSet", false), Global.newObject("register", "TA3CCR4", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5$$Params", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer3_A5.Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$Params", "ti.catalog.msp430.peripherals.timer"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("TA3CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACTL_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("TASSEL", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0"), "ID", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0"), "MC", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0"), "TACLR", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF"), "TAIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF"), "TAIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF")), "wh");
        po.addFld("TA3CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"), Global.newObject("CM", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0"), "CCIS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0"), "SCS", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF"), "SCCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF"), "CAP", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF"), "OUTMOD", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0"), "CCIE", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF"), "CCI", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF"), "OUT", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF"), "COV", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF"), "CCIFG", om.find("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF")), "wh");
        po.addFld("TA3CCR0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA3CCR1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA3CCR2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA3CCR3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("TA3CCR4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.regIntVect_t", "ti.catalog.msp430.peripherals.timer"), false, xdc.services.intern.xsr.Enum.intValue(6L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"), false), Global.newArray(new Object[]{Global.newObject("register", "TA3CTL", "regForceSet", false), Global.newObject("register", "TA3CCTL0", "regForceSet", false), Global.newObject("register", "TA3CCTL1", "regForceSet", false), Global.newObject("register", "TA3CCR0", "regForceSet", false), Global.newObject("register", "TA3CCR1", "regForceSet", false), Global.newObject("register", "TA3CCR2", "regForceSet", false), Global.newObject("register", "TA3CCR3", "regForceSet", false), Global.newObject("register", "TA3CCR4", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5$$Object", "ti.catalog.msp430.peripherals.timer");
        po.init("ti.catalog.msp430.peripherals.timer.Timer3_A5.Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Instance", "ti.catalog.msp430.peripherals.timer"));
                fxn = Global.get(cap, "setTxxCCRx");
                if (fxn != null) po.addFxn("setTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$setTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
                fxn = Global.get(cap, "getTxxCCRx");
                if (fxn != null) po.addFxn("getTxxCCRx", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer$$getTxxCCRx", "ti.catalog.msp430.peripherals.timer"), fxn);
    }

    void ITimer$$ROV()
    {
    }

    void ITimer_A$$ROV()
    {
    }

    void Timer_A2$$ROV()
    {
    }

    void Timer1_A2$$ROV()
    {
    }

    void Timer_A5$$ROV()
    {
    }

    void Timer0_A5$$ROV()
    {
    }

    void Timer_A3$$ROV()
    {
    }

    void Timer0_A3$$ROV()
    {
    }

    void Timer1_A3$$ROV()
    {
    }

    void Timer2_A3$$ROV()
    {
    }

    void ITimer_B$$ROV()
    {
    }

    void Timer_B3$$ROV()
    {
    }

    void Timer_B7$$ROV()
    {
    }

    void Timer0_B7$$ROV()
    {
    }

    void Timer0_B3$$ROV()
    {
    }

    void Timer1_B3$$ROV()
    {
    }

    void Timer2_B3$$ROV()
    {
    }

    void Timer2_A2$$ROV()
    {
    }

    void Timer3_A2$$ROV()
    {
    }

    void Timer3_A5$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.timer.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.timer"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.timer", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.timer");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.timer.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.catalog.msp430.peripherals.clock", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.timer'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.timer$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.timer$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.timer$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void ITimer$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.ITimer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITimer", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITimer");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ITimer_A$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.ITimer_A", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITimer_A", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITimer_A");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void Timer_A2$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer_A2", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer_A2$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer_A2", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer_A2");
    }

    void Timer1_A2$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer1_A2", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer1_A2$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer1_A2", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer1_A2");
    }

    void Timer_A5$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer_A5", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer_A5$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer_A5", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer_A5");
    }

    void Timer0_A5$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer0_A5", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer0_A5$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer0_A5", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer0_A5");
    }

    void Timer_A3$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer_A3", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer_A3$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer_A3", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer_A3");
    }

    void Timer0_A3$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer0_A3", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer0_A3$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer0_A3", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer0_A3");
    }

    void Timer1_A3$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer1_A3", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer1_A3$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer1_A3", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer1_A3");
    }

    void Timer2_A3$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer2_A3", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer2_A3$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer2_A3", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer2_A3");
    }

    void ITimer_B$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.ITimer_B", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITimer_B", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITimer_B");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void Timer_B3$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer_B3", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_TBCCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_TBCCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_TBCCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_TBCCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_TBIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.TBIV_TBIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer_B3$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer_B3", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer_B3");
    }

    void Timer_B7$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer_B7", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_TBCCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_TBCCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_TBCCR3", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_TBCCR4", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_TBCCR5", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_TBCCR6", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBCCR6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIV_TBIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.TBIV_TBIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer_B7$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer_B7", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer_B7");
    }

    void Timer0_B7$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer0_B7", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TB0IV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TB0IV_TBCCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TB0IV_TBCCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TB0IV_TBCCR3", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TB0IV_TBCCR4", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TB0IV_TBCCR5", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TB0IV_TBCCR6", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBCCR6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TB0IV_TBIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.TB0IV_TBIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer0_B7$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer0_B7", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer0_B7");
    }

    void Timer0_B3$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer0_B3", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer0_B3$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer0_B3", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer0_B3");
    }

    void Timer1_B3$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer1_B3", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer1_B3$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer1_B3", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer1_B3");
    }

    void Timer2_B3$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer2_B3", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLGRP_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLGRP_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CNTL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CNTL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBSSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBSSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBCLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBCLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TBIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.TBIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CLLD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CLLD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_B.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer2_B3$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer2_B3", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer2_B3");
    }

    void Timer2_A2$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer2_A2", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer2_A2$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer2_A2", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer2_A2");
    }

    void Timer3_A2$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer3_A2", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer3_A2$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer3_A2", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer3_A2");
    }

    void Timer3_A5$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5", "ti.catalog.msp430.peripherals.timer");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Module", "ti.catalog.msp430.peripherals.timer");
        vo.init2(po, "ti.catalog.msp430.peripherals.timer.Timer3_A5", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5$$capsule", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Instance", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Params", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Params", "ti.catalog.msp430.peripherals.timer")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.timer", "ti.catalog.msp430.peripherals.timer"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.regIntVect_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("IVValues", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.IVValues", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACTL_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACTL_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACCTLx_t", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACCTLx_t", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TASSEL_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TASSEL_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TACLR", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TACLR", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("MC_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.MC_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("ID_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.ID_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CM_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CM_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIS_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIS_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCS", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCS", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("SCCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.SCCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CAP", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CAP", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCI", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCI", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUT", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUT", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("COV", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.COV", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG_OFF", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("CCIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.CCIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_0", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_0", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_3", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_3", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_4", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_4", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_5", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_5", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("OUTMOD_7", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.OUTMOD_7", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_NONE", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_NONE", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR1", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR1", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TACCR2", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TACCR2", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_6", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_6", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_8", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_8", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("TAIV_TAIFG", om.findStrict("ti.catalog.msp430.peripherals.timer.ITimer_A.TAIV_TAIFG", "ti.catalog.msp430.peripherals.timer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("ti.catalog.msp430.peripherals.timer");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.timer")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.timer.Timer3_A5$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5.Object", "ti.catalog.msp430.peripherals.timer"));
        pkgV.bind("Timer3_A5", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer3_A5");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A2", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A2", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A5", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A5", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_A3", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_A3", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_A3", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A3", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B3", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer_B7", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B7", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer0_B3", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer1_B3", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_B3", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer2_A2", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A2", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.timer.Timer3_A5", "ti.catalog.msp430.peripherals.timer"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.ITimer")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.ITimer_A")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer_A2")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer1_A2")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer_A5")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer0_A5")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer_A3")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer0_A3")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer1_A3")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer2_A3")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.ITimer_B")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer_B3")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer_B7")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer0_B7")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer0_B3")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer1_B3")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer2_B3")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer2_A2")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer3_A2")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.timer.Timer3_A5")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.timer")).add(pkgV);
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
        ITimer$$OBJECTS();
        ITimer_A$$OBJECTS();
        Timer_A2$$OBJECTS();
        Timer1_A2$$OBJECTS();
        Timer_A5$$OBJECTS();
        Timer0_A5$$OBJECTS();
        Timer_A3$$OBJECTS();
        Timer0_A3$$OBJECTS();
        Timer1_A3$$OBJECTS();
        Timer2_A3$$OBJECTS();
        ITimer_B$$OBJECTS();
        Timer_B3$$OBJECTS();
        Timer_B7$$OBJECTS();
        Timer0_B7$$OBJECTS();
        Timer0_B3$$OBJECTS();
        Timer1_B3$$OBJECTS();
        Timer2_B3$$OBJECTS();
        Timer2_A2$$OBJECTS();
        Timer3_A2$$OBJECTS();
        Timer3_A5$$OBJECTS();
        ITimer$$CONSTS();
        ITimer_A$$CONSTS();
        Timer_A2$$CONSTS();
        Timer1_A2$$CONSTS();
        Timer_A5$$CONSTS();
        Timer0_A5$$CONSTS();
        Timer_A3$$CONSTS();
        Timer0_A3$$CONSTS();
        Timer1_A3$$CONSTS();
        Timer2_A3$$CONSTS();
        ITimer_B$$CONSTS();
        Timer_B3$$CONSTS();
        Timer_B7$$CONSTS();
        Timer0_B7$$CONSTS();
        Timer0_B3$$CONSTS();
        Timer1_B3$$CONSTS();
        Timer2_B3$$CONSTS();
        Timer2_A2$$CONSTS();
        Timer3_A2$$CONSTS();
        Timer3_A5$$CONSTS();
        ITimer$$CREATES();
        ITimer_A$$CREATES();
        Timer_A2$$CREATES();
        Timer1_A2$$CREATES();
        Timer_A5$$CREATES();
        Timer0_A5$$CREATES();
        Timer_A3$$CREATES();
        Timer0_A3$$CREATES();
        Timer1_A3$$CREATES();
        Timer2_A3$$CREATES();
        ITimer_B$$CREATES();
        Timer_B3$$CREATES();
        Timer_B7$$CREATES();
        Timer0_B7$$CREATES();
        Timer0_B3$$CREATES();
        Timer1_B3$$CREATES();
        Timer2_B3$$CREATES();
        Timer2_A2$$CREATES();
        Timer3_A2$$CREATES();
        Timer3_A5$$CREATES();
        ITimer$$FUNCTIONS();
        ITimer_A$$FUNCTIONS();
        Timer_A2$$FUNCTIONS();
        Timer1_A2$$FUNCTIONS();
        Timer_A5$$FUNCTIONS();
        Timer0_A5$$FUNCTIONS();
        Timer_A3$$FUNCTIONS();
        Timer0_A3$$FUNCTIONS();
        Timer1_A3$$FUNCTIONS();
        Timer2_A3$$FUNCTIONS();
        ITimer_B$$FUNCTIONS();
        Timer_B3$$FUNCTIONS();
        Timer_B7$$FUNCTIONS();
        Timer0_B7$$FUNCTIONS();
        Timer0_B3$$FUNCTIONS();
        Timer1_B3$$FUNCTIONS();
        Timer2_B3$$FUNCTIONS();
        Timer2_A2$$FUNCTIONS();
        Timer3_A2$$FUNCTIONS();
        Timer3_A5$$FUNCTIONS();
        ITimer$$SIZES();
        ITimer_A$$SIZES();
        Timer_A2$$SIZES();
        Timer1_A2$$SIZES();
        Timer_A5$$SIZES();
        Timer0_A5$$SIZES();
        Timer_A3$$SIZES();
        Timer0_A3$$SIZES();
        Timer1_A3$$SIZES();
        Timer2_A3$$SIZES();
        ITimer_B$$SIZES();
        Timer_B3$$SIZES();
        Timer_B7$$SIZES();
        Timer0_B7$$SIZES();
        Timer0_B3$$SIZES();
        Timer1_B3$$SIZES();
        Timer2_B3$$SIZES();
        Timer2_A2$$SIZES();
        Timer3_A2$$SIZES();
        Timer3_A5$$SIZES();
        ITimer$$TYPES();
        ITimer_A$$TYPES();
        Timer_A2$$TYPES();
        Timer1_A2$$TYPES();
        Timer_A5$$TYPES();
        Timer0_A5$$TYPES();
        Timer_A3$$TYPES();
        Timer0_A3$$TYPES();
        Timer1_A3$$TYPES();
        Timer2_A3$$TYPES();
        ITimer_B$$TYPES();
        Timer_B3$$TYPES();
        Timer_B7$$TYPES();
        Timer0_B7$$TYPES();
        Timer0_B3$$TYPES();
        Timer1_B3$$TYPES();
        Timer2_B3$$TYPES();
        Timer2_A2$$TYPES();
        Timer3_A2$$TYPES();
        Timer3_A5$$TYPES();
        if (isROV) {
            ITimer$$ROV();
            ITimer_A$$ROV();
            Timer_A2$$ROV();
            Timer1_A2$$ROV();
            Timer_A5$$ROV();
            Timer0_A5$$ROV();
            Timer_A3$$ROV();
            Timer0_A3$$ROV();
            Timer1_A3$$ROV();
            Timer2_A3$$ROV();
            ITimer_B$$ROV();
            Timer_B3$$ROV();
            Timer_B7$$ROV();
            Timer0_B7$$ROV();
            Timer0_B3$$ROV();
            Timer1_B3$$ROV();
            Timer2_B3$$ROV();
            Timer2_A2$$ROV();
            Timer3_A2$$ROV();
            Timer3_A5$$ROV();
        }//isROV
        $$SINGLETONS();
        ITimer$$SINGLETONS();
        ITimer_A$$SINGLETONS();
        Timer_A2$$SINGLETONS();
        Timer1_A2$$SINGLETONS();
        Timer_A5$$SINGLETONS();
        Timer0_A5$$SINGLETONS();
        Timer_A3$$SINGLETONS();
        Timer0_A3$$SINGLETONS();
        Timer1_A3$$SINGLETONS();
        Timer2_A3$$SINGLETONS();
        ITimer_B$$SINGLETONS();
        Timer_B3$$SINGLETONS();
        Timer_B7$$SINGLETONS();
        Timer0_B7$$SINGLETONS();
        Timer0_B3$$SINGLETONS();
        Timer1_B3$$SINGLETONS();
        Timer2_B3$$SINGLETONS();
        Timer2_A2$$SINGLETONS();
        Timer3_A2$$SINGLETONS();
        Timer3_A5$$SINGLETONS();
        $$INITIALIZATION();
    }
}
