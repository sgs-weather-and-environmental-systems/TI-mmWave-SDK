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

public class ti_catalog_msp430_peripherals_memory
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
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.special_function");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.memory", new Value.Obj("ti.catalog.msp430.peripherals.memory", pkgP));
    }

    void IFlash$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.IFlash.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.memory.IFlash", new Value.Obj("ti.catalog.msp430.peripherals.memory.IFlash", po));
        pkgV.bind("IFlash", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.WRT_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.WRT_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.EEI_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.EEI_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN0_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.FN0_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN1_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.FN1_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN2_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.FN2_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN3_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.FN3_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN4_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.FN4_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN5_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.FN5_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.LOCK_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.LOCK_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.WAIT_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.WAIT_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_t"));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_t", new Proto.Enm("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.IFlash$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.memory.IFlash.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.IFlash$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.IFlash$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.Params", new Proto.Str(po, true));
    }

    void Flash_2xx$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx", new Value.Obj("ti.catalog.msp430.peripherals.memory.Flash_2xx", po));
        pkgV.bind("Flash_2xx", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FWKEY_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.BLKWRT_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.WRT_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WRT_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.EEIEX_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.EEI_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEI_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.MERAS_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.ERASE_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN0_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN0_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN1_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN1_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN2_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN2_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN3_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN3_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN4_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN4_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN5_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN5_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FAIL_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.LOCKA_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.EMEX_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.LOCK_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCK_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.WAIT_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WAIT_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.ACCVIFG_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.KEYV_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.BUSY_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_t", "ti.catalog.msp430.peripherals.memory"));
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.memory"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$FCTL1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$FCTL2_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL2_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$FCTL3_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL3_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx.Params", new Proto.Str(po, true));
    }

    void IFlash$$CONSTS()
    {
        // interface IFlash
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FWKEY", xdc.services.intern.xsr.Enum.intValue(0xA500L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.WRT_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WRT_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.WRT_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.WRT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WRT_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.WRT", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.EEIEX", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.EEI_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEI_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.EEI_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.EEI", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEI_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.EEI", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.MERAS_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.MERAS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.MERAS", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.ERASE_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.ERASE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.ERASE", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_0", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_1", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_2", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN0_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN0_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN0_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN0", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN1_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN1_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN1_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN1", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN2_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN2_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN2_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN2_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN2", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN3_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN3_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN3_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN3_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN3", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN4_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN4_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN4_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN4_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN4", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN5_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN5_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN5_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FN5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN5_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FN5", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FAIL_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.FAIL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.FAIL", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.LOCKA", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.EMEX_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.EMEX", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.EMEX", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.LOCK_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCK_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.LOCK_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.LOCK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCK_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.LOCK", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.WAIT_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WAIT_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.WAIT_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.WAIT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WAIT_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.WAIT", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG", xdc.services.intern.xsr.Enum.intValue(0x0004L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.KEYV_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.KEYV", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.KEYV", xdc.services.intern.xsr.Enum.intValue(0x0002L)+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.BUSY_OFF", xdc.services.intern.xsr.Enum.intValue((0x0000L))+0));
        om.bind("ti.catalog.msp430.peripherals.memory.IFlash.BUSY", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_t", "ti.catalog.msp430.peripherals.memory"), "ti.catalog.msp430.peripherals.memory.IFlash.BUSY", xdc.services.intern.xsr.Enum.intValue(0x0001L)+0));
    }

    void Flash_2xx$$CONSTS()
    {
        // module Flash_2xx
    }

    void IFlash$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Flash_2xx$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Module", "ti.catalog.msp430.peripherals.memory"), om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Instance", "ti.catalog.msp430.peripherals.memory"), 2, 1, false));
                fxn.addArg(0, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.memory"), $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Params", "ti.catalog.msp430.peripherals.memory"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$memory$Flash_2xx$$create = function( clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.memory.Flash_2xx'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.memory.Flash_2xx.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.memory']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.uMaxFtg = __mod.PARAMS.uMaxFtg;\n");
            sb.append("__inst.uMinFtg = __mod.PARAMS.uMinFtg;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [clock]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Module", "ti.catalog.msp430.peripherals.memory"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx$$Object", "ti.catalog.msp430.peripherals.memory"), null);
                fxn.addArg(1, "clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.memory"), $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Params", "ti.catalog.msp430.peripherals.memory"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$memory$Flash_2xx$$construct = function( __obj, clock, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.memory.Flash_2xx'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {clock:clock});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.uMaxFtg = __mod.PARAMS.uMaxFtg;\n");
            sb.append("__inst.uMinFtg = __mod.PARAMS.uMinFtg;\n");
            sb.append("__inst.clock = __mod.PARAMS.clock;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IFlash$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Flash_2xx$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IFlash$$SIZES()
    {
    }

    void Flash_2xx$$SIZES()
    {
    }

    void IFlash$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.Module", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.IFlash.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.memory"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.Instance", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.IFlash.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.memory"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("uMaxFtg", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "wh");
        po.addFld("uMinFtg", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash$$Params", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.IFlash.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.memory"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("uMaxFtg", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "wh");
        po.addFld("uMinFtg", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "wh");
        // struct IFlash.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.IFlash.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
    }

    void Flash_2xx$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/memory/Flash_2xx.xs");
        om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Module", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.Flash_2xx.Module", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.Module", "ti.catalog.msp430.peripherals.memory"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx$$create", "ti.catalog.msp430.peripherals.memory"), Global.get("ti$catalog$msp430$peripherals$memory$Flash_2xx$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx$$construct", "ti.catalog.msp430.peripherals.memory"), Global.get("ti$catalog$msp430$peripherals$memory$Flash_2xx$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.memory.Flash_2xx$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.memory"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.memory"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.memory"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Instance", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.Flash_2xx.Instance", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.Instance", "ti.catalog.msp430.peripherals.memory"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("FCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL1_t", "ti.catalog.msp430.peripherals.memory"), Global.newObject("FWKEY", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY"), "BLKWRT", om.find("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_OFF"), "WRT", om.find("ti.catalog.msp430.peripherals.memory.IFlash.WRT_OFF"), "EEIEX", om.find("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_OFF"), "EEI", om.find("ti.catalog.msp430.peripherals.memory.IFlash.EEI_OFF"), "MERAS", om.find("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_OFF"), "ERASE", om.find("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_OFF")), "wh");
        po.addFld("FCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL2_t", "ti.catalog.msp430.peripherals.memory"), Global.newObject("FWKEY", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY"), "FSSEL", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_1"), "FN5", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN5_OFF"), "FN4", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN4_OFF"), "FN3", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN3_OFF"), "FN2", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN2_OFF"), "FN1", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN1"), "FN0", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN0_OFF")), "wh");
        po.addFld("FCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL3_t", "ti.catalog.msp430.peripherals.memory"), Global.newObject("FAIL", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_OFF"), "LOCKA", om.find("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_OFF"), "EMEX", om.find("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_OFF"), "LOCK", om.find("ti.catalog.msp430.peripherals.memory.IFlash.LOCK"), "WAIT", om.find("ti.catalog.msp430.peripherals.memory.IFlash.WAIT"), "ACCVIFG", om.find("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_OFF"), "KEYV", om.find("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_OFF"), "BUSY", om.find("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.memory"), false), Global.newArray(new Object[]{Global.newObject("register", "FCTL1", "regForceSet", false), Global.newObject("register", "FCTL2", "regForceSet", false), Global.newObject("register", "FCTL3", "regForceSet", false)}), "rh");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx$$Params", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.Flash_2xx.Params", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash$$Params", "ti.catalog.msp430.peripherals.memory"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("FCTL1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL1_t", "ti.catalog.msp430.peripherals.memory"), Global.newObject("FWKEY", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY"), "BLKWRT", om.find("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_OFF"), "WRT", om.find("ti.catalog.msp430.peripherals.memory.IFlash.WRT_OFF"), "EEIEX", om.find("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_OFF"), "EEI", om.find("ti.catalog.msp430.peripherals.memory.IFlash.EEI_OFF"), "MERAS", om.find("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_OFF"), "ERASE", om.find("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_OFF")), "wh");
        po.addFld("FCTL2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL2_t", "ti.catalog.msp430.peripherals.memory"), Global.newObject("FWKEY", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY"), "FSSEL", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_1"), "FN5", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN5_OFF"), "FN4", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN4_OFF"), "FN3", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN3_OFF"), "FN2", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN2_OFF"), "FN1", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN1"), "FN0", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FN0_OFF")), "wh");
        po.addFld("FCTL3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL3_t", "ti.catalog.msp430.peripherals.memory"), Global.newObject("FAIL", om.find("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_OFF"), "LOCKA", om.find("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_OFF"), "EMEX", om.find("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_OFF"), "LOCK", om.find("ti.catalog.msp430.peripherals.memory.IFlash.LOCK"), "WAIT", om.find("ti.catalog.msp430.peripherals.memory.IFlash.WAIT"), "ACCVIFG", om.find("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_OFF"), "KEYV", om.find("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_OFF"), "BUSY", om.find("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.memory"), false), Global.newArray(new Object[]{Global.newObject("register", "FCTL1", "regForceSet", false), Global.newObject("register", "FCTL2", "regForceSet", false), Global.newObject("register", "FCTL3", "regForceSet", false)}), "rh");
        po.addFld("clock", (Proto)om.findStrict("ti.catalog.msp430.peripherals.clock.IClock.Instance", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx$$Object", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.Flash_2xx.Object", om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Instance", "ti.catalog.msp430.peripherals.memory"));
        // struct Flash_2xx.FCTL1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx$$FCTL1_t", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("FWKEY", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FWKEY_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("BLKWRT", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.BLKWRT_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("WRT", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.WRT_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("EEIEX", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.EEIEX_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("EEI", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.EEI_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("MERAS", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.MERAS_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("ERASE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.ERASE_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
        // struct Flash_2xx.FCTL2_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx$$FCTL2_t", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL2_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("FWKEY", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FWKEY_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("FSSEL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FSSEL_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("FN5", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN5_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("FN4", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN4_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("FN3", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN3_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("FN2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN2_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("FN1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN1_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("FN0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FN0_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
        // struct Flash_2xx.FCTL3_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx$$FCTL3_t", "ti.catalog.msp430.peripherals.memory");
        po.init("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL3_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("FWKEY", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FWKEY_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("FAIL", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FAIL_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("LOCKA", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.LOCKA_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("EMEX", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.EMEX_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("LOCK", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.LOCK_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("WAIT", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.WAIT_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("ACCVIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.ACCVIFG_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("KEYV", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.KEYV_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
                po.addFld("BUSY", (Proto)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.BUSY_t", "ti.catalog.msp430.peripherals.memory"), $$UNDEF, "w");
    }

    void IFlash$$ROV()
    {
    }

    void Flash_2xx$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.memory.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.memory"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.memory", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.memory");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.memory.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.catalog.msp430.peripherals.clock", Global.newArray()));
        imports.add(Global.newArray("ti.catalog.msp430.peripherals.special_function", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.memory'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.memory$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.memory$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.memory$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IFlash$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash", "ti.catalog.msp430.peripherals.memory");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.Module", "ti.catalog.msp430.peripherals.memory");
        vo.init2(po, "ti.catalog.msp430.peripherals.memory.IFlash", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.Instance", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.Params", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.Params", "ti.catalog.msp430.peripherals.memory")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.memory", "ti.catalog.msp430.peripherals.memory"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FWKEY_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BLKWRT_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WRT_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WRT_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEIEX_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEI_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEI_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("MERAS_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ERASE_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN0_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN0_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN1_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN1_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN2_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN2_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN3_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN3_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN4_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN4_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN5_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN5_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FAIL_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCKA_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EMEX_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCK_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCK_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WAIT_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WAIT_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ACCVIFG_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("KEYV_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BUSY_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.memory"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FWKEY_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FWKEY", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BLKWRT_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BLKWRT", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WRT_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WRT_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WRT", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WRT", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEIEX_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEIEX", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEI_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEI_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEI", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEI", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("MERAS_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("MERAS", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.MERAS", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ERASE_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ERASE", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ERASE", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FSSEL_0", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_0", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FSSEL_1", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_1", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FSSEL_2", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_2", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN0_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN0_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN0", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN0", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN1_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN1_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN1", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN1", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN2_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN2_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN2", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN2", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN3_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN3_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN3", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN3", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN4_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN4_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN4", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN4", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN5_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN5_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN5", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN5", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FAIL_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FAIL", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FAIL", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCKA_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCKA", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EMEX_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EMEX", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EMEX", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCK_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCK_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCK", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCK", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WAIT_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WAIT_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WAIT", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WAIT", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ACCVIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ACCVIFG", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("KEYV_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("KEYV", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.KEYV", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BUSY_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BUSY", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BUSY", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IFlash", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IFlash");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void Flash_2xx$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx", "ti.catalog.msp430.peripherals.memory");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Module", "ti.catalog.msp430.peripherals.memory");
        vo.init2(po, "ti.catalog.msp430.peripherals.memory.Flash_2xx", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx$$capsule", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Instance", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Params", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Params", "ti.catalog.msp430.peripherals.memory")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.memory", "ti.catalog.msp430.peripherals.memory"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FWKEY_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BLKWRT_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WRT_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WRT_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEIEX_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEI_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEI_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("MERAS_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ERASE_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FSSEL_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN0_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN0_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN1_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN1_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN2_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN2_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN3_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN3_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN4_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN4_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN5_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN5_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FAIL_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCKA_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EMEX_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCK_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCK_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WAIT_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WAIT_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ACCVIFG_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("KEYV_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BUSY_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.memory"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FCTL1_t", om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL1_t", "ti.catalog.msp430.peripherals.memory"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL1_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FCTL2_t", om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL2_t", "ti.catalog.msp430.peripherals.memory"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL2_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FCTL3_t", om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL3_t", "ti.catalog.msp430.peripherals.memory"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.FCTL3_t", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FWKEY_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FWKEY", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FWKEY", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BLKWRT_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BLKWRT", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BLKWRT", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WRT_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WRT_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WRT", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WRT", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEIEX_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEIEX", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEIEX", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEI_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEI_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EEI", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EEI", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("MERAS_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.MERAS_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("MERAS", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.MERAS", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ERASE_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ERASE_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ERASE", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ERASE", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FSSEL_0", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_0", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FSSEL_1", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_1", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FSSEL_2", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FSSEL_2", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN0_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN0_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN0", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN0", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN1_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN1_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN1", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN1", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN2_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN2_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN2", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN2", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN3_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN3_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN3", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN3", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN4_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN4_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN4", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN4", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN5_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN5_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FN5", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FN5", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FAIL_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FAIL_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("FAIL", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.FAIL", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCKA_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCKA", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCKA", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EMEX_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EMEX_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("EMEX", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.EMEX", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCK_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCK_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("LOCK", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.LOCK", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WAIT_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WAIT_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("WAIT", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.WAIT", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ACCVIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("ACCVIFG", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.ACCVIFG", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("KEYV_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.KEYV_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("KEYV", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.KEYV", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BUSY_OFF", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BUSY_OFF", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("BUSY", om.findStrict("ti.catalog.msp430.peripherals.memory.IFlash.BUSY", "ti.catalog.msp430.peripherals.memory"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.memory");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.memory")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.memory.Flash_2xx$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx.Object", "ti.catalog.msp430.peripherals.memory"));
        pkgV.bind("Flash_2xx", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Flash_2xx");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.memory.Flash_2xx", "ti.catalog.msp430.peripherals.memory"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.memory.IFlash")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.memory.Flash_2xx")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.memory")).add(pkgV);
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
        IFlash$$OBJECTS();
        Flash_2xx$$OBJECTS();
        IFlash$$CONSTS();
        Flash_2xx$$CONSTS();
        IFlash$$CREATES();
        Flash_2xx$$CREATES();
        IFlash$$FUNCTIONS();
        Flash_2xx$$FUNCTIONS();
        IFlash$$SIZES();
        Flash_2xx$$SIZES();
        IFlash$$TYPES();
        Flash_2xx$$TYPES();
        if (isROV) {
            IFlash$$ROV();
            Flash_2xx$$ROV();
        }//isROV
        $$SINGLETONS();
        IFlash$$SINGLETONS();
        Flash_2xx$$SINGLETONS();
        $$INITIALIZATION();
    }
}
