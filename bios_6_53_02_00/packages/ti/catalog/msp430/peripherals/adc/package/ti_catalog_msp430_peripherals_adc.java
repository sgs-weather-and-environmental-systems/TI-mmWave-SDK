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

public class ti_catalog_msp430_peripherals_adc
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
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.clock");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.adc", new Value.Obj("ti.catalog.msp430.peripherals.adc", pkgP));
    }

    void IADC$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.IADC.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.adc.IADC", new Value.Obj("ti.catalog.msp430.peripherals.adc.IADC", po));
        pkgV.bind("IADC", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.IADC$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.IADC$$regIntVect_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.adc.IADC.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.IADC$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.IADC.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.IADC$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.IADC.Params", new Proto.Str(po, true));
    }

    void ADC10$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10", new Value.Obj("ti.catalog.msp430.peripherals.adc.ADC10", po));
        pkgV.bind("ADC10", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ENC_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ENC_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REFON_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.REFON_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.MSC_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.MSC_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ISSH_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ISSH_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SHS_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.SHS_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$ADC10CTL0_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL0_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$ADC10CTL1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$ADC10DTC0_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DTC0_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.adc.ADC10.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.Params", new Proto.Str(po, true));
    }

    void ADC12$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12", new Value.Obj("ti.catalog.msp430.peripherals.adc.ADC12", po));
        pkgV.bind("ADC12", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.MSC_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.MSC_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.REFON_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.REFON_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ENC_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ENC_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHS_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.SHS_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHP_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.SHP_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ISSH_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ISSH_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.EOS_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.EOS_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$ADC12CTL0_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL0_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$ADC12CTL1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$ADC12MCTL_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$ADC12IE_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.adc.ADC12.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.Params", new Proto.Str(po, true));
    }

    void SD16_A$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.adc.SD16_A", new Value.Obj("ti.catalog.msp430.peripherals.adc.SD16_A", po));
        pkgV.bind("SD16_A", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0_t", new Proto.Enm("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$SD16CTL_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CTL_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$SD16CCTL0_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CCTL0_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$SD16INCTL0_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCTL0_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$SD16AE_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.Params", new Proto.Str(po, true));
    }

    void ADC10_B$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B", new Value.Obj("ti.catalog.msp430.peripherals.adc.ADC10_B", po));
        pkgV.bind("ADC10_B", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B.Params", new Proto.Str(po, true));
    }

    void ADC12_B$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B", new Value.Obj("ti.catalog.msp430.peripherals.adc.ADC12_B", po));
        pkgV.bind("ADC12_B", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B.Params", new Proto.Str(po, true));
    }

    void IADC$$CONSTS()
    {
        // interface IADC
    }

    void ADC10$$CONSTS()
    {
        // module ADC10
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC", xdc.services.intern.xsr.Enum.intValue(0x001L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ENC_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ENC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ENC_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ENC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ENC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ENC", xdc.services.intern.xsr.Enum.intValue(0x002L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG", xdc.services.intern.xsr.Enum.intValue(0x004L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE", xdc.services.intern.xsr.Enum.intValue(0x008L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON", xdc.services.intern.xsr.Enum.intValue(0x010L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REFON_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.REFON_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REFON", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.REFON", xdc.services.intern.xsr.Enum.intValue(0x020L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V", xdc.services.intern.xsr.Enum.intValue(0x040L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.MSC_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.MSC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.MSC_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.MSC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.MSC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.MSC", xdc.services.intern.xsr.Enum.intValue(0x080L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.REFBURST", xdc.services.intern.xsr.Enum.intValue(0x100L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.REFOUT", xdc.services.intern.xsr.Enum.intValue(0x200L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR", xdc.services.intern.xsr.Enum.intValue(0x400L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x800")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x800")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x800")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x800"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SREF_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SREF_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SREF_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SREF_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SREF_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SREF_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SREF_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SREF_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SREF_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SREF_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SREF_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SREF_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SREF_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SREF_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SREF_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SREF_7", xdc.services.intern.xsr.Enum.intValue(Global.eval("7 * 0x2000"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 2")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 2")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 2")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 2"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 8")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 8")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 8")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 8"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_7", xdc.services.intern.xsr.Enum.intValue(Global.eval("7 * 0x20"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ISSH_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ISSH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ISSH_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ISSH", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ISSH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ISSH", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF", xdc.services.intern.xsr.Enum.intValue(0x0200L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SHS_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SHS_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SHS_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SHS_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SHS_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SHS_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SHS_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SHS_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SHS_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.SHS_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SHS_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.SHS_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x400"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_7", xdc.services.intern.xsr.Enum.intValue((Global.eval("7 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_8", xdc.services.intern.xsr.Enum.intValue((Global.eval("8 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_9", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_9", xdc.services.intern.xsr.Enum.intValue((Global.eval("9 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_10", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_10", xdc.services.intern.xsr.Enum.intValue((Global.eval("10 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_11", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_11", xdc.services.intern.xsr.Enum.intValue((Global.eval("11 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_12", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_12", xdc.services.intern.xsr.Enum.intValue((Global.eval("12 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_13", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_13", xdc.services.intern.xsr.Enum.intValue((Global.eval("13 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_14", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_14", xdc.services.intern.xsr.Enum.intValue((Global.eval("14 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.INCH_15", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.INCH_15", xdc.services.intern.xsr.Enum.intValue(Global.eval("15 * 0x1000"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT", xdc.services.intern.xsr.Enum.intValue(0x004L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB", xdc.services.intern.xsr.Enum.intValue(0x008L)+0));
    }

    void ADC12$$CONSTS()
    {
        // module ADC12
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_7", xdc.services.intern.xsr.Enum.intValue((Global.eval("7 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_8", xdc.services.intern.xsr.Enum.intValue((Global.eval("8 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_9", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_9", xdc.services.intern.xsr.Enum.intValue((Global.eval("9 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_10", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_10", xdc.services.intern.xsr.Enum.intValue((Global.eval("10 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_11", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_11", xdc.services.intern.xsr.Enum.intValue((Global.eval("11 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_12", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT1_12", xdc.services.intern.xsr.Enum.intValue(Global.eval("12 * 0x1000"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_7", xdc.services.intern.xsr.Enum.intValue((Global.eval("7 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_8", xdc.services.intern.xsr.Enum.intValue((Global.eval("8 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_9", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_9", xdc.services.intern.xsr.Enum.intValue((Global.eval("9 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_10", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_10", xdc.services.intern.xsr.Enum.intValue((Global.eval("10 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_11", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_11", xdc.services.intern.xsr.Enum.intValue((Global.eval("11 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_12", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHT0_12", xdc.services.intern.xsr.Enum.intValue(Global.eval("12 * 0x1000"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.MSC_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.MSC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.MSC_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.MSC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.MSC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.MSC", xdc.services.intern.xsr.Enum.intValue(0x080L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V", xdc.services.intern.xsr.Enum.intValue(0x040L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.REFON_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REFON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.REFON_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.REFON", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REFON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.REFON", xdc.services.intern.xsr.Enum.intValue(0x020L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON", xdc.services.intern.xsr.Enum.intValue(0x010L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE", xdc.services.intern.xsr.Enum.intValue(0x008L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE", xdc.services.intern.xsr.Enum.intValue(0x004L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ENC_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ENC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ENC_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ENC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ENC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ENC", xdc.services.intern.xsr.Enum.intValue(0x002L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC", xdc.services.intern.xsr.Enum.intValue(0x001L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_7", xdc.services.intern.xsr.Enum.intValue((Global.eval("7 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_8", xdc.services.intern.xsr.Enum.intValue((Global.eval("8 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_9", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_9", xdc.services.intern.xsr.Enum.intValue((Global.eval("9 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_10", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_10", xdc.services.intern.xsr.Enum.intValue((Global.eval("10 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_11", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_11", xdc.services.intern.xsr.Enum.intValue((Global.eval("11 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_12", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_12", xdc.services.intern.xsr.Enum.intValue((Global.eval("12 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_13", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_13", xdc.services.intern.xsr.Enum.intValue((Global.eval("13 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_14", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_14", xdc.services.intern.xsr.Enum.intValue((Global.eval("14 * 0x1000")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_15", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_15", xdc.services.intern.xsr.Enum.intValue(Global.eval("15 * 0x1000"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHS_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHS_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHS_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHS_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHS_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHS_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHS_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHS_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHS_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHS_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHS_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHS_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x400"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHP_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHP_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHP_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SHP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHP_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SHP", xdc.services.intern.xsr.Enum.intValue(0x0200L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ISSH_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ISSH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ISSH_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ISSH", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ISSH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ISSH", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x20")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_7", xdc.services.intern.xsr.Enum.intValue(Global.eval("7 * 0x20"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 8")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 8")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 8")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 8"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 2")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 2")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 2")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 2"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.EOS_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.EOS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.EOS_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.EOS", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SREF_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SREF_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SREF_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SREF_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SREF_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SREF_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SREF_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SREF_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SREF_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SREF_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SREF_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SREF_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SREF_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x10")))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.SREF_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.SREF_7", xdc.services.intern.xsr.Enum.intValue(Global.eval("7 * 0x10"))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15", xdc.services.intern.xsr.Enum.intValue(0x8000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14", xdc.services.intern.xsr.Enum.intValue(0x4000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13", xdc.services.intern.xsr.Enum.intValue(0x2000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12", xdc.services.intern.xsr.Enum.intValue(0x1000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11", xdc.services.intern.xsr.Enum.intValue(0x0800L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10", xdc.services.intern.xsr.Enum.intValue(0x0400L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9", xdc.services.intern.xsr.Enum.intValue(0x0200L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_0", xdc.services.intern.xsr.Enum.intValue((0L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_1", xdc.services.intern.xsr.Enum.intValue((1L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_2", xdc.services.intern.xsr.Enum.intValue((2L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_3", xdc.services.intern.xsr.Enum.intValue((3L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_4", xdc.services.intern.xsr.Enum.intValue((4L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_5", xdc.services.intern.xsr.Enum.intValue((5L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_6", xdc.services.intern.xsr.Enum.intValue((6L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_7", xdc.services.intern.xsr.Enum.intValue((7L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_8", xdc.services.intern.xsr.Enum.intValue((8L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_9", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_9", xdc.services.intern.xsr.Enum.intValue((9L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_10", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_10", xdc.services.intern.xsr.Enum.intValue((10L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_11", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_11", xdc.services.intern.xsr.Enum.intValue((11L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_12", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_12", xdc.services.intern.xsr.Enum.intValue((12L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_13", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_13", xdc.services.intern.xsr.Enum.intValue((13L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_14", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_14", xdc.services.intern.xsr.Enum.intValue((14L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.INCH_15", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.INCH_15", xdc.services.intern.xsr.Enum.intValue(15L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_NONE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_NONE", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12OVIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12OVIFG", xdc.services.intern.xsr.Enum.intValue((0x0002L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12TOVIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12TOVIFG", xdc.services.intern.xsr.Enum.intValue((0x0004L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG0", xdc.services.intern.xsr.Enum.intValue((0x0006L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG1", xdc.services.intern.xsr.Enum.intValue((0x0008L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG2", xdc.services.intern.xsr.Enum.intValue((0x000AL))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG3", xdc.services.intern.xsr.Enum.intValue((0x000CL))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG4", xdc.services.intern.xsr.Enum.intValue((0x000EL))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG5", xdc.services.intern.xsr.Enum.intValue((0x0010L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG6", xdc.services.intern.xsr.Enum.intValue((0x0012L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG7", xdc.services.intern.xsr.Enum.intValue((0x0014L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG8", xdc.services.intern.xsr.Enum.intValue((0x0016L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG9", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG9", xdc.services.intern.xsr.Enum.intValue((0x0018L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG10", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG10", xdc.services.intern.xsr.Enum.intValue((0x001AL))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG11", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG11", xdc.services.intern.xsr.Enum.intValue((0x001CL))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG12", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG12", xdc.services.intern.xsr.Enum.intValue((0x001EL))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG13", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG13", xdc.services.intern.xsr.Enum.intValue((0x0020L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG14", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG14", xdc.services.intern.xsr.Enum.intValue((0x0022L))+0));
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG15", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG15", xdc.services.intern.xsr.Enum.intValue(0x0024L)+0));
    }

    void SD16_A$$CONSTS()
    {
        // module SD16_A
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_0", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_1", xdc.services.intern.xsr.Enum.intValue(0x200L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_2", xdc.services.intern.xsr.Enum.intValue(0x400L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_3", xdc.services.intern.xsr.Enum.intValue(0x800L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP", xdc.services.intern.xsr.Enum.intValue(0x100L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_0", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_1", xdc.services.intern.xsr.Enum.intValue(0x40L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_2", xdc.services.intern.xsr.Enum.intValue(0x80L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_3", xdc.services.intern.xsr.Enum.intValue(0xC0L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_0", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_1", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_2", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_3", xdc.services.intern.xsr.Enum.intValue(0x30L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON", xdc.services.intern.xsr.Enum.intValue(0x08L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON", xdc.services.intern.xsr.Enum.intValue(0x04L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_1", xdc.services.intern.xsr.Enum.intValue(0x2000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_2", xdc.services.intern.xsr.Enum.intValue(0x4000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_3", xdc.services.intern.xsr.Enum.intValue(0x6000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI", xdc.services.intern.xsr.Enum.intValue(0x10000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR", xdc.services.intern.xsr.Enum.intValue(0x800L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_OFF", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL", xdc.services.intern.xsr.Enum.intValue(0x400L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_256", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_256", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_128", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_128", xdc.services.intern.xsr.Enum.intValue(0x100L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_64", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_64", xdc.services.intern.xsr.Enum.intValue(0x200L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_32", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_32", xdc.services.intern.xsr.Enum.intValue(0x300L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_512", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_512", xdc.services.intern.xsr.Enum.intValue(0x800L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_1024", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_1024", xdc.services.intern.xsr.Enum.intValue(0x900L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG", xdc.services.intern.xsr.Enum.intValue(0x80L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC", xdc.services.intern.xsr.Enum.intValue(0x40L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE", xdc.services.intern.xsr.Enum.intValue(0x08L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG", xdc.services.intern.xsr.Enum.intValue(0x04L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_0", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_1", xdc.services.intern.xsr.Enum.intValue(0x40L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_2", xdc.services.intern.xsr.Enum.intValue(0x80L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_3", xdc.services.intern.xsr.Enum.intValue(0xC0L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_1", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_2", xdc.services.intern.xsr.Enum.intValue(0x08L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_4", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_8", xdc.services.intern.xsr.Enum.intValue(0x18L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_16", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_16", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_32", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_32", xdc.services.intern.xsr.Enum.intValue(0x28L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_0", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_1", xdc.services.intern.xsr.Enum.intValue(0x001L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_2", xdc.services.intern.xsr.Enum.intValue(0x010L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_3", xdc.services.intern.xsr.Enum.intValue(0x011L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_4", xdc.services.intern.xsr.Enum.intValue(0x100L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_5", xdc.services.intern.xsr.Enum.intValue(0x101L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_6", xdc.services.intern.xsr.Enum.intValue(0x110L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_7", xdc.services.intern.xsr.Enum.intValue(0x111L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0_t", "ti.catalog.msp430.peripherals.adc"), "ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
    }

    void ADC10_B$$CONSTS()
    {
        // module ADC10_B
    }

    void ADC12_B$$CONSTS()
    {
        // module ADC12_B
    }

    void IADC$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ADC10$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Module", "ti.catalog.msp430.peripherals.adc"), om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Instance", "ti.catalog.msp430.peripherals.adc"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Params", "ti.catalog.msp430.peripherals.adc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$adc$ADC10$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.adc.ADC10'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.adc.ADC10.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.adc']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Module", "ti.catalog.msp430.peripherals.adc"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10$$Object", "ti.catalog.msp430.peripherals.adc"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Params", "ti.catalog.msp430.peripherals.adc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$adc$ADC10$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.adc.ADC10'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ADC12$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Module", "ti.catalog.msp430.peripherals.adc"), om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Instance", "ti.catalog.msp430.peripherals.adc"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Params", "ti.catalog.msp430.peripherals.adc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$adc$ADC12$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.adc.ADC12'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.adc.ADC12.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.adc']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Module", "ti.catalog.msp430.peripherals.adc"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12$$Object", "ti.catalog.msp430.peripherals.adc"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Params", "ti.catalog.msp430.peripherals.adc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$adc$ADC12$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.adc.ADC12'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void SD16_A$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Module", "ti.catalog.msp430.peripherals.adc"), om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Instance", "ti.catalog.msp430.peripherals.adc"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Params", "ti.catalog.msp430.peripherals.adc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$adc$SD16_A$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.adc.SD16_A'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.adc.SD16_A.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.adc']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Module", "ti.catalog.msp430.peripherals.adc"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A$$Object", "ti.catalog.msp430.peripherals.adc"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Params", "ti.catalog.msp430.peripherals.adc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$adc$SD16_A$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.adc.SD16_A'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ADC10_B$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Module", "ti.catalog.msp430.peripherals.adc"), om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Instance", "ti.catalog.msp430.peripherals.adc"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Params", "ti.catalog.msp430.peripherals.adc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$adc$ADC10_B$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.adc.ADC10_B'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.adc.ADC10_B.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.adc']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Module", "ti.catalog.msp430.peripherals.adc"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B$$Object", "ti.catalog.msp430.peripherals.adc"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Params", "ti.catalog.msp430.peripherals.adc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$adc$ADC10_B$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.adc.ADC10_B'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ADC12_B$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Module", "ti.catalog.msp430.peripherals.adc"), om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Instance", "ti.catalog.msp430.peripherals.adc"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Params", "ti.catalog.msp430.peripherals.adc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$adc$ADC12_B$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.adc.ADC12_B'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.adc.ADC12_B.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.adc']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Module", "ti.catalog.msp430.peripherals.adc"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B$$Object", "ti.catalog.msp430.peripherals.adc"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Params", "ti.catalog.msp430.peripherals.adc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$adc$ADC12_B$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.adc.ADC12_B'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IADC$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ADC10$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ADC12$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SD16_A$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ADC10_B$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ADC12_B$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IADC$$SIZES()
    {
    }

    void ADC10$$SIZES()
    {
    }

    void ADC12$$SIZES()
    {
    }

    void SD16_A$$SIZES()
    {
    }

    void ADC10_B$$SIZES()
    {
    }

    void ADC12_B$$SIZES()
    {
    }

    void IADC$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Module", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.IADC.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Instance", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.IADC.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.IADC$$Params", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.IADC.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "wh");
        // struct IADC.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.IADC$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
        // struct IADC.regIntVect_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.IADC$$regIntVect_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("registerName", $$T_Str, $$UNDEF, "w");
                po.addFld("registerDescription", $$T_Str, $$UNDEF, "w");
                po.addFld("isrToggleString", $$T_Str, $$UNDEF, "w");
                po.addFld("priorityName", $$T_Str, $$UNDEF, "w");
                po.addFld("interruptEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("interruptHandler", $$T_Bool, $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
    }

    void ADC10$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/adc/ADC10.xs");
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Module", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10.Module", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Module", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10$$create", "ti.catalog.msp430.peripherals.adc"), Global.get("ti$catalog$msp430$peripherals$adc$ADC10$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10$$construct", "ti.catalog.msp430.peripherals.adc"), Global.get("ti$catalog$msp430$peripherals$adc$ADC10$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC10$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.adc"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.adc"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.adc"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Instance", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10.Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Instance", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("ADC10CTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL0_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("ADC10SC", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_OFF"), "ENC", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ENC_OFF"), "ADC10IFG", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_OFF"), "ADC10IE", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_OFF"), "ADC10ON", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_OFF"), "REFON", om.find("ti.catalog.msp430.peripherals.adc.ADC10.REFON_OFF"), "REF2_5V", om.find("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_OFF"), "MSC", om.find("ti.catalog.msp430.peripherals.adc.ADC10.MSC_OFF"), "REFBURST", om.find("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_OFF"), "REFOUT", om.find("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_OFF"), "ADC10SR", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_OFF"), "ADC10SHT", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_0"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC10.SREF_0")), "wh");
        po.addFld("ADC10CTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL1_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("ADC10BUSY", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_OFF"), "CONSEQ", om.find("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_0"), "ADC10SSEL", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_0"), "ADC10DIV", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_0"), "ISSH", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ISSH_OFF"), "ADC10DF", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_OFF"), "SHS", om.find("ti.catalog.msp430.peripherals.adc.ADC10.SHS_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC10.INCH_0")), "wh");
        po.addFld("ADC10AE0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC10AE1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC10DTC0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DTC0_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("ADC10TB", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_OFF"), "ADC10CT", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_OFF")), "wh");
        po.addFld("ADC10DTC1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("ADC10SA", new Proto.Adr("xdc_Bits16*", "Pn"), 0x200L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.regIntVect_t", "ti.catalog.msp430.peripherals.adc"), false, xdc.services.intern.xsr.Enum.intValue(1L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"), false), Global.newArray(new Object[]{Global.newObject("register", "ADC10CTL0", "regForceSet", false), Global.newObject("register", "ADC10CTL1", "regForceSet", false), Global.newObject("register", "ADC10AE0", "regForceSet", false), Global.newObject("register", "ADC10AE1", "regForceSet", false), Global.newObject("register", "ADC10DTC0", "regForceSet", false), Global.newObject("register", "ADC10DTC1", "regForceSet", false), Global.newObject("register", "ADC10SA", "regForceSet", true)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10$$Params", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10.Params", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC$$Params", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("ADC10CTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL0_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("ADC10SC", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_OFF"), "ENC", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ENC_OFF"), "ADC10IFG", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_OFF"), "ADC10IE", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_OFF"), "ADC10ON", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_OFF"), "REFON", om.find("ti.catalog.msp430.peripherals.adc.ADC10.REFON_OFF"), "REF2_5V", om.find("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_OFF"), "MSC", om.find("ti.catalog.msp430.peripherals.adc.ADC10.MSC_OFF"), "REFBURST", om.find("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_OFF"), "REFOUT", om.find("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_OFF"), "ADC10SR", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_OFF"), "ADC10SHT", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_0"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC10.SREF_0")), "wh");
        po.addFld("ADC10CTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL1_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("ADC10BUSY", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_OFF"), "CONSEQ", om.find("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_0"), "ADC10SSEL", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_0"), "ADC10DIV", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_0"), "ISSH", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ISSH_OFF"), "ADC10DF", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_OFF"), "SHS", om.find("ti.catalog.msp430.peripherals.adc.ADC10.SHS_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC10.INCH_0")), "wh");
        po.addFld("ADC10AE0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC10AE1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC10DTC0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DTC0_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("ADC10TB", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_OFF"), "ADC10CT", om.find("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_OFF")), "wh");
        po.addFld("ADC10DTC1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("ADC10SA", new Proto.Adr("xdc_Bits16*", "Pn"), 0x200L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.regIntVect_t", "ti.catalog.msp430.peripherals.adc"), false, xdc.services.intern.xsr.Enum.intValue(1L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"), false), Global.newArray(new Object[]{Global.newObject("register", "ADC10CTL0", "regForceSet", false), Global.newObject("register", "ADC10CTL1", "regForceSet", false), Global.newObject("register", "ADC10AE0", "regForceSet", false), Global.newObject("register", "ADC10AE1", "regForceSet", false), Global.newObject("register", "ADC10DTC0", "regForceSet", false), Global.newObject("register", "ADC10DTC1", "regForceSet", false), Global.newObject("register", "ADC10SA", "regForceSet", true)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10$$Object", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10.Object", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Instance", "ti.catalog.msp430.peripherals.adc"));
        // struct ADC10.ADC10CTL0_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10$$ADC10CTL0_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL0_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("ADC10SC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ENC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ENC_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC10IFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC10IE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC10ON", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("REFON", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFON_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("REF2_5V", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("MSC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.MSC_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("REFBURST", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("REFOUT", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC10SR", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC10SHT", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SREF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
        // struct ADC10.ADC10CTL1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10$$ADC10CTL1_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("ADC10BUSY", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("CONSEQ", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC10SSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC10DIV", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ISSH", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ISSH_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC10DF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SHS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SHS_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("INCH", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
        // struct ADC10.ADC10DTC0_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10$$ADC10DTC0_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DTC0_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("ADC10TB", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC10CT", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
    }

    void ADC12$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/adc/ADC12.xs");
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Module", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12.Module", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Module", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12$$create", "ti.catalog.msp430.peripherals.adc"), Global.get("ti$catalog$msp430$peripherals$adc$ADC12$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12$$construct", "ti.catalog.msp430.peripherals.adc"), Global.get("ti$catalog$msp430$peripherals$adc$ADC12$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC12$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.adc"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.adc"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.adc"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Instance", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12.Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Instance", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("ADC12CTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL0_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("ADC12SHT1", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_0"), "ADC12SHT0", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_0"), "MSC", om.find("ti.catalog.msp430.peripherals.adc.ADC12.MSC_OFF"), "REF2_5V", om.find("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_OFF"), "REFON", om.find("ti.catalog.msp430.peripherals.adc.ADC12.REFON_OFF"), "ADC12ON", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_OFF"), "ADC12OVIE", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_OFF"), "ADC12TOVIE", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_OFF"), "ENC", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ENC_OFF"), "ADC12SC", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_OFF")), "wh");
        po.addFld("ADC12CTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL1_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("CSTARTADD", om.find("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_0"), "SHS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SHS_0"), "SHP", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SHP_OFF"), "ISSH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ISSH_OFF"), "ADC12DIV", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_0"), "ADC12SSEL", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_0"), "CONSEQ", om.find("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_0"), "ADC12BUSY", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_OFF")), "wh");
        po.addFld("ADC12MCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL7", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL8", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL9", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL10", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL11", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL12", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL13", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL14", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL15", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12IE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("ADC12IE15", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_OFF"), "ADC12IE14", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_OFF"), "ADC12IE13", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_OFF"), "ADC12IE12", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_OFF"), "ADC12IE11", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_OFF"), "ADC12IE10", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_OFF"), "ADC12IE9", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_OFF"), "ADC12IE8", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_OFF"), "ADC12IE7", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_OFF"), "ADC12IE6", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_OFF"), "ADC12IE5", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_OFF"), "ADC12IE4", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_OFF"), "ADC12IE3", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_OFF"), "ADC12IE2", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_OFF"), "ADC12IE1", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_OFF"), "ADC12IE0", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_OFF")), "wh");
        po.addFld("ADC12MEM0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM5", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM6", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM7", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM8", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM9", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM10", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM11", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM12", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM13", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM14", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM15", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12IV", Proto.Elm.newCNum("(xdc_Bits16)"), om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_NONE"), "wh");
        po.addFld("ADC12IFG", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.regIntVect_t", "ti.catalog.msp430.peripherals.adc"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"), false), Global.newArray(new Object[]{Global.newObject("register", "ADC12CTL0", "regForceSet", false), Global.newObject("register", "ADC12CTL1", "regForceSet", false), Global.newObject("register", "ADC12IFG", "regForceSet", false), Global.newObject("register", "ADC12IV", "regForceSet", false), Global.newObject("register", "ADC12IE", "regForceSet", false), Global.newObject("register", "ADC12MCTL0", "regForceSet", false), Global.newObject("register", "ADC12MCTL1", "regForceSet", false), Global.newObject("register", "ADC12MCTL2", "regForceSet", false), Global.newObject("register", "ADC12MCTL3", "regForceSet", false), Global.newObject("register", "ADC12MCTL4", "regForceSet", false), Global.newObject("register", "ADC12MCTL5", "regForceSet", false), Global.newObject("register", "ADC12MCTL6", "regForceSet", false), Global.newObject("register", "ADC12MCTL7", "regForceSet", false), Global.newObject("register", "ADC12MCTL8", "regForceSet", false), Global.newObject("register", "ADC12MCTL9", "regForceSet", false), Global.newObject("register", "ADC12MCTL10", "regForceSet", false), Global.newObject("register", "ADC12MCTL11", "regForceSet", false), Global.newObject("register", "ADC12MCTL12", "regForceSet", false), Global.newObject("register", "ADC12MCTL13", "regForceSet", false), Global.newObject("register", "ADC12MCTL14", "regForceSet", false), Global.newObject("register", "ADC12MCTL15", "regForceSet", false), Global.newObject("register", "ADC12MEM0", "regForceSet", false), Global.newObject("register", "ADC12MEM1", "regForceSet", false), Global.newObject("register", "ADC12MEM2", "regForceSet", false), Global.newObject("register", "ADC12MEM3", "regForceSet", false), Global.newObject("register", "ADC12MEM4", "regForceSet", false), Global.newObject("register", "ADC12MEM5", "regForceSet", false), Global.newObject("register", "ADC12MEM6", "regForceSet", false), Global.newObject("register", "ADC12MEM7", "regForceSet", false), Global.newObject("register", "ADC12MEM8", "regForceSet", false), Global.newObject("register", "ADC12MEM9", "regForceSet", false), Global.newObject("register", "ADC12MEM10", "regForceSet", false), Global.newObject("register", "ADC12MEM11", "regForceSet", false), Global.newObject("register", "ADC12MEM12", "regForceSet", false), Global.newObject("register", "ADC12MEM13", "regForceSet", false), Global.newObject("register", "ADC12MEM14", "regForceSet", false), Global.newObject("register", "ADC12MEM15", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12$$Params", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12.Params", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC$$Params", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("ADC12CTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL0_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("ADC12SHT1", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_0"), "ADC12SHT0", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_0"), "MSC", om.find("ti.catalog.msp430.peripherals.adc.ADC12.MSC_OFF"), "REF2_5V", om.find("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_OFF"), "REFON", om.find("ti.catalog.msp430.peripherals.adc.ADC12.REFON_OFF"), "ADC12ON", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_OFF"), "ADC12OVIE", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_OFF"), "ADC12TOVIE", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_OFF"), "ENC", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ENC_OFF"), "ADC12SC", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_OFF")), "wh");
        po.addFld("ADC12CTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL1_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("CSTARTADD", om.find("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_0"), "SHS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SHS_0"), "SHP", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SHP_OFF"), "ISSH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ISSH_OFF"), "ADC12DIV", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_0"), "ADC12SSEL", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_0"), "CONSEQ", om.find("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_0"), "ADC12BUSY", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_OFF")), "wh");
        po.addFld("ADC12MCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL7", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL8", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL9", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL10", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL11", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL12", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL13", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL14", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12MCTL15", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("EOS", om.find("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF"), "SREF", om.find("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0"), "INCH", om.find("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0")), "wh");
        po.addFld("ADC12IE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("ADC12IE15", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_OFF"), "ADC12IE14", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_OFF"), "ADC12IE13", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_OFF"), "ADC12IE12", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_OFF"), "ADC12IE11", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_OFF"), "ADC12IE10", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_OFF"), "ADC12IE9", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_OFF"), "ADC12IE8", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_OFF"), "ADC12IE7", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_OFF"), "ADC12IE6", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_OFF"), "ADC12IE5", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_OFF"), "ADC12IE4", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_OFF"), "ADC12IE3", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_OFF"), "ADC12IE2", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_OFF"), "ADC12IE1", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_OFF"), "ADC12IE0", om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_OFF")), "wh");
        po.addFld("ADC12MEM0", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM1", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM2", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM3", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM4", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM5", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM6", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM7", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM8", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM9", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM10", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM11", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM12", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM13", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM14", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12MEM15", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("ADC12IV", Proto.Elm.newCNum("(xdc_Bits16)"), om.find("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_NONE"), "wh");
        po.addFld("ADC12IFG", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.regIntVect_t", "ti.catalog.msp430.peripherals.adc"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"), false), Global.newArray(new Object[]{Global.newObject("register", "ADC12CTL0", "regForceSet", false), Global.newObject("register", "ADC12CTL1", "regForceSet", false), Global.newObject("register", "ADC12IFG", "regForceSet", false), Global.newObject("register", "ADC12IV", "regForceSet", false), Global.newObject("register", "ADC12IE", "regForceSet", false), Global.newObject("register", "ADC12MCTL0", "regForceSet", false), Global.newObject("register", "ADC12MCTL1", "regForceSet", false), Global.newObject("register", "ADC12MCTL2", "regForceSet", false), Global.newObject("register", "ADC12MCTL3", "regForceSet", false), Global.newObject("register", "ADC12MCTL4", "regForceSet", false), Global.newObject("register", "ADC12MCTL5", "regForceSet", false), Global.newObject("register", "ADC12MCTL6", "regForceSet", false), Global.newObject("register", "ADC12MCTL7", "regForceSet", false), Global.newObject("register", "ADC12MCTL8", "regForceSet", false), Global.newObject("register", "ADC12MCTL9", "regForceSet", false), Global.newObject("register", "ADC12MCTL10", "regForceSet", false), Global.newObject("register", "ADC12MCTL11", "regForceSet", false), Global.newObject("register", "ADC12MCTL12", "regForceSet", false), Global.newObject("register", "ADC12MCTL13", "regForceSet", false), Global.newObject("register", "ADC12MCTL14", "regForceSet", false), Global.newObject("register", "ADC12MCTL15", "regForceSet", false), Global.newObject("register", "ADC12MEM0", "regForceSet", false), Global.newObject("register", "ADC12MEM1", "regForceSet", false), Global.newObject("register", "ADC12MEM2", "regForceSet", false), Global.newObject("register", "ADC12MEM3", "regForceSet", false), Global.newObject("register", "ADC12MEM4", "regForceSet", false), Global.newObject("register", "ADC12MEM5", "regForceSet", false), Global.newObject("register", "ADC12MEM6", "regForceSet", false), Global.newObject("register", "ADC12MEM7", "regForceSet", false), Global.newObject("register", "ADC12MEM8", "regForceSet", false), Global.newObject("register", "ADC12MEM9", "regForceSet", false), Global.newObject("register", "ADC12MEM10", "regForceSet", false), Global.newObject("register", "ADC12MEM11", "regForceSet", false), Global.newObject("register", "ADC12MEM12", "regForceSet", false), Global.newObject("register", "ADC12MEM13", "regForceSet", false), Global.newObject("register", "ADC12MEM14", "regForceSet", false), Global.newObject("register", "ADC12MEM15", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12$$Object", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12.Object", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Instance", "ti.catalog.msp430.peripherals.adc"));
        // struct ADC12.ADC12CTL0_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12$$ADC12CTL0_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL0_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("ADC12SHT1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12SHT0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("MSC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.MSC_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("REF2_5V", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("REFON", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REFON_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12ON", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12OVIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12TOVIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ENC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ENC_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12SC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
        // struct ADC12.ADC12CTL1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12$$ADC12CTL1_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("CSTARTADD", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SHS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHS_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SHP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHP_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ISSH", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ISSH_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12DIV", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12SSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("CONSEQ", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12BUSY", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
        // struct ADC12.ADC12MCTL_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12$$ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("EOS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.EOS_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SREF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("INCH", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
        // struct ADC12.ADC12IE_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12$$ADC12IE_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("ADC12IE15", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE14", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE13", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE12", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE11", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE10", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE9", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE8", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE7", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("ADC12IE0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
    }

    void SD16_A$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/adc/SD16_A.xs");
        om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Module", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.SD16_A.Module", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Module", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A$$create", "ti.catalog.msp430.peripherals.adc"), Global.get("ti$catalog$msp430$peripherals$adc$SD16_A$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A$$construct", "ti.catalog.msp430.peripherals.adc"), Global.get("ti$catalog$msp430$peripherals$adc$SD16_A$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.SD16_A$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.adc"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.adc"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.adc"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Instance", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.SD16_A.Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Instance", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("SD16CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("SD16XDIV", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_0"), "SD16LP", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_OFF"), "SD16DIV", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_0"), "SD16SSEL", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_0"), "SD16VMIDON", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_OFF"), "SD16REFON", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_OFF"), "SD16OVIE", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_OFF")), "wh");
        po.addFld("SD16CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CCTL0_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("SD16UNI", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_OFF"), "SD16XOSR", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_OFF"), "SD16SNGL", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_OFF"), "SD16OSR", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_256"), "SD16LSBTOG", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_OFF"), "SD16LSBACC", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_OFF"), "SD16OVIFG", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_OFF"), "SD16DF", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_OFF"), "SD16IE", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_OFF"), "SD16IFG", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_OFF"), "SD16SC", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_OFF")), "wh");
        po.addFld("SD16INCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCTL0_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("SD16INTDLY", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_0"), "SD16GAIN", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_1"), "SD16INCH", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_0")), "wh");
        po.addFld("SD16AE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("SD16AE0", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_OFF"), "SD16AE1", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_OFF"), "SD16AE2", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_OFF"), "SD16AE3", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_OFF"), "SD16AE4", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_OFF"), "SD16AE5", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_OFF"), "SD16AE6", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_OFF"), "SD16AE7", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_OFF")), "wh");
        po.addFld("SD16IV", Proto.Elm.newCNum("(xdc_Bits16)"), om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG_OFF"), "wh");
        po.addFld("SD16MEM0", Proto.Elm.newCNum("(xdc_Bits16)"), om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0_OFF"), "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.regIntVect_t", "ti.catalog.msp430.peripherals.adc"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"), false), Global.newArray(new Object[]{Global.newObject("register", "SD16CTL", "regForceSet", false), Global.newObject("register", "SD16CCTL0", "regForceSet", false), Global.newObject("register", "SD16INCTL0", "regForceSet", false), Global.newObject("register", "SD16AE", "regForceSet", false), Global.newObject("register", "SD16IV", "regForceSet", false), Global.newObject("register", "SD16MEM0", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A$$Params", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.SD16_A.Params", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC$$Params", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("SD16CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CTL_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("SD16XDIV", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_0"), "SD16LP", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_OFF"), "SD16DIV", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_0"), "SD16SSEL", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_0"), "SD16VMIDON", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_OFF"), "SD16REFON", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_OFF"), "SD16OVIE", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_OFF")), "wh");
        po.addFld("SD16CCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CCTL0_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("SD16UNI", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_OFF"), "SD16XOSR", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_OFF"), "SD16SNGL", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_OFF"), "SD16OSR", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_256"), "SD16LSBTOG", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_OFF"), "SD16LSBACC", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_OFF"), "SD16OVIFG", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_OFF"), "SD16DF", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_OFF"), "SD16IE", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_OFF"), "SD16IFG", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_OFF"), "SD16SC", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_OFF")), "wh");
        po.addFld("SD16INCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCTL0_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("SD16INTDLY", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_0"), "SD16GAIN", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_1"), "SD16INCH", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_0")), "wh");
        po.addFld("SD16AE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE_t", "ti.catalog.msp430.peripherals.adc"), Global.newObject("SD16AE0", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_OFF"), "SD16AE1", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_OFF"), "SD16AE2", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_OFF"), "SD16AE3", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_OFF"), "SD16AE4", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_OFF"), "SD16AE5", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_OFF"), "SD16AE6", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_OFF"), "SD16AE7", om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_OFF")), "wh");
        po.addFld("SD16IV", Proto.Elm.newCNum("(xdc_Bits16)"), om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG_OFF"), "wh");
        po.addFld("SD16MEM0", Proto.Elm.newCNum("(xdc_Bits16)"), om.find("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0_OFF"), "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.regIntVect_t", "ti.catalog.msp430.peripherals.adc"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"), false), Global.newArray(new Object[]{Global.newObject("register", "SD16CTL", "regForceSet", false), Global.newObject("register", "SD16CCTL0", "regForceSet", false), Global.newObject("register", "SD16INCTL0", "regForceSet", false), Global.newObject("register", "SD16AE", "regForceSet", false), Global.newObject("register", "SD16IV", "regForceSet", false), Global.newObject("register", "SD16MEM0", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A$$Object", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.SD16_A.Object", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Instance", "ti.catalog.msp430.peripherals.adc"));
        // struct SD16_A.SD16CTL_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A$$SD16CTL_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CTL_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("SD16XDIV", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16LP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16DIV", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16SSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16VMIDON", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16REFON", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16OVIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
        // struct SD16_A.SD16CCTL0_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A$$SD16CCTL0_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CCTL0_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("SD16UNI", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16XOSR", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16SNGL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16OSR", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16LSBTOG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16LSBACC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16OVIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16DF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16IE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16IFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16SC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
        // struct SD16_A.SD16INCTL0_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A$$SD16INCTL0_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCTL0_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("SD16INTDLY", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16GAIN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16INCH", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
        // struct SD16_A.SD16AE_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A$$SD16AE_t", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("SD16AE0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16AE1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16AE2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16AE3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16AE4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16AE5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16AE6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
                po.addFld("SD16AE7", (Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_t", "ti.catalog.msp430.peripherals.adc"), $$UNDEF, "w");
    }

    void ADC10_B$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/adc/ADC10_B.xs");
        om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Module", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10_B.Module", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Module", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B$$create", "ti.catalog.msp430.peripherals.adc"), Global.get("ti$catalog$msp430$peripherals$adc$ADC10_B$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B$$construct", "ti.catalog.msp430.peripherals.adc"), Global.get("ti$catalog$msp430$peripherals$adc$ADC10_B$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC10_B$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.adc"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.adc"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.adc"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Instance", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10_B.Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Instance", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.regIntVect_t", "ti.catalog.msp430.peripherals.adc"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"), false), Global.newArray(new Object[]{}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B$$Params", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10_B.Params", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC$$Params", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.regIntVect_t", "ti.catalog.msp430.peripherals.adc"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"), false), Global.newArray(new Object[]{}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B$$Object", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC10_B.Object", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Instance", "ti.catalog.msp430.peripherals.adc"));
    }

    void ADC12_B$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/adc/ADC12_B.xs");
        om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Module", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12_B.Module", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Module", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B$$create", "ti.catalog.msp430.peripherals.adc"), Global.get("ti$catalog$msp430$peripherals$adc$ADC12_B$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B$$construct", "ti.catalog.msp430.peripherals.adc"), Global.get("ti$catalog$msp430$peripherals$adc$ADC12_B$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.adc.ADC12_B$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.adc"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.adc"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.adc"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Instance", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12_B.Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Instance", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.regIntVect_t", "ti.catalog.msp430.peripherals.adc"), false, xdc.services.intern.xsr.Enum.intValue(35L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"), false), Global.newArray(new Object[]{}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B$$Params", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12_B.Params", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC$$Params", "ti.catalog.msp430.peripherals.adc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.regIntVect_t", "ti.catalog.msp430.peripherals.adc"), false, xdc.services.intern.xsr.Enum.intValue(35L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"), false), Global.newArray(new Object[]{}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B$$Object", "ti.catalog.msp430.peripherals.adc");
        po.init("ti.catalog.msp430.peripherals.adc.ADC12_B.Object", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Instance", "ti.catalog.msp430.peripherals.adc"));
    }

    void IADC$$ROV()
    {
    }

    void ADC10$$ROV()
    {
    }

    void ADC12$$ROV()
    {
    }

    void SD16_A$$ROV()
    {
    }

    void ADC10_B$$ROV()
    {
    }

    void ADC12_B$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.adc.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.adc"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.adc", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.adc");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.adc.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.adc'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.adc$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.adc$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.adc$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IADC$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.IADC", "ti.catalog.msp430.peripherals.adc");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Module", "ti.catalog.msp430.peripherals.adc");
        vo.init2(po, "ti.catalog.msp430.peripherals.adc.IADC", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Instance", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Params", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.Params", "ti.catalog.msp430.peripherals.adc")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.adc", "ti.catalog.msp430.peripherals.adc"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IADC", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IADC");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ADC10$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10", "ti.catalog.msp430.peripherals.adc");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Module", "ti.catalog.msp430.peripherals.adc");
        vo.init2(po, "ti.catalog.msp430.peripherals.adc.ADC10", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10$$capsule", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Instance", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Params", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Params", "ti.catalog.msp430.peripherals.adc")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.adc", "ti.catalog.msp430.peripherals.adc"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SC_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ENC_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ENC_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10IFG_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10IE_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10ON_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFON_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFON_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REF2_5V_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("MSC_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.MSC_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFBURST_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFOUT_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SR_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SHT_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10BUSY_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CONSEQ_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SSEL_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DIV_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ISSH_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ISSH_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DF_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHS_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SHS_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10CT_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10TB_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10CTL0_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL0_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL0_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10CTL1_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL1_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CTL1_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DTC0_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DTC0_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DTC0_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SC_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SC", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SC", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ENC_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ENC_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ENC", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ENC", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10IFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10IFG", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IFG", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10IE_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10IE", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10IE", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10ON_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10ON", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10ON", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFON_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFON_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFON", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFON", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REF2_5V_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REF2_5V", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REF2_5V", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("MSC_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.MSC_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("MSC", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.MSC", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFBURST_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFBURST", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFBURST", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFOUT_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFOUT", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.REFOUT", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SR_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SR", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SR", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SHT_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SHT_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SHT_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SHT_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SHT_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SREF_7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10BUSY_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10BUSY", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10BUSY", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CONSEQ_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CONSEQ_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CONSEQ_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CONSEQ_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.CONSEQ_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SSEL_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SSEL_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SSEL_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10SSEL_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10SSEL_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DIV_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DIV_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DIV_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DIV_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DIV_4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DIV_5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DIV_6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DIV_7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DIV_7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ISSH_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ISSH_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ISSH", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ISSH", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DF_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10DF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10DF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHS_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SHS_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHS_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SHS_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHS_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SHS_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHS_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.SHS_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_8", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_8", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_9", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_9", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_10", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_10", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_11", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_11", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_12", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_12", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_13", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_13", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_14", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_14", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_15", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.INCH_15", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10CT_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10CT", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10CT", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10TB_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC10TB", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.ADC10TB", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.adc");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.adc")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.adc.ADC10$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10.Object", "ti.catalog.msp430.peripherals.adc"));
        pkgV.bind("ADC10", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ADC10");
    }

    void ADC12$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12", "ti.catalog.msp430.peripherals.adc");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Module", "ti.catalog.msp430.peripherals.adc");
        vo.init2(po, "ti.catalog.msp430.peripherals.adc.ADC12", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12$$capsule", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Instance", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Params", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Params", "ti.catalog.msp430.peripherals.adc")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.adc", "ti.catalog.msp430.peripherals.adc"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12SHT1_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT1_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12SHT0_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SHT0_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("MSC_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.MSC_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REF2_5V_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFON_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REFON_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12ON_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12OVIE_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12TOVIE_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ENC_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ENC_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12SC_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHS_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHS_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHP_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHP_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ISSH_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ISSH_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12DIV_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12SSEL_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CONSEQ_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12BUSY_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("EOS_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.EOS_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE15_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE14_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE13_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE12_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE11_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE10_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE9_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE8_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE7_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE6_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE5_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE4_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE3_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE2_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE1_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE0_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12CTL0_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL0_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL0_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12CTL1_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL1_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12CTL1_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12MCTL_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12MCTL_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE_t", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_8", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_8", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_9", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_9", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_10", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_10", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_11", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_11", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT1_12", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT1_12", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_8", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_8", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_9", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_9", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_10", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_10", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_11", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_11", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHT0_12", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHT0_12", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("MSC_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.MSC_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("MSC", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.MSC", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REF2_5V_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REF2_5V", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REF2_5V", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFON_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REFON_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("REFON", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.REFON", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12ON_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12ON", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12ON", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12OVIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12OVIE", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12OVIE", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12TOVIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12TOVIE", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12TOVIE", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ENC_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ENC_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ENC", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ENC", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12SC_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12SC", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SC", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_8", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_8", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_9", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_9", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_10", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_10", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_11", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_11", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_12", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_12", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_13", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_13", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_14", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_14", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CSTARTADD_15", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CSTARTADD_15", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHS_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHS_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHS_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHS_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHS_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHS_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHS_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHS_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHP_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHP_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SHP", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SHP", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ISSH_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ISSH_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ISSH", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ISSH", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12DIV_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12DIV_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12DIV_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12DIV_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12DIV_4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12DIV_5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12DIV_6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12DIV_7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12DIV_7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12SSEL_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12SSEL_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12SSEL_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12SSEL_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12SSEL_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CONSEQ_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CONSEQ_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CONSEQ_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("CONSEQ_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.CONSEQ_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12BUSY_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12BUSY", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12BUSY", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("EOS_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.EOS_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("EOS", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.EOS", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SREF_7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.SREF_7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE15_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE15", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE15", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE14_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE14", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE14", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE13_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE13", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE13", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE12_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE12", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE12", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE11_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE11", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE11", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE10_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE10", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE10", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE9_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE9", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE9", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE8_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE8", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE8", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE7_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE6_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE5_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE4_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE3_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE2_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE1_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE0_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IE0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IE0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_8", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_8", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_9", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_9", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_10", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_10", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_11", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_11", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_12", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_12", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_13", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_13", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_14", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_14", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("INCH_15", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.INCH_15", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_NONE", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_NONE", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12OVIFG", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12OVIFG", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12TOVIFG", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12TOVIFG", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG0", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG1", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG2", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG3", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG4", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG5", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG6", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG7", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG8", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG8", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG9", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG9", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG10", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG10", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG11", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG11", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG12", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG12", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG13", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG13", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG14", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG14", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ADC12IV_ADC12IFG15", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.ADC12IV_ADC12IFG15", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.adc");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.adc")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.adc.ADC12$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12.Object", "ti.catalog.msp430.peripherals.adc"));
        pkgV.bind("ADC12", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ADC12");
    }

    void SD16_A$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A", "ti.catalog.msp430.peripherals.adc");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Module", "ti.catalog.msp430.peripherals.adc");
        vo.init2(po, "ti.catalog.msp430.peripherals.adc.SD16_A", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A$$capsule", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Instance", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Params", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Params", "ti.catalog.msp430.peripherals.adc")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.adc", "ti.catalog.msp430.peripherals.adc"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16XDIV_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16LP_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16DIV_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SSEL_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16VMIDON_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16REFON_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OVIE_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16BUF_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16UNI_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16XOSR_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SNGL_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OSR_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16LSBTOG_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16LSBACC_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OVIFG_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16DF_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IE_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IFG_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SC_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INTDLY_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16GAIN_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INCH_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE7_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE6_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE5_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE4_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE3_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE2_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE1_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE0_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IV_SD16OVIFG_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IV_SD16MEM0_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16CTL_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CTL_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CTL_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16CCTL0_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CCTL0_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16CCTL0_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INCTL0_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCTL0_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCTL0_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE_t", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16XDIV_0", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16XDIV_1", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16XDIV_2", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16XDIV_3", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XDIV_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16LP_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16LP", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LP", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16DIV_0", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16DIV_1", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16DIV_2", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16DIV_3", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DIV_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SSEL_0", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SSEL_1", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SSEL_2", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SSEL_3", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SSEL_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16VMIDON_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16VMIDON", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16VMIDON", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16REFON_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16REFON", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16REFON", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OVIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OVIE", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIE", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16BUF_0", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16BUF_1", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16BUF_2", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16BUF_3", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16BUF_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16UNI_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16UNI", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16UNI", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16XOSR_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16XOSR", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16XOSR", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SNGL_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SNGL", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SNGL", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OSR_256", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_256", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OSR_128", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_128", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OSR_64", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_64", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OSR_32", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_32", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OSR_512", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_512", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OSR_1024", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OSR_1024", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16LSBTOG_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16LSBTOG", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBTOG", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16LSBACC_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16LSBACC", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16LSBACC", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OVIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16OVIFG", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16OVIFG", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16DF_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16DF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16DF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IE_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IE", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IE", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IFG", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IFG", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SC_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16SC", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16SC", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INTDLY_0", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INTDLY_1", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INTDLY_2", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INTDLY_3", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INTDLY_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16GAIN_1", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16GAIN_2", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16GAIN_4", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16GAIN_8", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_8", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16GAIN_16", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_16", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16GAIN_32", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16GAIN_32", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INCH_0", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INCH_1", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INCH_2", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INCH_3", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INCH_4", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INCH_5", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INCH_6", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16INCH_7", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16INCH_7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE7_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE7", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE7", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE6_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE6", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE6", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE5_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE5", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE5", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE4_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE4", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE4", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE3_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE3", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE3", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE2_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE2", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE2", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE1_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE1", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE1", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE0_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16AE0", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16AE0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IV_SD16OVIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IV_SD16OVIFG", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16OVIFG", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IV_SD16MEM0_OFF", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0_OFF", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("SD16IV_SD16MEM0", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.SD16IV_SD16MEM0", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.adc");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.adc")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.adc.SD16_A$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A.Object", "ti.catalog.msp430.peripherals.adc"));
        pkgV.bind("SD16_A", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SD16_A");
    }

    void ADC10_B$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B", "ti.catalog.msp430.peripherals.adc");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Module", "ti.catalog.msp430.peripherals.adc");
        vo.init2(po, "ti.catalog.msp430.peripherals.adc.ADC10_B", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B$$capsule", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Instance", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Params", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Params", "ti.catalog.msp430.peripherals.adc")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.adc", "ti.catalog.msp430.peripherals.adc"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.adc");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.adc")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.adc.ADC10_B$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B.Object", "ti.catalog.msp430.peripherals.adc"));
        pkgV.bind("ADC10_B", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ADC10_B");
    }

    void ADC12_B$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B", "ti.catalog.msp430.peripherals.adc");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Module", "ti.catalog.msp430.peripherals.adc");
        vo.init2(po, "ti.catalog.msp430.peripherals.adc.ADC12_B", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B$$capsule", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Instance", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Params", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Params", "ti.catalog.msp430.peripherals.adc")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.adc", "ti.catalog.msp430.peripherals.adc"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.adc.IADC.regIntVect_t", "ti.catalog.msp430.peripherals.adc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.adc");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.adc")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.adc.ADC12_B$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B.Object", "ti.catalog.msp430.peripherals.adc"));
        pkgV.bind("ADC12_B", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ADC12_B");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10", "ti.catalog.msp430.peripherals.adc"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12", "ti.catalog.msp430.peripherals.adc"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.adc.SD16_A", "ti.catalog.msp430.peripherals.adc"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC10_B", "ti.catalog.msp430.peripherals.adc"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.adc.ADC12_B", "ti.catalog.msp430.peripherals.adc"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.adc.IADC")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.adc.ADC10")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.adc.ADC12")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.adc.SD16_A")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.adc.ADC10_B")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.adc.ADC12_B")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.adc")).add(pkgV);
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
        IADC$$OBJECTS();
        ADC10$$OBJECTS();
        ADC12$$OBJECTS();
        SD16_A$$OBJECTS();
        ADC10_B$$OBJECTS();
        ADC12_B$$OBJECTS();
        IADC$$CONSTS();
        ADC10$$CONSTS();
        ADC12$$CONSTS();
        SD16_A$$CONSTS();
        ADC10_B$$CONSTS();
        ADC12_B$$CONSTS();
        IADC$$CREATES();
        ADC10$$CREATES();
        ADC12$$CREATES();
        SD16_A$$CREATES();
        ADC10_B$$CREATES();
        ADC12_B$$CREATES();
        IADC$$FUNCTIONS();
        ADC10$$FUNCTIONS();
        ADC12$$FUNCTIONS();
        SD16_A$$FUNCTIONS();
        ADC10_B$$FUNCTIONS();
        ADC12_B$$FUNCTIONS();
        IADC$$SIZES();
        ADC10$$SIZES();
        ADC12$$SIZES();
        SD16_A$$SIZES();
        ADC10_B$$SIZES();
        ADC12_B$$SIZES();
        IADC$$TYPES();
        ADC10$$TYPES();
        ADC12$$TYPES();
        SD16_A$$TYPES();
        ADC10_B$$TYPES();
        ADC12_B$$TYPES();
        if (isROV) {
            IADC$$ROV();
            ADC10$$ROV();
            ADC12$$ROV();
            SD16_A$$ROV();
            ADC10_B$$ROV();
            ADC12_B$$ROV();
        }//isROV
        $$SINGLETONS();
        IADC$$SINGLETONS();
        ADC10$$SINGLETONS();
        ADC12$$SINGLETONS();
        SD16_A$$SINGLETONS();
        ADC10_B$$SINGLETONS();
        ADC12_B$$SINGLETONS();
        $$INITIALIZATION();
    }
}
