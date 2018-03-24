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

public class ti_catalog_msp430_peripherals_clock
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
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.special_function");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.clock", new Value.Obj("ti.catalog.msp430.peripherals.clock", pkgP));
    }

    void IClock$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.IClock.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.clock.IClock", new Value.Obj("ti.catalog.msp430.peripherals.clock.IClock", po));
        pkgV.bind("IClock", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.IClock$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.IClock$$AvailableClockVariations_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.clock.IClock.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.IClock$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.IClock.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.IClock$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.IClock.Params", new Proto.Str(po, true));
    }

    void BCSplus$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.clock.BCSplus", new Value.Obj("ti.catalog.msp430.peripherals.clock.BCSplus", po));
        pkgV.bind("BCSplus", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.AvailableClockVariations_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XTS_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.XTS_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.SELS_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.SELS_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$DCOCTL_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCOCTL_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$BCSCTL1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$BCSCTL2_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL2_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$BCSCTL3_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL3_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.Params", new Proto.Str(po, true));
    }

    void UCS$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS", new Value.Obj("ti.catalog.msp430.peripherals.clock.UCS", po));
        pkgV.bind("UCS", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.AvailableClockVariations_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO4_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DCO4_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO3_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DCO3_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO2_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DCO2_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO1_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DCO1_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO0_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DCO0_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD4_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.MOD4_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD3_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.MOD3_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD2_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.MOD2_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD1_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.MOD1_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD0_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.MOD0_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DISMOD_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DISMOD_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN0_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLN0_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN1_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLN1_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN2_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLN2_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN3_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLN3_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN4_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLN4_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN5_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLN5_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN6_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLN6_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN7_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLN7_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN8_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLN8_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN9_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLN9_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.SELA_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.SELS_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.SELM_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XTS_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XTS_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XCAP_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XCAP_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL0_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL0_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL2_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL2_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL3_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL3_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL4_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL4_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL5_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL5_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL6_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL6_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL7_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL7_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL8_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL8_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL9_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL9_t", new Proto.Str(spo, true));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t"));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_t", new Proto.Enm("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_t"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.clock.UCS.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.Params", new Proto.Str(po, true));
    }

    void CS$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.CS.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.clock.CS", new Value.Obj("ti.catalog.msp430.peripherals.clock.CS", po));
        pkgV.bind("CS", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.clock.CS.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        om.bind("ti.catalog.msp430.peripherals.clock.CS.AvailableClockVariations_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.clock.CS.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.CS$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.CS.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.CS$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.CS.Params", new Proto.Str(po, true));
    }

    void CS_A$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.CS_A.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.clock.CS_A", new Value.Obj("ti.catalog.msp430.peripherals.clock.CS_A", po));
        pkgV.bind("CS_A", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.clock.CS_A.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        om.bind("ti.catalog.msp430.peripherals.clock.CS_A.AvailableClockVariations_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.clock.CS_A.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.CS_A$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.CS_A.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.clock.CS_A$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.clock.CS_A.Params", new Proto.Str(po, true));
    }

    void IClock$$CONSTS()
    {
        // interface IClock
    }

    void BCSplus$$CONSTS()
    {
        // module BCSplus
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.MOD0", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.MOD1", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.MOD2", xdc.services.intern.xsr.Enum.intValue(0x04L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.MOD3", xdc.services.intern.xsr.Enum.intValue(0x08L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.MOD4", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DCO0_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DCO0", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DCO1_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DCO1", xdc.services.intern.xsr.Enum.intValue(0x40L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DCO2", xdc.services.intern.xsr.Enum.intValue(0x80L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF", xdc.services.intern.xsr.Enum.intValue(0x80L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XTS_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XTS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XTS_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XTS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XTS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XTS", xdc.services.intern.xsr.Enum.intValue(0x40L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2", xdc.services.intern.xsr.Enum.intValue(0x04L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3", xdc.services.intern.xsr.Enum.intValue(0x08L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.SELM_0", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.SELM_2", xdc.services.intern.xsr.Enum.intValue(0x80L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.SELM_3", xdc.services.intern.xsr.Enum.intValue(0xC0L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_0", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_1", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_2", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_3", xdc.services.intern.xsr.Enum.intValue(0x30L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_0", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_1", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_2", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_3", xdc.services.intern.xsr.Enum.intValue(0x30L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_0", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_1", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_2", xdc.services.intern.xsr.Enum.intValue(0x04L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_3", xdc.services.intern.xsr.Enum.intValue(0x06L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.SELS_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.SELS_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.SELS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.SELS", xdc.services.intern.xsr.Enum.intValue(0x08L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.DCOR", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_0", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_1", xdc.services.intern.xsr.Enum.intValue(0x40L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_2", xdc.services.intern.xsr.Enum.intValue(0x80L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_3", xdc.services.intern.xsr.Enum.intValue(0xC0L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_0", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_1", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_2", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_3", xdc.services.intern.xsr.Enum.intValue(0x30L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_0", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_1", xdc.services.intern.xsr.Enum.intValue(0x04L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_2", xdc.services.intern.xsr.Enum.intValue(0x08L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_3", xdc.services.intern.xsr.Enum.intValue(0x0CL)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
    }

    void UCS$$CONSTS()
    {
        // module UCS
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO4_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO4_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCO4_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO4_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCO4", xdc.services.intern.xsr.Enum.intValue(0x1000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO3_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCO3_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO3_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCO3", xdc.services.intern.xsr.Enum.intValue(0x0800L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCO2_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCO2", xdc.services.intern.xsr.Enum.intValue(0x0400L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCO1_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCO1", xdc.services.intern.xsr.Enum.intValue(0x0200L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCO0_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCO0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCO0", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD4_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD4_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MOD4_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD4_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MOD4", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD3_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MOD3_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD3_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MOD3", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MOD2_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MOD2", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MOD1_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MOD1", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MOD0_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MOD0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MOD0", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_1", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_2", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_3", xdc.services.intern.xsr.Enum.intValue(0x0030L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_4", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_5", xdc.services.intern.xsr.Enum.intValue(0x0050L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_6", xdc.services.intern.xsr.Enum.intValue(0x0060L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_7", xdc.services.intern.xsr.Enum.intValue(0x0070L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DISMOD_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DISMOD_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DISMOD_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DISMOD", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DISMOD_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DISMOD", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLD_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLD_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLD_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLD_1", xdc.services.intern.xsr.Enum.intValue(0x1000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLD_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLD_2", xdc.services.intern.xsr.Enum.intValue(0x2000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLD_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLD_3", xdc.services.intern.xsr.Enum.intValue(0x3000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLD_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLD_4", xdc.services.intern.xsr.Enum.intValue(0x4000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLD_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLD_5", xdc.services.intern.xsr.Enum.intValue(0x5000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLD_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLD_6", xdc.services.intern.xsr.Enum.intValue(0x6000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLD_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLD_7", xdc.services.intern.xsr.Enum.intValue(0x7000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN0_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN0_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN0", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN1_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN1_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN1", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN2_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN2_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN2", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN3_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN3_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN3_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN3", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN4_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN4_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN4_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN4_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN4", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN5_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN5_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN5_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN5_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN5", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN6_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN6_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN6_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN6_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN6", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN7_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN7_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN7_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN7_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN7", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN8_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN8_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN8_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN8_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN8", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN9_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN9_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN9_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLN9", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN9_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLN9", xdc.services.intern.xsr.Enum.intValue(0x0200L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELREF_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELREF_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELREF_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELREF_1", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELREF_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELREF_2", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELREF_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELREF_3", xdc.services.intern.xsr.Enum.intValue(0x0030L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELREF_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELREF_4", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELREF_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELREF_5", xdc.services.intern.xsr.Enum.intValue(0x0050L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELREF_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELREF_6", xdc.services.intern.xsr.Enum.intValue(0x0060L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELREF_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELREF_7", xdc.services.intern.xsr.Enum.intValue(0x0070L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_1", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_2", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_3", xdc.services.intern.xsr.Enum.intValue(0x0003L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_4", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_5", xdc.services.intern.xsr.Enum.intValue(0x0005L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_6", xdc.services.intern.xsr.Enum.intValue(0x0006L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_7", xdc.services.intern.xsr.Enum.intValue(0x0007L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELA_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELA_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELA_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELA_1", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELA_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELA_2", xdc.services.intern.xsr.Enum.intValue(0x0200L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELA_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELA_3", xdc.services.intern.xsr.Enum.intValue(0x0300L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELA_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELA_4", xdc.services.intern.xsr.Enum.intValue(0x0400L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELA_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELA_5", xdc.services.intern.xsr.Enum.intValue(0x0500L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELA_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELA_6", xdc.services.intern.xsr.Enum.intValue(0x0600L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELA_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELA_7", xdc.services.intern.xsr.Enum.intValue(0x0700L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELS_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELS_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELS_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELS_1", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELS_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELS_2", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELS_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELS_3", xdc.services.intern.xsr.Enum.intValue(0x0030L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELS_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELS_4", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELS_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELS_5", xdc.services.intern.xsr.Enum.intValue(0x0050L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELS_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELS_6", xdc.services.intern.xsr.Enum.intValue(0x0060L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELS_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELS_7", xdc.services.intern.xsr.Enum.intValue(0x0070L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELM_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELM_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELM_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELM_1", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELM_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELM_2", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELM_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELM_3", xdc.services.intern.xsr.Enum.intValue(0x0003L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELM_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELM_4", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELM_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELM_5", xdc.services.intern.xsr.Enum.intValue(0x0005L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELM_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELM_6", xdc.services.intern.xsr.Enum.intValue(0x0006L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SELM_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SELM_7", xdc.services.intern.xsr.Enum.intValue(0x0007L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVPA_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVPA_1", xdc.services.intern.xsr.Enum.intValue(0x1000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVPA_2", xdc.services.intern.xsr.Enum.intValue(0x2000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVPA_3", xdc.services.intern.xsr.Enum.intValue(0x3000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVPA_4", xdc.services.intern.xsr.Enum.intValue(0x4000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVPA_5", xdc.services.intern.xsr.Enum.intValue(0x5000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVPA_6", xdc.services.intern.xsr.Enum.intValue(0x6000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVPA_7", xdc.services.intern.xsr.Enum.intValue(0x7000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVA_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVA_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVA_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVA_1", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVA_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVA_2", xdc.services.intern.xsr.Enum.intValue(0x0200L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVA_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVA_3", xdc.services.intern.xsr.Enum.intValue(0x0300L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVA_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVA_4", xdc.services.intern.xsr.Enum.intValue(0x0400L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVA_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVA_5", xdc.services.intern.xsr.Enum.intValue(0x0500L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVA_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVA_6", xdc.services.intern.xsr.Enum.intValue(0x0600L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVA_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVA_7", xdc.services.intern.xsr.Enum.intValue(0x0700L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVS_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVS_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVS_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVS_1", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVS_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVS_2", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVS_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVS_3", xdc.services.intern.xsr.Enum.intValue(0x0030L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVS_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVS_4", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVS_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVS_5", xdc.services.intern.xsr.Enum.intValue(0x0050L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVS_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVS_6", xdc.services.intern.xsr.Enum.intValue(0x0060L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVS_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVS_7", xdc.services.intern.xsr.Enum.intValue(0x0070L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVM_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVM_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVM_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVM_1", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVM_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVM_2", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVM_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVM_3", xdc.services.intern.xsr.Enum.intValue(0x0030L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVM_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVM_4", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVM_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVM_5", xdc.services.intern.xsr.Enum.intValue(0x0050L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVM_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVM_6", xdc.services.intern.xsr.Enum.intValue(0x0060L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DIVM_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DIVM_7", xdc.services.intern.xsr.Enum.intValue(0x0070L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_1", xdc.services.intern.xsr.Enum.intValue(0x4000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_2", xdc.services.intern.xsr.Enum.intValue(0x8000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_3", xdc.services.intern.xsr.Enum.intValue(0xC000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS", xdc.services.intern.xsr.Enum.intValue(0x1000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2OFF_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2OFF", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_1", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_2", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_3", xdc.services.intern.xsr.Enum.intValue(0x00C0L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XTS_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XTS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XTS_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XTS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XTS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XTS", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XCAP_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XCAP_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XCAP_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XCAP_1", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XCAP_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XCAP_2", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XCAP_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XCAP_3", xdc.services.intern.xsr.Enum.intValue(0x000CL)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1OFF_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1OFF", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCOFFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.DCOFFG", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_XT1CLK_SELECT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_XT1CLK_SELECT", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_VLOCLK_SELECT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_VLOCLK_SELECT", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_REFOCLK_SELECT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_REFOCLK_SELECT", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_DCOCLK_SELECT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_DCOCLK_SELECT", xdc.services.intern.xsr.Enum.intValue(0x0030L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_DCOCLKDIV_SELECT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_DCOCLKDIV_SELECT", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_XT2CLK_SELECT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_XT2CLK_SELECT", xdc.services.intern.xsr.Enum.intValue(0x0050L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_2", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_4", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_8", xdc.services.intern.xsr.Enum.intValue(0x0030L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_12", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_12", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_16", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_16", xdc.services.intern.xsr.Enum.intValue(0x0050L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_32", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_32", xdc.services.intern.xsr.Enum.intValue(0x0060L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_1", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_2", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_t", "ti.catalog.msp430.peripherals.clock"), "ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_3", xdc.services.intern.xsr.Enum.intValue(0x000CL)+0));
    }

    void CS$$CONSTS()
    {
        // module CS
    }

    void CS_A$$CONSTS()
    {
        // module CS_A
    }

    void IClock$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void BCSplus$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Module", "ti.catalog.msp430.peripherals.clock"), om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Instance", "ti.catalog.msp430.peripherals.clock"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Params", "ti.catalog.msp430.peripherals.clock"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$clock$BCSplus$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.clock.BCSplus'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.clock.BCSplus.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.clock']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.ACLKHz = __mod.PARAMS.ACLKHz;\n");
            sb.append("__inst.MCLKHz = __mod.PARAMS.MCLKHz;\n");
            sb.append("__inst.SMCLKHz = __mod.PARAMS.SMCLKHz;\n");
            sb.append("__inst.preCalibratedValuesItems = __mod.PARAMS.preCalibratedValuesItems;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Module", "ti.catalog.msp430.peripherals.clock"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus$$Object", "ti.catalog.msp430.peripherals.clock"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Params", "ti.catalog.msp430.peripherals.clock"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$clock$BCSplus$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.clock.BCSplus'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.ACLKHz = __mod.PARAMS.ACLKHz;\n");
            sb.append("__inst.MCLKHz = __mod.PARAMS.MCLKHz;\n");
            sb.append("__inst.SMCLKHz = __mod.PARAMS.SMCLKHz;\n");
            sb.append("__inst.preCalibratedValuesItems = __mod.PARAMS.preCalibratedValuesItems;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void UCS$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Module", "ti.catalog.msp430.peripherals.clock"), om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Instance", "ti.catalog.msp430.peripherals.clock"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Params", "ti.catalog.msp430.peripherals.clock"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$clock$UCS$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.clock.UCS'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.clock.UCS.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.clock']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.ACLKHz = __mod.PARAMS.ACLKHz;\n");
            sb.append("__inst.MCLKHz = __mod.PARAMS.MCLKHz;\n");
            sb.append("__inst.SMCLKHz = __mod.PARAMS.SMCLKHz;\n");
            sb.append("__inst.DCOCLKDIVHz = __mod.PARAMS.DCOCLKDIVHz;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.clock.UCS$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Module", "ti.catalog.msp430.peripherals.clock"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$Object", "ti.catalog.msp430.peripherals.clock"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Params", "ti.catalog.msp430.peripherals.clock"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$clock$UCS$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.clock.UCS'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.ACLKHz = __mod.PARAMS.ACLKHz;\n");
            sb.append("__inst.MCLKHz = __mod.PARAMS.MCLKHz;\n");
            sb.append("__inst.SMCLKHz = __mod.PARAMS.SMCLKHz;\n");
            sb.append("__inst.DCOCLKDIVHz = __mod.PARAMS.DCOCLKDIVHz;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void CS$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.clock.CS$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Module", "ti.catalog.msp430.peripherals.clock"), om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.clock"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Params", "ti.catalog.msp430.peripherals.clock"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$clock$CS$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.clock.CS'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.clock.CS.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.clock']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.ACLKHz = __mod.PARAMS.ACLKHz;\n");
            sb.append("__inst.MCLKHz = __mod.PARAMS.MCLKHz;\n");
            sb.append("__inst.SMCLKHz = __mod.PARAMS.SMCLKHz;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.clock.CS$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Module", "ti.catalog.msp430.peripherals.clock"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS$$Object", "ti.catalog.msp430.peripherals.clock"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Params", "ti.catalog.msp430.peripherals.clock"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$clock$CS$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.clock.CS'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.ACLKHz = __mod.PARAMS.ACLKHz;\n");
            sb.append("__inst.MCLKHz = __mod.PARAMS.MCLKHz;\n");
            sb.append("__inst.SMCLKHz = __mod.PARAMS.SMCLKHz;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void CS_A$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.clock.CS_A$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Module", "ti.catalog.msp430.peripherals.clock"), om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Instance", "ti.catalog.msp430.peripherals.clock"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Params", "ti.catalog.msp430.peripherals.clock"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$clock$CS_A$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.clock.CS_A'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.clock.CS_A.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.clock']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.ACLKHz = __mod.PARAMS.ACLKHz;\n");
            sb.append("__inst.MCLKHz = __mod.PARAMS.MCLKHz;\n");
            sb.append("__inst.SMCLKHz = __mod.PARAMS.SMCLKHz;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.clock.CS_A$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Module", "ti.catalog.msp430.peripherals.clock"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A$$Object", "ti.catalog.msp430.peripherals.clock"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Params", "ti.catalog.msp430.peripherals.clock"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$clock$CS_A$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.clock.CS_A'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.ACLKHz = __mod.PARAMS.ACLKHz;\n");
            sb.append("__inst.MCLKHz = __mod.PARAMS.MCLKHz;\n");
            sb.append("__inst.SMCLKHz = __mod.PARAMS.SMCLKHz;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IClock$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn IClock.computeDCOCLKHz
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.clock.IClock$$computeDCOCLKHz", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.clock"), null, 1, 1, false));
                fxn.addArg(0, "DCOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF);
    }

    void BCSplus$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void UCS$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void CS$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void CS_A$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IClock$$SIZES()
    {
    }

    void BCSplus$$SIZES()
    {
    }

    void UCS$$SIZES()
    {
    }

    void CS$$SIZES()
    {
    }

    void CS_A$$SIZES()
    {
    }

    void IClock$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Module", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.IClock.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.IClock.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("hasHFXT1", $$T_Bool, false, "wh");
        po.addFld("hasXT2", $$T_Bool, false, "wh");
        po.addFld("hasRosc", $$T_Bool, false, "wh");
        po.addFld("hasVLO", $$T_Bool, false, "wh");
        po.addFld("hasAllCal", $$T_Bool, false, "wh");
        po.addFld("maxCpuFrequency", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("DCOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 1000000L, "rh");
        po.addFld("ACLKHz", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "rh");
        po.addFld("MCLKHz", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "rh");
        po.addFld("SMCLKHz", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$Params", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.IClock.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("hasHFXT1", $$T_Bool, false, "wh");
        po.addFld("hasXT2", $$T_Bool, false, "wh");
        po.addFld("hasRosc", $$T_Bool, false, "wh");
        po.addFld("hasVLO", $$T_Bool, false, "wh");
        po.addFld("hasAllCal", $$T_Bool, false, "wh");
        po.addFld("maxCpuFrequency", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("DCOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 1000000L, "rh");
        po.addFld("ACLKHz", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "rh");
        po.addFld("MCLKHz", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "rh");
        po.addFld("SMCLKHz", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "rh");
        // struct IClock.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
        // struct IClock.AvailableClockVariations_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("clockType", $$T_Str, $$UNDEF, "w");
                po.addFld("hasClock", $$T_Bool, $$UNDEF, "w");
    }

    void BCSplus$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/clock/BCSplus.xs");
        om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Module", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.BCSplus.Module", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Module", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus$$create", "ti.catalog.msp430.peripherals.clock"), Global.get("ti$catalog$msp430$peripherals$clock$BCSplus$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus$$construct", "ti.catalog.msp430.peripherals.clock"), Global.get("ti$catalog$msp430$peripherals$clock$BCSplus$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.BCSplus$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.clock"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.clock"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.clock"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Instance", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.BCSplus.Instance", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("DCOCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCOCTL_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("MOD0", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_OFF"), "MOD1", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_OFF"), "MOD2", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_OFF"), "MOD3", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_OFF"), "MOD4", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_OFF"), "DCO0", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0"), "DCO1", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1"), "DCO2", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_OFF")), "wh");
        po.addFld("BCSCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL1_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("XT2OFF", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF"), "XTS", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.XTS_OFF"), "DIVA", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_0"), "RSEL0", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0"), "RSEL1", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1"), "RSEL2", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2"), "RSEL3", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_OFF")), "wh");
        po.addFld("BCSCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL2_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("SELM", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_0"), "DIVM", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_0"), "SELS", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.SELS_OFF"), "DIVS", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_0"), "DCOR", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_OFF")), "wh");
        po.addFld("BCSCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL3_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("XT2S", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_0"), "LFXT1S", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_0"), "XCAP", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_1")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"), false), Global.newArray(new Object[]{Global.newObject("register", "DCOCTL", "regForceSet", false), Global.newObject("register", "BCSCTL1", "regForceSet", false), Global.newObject("register", "BCSCTL2", "regForceSet", false), Global.newObject("register", "BCSCTL3", "regForceSet", false)}), "rh");
        po.addFld("preCalibratedValues", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "wh");
        po.addFld("preCalibratedValuesItems", new Proto.Arr($$T_Str, true), $$DEFAULT, "wh");
        po.addFld("VLOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 12000L, "wh");
        po.addFld("WATCHCRYSTALCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 32768L, "wh");
        po.addFld("LFXT1CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("XT2CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("enableXT2", $$T_Bool, false, "wh");
                fxn = Global.get(cap, "computeDCOCLKHz");
                if (fxn != null) po.addFxn("computeDCOCLKHz", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$computeDCOCLKHz", "ti.catalog.msp430.peripherals.clock"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus$$Params", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.BCSplus.Params", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$Params", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("DCOCTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCOCTL_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("MOD0", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_OFF"), "MOD1", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_OFF"), "MOD2", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_OFF"), "MOD3", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_OFF"), "MOD4", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_OFF"), "DCO0", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0"), "DCO1", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1"), "DCO2", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_OFF")), "wh");
        po.addFld("BCSCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL1_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("XT2OFF", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF"), "XTS", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.XTS_OFF"), "DIVA", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_0"), "RSEL0", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0"), "RSEL1", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1"), "RSEL2", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2"), "RSEL3", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_OFF")), "wh");
        po.addFld("BCSCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL2_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("SELM", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_0"), "DIVM", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_0"), "SELS", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.SELS_OFF"), "DIVS", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_0"), "DCOR", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_OFF")), "wh");
        po.addFld("BCSCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL3_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("XT2S", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_0"), "LFXT1S", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_0"), "XCAP", om.find("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_1")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"), false), Global.newArray(new Object[]{Global.newObject("register", "DCOCTL", "regForceSet", false), Global.newObject("register", "BCSCTL1", "regForceSet", false), Global.newObject("register", "BCSCTL2", "regForceSet", false), Global.newObject("register", "BCSCTL3", "regForceSet", false)}), "rh");
        po.addFld("preCalibratedValues", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "wh");
        po.addFld("preCalibratedValuesItems", new Proto.Arr($$T_Str, true), $$DEFAULT, "wh");
        po.addFld("VLOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 12000L, "wh");
        po.addFld("WATCHCRYSTALCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 32768L, "wh");
        po.addFld("LFXT1CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("XT2CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("enableXT2", $$T_Bool, false, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus$$Object", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.BCSplus.Object", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Instance", "ti.catalog.msp430.peripherals.clock"));
                fxn = Global.get(cap, "computeDCOCLKHz");
                if (fxn != null) po.addFxn("computeDCOCLKHz", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$computeDCOCLKHz", "ti.catalog.msp430.peripherals.clock"), fxn);
        // struct BCSplus.DCOCTL_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus$$DCOCTL_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.BCSplus.DCOCTL_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("MOD0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("MOD1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("MOD2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("MOD3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("MOD4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DCO0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DCO1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DCO2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct BCSplus.BCSCTL1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus$$BCSCTL1_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("XT2OFF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XTS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XTS_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DIVA", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("RSEL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("RSEL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("RSEL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("RSEL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct BCSplus.BCSCTL2_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus$$BCSCTL2_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL2_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("SELM", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DIVM", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("SELS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELS_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DIVS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DCOR", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct BCSplus.BCSCTL3_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus$$BCSCTL3_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL3_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("XT2S", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("LFXT1S", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XCAP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XT2OF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("LFXT1OF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
    }

    void UCS$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/clock/UCS.xs");
        om.bind("ti.catalog.msp430.peripherals.clock.UCS$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Module", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.Module", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Module", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$create", "ti.catalog.msp430.peripherals.clock"), Global.get("ti$catalog$msp430$peripherals$clock$UCS$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$construct", "ti.catalog.msp430.peripherals.clock"), Global.get("ti$catalog$msp430$peripherals$clock$UCS$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.UCS$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.UCS$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.UCS$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.UCS$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.clock"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.clock"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.clock"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Instance", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.Instance", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("UCSCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL0_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("DCO0", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCO0_OFF"), "DCO1", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCO1_OFF"), "DCO2", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCO2_OFF"), "DCO3", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCO3_OFF"), "DCO4", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCO4_OFF"), "MOD0", om.find("ti.catalog.msp430.peripherals.clock.UCS.MOD0_OFF"), "MOD1", om.find("ti.catalog.msp430.peripherals.clock.UCS.MOD1_OFF"), "MOD2", om.find("ti.catalog.msp430.peripherals.clock.UCS.MOD2_OFF"), "MOD3", om.find("ti.catalog.msp430.peripherals.clock.UCS.MOD3_OFF"), "MOD4", om.find("ti.catalog.msp430.peripherals.clock.UCS.MOD4_OFF")), "wh");
        po.addFld("UCSCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL1_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("DCORSEL", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_2"), "DISMOD", om.find("ti.catalog.msp430.peripherals.clock.UCS.DISMOD_OFF")), "wh");
        po.addFld("UCSCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL2_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("FLLD", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLD_1"), "FLLN0", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN0"), "FLLN1", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN1"), "FLLN2", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN2"), "FLLN3", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN3"), "FLLN4", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN4"), "FLLN5", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN5_OFF"), "FLLN6", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN6_OFF"), "FLLN7", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN7_OFF"), "FLLN8", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN8_OFF"), "FLLN9", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN9_OFF")), "wh");
        po.addFld("UCSCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL3_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("SELREF", om.find("ti.catalog.msp430.peripherals.clock.UCS.SELREF_0"), "FLLREFDIV", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_0")), "wh");
        po.addFld("UCSCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL4_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("SELA", om.find("ti.catalog.msp430.peripherals.clock.UCS.SELA_0"), "SELS", om.find("ti.catalog.msp430.peripherals.clock.UCS.SELS_4"), "SELM", om.find("ti.catalog.msp430.peripherals.clock.UCS.SELM_4")), "wh");
        po.addFld("UCSCTL5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL5_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("DIVPA", om.find("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_0"), "DIVA", om.find("ti.catalog.msp430.peripherals.clock.UCS.DIVA_0"), "DIVS", om.find("ti.catalog.msp430.peripherals.clock.UCS.DIVS_0"), "DIVM", om.find("ti.catalog.msp430.peripherals.clock.UCS.DIVM_0")), "wh");
        po.addFld("UCSCTL6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL6_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("XT2DRIVE", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_3"), "XT2BYPASS", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_OFF"), "XT2OFF", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF"), "XT1DRIVE", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_3"), "XTS", om.find("ti.catalog.msp430.peripherals.clock.UCS.XTS"), "XT1BYPASS", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS"), "XCAP", om.find("ti.catalog.msp430.peripherals.clock.UCS.XCAP_3"), "SMCLKOFF", om.find("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_OFF"), "XT1OFF", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF")), "wh");
        po.addFld("UCSCTL7", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL7_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("XT2OFFG", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_OFF"), "XT1HFOFFG", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_OFF"), "XT1LFOFFG", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG"), "DCOFFG", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG")), "wh");
        po.addFld("UCSCTL8", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL8_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("MODOSCREQEN", om.find("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_OFF"), "SMCLKREQEN", om.find("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN"), "MCLKREQEN", om.find("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN"), "ACLKREQEN", om.find("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN")), "wh");
        po.addFld("UCSCTL9", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL9_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("XT2BYPASSLV", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_OFF"), "XT1BYPASSLV", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_OFF")), "wh");
        po.addFld("UCS_MCLK_SOURCE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_DCOCLKDIV_SELECT"), "wh");
        po.addFld("UCS_SMCLK_SOURCE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_DCOCLKDIV_SELECT"), "wh");
        po.addFld("UCS_ACLK_SOURCE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_XT1CLK_SELECT"), "wh");
        po.addFld("UCS_FLL_REF_CLK_SOURCE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_XT1CLK_SELECT"), "wh");
        po.addFld("UCS_MCLK_SRC_DIVIDER", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1"), "wh");
        po.addFld("UCS_SMCLK_SRC_DIVIDER", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1"), "wh");
        po.addFld("UCS_ACLK_SRC_DIVIDER", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1"), "wh");
        po.addFld("UCS_PACLK_SRC_DIVIDER", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1"), "wh");
        po.addFld("UCS_FLL_REF_SRC_DIVIDER", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1"), "wh");
        po.addFld("UCS_FLL_RATIO", Proto.Elm.newCNum("(xdc_UInt)"), 31L, "wh");
        po.addFld("UCS_FLL_FREQ", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("UCS_XT1_DRIVE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_3"), "wh");
        po.addFld("UCS_XT2_DRIVE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_3"), "wh");
        po.addFld("UCS_XCAP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_3"), "wh");
        po.addFld("UCS_XT1BYPASS", $$T_Bool, false, "wh");
        po.addFld("UCS_XT2BYPASS", $$T_Bool, false, "wh");
        po.addFld("UCS_MODOSCREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_OFF"), "wh");
        po.addFld("UCS_SMCLKREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN"), "wh");
        po.addFld("UCS_MCLKREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN"), "wh");
        po.addFld("UCS_ACLKREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN"), "wh");
        po.addFld("UCS_SMCLKOFF", $$T_Bool, false, "wh");
        po.addFld("VLOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 12000L, "wh");
        po.addFld("WATCHCRYSTALCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 32768L, "wh");
        po.addFld("REFOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 32768L, "wh");
        po.addFld("XT1CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("XT2CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("DCOCLKDIVHz", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "rh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"), false), Global.newArray(new Object[]{Global.newObject("register", "UCS_SMCLKREQEN", "regForceSet", false), Global.newObject("register", "UCS_MCLKREQEN", "regForceSet", false), Global.newObject("register", "UCS_ACLKREQEN", "regForceSet", false), Global.newObject("register", "UCS_MODOSCREQEN", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "computeDCOCLKHz");
                if (fxn != null) po.addFxn("computeDCOCLKHz", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$computeDCOCLKHz", "ti.catalog.msp430.peripherals.clock"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$Params", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.Params", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$Params", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("UCSCTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL0_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("DCO0", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCO0_OFF"), "DCO1", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCO1_OFF"), "DCO2", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCO2_OFF"), "DCO3", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCO3_OFF"), "DCO4", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCO4_OFF"), "MOD0", om.find("ti.catalog.msp430.peripherals.clock.UCS.MOD0_OFF"), "MOD1", om.find("ti.catalog.msp430.peripherals.clock.UCS.MOD1_OFF"), "MOD2", om.find("ti.catalog.msp430.peripherals.clock.UCS.MOD2_OFF"), "MOD3", om.find("ti.catalog.msp430.peripherals.clock.UCS.MOD3_OFF"), "MOD4", om.find("ti.catalog.msp430.peripherals.clock.UCS.MOD4_OFF")), "wh");
        po.addFld("UCSCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL1_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("DCORSEL", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_2"), "DISMOD", om.find("ti.catalog.msp430.peripherals.clock.UCS.DISMOD_OFF")), "wh");
        po.addFld("UCSCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL2_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("FLLD", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLD_1"), "FLLN0", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN0"), "FLLN1", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN1"), "FLLN2", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN2"), "FLLN3", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN3"), "FLLN4", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN4"), "FLLN5", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN5_OFF"), "FLLN6", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN6_OFF"), "FLLN7", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN7_OFF"), "FLLN8", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN8_OFF"), "FLLN9", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLN9_OFF")), "wh");
        po.addFld("UCSCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL3_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("SELREF", om.find("ti.catalog.msp430.peripherals.clock.UCS.SELREF_0"), "FLLREFDIV", om.find("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_0")), "wh");
        po.addFld("UCSCTL4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL4_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("SELA", om.find("ti.catalog.msp430.peripherals.clock.UCS.SELA_0"), "SELS", om.find("ti.catalog.msp430.peripherals.clock.UCS.SELS_4"), "SELM", om.find("ti.catalog.msp430.peripherals.clock.UCS.SELM_4")), "wh");
        po.addFld("UCSCTL5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL5_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("DIVPA", om.find("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_0"), "DIVA", om.find("ti.catalog.msp430.peripherals.clock.UCS.DIVA_0"), "DIVS", om.find("ti.catalog.msp430.peripherals.clock.UCS.DIVS_0"), "DIVM", om.find("ti.catalog.msp430.peripherals.clock.UCS.DIVM_0")), "wh");
        po.addFld("UCSCTL6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL6_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("XT2DRIVE", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_3"), "XT2BYPASS", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_OFF"), "XT2OFF", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF"), "XT1DRIVE", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_3"), "XTS", om.find("ti.catalog.msp430.peripherals.clock.UCS.XTS"), "XT1BYPASS", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS"), "XCAP", om.find("ti.catalog.msp430.peripherals.clock.UCS.XCAP_3"), "SMCLKOFF", om.find("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_OFF"), "XT1OFF", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF")), "wh");
        po.addFld("UCSCTL7", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL7_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("XT2OFFG", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_OFF"), "XT1HFOFFG", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_OFF"), "XT1LFOFFG", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG"), "DCOFFG", om.find("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG")), "wh");
        po.addFld("UCSCTL8", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL8_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("MODOSCREQEN", om.find("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_OFF"), "SMCLKREQEN", om.find("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN"), "MCLKREQEN", om.find("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN"), "ACLKREQEN", om.find("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN")), "wh");
        po.addFld("UCSCTL9", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL9_t", "ti.catalog.msp430.peripherals.clock"), Global.newObject("XT2BYPASSLV", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_OFF"), "XT1BYPASSLV", om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_OFF")), "wh");
        po.addFld("UCS_MCLK_SOURCE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_DCOCLKDIV_SELECT"), "wh");
        po.addFld("UCS_SMCLK_SOURCE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_DCOCLKDIV_SELECT"), "wh");
        po.addFld("UCS_ACLK_SOURCE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_XT1CLK_SELECT"), "wh");
        po.addFld("UCS_FLL_REF_CLK_SOURCE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_XT1CLK_SELECT"), "wh");
        po.addFld("UCS_MCLK_SRC_DIVIDER", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1"), "wh");
        po.addFld("UCS_SMCLK_SRC_DIVIDER", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1"), "wh");
        po.addFld("UCS_ACLK_SRC_DIVIDER", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1"), "wh");
        po.addFld("UCS_PACLK_SRC_DIVIDER", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1"), "wh");
        po.addFld("UCS_FLL_REF_SRC_DIVIDER", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1"), "wh");
        po.addFld("UCS_FLL_RATIO", Proto.Elm.newCNum("(xdc_UInt)"), 31L, "wh");
        po.addFld("UCS_FLL_FREQ", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("UCS_XT1_DRIVE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_3"), "wh");
        po.addFld("UCS_XT2_DRIVE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_3"), "wh");
        po.addFld("UCS_XCAP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_3"), "wh");
        po.addFld("UCS_XT1BYPASS", $$T_Bool, false, "wh");
        po.addFld("UCS_XT2BYPASS", $$T_Bool, false, "wh");
        po.addFld("UCS_MODOSCREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_OFF"), "wh");
        po.addFld("UCS_SMCLKREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN"), "wh");
        po.addFld("UCS_MCLKREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN"), "wh");
        po.addFld("UCS_ACLKREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), om.find("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN"), "wh");
        po.addFld("UCS_SMCLKOFF", $$T_Bool, false, "wh");
        po.addFld("VLOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 12000L, "wh");
        po.addFld("WATCHCRYSTALCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 32768L, "wh");
        po.addFld("REFOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 32768L, "wh");
        po.addFld("XT1CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("XT2CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("DCOCLKDIVHz", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "rh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"), false), Global.newArray(new Object[]{Global.newObject("register", "UCS_SMCLKREQEN", "regForceSet", false), Global.newObject("register", "UCS_MCLKREQEN", "regForceSet", false), Global.newObject("register", "UCS_ACLKREQEN", "regForceSet", false), Global.newObject("register", "UCS_MODOSCREQEN", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$Object", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.Object", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Instance", "ti.catalog.msp430.peripherals.clock"));
                fxn = Global.get(cap, "computeDCOCLKHz");
                if (fxn != null) po.addFxn("computeDCOCLKHz", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$computeDCOCLKHz", "ti.catalog.msp430.peripherals.clock"), fxn);
        // struct UCS.UCSCTL0_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL0_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL0_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("DCO0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO0_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DCO1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO1_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DCO2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO2_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DCO3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO3_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DCO4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO4_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("MOD0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD0_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("MOD1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD1_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("MOD2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD2_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("MOD3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD3_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("MOD4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD4_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct UCS.UCSCTL1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL1_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("DCORSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DISMOD", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DISMOD_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct UCS.UCSCTL2_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL2_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL2_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("FLLD", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLN0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN0_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLN1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN1_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLN2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN2_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLN3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN3_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLN4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN4_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLN5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN5_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLN6", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN6_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLN7", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN7_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLN8", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN8_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLN9", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN9_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct UCS.UCSCTL3_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL3_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL3_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("SELREF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("FLLREFDIV", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct UCS.UCSCTL4_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL4_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL4_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("SELA", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("SELS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("SELM", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct UCS.UCSCTL5_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL5_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL5_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("DIVPA", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DIVA", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DIVS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DIVM", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct UCS.UCSCTL6_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL6_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL6_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("XT2DRIVE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XT2BYPASS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XT2OFF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XT1DRIVE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XTS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XTS_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XT1BYPASS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XCAP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XCAP_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("SMCLKOFF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XT1OFF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct UCS.UCSCTL7_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL7_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL7_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("XT2OFFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XT1HFOFFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XT1LFOFFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("DCOFFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct UCS.UCSCTL8_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL8_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL8_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("MODOSCREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("SMCLKREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("MCLKREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("ACLKREQEN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
        // struct UCS.UCSCTL9_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$UCSCTL9_t", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL9_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("XT2BYPASSLV", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
                po.addFld("XT1BYPASSLV", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_t", "ti.catalog.msp430.peripherals.clock"), $$UNDEF, "w");
    }

    void CS$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/clock/CS.xs");
        om.bind("ti.catalog.msp430.peripherals.clock.CS$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Module", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.CS.Module", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Module", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.CS$$create", "ti.catalog.msp430.peripherals.clock"), Global.get("ti$catalog$msp430$peripherals$clock$CS$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.CS$$construct", "ti.catalog.msp430.peripherals.clock"), Global.get("ti$catalog$msp430$peripherals$clock$CS$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.CS$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.CS$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.CS$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.CS$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.clock"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.clock"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.clock"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.CS.Instance", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("VLOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 8300L, "wh");
        po.addFld("WATCHCRYSTALCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 32768L, "wh");
        po.addFld("XT1CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("XT2CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
                fxn = Global.get(cap, "computeDCOCLKHz");
                if (fxn != null) po.addFxn("computeDCOCLKHz", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$computeDCOCLKHz", "ti.catalog.msp430.peripherals.clock"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS$$Params", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.CS.Params", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$Params", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("VLOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 8300L, "wh");
        po.addFld("WATCHCRYSTALCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 32768L, "wh");
        po.addFld("XT1CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("XT2CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS$$Object", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.CS.Object", om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.clock"));
                fxn = Global.get(cap, "computeDCOCLKHz");
                if (fxn != null) po.addFxn("computeDCOCLKHz", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$computeDCOCLKHz", "ti.catalog.msp430.peripherals.clock"), fxn);
    }

    void CS_A$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/clock/CS_A.xs");
        om.bind("ti.catalog.msp430.peripherals.clock.CS_A$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Module", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.CS_A.Module", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Module", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A$$create", "ti.catalog.msp430.peripherals.clock"), Global.get("ti$catalog$msp430$peripherals$clock$CS_A$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A$$construct", "ti.catalog.msp430.peripherals.clock"), Global.get("ti$catalog$msp430$peripherals$clock$CS_A$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.CS_A$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.CS_A$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.CS_A$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.clock.CS_A$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.clock"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.clock"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.clock"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Instance", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.CS_A.Instance", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("hasLFXT1", $$T_Bool, false, "wh");
        po.addFld("VLOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 9400L, "wh");
        po.addFld("LFMODOSCHz", Proto.Elm.newCNum("(xdc_Float)"), 39000L, "wh");
        po.addFld("MODOSCHz", Proto.Elm.newCNum("(xdc_Float)"), 5000000L, "wh");
        po.addFld("WATCHCRYSTALCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 32768L, "wh");
        po.addFld("XT1CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("XT2CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
                fxn = Global.get(cap, "computeDCOCLKHz");
                if (fxn != null) po.addFxn("computeDCOCLKHz", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$computeDCOCLKHz", "ti.catalog.msp430.peripherals.clock"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A$$Params", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.CS_A.Params", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$Params", "ti.catalog.msp430.peripherals.clock"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("hasLFXT1", $$T_Bool, false, "wh");
        po.addFld("VLOCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 9400L, "wh");
        po.addFld("LFMODOSCHz", Proto.Elm.newCNum("(xdc_Float)"), 39000L, "wh");
        po.addFld("MODOSCHz", Proto.Elm.newCNum("(xdc_Float)"), 5000000L, "wh");
        po.addFld("WATCHCRYSTALCLKHz", Proto.Elm.newCNum("(xdc_Float)"), 32768L, "wh");
        po.addFld("XT1CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po.addFld("XT2CLKHz", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A$$Object", "ti.catalog.msp430.peripherals.clock");
        po.init("ti.catalog.msp430.peripherals.clock.CS_A.Object", om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Instance", "ti.catalog.msp430.peripherals.clock"));
                fxn = Global.get(cap, "computeDCOCLKHz");
                if (fxn != null) po.addFxn("computeDCOCLKHz", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock$$computeDCOCLKHz", "ti.catalog.msp430.peripherals.clock"), fxn);
    }

    void IClock$$ROV()
    {
    }

    void BCSplus$$ROV()
    {
    }

    void UCS$$ROV()
    {
    }

    void CS$$ROV()
    {
    }

    void CS_A$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.clock.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.clock"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.clock", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.clock");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.clock.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.catalog.msp430.peripherals.special_function", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.clock'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.clock$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.clock$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.clock$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IClock$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock", "ti.catalog.msp430.peripherals.clock");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Module", "ti.catalog.msp430.peripherals.clock");
        vo.init2(po, "ti.catalog.msp430.peripherals.clock.IClock", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Params", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Params", "ti.catalog.msp430.peripherals.clock")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.clock", "ti.catalog.msp430.peripherals.clock"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("AvailableClockVariations_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IClock", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IClock");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void BCSplus$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus", "ti.catalog.msp430.peripherals.clock");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Module", "ti.catalog.msp430.peripherals.clock");
        vo.init2(po, "ti.catalog.msp430.peripherals.clock.BCSplus", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus$$capsule", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Instance", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Params", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Params", "ti.catalog.msp430.peripherals.clock")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.clock", "ti.catalog.msp430.peripherals.clock"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("AvailableClockVariations_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD0_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD1_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD2_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD3_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD4_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO0_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO1_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO2_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OFF_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XTS_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XTS_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL0_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL1_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL2_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL3_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELS_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCOR_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2S_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("LFXT1S_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XCAP_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OF_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("LFXT1OF_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCOCTL_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCOCTL_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCOCTL_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("BCSCTL1_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL1_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL1_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("BCSCTL2_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL2_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL2_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("BCSCTL3_t", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL3_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.BCSCTL3_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD0_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD0", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD1_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD1", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD2_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD2", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD3_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD3", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD4_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD4", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.MOD4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO0_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO0", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO1_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO1", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO2_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO2", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCO2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OFF_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XTS_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XTS_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XTS", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XTS", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL0_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL0", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL1_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL1", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL2_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL2", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL3_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("RSEL3", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.RSEL3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_0", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_2", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_3", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELM_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_0", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_1", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_2", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_3", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVA_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_0", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_1", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_2", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_3", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVM_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_0", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_1", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_2", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_3", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DIVS_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELS_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.SELS", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCOR_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCOR", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.DCOR", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2S_0", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2S_1", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2S_2", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2S_3", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2S_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("LFXT1S_0", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("LFXT1S_1", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("LFXT1S_2", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("LFXT1S_3", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1S_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XCAP_0", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XCAP_1", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XCAP_2", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XCAP_3", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XCAP_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OF_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.XT2OF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("LFXT1OF_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("LFXT1OF", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.LFXT1OF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.clock");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.clock")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.clock.BCSplus$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus.Object", "ti.catalog.msp430.peripherals.clock"));
        pkgV.bind("BCSplus", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("BCSplus");
    }

    void UCS$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS", "ti.catalog.msp430.peripherals.clock");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Module", "ti.catalog.msp430.peripherals.clock");
        vo.init2(po, "ti.catalog.msp430.peripherals.clock.UCS", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS$$capsule", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Instance", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Params", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Params", "ti.catalog.msp430.peripherals.clock")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.clock", "ti.catalog.msp430.peripherals.clock"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("AvailableClockVariations_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO4_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO4_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO3_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO3_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO2_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO2_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO1_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO1_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO0_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO0_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD4_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD4_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD3_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD3_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD2_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD2_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD1_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD1_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD0_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD0_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCORSEL_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DISMOD_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DISMOD_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLD_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN0_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN0_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN1_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN1_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN2_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN2_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN3_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN3_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN4_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN4_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN5_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN5_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN6_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN6_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN7_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN7_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN8_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN8_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN9_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN9_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELREF_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLREFDIV_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELA_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVPA_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2DRIVE_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2BYPASS_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OFF_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1DRIVE_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XTS_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XTS_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1BYPASS_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XCAP_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XCAP_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SMCLKOFF_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1OFF_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OFFG_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1HFOFFG_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1LFOFFG_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCOFFG_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MODOSCREQEN_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SMCLKREQEN_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MCLKREQEN_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("ACLKREQEN_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2BYPASSLV_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1BYPASSLV_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCSCTL0_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL0_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL0_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCSCTL1_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL1_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL1_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCSCTL2_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL2_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL2_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCSCTL3_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL3_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL3_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCSCTL4_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL4_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL4_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCSCTL5_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL5_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL5_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCSCTL6_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL6_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL6_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCSCTL7_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL7_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL7_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCSCTL8_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL8_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL8_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCSCTL9_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL9_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCSCTL9_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_CLK_SOURCE_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SOURCE_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_CLK_SRC_DIVIDER_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLK_SRC_DIVIDER_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_XCAP_t", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO4_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO4_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO3_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO3_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO2_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO2_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO1_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO1_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO0_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO0_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCO0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCO0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD4_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD4_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD3_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD3_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD2_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD2_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD1_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD1_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD0_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD0_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MOD0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MOD0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCORSEL_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCORSEL_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCORSEL_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCORSEL_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCORSEL_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCORSEL_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCORSEL_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCORSEL_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCORSEL_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DISMOD_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DISMOD_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DISMOD", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DISMOD", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLD_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLD_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLD_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLD_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLD_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLD_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLD_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLD_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLD_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN0_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN0_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN1_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN1_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN2_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN2_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN3_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN3_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN4_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN4_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN5_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN5_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN6_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN6_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN7_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN7_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN8_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN8_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN8", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN8", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN9_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN9_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLN9", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLN9", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELREF_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELREF_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELREF_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELREF_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELREF_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELREF_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELREF_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELREF_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELREF_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLREFDIV_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLREFDIV_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLREFDIV_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLREFDIV_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLREFDIV_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLREFDIV_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLREFDIV_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("FLLREFDIV_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.FLLREFDIV_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELA_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELA_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELA_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELA_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELA_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELA_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELA_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELA_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELA_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELS_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELS_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SELM_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SELM_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVPA_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVPA_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVPA_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVPA_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVPA_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVPA_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVPA_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVPA_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVPA_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVA_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVA_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVS_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVS_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_5", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_5", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_6", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_6", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DIVM_7", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DIVM_7", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2DRIVE_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2DRIVE_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2DRIVE_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2DRIVE_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2DRIVE_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2BYPASS_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2BYPASS", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASS", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OFF_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1DRIVE_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1DRIVE_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1DRIVE_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1DRIVE_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1DRIVE_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XTS_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XTS_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XTS", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XTS", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1BYPASS_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1BYPASS", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASS", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XCAP_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XCAP_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XCAP_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XCAP_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XCAP_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XCAP_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XCAP_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XCAP_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SMCLKOFF_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SMCLKOFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKOFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1OFF_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OFFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2OFFG", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2OFFG", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1HFOFFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1HFOFFG", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1HFOFFG", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1LFOFFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1LFOFFG", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1LFOFFG", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCOFFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("DCOFFG", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.DCOFFG", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MODOSCREQEN_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MODOSCREQEN", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MODOSCREQEN", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SMCLKREQEN_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("SMCLKREQEN", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.SMCLKREQEN", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MCLKREQEN_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("MCLKREQEN", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.MCLKREQEN", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("ACLKREQEN_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("ACLKREQEN", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.ACLKREQEN", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2BYPASSLV_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT2BYPASSLV", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT2BYPASSLV", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1BYPASSLV_OFF", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV_OFF", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("XT1BYPASSLV", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.XT1BYPASSLV", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_XT1CLK_SELECT", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XT1CLK_SELECT", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_VLOCLK_SELECT", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_VLOCLK_SELECT", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_REFOCLK_SELECT", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_REFOCLK_SELECT", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_DCOCLK_SELECT", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_DCOCLK_SELECT", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_DCOCLKDIV_SELECT", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_DCOCLKDIV_SELECT", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_XT2CLK_SELECT", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XT2CLK_SELECT", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_CLOCK_DIVIDER_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_CLOCK_DIVIDER_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_CLOCK_DIVIDER_4", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_4", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_CLOCK_DIVIDER_8", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_8", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_CLOCK_DIVIDER_12", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_12", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_CLOCK_DIVIDER_16", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_16", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_CLOCK_DIVIDER_32", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_CLOCK_DIVIDER_32", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_XCAP_0", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_0", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_XCAP_1", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_1", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_XCAP_2", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_2", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("UCS_XCAP_3", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.UCS_XCAP_3", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.clock");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.clock")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.clock.UCS$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.clock.UCS.Object", "ti.catalog.msp430.peripherals.clock"));
        pkgV.bind("UCS", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("UCS");
    }

    void CS$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS", "ti.catalog.msp430.peripherals.clock");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Module", "ti.catalog.msp430.peripherals.clock");
        vo.init2(po, "ti.catalog.msp430.peripherals.clock.CS", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.clock.CS$$capsule", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Instance", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Params", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Params", "ti.catalog.msp430.peripherals.clock")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.clock", "ti.catalog.msp430.peripherals.clock"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("AvailableClockVariations_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.clock");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.clock")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.clock.CS$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.clock.CS.Object", "ti.catalog.msp430.peripherals.clock"));
        pkgV.bind("CS", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("CS");
    }

    void CS_A$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A", "ti.catalog.msp430.peripherals.clock");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Module", "ti.catalog.msp430.peripherals.clock");
        vo.init2(po, "ti.catalog.msp430.peripherals.clock.CS_A", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A$$capsule", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Instance", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Params", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Params", "ti.catalog.msp430.peripherals.clock")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.clock", "ti.catalog.msp430.peripherals.clock"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("AvailableClockVariations_t", om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.AvailableClockVariations_t", "ti.catalog.msp430.peripherals.clock"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.clock");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.clock")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.clock.CS_A$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A.Object", "ti.catalog.msp430.peripherals.clock"));
        pkgV.bind("CS_A", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("CS_A");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.clock.BCSplus", "ti.catalog.msp430.peripherals.clock"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.clock.UCS", "ti.catalog.msp430.peripherals.clock"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.clock.CS", "ti.catalog.msp430.peripherals.clock"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.clock.CS_A", "ti.catalog.msp430.peripherals.clock"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.clock.IClock")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.clock.BCSplus")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.clock.UCS")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.clock.CS")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.clock.CS_A")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.clock")).add(pkgV);
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
        IClock$$OBJECTS();
        BCSplus$$OBJECTS();
        UCS$$OBJECTS();
        CS$$OBJECTS();
        CS_A$$OBJECTS();
        IClock$$CONSTS();
        BCSplus$$CONSTS();
        UCS$$CONSTS();
        CS$$CONSTS();
        CS_A$$CONSTS();
        IClock$$CREATES();
        BCSplus$$CREATES();
        UCS$$CREATES();
        CS$$CREATES();
        CS_A$$CREATES();
        IClock$$FUNCTIONS();
        BCSplus$$FUNCTIONS();
        UCS$$FUNCTIONS();
        CS$$FUNCTIONS();
        CS_A$$FUNCTIONS();
        IClock$$SIZES();
        BCSplus$$SIZES();
        UCS$$SIZES();
        CS$$SIZES();
        CS_A$$SIZES();
        IClock$$TYPES();
        BCSplus$$TYPES();
        UCS$$TYPES();
        CS$$TYPES();
        CS_A$$TYPES();
        if (isROV) {
            IClock$$ROV();
            BCSplus$$ROV();
            UCS$$ROV();
            CS$$ROV();
            CS_A$$ROV();
        }//isROV
        $$SINGLETONS();
        IClock$$SINGLETONS();
        BCSplus$$SINGLETONS();
        UCS$$SINGLETONS();
        CS$$SINGLETONS();
        CS_A$$SINGLETONS();
        $$INITIALIZATION();
    }
}
