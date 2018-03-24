/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D20
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class ti_sysbios_family_c674
{
    static final String VERS = "@(#) xdc-D20\n";

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
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.knl");
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.interfaces");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.c674.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.c674", new Value.Obj("ti.sysbios.family.c674", pkgP));
    }

    void Power$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c674.Power.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c674.Power", new Value.Obj("ti.sysbios.family.c674.Power", po));
        pkgV.bind("Power", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c674.Power$$Attrs", new Proto.Obj());
        om.bind("ti.sysbios.family.c674.Power.Attrs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c674.Power$$Config", new Proto.Obj());
        om.bind("ti.sysbios.family.c674.Power.Config", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c674.Power$$SetpointInfo", new Proto.Obj());
        om.bind("ti.sysbios.family.c674.Power.SetpointInfo", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c674.Power$$SleepOverride", new Proto.Obj());
        om.bind("ti.sysbios.family.c674.Power.SleepOverride", new Proto.Str(spo, false));
        om.bind("ti.sysbios.family.c674.Power.Constraint", new Proto.Enm("ti.sysbios.family.c674.Power.Constraint"));
        om.bind("ti.sysbios.family.c674.Power.Domain", new Proto.Enm("ti.sysbios.family.c674.Power.Domain"));
        om.bind("ti.sysbios.family.c674.Power.Event", new Proto.Enm("ti.sysbios.family.c674.Power.Event"));
        om.bind("ti.sysbios.family.c674.Power.NotifyResponse", new Proto.Enm("ti.sysbios.family.c674.Power.NotifyResponse"));
        om.bind("ti.sysbios.family.c674.Power.Resource", new Proto.Enm("ti.sysbios.family.c674.Power.Resource"));
        om.bind("ti.sysbios.family.c674.Power.SleepCode", new Proto.Enm("ti.sysbios.family.c674.Power.SleepCode"));
        om.bind("ti.sysbios.family.c674.Power.Status", new Proto.Enm("ti.sysbios.family.c674.Power.Status"));
        om.bind("ti.sysbios.family.c674.Power.pmiLib", new Proto.Enm("ti.sysbios.family.c674.Power.pmiLib"));
        om.bind("ti.sysbios.family.c674.Power.psclLib", new Proto.Enm("ti.sysbios.family.c674.Power.psclLib"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c674.Power$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.c674.Power.ModuleView", new Proto.Str(spo, false));
        om.bind("ti.sysbios.family.c674.Power.SigType", new Proto.Enm("ti.sysbios.family.c674.Power.SigType"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c674.Power$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c674.Power.Module_State", new Proto.Str(spo, false));
    }

    void Power$$CONSTS()
    {
        // module Power
        om.bind("ti.sysbios.family.c674.Power.DISALLOWED_CPU_SETPOINT_MASK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Constraint", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.DISALLOWED_CPU_SETPOINT_MASK", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.c674.Power.DISALLOWED_PER_SETPOINT_MASK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Constraint", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.DISALLOWED_PER_SETPOINT_MASK", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.c674.Power.DISALLOWEDSLEEPSTATE_MASK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Constraint", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.DISALLOWEDSLEEPSTATE_MASK", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.c674.Power.CPU", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Domain", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.CPU", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c674.Power.PER", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Domain", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.PER", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.CPU", "ti.sysbios.family.c674"))+1));
        om.bind("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.GOINGTOSTANDBY", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c674.Power.AWAKEFROMSTANDBY", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.AWAKEFROMSTANDBY", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"))+1));
        om.bind("ti.sysbios.family.c674.Power.GOINGTOSLEEP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.GOINGTOSLEEP", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"))+2));
        om.bind("ti.sysbios.family.c674.Power.AWAKEFROMSLEEP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.AWAKEFROMSLEEP", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"))+3));
        om.bind("ti.sysbios.family.c674.Power.GOINGTODEEPSLEEP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.GOINGTODEEPSLEEP", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"))+4));
        om.bind("ti.sysbios.family.c674.Power.AWAKEFROMDEEPSLEEP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.AWAKEFROMDEEPSLEEP", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"))+5));
        om.bind("ti.sysbios.family.c674.Power.PENDING_CPU_SETPOINTCHANGE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.PENDING_CPU_SETPOINTCHANGE", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"))+6));
        om.bind("ti.sysbios.family.c674.Power.PENDING_PER_SETPOINTCHANGE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.PENDING_PER_SETPOINTCHANGE", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"))+7));
        om.bind("ti.sysbios.family.c674.Power.DONE_CPU_SETPOINTCHANGE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.DONE_CPU_SETPOINTCHANGE", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"))+8));
        om.bind("ti.sysbios.family.c674.Power.DONE_PER_SETPOINTCHANGE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.DONE_PER_SETPOINTCHANGE", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"))+9));
        om.bind("ti.sysbios.family.c674.Power.INVALIDEVENT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.INVALIDEVENT", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"))+10));
        om.bind("ti.sysbios.family.c674.Power.NUMEVENTS", om.find("ti.sysbios.family.c674.Power.INVALIDEVENT"));
        om.bind("ti.sysbios.family.c674.Power.NOTIFYDONE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.NotifyResponse", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.NOTIFYDONE", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c674.Power.NOTIFYNOTDONE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.NotifyResponse", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.NOTIFYNOTDONE", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.NOTIFYDONE", "ti.sysbios.family.c674"))+1));
        om.bind("ti.sysbios.family.c674.Power.NOTIFYERROR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.NotifyResponse", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.NOTIFYERROR", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.NOTIFYDONE", "ti.sysbios.family.c674"))+2));
        om.bind("ti.sysbios.family.c674.Power.EXTERNAL", 0x8L);
        om.bind("ti.sysbios.family.c674.Power.RTC_ALARM", 0x10L);
        om.bind("ti.sysbios.family.c674.Power.PLL0", 0x1L);
        om.bind("ti.sysbios.family.c674.Power.PLL1", 0x2L);
        om.bind("ti.sysbios.family.c674.Power.CVFSCALING", 0x8L);
        om.bind("ti.sysbios.family.c674.Power.CRESOURCETRACKING", 0x200L);
        om.bind("ti.sysbios.family.c674.Power.RSRC_EDMA3_CC_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_EDMA3_CC_0", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_EDMA3_TC_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_EDMA3_TC_0", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_EDMA3_TC_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_EDMA3_TC_1", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_EMIFA", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_EMIFA", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_SPI_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_SPI_0", xdc.services.intern.xsr.Enum.intValue(4L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_MMCSD_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_MMCSD_0", xdc.services.intern.xsr.Enum.intValue(5L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_AINTC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_AINTC", xdc.services.intern.xsr.Enum.intValue(6L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_RSVD1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_RSVD1", xdc.services.intern.xsr.Enum.intValue(7L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_UART_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_UART_0", xdc.services.intern.xsr.Enum.intValue(8L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_RSVD2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_RSVD2", xdc.services.intern.xsr.Enum.intValue(9L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_EDMA3_CC_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_EDMA3_CC_1", xdc.services.intern.xsr.Enum.intValue(10L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_USB0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_USB0", xdc.services.intern.xsr.Enum.intValue(11L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_USB1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_USB1", xdc.services.intern.xsr.Enum.intValue(12L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_GPIO", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_GPIO", xdc.services.intern.xsr.Enum.intValue(13L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_UHPI", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_UHPI", xdc.services.intern.xsr.Enum.intValue(14L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_EMAC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_EMAC", xdc.services.intern.xsr.Enum.intValue(15L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_DDR2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_DDR2", xdc.services.intern.xsr.Enum.intValue(16L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_MCASP_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_MCASP_0", xdc.services.intern.xsr.Enum.intValue(17L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_SATA", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_SATA", xdc.services.intern.xsr.Enum.intValue(18L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_VPIF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_VPIF", xdc.services.intern.xsr.Enum.intValue(19L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_SPI_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_SPI_1", xdc.services.intern.xsr.Enum.intValue(20L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_I2C_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_I2C_1", xdc.services.intern.xsr.Enum.intValue(21L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_UART_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_UART_1", xdc.services.intern.xsr.Enum.intValue(22L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_UART_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_UART_2", xdc.services.intern.xsr.Enum.intValue(23L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_MCBSP_0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_MCBSP_0", xdc.services.intern.xsr.Enum.intValue(24L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_MCBSP_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_MCBSP_1", xdc.services.intern.xsr.Enum.intValue(25L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_LCDC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_LCDC", xdc.services.intern.xsr.Enum.intValue(26L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_EHRPWM", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_EHRPWM", xdc.services.intern.xsr.Enum.intValue(27L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_MMCSD_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_MMCSD_1", xdc.services.intern.xsr.Enum.intValue(28L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_UPP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_UPP", xdc.services.intern.xsr.Enum.intValue(29L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_ECAP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_ECAP", xdc.services.intern.xsr.Enum.intValue(30L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_EDMA3_TC_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_EDMA3_TC_2", xdc.services.intern.xsr.Enum.intValue(31L)+0));
        om.bind("ti.sysbios.family.c674.Power.RSRC_END", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.RSRC_END", xdc.services.intern.xsr.Enum.intValue(32L)+0));
        om.bind("ti.sysbios.family.c674.Power.STANDBY", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.SleepCode", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.STANDBY", xdc.services.intern.xsr.Enum.intValue(0x1L)+0));
        om.bind("ti.sysbios.family.c674.Power.SLEEP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.SleepCode", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.SLEEP", xdc.services.intern.xsr.Enum.intValue(0x2L)+0));
        om.bind("ti.sysbios.family.c674.Power.DEEPSLEEP", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.SleepCode", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.DEEPSLEEP", xdc.services.intern.xsr.Enum.intValue(0x4L)+0));
        om.bind("ti.sysbios.family.c674.Power.SOK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.SOK", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c674.Power.EFAIL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.EFAIL", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.c674.Power.EINVALIDEVENT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.EINVALIDEVENT", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.c674.Power.EINVALIDHANDLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.EINVALIDHANDLE", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.c674.Power.EINVALIDPOINTER", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.EINVALIDPOINTER", xdc.services.intern.xsr.Enum.intValue(4L)+0));
        om.bind("ti.sysbios.family.c674.Power.EINVALIDVALUE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.EINVALIDVALUE", xdc.services.intern.xsr.Enum.intValue(5L)+0));
        om.bind("ti.sysbios.family.c674.Power.ENOTIMPLEMENTED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.ENOTIMPLEMENTED", xdc.services.intern.xsr.Enum.intValue(6L)+0));
        om.bind("ti.sysbios.family.c674.Power.ENOTSUPPORTED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.ENOTSUPPORTED", xdc.services.intern.xsr.Enum.intValue(7L)+0));
        om.bind("ti.sysbios.family.c674.Power.EOUTOFRANGE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.EOUTOFRANGE", xdc.services.intern.xsr.Enum.intValue(8L)+0));
        om.bind("ti.sysbios.family.c674.Power.ETIMEOUT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.ETIMEOUT", xdc.services.intern.xsr.Enum.intValue(9L)+0));
        om.bind("ti.sysbios.family.c674.Power.EBUSY", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.EBUSY", xdc.services.intern.xsr.Enum.intValue(10L)+0));
        om.bind("ti.sysbios.family.c674.Power.EINITFAILURE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.EINITFAILURE", xdc.services.intern.xsr.Enum.intValue(11L)+0));
        om.bind("ti.sysbios.family.c674.Power.ETOOMANYCALLS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.ETOOMANYCALLS", xdc.services.intern.xsr.Enum.intValue(12L)+0));
        om.bind("ti.sysbios.family.c674.Power.pmiLib_evm6748", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.pmiLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.pmiLib_evm6748", 0));
        om.bind("ti.sysbios.family.c674.Power.pmiLib_shared_evm6748", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.pmiLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.pmiLib_shared_evm6748", 1));
        om.bind("ti.sysbios.family.c674.Power.pmiLib_lcdk", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.pmiLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.pmiLib_lcdk", 2));
        om.bind("ti.sysbios.family.c674.Power.pmiLib_null", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.pmiLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.pmiLib_null", 3));
        om.bind("ti.sysbios.family.c674.Power.pmiLib_user", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.pmiLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.pmiLib_user", 4));
        om.bind("ti.sysbios.family.c674.Power.psclLib_evm6748", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.psclLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.psclLib_evm6748", 0));
        om.bind("ti.sysbios.family.c674.Power.psclLib_evm6748_372", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.psclLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.psclLib_evm6748_372", 1));
        om.bind("ti.sysbios.family.c674.Power.psclLib_evm6748_408", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.psclLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.psclLib_evm6748_408", 2));
        om.bind("ti.sysbios.family.c674.Power.psclLib_evm6748_456", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.psclLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.psclLib_evm6748_456", 3));
        om.bind("ti.sysbios.family.c674.Power.psclLib_lcdk", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.psclLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.psclLib_lcdk", 4));
        om.bind("ti.sysbios.family.c674.Power.psclLib_null", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.psclLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.psclLib_null", 5));
        om.bind("ti.sysbios.family.c674.Power.psclLib_user", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.psclLib", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.psclLib_user", 6));
        om.bind("ti.sysbios.family.c674.Power.CWAITFORV", 0x20L);
        om.bind("ti.sysbios.family.c674.Power.CSCALEVWITHF", 0x10L);
        om.bind("ti.sysbios.family.c674.Power.CMOVEINITSPS", 0x1000L);
        om.bind("ti.sysbios.family.c674.Power.RELEASE", 0L);
        om.bind("ti.sysbios.family.c674.Power.SET", 1L);
        om.bind("ti.sysbios.family.c674.Power.QUERY", 2L);
        om.bind("ti.sysbios.family.c674.Power.SigType_INTERNAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.SigType", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.SigType_INTERNAL", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.c674.Power.SigType_EXTERNAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.c674.Power.SigType", "ti.sysbios.family.c674"), "ti.sysbios.family.c674.Power.SigType_EXTERNAL", xdc.services.intern.xsr.Enum.intValue(om.findStrict("ti.sysbios.family.c674.Power.SigType_INTERNAL", "ti.sysbios.family.c674"))+1));
        om.bind("ti.sysbios.family.c674.Power.changeSetpoint", new Extern("ti_sysbios_family_c674_Power_changeSetpoint__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Domain,xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c674.Power.configure", new Extern("ti_sysbios_family_c674_Power_configure__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Attrs)", true, false));
        om.bind("ti.sysbios.family.c674.Power.getCapabilities", new Extern("ti_sysbios_family_c674_Power_getCapabilities__E", "ti_sysbios_family_c674_Power_Status(*)(xdc_UInt*)", true, false));
        om.bind("ti.sysbios.family.c674.Power.getConstraintInfo", new Extern("ti_sysbios_family_c674_Power_getConstraintInfo__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Constraint,xdc_UArg*)", true, false));
        om.bind("ti.sysbios.family.c674.Power.getCurrentSetpoint", new Extern("ti_sysbios_family_c674_Power_getCurrentSetpoint__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Domain,xdc_UInt*)", true, false));
        om.bind("ti.sysbios.family.c674.Power.getDependencyCount", new Extern("ti_sysbios_family_c674_Power_getDependencyCount__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Resource,xdc_UInt*)", true, false));
        om.bind("ti.sysbios.family.c674.Power.getNumSetpoints", new Extern("ti_sysbios_family_c674_Power_getNumSetpoints__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Domain,xdc_UInt*)", true, false));
        om.bind("ti.sysbios.family.c674.Power.getSetpointInfo", new Extern("ti_sysbios_family_c674_Power_getSetpointInfo__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Domain,xdc_UInt,xdc_UInt*,xdc_UInt*)", true, false));
        om.bind("ti.sysbios.family.c674.Power.getTransitionLatency", new Extern("ti_sysbios_family_c674_Power_getTransitionLatency__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Domain,xdc_UInt,xdc_UInt,xdc_UInt*,xdc_UInt*)", true, false));
        om.bind("ti.sysbios.family.c674.Power.registerConstraint", new Extern("ti_sysbios_family_c674_Power_registerConstraint__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Constraint,xdc_UArg,xdc_UArg**)", true, false));
        om.bind("ti.sysbios.family.c674.Power.registerNotify", new Extern("ti_sysbios_family_c674_Power_registerNotify__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Event,xdc_UInt,xdc_Fxn,xdc_UArg,xdc_Void**,xdc_Fxn*)", true, false));
        om.bind("ti.sysbios.family.c674.Power.releaseDependency", new Extern("ti_sysbios_family_c674_Power_releaseDependency__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Resource)", true, false));
        om.bind("ti.sysbios.family.c674.Power.setDependency", new Extern("ti_sysbios_family_c674_Power_setDependency__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Resource)", true, false));
        om.bind("ti.sysbios.family.c674.Power.signalEvent", new Extern("ti_sysbios_family_c674_Power_signalEvent__E", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Event,xdc_UArg,xdc_UArg,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c674.Power.sleepDSP", new Extern("ti_sysbios_family_c674_Power_sleepDSP__E", "ti_sysbios_family_c674_Power_Status(*)(xdc_UInt,xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c674.Power.unregisterConstraint", new Extern("ti_sysbios_family_c674_Power_unregisterConstraint__E", "ti_sysbios_family_c674_Power_Status(*)(xdc_UArg*)", true, false));
        om.bind("ti.sysbios.family.c674.Power.unregisterNotify", new Extern("ti_sysbios_family_c674_Power_unregisterNotify__E", "ti_sysbios_family_c674_Power_Status(*)(xdc_Void*)", true, false));
        om.bind("ti.sysbios.family.c674.Power.delayCompletion0", new Extern("ti_sysbios_family_c674_Power_delayCompletion0__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.delayCompletion1", new Extern("ti_sysbios_family_c674_Power_delayCompletion1__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.delayCompletion2", new Extern("ti_sysbios_family_c674_Power_delayCompletion2__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.delayCompletion3", new Extern("ti_sysbios_family_c674_Power_delayCompletion3__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.delayCompletion4", new Extern("ti_sysbios_family_c674_Power_delayCompletion4__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.delayCompletion5", new Extern("ti_sysbios_family_c674_Power_delayCompletion5__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.delayCompletion6", new Extern("ti_sysbios_family_c674_Power_delayCompletion6__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.delayCompletion7", new Extern("ti_sysbios_family_c674_Power_delayCompletion7__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.delayCompletion8", new Extern("ti_sysbios_family_c674_Power_delayCompletion8__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.delayCompletion9", new Extern("ti_sysbios_family_c674_Power_delayCompletion9__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.idleStopClock", new Extern("ti_sysbios_family_c674_Power_idleStopClock__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.init", new Extern("ti_sysbios_family_c674_Power_init__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.initRefCounts", new Extern("ti_sysbios_family_c674_Power_initRefCounts__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c674.Power.notify", new Extern("ti_sysbios_family_c674_Power_notify__I", "ti_sysbios_family_c674_Power_Status(*)(ti_sysbios_family_c674_Power_Event,xdc_UInt,ti_sysbios_family_c674_Power_SigType,xdc_UArg,xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.c674.Power.rebuildConstraint", new Extern("ti_sysbios_family_c674_Power_rebuildConstraint__I", "xdc_Void(*)(ti_sysbios_family_c674_Power_Constraint)", true, false));
        om.bind("ti.sysbios.family.c674.Power.updateConstraints", new Extern("ti_sysbios_family_c674_Power_updateConstraints__I", "xdc_Void(*)(ti_sysbios_family_c674_Power_Constraint,xdc_UArg)", true, false));
    }

    void Power$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Power$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Power$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c674.Power.Attrs", "ti.sysbios.family.c674");
        sizes.clear();
        sizes.add(Global.newArray("scaleVoltage", "UShort"));
        sizes.add(Global.newArray("waitForVoltageScale", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c674.Power.Attrs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c674.Power.Attrs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c674.Power.Attrs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c674.Power.Config", "ti.sysbios.family.c674");
        sizes.clear();
        sizes.add(Global.newArray("scaleVoltage", "UShort"));
        sizes.add(Global.newArray("waitForVoltageScale", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c674.Power.Config']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c674.Power.Config']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c674.Power.Config'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c674.Power.SetpointInfo", "ti.sysbios.family.c674");
        sizes.clear();
        sizes.add(Global.newArray("frequency", "UInt"));
        sizes.add(Global.newArray("voltage", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c674.Power.SetpointInfo']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c674.Power.SetpointInfo']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c674.Power.SetpointInfo'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c674.Power.SleepOverride", "ti.sysbios.family.c674");
        sizes.clear();
        sizes.add(Global.newArray("sleepVoltage", "UInt"));
        sizes.add(Global.newArray("bypassedPLLs", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c674.Power.SleepOverride']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c674.Power.SleepOverride']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c674.Power.SleepOverride'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c674.Power.Module_State", "ti.sysbios.family.c674");
        sizes.clear();
        sizes.add(Global.newArray("currentSetpointCPU", "UInt32"));
        sizes.add(Global.newArray("currentSetpointPER", "UInt32"));
        sizes.add(Global.newArray("disallowedSetpointsCPU", "UInt32"));
        sizes.add(Global.newArray("disallowedSetpointsPER", "UInt32"));
        sizes.add(Global.newArray("disallowedSleepModes", "UInt32"));
        sizes.add(Global.newArray("notifyQ", "UPtr"));
        sizes.add(Global.newArray("nextSP", "UInt32"));
        sizes.add(Global.newArray("previousSP", "UInt32"));
        sizes.add(Global.newArray("nextSPPER", "UInt32"));
        sizes.add(Global.newArray("previousSPPER", "UInt32"));
        sizes.add(Global.newArray("numSPCPU", "UInt32"));
        sizes.add(Global.newArray("numSPPER", "UInt32"));
        sizes.add(Global.newArray("currentConfig", "Sti.sysbios.family.c674.Power;Config"));
        sizes.add(Global.newArray("PSCLinitOK", "UShort"));
        sizes.add(Global.newArray("busy", "UShort"));
        sizes.add(Global.newArray("constraintsQ", "Sti.sysbios.knl.Queue;Instance_State"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c674.Power.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c674.Power.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c674.Power.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Power$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c674/Power.xs");
        om.bind("ti.sysbios.family.c674.Power$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power.Module", "ti.sysbios.family.c674");
        po.init("ti.sysbios.family.c674.Power.Module", om.findStrict("ti.sysbios.interfaces.IPower.Module", "ti.sysbios.family.c674"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUMEVENTS", Proto.Elm.newCNum("(xdc_UInt)"), om.find("ti.sysbios.family.c674.Power.INVALIDEVENT"), "rh");
                po.addFld("EXTERNAL", Proto.Elm.newCNum("(xdc_UInt)"), 0x8L, "rh");
                po.addFld("RTC_ALARM", Proto.Elm.newCNum("(xdc_UInt)"), 0x10L, "rh");
                po.addFld("PLL0", Proto.Elm.newCNum("(xdc_UInt)"), 0x1L, "rh");
                po.addFld("PLL1", Proto.Elm.newCNum("(xdc_UInt)"), 0x2L, "rh");
                po.addFld("CVFSCALING", Proto.Elm.newCNum("(xdc_UInt)"), 0x8L, "rh");
                po.addFld("CRESOURCETRACKING", Proto.Elm.newCNum("(xdc_UInt)"), 0x200L, "rh");
                po.addFld("CWAITFORV", Proto.Elm.newCNum("(xdc_UInt)"), 0x20L, "rh");
                po.addFld("CSCALEVWITHF", Proto.Elm.newCNum("(xdc_UInt)"), 0x10L, "rh");
                po.addFld("CMOVEINITSPS", Proto.Elm.newCNum("(xdc_UInt)"), 0x1000L, "rh");
                po.addFld("RELEASE", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
                po.addFld("SET", Proto.Elm.newCNum("(xdc_UInt)"), 1L, "rh");
                po.addFld("QUERY", Proto.Elm.newCNum("(xdc_UInt)"), 2L, "rh");
        if (isCFG) {
            po.addFld("onChipRegion", $$T_Str, "IRAM", "wh");
            po.addFld("idle", $$T_Bool, false, "w");
            po.addFld("idleCpu", $$T_Bool, false, "wh");
            po.addFld("idleFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), om.find("ti.sysbios.family.c674.Power.idleStopClock"), "wh");
            po.addFld("trackResources", $$T_Bool, false, "w");
            po.addFld("enableScaling", $$T_Bool, false, "w");
            po.addFld("initialSetpointCPU", Proto.Elm.newCNum("(xdc_UInt)"), 2L, "w");
            po.addFld("initialSetpointPER", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
            po.addFld("moveToSetpoints", $$T_Bool, false, "wh");
            po.addFld("scaleVoltage", $$T_Bool, true, "wh");
            po.addFld("waitVoltage", $$T_Bool, true, "wh");
            po.addFld("pmiControlLib", (Proto)om.findStrict("ti.sysbios.family.c674.Power.pmiLib", "ti.sysbios.family.c674"), om.find("ti.sysbios.family.c674.Power.pmiLib_evm6748"), "wh");
            po.addFld("psclConfigLib", (Proto)om.findStrict("ti.sysbios.family.c674.Power.psclLib", "ti.sysbios.family.c674"), om.find("ti.sysbios.family.c674.Power.psclLib_evm6748"), "wh");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.c674"), $$UNDEF, "wh");
            po.addFld("CAPSMASK", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c674.Power$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c674.Power$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c674.Power$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c674.Power$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Power.Attrs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$Attrs", "ti.sysbios.family.c674");
        po.init("ti.sysbios.family.c674.Power.Attrs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("scaleVoltage", $$T_Bool, $$UNDEF, "w");
                po.addFld("waitForVoltageScale", $$T_Bool, $$UNDEF, "w");
        // struct Power.Config
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$Config", "ti.sysbios.family.c674");
        po.init("ti.sysbios.family.c674.Power.Config", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("scaleVoltage", $$T_Bool, $$UNDEF, "w");
                po.addFld("waitForVoltageScale", $$T_Bool, $$UNDEF, "w");
        // struct Power.SetpointInfo
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$SetpointInfo", "ti.sysbios.family.c674");
        po.init("ti.sysbios.family.c674.Power.SetpointInfo", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("frequency", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("voltage", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Power.SleepOverride
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$SleepOverride", "ti.sysbios.family.c674");
        po.init("ti.sysbios.family.c674.Power.SleepOverride", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("sleepVoltage", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("bypassedPLLs", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // typedef Power.ConstraintHandle
        om.bind("ti.sysbios.family.c674.Power.ConstraintHandle", new Proto.Adr("xdc_UArg*", "PPv"));
        // typedef Power.NotifyHandle
        om.bind("ti.sysbios.family.c674.Power.NotifyHandle", new Proto.Adr("xdc_Void*", "Pv"));
        // typedef Power.FuncPtr
        om.bind("ti.sysbios.family.c674.Power.FuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Power.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$ModuleView", "ti.sysbios.family.c674");
        po.init("ti.sysbios.family.c674.Power.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("setpointCPU", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("setpointPER", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("maskDisallowedSetpointsCPU", $$T_Str, $$UNDEF, "w");
                po.addFld("maskDisallowedSetpointsPER", $$T_Str, $$UNDEF, "w");
                po.addFld("maskDisallowedSleepModes", $$T_Str, $$UNDEF, "w");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct Power.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$Module_State", "ti.sysbios.family.c674");
        po.init("ti.sysbios.family.c674.Power.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("currentSetpointCPU", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("currentSetpointPER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("disallowedSetpointsCPU", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("disallowedSetpointsPER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("disallowedSleepModes", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("notifyQ", new Proto.Arr((Proto)om.findStrict("ti.sysbios.knl.Queue.Object", "ti.sysbios.family.c674"), false), $$DEFAULT, "w");
                po.addFld("nextSP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("previousSP", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("nextSPPER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("previousSPPER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("numSPCPU", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("numSPPER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("currentConfig", (Proto)om.findStrict("ti.sysbios.family.c674.Power.Config", "ti.sysbios.family.c674"), $$DEFAULT, "w");
                po.addFld("PSCLinitOK", $$T_Bool, $$UNDEF, "w");
                po.addFld("busy", $$T_Bool, $$UNDEF, "w");
                po.addFldV("constraintsQ", (Proto)om.findStrict("ti.sysbios.knl.Queue.Object", "ti.sysbios.family.c674"), $$DEFAULT, "wh", $$objFldGet, $$objFldSet);
                po.addFld("Object_field_constraintsQ", (Proto)om.findStrict("ti.sysbios.knl.Queue.Object", "ti.sysbios.family.c674"), $$DEFAULT, "w");
    }

    void Power$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c674.Power", "ti.sysbios.family.c674");
        vo.bind("Attrs$fetchDesc", Global.newObject("type", "ti.sysbios.family.c674.Power.Attrs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$Attrs", "ti.sysbios.family.c674");
        vo.bind("Config$fetchDesc", Global.newObject("type", "ti.sysbios.family.c674.Power.Config", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$Config", "ti.sysbios.family.c674");
        vo.bind("SetpointInfo$fetchDesc", Global.newObject("type", "ti.sysbios.family.c674.Power.SetpointInfo", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$SetpointInfo", "ti.sysbios.family.c674");
        vo.bind("SleepOverride$fetchDesc", Global.newObject("type", "ti.sysbios.family.c674.Power.SleepOverride", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$SleepOverride", "ti.sysbios.family.c674");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c674.Power.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power$$Module_State", "ti.sysbios.family.c674");
        po.bind("notifyQ$fetchDesc", Global.newObject("type", "ti.sysbios.knl.Queue.Object", "isScalar", false));
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.c674.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.c674"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c674/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.c674"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.c674"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.c674"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.c674"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.c674"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.c674"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.c674", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.c674");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.c674.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.c674'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.c674$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.c674$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.c674$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c674.ae674',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c674.ae674', {target: 'ti.targets.elf.C674', suffix: 'e674'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Power$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c674.Power", "ti.sysbios.family.c674");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c674.Power.Module", "ti.sysbios.family.c674");
        vo.init2(po, "ti.sysbios.family.c674.Power", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c674.Power$$capsule", "ti.sysbios.family.c674"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c674", "ti.sysbios.family.c674"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        mcfgs.add("Module__diagsEnabled");
        icfgs.add("Module__diagsEnabled");
        mcfgs.add("Module__diagsIncluded");
        icfgs.add("Module__diagsIncluded");
        mcfgs.add("Module__diagsMask");
        icfgs.add("Module__diagsMask");
        mcfgs.add("Module__gateObj");
        icfgs.add("Module__gateObj");
        mcfgs.add("Module__gatePrms");
        icfgs.add("Module__gatePrms");
        mcfgs.add("Module__id");
        icfgs.add("Module__id");
        mcfgs.add("Module__loggerDefined");
        icfgs.add("Module__loggerDefined");
        mcfgs.add("Module__loggerObj");
        icfgs.add("Module__loggerObj");
        mcfgs.add("Module__loggerFxn0");
        icfgs.add("Module__loggerFxn0");
        mcfgs.add("Module__loggerFxn1");
        icfgs.add("Module__loggerFxn1");
        mcfgs.add("Module__loggerFxn2");
        icfgs.add("Module__loggerFxn2");
        mcfgs.add("Module__loggerFxn4");
        icfgs.add("Module__loggerFxn4");
        mcfgs.add("Module__loggerFxn8");
        icfgs.add("Module__loggerFxn8");
        mcfgs.add("Object__count");
        icfgs.add("Object__count");
        mcfgs.add("Object__heap");
        icfgs.add("Object__heap");
        mcfgs.add("Object__sizeof");
        icfgs.add("Object__sizeof");
        mcfgs.add("Object__table");
        icfgs.add("Object__table");
        mcfgs.add("idle");
        vo.bind("Attrs", om.findStrict("ti.sysbios.family.c674.Power.Attrs", "ti.sysbios.family.c674"));
        tdefs.add(om.findStrict("ti.sysbios.family.c674.Power.Attrs", "ti.sysbios.family.c674"));
        vo.bind("Config", om.findStrict("ti.sysbios.family.c674.Power.Config", "ti.sysbios.family.c674"));
        tdefs.add(om.findStrict("ti.sysbios.family.c674.Power.Config", "ti.sysbios.family.c674"));
        vo.bind("SetpointInfo", om.findStrict("ti.sysbios.family.c674.Power.SetpointInfo", "ti.sysbios.family.c674"));
        tdefs.add(om.findStrict("ti.sysbios.family.c674.Power.SetpointInfo", "ti.sysbios.family.c674"));
        vo.bind("SleepOverride", om.findStrict("ti.sysbios.family.c674.Power.SleepOverride", "ti.sysbios.family.c674"));
        tdefs.add(om.findStrict("ti.sysbios.family.c674.Power.SleepOverride", "ti.sysbios.family.c674"));
        vo.bind("ConstraintHandle", om.findStrict("ti.sysbios.family.c674.Power.ConstraintHandle", "ti.sysbios.family.c674"));
        vo.bind("NotifyHandle", om.findStrict("ti.sysbios.family.c674.Power.NotifyHandle", "ti.sysbios.family.c674"));
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.family.c674.Power.FuncPtr", "ti.sysbios.family.c674"));
        vo.bind("Constraint", om.findStrict("ti.sysbios.family.c674.Power.Constraint", "ti.sysbios.family.c674"));
        vo.bind("Domain", om.findStrict("ti.sysbios.family.c674.Power.Domain", "ti.sysbios.family.c674"));
        vo.bind("Event", om.findStrict("ti.sysbios.family.c674.Power.Event", "ti.sysbios.family.c674"));
        vo.bind("NotifyResponse", om.findStrict("ti.sysbios.family.c674.Power.NotifyResponse", "ti.sysbios.family.c674"));
        vo.bind("Resource", om.findStrict("ti.sysbios.family.c674.Power.Resource", "ti.sysbios.family.c674"));
        vo.bind("SleepCode", om.findStrict("ti.sysbios.family.c674.Power.SleepCode", "ti.sysbios.family.c674"));
        vo.bind("Status", om.findStrict("ti.sysbios.family.c674.Power.Status", "ti.sysbios.family.c674"));
        vo.bind("pmiLib", om.findStrict("ti.sysbios.family.c674.Power.pmiLib", "ti.sysbios.family.c674"));
        vo.bind("psclLib", om.findStrict("ti.sysbios.family.c674.Power.psclLib", "ti.sysbios.family.c674"));
        mcfgs.add("trackResources");
        mcfgs.add("enableScaling");
        mcfgs.add("initialSetpointCPU");
        mcfgs.add("initialSetpointPER");
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.c674.Power.ModuleView", "ti.sysbios.family.c674"));
        tdefs.add(om.findStrict("ti.sysbios.family.c674.Power.ModuleView", "ti.sysbios.family.c674"));
        mcfgs.add("CAPSMASK");
        icfgs.add("CAPSMASK");
        vo.bind("SigType", om.findStrict("ti.sysbios.family.c674.Power.SigType", "ti.sysbios.family.c674"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.c674.Power.Module_State", "ti.sysbios.family.c674"));
        tdefs.add(om.findStrict("ti.sysbios.family.c674.Power.Module_State", "ti.sysbios.family.c674"));
        vo.bind("DISALLOWED_CPU_SETPOINT_MASK", om.findStrict("ti.sysbios.family.c674.Power.DISALLOWED_CPU_SETPOINT_MASK", "ti.sysbios.family.c674"));
        vo.bind("DISALLOWED_PER_SETPOINT_MASK", om.findStrict("ti.sysbios.family.c674.Power.DISALLOWED_PER_SETPOINT_MASK", "ti.sysbios.family.c674"));
        vo.bind("DISALLOWEDSLEEPSTATE_MASK", om.findStrict("ti.sysbios.family.c674.Power.DISALLOWEDSLEEPSTATE_MASK", "ti.sysbios.family.c674"));
        vo.bind("CPU", om.findStrict("ti.sysbios.family.c674.Power.CPU", "ti.sysbios.family.c674"));
        vo.bind("PER", om.findStrict("ti.sysbios.family.c674.Power.PER", "ti.sysbios.family.c674"));
        vo.bind("GOINGTOSTANDBY", om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSTANDBY", "ti.sysbios.family.c674"));
        vo.bind("AWAKEFROMSTANDBY", om.findStrict("ti.sysbios.family.c674.Power.AWAKEFROMSTANDBY", "ti.sysbios.family.c674"));
        vo.bind("GOINGTOSLEEP", om.findStrict("ti.sysbios.family.c674.Power.GOINGTOSLEEP", "ti.sysbios.family.c674"));
        vo.bind("AWAKEFROMSLEEP", om.findStrict("ti.sysbios.family.c674.Power.AWAKEFROMSLEEP", "ti.sysbios.family.c674"));
        vo.bind("GOINGTODEEPSLEEP", om.findStrict("ti.sysbios.family.c674.Power.GOINGTODEEPSLEEP", "ti.sysbios.family.c674"));
        vo.bind("AWAKEFROMDEEPSLEEP", om.findStrict("ti.sysbios.family.c674.Power.AWAKEFROMDEEPSLEEP", "ti.sysbios.family.c674"));
        vo.bind("PENDING_CPU_SETPOINTCHANGE", om.findStrict("ti.sysbios.family.c674.Power.PENDING_CPU_SETPOINTCHANGE", "ti.sysbios.family.c674"));
        vo.bind("PENDING_PER_SETPOINTCHANGE", om.findStrict("ti.sysbios.family.c674.Power.PENDING_PER_SETPOINTCHANGE", "ti.sysbios.family.c674"));
        vo.bind("DONE_CPU_SETPOINTCHANGE", om.findStrict("ti.sysbios.family.c674.Power.DONE_CPU_SETPOINTCHANGE", "ti.sysbios.family.c674"));
        vo.bind("DONE_PER_SETPOINTCHANGE", om.findStrict("ti.sysbios.family.c674.Power.DONE_PER_SETPOINTCHANGE", "ti.sysbios.family.c674"));
        vo.bind("INVALIDEVENT", om.findStrict("ti.sysbios.family.c674.Power.INVALIDEVENT", "ti.sysbios.family.c674"));
        vo.bind("NOTIFYDONE", om.findStrict("ti.sysbios.family.c674.Power.NOTIFYDONE", "ti.sysbios.family.c674"));
        vo.bind("NOTIFYNOTDONE", om.findStrict("ti.sysbios.family.c674.Power.NOTIFYNOTDONE", "ti.sysbios.family.c674"));
        vo.bind("NOTIFYERROR", om.findStrict("ti.sysbios.family.c674.Power.NOTIFYERROR", "ti.sysbios.family.c674"));
        vo.bind("RSRC_EDMA3_CC_0", om.findStrict("ti.sysbios.family.c674.Power.RSRC_EDMA3_CC_0", "ti.sysbios.family.c674"));
        vo.bind("RSRC_EDMA3_TC_0", om.findStrict("ti.sysbios.family.c674.Power.RSRC_EDMA3_TC_0", "ti.sysbios.family.c674"));
        vo.bind("RSRC_EDMA3_TC_1", om.findStrict("ti.sysbios.family.c674.Power.RSRC_EDMA3_TC_1", "ti.sysbios.family.c674"));
        vo.bind("RSRC_EMIFA", om.findStrict("ti.sysbios.family.c674.Power.RSRC_EMIFA", "ti.sysbios.family.c674"));
        vo.bind("RSRC_SPI_0", om.findStrict("ti.sysbios.family.c674.Power.RSRC_SPI_0", "ti.sysbios.family.c674"));
        vo.bind("RSRC_MMCSD_0", om.findStrict("ti.sysbios.family.c674.Power.RSRC_MMCSD_0", "ti.sysbios.family.c674"));
        vo.bind("RSRC_AINTC", om.findStrict("ti.sysbios.family.c674.Power.RSRC_AINTC", "ti.sysbios.family.c674"));
        vo.bind("RSRC_RSVD1", om.findStrict("ti.sysbios.family.c674.Power.RSRC_RSVD1", "ti.sysbios.family.c674"));
        vo.bind("RSRC_UART_0", om.findStrict("ti.sysbios.family.c674.Power.RSRC_UART_0", "ti.sysbios.family.c674"));
        vo.bind("RSRC_RSVD2", om.findStrict("ti.sysbios.family.c674.Power.RSRC_RSVD2", "ti.sysbios.family.c674"));
        vo.bind("RSRC_EDMA3_CC_1", om.findStrict("ti.sysbios.family.c674.Power.RSRC_EDMA3_CC_1", "ti.sysbios.family.c674"));
        vo.bind("RSRC_USB0", om.findStrict("ti.sysbios.family.c674.Power.RSRC_USB0", "ti.sysbios.family.c674"));
        vo.bind("RSRC_USB1", om.findStrict("ti.sysbios.family.c674.Power.RSRC_USB1", "ti.sysbios.family.c674"));
        vo.bind("RSRC_GPIO", om.findStrict("ti.sysbios.family.c674.Power.RSRC_GPIO", "ti.sysbios.family.c674"));
        vo.bind("RSRC_UHPI", om.findStrict("ti.sysbios.family.c674.Power.RSRC_UHPI", "ti.sysbios.family.c674"));
        vo.bind("RSRC_EMAC", om.findStrict("ti.sysbios.family.c674.Power.RSRC_EMAC", "ti.sysbios.family.c674"));
        vo.bind("RSRC_DDR2", om.findStrict("ti.sysbios.family.c674.Power.RSRC_DDR2", "ti.sysbios.family.c674"));
        vo.bind("RSRC_MCASP_0", om.findStrict("ti.sysbios.family.c674.Power.RSRC_MCASP_0", "ti.sysbios.family.c674"));
        vo.bind("RSRC_SATA", om.findStrict("ti.sysbios.family.c674.Power.RSRC_SATA", "ti.sysbios.family.c674"));
        vo.bind("RSRC_VPIF", om.findStrict("ti.sysbios.family.c674.Power.RSRC_VPIF", "ti.sysbios.family.c674"));
        vo.bind("RSRC_SPI_1", om.findStrict("ti.sysbios.family.c674.Power.RSRC_SPI_1", "ti.sysbios.family.c674"));
        vo.bind("RSRC_I2C_1", om.findStrict("ti.sysbios.family.c674.Power.RSRC_I2C_1", "ti.sysbios.family.c674"));
        vo.bind("RSRC_UART_1", om.findStrict("ti.sysbios.family.c674.Power.RSRC_UART_1", "ti.sysbios.family.c674"));
        vo.bind("RSRC_UART_2", om.findStrict("ti.sysbios.family.c674.Power.RSRC_UART_2", "ti.sysbios.family.c674"));
        vo.bind("RSRC_MCBSP_0", om.findStrict("ti.sysbios.family.c674.Power.RSRC_MCBSP_0", "ti.sysbios.family.c674"));
        vo.bind("RSRC_MCBSP_1", om.findStrict("ti.sysbios.family.c674.Power.RSRC_MCBSP_1", "ti.sysbios.family.c674"));
        vo.bind("RSRC_LCDC", om.findStrict("ti.sysbios.family.c674.Power.RSRC_LCDC", "ti.sysbios.family.c674"));
        vo.bind("RSRC_EHRPWM", om.findStrict("ti.sysbios.family.c674.Power.RSRC_EHRPWM", "ti.sysbios.family.c674"));
        vo.bind("RSRC_MMCSD_1", om.findStrict("ti.sysbios.family.c674.Power.RSRC_MMCSD_1", "ti.sysbios.family.c674"));
        vo.bind("RSRC_UPP", om.findStrict("ti.sysbios.family.c674.Power.RSRC_UPP", "ti.sysbios.family.c674"));
        vo.bind("RSRC_ECAP", om.findStrict("ti.sysbios.family.c674.Power.RSRC_ECAP", "ti.sysbios.family.c674"));
        vo.bind("RSRC_EDMA3_TC_2", om.findStrict("ti.sysbios.family.c674.Power.RSRC_EDMA3_TC_2", "ti.sysbios.family.c674"));
        vo.bind("RSRC_END", om.findStrict("ti.sysbios.family.c674.Power.RSRC_END", "ti.sysbios.family.c674"));
        vo.bind("STANDBY", om.findStrict("ti.sysbios.family.c674.Power.STANDBY", "ti.sysbios.family.c674"));
        vo.bind("SLEEP", om.findStrict("ti.sysbios.family.c674.Power.SLEEP", "ti.sysbios.family.c674"));
        vo.bind("DEEPSLEEP", om.findStrict("ti.sysbios.family.c674.Power.DEEPSLEEP", "ti.sysbios.family.c674"));
        vo.bind("SOK", om.findStrict("ti.sysbios.family.c674.Power.SOK", "ti.sysbios.family.c674"));
        vo.bind("EFAIL", om.findStrict("ti.sysbios.family.c674.Power.EFAIL", "ti.sysbios.family.c674"));
        vo.bind("EINVALIDEVENT", om.findStrict("ti.sysbios.family.c674.Power.EINVALIDEVENT", "ti.sysbios.family.c674"));
        vo.bind("EINVALIDHANDLE", om.findStrict("ti.sysbios.family.c674.Power.EINVALIDHANDLE", "ti.sysbios.family.c674"));
        vo.bind("EINVALIDPOINTER", om.findStrict("ti.sysbios.family.c674.Power.EINVALIDPOINTER", "ti.sysbios.family.c674"));
        vo.bind("EINVALIDVALUE", om.findStrict("ti.sysbios.family.c674.Power.EINVALIDVALUE", "ti.sysbios.family.c674"));
        vo.bind("ENOTIMPLEMENTED", om.findStrict("ti.sysbios.family.c674.Power.ENOTIMPLEMENTED", "ti.sysbios.family.c674"));
        vo.bind("ENOTSUPPORTED", om.findStrict("ti.sysbios.family.c674.Power.ENOTSUPPORTED", "ti.sysbios.family.c674"));
        vo.bind("EOUTOFRANGE", om.findStrict("ti.sysbios.family.c674.Power.EOUTOFRANGE", "ti.sysbios.family.c674"));
        vo.bind("ETIMEOUT", om.findStrict("ti.sysbios.family.c674.Power.ETIMEOUT", "ti.sysbios.family.c674"));
        vo.bind("EBUSY", om.findStrict("ti.sysbios.family.c674.Power.EBUSY", "ti.sysbios.family.c674"));
        vo.bind("EINITFAILURE", om.findStrict("ti.sysbios.family.c674.Power.EINITFAILURE", "ti.sysbios.family.c674"));
        vo.bind("ETOOMANYCALLS", om.findStrict("ti.sysbios.family.c674.Power.ETOOMANYCALLS", "ti.sysbios.family.c674"));
        vo.bind("pmiLib_evm6748", om.findStrict("ti.sysbios.family.c674.Power.pmiLib_evm6748", "ti.sysbios.family.c674"));
        vo.bind("pmiLib_shared_evm6748", om.findStrict("ti.sysbios.family.c674.Power.pmiLib_shared_evm6748", "ti.sysbios.family.c674"));
        vo.bind("pmiLib_lcdk", om.findStrict("ti.sysbios.family.c674.Power.pmiLib_lcdk", "ti.sysbios.family.c674"));
        vo.bind("pmiLib_null", om.findStrict("ti.sysbios.family.c674.Power.pmiLib_null", "ti.sysbios.family.c674"));
        vo.bind("pmiLib_user", om.findStrict("ti.sysbios.family.c674.Power.pmiLib_user", "ti.sysbios.family.c674"));
        vo.bind("psclLib_evm6748", om.findStrict("ti.sysbios.family.c674.Power.psclLib_evm6748", "ti.sysbios.family.c674"));
        vo.bind("psclLib_evm6748_372", om.findStrict("ti.sysbios.family.c674.Power.psclLib_evm6748_372", "ti.sysbios.family.c674"));
        vo.bind("psclLib_evm6748_408", om.findStrict("ti.sysbios.family.c674.Power.psclLib_evm6748_408", "ti.sysbios.family.c674"));
        vo.bind("psclLib_evm6748_456", om.findStrict("ti.sysbios.family.c674.Power.psclLib_evm6748_456", "ti.sysbios.family.c674"));
        vo.bind("psclLib_lcdk", om.findStrict("ti.sysbios.family.c674.Power.psclLib_lcdk", "ti.sysbios.family.c674"));
        vo.bind("psclLib_null", om.findStrict("ti.sysbios.family.c674.Power.psclLib_null", "ti.sysbios.family.c674"));
        vo.bind("psclLib_user", om.findStrict("ti.sysbios.family.c674.Power.psclLib_user", "ti.sysbios.family.c674"));
        vo.bind("SigType_INTERNAL", om.findStrict("ti.sysbios.family.c674.Power.SigType_INTERNAL", "ti.sysbios.family.c674"));
        vo.bind("SigType_EXTERNAL", om.findStrict("ti.sysbios.family.c674.Power.SigType_EXTERNAL", "ti.sysbios.family.c674"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c674")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("changeSetpoint", om.findStrict("ti.sysbios.family.c674.Power.changeSetpoint", "ti.sysbios.family.c674"));
        vo.bind("configure", om.findStrict("ti.sysbios.family.c674.Power.configure", "ti.sysbios.family.c674"));
        vo.bind("getCapabilities", om.findStrict("ti.sysbios.family.c674.Power.getCapabilities", "ti.sysbios.family.c674"));
        vo.bind("getConstraintInfo", om.findStrict("ti.sysbios.family.c674.Power.getConstraintInfo", "ti.sysbios.family.c674"));
        vo.bind("getCurrentSetpoint", om.findStrict("ti.sysbios.family.c674.Power.getCurrentSetpoint", "ti.sysbios.family.c674"));
        vo.bind("getDependencyCount", om.findStrict("ti.sysbios.family.c674.Power.getDependencyCount", "ti.sysbios.family.c674"));
        vo.bind("getNumSetpoints", om.findStrict("ti.sysbios.family.c674.Power.getNumSetpoints", "ti.sysbios.family.c674"));
        vo.bind("getSetpointInfo", om.findStrict("ti.sysbios.family.c674.Power.getSetpointInfo", "ti.sysbios.family.c674"));
        vo.bind("getTransitionLatency", om.findStrict("ti.sysbios.family.c674.Power.getTransitionLatency", "ti.sysbios.family.c674"));
        vo.bind("registerConstraint", om.findStrict("ti.sysbios.family.c674.Power.registerConstraint", "ti.sysbios.family.c674"));
        vo.bind("registerNotify", om.findStrict("ti.sysbios.family.c674.Power.registerNotify", "ti.sysbios.family.c674"));
        vo.bind("releaseDependency", om.findStrict("ti.sysbios.family.c674.Power.releaseDependency", "ti.sysbios.family.c674"));
        vo.bind("setDependency", om.findStrict("ti.sysbios.family.c674.Power.setDependency", "ti.sysbios.family.c674"));
        vo.bind("signalEvent", om.findStrict("ti.sysbios.family.c674.Power.signalEvent", "ti.sysbios.family.c674"));
        vo.bind("sleepDSP", om.findStrict("ti.sysbios.family.c674.Power.sleepDSP", "ti.sysbios.family.c674"));
        vo.bind("unregisterConstraint", om.findStrict("ti.sysbios.family.c674.Power.unregisterConstraint", "ti.sysbios.family.c674"));
        vo.bind("unregisterNotify", om.findStrict("ti.sysbios.family.c674.Power.unregisterNotify", "ti.sysbios.family.c674"));
        vo.bind("delayCompletion0", om.findStrict("ti.sysbios.family.c674.Power.delayCompletion0", "ti.sysbios.family.c674"));
        vo.bind("delayCompletion1", om.findStrict("ti.sysbios.family.c674.Power.delayCompletion1", "ti.sysbios.family.c674"));
        vo.bind("delayCompletion2", om.findStrict("ti.sysbios.family.c674.Power.delayCompletion2", "ti.sysbios.family.c674"));
        vo.bind("delayCompletion3", om.findStrict("ti.sysbios.family.c674.Power.delayCompletion3", "ti.sysbios.family.c674"));
        vo.bind("delayCompletion4", om.findStrict("ti.sysbios.family.c674.Power.delayCompletion4", "ti.sysbios.family.c674"));
        vo.bind("delayCompletion5", om.findStrict("ti.sysbios.family.c674.Power.delayCompletion5", "ti.sysbios.family.c674"));
        vo.bind("delayCompletion6", om.findStrict("ti.sysbios.family.c674.Power.delayCompletion6", "ti.sysbios.family.c674"));
        vo.bind("delayCompletion7", om.findStrict("ti.sysbios.family.c674.Power.delayCompletion7", "ti.sysbios.family.c674"));
        vo.bind("delayCompletion8", om.findStrict("ti.sysbios.family.c674.Power.delayCompletion8", "ti.sysbios.family.c674"));
        vo.bind("delayCompletion9", om.findStrict("ti.sysbios.family.c674.Power.delayCompletion9", "ti.sysbios.family.c674"));
        vo.bind("idleStopClock", om.findStrict("ti.sysbios.family.c674.Power.idleStopClock", "ti.sysbios.family.c674"));
        vo.bind("init", om.findStrict("ti.sysbios.family.c674.Power.init", "ti.sysbios.family.c674"));
        vo.bind("initRefCounts", om.findStrict("ti.sysbios.family.c674.Power.initRefCounts", "ti.sysbios.family.c674"));
        vo.bind("notify", om.findStrict("ti.sysbios.family.c674.Power.notify", "ti.sysbios.family.c674"));
        vo.bind("rebuildConstraint", om.findStrict("ti.sysbios.family.c674.Power.rebuildConstraint", "ti.sysbios.family.c674"));
        vo.bind("updateConstraints", om.findStrict("ti.sysbios.family.c674.Power.updateConstraints", "ti.sysbios.family.c674"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c674_Power_Module__startupDone__E", "ti_sysbios_family_c674_Power_changeSetpoint__E", "ti_sysbios_family_c674_Power_configure__E", "ti_sysbios_family_c674_Power_getCapabilities__E", "ti_sysbios_family_c674_Power_getConstraintInfo__E", "ti_sysbios_family_c674_Power_getCurrentSetpoint__E", "ti_sysbios_family_c674_Power_getDependencyCount__E", "ti_sysbios_family_c674_Power_getNumSetpoints__E", "ti_sysbios_family_c674_Power_getSetpointInfo__E", "ti_sysbios_family_c674_Power_getTransitionLatency__E", "ti_sysbios_family_c674_Power_registerConstraint__E", "ti_sysbios_family_c674_Power_registerNotify__E", "ti_sysbios_family_c674_Power_releaseDependency__E", "ti_sysbios_family_c674_Power_setDependency__E", "ti_sysbios_family_c674_Power_signalEvent__E", "ti_sysbios_family_c674_Power_sleepDSP__E", "ti_sysbios_family_c674_Power_unregisterConstraint__E", "ti_sysbios_family_c674_Power_unregisterNotify__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Power.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Power.xdt");
        pkgV.bind("Power", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Power");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c674.Power", "ti.sysbios.family.c674"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.c674.Power", "ti.sysbios.family.c674");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.c674.Power")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.c674")).add(pkgV);
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
        Power$$OBJECTS();
        Power$$CONSTS();
        Power$$CREATES();
        Power$$FUNCTIONS();
        Power$$SIZES();
        Power$$TYPES();
        if (isROV) {
            Power$$ROV();
        }//isROV
        $$SINGLETONS();
        Power$$SINGLETONS();
        $$INITIALIZATION();
    }
}
