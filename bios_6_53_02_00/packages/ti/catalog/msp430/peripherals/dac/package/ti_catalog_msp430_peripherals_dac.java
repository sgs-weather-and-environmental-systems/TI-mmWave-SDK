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

public class ti_catalog_msp430_peripherals_dac
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
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.dac.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.dac", new Value.Obj("ti.catalog.msp430.peripherals.dac", pkgP));
    }

    void IDAC$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.dac.IDAC.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.dac.IDAC", new Value.Obj("ti.catalog.msp430.peripherals.dac.IDAC", po));
        pkgV.bind("IDAC", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_t"));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_t", new Proto.Enm("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.dac.IDAC$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.dac.IDAC$$regIntVect_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.regIntVect_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.dac.IDAC.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.dac.IDAC$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.dac.IDAC$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.Params", new Proto.Str(po, true));
    }

    void DAC12$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.dac.DAC12.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.dac.DAC12", new Value.Obj("ti.catalog.msp430.peripherals.dac.DAC12", po));
        pkgV.bind("DAC12", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12OPS_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12SREF_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12RES_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12LSEL_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12CALON_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12IR_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12AMP_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12DF_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12IE_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12IFG_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12ENC_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12GRP_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.dac"));
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.regIntVect_t", "ti.catalog.msp430.peripherals.dac"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.dac.DAC12$$DAC12_xCTL_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.DAC12_xCTL_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.dac.DAC12.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.dac.DAC12$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.dac.DAC12$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12.Params", new Proto.Str(po, true));
    }

    void IDAC$$CONSTS()
    {
        // interface IDAC
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS", xdc.services.intern.xsr.Enum.intValue(0x8000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x2000")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES", xdc.services.intern.xsr.Enum.intValue(0x1000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x0400")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x0400")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x0400")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x0400")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON", xdc.services.intern.xsr.Enum.intValue(0x0200L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR", xdc.services.intern.xsr.Enum.intValue(0x0100L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x0020")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x0020")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x0020")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x0020")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x0020")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x0020")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x0020")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_7", xdc.services.intern.xsr.Enum.intValue((Global.eval("7 * 0x0020")))+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_t", "ti.catalog.msp430.peripherals.dac"), "ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
    }

    void DAC12$$CONSTS()
    {
        // module DAC12
    }

    void IDAC$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void DAC12$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.dac.DAC12$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Module", "ti.catalog.msp430.peripherals.dac"), om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Instance", "ti.catalog.msp430.peripherals.dac"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Params", "ti.catalog.msp430.peripherals.dac"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$dac$DAC12$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.dac.DAC12'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.dac.DAC12.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.dac']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.dac.DAC12$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Module", "ti.catalog.msp430.peripherals.dac"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12$$Object", "ti.catalog.msp430.peripherals.dac"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Params", "ti.catalog.msp430.peripherals.dac"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$dac$DAC12$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.dac.DAC12'];\n");
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

    void IDAC$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void DAC12$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IDAC$$SIZES()
    {
    }

    void DAC12$$SIZES()
    {
    }

    void IDAC$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.Module", "ti.catalog.msp430.peripherals.dac");
        po.init("ti.catalog.msp430.peripherals.dac.IDAC.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.dac"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.Instance", "ti.catalog.msp430.peripherals.dac");
        po.init("ti.catalog.msp430.peripherals.dac.IDAC.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.dac"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC$$Params", "ti.catalog.msp430.peripherals.dac");
        po.init("ti.catalog.msp430.peripherals.dac.IDAC.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.dac"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        // struct IDAC.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.dac");
        po.init("ti.catalog.msp430.peripherals.dac.IDAC.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
        // struct IDAC.regIntVect_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC$$regIntVect_t", "ti.catalog.msp430.peripherals.dac");
        po.init("ti.catalog.msp430.peripherals.dac.IDAC.regIntVect_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("registerName", $$T_Str, $$UNDEF, "w");
                po.addFld("registerDescription", $$T_Str, $$UNDEF, "w");
                po.addFld("isrToggleString", $$T_Str, $$UNDEF, "w");
                po.addFld("priorityName", $$T_Str, $$UNDEF, "w");
                po.addFld("interruptEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("interruptHandler", $$T_Bool, $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
    }

    void DAC12$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/dac/DAC12.xs");
        om.bind("ti.catalog.msp430.peripherals.dac.DAC12$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Module", "ti.catalog.msp430.peripherals.dac");
        po.init("ti.catalog.msp430.peripherals.dac.DAC12.Module", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.Module", "ti.catalog.msp430.peripherals.dac"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12$$create", "ti.catalog.msp430.peripherals.dac"), Global.get("ti$catalog$msp430$peripherals$dac$DAC12$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12$$construct", "ti.catalog.msp430.peripherals.dac"), Global.get("ti$catalog$msp430$peripherals$dac$DAC12$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.dac.DAC12$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.dac.DAC12$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.dac.DAC12$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.dac.DAC12$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.dac"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.dac"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.dac"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Instance", "ti.catalog.msp430.peripherals.dac");
        po.init("ti.catalog.msp430.peripherals.dac.DAC12.Instance", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.Instance", "ti.catalog.msp430.peripherals.dac"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("DAC12_0CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12_xCTL_t", "ti.catalog.msp430.peripherals.dac"), Global.newObject("DAC12OPS", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_OFF"), "DAC12SREF", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_0"), "DAC12RES", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_OFF"), "DAC12LSEL", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_0"), "DAC12CALON", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_OFF"), "DAC12IR", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_OFF"), "DAC12AMP", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_0"), "DAC12DF", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_OFF"), "DAC12IE", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_OFF"), "DAC12IFG", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_OFF"), "DAC12ENC", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_OFF"), "DAC12GRP", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_OFF")), "wh");
        po.addFld("DAC12_1CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12_xCTL_t", "ti.catalog.msp430.peripherals.dac"), Global.newObject("DAC12OPS", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_OFF"), "DAC12SREF", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_0"), "DAC12RES", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_OFF"), "DAC12LSEL", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_0"), "DAC12CALON", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_OFF"), "DAC12IR", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_OFF"), "DAC12AMP", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_0"), "DAC12DF", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_OFF"), "DAC12IE", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_OFF"), "DAC12IFG", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_OFF"), "DAC12ENC", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_OFF"), "DAC12GRP", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_OFF")), "wh");
        po.addFld("DAC12_0DAT", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("DAC12_1DAT", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.regIntVect_t", "ti.catalog.msp430.peripherals.dac"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.dac"), false), Global.newArray(new Object[]{Global.newObject("register", "DAC12_0CTL", "regForceSet", false), Global.newObject("register", "DAC12_1CTL", "regForceSet", false), Global.newObject("register", "DAC12_0DAT", "regForceSet", false), Global.newObject("register", "DAC12_1DAT", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12$$Params", "ti.catalog.msp430.peripherals.dac");
        po.init("ti.catalog.msp430.peripherals.dac.DAC12.Params", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC$$Params", "ti.catalog.msp430.peripherals.dac"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("DAC12_0CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12_xCTL_t", "ti.catalog.msp430.peripherals.dac"), Global.newObject("DAC12OPS", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_OFF"), "DAC12SREF", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_0"), "DAC12RES", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_OFF"), "DAC12LSEL", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_0"), "DAC12CALON", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_OFF"), "DAC12IR", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_OFF"), "DAC12AMP", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_0"), "DAC12DF", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_OFF"), "DAC12IE", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_OFF"), "DAC12IFG", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_OFF"), "DAC12ENC", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_OFF"), "DAC12GRP", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_OFF")), "wh");
        po.addFld("DAC12_1CTL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12_xCTL_t", "ti.catalog.msp430.peripherals.dac"), Global.newObject("DAC12OPS", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_OFF"), "DAC12SREF", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_0"), "DAC12RES", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_OFF"), "DAC12LSEL", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_0"), "DAC12CALON", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_OFF"), "DAC12IR", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_OFF"), "DAC12AMP", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_0"), "DAC12DF", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_OFF"), "DAC12IE", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_OFF"), "DAC12IFG", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_OFF"), "DAC12ENC", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_OFF"), "DAC12GRP", om.find("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_OFF")), "wh");
        po.addFld("DAC12_0DAT", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("DAC12_1DAT", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.regIntVect_t", "ti.catalog.msp430.peripherals.dac"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.dac"), false), Global.newArray(new Object[]{Global.newObject("register", "DAC12_0CTL", "regForceSet", false), Global.newObject("register", "DAC12_1CTL", "regForceSet", false), Global.newObject("register", "DAC12_0DAT", "regForceSet", false), Global.newObject("register", "DAC12_1DAT", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12$$Object", "ti.catalog.msp430.peripherals.dac");
        po.init("ti.catalog.msp430.peripherals.dac.DAC12.Object", om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Instance", "ti.catalog.msp430.peripherals.dac"));
        // struct DAC12.DAC12_xCTL_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12$$DAC12_xCTL_t", "ti.catalog.msp430.peripherals.dac");
        po.init("ti.catalog.msp430.peripherals.dac.DAC12.DAC12_xCTL_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("DAC12OPS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12OPS_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12SREF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12SREF_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12RES", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12RES_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12LSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12LSEL_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12CALON", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12CALON_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12IR", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12IR_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12AMP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12DF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12DF_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12IE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12IE_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12IFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12IFG_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12ENC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12ENC_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
                po.addFld("DAC12GRP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12GRP_t", "ti.catalog.msp430.peripherals.dac"), $$UNDEF, "w");
    }

    void IDAC$$ROV()
    {
    }

    void DAC12$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.dac.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.dac"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.dac", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.dac");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.dac.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.dac'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.dac$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.dac$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.dac$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IDAC$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC", "ti.catalog.msp430.peripherals.dac");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.Module", "ti.catalog.msp430.peripherals.dac");
        vo.init2(po, "ti.catalog.msp430.peripherals.dac.IDAC", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.Instance", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.Params", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.Params", "ti.catalog.msp430.peripherals.dac")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.dac", "ti.catalog.msp430.peripherals.dac"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12OPS_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12SREF_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12RES_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12LSEL_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12CALON_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IR_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12DF_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IE_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IFG_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12ENC_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12GRP_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.dac"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.regIntVect_t", "ti.catalog.msp430.peripherals.dac"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.regIntVect_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12OPS_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12OPS", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12SREF_0", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_0", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12SREF_1", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_1", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12SREF_2", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_2", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12SREF_3", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_3", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12RES_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12RES", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12LSEL_0", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_0", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12LSEL_1", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_1", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12LSEL_2", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_2", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12LSEL_3", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_3", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12CALON_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12CALON", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IR_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IR", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_0", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_0", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_1", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_1", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_2", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_2", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_3", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_3", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_4", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_4", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_5", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_5", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_6", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_6", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_7", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_7", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12DF_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12DF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IE_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IE", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IFG", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12ENC_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12ENC", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12GRP_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12GRP", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IDAC", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IDAC");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void DAC12$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12", "ti.catalog.msp430.peripherals.dac");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Module", "ti.catalog.msp430.peripherals.dac");
        vo.init2(po, "ti.catalog.msp430.peripherals.dac.DAC12", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12$$capsule", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Instance", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Params", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Params", "ti.catalog.msp430.peripherals.dac")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.dac", "ti.catalog.msp430.peripherals.dac"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12OPS_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12SREF_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12RES_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12LSEL_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12CALON_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IR_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12DF_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IE_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IFG_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12ENC_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12GRP_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.dac"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.regIntVect_t", "ti.catalog.msp430.peripherals.dac"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.regIntVect_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12_xCTL_t", om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12_xCTL_t", "ti.catalog.msp430.peripherals.dac"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.DAC12_xCTL_t", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12OPS_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12OPS", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12OPS", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12SREF_0", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_0", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12SREF_1", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_1", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12SREF_2", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_2", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12SREF_3", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12SREF_3", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12RES_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12RES", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12RES", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12LSEL_0", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_0", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12LSEL_1", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_1", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12LSEL_2", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_2", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12LSEL_3", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12LSEL_3", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12CALON_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12CALON", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12CALON", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IR_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IR", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IR", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_0", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_0", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_1", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_1", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_2", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_2", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_3", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_3", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_4", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_4", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_5", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_5", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_6", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_6", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12AMP_7", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12AMP_7", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12DF_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12DF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12DF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IE_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IE", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IE", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12IFG", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12IFG", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12ENC_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12ENC", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12ENC", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12GRP_OFF", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP_OFF", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("DAC12GRP", om.findStrict("ti.catalog.msp430.peripherals.dac.IDAC.DAC12GRP", "ti.catalog.msp430.peripherals.dac"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.dac");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.dac")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.dac.DAC12$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12.Object", "ti.catalog.msp430.peripherals.dac"));
        pkgV.bind("DAC12", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("DAC12");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.dac.DAC12", "ti.catalog.msp430.peripherals.dac"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.dac.IDAC")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.dac.DAC12")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.dac")).add(pkgV);
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
        IDAC$$OBJECTS();
        DAC12$$OBJECTS();
        IDAC$$CONSTS();
        DAC12$$CONSTS();
        IDAC$$CREATES();
        DAC12$$CREATES();
        IDAC$$FUNCTIONS();
        DAC12$$FUNCTIONS();
        IDAC$$SIZES();
        DAC12$$SIZES();
        IDAC$$TYPES();
        DAC12$$TYPES();
        if (isROV) {
            IDAC$$ROV();
            DAC12$$ROV();
        }//isROV
        $$SINGLETONS();
        IDAC$$SINGLETONS();
        DAC12$$SINGLETONS();
        $$INITIALIZATION();
    }
}
