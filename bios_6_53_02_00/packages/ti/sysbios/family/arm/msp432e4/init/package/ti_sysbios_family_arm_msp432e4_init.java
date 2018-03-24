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

public class ti_sysbios_family_arm_msp432e4_init
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
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.msp432e4.init.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.msp432e4.init", new Value.Obj("ti.sysbios.family.arm.msp432e4.init", pkgP));
    }

    void Boot$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.msp432e4.init.Boot", new Value.Obj("ti.sysbios.family.arm.msp432e4.init.Boot", po));
        pkgV.bind("Boot", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.msp432e4.init.Boot$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.ModuleView", new Proto.Str(spo, false));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", new Proto.Enm("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv"));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv", new Proto.Enm("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv"));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", new Proto.Enm("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq"));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.OscSrc", new Proto.Enm("ti.sysbios.family.arm.msp432e4.init.Boot.OscSrc"));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", new Proto.Enm("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut"));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.VcoFreq", new Proto.Enm("ti.sysbios.family.arm.msp432e4.init.Boot.VcoFreq"));
    }

    void Boot$$CONSTS()
    {
        // module Boot
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_1", xdc.services.intern.xsr.Enum.intValue(0x07800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_2", xdc.services.intern.xsr.Enum.intValue(0x00C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_3", xdc.services.intern.xsr.Enum.intValue(0x01400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_4", xdc.services.intern.xsr.Enum.intValue(0x01C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_5", xdc.services.intern.xsr.Enum.intValue(0x02400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_6", xdc.services.intern.xsr.Enum.intValue(0x02C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_7", xdc.services.intern.xsr.Enum.intValue(0x03400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_8", xdc.services.intern.xsr.Enum.intValue(0x03C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_9", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_9", xdc.services.intern.xsr.Enum.intValue(0x04400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_10", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_10", xdc.services.intern.xsr.Enum.intValue(0x04C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_11", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_11", xdc.services.intern.xsr.Enum.intValue(0x05400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_12", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_12", xdc.services.intern.xsr.Enum.intValue(0x05C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_13", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_13", xdc.services.intern.xsr.Enum.intValue(0x06400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_14", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_14", xdc.services.intern.xsr.Enum.intValue(0x06C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_15", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_15", xdc.services.intern.xsr.Enum.intValue(0x07400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_16", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_16", xdc.services.intern.xsr.Enum.intValue(0x07C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_17", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_17", xdc.services.intern.xsr.Enum.intValue(0x88400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_18", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_18", xdc.services.intern.xsr.Enum.intValue(0x88C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_19", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_19", xdc.services.intern.xsr.Enum.intValue(0x89400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_20", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_20", xdc.services.intern.xsr.Enum.intValue(0x89C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_21", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_21", xdc.services.intern.xsr.Enum.intValue(0x8A400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_22", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_22", xdc.services.intern.xsr.Enum.intValue(0x8AC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_23", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_23", xdc.services.intern.xsr.Enum.intValue(0x8B400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_24", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_24", xdc.services.intern.xsr.Enum.intValue(0x8BC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_25", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_25", xdc.services.intern.xsr.Enum.intValue(0x8C400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_26", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_26", xdc.services.intern.xsr.Enum.intValue(0x8CC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_27", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_27", xdc.services.intern.xsr.Enum.intValue(0x8D400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_28", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_28", xdc.services.intern.xsr.Enum.intValue(0x8DC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_29", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_29", xdc.services.intern.xsr.Enum.intValue(0x8E400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_30", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_30", xdc.services.intern.xsr.Enum.intValue(0x8EC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_31", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_31", xdc.services.intern.xsr.Enum.intValue(0x8F400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_32", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_32", xdc.services.intern.xsr.Enum.intValue(0x8FC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_33", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_33", xdc.services.intern.xsr.Enum.intValue(0x90400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_34", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_34", xdc.services.intern.xsr.Enum.intValue(0x90C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_35", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_35", xdc.services.intern.xsr.Enum.intValue(0x91400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_36", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_36", xdc.services.intern.xsr.Enum.intValue(0x91C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_37", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_37", xdc.services.intern.xsr.Enum.intValue(0x92400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_38", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_38", xdc.services.intern.xsr.Enum.intValue(0x92C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_39", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_39", xdc.services.intern.xsr.Enum.intValue(0x93400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_40", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_40", xdc.services.intern.xsr.Enum.intValue(0x93C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_41", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_41", xdc.services.intern.xsr.Enum.intValue(0x94400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_42", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_42", xdc.services.intern.xsr.Enum.intValue(0x94C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_43", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_43", xdc.services.intern.xsr.Enum.intValue(0x95400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_44", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_44", xdc.services.intern.xsr.Enum.intValue(0x95C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_45", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_45", xdc.services.intern.xsr.Enum.intValue(0x96400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_46", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_46", xdc.services.intern.xsr.Enum.intValue(0x96C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_47", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_47", xdc.services.intern.xsr.Enum.intValue(0x97400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_48", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_48", xdc.services.intern.xsr.Enum.intValue(0x97C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_49", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_49", xdc.services.intern.xsr.Enum.intValue(0x98400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_50", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_50", xdc.services.intern.xsr.Enum.intValue(0x98C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_51", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_51", xdc.services.intern.xsr.Enum.intValue(0x99400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_52", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_52", xdc.services.intern.xsr.Enum.intValue(0x99C00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_53", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_53", xdc.services.intern.xsr.Enum.intValue(0x9A400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_54", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_54", xdc.services.intern.xsr.Enum.intValue(0x9AC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_55", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_55", xdc.services.intern.xsr.Enum.intValue(0x9B400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_56", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_56", xdc.services.intern.xsr.Enum.intValue(0x9BC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_57", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_57", xdc.services.intern.xsr.Enum.intValue(0x9C400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_58", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_58", xdc.services.intern.xsr.Enum.intValue(0x9CC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_59", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_59", xdc.services.intern.xsr.Enum.intValue(0x9D400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_60", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_60", xdc.services.intern.xsr.Enum.intValue(0x9DC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_61", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_61", xdc.services.intern.xsr.Enum.intValue(0x9E400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_62", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_62", xdc.services.intern.xsr.Enum.intValue(0x9EC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_63", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_63", xdc.services.intern.xsr.Enum.intValue(0x9F400000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_64", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_64", xdc.services.intern.xsr.Enum.intValue(0x9FC00000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_2_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_2_5", xdc.services.intern.xsr.Enum.intValue(0xC1000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_3_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_3_5", xdc.services.intern.xsr.Enum.intValue(0xC1800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_4_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_4_5", xdc.services.intern.xsr.Enum.intValue(0xC2000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_5_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_5_5", xdc.services.intern.xsr.Enum.intValue(0xC2800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_6_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_6_5", xdc.services.intern.xsr.Enum.intValue(0xC3000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_7_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_7_5", xdc.services.intern.xsr.Enum.intValue(0xC3800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_8_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_8_5", xdc.services.intern.xsr.Enum.intValue(0xC4000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_9_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_9_5", xdc.services.intern.xsr.Enum.intValue(0xC4800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_10_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_10_5", xdc.services.intern.xsr.Enum.intValue(0xC5000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_11_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_11_5", xdc.services.intern.xsr.Enum.intValue(0xC5800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_12_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_12_5", xdc.services.intern.xsr.Enum.intValue(0xC6000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_13_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_13_5", xdc.services.intern.xsr.Enum.intValue(0xC6800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_14_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_14_5", xdc.services.intern.xsr.Enum.intValue(0xC7000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_15_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_15_5", xdc.services.intern.xsr.Enum.intValue(0xC7800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_16_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_16_5", xdc.services.intern.xsr.Enum.intValue(0xC8000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_17_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_17_5", xdc.services.intern.xsr.Enum.intValue(0xC8800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_18_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_18_5", xdc.services.intern.xsr.Enum.intValue(0xC9000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_19_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_19_5", xdc.services.intern.xsr.Enum.intValue(0xC9800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_20_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_20_5", xdc.services.intern.xsr.Enum.intValue(0xCA000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_21_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_21_5", xdc.services.intern.xsr.Enum.intValue(0xCA800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_22_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_22_5", xdc.services.intern.xsr.Enum.intValue(0xCB000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_23_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_23_5", xdc.services.intern.xsr.Enum.intValue(0xCB800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_24_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_24_5", xdc.services.intern.xsr.Enum.intValue(0xCC000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_25_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_25_5", xdc.services.intern.xsr.Enum.intValue(0xCC800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_26_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_26_5", xdc.services.intern.xsr.Enum.intValue(0xCD000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_27_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_27_5", xdc.services.intern.xsr.Enum.intValue(0xCD800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_28_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_28_5", xdc.services.intern.xsr.Enum.intValue(0xCE000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_29_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_29_5", xdc.services.intern.xsr.Enum.intValue(0xCE800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_30_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_30_5", xdc.services.intern.xsr.Enum.intValue(0xCF000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_31_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_31_5", xdc.services.intern.xsr.Enum.intValue(0xCF800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_32_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_32_5", xdc.services.intern.xsr.Enum.intValue(0xD0000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_33_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_33_5", xdc.services.intern.xsr.Enum.intValue(0xD0800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_34_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_34_5", xdc.services.intern.xsr.Enum.intValue(0xD1000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_35_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_35_5", xdc.services.intern.xsr.Enum.intValue(0xD1800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_36_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_36_5", xdc.services.intern.xsr.Enum.intValue(0xD2000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_37_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_37_5", xdc.services.intern.xsr.Enum.intValue(0xD2800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_38_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_38_5", xdc.services.intern.xsr.Enum.intValue(0xD3000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_39_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_39_5", xdc.services.intern.xsr.Enum.intValue(0xD3800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_40_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_40_5", xdc.services.intern.xsr.Enum.intValue(0xD4000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_41_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_41_5", xdc.services.intern.xsr.Enum.intValue(0xD4800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_42_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_42_5", xdc.services.intern.xsr.Enum.intValue(0xD5000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_43_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_43_5", xdc.services.intern.xsr.Enum.intValue(0xD5800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_44_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_44_5", xdc.services.intern.xsr.Enum.intValue(0xD6000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_45_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_45_5", xdc.services.intern.xsr.Enum.intValue(0xD6800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_46_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_46_5", xdc.services.intern.xsr.Enum.intValue(0xD7000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_47_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_47_5", xdc.services.intern.xsr.Enum.intValue(0xD7800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_48_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_48_5", xdc.services.intern.xsr.Enum.intValue(0xD8000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_49_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_49_5", xdc.services.intern.xsr.Enum.intValue(0xD8800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_50_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_50_5", xdc.services.intern.xsr.Enum.intValue(0xD9000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_51_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_51_5", xdc.services.intern.xsr.Enum.intValue(0xD9800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_52_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_52_5", xdc.services.intern.xsr.Enum.intValue(0xDA000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_53_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_53_5", xdc.services.intern.xsr.Enum.intValue(0xDA800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_54_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_54_5", xdc.services.intern.xsr.Enum.intValue(0xDB000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_55_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_55_5", xdc.services.intern.xsr.Enum.intValue(0xDB800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_56_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_56_5", xdc.services.intern.xsr.Enum.intValue(0xDC000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_57_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_57_5", xdc.services.intern.xsr.Enum.intValue(0xDC800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_58_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_58_5", xdc.services.intern.xsr.Enum.intValue(0xDD000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_59_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_59_5", xdc.services.intern.xsr.Enum.intValue(0xDD800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_60_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_60_5", xdc.services.intern.xsr.Enum.intValue(0xDE000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_61_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_61_5", xdc.services.intern.xsr.Enum.intValue(0xDE800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_62_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_62_5", xdc.services.intern.xsr.Enum.intValue(0xDF000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_63_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_63_5", xdc.services.intern.xsr.Enum.intValue(0xDF800000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_1", xdc.services.intern.xsr.Enum.intValue(0x00000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_2", xdc.services.intern.xsr.Enum.intValue(0x00100000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_4", xdc.services.intern.xsr.Enum.intValue(0x00120000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_8", xdc.services.intern.xsr.Enum.intValue(0x00140000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_16", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_16", xdc.services.intern.xsr.Enum.intValue(0x00160000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_32", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_32", xdc.services.intern.xsr.Enum.intValue(0x00180000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_64", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_64", xdc.services.intern.xsr.Enum.intValue(0x001A0000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_1MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_1MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_1_84MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_1_84MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000040L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_2MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_2MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000080L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_2_45MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_2_45MHZ", xdc.services.intern.xsr.Enum.intValue(0x000000C0L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_3_57MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_3_57MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000100L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_3_68MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_3_68MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000140L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_4MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_4MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000180L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_4_09MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_4_09MHZ", xdc.services.intern.xsr.Enum.intValue(0x000001C0L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_4_91MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_4_91MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000200L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_5MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_5MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000240L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_5_12MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_5_12MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000280L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_6MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_6MHZ", xdc.services.intern.xsr.Enum.intValue(0x000002C0L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_6_14MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_6_14MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000300L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_7_37MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_7_37MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000340L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_8MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_8MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000380L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_8_19MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_8_19MHZ", xdc.services.intern.xsr.Enum.intValue(0x000003C0L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_10MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_10MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000400L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_12MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_12MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000440L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_12_2MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_12_2MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000480L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_13_5MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_13_5MHZ", xdc.services.intern.xsr.Enum.intValue(0x000004C0L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_14_3MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_14_3MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000500L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_16MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_16MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000540L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_16_3MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_16_3MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000580L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_18MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_18MHZ", xdc.services.intern.xsr.Enum.intValue(0x000005C0L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_20MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_20MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000600L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_24MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_24MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000640L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_25MHZ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_25MHZ", xdc.services.intern.xsr.Enum.intValue(0x00000680L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_MAIN", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OscSrc", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_MAIN", xdc.services.intern.xsr.Enum.intValue(0x00000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_INT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OscSrc", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_INT", xdc.services.intern.xsr.Enum.intValue(0x00000010L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_INT4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OscSrc", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_INT4", xdc.services.intern.xsr.Enum.intValue(0x00000020L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_INT30", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OscSrc", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_INT30", xdc.services.intern.xsr.Enum.intValue(0x00000030L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_EXT4_19", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OscSrc", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_EXT4_19", xdc.services.intern.xsr.Enum.intValue(0x80000028L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_EXT32", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OscSrc", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_EXT32", xdc.services.intern.xsr.Enum.intValue(0x80000038L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_55V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_55V", xdc.services.intern.xsr.Enum.intValue(0x0000001FL)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_60V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_60V", xdc.services.intern.xsr.Enum.intValue(0x0000001EL)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_65V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_65V", xdc.services.intern.xsr.Enum.intValue(0x0000001DL)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_70V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_70V", xdc.services.intern.xsr.Enum.intValue(0x0000001CL)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_75V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_75V", xdc.services.intern.xsr.Enum.intValue(0x0000001BL)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_25V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_25V", xdc.services.intern.xsr.Enum.intValue(0x00000005L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_30V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_30V", xdc.services.intern.xsr.Enum.intValue(0x00000004L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_35V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_35V", xdc.services.intern.xsr.Enum.intValue(0x00000003L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_40V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_40V", xdc.services.intern.xsr.Enum.intValue(0x00000002L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_45V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_45V", xdc.services.intern.xsr.Enum.intValue(0x00000001L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_50V", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_50V", xdc.services.intern.xsr.Enum.intValue(0x00000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.VCO_480", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.VcoFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.VCO_480", xdc.services.intern.xsr.Enum.intValue(0xF1000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.VCO_320", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.VcoFreq", "ti.sysbios.family.arm.msp432e4.init"), "ti.sysbios.family.arm.msp432e4.init.Boot.VCO_320", xdc.services.intern.xsr.Enum.intValue(0xF0000000L)+0));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.sysCtlClockSet", new Extern("ti_sysbios_family_arm_msp432e4_init_Boot_sysCtlClockSet__E", "xdc_Void(*)(xdc_ULong)", true, false));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.sysCtlClockFreqSet", new Extern("ti_sysbios_family_arm_msp432e4_init_Boot_sysCtlClockFreqSet__E", "xdc_ULong(*)(xdc_ULong,xdc_ULong)", true, false));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.sysCtlClockSetI", new Extern("ti_sysbios_family_arm_msp432e4_init_Boot_sysCtlClockSetI__I", "xdc_Void(*)(xdc_ULong)", true, false));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.sysCtlClockFreqSetI", new Extern("ti_sysbios_family_arm_msp432e4_init_Boot_sysCtlClockFreqSetI__I", "xdc_ULong(*)(xdc_ULong,xdc_ULong)", true, false));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.sysCtlDelayI", new Extern("ti_sysbios_family_arm_msp432e4_init_Boot_sysCtlDelayI__I", "xdc_Void(*)(xdc_ULong)", true, false));
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot.init", new Extern("ti_sysbios_family_arm_msp432e4_init_Boot_init__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void Boot$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Boot$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Boot.registerFreqListener
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.msp432e4.init.Boot$$registerFreqListener", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.Module", "ti.sysbios.family.arm.msp432e4.init"), null, 0, -1, false));
    }

    void Boot$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Boot$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/msp432e4/init/Boot.xs");
        om.bind("ti.sysbios.family.arm.msp432e4.init.Boot$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.Module", "ti.sysbios.family.arm.msp432e4.init");
        po.init("ti.sysbios.family.arm.msp432e4.init.Boot.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.msp432e4.init"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.msp432e4.init"), $$UNDEF, "wh");
            po.addFld("configureClock", $$T_Bool, true, "wh");
            po.addFld("sysClockDiv", (Proto)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"), om.find("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_2_5"), "wh");
            po.addFld("pwmClockDiv", (Proto)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv", "ti.sysbios.family.arm.msp432e4.init"), om.find("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_1"), "wh");
            po.addFld("xtal", (Proto)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"), om.find("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_25MHZ"), "wh");
            po.addFld("oscSrc", (Proto)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OscSrc", "ti.sysbios.family.arm.msp432e4.init"), om.find("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_MAIN"), "wh");
            po.addFld("vcoFreq", (Proto)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.VcoFreq", "ti.sysbios.family.arm.msp432e4.init"), om.find("ti.sysbios.family.arm.msp432e4.init.Boot.VCO_480"), "wh");
            po.addFld("pllBypass", $$T_Bool, false, "wh");
            po.addFld("pllOutEnable", $$T_Bool, false, "wh");
            po.addFld("ioscDisable", $$T_Bool, false, "wh");
            po.addFld("moscDisable", $$T_Bool, false, "wh");
            po.addFld("configureLdo", $$T_Bool, false, "wh");
            po.addFld("ldoOut", (Proto)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"), om.find("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_50V"), "wh");
            po.addFld("enhancedClockMode", $$T_Bool, true, "wh");
            po.addFld("cpuFrequency", Proto.Elm.newCNum("(xdc_UInt)"), 120000000L, "wh");
            po.addFld("ulConfig", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
            po.addFld("computedCpuFrequency", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.msp432e4.init.Boot$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.msp432e4.init.Boot$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.msp432e4.init.Boot$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.msp432e4.init.Boot$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("registerFreqListener", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot$$registerFreqListener", "ti.sysbios.family.arm.msp432e4.init"), Global.get(cap, "registerFreqListener"));
        // struct Boot.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot$$ModuleView", "ti.sysbios.family.arm.msp432e4.init");
        po.init("ti.sysbios.family.arm.msp432e4.init.Boot.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("configureClock", $$T_Bool, $$UNDEF, "w");
                po.addFld("sysClockDivEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("sysClockDiv", $$T_Str, $$UNDEF, "w");
                po.addFld("pwmClockDivEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("pwmClockDiv", $$T_Str, $$UNDEF, "w");
                po.addFld("xtal", $$T_Str, $$UNDEF, "w");
                po.addFld("oscSrc", $$T_Str, $$UNDEF, "w");
                po.addFld("pllBypass", $$T_Bool, $$UNDEF, "w");
                po.addFld("pllOutEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("ioscDisable", $$T_Bool, $$UNDEF, "w");
                po.addFld("moscDisable", $$T_Bool, $$UNDEF, "w");
    }

    void Boot$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot", "ti.sysbios.family.arm.msp432e4.init");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.msp432e4.init.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.msp432e4.init"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/msp432e4/init/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.msp432e4.init"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.msp432e4.init"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.msp432e4.init"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.msp432e4.init"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.msp432e4.init"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.msp432e4.init"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.msp432e4.init", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.msp432e4.init");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.msp432e4.init.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.msp432e4.init'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.msp432e4.init$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.msp432e4.init$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.msp432e4.init$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/Boot.aem3',\n");
            sb.append("'lib/Boot.aem4',\n");
            sb.append("'lib/Boot.aem4f',\n");
            sb.append("'lib/Boot.am3g',\n");
            sb.append("'lib/Boot.am4g',\n");
            sb.append("'lib/Boot.am4fg',\n");
            sb.append("'lib/Boot.arm3',\n");
            sb.append("'lib/Boot.arm4',\n");
            sb.append("'lib/Boot.arm4f',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/Boot.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/Boot.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
            sb.append("['lib/Boot.aem4f', {target: 'ti.targets.arm.elf.M4F', suffix: 'em4f'}],\n");
            sb.append("['lib/Boot.am3g', {target: 'gnu.targets.arm.M3', suffix: 'm3g'}],\n");
            sb.append("['lib/Boot.am4g', {target: 'gnu.targets.arm.M4', suffix: 'm4g'}],\n");
            sb.append("['lib/Boot.am4fg', {target: 'gnu.targets.arm.M4F', suffix: 'm4fg'}],\n");
            sb.append("['lib/Boot.arm3', {target: 'iar.targets.arm.M3', suffix: 'rm3'}],\n");
            sb.append("['lib/Boot.arm4', {target: 'iar.targets.arm.M4', suffix: 'rm4'}],\n");
            sb.append("['lib/Boot.arm4f', {target: 'iar.targets.arm.M4F', suffix: 'rm4f'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Boot$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot", "ti.sysbios.family.arm.msp432e4.init");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.Module", "ti.sysbios.family.arm.msp432e4.init");
        vo.init2(po, "ti.sysbios.family.arm.msp432e4.init.Boot", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot$$capsule", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.msp432e4.init", "ti.sysbios.family.arm.msp432e4.init"));
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
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.ModuleView", "ti.sysbios.family.arm.msp432e4.init"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.ModuleView", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SysDiv", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SysDiv", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("PwmDiv", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PwmDiv", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XtalFreq", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XtalFreq", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("OscSrc", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OscSrc", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LdoOut", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LdoOut", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("VcoFreq", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.VcoFreq", "ti.sysbios.family.arm.msp432e4.init"));
        icfgs.add("ulConfig");
        icfgs.add("computedCpuFrequency");
        vo.bind("SYSDIV_1", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_1", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_2", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_2", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_3", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_3", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_4", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_4", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_6", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_6", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_7", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_7", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_8", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_8", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_9", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_9", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_10", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_10", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_11", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_11", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_12", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_12", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_13", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_13", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_14", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_14", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_15", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_15", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_16", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_16", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_17", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_17", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_18", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_18", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_19", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_19", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_20", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_20", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_21", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_21", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_22", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_22", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_23", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_23", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_24", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_24", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_25", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_25", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_26", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_26", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_27", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_27", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_28", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_28", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_29", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_29", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_30", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_30", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_31", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_31", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_32", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_32", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_33", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_33", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_34", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_34", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_35", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_35", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_36", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_36", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_37", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_37", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_38", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_38", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_39", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_39", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_40", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_40", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_41", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_41", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_42", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_42", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_43", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_43", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_44", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_44", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_45", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_45", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_46", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_46", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_47", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_47", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_48", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_48", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_49", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_49", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_50", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_50", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_51", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_51", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_52", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_52", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_53", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_53", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_54", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_54", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_55", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_55", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_56", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_56", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_57", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_57", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_58", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_58", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_59", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_59", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_60", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_60", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_61", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_61", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_62", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_62", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_63", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_63", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_64", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_64", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_2_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_2_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_3_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_3_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_4_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_4_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_5_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_5_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_6_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_6_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_7_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_7_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_8_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_8_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_9_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_9_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_10_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_10_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_11_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_11_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_12_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_12_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_13_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_13_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_14_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_14_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_15_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_15_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_16_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_16_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_17_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_17_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_18_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_18_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_19_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_19_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_20_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_20_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_21_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_21_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_22_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_22_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_23_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_23_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_24_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_24_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_25_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_25_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_26_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_26_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_27_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_27_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_28_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_28_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_29_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_29_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_30_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_30_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_31_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_31_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_32_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_32_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_33_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_33_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_34_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_34_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_35_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_35_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_36_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_36_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_37_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_37_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_38_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_38_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_39_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_39_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_40_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_40_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_41_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_41_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_42_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_42_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_43_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_43_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_44_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_44_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_45_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_45_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_46_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_46_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_47_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_47_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_48_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_48_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_49_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_49_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_50_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_50_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_51_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_51_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_52_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_52_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_53_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_53_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_54_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_54_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_55_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_55_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_56_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_56_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_57_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_57_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_58_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_58_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_59_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_59_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_60_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_60_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_61_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_61_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_62_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_62_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("SYSDIV_63_5", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.SYSDIV_63_5", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("PWMDIV_1", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_1", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("PWMDIV_2", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_2", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("PWMDIV_4", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_4", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("PWMDIV_8", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_8", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("PWMDIV_16", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_16", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("PWMDIV_32", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_32", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("PWMDIV_64", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.PWMDIV_64", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_1MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_1MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_1_84MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_1_84MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_2MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_2MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_2_45MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_2_45MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_3_57MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_3_57MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_3_68MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_3_68MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_4MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_4MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_4_09MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_4_09MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_4_91MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_4_91MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_5MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_5MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_5_12MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_5_12MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_6MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_6MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_6_14MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_6_14MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_7_37MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_7_37MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_8MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_8MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_8_19MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_8_19MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_10MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_10MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_12MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_12MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_12_2MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_12_2MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_13_5MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_13_5MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_14_3MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_14_3MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_16MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_16MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_16_3MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_16_3MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_18MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_18MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_20MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_20MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_24MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_24MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("XTAL_25MHZ", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.XTAL_25MHZ", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("OSCSRC_MAIN", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_MAIN", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("OSCSRC_INT", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_INT", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("OSCSRC_INT4", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_INT4", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("OSCSRC_INT30", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_INT30", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("OSCSRC_EXT4_19", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_EXT4_19", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("OSCSRC_EXT32", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.OSCSRC_EXT32", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_55V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_55V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_60V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_60V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_65V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_65V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_70V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_70V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_75V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_75V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_25V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_25V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_30V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_30V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_35V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_35V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_40V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_40V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_45V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_45V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("LDOPCTL_2_50V", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.LDOPCTL_2_50V", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("VCO_480", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.VCO_480", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("VCO_320", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.VCO_320", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.msp432e4.init")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("sysCtlClockSet", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.sysCtlClockSet", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("sysCtlClockFreqSet", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.sysCtlClockFreqSet", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("sysCtlClockSetI", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.sysCtlClockSetI", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("sysCtlClockFreqSetI", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.sysCtlClockFreqSetI", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("sysCtlDelayI", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.sysCtlDelayI", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("init", om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot.init", "ti.sysbios.family.arm.msp432e4.init"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_msp432e4_init_Boot_Module__startupDone__E", "ti_sysbios_family_arm_msp432e4_init_Boot_sysCtlClockSet__E", "ti_sysbios_family_arm_msp432e4_init_Boot_sysCtlClockFreqSet__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Boot.xdt");
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Boot.xdt");
        pkgV.bind("Boot", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Boot");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot", "ti.sysbios.family.arm.msp432e4.init"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.msp432e4.init.Boot", "ti.sysbios.family.arm.msp432e4.init");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.msp432e4.init.Boot")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.msp432e4.init")).add(pkgV);
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
        Boot$$OBJECTS();
        Boot$$CONSTS();
        Boot$$CREATES();
        Boot$$FUNCTIONS();
        Boot$$SIZES();
        Boot$$TYPES();
        if (isROV) {
            Boot$$ROV();
        }//isROV
        $$SINGLETONS();
        Boot$$SINGLETONS();
        $$INITIALIZATION();
    }
}
