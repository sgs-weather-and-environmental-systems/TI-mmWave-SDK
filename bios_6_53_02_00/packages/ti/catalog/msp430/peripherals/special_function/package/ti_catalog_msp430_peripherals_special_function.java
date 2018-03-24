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

public class ti_catalog_msp430_peripherals_special_function
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
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.special_function", new Value.Obj("ti.catalog.msp430.peripherals.special_function", pkgP));
    }

    void IE1$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE1.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE1", new Value.Obj("ti.catalog.msp430.peripherals.special_function.IE1", po));
        pkgV.bind("IE1", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.OFIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE1.OFIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$IE1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.IE1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$IFG1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.IFG1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$regIntVect_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.regIntVect_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.special_function.IE1.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.Params", new Proto.Str(po, true));
    }

    void IE2$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE2.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE2", new Value.Obj("ti.catalog.msp430.peripherals.special_function.IE2", po));
        pkgV.bind("IE2", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$IE2_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.IE2_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$IFG2_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.IFG2_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$regIntVect_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.regIntVect_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.special_function.IE2.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.Params", new Proto.Str(po, true));
    }

    void SFRIE1$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1", new Value.Obj("ti.catalog.msp430.peripherals.special_function.SFRIE1", po));
        pkgV.bind("SFRIE1", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$IE1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.IE1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$IFG1_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.IFG1_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$regIntVect_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.regIntVect_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.Params", new Proto.Str(po, true));
    }

    void SR$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SR.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SR", new Value.Obj("ti.catalog.msp430.peripherals.special_function.SR", po));
        pkgV.bind("SR", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.SCG1_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SR.SCG1_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.SCG0_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SR.SCG0_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_t"));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.GIE_t", new Proto.Enm("ti.catalog.msp430.peripherals.special_function.SR.GIE_t"));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$SR_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.SR_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.special_function.SR.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.Params", new Proto.Str(po, true));
    }

    void IE1$$CONSTS()
    {
        // module IE1
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.NMIIE", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.WDTIE", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.OFIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.OFIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.OFIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.OFIE", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.OFIFG", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
    }

    void IE2$$CONSTS()
    {
        // module IE2
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE", xdc.services.intern.xsr.Enum.intValue(0x08L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE", xdc.services.intern.xsr.Enum.intValue(0x04L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG", xdc.services.intern.xsr.Enum.intValue(0x08L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG", xdc.services.intern.xsr.Enum.intValue(0x04L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
    }

    void SFRIE1$$CONSTS()
    {
        // module SFRIE1
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE", xdc.services.intern.xsr.Enum.intValue(0x80L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE", xdc.services.intern.xsr.Enum.intValue(0x40L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG", xdc.services.intern.xsr.Enum.intValue(0x01L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG", xdc.services.intern.xsr.Enum.intValue(0x02L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_OFF", xdc.services.intern.xsr.Enum.intValue(0x00L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG", xdc.services.intern.xsr.Enum.intValue(0x20L)+0));
    }

    void SR$$CONSTS()
    {
        // module SR
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.SCG1_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG1_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SR.SCG1_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.SCG1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG1_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SR.SCG1", xdc.services.intern.xsr.Enum.intValue(0x0080L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.SCG0_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG0_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SR.SCG0_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.SCG0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG0_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SR.SCG0", xdc.services.intern.xsr.Enum.intValue(0x0040L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SR.OSCOFF", xdc.services.intern.xsr.Enum.intValue(0x0020L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SR.CPUOFF", xdc.services.intern.xsr.Enum.intValue(0x0010L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.GIE_OFF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.GIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SR.GIE_OFF", xdc.services.intern.xsr.Enum.intValue(0x0000L)+0));
        om.bind("ti.catalog.msp430.peripherals.special_function.SR.GIE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.GIE_t", "ti.catalog.msp430.peripherals.special_function"), "ti.catalog.msp430.peripherals.special_function.SR.GIE", xdc.services.intern.xsr.Enum.intValue(0x0008L)+0));
    }

    void IE1$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Module", "ti.catalog.msp430.peripherals.special_function"), om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Params", "ti.catalog.msp430.peripherals.special_function"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$special_function$IE1$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.special_function.IE1'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.special_function.IE1.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.special_function']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Module", "ti.catalog.msp430.peripherals.special_function"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$Object", "ti.catalog.msp430.peripherals.special_function"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Params", "ti.catalog.msp430.peripherals.special_function"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$special_function$IE1$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.special_function.IE1'];\n");
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

    void IE2$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Module", "ti.catalog.msp430.peripherals.special_function"), om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Params", "ti.catalog.msp430.peripherals.special_function"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$special_function$IE2$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.special_function.IE2'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.special_function.IE2.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.special_function']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Module", "ti.catalog.msp430.peripherals.special_function"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$Object", "ti.catalog.msp430.peripherals.special_function"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Params", "ti.catalog.msp430.peripherals.special_function"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$special_function$IE2$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.special_function.IE2'];\n");
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

    void SFRIE1$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Module", "ti.catalog.msp430.peripherals.special_function"), om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Instance", "ti.catalog.msp430.peripherals.special_function"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Params", "ti.catalog.msp430.peripherals.special_function"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$special_function$SFRIE1$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.special_function.SFRIE1'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.special_function.SFRIE1.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.special_function']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Module", "ti.catalog.msp430.peripherals.special_function"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$Object", "ti.catalog.msp430.peripherals.special_function"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Params", "ti.catalog.msp430.peripherals.special_function"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$special_function$SFRIE1$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.special_function.SFRIE1'];\n");
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

    void SR$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Module", "ti.catalog.msp430.peripherals.special_function"), om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Params", "ti.catalog.msp430.peripherals.special_function"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$special_function$SR$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.special_function.SR'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.special_function.SR.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.special_function']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Module", "ti.catalog.msp430.peripherals.special_function"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$Object", "ti.catalog.msp430.peripherals.special_function"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Params", "ti.catalog.msp430.peripherals.special_function"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$special_function$SR$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.special_function.SR'];\n");
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

    void IE1$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn IE1.getWDTIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$getWDTIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE1.setWDTIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$setWDTIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn IE1.getWDTIFG
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$getWDTIFG", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE1.setWDTIFG
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$setWDTIFG", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn IE1.getOFIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$getOFIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE1.setOFIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$setOFIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn IE1.getOFIFG
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$getOFIFG", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE1.setOFIFG
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$setOFIFG", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn IE1.getNMIIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$getNMIIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE1.setNMIIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$setNMIIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn IE1.getNMIIFG
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$getNMIIFG", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE1.setNMIIFG
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$setNMIIFG", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn IE1.getACCVIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$getACCVIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE1.setACCVIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$setACCVIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn IE1.getACCVIFG
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$getACCVIFG", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE1.setACCVIFG
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$setACCVIFG", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
    }

    void IE2$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn IE2.getUCB0TXIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$getUCB0TXIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE2.setUCB0TXIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$setUCB0TXIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn IE2.getUCB0RXIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$getUCB0RXIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE2.setUCB0RXIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$setUCB0RXIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn IE2.getUCA0TXIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$getUCA0TXIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE2.setUCA0TXIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$setUCA0TXIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn IE2.getUCA0RXIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$getUCA0RXIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn IE2.setUCA0RXIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$setUCA0RXIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
    }

    void SFRIE1$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn SFRIE1.getSFRIE1
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$getSFRIE1", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "register", $$T_Str, $$UNDEF);
        // fxn SFRIE1.setSFRIE1
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$setSFRIE1", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 2, 2, false));
                fxn.addArg(0, "register", $$T_Str, $$UNDEF);
                fxn.addArg(1, "set", $$T_Bool, $$UNDEF);
    }

    void SR$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn SR.getSCG1
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$getSCG1", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn SR.setSCG1
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$setSCG1", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn SR.getSCG0
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$getSCG0", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn SR.setSCG0
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$setSCG0", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn SR.getOSCOFF
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$getOSCOFF", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn SR.setOSCOFF
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$setOSCOFF", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn SR.getCPUOFF
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$getCPUOFF", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn SR.setCPUOFF
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$setCPUOFF", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
        // fxn SR.getGIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$getGIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 0, 0, false));
        // fxn SR.setGIE
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.special_function.SR$$setGIE", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "set", $$T_Bool, $$UNDEF);
    }

    void IE1$$SIZES()
    {
    }

    void IE2$$SIZES()
    {
    }

    void SFRIE1$$SIZES()
    {
    }

    void SR$$SIZES()
    {
    }

    void IE1$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/special_function/IE1.xs");
        om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Module", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE1.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$create", "ti.catalog.msp430.peripherals.special_function"), Global.get("ti$catalog$msp430$peripherals$special_function$IE1$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$construct", "ti.catalog.msp430.peripherals.special_function"), Global.get("ti$catalog$msp430$peripherals$special_function$IE1$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.IE1$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.special_function"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.special_function"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.special_function"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE1.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
        po.addFld("IE1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.IE1_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("ACCVIE", om.find("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_OFF"), "NMIIE", om.find("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_OFF"), "OFIE", om.find("ti.catalog.msp430.peripherals.special_function.IE1.OFIE_OFF"), "WDTIE", om.find("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_OFF")), "wh");
        po.addFld("IFG1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.IFG1_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("ACCVIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_OFF"), "NMIIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_OFF"), "OFIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_OFF"), "WDTIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"), false), Global.newArray(new Object[]{Global.newObject("register", "IE1", "regForceSet", false), Global.newObject("register", "IFG1", "regForceSet", false)}), "rh");
                po.addFxn("getWDTIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getWDTIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getWDTIE"));
                po.addFxn("setWDTIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setWDTIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setWDTIE"));
                po.addFxn("getWDTIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getWDTIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getWDTIFG"));
                po.addFxn("setWDTIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setWDTIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setWDTIFG"));
                po.addFxn("getOFIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getOFIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getOFIE"));
                po.addFxn("setOFIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setOFIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setOFIE"));
                po.addFxn("getOFIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getOFIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getOFIFG"));
                po.addFxn("setOFIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setOFIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setOFIFG"));
                po.addFxn("getNMIIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getNMIIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getNMIIE"));
                po.addFxn("setNMIIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setNMIIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setNMIIE"));
                po.addFxn("getNMIIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getNMIIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getNMIIFG"));
                po.addFxn("setNMIIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setNMIIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setNMIIFG"));
                po.addFxn("getACCVIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getACCVIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getACCVIE"));
                po.addFxn("setACCVIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setACCVIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setACCVIE"));
                po.addFxn("getACCVIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getACCVIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getACCVIFG"));
                po.addFxn("setACCVIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setACCVIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setACCVIFG"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$Params", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE1.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
        po.addFld("IE1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.IE1_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("ACCVIE", om.find("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_OFF"), "NMIIE", om.find("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_OFF"), "OFIE", om.find("ti.catalog.msp430.peripherals.special_function.IE1.OFIE_OFF"), "WDTIE", om.find("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_OFF")), "wh");
        po.addFld("IFG1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.IFG1_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("ACCVIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_OFF"), "NMIIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_OFF"), "OFIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_OFF"), "WDTIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"), false), Global.newArray(new Object[]{Global.newObject("register", "IE1", "regForceSet", false), Global.newObject("register", "IFG1", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$Object", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE1.Object", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"));
                po.addFxn("getWDTIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getWDTIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getWDTIE"));
                po.addFxn("setWDTIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setWDTIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setWDTIE"));
                po.addFxn("getWDTIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getWDTIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getWDTIFG"));
                po.addFxn("setWDTIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setWDTIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setWDTIFG"));
                po.addFxn("getOFIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getOFIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getOFIE"));
                po.addFxn("setOFIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setOFIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setOFIE"));
                po.addFxn("getOFIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getOFIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getOFIFG"));
                po.addFxn("setOFIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setOFIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setOFIFG"));
                po.addFxn("getNMIIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getNMIIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getNMIIE"));
                po.addFxn("setNMIIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setNMIIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setNMIIE"));
                po.addFxn("getNMIIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getNMIIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getNMIIFG"));
                po.addFxn("setNMIIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setNMIIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setNMIIFG"));
                po.addFxn("getACCVIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getACCVIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getACCVIE"));
                po.addFxn("setACCVIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setACCVIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setACCVIE"));
                po.addFxn("getACCVIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$getACCVIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getACCVIFG"));
                po.addFxn("setACCVIFG", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$setACCVIFG", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setACCVIFG"));
        // struct IE1.IE1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$IE1_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE1.IE1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("ACCVIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("NMIIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("OFIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("WDTIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
        // struct IE1.IFG1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$IFG1_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE1.IFG1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("ACCVIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("NMIIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("OFIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("WDTIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
        // struct IE1.regIntVect_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$regIntVect_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE1.regIntVect_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("registerName", $$T_Str, $$UNDEF, "w");
                po.addFld("registerDescription", $$T_Str, $$UNDEF, "w");
                po.addFld("isrToggleString", $$T_Str, $$UNDEF, "w");
                po.addFld("priorityName", $$T_Str, $$UNDEF, "w");
                po.addFld("interruptEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("interruptHandler", $$T_Bool, $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // struct IE1.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE1.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
    }

    void IE2$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/special_function/IE2.xs");
        om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Module", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE2.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$create", "ti.catalog.msp430.peripherals.special_function"), Global.get("ti$catalog$msp430$peripherals$special_function$IE2$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$construct", "ti.catalog.msp430.peripherals.special_function"), Global.get("ti$catalog$msp430$peripherals$special_function$IE2$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.IE2$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.special_function"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.special_function"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.special_function"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE2.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("IE2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.IE2_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("UCB0TXIE", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_OFF"), "UCB0RXIE", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_OFF"), "UCA0TXIE", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_OFF"), "UCA0RXIE", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_OFF")), "wh");
        po.addFld("IFG2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.IFG2_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("UCB0TXIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_OFF"), "UCB0RXIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_OFF"), "UCA0TXIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_OFF"), "UCA0RXIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_OFF")), "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"), false), Global.newArray(new Object[]{Global.newObject("register", "IE2", "regForceSet", false), Global.newObject("register", "IFG2", "regForceSet", false)}), "rh");
                po.addFxn("getUCB0TXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$getUCB0TXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getUCB0TXIE"));
                po.addFxn("setUCB0TXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$setUCB0TXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setUCB0TXIE"));
                po.addFxn("getUCB0RXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$getUCB0RXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getUCB0RXIE"));
                po.addFxn("setUCB0RXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$setUCB0RXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setUCB0RXIE"));
                po.addFxn("getUCA0TXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$getUCA0TXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getUCA0TXIE"));
                po.addFxn("setUCA0TXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$setUCA0TXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setUCA0TXIE"));
                po.addFxn("getUCA0RXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$getUCA0RXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getUCA0RXIE"));
                po.addFxn("setUCA0RXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$setUCA0RXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setUCA0RXIE"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$Params", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE2.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("IE2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.IE2_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("UCB0TXIE", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_OFF"), "UCB0RXIE", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_OFF"), "UCA0TXIE", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_OFF"), "UCA0RXIE", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_OFF")), "wh");
        po.addFld("IFG2", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.IFG2_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("UCB0TXIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_OFF"), "UCB0RXIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_OFF"), "UCA0TXIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_OFF"), "UCA0RXIFG", om.find("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_OFF")), "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"), false), Global.newArray(new Object[]{Global.newObject("register", "IE2", "regForceSet", false), Global.newObject("register", "IFG2", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$Object", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE2.Object", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"));
                po.addFxn("getUCB0TXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$getUCB0TXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getUCB0TXIE"));
                po.addFxn("setUCB0TXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$setUCB0TXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setUCB0TXIE"));
                po.addFxn("getUCB0RXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$getUCB0RXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getUCB0RXIE"));
                po.addFxn("setUCB0RXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$setUCB0RXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setUCB0RXIE"));
                po.addFxn("getUCA0TXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$getUCA0TXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getUCA0TXIE"));
                po.addFxn("setUCA0TXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$setUCA0TXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setUCA0TXIE"));
                po.addFxn("getUCA0RXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$getUCA0RXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getUCA0RXIE"));
                po.addFxn("setUCA0RXIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$setUCA0RXIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setUCA0RXIE"));
        // struct IE2.IE2_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$IE2_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE2.IE2_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("UCB0TXIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("UCB0RXIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("UCA0TXIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("UCA0RXIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
        // struct IE2.IFG2_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$IFG2_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE2.IFG2_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("UCB0TXIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("UCB0RXIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("UCA0TXIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("UCA0RXIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
        // struct IE2.regIntVect_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$regIntVect_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE2.regIntVect_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("registerName", $$T_Str, $$UNDEF, "w");
                po.addFld("registerDescription", $$T_Str, $$UNDEF, "w");
                po.addFld("isrToggleString", $$T_Str, $$UNDEF, "w");
                po.addFld("priorityName", $$T_Str, $$UNDEF, "w");
                po.addFld("interruptEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("interruptHandler", $$T_Bool, $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // struct IE2.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.IE2.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
    }

    void SFRIE1$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/special_function/SFRIE1.xs");
        om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Module", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SFRIE1.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$create", "ti.catalog.msp430.peripherals.special_function"), Global.get("ti$catalog$msp430$peripherals$special_function$SFRIE1$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$construct", "ti.catalog.msp430.peripherals.special_function"), Global.get("ti$catalog$msp430$peripherals$special_function$SFRIE1$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.SFRIE1$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.special_function"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.special_function"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.special_function"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Instance", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SFRIE1.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "wh");
        po.addFld("SFRIE1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.IE1_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("ACCVIE", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_OFF"), "NMIIE", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_OFF"), "OFIE", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_OFF"), "WDTIE", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_OFF")), "wh");
        po.addFld("SFRIFG1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.IFG1_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("ACCVIFG", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_OFF"), "NMIIFG", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_OFF"), "OFIFG", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_OFF"), "WDTIFG", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"), false), Global.newArray(new Object[]{Global.newObject("register", "SFRIE1", "regForceSet", false), Global.newObject("register", "SFRIFG1", "regForceSet", false)}), "rh");
                po.addFxn("getSFRIE1", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$getSFRIE1", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getSFRIE1"));
                po.addFxn("setSFRIE1", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$setSFRIE1", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setSFRIE1"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$Params", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SFRIE1.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "wh");
        po.addFld("SFRIE1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.IE1_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("ACCVIE", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_OFF"), "NMIIE", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_OFF"), "OFIE", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_OFF"), "WDTIE", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_OFF")), "wh");
        po.addFld("SFRIFG1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.IFG1_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("ACCVIFG", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_OFF"), "NMIIFG", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_OFF"), "OFIFG", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_OFF"), "WDTIFG", om.find("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"), false), Global.newArray(new Object[]{Global.newObject("register", "SFRIE1", "regForceSet", false), Global.newObject("register", "SFRIFG1", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$Object", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SFRIE1.Object", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Instance", "ti.catalog.msp430.peripherals.special_function"));
                po.addFxn("getSFRIE1", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$getSFRIE1", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getSFRIE1"));
                po.addFxn("setSFRIE1", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$setSFRIE1", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setSFRIE1"));
        // struct SFRIE1.IE1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$IE1_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SFRIE1.IE1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("ACCVIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("NMIIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("OFIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("WDTIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
        // struct SFRIE1.IFG1_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$IFG1_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SFRIE1.IFG1_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("ACCVIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("NMIIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("OFIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("WDTIFG", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
        // struct SFRIE1.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SFRIE1.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
        // struct SFRIE1.regIntVect_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$regIntVect_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SFRIE1.regIntVect_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("registerName", $$T_Str, $$UNDEF, "w");
                po.addFld("registerDescription", $$T_Str, $$UNDEF, "w");
                po.addFld("isrToggleString", $$T_Str, $$UNDEF, "w");
                po.addFld("priorityName", $$T_Str, $$UNDEF, "w");
                po.addFld("interruptEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("interruptHandler", $$T_Bool, $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
    }

    void SR$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/special_function/SR.xs");
        om.bind("ti.catalog.msp430.peripherals.special_function.SR$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Module", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SR.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$create", "ti.catalog.msp430.peripherals.special_function"), Global.get("ti$catalog$msp430$peripherals$special_function$SR$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$construct", "ti.catalog.msp430.peripherals.special_function"), Global.get("ti$catalog$msp430$peripherals$special_function$SR$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.SR$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.SR$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.SR$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.special_function.SR$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.special_function"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.special_function"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.special_function"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SR.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("SR", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SR_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("SCG1", om.find("ti.catalog.msp430.peripherals.special_function.SR.SCG1_OFF"), "SCG0", om.find("ti.catalog.msp430.peripherals.special_function.SR.SCG0_OFF"), "OSCOFF", om.find("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_OFF"), "CPUOFF", om.find("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_OFF"), "GIE", om.find("ti.catalog.msp430.peripherals.special_function.SR.GIE_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"), false), Global.newArray(new Object[]{Global.newObject("register", "SR", "regForceSet", false)}), "rh");
                po.addFxn("getSCG1", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$getSCG1", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getSCG1"));
                po.addFxn("setSCG1", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$setSCG1", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setSCG1"));
                po.addFxn("getSCG0", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$getSCG0", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getSCG0"));
                po.addFxn("setSCG0", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$setSCG0", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setSCG0"));
                po.addFxn("getOSCOFF", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$getOSCOFF", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getOSCOFF"));
                po.addFxn("setOSCOFF", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$setOSCOFF", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setOSCOFF"));
                po.addFxn("getCPUOFF", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$getCPUOFF", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getCPUOFF"));
                po.addFxn("setCPUOFF", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$setCPUOFF", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setCPUOFF"));
                po.addFxn("getGIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$getGIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getGIE"));
                po.addFxn("setGIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$setGIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setGIE"));
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$Params", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SR.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.special_function"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("SR", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SR_t", "ti.catalog.msp430.peripherals.special_function"), Global.newObject("SCG1", om.find("ti.catalog.msp430.peripherals.special_function.SR.SCG1_OFF"), "SCG0", om.find("ti.catalog.msp430.peripherals.special_function.SR.SCG0_OFF"), "OSCOFF", om.find("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_OFF"), "CPUOFF", om.find("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_OFF"), "GIE", om.find("ti.catalog.msp430.peripherals.special_function.SR.GIE_OFF")), "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"), false), Global.newArray(new Object[]{Global.newObject("register", "SR", "regForceSet", false)}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$Object", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SR.Object", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"));
                po.addFxn("getSCG1", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$getSCG1", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getSCG1"));
                po.addFxn("setSCG1", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$setSCG1", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setSCG1"));
                po.addFxn("getSCG0", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$getSCG0", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getSCG0"));
                po.addFxn("setSCG0", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$setSCG0", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setSCG0"));
                po.addFxn("getOSCOFF", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$getOSCOFF", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getOSCOFF"));
                po.addFxn("setOSCOFF", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$setOSCOFF", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setOSCOFF"));
                po.addFxn("getCPUOFF", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$getCPUOFF", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getCPUOFF"));
                po.addFxn("setCPUOFF", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$setCPUOFF", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setCPUOFF"));
                po.addFxn("getGIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$getGIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "getGIE"));
                po.addFxn("setGIE", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$setGIE", "ti.catalog.msp430.peripherals.special_function"), Global.get(cap, "setGIE"));
        // struct SR.SR_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$SR_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SR.SR_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("SCG1", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG1_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("SCG0", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG0_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("OSCOFF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("CPUOFF", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
                po.addFld("GIE", (Proto)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.GIE_t", "ti.catalog.msp430.peripherals.special_function"), $$UNDEF, "w");
        // struct SR.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function");
        po.init("ti.catalog.msp430.peripherals.special_function.SR.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
    }

    void IE1$$ROV()
    {
    }

    void IE2$$ROV()
    {
    }

    void SFRIE1$$ROV()
    {
    }

    void SR$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.special_function.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.special_function"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.special_function", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.special_function");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.special_function.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.special_function'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.special_function$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.special_function$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.special_function$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IE1$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1", "ti.catalog.msp430.peripherals.special_function");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Module", "ti.catalog.msp430.peripherals.special_function");
        vo.init2(po, "ti.catalog.msp430.peripherals.special_function.IE1", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1$$capsule", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Instance", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Params", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Params", "ti.catalog.msp430.peripherals.special_function")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.special_function", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("IE1_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.IE1_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.IE1_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("IFG1_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.IFG1_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.IFG1_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.NMIIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.WDTIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.OFIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.ACCVIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.special_function")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.special_function.IE1$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1.Object", "ti.catalog.msp430.peripherals.special_function"));
        pkgV.bind("IE1", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IE1");
    }

    void IE2$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2", "ti.catalog.msp430.peripherals.special_function");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Module", "ti.catalog.msp430.peripherals.special_function");
        vo.init2(po, "ti.catalog.msp430.peripherals.special_function.IE2", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2$$capsule", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Instance", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Params", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Params", "ti.catalog.msp430.peripherals.special_function")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.special_function", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0TXIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0RXIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0TXIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0RXIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0TXIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0RXIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0TXIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0RXIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("IE2_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.IE2_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.IE2_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("IFG2_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.IFG2_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.IFG2_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0TXIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0TXIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0RXIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0RXIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0TXIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0TXIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0RXIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0RXIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0TXIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0TXIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0TXIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0RXIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCB0RXIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCB0RXIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0TXIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0TXIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0TXIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0RXIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("UCA0RXIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.UCA0RXIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.special_function")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.special_function.IE2$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2.Object", "ti.catalog.msp430.peripherals.special_function"));
        pkgV.bind("IE2", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IE2");
    }

    void SFRIE1$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1", "ti.catalog.msp430.peripherals.special_function");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Module", "ti.catalog.msp430.peripherals.special_function");
        vo.init2(po, "ti.catalog.msp430.peripherals.special_function.SFRIE1", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1$$capsule", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Instance", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Params", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Params", "ti.catalog.msp430.peripherals.special_function")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.special_function", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("JMBOUTIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("JMBINIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIFG_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("IE1_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.IE1_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.IE1_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("IFG1_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.IFG1_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.IFG1_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.regIntVect_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("JMBOUTIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("JMBOUTIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBOUTIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("JMBINIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("JMBINIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.JMBINIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("NMIIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.NMIIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("WDTIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.WDTIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OFIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.OFIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIFG_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ACCVIFG", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.ACCVIFG", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.special_function")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.special_function.SFRIE1$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1.Object", "ti.catalog.msp430.peripherals.special_function"));
        pkgV.bind("SFRIE1", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SFRIE1");
    }

    void SR$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR", "ti.catalog.msp430.peripherals.special_function");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Module", "ti.catalog.msp430.peripherals.special_function");
        vo.init2(po, "ti.catalog.msp430.peripherals.special_function.SR", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR$$capsule", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Instance", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Params", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Params", "ti.catalog.msp430.peripherals.special_function")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.special_function", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("SCG1_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG1_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("SCG0_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG0_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OSCOFF_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("CPUOFF_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("GIE_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.GIE_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("SR_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SR_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SR_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("SCG1_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG1_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("SCG1", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG1", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("SCG0_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG0_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("SCG0", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.SCG0", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OSCOFF_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("OSCOFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.OSCOFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("CPUOFF_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("CPUOFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.CPUOFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("GIE_OFF", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.GIE_OFF", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("GIE", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.GIE", "ti.catalog.msp430.peripherals.special_function"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.special_function")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.special_function.SR$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.special_function.SR.Object", "ti.catalog.msp430.peripherals.special_function"));
        pkgV.bind("SR", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SR");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE1", "ti.catalog.msp430.peripherals.special_function"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.special_function.IE2", "ti.catalog.msp430.peripherals.special_function"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.special_function.SFRIE1", "ti.catalog.msp430.peripherals.special_function"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.special_function.SR", "ti.catalog.msp430.peripherals.special_function"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.special_function.IE1")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.special_function.IE2")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.special_function.SFRIE1")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.special_function.SR")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.special_function")).add(pkgV);
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
        IE1$$OBJECTS();
        IE2$$OBJECTS();
        SFRIE1$$OBJECTS();
        SR$$OBJECTS();
        IE1$$CONSTS();
        IE2$$CONSTS();
        SFRIE1$$CONSTS();
        SR$$CONSTS();
        IE1$$CREATES();
        IE2$$CREATES();
        SFRIE1$$CREATES();
        SR$$CREATES();
        IE1$$FUNCTIONS();
        IE2$$FUNCTIONS();
        SFRIE1$$FUNCTIONS();
        SR$$FUNCTIONS();
        IE1$$SIZES();
        IE2$$SIZES();
        SFRIE1$$SIZES();
        SR$$SIZES();
        IE1$$TYPES();
        IE2$$TYPES();
        SFRIE1$$TYPES();
        SR$$TYPES();
        if (isROV) {
            IE1$$ROV();
            IE2$$ROV();
            SFRIE1$$ROV();
            SR$$ROV();
        }//isROV
        $$SINGLETONS();
        IE1$$SINGLETONS();
        IE2$$SINGLETONS();
        SFRIE1$$SINGLETONS();
        SR$$SINGLETONS();
        $$INITIALIZATION();
    }
}
