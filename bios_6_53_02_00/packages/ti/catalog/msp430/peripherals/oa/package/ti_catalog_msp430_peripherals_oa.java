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

public class ti_catalog_msp430_peripherals_oa
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
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.oa.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.oa", new Value.Obj("ti.catalog.msp430.peripherals.oa", pkgP));
    }

    void IOA$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.oa.IOA.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.oa.IOA", new Value.Obj("ti.catalog.msp430.peripherals.oa.IOA", po));
        pkgV.bind("IOA", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAN_t", new Proto.Enm("ti.catalog.msp430.peripherals.oa.IOA.OAN_t"));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAP_t", new Proto.Enm("ti.catalog.msp430.peripherals.oa.IOA.OAP_t"));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAPM_t", new Proto.Enm("ti.catalog.msp430.peripherals.oa.IOA.OAPM_t"));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_t", new Proto.Enm("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_t"));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_t", new Proto.Enm("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_t"));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", new Proto.Enm("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t"));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", new Proto.Enm("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t"));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_t", new Proto.Enm("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_t"));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_t", new Proto.Enm("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.oa.IOA$$OAxCTL0_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL0_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.oa.IOA$$OAxCTL1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.oa.IOA$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.oa.IOA.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.oa.IOA$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.oa.IOA$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.Params", new Proto.Str(po, true));
    }

    void OA_2$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.oa.OA_2.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.oa.OA_2", new Value.Obj("ti.catalog.msp430.peripherals.oa.OA_2", po));
        pkgV.bind("OA_2", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OAN_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OAP_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OAPM_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OAADC0_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OAADC1_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OAFBR_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OAFC_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OARRIP_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OANEXT_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OAxCTL0_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL0_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.OAxCTL1_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL1_t", "ti.catalog.msp430.peripherals.oa"));
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.oa"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.oa.OA_2.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.oa.OA_2$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.oa.OA_2$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2.Params", new Proto.Str(po, true));
    }

    void IOA$$CONSTS()
    {
        // interface IOA
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAN_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAN_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAN_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAN_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAN_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAN_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAN_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAN_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x400"))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAP_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAP_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAP_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAP_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAP_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAP_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAP_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAP_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x400"))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAPM_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAPM_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAPM_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAPM_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAPM_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAPM_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x400")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAPM_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAPM_3", xdc.services.intern.xsr.Enum.intValue(Global.eval("3 * 0x400"))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAADC0_OFF", xdc.services.intern.xsr.Enum.intValue((0x00L))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAADC0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAADC0", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAADC1_OFF", xdc.services.intern.xsr.Enum.intValue((0x00L))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAADC1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAADC1", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFBR_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFBR_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFBR_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFBR_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFBR_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFBR_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFBR_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFBR_7", xdc.services.intern.xsr.Enum.intValue(Global.eval("7 * 0x100"))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFC_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFC_0", xdc.services.intern.xsr.Enum.intValue((Global.eval("0 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFC_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFC_1", xdc.services.intern.xsr.Enum.intValue((Global.eval("1 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFC_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFC_2", xdc.services.intern.xsr.Enum.intValue((Global.eval("2 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFC_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFC_3", xdc.services.intern.xsr.Enum.intValue((Global.eval("3 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFC_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFC_4", xdc.services.intern.xsr.Enum.intValue((Global.eval("4 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFC_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFC_5", xdc.services.intern.xsr.Enum.intValue((Global.eval("5 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFC_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFC_6", xdc.services.intern.xsr.Enum.intValue((Global.eval("6 * 0x100")))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OAFC_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OAFC_7", xdc.services.intern.xsr.Enum.intValue(Global.eval("7 * 0x100"))+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OARRIP_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OARRIP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OARRIP", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OANEXT_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.oa.IOA.OANEXT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_t", "ti.catalog.msp430.peripherals.oa"), "ti.catalog.msp430.peripherals.oa.IOA.OANEXT", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
    }

    void OA_2$$CONSTS()
    {
        // module OA_2
    }

    void IOA$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void OA_2$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.oa.OA_2$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Module", "ti.catalog.msp430.peripherals.oa"), om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Instance", "ti.catalog.msp430.peripherals.oa"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Params", "ti.catalog.msp430.peripherals.oa"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$oa$OA_2$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.oa.OA_2'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.oa.OA_2.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.oa']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.oa.OA_2$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Module", "ti.catalog.msp430.peripherals.oa"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2$$Object", "ti.catalog.msp430.peripherals.oa"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Params", "ti.catalog.msp430.peripherals.oa"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$oa$OA_2$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.oa.OA_2'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IOA$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn IOA.getNumberOfOA
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.oa.IOA$$getNumberOfOA", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.Instance", "ti.catalog.msp430.peripherals.oa"), Proto.Elm.newCNum("(xdc_UChar)"), 0, 0, false));
    }

    void OA_2$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IOA$$SIZES()
    {
    }

    void OA_2$$SIZES()
    {
    }

    void IOA$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.Module", "ti.catalog.msp430.peripherals.oa");
        po.init("ti.catalog.msp430.peripherals.oa.IOA.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.oa"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.Instance", "ti.catalog.msp430.peripherals.oa");
        po.init("ti.catalog.msp430.peripherals.oa.IOA.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.oa"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA$$Params", "ti.catalog.msp430.peripherals.oa");
        po.init("ti.catalog.msp430.peripherals.oa.IOA.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.oa"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        // struct IOA.OAxCTL0_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA$$OAxCTL0_t", "ti.catalog.msp430.peripherals.oa");
        po.init("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL0_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("OAN", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_t", "ti.catalog.msp430.peripherals.oa"), $$UNDEF, "w");
                po.addFld("OAP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_t", "ti.catalog.msp430.peripherals.oa"), $$UNDEF, "w");
                po.addFld("OAPM", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_t", "ti.catalog.msp430.peripherals.oa"), $$UNDEF, "w");
                po.addFld("OAADC0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_t", "ti.catalog.msp430.peripherals.oa"), $$UNDEF, "w");
                po.addFld("OAADC1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_t", "ti.catalog.msp430.peripherals.oa"), $$UNDEF, "w");
        // struct IOA.OAxCTL1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA$$OAxCTL1_t", "ti.catalog.msp430.peripherals.oa");
        po.init("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("OAFBR", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"), $$UNDEF, "w");
                po.addFld("OAFC", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"), $$UNDEF, "w");
                po.addFld("OANEXT", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_t", "ti.catalog.msp430.peripherals.oa"), $$UNDEF, "w");
                po.addFld("OARRIP", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_t", "ti.catalog.msp430.peripherals.oa"), $$UNDEF, "w");
        // struct IOA.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.oa");
        po.init("ti.catalog.msp430.peripherals.oa.IOA.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
    }

    void OA_2$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/oa/OA_2.xs");
        om.bind("ti.catalog.msp430.peripherals.oa.OA_2$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Module", "ti.catalog.msp430.peripherals.oa");
        po.init("ti.catalog.msp430.peripherals.oa.OA_2.Module", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.Module", "ti.catalog.msp430.peripherals.oa"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2$$create", "ti.catalog.msp430.peripherals.oa"), Global.get("ti$catalog$msp430$peripherals$oa$OA_2$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2$$construct", "ti.catalog.msp430.peripherals.oa"), Global.get("ti$catalog$msp430$peripherals$oa$OA_2$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.oa.OA_2$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.oa.OA_2$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.oa.OA_2$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.oa.OA_2$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.oa"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.oa"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.oa"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Instance", "ti.catalog.msp430.peripherals.oa");
        po.init("ti.catalog.msp430.peripherals.oa.OA_2.Instance", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.Instance", "ti.catalog.msp430.peripherals.oa"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("OA0CTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.OAxCTL0_t", "ti.catalog.msp430.peripherals.oa"), Global.newObject("OAN", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAN_0"), "OAP", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAP_0"), "OAPM", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAPM_0"), "OAADC0", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_OFF"), "OAADC1", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_OFF")), "wh");
        po.addFld("OA0CTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.OAxCTL1_t", "ti.catalog.msp430.peripherals.oa"), Global.newObject("OAFBR", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_0"), "OAFC", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAFC_0"), "OANEXT", om.find("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_OFF"), "OARRIP", om.find("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_OFF")), "wh");
        po.addFld("OA1CTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.OAxCTL0_t", "ti.catalog.msp430.peripherals.oa"), Global.newObject("OAN", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAN_0"), "OAP", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAP_0"), "OAPM", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAPM_0"), "OAADC0", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_OFF"), "OAADC1", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_OFF")), "wh");
        po.addFld("OA1CTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.OAxCTL1_t", "ti.catalog.msp430.peripherals.oa"), Global.newObject("OAFBR", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_0"), "OAFC", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAFC_0"), "OANEXT", om.find("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_OFF"), "OARRIP", om.find("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.oa"), false), Global.newArray(new Object[]{Global.newObject("register", "OA0CTL0", "regForceSet", false), Global.newObject("register", "OA0CTL1", "regForceSet", false), Global.newObject("register", "OA1CTL0", "regForceSet", false), Global.newObject("register", "OA1CTL1", "regForceSet", false)}), "rh");
                fxn = Global.get(cap, "getNumberOfOA");
                if (fxn != null) po.addFxn("getNumberOfOA", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA$$getNumberOfOA", "ti.catalog.msp430.peripherals.oa"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2$$Params", "ti.catalog.msp430.peripherals.oa");
        po.init("ti.catalog.msp430.peripherals.oa.OA_2.Params", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA$$Params", "ti.catalog.msp430.peripherals.oa"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("OA0CTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.OAxCTL0_t", "ti.catalog.msp430.peripherals.oa"), Global.newObject("OAN", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAN_0"), "OAP", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAP_0"), "OAPM", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAPM_0"), "OAADC0", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_OFF"), "OAADC1", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_OFF")), "wh");
        po.addFld("OA0CTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.OAxCTL1_t", "ti.catalog.msp430.peripherals.oa"), Global.newObject("OAFBR", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_0"), "OAFC", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAFC_0"), "OANEXT", om.find("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_OFF"), "OARRIP", om.find("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_OFF")), "wh");
        po.addFld("OA1CTL0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.OAxCTL0_t", "ti.catalog.msp430.peripherals.oa"), Global.newObject("OAN", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAN_0"), "OAP", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAP_0"), "OAPM", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAPM_0"), "OAADC0", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_OFF"), "OAADC1", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_OFF")), "wh");
        po.addFld("OA1CTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.OAxCTL1_t", "ti.catalog.msp430.peripherals.oa"), Global.newObject("OAFBR", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_0"), "OAFC", om.find("ti.catalog.msp430.peripherals.oa.IOA.OAFC_0"), "OANEXT", om.find("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_OFF"), "OARRIP", om.find("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.oa"), false), Global.newArray(new Object[]{Global.newObject("register", "OA0CTL0", "regForceSet", false), Global.newObject("register", "OA0CTL1", "regForceSet", false), Global.newObject("register", "OA1CTL0", "regForceSet", false), Global.newObject("register", "OA1CTL1", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2$$Object", "ti.catalog.msp430.peripherals.oa");
        po.init("ti.catalog.msp430.peripherals.oa.OA_2.Object", om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Instance", "ti.catalog.msp430.peripherals.oa"));
                fxn = Global.get(cap, "getNumberOfOA");
                if (fxn != null) po.addFxn("getNumberOfOA", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA$$getNumberOfOA", "ti.catalog.msp430.peripherals.oa"), fxn);
    }

    void IOA$$ROV()
    {
    }

    void OA_2$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.oa.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.oa"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.oa", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.oa");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.oa.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.oa'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.oa$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.oa$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.oa$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IOA$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA", "ti.catalog.msp430.peripherals.oa");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.Module", "ti.catalog.msp430.peripherals.oa");
        vo.init2(po, "ti.catalog.msp430.peripherals.oa.IOA", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.Instance", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.Params", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.Params", "ti.catalog.msp430.peripherals.oa")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.oa", "ti.catalog.msp430.peripherals.oa"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAN_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAP_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAPM_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC0_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC1_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OARRIP_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OANEXT_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAxCTL0_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL0_t", "ti.catalog.msp430.peripherals.oa"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL0_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAxCTL1_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL1_t", "ti.catalog.msp430.peripherals.oa"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL1_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.oa"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAN_0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAN_1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAN_2", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_2", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAN_3", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_3", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAP_0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAP_1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAP_2", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_2", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAP_3", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_3", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAPM_0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAPM_1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAPM_2", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_2", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAPM_3", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_3", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC0_OFF", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_OFF", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC1_OFF", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_OFF", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_2", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_2", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_3", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_3", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_4", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_4", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_5", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_5", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_6", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_6", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_7", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_7", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_2", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_2", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_3", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_3", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_4", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_4", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_5", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_5", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_6", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_6", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_7", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_7", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OARRIP_OFF", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_OFF", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OARRIP", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OARRIP", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OANEXT_OFF", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_OFF", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OANEXT", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OANEXT", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IOA", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IOA");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void OA_2$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2", "ti.catalog.msp430.peripherals.oa");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Module", "ti.catalog.msp430.peripherals.oa");
        vo.init2(po, "ti.catalog.msp430.peripherals.oa.OA_2", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2$$capsule", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Instance", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Params", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Params", "ti.catalog.msp430.peripherals.oa")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.oa", "ti.catalog.msp430.peripherals.oa"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAN_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAP_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAPM_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC0_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC1_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OARRIP_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OANEXT_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAxCTL0_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL0_t", "ti.catalog.msp430.peripherals.oa"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL0_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAxCTL1_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL1_t", "ti.catalog.msp430.peripherals.oa"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAxCTL1_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.oa"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAN_0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAN_1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAN_2", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_2", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAN_3", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAN_3", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAP_0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAP_1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAP_2", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_2", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAP_3", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAP_3", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAPM_0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAPM_1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAPM_2", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_2", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAPM_3", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAPM_3", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC0_OFF", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC0_OFF", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC1_OFF", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC1_OFF", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAADC1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAADC1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_2", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_2", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_3", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_3", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_4", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_4", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_5", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_5", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_6", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_6", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFBR_7", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFBR_7", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_0", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_0", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_1", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_1", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_2", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_2", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_3", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_3", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_4", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_4", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_5", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_5", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_6", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_6", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OAFC_7", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OAFC_7", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OARRIP_OFF", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OARRIP_OFF", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OARRIP", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OARRIP", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OANEXT_OFF", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OANEXT_OFF", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("OANEXT", om.findStrict("ti.catalog.msp430.peripherals.oa.IOA.OANEXT", "ti.catalog.msp430.peripherals.oa"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.oa");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.oa")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.oa.OA_2$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2.Object", "ti.catalog.msp430.peripherals.oa"));
        pkgV.bind("OA_2", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("OA_2");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.oa.OA_2", "ti.catalog.msp430.peripherals.oa"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.oa.IOA")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.oa.OA_2")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.oa")).add(pkgV);
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
        IOA$$OBJECTS();
        OA_2$$OBJECTS();
        IOA$$CONSTS();
        OA_2$$CONSTS();
        IOA$$CREATES();
        OA_2$$CREATES();
        IOA$$FUNCTIONS();
        OA_2$$FUNCTIONS();
        IOA$$SIZES();
        OA_2$$SIZES();
        IOA$$TYPES();
        OA_2$$TYPES();
        if (isROV) {
            IOA$$ROV();
            OA_2$$ROV();
        }//isROV
        $$SINGLETONS();
        IOA$$SINGLETONS();
        OA_2$$SINGLETONS();
        $$INITIALIZATION();
    }
}
