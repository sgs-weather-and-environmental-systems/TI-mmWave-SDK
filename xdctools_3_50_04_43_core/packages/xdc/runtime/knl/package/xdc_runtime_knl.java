/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D21
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class xdc_runtime_knl
{
    static final String VERS = "@(#) xdc-D21\n";

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
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.runtime.knl.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.runtime.knl", new Value.Obj("xdc.runtime.knl", pkgP));
    }

    void GateH$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateH.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.GateH", new Value.Obj("xdc.runtime.knl.GateH", po));
        pkgV.bind("GateH", vo);
        // decls 
    }

    void Semaphore$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.Semaphore.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.Semaphore", new Value.Obj("xdc.runtime.knl.Semaphore", po));
        pkgV.bind("Semaphore", vo);
        // decls 
        om.bind("xdc.runtime.knl.Semaphore.PendStatus", new Proto.Enm("xdc.runtime.knl.Semaphore.PendStatus"));
    }

    void Thread$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.Thread.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.Thread", new Value.Obj("xdc.runtime.knl.Thread", po));
        pkgV.bind("Thread", vo);
        // decls 
        om.bind("xdc.runtime.knl.Thread.Priority", new Proto.Enm("xdc.runtime.knl.Thread.Priority"));
        om.bind("xdc.runtime.knl.Thread.CompStatus", new Proto.Enm("xdc.runtime.knl.Thread.CompStatus"));
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.Thread$$Stat", new Proto.Obj());
        om.bind("xdc.runtime.knl.Thread.Stat", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.Thread$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.Thread.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.Thread.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Thread$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.Thread.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Thread$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.Thread.Params", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.Thread.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.Thread.Object", om.findStrict("xdc.runtime.knl.Thread.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void Sync$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.Sync.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.Sync", new Value.Obj("xdc.runtime.knl.Sync", po));
        pkgV.bind("Sync", vo);
        // decls 
        om.bind("xdc.runtime.knl.Sync.WaitStatus", new Proto.Enm("xdc.runtime.knl.Sync.WaitStatus"));
    }

    void GateThread$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThread.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.GateThread", new Value.Obj("xdc.runtime.knl.GateThread", po));
        pkgV.bind("GateThread", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.GateThread$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateThread.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.GateThread.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThread$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateThread.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThread$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateThread.Params", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.GateThread.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.GateThread.Object", om.findStrict("xdc.runtime.knl.GateThread.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void GateProcess$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcess.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.GateProcess", new Value.Obj("xdc.runtime.knl.GateProcess", po));
        pkgV.bind("GateProcess", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcess$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateProcess.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.GateProcess.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcess$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateProcess.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcess$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateProcess.Params", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.GateProcess.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.GateProcess.Object", om.findStrict("xdc.runtime.knl.GateProcess.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void ISemaphore$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemaphore.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.ISemaphore", new Value.Obj("xdc.runtime.knl.ISemaphore", po));
        pkgV.bind("ISemaphore", vo);
        // decls 
        om.bind("xdc.runtime.knl.ISemaphore.PendStatus", new Proto.Enm("xdc.runtime.knl.ISemaphore.PendStatus"));
        om.bind("xdc.runtime.knl.ISemaphore.Mode", new Proto.Enm("xdc.runtime.knl.ISemaphore.Mode"));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.ISemaphore.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemaphore$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISemaphore.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemaphore$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISemaphore.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemaphore$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISemaphore.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.ISemaphore.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.ISemaphore.Object", om.findStrict("xdc.runtime.knl.ISemaphore.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void SemThread$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemThread.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.SemThread", new Value.Obj("xdc.runtime.knl.SemThread", po));
        pkgV.bind("SemThread", vo);
        // decls 
        om.bind("xdc.runtime.knl.SemThread.PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        om.bind("xdc.runtime.knl.SemThread.Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.SemThread$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemThread.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.SemThread.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemThread$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemThread.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemThread$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemThread.Params", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.SemThread.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.SemThread.Object", om.findStrict("xdc.runtime.knl.SemThread.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void SemProcess$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemProcess.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.SemProcess", new Value.Obj("xdc.runtime.knl.SemProcess", po));
        pkgV.bind("SemProcess", vo);
        // decls 
        om.bind("xdc.runtime.knl.SemProcess.PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        om.bind("xdc.runtime.knl.SemProcess.Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.SemProcess$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemProcess.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.SemProcess.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemProcess$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemProcess.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemProcess$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemProcess.Params", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.SemProcess.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.SemProcess.Object", om.findStrict("xdc.runtime.knl.SemProcess.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void ISync$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISync.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.ISync", new Value.Obj("xdc.runtime.knl.ISync", po));
        pkgV.bind("ISync", vo);
        // decls 
        om.bind("xdc.runtime.knl.ISync.WaitStatus", new Proto.Enm("xdc.runtime.knl.ISync.WaitStatus"));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.ISync.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISync$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISync.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISync$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISync.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISync$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISync.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.ISync.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.ISync.Object", om.findStrict("xdc.runtime.knl.ISync.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void SyncGeneric$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.SyncGeneric.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.SyncGeneric", new Value.Obj("xdc.runtime.knl.SyncGeneric", po));
        pkgV.bind("SyncGeneric", vo);
        // decls 
        om.bind("xdc.runtime.knl.SyncGeneric.WaitStatus", om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"));
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.SyncGeneric$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.SyncGeneric.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.SyncGeneric.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SyncGeneric$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.SyncGeneric.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SyncGeneric$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.SyncGeneric.Params", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.SyncGeneric.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.SyncGeneric.Object", om.findStrict("xdc.runtime.knl.SyncGeneric.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void SyncNull$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.SyncNull.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.SyncNull", new Value.Obj("xdc.runtime.knl.SyncNull", po));
        pkgV.bind("SyncNull", vo);
        // decls 
        om.bind("xdc.runtime.knl.SyncNull.WaitStatus", om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"));
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.SyncNull$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.SyncNull.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.SyncNull.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SyncNull$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.SyncNull.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SyncNull$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.SyncNull.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SyncNull$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.SyncNull.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.SyncNull.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.SyncNull.Object", om.findStrict("xdc.runtime.knl.SyncNull.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void SyncSemThread$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.SyncSemThread.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.SyncSemThread", new Value.Obj("xdc.runtime.knl.SyncSemThread", po));
        pkgV.bind("SyncSemThread", vo);
        // decls 
        om.bind("xdc.runtime.knl.SyncSemThread.WaitStatus", om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"));
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.SyncSemThread$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.SyncSemThread.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.SyncSemThread.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SyncSemThread$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.SyncSemThread.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SyncSemThread$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.SyncSemThread.Params", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.SyncSemThread.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.SyncSemThread.Object", om.findStrict("xdc.runtime.knl.SyncSemThread.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void Cache$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.Cache.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.Cache", new Value.Obj("xdc.runtime.knl.Cache", po));
        pkgV.bind("Cache", vo);
        // decls 
    }

    void ICacheSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.ICacheSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.ICacheSupport", new Value.Obj("xdc.runtime.knl.ICacheSupport", po));
        pkgV.bind("ICacheSupport", vo);
        // decls 
    }

    void CacheSupportNull$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.CacheSupportNull.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.CacheSupportNull", new Value.Obj("xdc.runtime.knl.CacheSupportNull", po));
        pkgV.bind("CacheSupportNull", vo);
        // decls 
    }

    void IGateThreadSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.IGateThreadSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.IGateThreadSupport", new Value.Obj("xdc.runtime.knl.IGateThreadSupport", po));
        pkgV.bind("IGateThreadSupport", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.runtime.knl.IGateThreadSupport.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.IGateThreadSupport$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.IGateThreadSupport.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.IGateThreadSupport$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.IGateThreadSupport.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.IGateThreadSupport$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.IGateThreadSupport.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.IGateThreadSupport.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.IGateThreadSupport.Object", om.findStrict("xdc.runtime.knl.IGateThreadSupport.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void GateThreadSupportNull$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThreadSupportNull.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.GateThreadSupportNull", new Value.Obj("xdc.runtime.knl.GateThreadSupportNull", po));
        pkgV.bind("GateThreadSupportNull", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.GateThreadSupportNull$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateThreadSupportNull.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.GateThreadSupportNull.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThreadSupportNull$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateThreadSupportNull.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThreadSupportNull$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateThreadSupportNull.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThreadSupportNull$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateThreadSupportNull.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.GateThreadSupportNull.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.GateThreadSupportNull.Object", om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void IGateProcessSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.IGateProcessSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.IGateProcessSupport", new Value.Obj("xdc.runtime.knl.IGateProcessSupport", po));
        pkgV.bind("IGateProcessSupport", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.runtime.knl.IGateProcessSupport.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.IGateProcessSupport$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.IGateProcessSupport.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.IGateProcessSupport$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.IGateProcessSupport.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.IGateProcessSupport$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.IGateProcessSupport.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.IGateProcessSupport.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.IGateProcessSupport.Object", om.findStrict("xdc.runtime.knl.IGateProcessSupport.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void GateProcessSupportNull$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcessSupportNull.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.GateProcessSupportNull", new Value.Obj("xdc.runtime.knl.GateProcessSupportNull", po));
        pkgV.bind("GateProcessSupportNull", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcessSupportNull$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateProcessSupportNull.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.GateProcessSupportNull.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcessSupportNull$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateProcessSupportNull.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcessSupportNull$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateProcessSupportNull.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcessSupportNull$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateProcessSupportNull.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.GateProcessSupportNull.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.GateProcessSupportNull.Object", om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void ISemThreadSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemThreadSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.ISemThreadSupport", new Value.Obj("xdc.runtime.knl.ISemThreadSupport", po));
        pkgV.bind("ISemThreadSupport", vo);
        // decls 
        om.bind("xdc.runtime.knl.ISemThreadSupport.PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        om.bind("xdc.runtime.knl.ISemThreadSupport.Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.ISemThreadSupport.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemThreadSupport$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISemThreadSupport.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemThreadSupport$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISemThreadSupport.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemThreadSupport$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISemThreadSupport.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.ISemThreadSupport.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.ISemThreadSupport.Object", om.findStrict("xdc.runtime.knl.ISemThreadSupport.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void ISemProcessSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemProcessSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.ISemProcessSupport", new Value.Obj("xdc.runtime.knl.ISemProcessSupport", po));
        pkgV.bind("ISemProcessSupport", vo);
        // decls 
        om.bind("xdc.runtime.knl.ISemProcessSupport.PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        om.bind("xdc.runtime.knl.ISemProcessSupport.Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.ISemProcessSupport.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemProcessSupport$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISemProcessSupport.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemProcessSupport$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISemProcessSupport.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.ISemProcessSupport$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.ISemProcessSupport.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.ISemProcessSupport.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.ISemProcessSupport.Object", om.findStrict("xdc.runtime.knl.ISemProcessSupport.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void IThreadSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.IThreadSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.IThreadSupport", new Value.Obj("xdc.runtime.knl.IThreadSupport", po));
        pkgV.bind("IThreadSupport", vo);
        // decls 
        om.bind("xdc.runtime.knl.IThreadSupport.Priority", new Proto.Enm("xdc.runtime.knl.IThreadSupport.Priority"));
        om.bind("xdc.runtime.knl.IThreadSupport.CompStatus", new Proto.Enm("xdc.runtime.knl.IThreadSupport.CompStatus"));
        spo = (Proto.Obj)om.bind("xdc.runtime.knl.IThreadSupport$$Stat", new Proto.Obj());
        om.bind("xdc.runtime.knl.IThreadSupport.Stat", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.IThreadSupport.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.IThreadSupport$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.IThreadSupport.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.IThreadSupport$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.IThreadSupport.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.IThreadSupport$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.IThreadSupport.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.IThreadSupport.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.IThreadSupport.Object", om.findStrict("xdc.runtime.knl.IThreadSupport.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void GateH_Proxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateH_Proxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.GateH_Proxy", new Value.Obj("xdc.runtime.knl.GateH_Proxy", po));
        pkgV.bind("GateH_Proxy", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.runtime.knl.GateH_Proxy.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateH_Proxy$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateH_Proxy.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateH_Proxy$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateH_Proxy.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateH_Proxy$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateH_Proxy.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.GateH_Proxy.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.GateH_Proxy.Object", om.findStrict("xdc.runtime.knl.GateH_Proxy.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void Semaphore_Proxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.Semaphore_Proxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.Semaphore_Proxy", new Value.Obj("xdc.runtime.knl.Semaphore_Proxy", po));
        pkgV.bind("Semaphore_Proxy", vo);
        // decls 
        om.bind("xdc.runtime.knl.Semaphore_Proxy.PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        om.bind("xdc.runtime.knl.Semaphore_Proxy.Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.Semaphore_Proxy.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Semaphore_Proxy$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.Semaphore_Proxy.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Semaphore_Proxy$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.Semaphore_Proxy.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Semaphore_Proxy$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.Semaphore_Proxy.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.Semaphore_Proxy.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.Semaphore_Proxy.Object", om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void Thread_Proxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.Thread_Proxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.Thread_Proxy", new Value.Obj("xdc.runtime.knl.Thread_Proxy", po));
        pkgV.bind("Thread_Proxy", vo);
        // decls 
        om.bind("xdc.runtime.knl.Thread_Proxy.Priority", om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"));
        om.bind("xdc.runtime.knl.Thread_Proxy.CompStatus", om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus", "xdc.runtime.knl"));
        om.bind("xdc.runtime.knl.Thread_Proxy.Stat", om.findStrict("xdc.runtime.knl.IThreadSupport.Stat", "xdc.runtime.knl"));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.Thread_Proxy.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Thread_Proxy$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.Thread_Proxy.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Thread_Proxy$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.Thread_Proxy.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Thread_Proxy$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.Thread_Proxy.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.Thread_Proxy.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.Thread_Proxy.Object", om.findStrict("xdc.runtime.knl.Thread_Proxy.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void Sync_Proxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.Sync_Proxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.Sync_Proxy", new Value.Obj("xdc.runtime.knl.Sync_Proxy", po));
        pkgV.bind("Sync_Proxy", vo);
        // decls 
        om.bind("xdc.runtime.knl.Sync_Proxy.WaitStatus", om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.Sync_Proxy.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Sync_Proxy$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.Sync_Proxy.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Sync_Proxy$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.Sync_Proxy.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.Sync_Proxy$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.Sync_Proxy.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.Sync_Proxy.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.Sync_Proxy.Object", om.findStrict("xdc.runtime.knl.Sync_Proxy.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void GateThread_Proxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThread_Proxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.GateThread_Proxy", new Value.Obj("xdc.runtime.knl.GateThread_Proxy", po));
        pkgV.bind("GateThread_Proxy", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.runtime.knl.GateThread_Proxy.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThread_Proxy$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateThread_Proxy.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThread_Proxy$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateThread_Proxy.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateThread_Proxy$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateThread_Proxy.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.GateThread_Proxy.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.GateThread_Proxy.Object", om.findStrict("xdc.runtime.knl.GateThread_Proxy.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void GateProcess_Proxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcess_Proxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.GateProcess_Proxy", new Value.Obj("xdc.runtime.knl.GateProcess_Proxy", po));
        pkgV.bind("GateProcess_Proxy", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.runtime.knl.GateProcess_Proxy.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcess_Proxy$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateProcess_Proxy.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcess_Proxy$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateProcess_Proxy.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.GateProcess_Proxy$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.GateProcess_Proxy.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.GateProcess_Proxy.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.GateProcess_Proxy.Object", om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void SemThread_Proxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemThread_Proxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.SemThread_Proxy", new Value.Obj("xdc.runtime.knl.SemThread_Proxy", po));
        pkgV.bind("SemThread_Proxy", vo);
        // decls 
        om.bind("xdc.runtime.knl.SemThread_Proxy.PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        om.bind("xdc.runtime.knl.SemThread_Proxy.Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.SemThread_Proxy.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemThread_Proxy$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemThread_Proxy.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemThread_Proxy$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemThread_Proxy.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemThread_Proxy$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemThread_Proxy.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.SemThread_Proxy.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.SemThread_Proxy.Object", om.findStrict("xdc.runtime.knl.SemThread_Proxy.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void SemProcess_Proxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemProcess_Proxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.SemProcess_Proxy", new Value.Obj("xdc.runtime.knl.SemProcess_Proxy", po));
        pkgV.bind("SemProcess_Proxy", vo);
        // decls 
        om.bind("xdc.runtime.knl.SemProcess_Proxy.PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        om.bind("xdc.runtime.knl.SemProcess_Proxy.Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        // insts 
        Object insP = om.bind("xdc.runtime.knl.SemProcess_Proxy.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemProcess_Proxy$$Object", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemProcess_Proxy.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemProcess_Proxy$$Params", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemProcess_Proxy.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("xdc.runtime.knl.SemProcess_Proxy$$Instance_State", new Proto.Obj());
        om.bind("xdc.runtime.knl.SemProcess_Proxy.Instance_State", new Proto.Str(po, false));
        om.bind("xdc.runtime.knl.SemProcess_Proxy.Handle", insP);
        if (isROV) {
            om.bind("xdc.runtime.knl.SemProcess_Proxy.Object", om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Instance_State", "xdc.runtime.knl"));
        }//isROV
    }

    void Cache_Proxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.runtime.knl.Cache_Proxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.runtime.knl.Cache_Proxy", new Value.Obj("xdc.runtime.knl.Cache_Proxy", po));
        pkgV.bind("Cache_Proxy", vo);
        // decls 
    }

    void GateH$$CONSTS()
    {
        // module GateH
        om.bind("xdc.runtime.knl.GateH.enter", new Extern("xdc_runtime_knl_GateH_enter__E", "xdc_IArg(*)(xdc_runtime_IGateProvider_Handle)", true, false));
        om.bind("xdc.runtime.knl.GateH.leave", new Extern("xdc_runtime_knl_GateH_leave__E", "xdc_Void(*)(xdc_runtime_IGateProvider_Handle,xdc_IArg)", true, false));
    }

    void Semaphore$$CONSTS()
    {
        // module Semaphore
        om.bind("xdc.runtime.knl.Semaphore.PendStatus_ERROR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Semaphore.PendStatus", "xdc.runtime.knl"), "xdc.runtime.knl.Semaphore.PendStatus_ERROR", xdc.services.intern.xsr.Enum.intValue(Global.eval("-1"))+0));
        om.bind("xdc.runtime.knl.Semaphore.PendStatus_TIMEOUT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Semaphore.PendStatus", "xdc.runtime.knl"), "xdc.runtime.knl.Semaphore.PendStatus_TIMEOUT", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("xdc.runtime.knl.Semaphore.PendStatus_SUCCESS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Semaphore.PendStatus", "xdc.runtime.knl"), "xdc.runtime.knl.Semaphore.PendStatus_SUCCESS", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("xdc.runtime.knl.Semaphore.FOREVER", Global.eval("~(0)"));
        om.bind("xdc.runtime.knl.Semaphore.pend", new Extern("xdc_runtime_knl_Semaphore_pend__E", "xdc_Int(*)(xdc_runtime_knl_ISemaphore_Handle,xdc_UInt,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Semaphore.post", new Extern("xdc_runtime_knl_Semaphore_post__E", "xdc_Bool(*)(xdc_runtime_knl_ISemaphore_Handle,xdc_runtime_Error_Block*)", true, false));
    }

    void Thread$$CONSTS()
    {
        // module Thread
        om.bind("xdc.runtime.knl.Thread.Priority_INVALID", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Thread.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.Thread.Priority_INVALID", 0));
        om.bind("xdc.runtime.knl.Thread.Priority_LOWEST", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Thread.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.Thread.Priority_LOWEST", 1));
        om.bind("xdc.runtime.knl.Thread.Priority_BELOW_NORMAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Thread.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.Thread.Priority_BELOW_NORMAL", 2));
        om.bind("xdc.runtime.knl.Thread.Priority_NORMAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Thread.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.Thread.Priority_NORMAL", 3));
        om.bind("xdc.runtime.knl.Thread.Priority_ABOVE_NORMAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Thread.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.Thread.Priority_ABOVE_NORMAL", 4));
        om.bind("xdc.runtime.knl.Thread.Priority_HIGHEST", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Thread.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.Thread.Priority_HIGHEST", 5));
        om.bind("xdc.runtime.knl.Thread.INVALID_OS_PRIORITY", 0L);
        om.bind("xdc.runtime.knl.Thread.GETPRI_FAILED", Global.eval("-2"));
        om.bind("xdc.runtime.knl.Thread.CompStatus_ERROR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Thread.CompStatus", "xdc.runtime.knl"), "xdc.runtime.knl.Thread.CompStatus_ERROR", xdc.services.intern.xsr.Enum.intValue(Global.eval("-2"))+0));
        om.bind("xdc.runtime.knl.Thread.CompStatus_LOWER", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Thread.CompStatus", "xdc.runtime.knl"), "xdc.runtime.knl.Thread.CompStatus_LOWER", xdc.services.intern.xsr.Enum.intValue(Global.eval("-1"))+0));
        om.bind("xdc.runtime.knl.Thread.CompStatus_EQUAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Thread.CompStatus", "xdc.runtime.knl"), "xdc.runtime.knl.Thread.CompStatus_EQUAL", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("xdc.runtime.knl.Thread.CompStatus_HIGHER", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Thread.CompStatus", "xdc.runtime.knl"), "xdc.runtime.knl.Thread.CompStatus_HIGHER", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("xdc.runtime.knl.Thread.self", new Extern("xdc_runtime_knl_Thread_self__E", "xdc_runtime_knl_Thread_Handle(*)(xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Thread.start", new Extern("xdc_runtime_knl_Thread_start__E", "xdc_Bool(*)(xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Thread.yield", new Extern("xdc_runtime_knl_Thread_yield__E", "xdc_Bool(*)(xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Thread.compareOsPriorities", new Extern("xdc_runtime_knl_Thread_compareOsPriorities__E", "xdc_Int(*)(xdc_Int,xdc_Int,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Thread.sleep", new Extern("xdc_runtime_knl_Thread_sleep__E", "xdc_Bool(*)(xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void Sync$$CONSTS()
    {
        // module Sync
        om.bind("xdc.runtime.knl.Sync.WaitStatus_ERROR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Sync.WaitStatus", "xdc.runtime.knl"), "xdc.runtime.knl.Sync.WaitStatus_ERROR", xdc.services.intern.xsr.Enum.intValue(Global.eval("-1"))+0));
        om.bind("xdc.runtime.knl.Sync.WaitStatus_TIMEOUT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Sync.WaitStatus", "xdc.runtime.knl"), "xdc.runtime.knl.Sync.WaitStatus_TIMEOUT", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("xdc.runtime.knl.Sync.WaitStatus_SUCCESS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.Sync.WaitStatus", "xdc.runtime.knl"), "xdc.runtime.knl.Sync.WaitStatus_SUCCESS", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("xdc.runtime.knl.Sync.WAIT_FOREVER", Global.eval("~(0)"));
        om.bind("xdc.runtime.knl.Sync.NO_WAIT", 0L);
        om.bind("xdc.runtime.knl.Sync.query", new Extern("xdc_runtime_knl_Sync_query__E", "xdc_Bool(*)(xdc_runtime_knl_ISync_Handle,xdc_Int)", true, false));
        om.bind("xdc.runtime.knl.Sync.signal", new Extern("xdc_runtime_knl_Sync_signal__E", "xdc_Void(*)(xdc_runtime_knl_ISync_Handle)", true, false));
        om.bind("xdc.runtime.knl.Sync.wait", new Extern("xdc_runtime_knl_Sync_wait__E", "xdc_Int(*)(xdc_runtime_knl_ISync_Handle,xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void GateThread$$CONSTS()
    {
        // module GateThread
        om.bind("xdc.runtime.knl.GateThread.query", new Extern("xdc_runtime_knl_GateThread_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
    }

    void GateProcess$$CONSTS()
    {
        // module GateProcess
        om.bind("xdc.runtime.knl.GateProcess.GETREFCOUNT_FAILED", Global.eval("-1"));
        om.bind("xdc.runtime.knl.GateProcess.query", new Extern("xdc_runtime_knl_GateProcess_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
    }

    void ISemaphore$$CONSTS()
    {
        // interface ISemaphore
        om.bind("xdc.runtime.knl.ISemaphore.PendStatus_ERROR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"), "xdc.runtime.knl.ISemaphore.PendStatus_ERROR", xdc.services.intern.xsr.Enum.intValue(Global.eval("-1"))+0));
        om.bind("xdc.runtime.knl.ISemaphore.PendStatus_TIMEOUT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"), "xdc.runtime.knl.ISemaphore.PendStatus_TIMEOUT", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("xdc.runtime.knl.ISemaphore.PendStatus_SUCCESS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"), "xdc.runtime.knl.ISemaphore.PendStatus_SUCCESS", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("xdc.runtime.knl.ISemaphore.FOREVER", Global.eval("~(0)"));
        om.bind("xdc.runtime.knl.ISemaphore.Mode_COUNTING", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"), "xdc.runtime.knl.ISemaphore.Mode_COUNTING", 0));
        om.bind("xdc.runtime.knl.ISemaphore.Mode_BINARY", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"), "xdc.runtime.knl.ISemaphore.Mode_BINARY", 1));
    }

    void SemThread$$CONSTS()
    {
        // module SemThread
    }

    void SemProcess$$CONSTS()
    {
        // module SemProcess
    }

    void ISync$$CONSTS()
    {
        // interface ISync
        om.bind("xdc.runtime.knl.ISync.WaitStatus_ERROR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"), "xdc.runtime.knl.ISync.WaitStatus_ERROR", xdc.services.intern.xsr.Enum.intValue(Global.eval("-1"))+0));
        om.bind("xdc.runtime.knl.ISync.WaitStatus_TIMEOUT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"), "xdc.runtime.knl.ISync.WaitStatus_TIMEOUT", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("xdc.runtime.knl.ISync.WaitStatus_SUCCESS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"), "xdc.runtime.knl.ISync.WaitStatus_SUCCESS", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("xdc.runtime.knl.ISync.Q_BLOCKING", 1L);
        om.bind("xdc.runtime.knl.ISync.WAIT_FOREVER", Global.eval("~(0)"));
        om.bind("xdc.runtime.knl.ISync.NO_WAIT", 0L);
    }

    void SyncGeneric$$CONSTS()
    {
        // module SyncGeneric
    }

    void SyncNull$$CONSTS()
    {
        // module SyncNull
    }

    void SyncSemThread$$CONSTS()
    {
        // module SyncSemThread
    }

    void Cache$$CONSTS()
    {
        // module Cache
        om.bind("xdc.runtime.knl.Cache.inv", new Extern("xdc_runtime_knl_Cache_inv__E", "xdc_Bool(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Cache.wb", new Extern("xdc_runtime_knl_Cache_wb__E", "xdc_Bool(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Cache.wbInv", new Extern("xdc_runtime_knl_Cache_wbInv__E", "xdc_Bool(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Cache.wait", new Extern("xdc_runtime_knl_Cache_wait__E", "xdc_Bool(*)(xdc_runtime_Error_Block*)", true, false));
    }

    void ICacheSupport$$CONSTS()
    {
        // interface ICacheSupport
    }

    void CacheSupportNull$$CONSTS()
    {
        // module CacheSupportNull
        om.bind("xdc.runtime.knl.CacheSupportNull.inv", new Extern("xdc_runtime_knl_CacheSupportNull_inv__E", "xdc_Bool(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.CacheSupportNull.wb", new Extern("xdc_runtime_knl_CacheSupportNull_wb__E", "xdc_Bool(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.CacheSupportNull.wbInv", new Extern("xdc_runtime_knl_CacheSupportNull_wbInv__E", "xdc_Bool(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.CacheSupportNull.wait", new Extern("xdc_runtime_knl_CacheSupportNull_wait__E", "xdc_Bool(*)(xdc_runtime_Error_Block*)", true, false));
    }

    void IGateThreadSupport$$CONSTS()
    {
        // interface IGateThreadSupport
    }

    void GateThreadSupportNull$$CONSTS()
    {
        // module GateThreadSupportNull
        om.bind("xdc.runtime.knl.GateThreadSupportNull.query", new Extern("xdc_runtime_knl_GateThreadSupportNull_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
    }

    void IGateProcessSupport$$CONSTS()
    {
        // interface IGateProcessSupport
        om.bind("xdc.runtime.knl.IGateProcessSupport.GETREFCOUNT_FAILED", Global.eval("-1"));
    }

    void GateProcessSupportNull$$CONSTS()
    {
        // module GateProcessSupportNull
        om.bind("xdc.runtime.knl.GateProcessSupportNull.query", new Extern("xdc_runtime_knl_GateProcessSupportNull_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
    }

    void ISemThreadSupport$$CONSTS()
    {
        // interface ISemThreadSupport
    }

    void ISemProcessSupport$$CONSTS()
    {
        // interface ISemProcessSupport
    }

    void IThreadSupport$$CONSTS()
    {
        // interface IThreadSupport
        om.bind("xdc.runtime.knl.IThreadSupport.Priority_INVALID", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.IThreadSupport.Priority_INVALID", 0));
        om.bind("xdc.runtime.knl.IThreadSupport.Priority_LOWEST", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.IThreadSupport.Priority_LOWEST", 1));
        om.bind("xdc.runtime.knl.IThreadSupport.Priority_BELOW_NORMAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.IThreadSupport.Priority_BELOW_NORMAL", 2));
        om.bind("xdc.runtime.knl.IThreadSupport.Priority_NORMAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.IThreadSupport.Priority_NORMAL", 3));
        om.bind("xdc.runtime.knl.IThreadSupport.Priority_ABOVE_NORMAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.IThreadSupport.Priority_ABOVE_NORMAL", 4));
        om.bind("xdc.runtime.knl.IThreadSupport.Priority_HIGHEST", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"), "xdc.runtime.knl.IThreadSupport.Priority_HIGHEST", 5));
        om.bind("xdc.runtime.knl.IThreadSupport.INVALID_OS_PRIORITY", 0L);
        om.bind("xdc.runtime.knl.IThreadSupport.GETPRI_FAILED", Global.eval("-2"));
        om.bind("xdc.runtime.knl.IThreadSupport.CompStatus_ERROR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus", "xdc.runtime.knl"), "xdc.runtime.knl.IThreadSupport.CompStatus_ERROR", xdc.services.intern.xsr.Enum.intValue(Global.eval("-2"))+0));
        om.bind("xdc.runtime.knl.IThreadSupport.CompStatus_LOWER", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus", "xdc.runtime.knl"), "xdc.runtime.knl.IThreadSupport.CompStatus_LOWER", xdc.services.intern.xsr.Enum.intValue(Global.eval("-1"))+0));
        om.bind("xdc.runtime.knl.IThreadSupport.CompStatus_EQUAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus", "xdc.runtime.knl"), "xdc.runtime.knl.IThreadSupport.CompStatus_EQUAL", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("xdc.runtime.knl.IThreadSupport.CompStatus_HIGHER", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus", "xdc.runtime.knl"), "xdc.runtime.knl.IThreadSupport.CompStatus_HIGHER", xdc.services.intern.xsr.Enum.intValue(1L)+0));
    }

    void GateH_Proxy$$CONSTS()
    {
        // module GateH_Proxy
        om.bind("xdc.runtime.knl.GateH_Proxy.query", new Extern("xdc_runtime_knl_GateH_Proxy_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
    }

    void Semaphore_Proxy$$CONSTS()
    {
        // module Semaphore_Proxy
    }

    void Thread_Proxy$$CONSTS()
    {
        // module Thread_Proxy
        om.bind("xdc.runtime.knl.Thread_Proxy.self", new Extern("xdc_runtime_knl_Thread_Proxy_self__E", "xdc_runtime_knl_IThreadSupport_Handle(*)(xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Thread_Proxy.start", new Extern("xdc_runtime_knl_Thread_Proxy_start__E", "xdc_Bool(*)(xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Thread_Proxy.yield", new Extern("xdc_runtime_knl_Thread_Proxy_yield__E", "xdc_Bool(*)(xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Thread_Proxy.compareOsPriorities", new Extern("xdc_runtime_knl_Thread_Proxy_compareOsPriorities__E", "xdc_Int(*)(xdc_Int,xdc_Int,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Thread_Proxy.sleep", new Extern("xdc_runtime_knl_Thread_Proxy_sleep__E", "xdc_Bool(*)(xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void Sync_Proxy$$CONSTS()
    {
        // module Sync_Proxy
    }

    void GateThread_Proxy$$CONSTS()
    {
        // module GateThread_Proxy
        om.bind("xdc.runtime.knl.GateThread_Proxy.query", new Extern("xdc_runtime_knl_GateThread_Proxy_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
    }

    void GateProcess_Proxy$$CONSTS()
    {
        // module GateProcess_Proxy
        om.bind("xdc.runtime.knl.GateProcess_Proxy.query", new Extern("xdc_runtime_knl_GateProcess_Proxy_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
    }

    void SemThread_Proxy$$CONSTS()
    {
        // module SemThread_Proxy
    }

    void SemProcess_Proxy$$CONSTS()
    {
        // module SemProcess_Proxy
    }

    void Cache_Proxy$$CONSTS()
    {
        // module Cache_Proxy
        om.bind("xdc.runtime.knl.Cache_Proxy.inv", new Extern("xdc_runtime_knl_Cache_Proxy_inv__E", "xdc_Bool(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Cache_Proxy.wb", new Extern("xdc_runtime_knl_Cache_Proxy_wb__E", "xdc_Bool(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Cache_Proxy.wbInv", new Extern("xdc_runtime_knl_Cache_Proxy_wbInv__E", "xdc_Bool(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_runtime_Error_Block*)", true, false));
        om.bind("xdc.runtime.knl.Cache_Proxy.wait", new Extern("xdc_runtime_knl_Cache_Proxy_wait__E", "xdc_Bool(*)(xdc_runtime_Error_Block*)", true, false));
    }

    void GateH$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Semaphore$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Thread$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$Thread$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.Thread.create() called before xdc.useModule('xdc.runtime.knl.Thread')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.fxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.Thread$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.Thread.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.Thread.Instance", "xdc.runtime.knl"), 2, 1, false));
                        fxn.addArg(0, "fxn", new Proto.Adr("xdc_Void(*)(xdc_IArg)", "PFv"), $$UNDEF);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.Thread.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$Thread$$create = function( fxn, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.Thread'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.Thread.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {fxn:fxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.Thread'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [fxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.Thread'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.Thread$$construct", new Proto.Fxn(om.findStrict("xdc.runtime.knl.Thread.Module", "xdc.runtime.knl"), null, 3, 1, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.runtime.knl.Thread$$Object", "xdc.runtime.knl"), null);
                        fxn.addArg(1, "fxn", new Proto.Adr("xdc_Void(*)(xdc_IArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.runtime.knl.Thread.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$Thread$$construct = function( __obj, fxn, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.Thread'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {fxn:fxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['xdc.runtime.knl.Thread'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.Thread'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Sync$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void GateThread$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateThread$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.GateThread.create() called before xdc.useModule('xdc.runtime.knl.GateThread')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateThread$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateThread.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.GateThread.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateThread.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateThread$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateThread'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.GateThread.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.GateThread'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateThread'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateThread$$construct", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateThread.Module", "xdc.runtime.knl"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.runtime.knl.GateThread$$Object", "xdc.runtime.knl"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateThread.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateThread$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateThread'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['xdc.runtime.knl.GateThread'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateThread'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void GateProcess$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateProcess$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.GateProcess.create() called before xdc.useModule('xdc.runtime.knl.GateProcess')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateProcess$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateProcess.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.GateProcess.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateProcess.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateProcess$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateProcess'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.GateProcess.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.GateProcess'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateProcess'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateProcess$$construct", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateProcess.Module", "xdc.runtime.knl"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.runtime.knl.GateProcess$$Object", "xdc.runtime.knl"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateProcess.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateProcess$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateProcess'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['xdc.runtime.knl.GateProcess'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateProcess'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void ISemaphore$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void SemThread$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SemThread$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.SemThread.create() called before xdc.useModule('xdc.runtime.knl.SemThread')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.count, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SemThread$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SemThread.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.SemThread.Instance", "xdc.runtime.knl"), 2, 1, false));
                        fxn.addArg(0, "count", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.SemThread.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SemThread$$create = function( count, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SemThread'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.SemThread.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {count:count});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.SemThread'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [count]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SemThread'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SemThread$$construct", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SemThread.Module", "xdc.runtime.knl"), null, 3, 1, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.runtime.knl.SemThread$$Object", "xdc.runtime.knl"), null);
                        fxn.addArg(1, "count", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.runtime.knl.SemThread.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SemThread$$construct = function( __obj, count, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SemThread'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {count:count});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['xdc.runtime.knl.SemThread'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SemThread'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void SemProcess$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SemProcess$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.SemProcess.create() called before xdc.useModule('xdc.runtime.knl.SemProcess')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.count, inst.$args.key, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SemProcess$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SemProcess.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.SemProcess.Instance", "xdc.runtime.knl"), 3, 2, false));
                        fxn.addArg(0, "count", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "key", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.runtime.knl.SemProcess.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SemProcess$$create = function( count, key, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SemProcess'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.SemProcess.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {count:count, key:key});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.SemProcess'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [count, key]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SemProcess'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SemProcess$$construct", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SemProcess.Module", "xdc.runtime.knl"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.runtime.knl.SemProcess$$Object", "xdc.runtime.knl"), null);
                        fxn.addArg(1, "count", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "key", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("xdc.runtime.knl.SemProcess.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SemProcess$$construct = function( __obj, count, key, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SemProcess'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {count:count, key:key});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['xdc.runtime.knl.SemProcess'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SemProcess'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void ISync$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void SyncGeneric$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SyncGeneric$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.SyncGeneric.create() called before xdc.useModule('xdc.runtime.knl.SyncGeneric')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SyncGeneric$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SyncGeneric.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.SyncGeneric.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.SyncGeneric.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SyncGeneric$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SyncGeneric'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.SyncGeneric.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.SyncGeneric'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SyncGeneric'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SyncGeneric$$construct", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SyncGeneric.Module", "xdc.runtime.knl"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.runtime.knl.SyncGeneric$$Object", "xdc.runtime.knl"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.SyncGeneric.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SyncGeneric$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SyncGeneric'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['xdc.runtime.knl.SyncGeneric'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SyncGeneric'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void SyncNull$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SyncNull$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.SyncNull.create() called before xdc.useModule('xdc.runtime.knl.SyncNull')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SyncNull$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SyncNull.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.SyncNull.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.SyncNull.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SyncNull$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SyncNull'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.SyncNull.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.SyncNull'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SyncNull'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SyncNull$$construct", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SyncNull.Module", "xdc.runtime.knl"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.runtime.knl.SyncNull$$Object", "xdc.runtime.knl"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.SyncNull.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SyncNull$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SyncNull'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['xdc.runtime.knl.SyncNull'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SyncNull'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void SyncSemThread$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SyncSemThread$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.SyncSemThread.create() called before xdc.useModule('xdc.runtime.knl.SyncSemThread')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SyncSemThread$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SyncSemThread.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.SyncSemThread.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.SyncSemThread.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SyncSemThread$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SyncSemThread'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.SyncSemThread.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.SyncSemThread'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SyncSemThread'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SyncSemThread$$construct", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SyncSemThread.Module", "xdc.runtime.knl"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.runtime.knl.SyncSemThread$$Object", "xdc.runtime.knl"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.SyncSemThread.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SyncSemThread$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SyncSemThread'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['xdc.runtime.knl.SyncSemThread'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SyncSemThread'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Cache$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ICacheSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void CacheSupportNull$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IGateThreadSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void GateThreadSupportNull$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateThreadSupportNull$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.GateThreadSupportNull.create() called before xdc.useModule('xdc.runtime.knl.GateThreadSupportNull')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateThreadSupportNull$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateThreadSupportNull$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateThreadSupportNull'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.GateThreadSupportNull.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.GateThreadSupportNull'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateThreadSupportNull'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateThreadSupportNull$$construct", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Module", "xdc.runtime.knl"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.runtime.knl.GateThreadSupportNull$$Object", "xdc.runtime.knl"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateThreadSupportNull$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateThreadSupportNull'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['xdc.runtime.knl.GateThreadSupportNull'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateThreadSupportNull'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void IGateProcessSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void GateProcessSupportNull$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateProcessSupportNull$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.GateProcessSupportNull.create() called before xdc.useModule('xdc.runtime.knl.GateProcessSupportNull')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateProcessSupportNull$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateProcessSupportNull$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateProcessSupportNull'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.GateProcessSupportNull.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.GateProcessSupportNull'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateProcessSupportNull'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateProcessSupportNull$$construct", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Module", "xdc.runtime.knl"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.runtime.knl.GateProcessSupportNull$$Object", "xdc.runtime.knl"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateProcessSupportNull$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateProcessSupportNull'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['xdc.runtime.knl.GateProcessSupportNull'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateProcessSupportNull'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void ISemThreadSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ISemProcessSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IThreadSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void GateH_Proxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateH_Proxy$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.GateH_Proxy.create() called before xdc.useModule('xdc.runtime.knl.GateH_Proxy')\");\n");
                sb.append("}\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateH_Proxy$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateH_Proxy.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.GateH_Proxy.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateH_Proxy.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateH_Proxy$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateH_Proxy'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.GateH_Proxy.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.GateH_Proxy'].Instance_State);\n");
                sb.append("if (!__mod.delegate$) {\n");
                    sb.append("throw new Error(\"Unbound proxy module: xdc.runtime.knl.GateH_Proxy\");\n");
                sb.append("}\n");
                sb.append("var __dmod = __mod.delegate$.$orig;\n");
                sb.append("var __dinst = __dmod.create(__params);\n");
                sb.append("__inst.$$bind('delegate$', __dinst);\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateH_Proxy'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Semaphore_Proxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$Semaphore_Proxy$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.Semaphore_Proxy.create() called before xdc.useModule('xdc.runtime.knl.Semaphore_Proxy')\");\n");
                sb.append("}\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.Semaphore_Proxy$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$Semaphore_Proxy$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.Semaphore_Proxy'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.Semaphore_Proxy.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.Semaphore_Proxy'].Instance_State);\n");
                sb.append("if (!__mod.delegate$) {\n");
                    sb.append("throw new Error(\"Unbound proxy module: xdc.runtime.knl.Semaphore_Proxy\");\n");
                sb.append("}\n");
                sb.append("var __dmod = __mod.delegate$.$orig;\n");
                sb.append("var __dinst = __dmod.create(__params);\n");
                sb.append("__inst.$$bind('delegate$', __dinst);\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.Semaphore_Proxy'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Thread_Proxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$Thread_Proxy$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.Thread_Proxy.create() called before xdc.useModule('xdc.runtime.knl.Thread_Proxy')\");\n");
                sb.append("}\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.Thread_Proxy$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.Thread_Proxy.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.Thread_Proxy.Instance", "xdc.runtime.knl"), 2, 1, false));
                        fxn.addArg(0, "fxn", new Proto.Adr("xdc_Void(*)(xdc_IArg)", "PFv"), $$UNDEF);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.Thread_Proxy.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$Thread_Proxy$$create = function( fxn, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.Thread_Proxy'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.Thread_Proxy.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {fxn:fxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.Thread_Proxy'].Instance_State);\n");
                sb.append("if (!__mod.delegate$) {\n");
                    sb.append("throw new Error(\"Unbound proxy module: xdc.runtime.knl.Thread_Proxy\");\n");
                sb.append("}\n");
                sb.append("var __dmod = __mod.delegate$.$orig;\n");
                sb.append("var __dinst = __dmod.create(fxn, __params);\n");
                sb.append("__inst.$$bind('delegate$', __dinst);\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [fxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.Thread_Proxy'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Sync_Proxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$Sync_Proxy$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.Sync_Proxy.create() called before xdc.useModule('xdc.runtime.knl.Sync_Proxy')\");\n");
                sb.append("}\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.Sync_Proxy$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.Sync_Proxy.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.Sync_Proxy.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.Sync_Proxy.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$Sync_Proxy$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.Sync_Proxy'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.Sync_Proxy.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.Sync_Proxy'].Instance_State);\n");
                sb.append("if (!__mod.delegate$) {\n");
                    sb.append("throw new Error(\"Unbound proxy module: xdc.runtime.knl.Sync_Proxy\");\n");
                sb.append("}\n");
                sb.append("var __dmod = __mod.delegate$.$orig;\n");
                sb.append("var __dinst = __dmod.create(__params);\n");
                sb.append("__inst.$$bind('delegate$', __dinst);\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.Sync_Proxy'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void GateThread_Proxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateThread_Proxy$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.GateThread_Proxy.create() called before xdc.useModule('xdc.runtime.knl.GateThread_Proxy')\");\n");
                sb.append("}\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateThread_Proxy$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateThread_Proxy.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.GateThread_Proxy.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateThread_Proxy.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateThread_Proxy$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateThread_Proxy'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.GateThread_Proxy.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.GateThread_Proxy'].Instance_State);\n");
                sb.append("if (!__mod.delegate$) {\n");
                    sb.append("throw new Error(\"Unbound proxy module: xdc.runtime.knl.GateThread_Proxy\");\n");
                sb.append("}\n");
                sb.append("var __dmod = __mod.delegate$.$orig;\n");
                sb.append("var __dinst = __dmod.create(__params);\n");
                sb.append("__inst.$$bind('delegate$', __dinst);\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateThread_Proxy'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void GateProcess_Proxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateProcess_Proxy$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.GateProcess_Proxy.create() called before xdc.useModule('xdc.runtime.knl.GateProcess_Proxy')\");\n");
                sb.append("}\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.GateProcess_Proxy$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Instance", "xdc.runtime.knl"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$GateProcess_Proxy$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.GateProcess_Proxy'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.GateProcess_Proxy.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.GateProcess_Proxy'].Instance_State);\n");
                sb.append("if (!__mod.delegate$) {\n");
                    sb.append("throw new Error(\"Unbound proxy module: xdc.runtime.knl.GateProcess_Proxy\");\n");
                sb.append("}\n");
                sb.append("var __dmod = __mod.delegate$.$orig;\n");
                sb.append("var __dinst = __dmod.create(__params);\n");
                sb.append("__inst.$$bind('delegate$', __dinst);\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.GateProcess_Proxy'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void SemThread_Proxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SemThread_Proxy$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.SemThread_Proxy.create() called before xdc.useModule('xdc.runtime.knl.SemThread_Proxy')\");\n");
                sb.append("}\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SemThread_Proxy$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SemThread_Proxy.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.SemThread_Proxy.Instance", "xdc.runtime.knl"), 2, 1, false));
                        fxn.addArg(0, "count", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.runtime.knl.SemThread_Proxy.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SemThread_Proxy$$create = function( count, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SemThread_Proxy'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.SemThread_Proxy.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {count:count});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.SemThread_Proxy'].Instance_State);\n");
                sb.append("if (!__mod.delegate$) {\n");
                    sb.append("throw new Error(\"Unbound proxy module: xdc.runtime.knl.SemThread_Proxy\");\n");
                sb.append("}\n");
                sb.append("var __dmod = __mod.delegate$.$orig;\n");
                sb.append("var __dinst = __dmod.create(count, __params);\n");
                sb.append("__inst.$$bind('delegate$', __dinst);\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [count]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SemThread_Proxy'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void SemProcess_Proxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SemProcess_Proxy$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function xdc.runtime.knl.SemProcess_Proxy.create() called before xdc.useModule('xdc.runtime.knl.SemProcess_Proxy')\");\n");
                sb.append("}\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("xdc.runtime.knl.SemProcess_Proxy$$create", new Proto.Fxn(om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Module", "xdc.runtime.knl"), om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Instance", "xdc.runtime.knl"), 3, 2, false));
                        fxn.addArg(0, "count", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "key", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Params", "xdc.runtime.knl"), Global.newObject());
            sb = new StringBuilder();
            sb.append("xdc$runtime$knl$SemProcess_Proxy$$create = function( count, key, __params ) {\n");
                sb.append("var __mod = xdc.om['xdc.runtime.knl.SemProcess_Proxy'];\n");
                sb.append("var __inst = xdc.om['xdc.runtime.knl.SemProcess_Proxy.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['xdc.runtime.knl']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {count:count, key:key});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['xdc.runtime.knl.SemProcess_Proxy'].Instance_State);\n");
                sb.append("if (!__mod.delegate$) {\n");
                    sb.append("throw new Error(\"Unbound proxy module: xdc.runtime.knl.SemProcess_Proxy\");\n");
                sb.append("}\n");
                sb.append("var __dmod = __mod.delegate$.$orig;\n");
                sb.append("var __dinst = __dmod.create(count, key, __params);\n");
                sb.append("__inst.$$bind('delegate$', __dinst);\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [count, key]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['xdc.runtime.knl.SemProcess_Proxy'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Cache_Proxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void GateH$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Semaphore$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Thread$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Sync$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateThread$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateProcess$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ISemaphore$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SemThread$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SemProcess$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ISync$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SyncGeneric$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SyncNull$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SyncSemThread$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cache$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ICacheSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void CacheSupportNull$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IGateThreadSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateThreadSupportNull$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IGateProcessSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateProcessSupportNull$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ISemThreadSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ISemProcessSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IThreadSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateH_Proxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Semaphore_Proxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Thread_Proxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Sync_Proxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateThread_Proxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateProcess_Proxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SemThread_Proxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SemProcess_Proxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cache_Proxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateH$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Semaphore$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Thread$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.Thread.Stat", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("stackSize", "USize"));
        sizes.add(Global.newArray("stackUsed", "USize"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.Thread.Stat']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.Thread.Stat']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.Thread.Stat'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.runtime.knl.Thread.Instance_State", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("proxyHandle", "UPtr"));
        sizes.add(Global.newArray("tls", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.Thread.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.Thread.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.Thread.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Sync$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void GateThread$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.GateThread.Instance_State", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("proxyHandle", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.GateThread.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.GateThread.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.GateThread.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void GateProcess$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.GateProcess.Instance_State", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("proxyHandle", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.GateProcess.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.GateProcess.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.GateProcess.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void ISemaphore$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void SemThread$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.SemThread.Instance_State", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("proxyHandle", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.SemThread.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.SemThread.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.SemThread.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void SemProcess$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.SemProcess.Instance_State", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("proxyHandle", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.SemProcess.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.SemProcess.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.SemProcess.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void ISync$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void SyncGeneric$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.SyncGeneric.Instance_State", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("userSignal", "UFxn"));
        sizes.add(Global.newArray("signalArg", "UIArg"));
        sizes.add(Global.newArray("userWait", "UFxn"));
        sizes.add(Global.newArray("waitArg", "UIArg"));
        sizes.add(Global.newArray("userQuery", "UFxn"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.SyncGeneric.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.SyncGeneric.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.SyncGeneric.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void SyncNull$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.SyncNull.Instance_State", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.SyncNull.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.SyncNull.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.SyncNull.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void SyncSemThread$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.SyncSemThread.Instance_State", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("semThread", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.SyncSemThread.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.SyncSemThread.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.SyncSemThread.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Cache$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void ICacheSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void CacheSupportNull$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void IGateThreadSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void GateThreadSupportNull$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Instance_State", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.GateThreadSupportNull.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.GateThreadSupportNull.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.GateThreadSupportNull.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void IGateProcessSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void GateProcessSupportNull$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Instance_State", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.GateProcessSupportNull.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.GateProcessSupportNull.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.GateProcessSupportNull.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void ISemThreadSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void ISemProcessSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void IThreadSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.runtime.knl.IThreadSupport.Stat", "xdc.runtime.knl");
        sizes.clear();
        sizes.add(Global.newArray("stackSize", "USize"));
        sizes.add(Global.newArray("stackUsed", "USize"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.runtime.knl.IThreadSupport.Stat']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.runtime.knl.IThreadSupport.Stat']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.runtime.knl.IThreadSupport.Stat'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void GateH_Proxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Semaphore_Proxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Thread_Proxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Sync_Proxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void GateThread_Proxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void GateProcess_Proxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void SemThread_Proxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void SemProcess_Proxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Cache_Proxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void GateH$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/GateH.xs");
        om.bind("xdc.runtime.knl.GateH$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateH.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateH.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFldV("Proxy", (Proto)om.findStrict("xdc.runtime.IGateProvider.Module", "xdc.runtime.knl"), null, "wh", $$delegGet, $$delegSet);
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.GateH$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.GateH$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.GateH$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.GateH$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Semaphore$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/Semaphore.xs");
        om.bind("xdc.runtime.knl.Semaphore$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Semaphore.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Semaphore.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFldV("Proxy", (Proto)om.findStrict("xdc.runtime.knl.ISemaphore.Module", "xdc.runtime.knl"), null, "wh", $$delegGet, $$delegSet);
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.Semaphore$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.Semaphore$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.Semaphore$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.Semaphore$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Thread$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/Thread.xs");
        om.bind("xdc.runtime.knl.Thread$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INVALID_OS_PRIORITY", Proto.Elm.newCNum("(xdc_Int)"), 0L, "rh");
                po.addFld("GETPRI_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-2"), "rh");
        if (isCFG) {
            po.addFldV("Proxy", (Proto)om.findStrict("xdc.runtime.knl.IThreadSupport.Module", "xdc.runtime.knl"), null, "wh", $$delegGet, $$delegSet);
            po.addFld("A_zeroTimeout", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "xdc.runtime.knl"), Global.newObject("msg", "A_zeroTimeout: Timeout value annot be zero"), "w");
            po.addFld("defaultStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 0L, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.Thread$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$Thread$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.runtime.knl.Thread$$construct", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$Thread$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.Thread$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.Thread$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.Thread$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.Thread$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.Thread$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.Thread$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INVALID_OS_PRIORITY", Proto.Elm.newCNum("(xdc_Int)"), 0L, "rh");
                po.addFld("GETPRI_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-2"), "rh");
        if (isCFG) {
            po.addFld("arg", new Proto.Adr("xdc_IArg", "Pv"), 0L, "w");
            po.addFld("priority", (Proto)om.findStrict("xdc.runtime.knl.Thread.Priority", "xdc.runtime.knl"), om.find("xdc.runtime.knl.Thread.Priority_NORMAL"), "w");
            po.addFld("osPriority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
            po.addFld("stackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 0L, "w");
            po.addFld("tls", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INVALID_OS_PRIORITY", Proto.Elm.newCNum("(xdc_Int)"), 0L, "rh");
                po.addFld("GETPRI_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-2"), "rh");
        if (isCFG) {
            po.addFld("arg", new Proto.Adr("xdc_IArg", "Pv"), 0L, "w");
            po.addFld("priority", (Proto)om.findStrict("xdc.runtime.knl.Thread.Priority", "xdc.runtime.knl"), om.find("xdc.runtime.knl.Thread.Priority_NORMAL"), "w");
            po.addFld("osPriority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
            po.addFld("stackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 0L, "w");
            po.addFld("tls", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread.Object", om.findStrict("xdc.runtime.knl.Thread.Instance", "xdc.runtime.knl"));
        // typedef Thread.RunFxn
        om.bind("xdc.runtime.knl.Thread.RunFxn", new Proto.Adr("xdc_Void(*)(xdc_IArg)", "PFv"));
        // struct Thread.Stat
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread$$Stat", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread.Stat", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("stackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("stackUsed", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
        // struct Thread.Instance_State
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("proxyHandle", (Proto)om.findStrict("xdc.runtime.knl.Thread_Proxy.Handle", "xdc.runtime.knl"), $$UNDEF, "w");
                po.addFld("tls", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void Sync$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/Sync.xs");
        om.bind("xdc.runtime.knl.Sync$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Sync.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Sync.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
            po.addFldV("Proxy", (Proto)om.findStrict("xdc.runtime.knl.ISync.Module", "xdc.runtime.knl"), null, "wh", $$delegGet, $$delegSet);
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.Sync$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.Sync$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.Sync$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.Sync$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void GateThread$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/GateThread.xs");
        om.bind("xdc.runtime.knl.GateThread$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThread.Module", om.findStrict("xdc.runtime.IGateProvider.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFldV("Proxy", (Proto)om.findStrict("xdc.runtime.knl.IGateThreadSupport.Module", "xdc.runtime.knl"), null, "wh", $$delegGet, $$delegSet);
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateThread$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateThread$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateThread$$construct", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateThread$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.GateThread$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.GateThread$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.GateThread$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.GateThread$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.GateThread$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.GateThread$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "queryMeta");
                if (fxn != null) po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "xdc.runtime.knl"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThread.Instance", om.findStrict("xdc.runtime.IGateProvider.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThread.Params", om.findStrict("xdc.runtime.IGateProvider$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThread.Object", om.findStrict("xdc.runtime.knl.GateThread.Instance", "xdc.runtime.knl"));
        // struct GateThread.Instance_State
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThread.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("proxyHandle", (Proto)om.findStrict("xdc.runtime.knl.GateThread_Proxy.Handle", "xdc.runtime.knl"), $$UNDEF, "w");
    }

    void GateProcess$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/GateProcess.xs");
        om.bind("xdc.runtime.knl.GateProcess$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcess.Module", om.findStrict("xdc.runtime.IGateProvider.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
            po.addFldV("Proxy", (Proto)om.findStrict("xdc.runtime.knl.IGateProcessSupport.Module", "xdc.runtime.knl"), null, "wh", $$delegGet, $$delegSet);
            po.addFld("A_invalidKey", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "xdc.runtime.knl"), Global.newObject("msg", "A_invalidKey: the key must be set to a non-default value"), "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateProcess$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateProcess$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateProcess$$construct", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateProcess$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.GateProcess$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.GateProcess$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.GateProcess$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.GateProcess$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.GateProcess$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.GateProcess$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "queryMeta");
                if (fxn != null) po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "xdc.runtime.knl"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcess.Instance", om.findStrict("xdc.runtime.IGateProvider.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
            po.addFld("key", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcess.Params", om.findStrict("xdc.runtime.IGateProvider$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
            po.addFld("key", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcess.Object", om.findStrict("xdc.runtime.knl.GateProcess.Instance", "xdc.runtime.knl"));
        // struct GateProcess.Instance_State
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcess.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("proxyHandle", (Proto)om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Handle", "xdc.runtime.knl"), $$UNDEF, "w");
    }

    void ISemaphore$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemaphore.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISemaphore.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemaphore.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISemaphore.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFld("mode", (Proto)om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"), om.find("xdc.runtime.knl.ISemaphore.Mode_COUNTING"), "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemaphore$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISemaphore.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFld("mode", (Proto)om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"), om.find("xdc.runtime.knl.ISemaphore.Mode_COUNTING"), "w");
        }//isCFG
    }

    void SemThread$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/SemThread.xs");
        om.bind("xdc.runtime.knl.SemThread$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemThread.Module", om.findStrict("xdc.runtime.knl.ISemaphore.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFldV("Proxy", (Proto)om.findStrict("xdc.runtime.knl.ISemThreadSupport.Module", "xdc.runtime.knl"), null, "wh", $$delegGet, $$delegSet);
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SemThread$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SemThread$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SemThread$$construct", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SemThread$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.SemThread$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SemThread$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SemThread$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SemThread$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.SemThread$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SemThread$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemThread.Instance", om.findStrict("xdc.runtime.knl.ISemaphore.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemThread.Params", om.findStrict("xdc.runtime.knl.ISemaphore$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemThread.Object", om.findStrict("xdc.runtime.knl.SemThread.Instance", "xdc.runtime.knl"));
        // struct SemThread.Instance_State
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemThread.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("proxyHandle", (Proto)om.findStrict("xdc.runtime.knl.SemThread_Proxy.Handle", "xdc.runtime.knl"), $$UNDEF, "w");
    }

    void SemProcess$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/SemProcess.xs");
        om.bind("xdc.runtime.knl.SemProcess$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemProcess.Module", om.findStrict("xdc.runtime.knl.ISemaphore.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFldV("Proxy", (Proto)om.findStrict("xdc.runtime.knl.ISemProcessSupport.Module", "xdc.runtime.knl"), null, "wh", $$delegGet, $$delegSet);
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SemProcess$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SemProcess$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SemProcess$$construct", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SemProcess$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.SemProcess$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SemProcess$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SemProcess$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SemProcess$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.SemProcess$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SemProcess$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemProcess.Instance", om.findStrict("xdc.runtime.knl.ISemaphore.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemProcess.Params", om.findStrict("xdc.runtime.knl.ISemaphore$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemProcess.Object", om.findStrict("xdc.runtime.knl.SemProcess.Instance", "xdc.runtime.knl"));
        // struct SemProcess.Instance_State
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemProcess.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("proxyHandle", (Proto)om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Handle", "xdc.runtime.knl"), $$UNDEF, "w");
    }

    void ISync$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISync.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISync.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISync.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISync.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISync$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISync.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
        }//isCFG
    }

    void SyncGeneric$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/SyncGeneric.xs");
        om.bind("xdc.runtime.knl.SyncGeneric$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncGeneric.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncGeneric.Module", om.findStrict("xdc.runtime.knl.ISync.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SyncGeneric$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SyncGeneric$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SyncGeneric$$construct", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SyncGeneric$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncGeneric$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncGeneric$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncGeneric$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncGeneric$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncGeneric$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncGeneric$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncGeneric.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncGeneric.Instance", om.findStrict("xdc.runtime.knl.ISync.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
            po.addFld("userSignal", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), null, "w");
            po.addFld("signalArg", new Proto.Adr("xdc_UArg", "Pv"), null, "w");
            po.addFld("userWait", new Proto.Adr("xdc_Bool(*)(xdc_UArg,xdc_UInt)", "PFb"), null, "w");
            po.addFld("waitArg", new Proto.Adr("xdc_UArg", "Pv"), null, "w");
            po.addFld("userQuery", new Proto.Adr("xdc_Bool(*)(xdc_Int)", "PFb"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncGeneric$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncGeneric.Params", om.findStrict("xdc.runtime.knl.ISync$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
            po.addFld("userSignal", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), null, "w");
            po.addFld("signalArg", new Proto.Adr("xdc_UArg", "Pv"), null, "w");
            po.addFld("userWait", new Proto.Adr("xdc_Bool(*)(xdc_UArg,xdc_UInt)", "PFb"), null, "w");
            po.addFld("waitArg", new Proto.Adr("xdc_UArg", "Pv"), null, "w");
            po.addFld("userQuery", new Proto.Adr("xdc_Bool(*)(xdc_Int)", "PFb"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncGeneric$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncGeneric.Object", om.findStrict("xdc.runtime.knl.SyncGeneric.Instance", "xdc.runtime.knl"));
        // typedef SyncGeneric.SignalFunc
        om.bind("xdc.runtime.knl.SyncGeneric.SignalFunc", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"));
        // typedef SyncGeneric.WaitFunc
        om.bind("xdc.runtime.knl.SyncGeneric.WaitFunc", new Proto.Adr("xdc_Bool(*)(xdc_UArg,xdc_UInt)", "PFb"));
        // typedef SyncGeneric.QueryFunc
        om.bind("xdc.runtime.knl.SyncGeneric.QueryFunc", new Proto.Adr("xdc_Bool(*)(xdc_Int)", "PFb"));
        // struct SyncGeneric.Instance_State
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncGeneric$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncGeneric.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("userSignal", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("signalArg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("userWait", new Proto.Adr("xdc_Bool(*)(xdc_UArg,xdc_UInt)", "PFb"), $$UNDEF, "w");
                po.addFld("waitArg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("userQuery", new Proto.Adr("xdc_Bool(*)(xdc_Int)", "PFb"), $$UNDEF, "w");
    }

    void SyncNull$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/SyncNull.xs");
        om.bind("xdc.runtime.knl.SyncNull$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncNull.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncNull.Module", om.findStrict("xdc.runtime.knl.ISync.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SyncNull$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SyncNull$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SyncNull$$construct", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SyncNull$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncNull$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncNull$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncNull$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncNull$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncNull$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncNull$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncNull.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncNull.Instance", om.findStrict("xdc.runtime.knl.ISync.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncNull$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncNull.Params", om.findStrict("xdc.runtime.knl.ISync$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncNull$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncNull.Object", om.findStrict("xdc.runtime.knl.SyncNull.Instance", "xdc.runtime.knl"));
        // struct SyncNull.Instance_State
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncNull$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncNull.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncNull$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncNull.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void SyncSemThread$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/SyncSemThread.xs");
        om.bind("xdc.runtime.knl.SyncSemThread$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncSemThread.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncSemThread.Module", om.findStrict("xdc.runtime.knl.ISync.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SyncSemThread$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SyncSemThread$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SyncSemThread$$construct", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SyncSemThread$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncSemThread$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncSemThread$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncSemThread$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncSemThread$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncSemThread$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.SyncSemThread$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncSemThread.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncSemThread.Instance", om.findStrict("xdc.runtime.knl.ISync.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncSemThread$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncSemThread.Params", om.findStrict("xdc.runtime.knl.ISync$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncSemThread$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncSemThread.Object", om.findStrict("xdc.runtime.knl.SyncSemThread.Instance", "xdc.runtime.knl"));
        // struct SyncSemThread.Instance_State
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncSemThread$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SyncSemThread.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("semThread", (Proto)om.findStrict("xdc.runtime.knl.SemThread.Handle", "xdc.runtime.knl"), $$UNDEF, "w");
    }

    void Cache$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/Cache.xs");
        om.bind("xdc.runtime.knl.Cache$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Cache.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Cache.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFldV("Proxy", (Proto)om.findStrict("xdc.runtime.knl.ICacheSupport.Module", "xdc.runtime.knl"), null, "wh", $$delegGet, $$delegSet);
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.runtime.knl.Cache$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.runtime.knl.Cache$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("xdc.runtime.knl.Cache$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.runtime.knl.Cache$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void ICacheSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ICacheSupport.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ICacheSupport.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
    }

    void CacheSupportNull$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.CacheSupportNull.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.CacheSupportNull.Module", om.findStrict("xdc.runtime.knl.ICacheSupport.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
    }

    void IGateThreadSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IGateThreadSupport.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.IGateThreadSupport.Module", om.findStrict("xdc.runtime.IGateProvider.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IGateThreadSupport.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.IGateThreadSupport.Instance", om.findStrict("xdc.runtime.IGateProvider.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IGateThreadSupport$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.IGateThreadSupport.Params", om.findStrict("xdc.runtime.IGateProvider$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
        }//isCFG
    }

    void GateThreadSupportNull$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThreadSupportNull.Module", om.findStrict("xdc.runtime.knl.IGateThreadSupport.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateThreadSupportNull$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateThreadSupportNull$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateThreadSupportNull$$construct", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateThreadSupportNull$$construct"));
        }//isCFG
                po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "xdc.runtime.knl"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThreadSupportNull.Instance", om.findStrict("xdc.runtime.knl.IGateThreadSupport.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThreadSupportNull.Params", om.findStrict("xdc.runtime.knl.IGateThreadSupport$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThreadSupportNull.Object", om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Instance", "xdc.runtime.knl"));
        // struct GateThreadSupportNull.Instance_State
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThreadSupportNull.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThreadSupportNull.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void IGateProcessSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IGateProcessSupport.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.IGateProcessSupport.Module", om.findStrict("xdc.runtime.knl.IGateThreadSupport.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IGateProcessSupport.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.IGateProcessSupport.Instance", om.findStrict("xdc.runtime.knl.IGateThreadSupport.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
            po.addFld("key", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IGateProcessSupport$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.IGateProcessSupport.Params", om.findStrict("xdc.runtime.knl.IGateThreadSupport$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
            po.addFld("key", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
        }//isCFG
    }

    void GateProcessSupportNull$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcessSupportNull.Module", om.findStrict("xdc.runtime.knl.IGateProcessSupport.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateProcessSupportNull$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateProcessSupportNull$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateProcessSupportNull$$construct", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateProcessSupportNull$$construct"));
        }//isCFG
                po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "xdc.runtime.knl"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcessSupportNull.Instance", om.findStrict("xdc.runtime.knl.IGateProcessSupport.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcessSupportNull.Params", om.findStrict("xdc.runtime.knl.IGateProcessSupport$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcessSupportNull.Object", om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Instance", "xdc.runtime.knl"));
        // struct GateProcessSupportNull.Instance_State
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcessSupportNull.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcessSupportNull.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void ISemThreadSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemThreadSupport.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISemThreadSupport.Module", om.findStrict("xdc.runtime.knl.ISemaphore.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemThreadSupport.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISemThreadSupport.Instance", om.findStrict("xdc.runtime.knl.ISemaphore.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemThreadSupport$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISemThreadSupport.Params", om.findStrict("xdc.runtime.knl.ISemaphore$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
        }//isCFG
    }

    void ISemProcessSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemProcessSupport.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISemProcessSupport.Module", om.findStrict("xdc.runtime.knl.ISemaphore.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemProcessSupport.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISemProcessSupport.Instance", om.findStrict("xdc.runtime.knl.ISemaphore.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemProcessSupport$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.ISemProcessSupport.Params", om.findStrict("xdc.runtime.knl.ISemaphore$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
        }//isCFG
    }

    void IThreadSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IThreadSupport.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.IThreadSupport.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INVALID_OS_PRIORITY", Proto.Elm.newCNum("(xdc_Int)"), 0L, "rh");
                po.addFld("GETPRI_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-2"), "rh");
        if (isCFG) {
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IThreadSupport.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.IThreadSupport.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INVALID_OS_PRIORITY", Proto.Elm.newCNum("(xdc_Int)"), 0L, "rh");
                po.addFld("GETPRI_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-2"), "rh");
        if (isCFG) {
            po.addFld("arg", new Proto.Adr("xdc_IArg", "Pv"), null, "w");
            po.addFld("priority", (Proto)om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"), om.find("xdc.runtime.knl.IThreadSupport.Priority_NORMAL"), "w");
            po.addFld("osPriority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
            po.addFld("stackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 0L, "w");
            po.addFld("tls", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IThreadSupport$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.IThreadSupport.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INVALID_OS_PRIORITY", Proto.Elm.newCNum("(xdc_Int)"), 0L, "rh");
                po.addFld("GETPRI_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-2"), "rh");
        if (isCFG) {
            po.addFld("arg", new Proto.Adr("xdc_IArg", "Pv"), null, "w");
            po.addFld("priority", (Proto)om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"), om.find("xdc.runtime.knl.IThreadSupport.Priority_NORMAL"), "w");
            po.addFld("osPriority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
            po.addFld("stackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 0L, "w");
            po.addFld("tls", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
        }//isCFG
        // typedef IThreadSupport.RunFxn
        om.bind("xdc.runtime.knl.IThreadSupport.RunFxn", new Proto.Adr("xdc_Void(*)(xdc_IArg)", "PFv"));
        // struct IThreadSupport.Stat
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IThreadSupport$$Stat", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.IThreadSupport.Stat", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("stackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("stackUsed", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
    }

    void GateH_Proxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateH_Proxy.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateH_Proxy.Module", om.findStrict("xdc.runtime.IGateProvider.Module", "xdc.runtime.knl"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.IGateProvider.Module", "xdc.runtime.knl"), null, "wh");
                po.addFld("abstractInstances$", $$T_Bool, false, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateH_Proxy$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateH_Proxy$$create"));
        }//isCFG
                po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "xdc.runtime.knl"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateH_Proxy.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateH_Proxy.Instance", om.findStrict("xdc.runtime.IGateProvider.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateH_Proxy$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateH_Proxy.Params", om.findStrict("xdc.runtime.IGateProvider$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateH_Proxy$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateH_Proxy.Object", om.findStrict("xdc.runtime.knl.GateH_Proxy.Instance", "xdc.runtime.knl"));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateH_Proxy$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateH_Proxy.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void Semaphore_Proxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Semaphore_Proxy.Module", om.findStrict("xdc.runtime.knl.ISemaphore.Module", "xdc.runtime.knl"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.knl.ISemaphore.Module", "xdc.runtime.knl"), null, "wh");
                po.addFld("abstractInstances$", $$T_Bool, false, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.Semaphore_Proxy$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$Semaphore_Proxy$$create"));
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Semaphore_Proxy.Instance", om.findStrict("xdc.runtime.knl.ISemaphore.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFldV("mode", (Proto)om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"), om.find("xdc.runtime.knl.ISemaphore.Mode_COUNTING"), "w", $$proxyGet, $$proxySet);
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Semaphore_Proxy$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Semaphore_Proxy.Params", om.findStrict("xdc.runtime.knl.ISemaphore$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFld("mode", (Proto)om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"), om.find("xdc.runtime.knl.ISemaphore.Mode_COUNTING"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Semaphore_Proxy$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Semaphore_Proxy.Object", om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Instance", "xdc.runtime.knl"));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Semaphore_Proxy$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Semaphore_Proxy.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void Thread_Proxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread_Proxy.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread_Proxy.Module", om.findStrict("xdc.runtime.knl.IThreadSupport.Module", "xdc.runtime.knl"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.knl.IThreadSupport.Module", "xdc.runtime.knl"), null, "wh");
                po.addFld("abstractInstances$", $$T_Bool, false, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INVALID_OS_PRIORITY", Proto.Elm.newCNum("(xdc_Int)"), 0L, "rh");
                po.addFld("GETPRI_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-2"), "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.Thread_Proxy$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$Thread_Proxy$$create"));
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread_Proxy.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread_Proxy.Instance", om.findStrict("xdc.runtime.knl.IThreadSupport.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INVALID_OS_PRIORITY", Proto.Elm.newCNum("(xdc_Int)"), 0L, "rh");
                po.addFld("GETPRI_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-2"), "rh");
        if (isCFG) {
            po.addFldV("arg", new Proto.Adr("xdc_IArg", "Pv"), null, "w", $$proxyGet, $$proxySet);
            po.addFldV("priority", (Proto)om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"), om.find("xdc.runtime.knl.IThreadSupport.Priority_NORMAL"), "w", $$proxyGet, $$proxySet);
            po.addFldV("osPriority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w", $$proxyGet, $$proxySet);
            po.addFldV("stackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 0L, "w", $$proxyGet, $$proxySet);
            po.addFldV("tls", new Proto.Adr("xdc_Ptr", "Pv"), null, "w", $$proxyGet, $$proxySet);
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread_Proxy$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread_Proxy.Params", om.findStrict("xdc.runtime.knl.IThreadSupport$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("INVALID_OS_PRIORITY", Proto.Elm.newCNum("(xdc_Int)"), 0L, "rh");
                po.addFld("GETPRI_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-2"), "rh");
        if (isCFG) {
            po.addFld("arg", new Proto.Adr("xdc_IArg", "Pv"), null, "w");
            po.addFld("priority", (Proto)om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"), om.find("xdc.runtime.knl.IThreadSupport.Priority_NORMAL"), "w");
            po.addFld("osPriority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
            po.addFld("stackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 0L, "w");
            po.addFld("tls", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread_Proxy$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread_Proxy.Object", om.findStrict("xdc.runtime.knl.Thread_Proxy.Instance", "xdc.runtime.knl"));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread_Proxy$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Thread_Proxy.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void Sync_Proxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Sync_Proxy.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Sync_Proxy.Module", om.findStrict("xdc.runtime.knl.ISync.Module", "xdc.runtime.knl"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.knl.ISync.Module", "xdc.runtime.knl"), null, "wh");
                po.addFld("abstractInstances$", $$T_Bool, false, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.Sync_Proxy$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$Sync_Proxy$$create"));
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Sync_Proxy.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Sync_Proxy.Instance", om.findStrict("xdc.runtime.knl.ISync.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Sync_Proxy$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Sync_Proxy.Params", om.findStrict("xdc.runtime.knl.ISync$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("WAIT_FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
                po.addFld("NO_WAIT", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Sync_Proxy$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Sync_Proxy.Object", om.findStrict("xdc.runtime.knl.Sync_Proxy.Instance", "xdc.runtime.knl"));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Sync_Proxy$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Sync_Proxy.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void GateThread_Proxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread_Proxy.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThread_Proxy.Module", om.findStrict("xdc.runtime.knl.IGateThreadSupport.Module", "xdc.runtime.knl"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.knl.IGateThreadSupport.Module", "xdc.runtime.knl"), null, "wh");
                po.addFld("abstractInstances$", $$T_Bool, false, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateThread_Proxy$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateThread_Proxy$$create"));
        }//isCFG
                po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "xdc.runtime.knl"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread_Proxy.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThread_Proxy.Instance", om.findStrict("xdc.runtime.knl.IGateThreadSupport.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread_Proxy$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThread_Proxy.Params", om.findStrict("xdc.runtime.knl.IGateThreadSupport$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread_Proxy$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThread_Proxy.Object", om.findStrict("xdc.runtime.knl.GateThread_Proxy.Instance", "xdc.runtime.knl"));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread_Proxy$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateThread_Proxy.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void GateProcess_Proxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcess_Proxy.Module", om.findStrict("xdc.runtime.knl.IGateProcessSupport.Module", "xdc.runtime.knl"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.knl.IGateProcessSupport.Module", "xdc.runtime.knl"), null, "wh");
                po.addFld("abstractInstances$", $$T_Bool, false, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.GateProcess_Proxy$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$GateProcess_Proxy$$create"));
        }//isCFG
                po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "xdc.runtime.knl"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcess_Proxy.Instance", om.findStrict("xdc.runtime.knl.IGateProcessSupport.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
            po.addFldV("key", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w", $$proxyGet, $$proxySet);
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess_Proxy$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcess_Proxy.Params", om.findStrict("xdc.runtime.knl.IGateProcessSupport$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("GETREFCOUNT_FAILED", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "rh");
        if (isCFG) {
            po.addFld("key", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess_Proxy$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcess_Proxy.Object", om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Instance", "xdc.runtime.knl"));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess_Proxy$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.GateProcess_Proxy.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void SemThread_Proxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread_Proxy.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemThread_Proxy.Module", om.findStrict("xdc.runtime.knl.ISemThreadSupport.Module", "xdc.runtime.knl"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.knl.ISemThreadSupport.Module", "xdc.runtime.knl"), null, "wh");
                po.addFld("abstractInstances$", $$T_Bool, false, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SemThread_Proxy$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SemThread_Proxy$$create"));
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread_Proxy.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemThread_Proxy.Instance", om.findStrict("xdc.runtime.knl.ISemThreadSupport.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFldV("mode", (Proto)om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"), om.find("xdc.runtime.knl.ISemaphore.Mode_COUNTING"), "w", $$proxyGet, $$proxySet);
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread_Proxy$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemThread_Proxy.Params", om.findStrict("xdc.runtime.knl.ISemThreadSupport$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFld("mode", (Proto)om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"), om.find("xdc.runtime.knl.ISemaphore.Mode_COUNTING"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread_Proxy$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemThread_Proxy.Object", om.findStrict("xdc.runtime.knl.SemThread_Proxy.Instance", "xdc.runtime.knl"));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread_Proxy$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemThread_Proxy.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void SemProcess_Proxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemProcess_Proxy.Module", om.findStrict("xdc.runtime.knl.ISemProcessSupport.Module", "xdc.runtime.knl"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.knl.ISemProcessSupport.Module", "xdc.runtime.knl"), null, "wh");
                po.addFld("abstractInstances$", $$T_Bool, false, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.runtime.knl.SemProcess_Proxy$$create", "xdc.runtime.knl"), Global.get("xdc$runtime$knl$SemProcess_Proxy$$create"));
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Instance", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemProcess_Proxy.Instance", om.findStrict("xdc.runtime.knl.ISemProcessSupport.Instance", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFldV("mode", (Proto)om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"), om.find("xdc.runtime.knl.ISemaphore.Mode_COUNTING"), "w", $$proxyGet, $$proxySet);
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess_Proxy$$Params", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemProcess_Proxy.Params", om.findStrict("xdc.runtime.knl.ISemProcessSupport$$Params", "xdc.runtime.knl"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FOREVER", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~(0)"), "rh");
        if (isCFG) {
            po.addFld("mode", (Proto)om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"), om.find("xdc.runtime.knl.ISemaphore.Mode_COUNTING"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "xdc.runtime.knl"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess_Proxy$$Object", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemProcess_Proxy.Object", om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Instance", "xdc.runtime.knl"));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess_Proxy$$Instance_State", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.SemProcess_Proxy.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void Cache_Proxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Cache_Proxy.Module", "xdc.runtime.knl");
        po.init("xdc.runtime.knl.Cache_Proxy.Module", om.findStrict("xdc.runtime.knl.ICacheSupport.Module", "xdc.runtime.knl"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.knl.ICacheSupport.Module", "xdc.runtime.knl"), null, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
    }

    void GateH$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateH", "xdc.runtime.knl");
    }

    void Semaphore$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Semaphore", "xdc.runtime.knl");
    }

    void Thread$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Thread", "xdc.runtime.knl");
        vo.bind("Stat$fetchDesc", Global.newObject("type", "xdc.runtime.knl.Thread.Stat", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread$$Stat", "xdc.runtime.knl");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "xdc.runtime.knl.Thread.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread$$Instance_State", "xdc.runtime.knl");
    }

    void Sync$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Sync", "xdc.runtime.knl");
    }

    void GateThread$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateThread", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "xdc.runtime.knl.GateThread.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread$$Instance_State", "xdc.runtime.knl");
    }

    void GateProcess$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateProcess", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "xdc.runtime.knl.GateProcess.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess$$Instance_State", "xdc.runtime.knl");
    }

    void ISemaphore$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.ISemaphore", "xdc.runtime.knl");
    }

    void SemThread$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SemThread", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "xdc.runtime.knl.SemThread.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread$$Instance_State", "xdc.runtime.knl");
    }

    void SemProcess$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SemProcess", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "xdc.runtime.knl.SemProcess.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess$$Instance_State", "xdc.runtime.knl");
    }

    void ISync$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.ISync", "xdc.runtime.knl");
    }

    void SyncGeneric$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SyncGeneric", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncGeneric$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "xdc.runtime.knl.SyncGeneric.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncGeneric$$Instance_State", "xdc.runtime.knl");
    }

    void SyncNull$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SyncNull", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncNull$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "xdc.runtime.knl.SyncNull.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncNull$$Instance_State", "xdc.runtime.knl");
    }

    void SyncSemThread$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SyncSemThread", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncSemThread$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "xdc.runtime.knl.SyncSemThread.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncSemThread$$Instance_State", "xdc.runtime.knl");
    }

    void Cache$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Cache", "xdc.runtime.knl");
    }

    void ICacheSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.ICacheSupport", "xdc.runtime.knl");
    }

    void CacheSupportNull$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.CacheSupportNull", "xdc.runtime.knl");
    }

    void IGateThreadSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.IGateThreadSupport", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IGateThreadSupport$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void GateThreadSupportNull$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "xdc.runtime.knl.GateThreadSupportNull.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull$$Instance_State", "xdc.runtime.knl");
    }

    void IGateProcessSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.IGateProcessSupport", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IGateProcessSupport$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void GateProcessSupportNull$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "xdc.runtime.knl.GateProcessSupportNull.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull$$Instance_State", "xdc.runtime.knl");
    }

    void ISemThreadSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.ISemThreadSupport", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemThreadSupport$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void ISemProcessSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.ISemProcessSupport", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemProcessSupport$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void IThreadSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.IThreadSupport", "xdc.runtime.knl");
        vo.bind("Stat$fetchDesc", Global.newObject("type", "xdc.runtime.knl.IThreadSupport.Stat", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IThreadSupport$$Stat", "xdc.runtime.knl");
    }

    void GateH_Proxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateH_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateH_Proxy$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void Semaphore_Proxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Semaphore_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Semaphore_Proxy$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void Thread_Proxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Thread_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread_Proxy$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void Sync_Proxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Sync_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Sync_Proxy$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void GateThread_Proxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateThread_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread_Proxy$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void GateProcess_Proxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateProcess_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess_Proxy$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void SemThread_Proxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SemThread_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread_Proxy$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void SemProcess_Proxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SemProcess_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess_Proxy$$Instance_State", "xdc.runtime.knl");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void Cache_Proxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Cache_Proxy", "xdc.runtime.knl");
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.runtime.knl.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.runtime.knl"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/runtime/knl/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "xdc.runtime.knl"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "xdc.runtime.knl"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "xdc.runtime.knl"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "xdc.runtime.knl"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "xdc.runtime.knl"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "xdc.runtime.knl"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "xdc.runtime.knl", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.runtime.knl");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.runtime.knl.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.runtime.knl'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.runtime.knl$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.runtime.knl$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.runtime.knl$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void GateH$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateH", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateH.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.GateH", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.GateH$$capsule", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("Proxy$proxy", om.findStrict("xdc.runtime.knl.GateH_Proxy", "xdc.runtime.knl"));
        proxies.add("Proxy");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
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
        vo.bind("enter", om.findStrict("xdc.runtime.knl.GateH.enter", "xdc.runtime.knl"));
        vo.bind("leave", om.findStrict("xdc.runtime.knl.GateH.leave", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_GateH_Module__startupDone__E", "xdc_runtime_knl_GateH_enter__E", "xdc_runtime_knl_GateH_leave__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GateH", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateH");
    }

    void Semaphore$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Semaphore", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Semaphore.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.Semaphore", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.Semaphore$$capsule", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("PendStatus", om.findStrict("xdc.runtime.knl.Semaphore.PendStatus", "xdc.runtime.knl"));
        vo.bind("Proxy$proxy", om.findStrict("xdc.runtime.knl.Semaphore_Proxy", "xdc.runtime.knl"));
        proxies.add("Proxy");
        vo.bind("PendStatus_ERROR", om.findStrict("xdc.runtime.knl.Semaphore.PendStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("PendStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.Semaphore.PendStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("PendStatus_SUCCESS", om.findStrict("xdc.runtime.knl.Semaphore.PendStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
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
        vo.bind("pend", om.findStrict("xdc.runtime.knl.Semaphore.pend", "xdc.runtime.knl"));
        vo.bind("post", om.findStrict("xdc.runtime.knl.Semaphore.post", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_Semaphore_Module__startupDone__E", "xdc_runtime_knl_Semaphore_pend__E", "xdc_runtime_knl_Semaphore_post__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Semaphore", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Semaphore");
    }

    void Thread$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Thread", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.Thread", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.Thread$$capsule", "xdc.runtime.knl"));
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.Thread.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.Thread.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.Thread.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.Thread.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("Priority", om.findStrict("xdc.runtime.knl.Thread.Priority", "xdc.runtime.knl"));
        vo.bind("CompStatus", om.findStrict("xdc.runtime.knl.Thread.CompStatus", "xdc.runtime.knl"));
        vo.bind("Proxy$proxy", om.findStrict("xdc.runtime.knl.Thread_Proxy", "xdc.runtime.knl"));
        proxies.add("Proxy");
        vo.bind("RunFxn", om.findStrict("xdc.runtime.knl.Thread.RunFxn", "xdc.runtime.knl"));
        vo.bind("Stat", om.findStrict("xdc.runtime.knl.Thread.Stat", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.Thread.Stat", "xdc.runtime.knl"));
        mcfgs.add("A_zeroTimeout");
        mcfgs.add("defaultStackSize");
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.Thread.Instance_State", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.Thread.Instance_State", "xdc.runtime.knl"));
        vo.bind("Priority_INVALID", om.findStrict("xdc.runtime.knl.Thread.Priority_INVALID", "xdc.runtime.knl"));
        vo.bind("Priority_LOWEST", om.findStrict("xdc.runtime.knl.Thread.Priority_LOWEST", "xdc.runtime.knl"));
        vo.bind("Priority_BELOW_NORMAL", om.findStrict("xdc.runtime.knl.Thread.Priority_BELOW_NORMAL", "xdc.runtime.knl"));
        vo.bind("Priority_NORMAL", om.findStrict("xdc.runtime.knl.Thread.Priority_NORMAL", "xdc.runtime.knl"));
        vo.bind("Priority_ABOVE_NORMAL", om.findStrict("xdc.runtime.knl.Thread.Priority_ABOVE_NORMAL", "xdc.runtime.knl"));
        vo.bind("Priority_HIGHEST", om.findStrict("xdc.runtime.knl.Thread.Priority_HIGHEST", "xdc.runtime.knl"));
        vo.bind("CompStatus_ERROR", om.findStrict("xdc.runtime.knl.Thread.CompStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("CompStatus_LOWER", om.findStrict("xdc.runtime.knl.Thread.CompStatus_LOWER", "xdc.runtime.knl"));
        vo.bind("CompStatus_EQUAL", om.findStrict("xdc.runtime.knl.Thread.CompStatus_EQUAL", "xdc.runtime.knl"));
        vo.bind("CompStatus_HIGHER", om.findStrict("xdc.runtime.knl.Thread.CompStatus_HIGHER", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("xdc.runtime.knl.Thread$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$Thread$$__initObject"));
        }//isCFG
        vo.bind("self", om.findStrict("xdc.runtime.knl.Thread.self", "xdc.runtime.knl"));
        vo.bind("start", om.findStrict("xdc.runtime.knl.Thread.start", "xdc.runtime.knl"));
        vo.bind("yield", om.findStrict("xdc.runtime.knl.Thread.yield", "xdc.runtime.knl"));
        vo.bind("compareOsPriorities", om.findStrict("xdc.runtime.knl.Thread.compareOsPriorities", "xdc.runtime.knl"));
        vo.bind("sleep", om.findStrict("xdc.runtime.knl.Thread.sleep", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_Thread_Handle__label__E", "xdc_runtime_knl_Thread_Module__startupDone__E", "xdc_runtime_knl_Thread_Object__create__E", "xdc_runtime_knl_Thread_Object__delete__E", "xdc_runtime_knl_Thread_Object__get__E", "xdc_runtime_knl_Thread_Object__first__E", "xdc_runtime_knl_Thread_Object__next__E", "xdc_runtime_knl_Thread_Params__init__E", "xdc_runtime_knl_Thread_self__E", "xdc_runtime_knl_Thread_start__E", "xdc_runtime_knl_Thread_yield__E", "xdc_runtime_knl_Thread_compareOsPriorities__E", "xdc_runtime_knl_Thread_sleep__E", "xdc_runtime_knl_Thread_join__E", "xdc_runtime_knl_Thread_getPriority__E", "xdc_runtime_knl_Thread_setPriority__E", "xdc_runtime_knl_Thread_getOsPriority__E", "xdc_runtime_knl_Thread_setOsPriority__E", "xdc_runtime_knl_Thread_getOsHandle__E", "xdc_runtime_knl_Thread_getTls__E", "xdc_runtime_knl_Thread_setTls__E", "xdc_runtime_knl_Thread_stat__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_zeroTimeout"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.Thread.Object", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Thread", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Thread");
    }

    void Sync$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Sync", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Sync.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.Sync", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.Sync$$capsule", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("WaitStatus", om.findStrict("xdc.runtime.knl.Sync.WaitStatus", "xdc.runtime.knl"));
        vo.bind("Proxy$proxy", om.findStrict("xdc.runtime.knl.Sync_Proxy", "xdc.runtime.knl"));
        proxies.add("Proxy");
        vo.bind("WaitStatus_ERROR", om.findStrict("xdc.runtime.knl.Sync.WaitStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("WaitStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.Sync.WaitStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("WaitStatus_SUCCESS", om.findStrict("xdc.runtime.knl.Sync.WaitStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
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
        vo.bind("query", om.findStrict("xdc.runtime.knl.Sync.query", "xdc.runtime.knl"));
        vo.bind("signal", om.findStrict("xdc.runtime.knl.Sync.signal", "xdc.runtime.knl"));
        vo.bind("wait", om.findStrict("xdc.runtime.knl.Sync.wait", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_Sync_Module__startupDone__E", "xdc_runtime_knl_Sync_query__E", "xdc_runtime_knl_Sync_signal__E", "xdc_runtime_knl_Sync_wait__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Sync", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Sync");
    }

    void GateThread$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateThread", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.GateThread", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.GateThread$$capsule", "xdc.runtime.knl"));
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.GateThread.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.GateThread.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.GateThread.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.GateThread.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("Proxy$proxy", om.findStrict("xdc.runtime.knl.GateThread_Proxy", "xdc.runtime.knl"));
        proxies.add("Proxy");
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.GateThread.Instance_State", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.GateThread.Instance_State", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("xdc.runtime.knl.GateThread$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$GateThread$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("xdc.runtime.knl.GateThread.query", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_GateThread_Handle__label__E", "xdc_runtime_knl_GateThread_Module__startupDone__E", "xdc_runtime_knl_GateThread_Object__create__E", "xdc_runtime_knl_GateThread_Object__delete__E", "xdc_runtime_knl_GateThread_Object__get__E", "xdc_runtime_knl_GateThread_Object__first__E", "xdc_runtime_knl_GateThread_Object__next__E", "xdc_runtime_knl_GateThread_Params__init__E", "xdc_runtime_knl_GateThread_query__E", "xdc_runtime_knl_GateThread_enter__E", "xdc_runtime_knl_GateThread_leave__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.GateThread.Object", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GateThread", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateThread");
    }

    void GateProcess$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateProcess", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.GateProcess", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.GateProcess$$capsule", "xdc.runtime.knl"));
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.GateProcess.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.GateProcess.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.GateProcess.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.GateProcess.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("Proxy$proxy", om.findStrict("xdc.runtime.knl.GateProcess_Proxy", "xdc.runtime.knl"));
        proxies.add("Proxy");
        mcfgs.add("A_invalidKey");
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.GateProcess.Instance_State", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.GateProcess.Instance_State", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("xdc.runtime.knl.GateProcess$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$GateProcess$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("xdc.runtime.knl.GateProcess.query", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_GateProcess_Handle__label__E", "xdc_runtime_knl_GateProcess_Module__startupDone__E", "xdc_runtime_knl_GateProcess_Object__create__E", "xdc_runtime_knl_GateProcess_Object__delete__E", "xdc_runtime_knl_GateProcess_Object__get__E", "xdc_runtime_knl_GateProcess_Object__first__E", "xdc_runtime_knl_GateProcess_Object__next__E", "xdc_runtime_knl_GateProcess_Params__init__E", "xdc_runtime_knl_GateProcess_query__E", "xdc_runtime_knl_GateProcess_enter__E", "xdc_runtime_knl_GateProcess_leave__E", "xdc_runtime_knl_GateProcess_getReferenceCount__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_invalidKey"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.GateProcess.Object", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GateProcess", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateProcess");
    }

    void ISemaphore$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.ISemaphore", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemaphore.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.ISemaphore", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.ISemaphore.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.ISemaphore.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.ISemaphore.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.ISemaphore.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        vo.bind("Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        vo.bind("PendStatus_ERROR", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("PendStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("PendStatus_SUCCESS", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("Mode_COUNTING", om.findStrict("xdc.runtime.knl.ISemaphore.Mode_COUNTING", "xdc.runtime.knl"));
        vo.bind("Mode_BINARY", om.findStrict("xdc.runtime.knl.ISemaphore.Mode_BINARY", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ISemaphore", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ISemaphore");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void SemThread$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SemThread", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.SemThread", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.SemThread$$capsule", "xdc.runtime.knl"));
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.SemThread.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.SemThread.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.SemThread.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.SemThread.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        vo.bind("Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        vo.bind("Proxy$proxy", om.findStrict("xdc.runtime.knl.SemThread_Proxy", "xdc.runtime.knl"));
        proxies.add("Proxy");
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.SemThread.Instance_State", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.SemThread.Instance_State", "xdc.runtime.knl"));
        vo.bind("PendStatus_ERROR", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("PendStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("PendStatus_SUCCESS", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("Mode_COUNTING", om.findStrict("xdc.runtime.knl.ISemaphore.Mode_COUNTING", "xdc.runtime.knl"));
        vo.bind("Mode_BINARY", om.findStrict("xdc.runtime.knl.ISemaphore.Mode_BINARY", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("xdc.runtime.knl.SemThread$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$SemThread$$__initObject"));
        }//isCFG
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_SemThread_Handle__label__E", "xdc_runtime_knl_SemThread_Module__startupDone__E", "xdc_runtime_knl_SemThread_Object__create__E", "xdc_runtime_knl_SemThread_Object__delete__E", "xdc_runtime_knl_SemThread_Object__get__E", "xdc_runtime_knl_SemThread_Object__first__E", "xdc_runtime_knl_SemThread_Object__next__E", "xdc_runtime_knl_SemThread_Params__init__E", "xdc_runtime_knl_SemThread_pend__E", "xdc_runtime_knl_SemThread_post__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.SemThread.Object", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("SemThread", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SemThread");
    }

    void SemProcess$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SemProcess", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.SemProcess", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.SemProcess$$capsule", "xdc.runtime.knl"));
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.SemProcess.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.SemProcess.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.SemProcess.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.SemProcess.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        vo.bind("Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        vo.bind("Proxy$proxy", om.findStrict("xdc.runtime.knl.SemProcess_Proxy", "xdc.runtime.knl"));
        proxies.add("Proxy");
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.SemProcess.Instance_State", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.SemProcess.Instance_State", "xdc.runtime.knl"));
        vo.bind("PendStatus_ERROR", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("PendStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("PendStatus_SUCCESS", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("Mode_COUNTING", om.findStrict("xdc.runtime.knl.ISemaphore.Mode_COUNTING", "xdc.runtime.knl"));
        vo.bind("Mode_BINARY", om.findStrict("xdc.runtime.knl.ISemaphore.Mode_BINARY", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("xdc.runtime.knl.SemProcess$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$SemProcess$$__initObject"));
        }//isCFG
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_SemProcess_Handle__label__E", "xdc_runtime_knl_SemProcess_Module__startupDone__E", "xdc_runtime_knl_SemProcess_Object__create__E", "xdc_runtime_knl_SemProcess_Object__delete__E", "xdc_runtime_knl_SemProcess_Object__get__E", "xdc_runtime_knl_SemProcess_Object__first__E", "xdc_runtime_knl_SemProcess_Object__next__E", "xdc_runtime_knl_SemProcess_Params__init__E", "xdc_runtime_knl_SemProcess_pend__E", "xdc_runtime_knl_SemProcess_post__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.SemProcess.Object", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("SemProcess", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SemProcess");
    }

    void ISync$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.ISync", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISync.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.ISync", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.ISync.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.ISync.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.ISync.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.ISync.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("WaitStatus", om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"));
        vo.bind("WaitStatus_ERROR", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("WaitStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("WaitStatus_SUCCESS", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ISync", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ISync");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void SyncGeneric$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SyncGeneric", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncGeneric.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.SyncGeneric", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.SyncGeneric$$capsule", "xdc.runtime.knl"));
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.SyncGeneric.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.SyncGeneric.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.SyncGeneric.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.SyncGeneric.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("WaitStatus", om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"));
        vo.bind("SignalFunc", om.findStrict("xdc.runtime.knl.SyncGeneric.SignalFunc", "xdc.runtime.knl"));
        vo.bind("WaitFunc", om.findStrict("xdc.runtime.knl.SyncGeneric.WaitFunc", "xdc.runtime.knl"));
        vo.bind("QueryFunc", om.findStrict("xdc.runtime.knl.SyncGeneric.QueryFunc", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.SyncGeneric.Instance_State", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.SyncGeneric.Instance_State", "xdc.runtime.knl"));
        vo.bind("WaitStatus_ERROR", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("WaitStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("WaitStatus_SUCCESS", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("xdc.runtime.knl.SyncGeneric$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$SyncGeneric$$__initObject"));
        }//isCFG
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_SyncGeneric_Handle__label__E", "xdc_runtime_knl_SyncGeneric_Module__startupDone__E", "xdc_runtime_knl_SyncGeneric_Object__create__E", "xdc_runtime_knl_SyncGeneric_Object__delete__E", "xdc_runtime_knl_SyncGeneric_Object__get__E", "xdc_runtime_knl_SyncGeneric_Object__first__E", "xdc_runtime_knl_SyncGeneric_Object__next__E", "xdc_runtime_knl_SyncGeneric_Params__init__E", "xdc_runtime_knl_SyncGeneric_query__E", "xdc_runtime_knl_SyncGeneric_signal__E", "xdc_runtime_knl_SyncGeneric_wait__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.SyncGeneric.Object", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("SyncGeneric", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SyncGeneric");
    }

    void SyncNull$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SyncNull", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncNull.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.SyncNull", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.SyncNull$$capsule", "xdc.runtime.knl"));
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.SyncNull.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.SyncNull.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.SyncNull.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.SyncNull.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("WaitStatus", om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.SyncNull.Instance_State", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.SyncNull.Instance_State", "xdc.runtime.knl"));
        vo.bind("WaitStatus_ERROR", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("WaitStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("WaitStatus_SUCCESS", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
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
            vo.bind("__initObject", Global.get("xdc$runtime$knl$SyncNull$$__initObject"));
        }//isCFG
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_SyncNull_Handle__label__E", "xdc_runtime_knl_SyncNull_Module__startupDone__E", "xdc_runtime_knl_SyncNull_Object__create__E", "xdc_runtime_knl_SyncNull_Object__delete__E", "xdc_runtime_knl_SyncNull_Object__get__E", "xdc_runtime_knl_SyncNull_Object__first__E", "xdc_runtime_knl_SyncNull_Object__next__E", "xdc_runtime_knl_SyncNull_Params__init__E", "xdc_runtime_knl_SyncNull_query__E", "xdc_runtime_knl_SyncNull_signal__E", "xdc_runtime_knl_SyncNull_wait__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.SyncNull.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.SyncNull.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("SyncNull", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SyncNull");
    }

    void SyncSemThread$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SyncSemThread", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SyncSemThread.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.SyncSemThread", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.SyncSemThread$$capsule", "xdc.runtime.knl"));
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.SyncSemThread.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.SyncSemThread.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.SyncSemThread.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.SyncSemThread.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("WaitStatus", om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.SyncSemThread.Instance_State", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.SyncSemThread.Instance_State", "xdc.runtime.knl"));
        vo.bind("WaitStatus_ERROR", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("WaitStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("WaitStatus_SUCCESS", om.findStrict("xdc.runtime.knl.ISync.WaitStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("xdc.runtime.knl.SyncSemThread$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$SyncSemThread$$__initObject"));
        }//isCFG
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_SyncSemThread_Handle__label__E", "xdc_runtime_knl_SyncSemThread_Module__startupDone__E", "xdc_runtime_knl_SyncSemThread_Object__create__E", "xdc_runtime_knl_SyncSemThread_Object__delete__E", "xdc_runtime_knl_SyncSemThread_Object__get__E", "xdc_runtime_knl_SyncSemThread_Object__first__E", "xdc_runtime_knl_SyncSemThread_Object__next__E", "xdc_runtime_knl_SyncSemThread_Params__init__E", "xdc_runtime_knl_SyncSemThread_query__E", "xdc_runtime_knl_SyncSemThread_signal__E", "xdc_runtime_knl_SyncSemThread_wait__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.SyncSemThread.Object", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("SyncSemThread", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SyncSemThread");
    }

    void Cache$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Cache", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Cache.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.Cache", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.runtime.knl.Cache$$capsule", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("Proxy$proxy", om.findStrict("xdc.runtime.knl.Cache_Proxy", "xdc.runtime.knl"));
        proxies.add("Proxy");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
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
        vo.bind("inv", om.findStrict("xdc.runtime.knl.Cache.inv", "xdc.runtime.knl"));
        vo.bind("wb", om.findStrict("xdc.runtime.knl.Cache.wb", "xdc.runtime.knl"));
        vo.bind("wbInv", om.findStrict("xdc.runtime.knl.Cache.wbInv", "xdc.runtime.knl"));
        vo.bind("wait", om.findStrict("xdc.runtime.knl.Cache.wait", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_Cache_Module__startupDone__E", "xdc_runtime_knl_Cache_inv__E", "xdc_runtime_knl_Cache_wb__E", "xdc_runtime_knl_Cache_wbInv__E", "xdc_runtime_knl_Cache_wait__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Cache", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Cache");
    }

    void ICacheSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.ICacheSupport", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ICacheSupport.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.ICacheSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ICacheSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ICacheSupport");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void CacheSupportNull$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.CacheSupportNull", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.CacheSupportNull.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.CacheSupportNull", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
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
        vo.bind("inv", om.findStrict("xdc.runtime.knl.CacheSupportNull.inv", "xdc.runtime.knl"));
        vo.bind("wb", om.findStrict("xdc.runtime.knl.CacheSupportNull.wb", "xdc.runtime.knl"));
        vo.bind("wbInv", om.findStrict("xdc.runtime.knl.CacheSupportNull.wbInv", "xdc.runtime.knl"));
        vo.bind("wait", om.findStrict("xdc.runtime.knl.CacheSupportNull.wait", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_CacheSupportNull_Module__startupDone__E", "xdc_runtime_knl_CacheSupportNull_inv__E", "xdc_runtime_knl_CacheSupportNull_wb__E", "xdc_runtime_knl_CacheSupportNull_wbInv__E", "xdc_runtime_knl_CacheSupportNull_wait__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("CacheSupportNull", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("CacheSupportNull");
    }

    void IGateThreadSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.IGateThreadSupport", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IGateThreadSupport.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.IGateThreadSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.IGateThreadSupport.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.IGateThreadSupport.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.IGateThreadSupport.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.IGateThreadSupport.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IGateThreadSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IGateThreadSupport");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void GateThreadSupportNull$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.GateThreadSupportNull", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Instance_State", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Instance_State", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
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
            vo.bind("__initObject", Global.get("xdc$runtime$knl$GateThreadSupportNull$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("xdc.runtime.knl.GateThreadSupportNull.query", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_GateThreadSupportNull_Handle__label__E", "xdc_runtime_knl_GateThreadSupportNull_Module__startupDone__E", "xdc_runtime_knl_GateThreadSupportNull_Object__create__E", "xdc_runtime_knl_GateThreadSupportNull_Object__delete__E", "xdc_runtime_knl_GateThreadSupportNull_Object__get__E", "xdc_runtime_knl_GateThreadSupportNull_Object__first__E", "xdc_runtime_knl_GateThreadSupportNull_Object__next__E", "xdc_runtime_knl_GateThreadSupportNull_Params__init__E", "xdc_runtime_knl_GateThreadSupportNull_query__E", "xdc_runtime_knl_GateThreadSupportNull_enter__E", "xdc_runtime_knl_GateThreadSupportNull_leave__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.GateThreadSupportNull.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GateThreadSupportNull", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateThreadSupportNull");
    }

    void IGateProcessSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.IGateProcessSupport", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IGateProcessSupport.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.IGateProcessSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.IGateProcessSupport.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.IGateProcessSupport.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.IGateProcessSupport.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.IGateProcessSupport.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IGateProcessSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IGateProcessSupport");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void GateProcessSupportNull$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.GateProcessSupportNull", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
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
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Instance_State", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Instance_State", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
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
            vo.bind("__initObject", Global.get("xdc$runtime$knl$GateProcessSupportNull$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("xdc.runtime.knl.GateProcessSupportNull.query", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_GateProcessSupportNull_Handle__label__E", "xdc_runtime_knl_GateProcessSupportNull_Module__startupDone__E", "xdc_runtime_knl_GateProcessSupportNull_Object__create__E", "xdc_runtime_knl_GateProcessSupportNull_Object__delete__E", "xdc_runtime_knl_GateProcessSupportNull_Object__get__E", "xdc_runtime_knl_GateProcessSupportNull_Object__first__E", "xdc_runtime_knl_GateProcessSupportNull_Object__next__E", "xdc_runtime_knl_GateProcessSupportNull_Params__init__E", "xdc_runtime_knl_GateProcessSupportNull_query__E", "xdc_runtime_knl_GateProcessSupportNull_enter__E", "xdc_runtime_knl_GateProcessSupportNull_leave__E", "xdc_runtime_knl_GateProcessSupportNull_getReferenceCount__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.GateProcessSupportNull.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GateProcessSupportNull", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateProcessSupportNull");
    }

    void ISemThreadSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.ISemThreadSupport", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemThreadSupport.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.ISemThreadSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.ISemThreadSupport.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.ISemThreadSupport.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.ISemThreadSupport.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.ISemThreadSupport.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        vo.bind("Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        vo.bind("PendStatus_ERROR", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("PendStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("PendStatus_SUCCESS", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("Mode_COUNTING", om.findStrict("xdc.runtime.knl.ISemaphore.Mode_COUNTING", "xdc.runtime.knl"));
        vo.bind("Mode_BINARY", om.findStrict("xdc.runtime.knl.ISemaphore.Mode_BINARY", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ISemThreadSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ISemThreadSupport");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ISemProcessSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.ISemProcessSupport", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.ISemProcessSupport.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.ISemProcessSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.ISemProcessSupport.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.ISemProcessSupport.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.ISemProcessSupport.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.ISemProcessSupport.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        vo.bind("Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        vo.bind("PendStatus_ERROR", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("PendStatus_TIMEOUT", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_TIMEOUT", "xdc.runtime.knl"));
        vo.bind("PendStatus_SUCCESS", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus_SUCCESS", "xdc.runtime.knl"));
        vo.bind("Mode_COUNTING", om.findStrict("xdc.runtime.knl.ISemaphore.Mode_COUNTING", "xdc.runtime.knl"));
        vo.bind("Mode_BINARY", om.findStrict("xdc.runtime.knl.ISemaphore.Mode_BINARY", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ISemProcessSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ISemProcessSupport");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void IThreadSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.IThreadSupport", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.IThreadSupport.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.IThreadSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.IThreadSupport.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.IThreadSupport.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.IThreadSupport.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.IThreadSupport.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("Priority", om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"));
        vo.bind("CompStatus", om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus", "xdc.runtime.knl"));
        vo.bind("RunFxn", om.findStrict("xdc.runtime.knl.IThreadSupport.RunFxn", "xdc.runtime.knl"));
        vo.bind("Stat", om.findStrict("xdc.runtime.knl.IThreadSupport.Stat", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.IThreadSupport.Stat", "xdc.runtime.knl"));
        vo.bind("Priority_INVALID", om.findStrict("xdc.runtime.knl.IThreadSupport.Priority_INVALID", "xdc.runtime.knl"));
        vo.bind("Priority_LOWEST", om.findStrict("xdc.runtime.knl.IThreadSupport.Priority_LOWEST", "xdc.runtime.knl"));
        vo.bind("Priority_BELOW_NORMAL", om.findStrict("xdc.runtime.knl.IThreadSupport.Priority_BELOW_NORMAL", "xdc.runtime.knl"));
        vo.bind("Priority_NORMAL", om.findStrict("xdc.runtime.knl.IThreadSupport.Priority_NORMAL", "xdc.runtime.knl"));
        vo.bind("Priority_ABOVE_NORMAL", om.findStrict("xdc.runtime.knl.IThreadSupport.Priority_ABOVE_NORMAL", "xdc.runtime.knl"));
        vo.bind("Priority_HIGHEST", om.findStrict("xdc.runtime.knl.IThreadSupport.Priority_HIGHEST", "xdc.runtime.knl"));
        vo.bind("CompStatus_ERROR", om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus_ERROR", "xdc.runtime.knl"));
        vo.bind("CompStatus_LOWER", om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus_LOWER", "xdc.runtime.knl"));
        vo.bind("CompStatus_EQUAL", om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus_EQUAL", "xdc.runtime.knl"));
        vo.bind("CompStatus_HIGHER", om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus_HIGHER", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IThreadSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IThreadSupport");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void GateH_Proxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateH_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateH_Proxy.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.GateH_Proxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.GateH_Proxy.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.GateH_Proxy.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.GateH_Proxy.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.GateH_Proxy.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$GateH_Proxy$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("xdc.runtime.knl.GateH_Proxy.query", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_GateH_Proxy_DELEGATE__Handle__label", "xdc_runtime_knl_GateH_Proxy_DELEGATE__Module__startupDone", "xdc_runtime_knl_GateH_Proxy_DELEGATE__Object__create", "xdc_runtime_knl_GateH_Proxy_DELEGATE__Object__delete", "xdc_runtime_knl_GateH_Proxy_DELEGATE__Object__get", "xdc_runtime_knl_GateH_Proxy_DELEGATE__Object__first", "xdc_runtime_knl_GateH_Proxy_DELEGATE__Object__next", "xdc_runtime_knl_GateH_Proxy_DELEGATE__Params__init", "xdc_runtime_knl_GateH_Proxy_DELEGATE__Proxy__abstract", "xdc_runtime_knl_GateH_Proxy_DELEGATE__Proxy__delegate", "xdc_runtime_knl_GateH_Proxy_DELEGATE__queryMeta", "xdc_runtime_knl_GateH_Proxy_DELEGATE__query", "xdc_runtime_knl_GateH_Proxy_DELEGATE__enter", "xdc_runtime_knl_GateH_Proxy_DELEGATE__leave"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.GateH_Proxy.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.GateH_Proxy.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GateH_Proxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateH_Proxy");
    }

    void Semaphore_Proxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Semaphore_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.Semaphore_Proxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        vo.bind("Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$Semaphore_Proxy$$__initObject"));
        }//isCFG
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_Semaphore_Proxy_DELEGATE__Handle__label", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__Module__startupDone", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__Object__create", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__Object__delete", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__Object__get", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__Object__first", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__Object__next", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__Params__init", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__Proxy__abstract", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__Proxy__delegate", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__pend", "xdc_runtime_knl_Semaphore_Proxy_DELEGATE__post"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.Semaphore_Proxy.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Semaphore_Proxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Semaphore_Proxy");
    }

    void Thread_Proxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Thread_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Thread_Proxy.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.Thread_Proxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.Thread_Proxy.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.Thread_Proxy.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.Thread_Proxy.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.Thread_Proxy.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("Priority", om.findStrict("xdc.runtime.knl.IThreadSupport.Priority", "xdc.runtime.knl"));
        vo.bind("CompStatus", om.findStrict("xdc.runtime.knl.IThreadSupport.CompStatus", "xdc.runtime.knl"));
        vo.bind("RunFxn", om.findStrict("xdc.runtime.knl.IThreadSupport.RunFxn", "xdc.runtime.knl"));
        vo.bind("Stat", om.findStrict("xdc.runtime.knl.IThreadSupport.Stat", "xdc.runtime.knl"));
        tdefs.add(om.findStrict("xdc.runtime.knl.IThreadSupport.Stat", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$Thread_Proxy$$__initObject"));
        }//isCFG
        vo.bind("self", om.findStrict("xdc.runtime.knl.Thread_Proxy.self", "xdc.runtime.knl"));
        vo.bind("start", om.findStrict("xdc.runtime.knl.Thread_Proxy.start", "xdc.runtime.knl"));
        vo.bind("yield", om.findStrict("xdc.runtime.knl.Thread_Proxy.yield", "xdc.runtime.knl"));
        vo.bind("compareOsPriorities", om.findStrict("xdc.runtime.knl.Thread_Proxy.compareOsPriorities", "xdc.runtime.knl"));
        vo.bind("sleep", om.findStrict("xdc.runtime.knl.Thread_Proxy.sleep", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_Thread_Proxy_DELEGATE__Handle__label", "xdc_runtime_knl_Thread_Proxy_DELEGATE__Module__startupDone", "xdc_runtime_knl_Thread_Proxy_DELEGATE__Object__create", "xdc_runtime_knl_Thread_Proxy_DELEGATE__Object__delete", "xdc_runtime_knl_Thread_Proxy_DELEGATE__Object__get", "xdc_runtime_knl_Thread_Proxy_DELEGATE__Object__first", "xdc_runtime_knl_Thread_Proxy_DELEGATE__Object__next", "xdc_runtime_knl_Thread_Proxy_DELEGATE__Params__init", "xdc_runtime_knl_Thread_Proxy_DELEGATE__Proxy__abstract", "xdc_runtime_knl_Thread_Proxy_DELEGATE__Proxy__delegate", "xdc_runtime_knl_Thread_Proxy_DELEGATE__self", "xdc_runtime_knl_Thread_Proxy_DELEGATE__start", "xdc_runtime_knl_Thread_Proxy_DELEGATE__yield", "xdc_runtime_knl_Thread_Proxy_DELEGATE__compareOsPriorities", "xdc_runtime_knl_Thread_Proxy_DELEGATE__sleep", "xdc_runtime_knl_Thread_Proxy_DELEGATE__join", "xdc_runtime_knl_Thread_Proxy_DELEGATE__getPriority", "xdc_runtime_knl_Thread_Proxy_DELEGATE__setPriority", "xdc_runtime_knl_Thread_Proxy_DELEGATE__getOsPriority", "xdc_runtime_knl_Thread_Proxy_DELEGATE__setOsPriority", "xdc_runtime_knl_Thread_Proxy_DELEGATE__getOsHandle", "xdc_runtime_knl_Thread_Proxy_DELEGATE__getTls", "xdc_runtime_knl_Thread_Proxy_DELEGATE__setTls", "xdc_runtime_knl_Thread_Proxy_DELEGATE__stat"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.Thread_Proxy.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.Thread_Proxy.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Thread_Proxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Thread_Proxy");
    }

    void Sync_Proxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Sync_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Sync_Proxy.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.Sync_Proxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.Sync_Proxy.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.Sync_Proxy.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.Sync_Proxy.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.Sync_Proxy.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("WaitStatus", om.findStrict("xdc.runtime.knl.ISync.WaitStatus", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$Sync_Proxy$$__initObject"));
        }//isCFG
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_Sync_Proxy_DELEGATE__Handle__label", "xdc_runtime_knl_Sync_Proxy_DELEGATE__Module__startupDone", "xdc_runtime_knl_Sync_Proxy_DELEGATE__Object__create", "xdc_runtime_knl_Sync_Proxy_DELEGATE__Object__delete", "xdc_runtime_knl_Sync_Proxy_DELEGATE__Object__get", "xdc_runtime_knl_Sync_Proxy_DELEGATE__Object__first", "xdc_runtime_knl_Sync_Proxy_DELEGATE__Object__next", "xdc_runtime_knl_Sync_Proxy_DELEGATE__Params__init", "xdc_runtime_knl_Sync_Proxy_DELEGATE__Proxy__abstract", "xdc_runtime_knl_Sync_Proxy_DELEGATE__Proxy__delegate", "xdc_runtime_knl_Sync_Proxy_DELEGATE__query", "xdc_runtime_knl_Sync_Proxy_DELEGATE__signal", "xdc_runtime_knl_Sync_Proxy_DELEGATE__wait"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.Sync_Proxy.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.Sync_Proxy.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Sync_Proxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Sync_Proxy");
    }

    void GateThread_Proxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateThread_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateThread_Proxy.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.GateThread_Proxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.GateThread_Proxy.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.GateThread_Proxy.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.GateThread_Proxy.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.GateThread_Proxy.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$GateThread_Proxy$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("xdc.runtime.knl.GateThread_Proxy.query", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_GateThread_Proxy_DELEGATE__Handle__label", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__Module__startupDone", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__Object__create", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__Object__delete", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__Object__get", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__Object__first", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__Object__next", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__Params__init", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__Proxy__abstract", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__Proxy__delegate", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__queryMeta", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__query", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__enter", "xdc_runtime_knl_GateThread_Proxy_DELEGATE__leave"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.GateThread_Proxy.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.GateThread_Proxy.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GateThread_Proxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateThread_Proxy");
    }

    void GateProcess_Proxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.GateProcess_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.GateProcess_Proxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$GateProcess_Proxy$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("xdc.runtime.knl.GateProcess_Proxy.query", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_GateProcess_Proxy_DELEGATE__Handle__label", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__Module__startupDone", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__Object__create", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__Object__delete", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__Object__get", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__Object__first", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__Object__next", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__Params__init", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__Proxy__abstract", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__Proxy__delegate", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__queryMeta", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__query", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__enter", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__leave", "xdc_runtime_knl_GateProcess_Proxy_DELEGATE__getReferenceCount"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.GateProcess_Proxy.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GateProcess_Proxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateProcess_Proxy");
    }

    void SemThread_Proxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SemThread_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemThread_Proxy.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.SemThread_Proxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.SemThread_Proxy.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.SemThread_Proxy.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.SemThread_Proxy.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.SemThread_Proxy.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        vo.bind("Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$SemThread_Proxy$$__initObject"));
        }//isCFG
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_SemThread_Proxy_DELEGATE__Handle__label", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__Module__startupDone", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__Object__create", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__Object__delete", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__Object__get", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__Object__first", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__Object__next", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__Params__init", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__Proxy__abstract", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__Proxy__delegate", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__pend", "xdc_runtime_knl_SemThread_Proxy_DELEGATE__post"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.SemThread_Proxy.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.SemThread_Proxy.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("SemThread_Proxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SemThread_Proxy");
    }

    void SemProcess_Proxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.SemProcess_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.SemProcess_Proxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Instance", "xdc.runtime.knl"));
        vo.bind("Params", om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Params", "xdc.runtime.knl"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Params", "xdc.runtime.knl")).newInstance());
        vo.bind("Handle", om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Handle", "xdc.runtime.knl"));
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("PendStatus", om.findStrict("xdc.runtime.knl.ISemaphore.PendStatus", "xdc.runtime.knl"));
        vo.bind("Mode", om.findStrict("xdc.runtime.knl.ISemaphore.Mode", "xdc.runtime.knl"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
            vo.bind("__initObject", Global.get("xdc$runtime$knl$SemProcess_Proxy$$__initObject"));
        }//isCFG
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_SemProcess_Proxy_DELEGATE__Handle__label", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__Module__startupDone", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__Object__create", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__Object__delete", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__Object__get", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__Object__first", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__Object__next", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__Params__init", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__Proxy__abstract", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__Proxy__delegate", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__pend", "xdc_runtime_knl_SemProcess_Proxy_DELEGATE__post"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Object", "xdc.runtime.knl"));
        vo.bind("Instance_State", om.findStrict("xdc.runtime.knl.SemProcess_Proxy.Instance_State", "xdc.runtime.knl"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("SemProcess_Proxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SemProcess_Proxy");
    }

    void Cache_Proxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.runtime.knl.Cache_Proxy", "xdc.runtime.knl");
        po = (Proto.Obj)om.findStrict("xdc.runtime.knl.Cache_Proxy.Module", "xdc.runtime.knl");
        vo.init2(po, "xdc.runtime.knl.Cache_Proxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("xdc.runtime.knl", "xdc.runtime.knl"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime.knl");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.runtime.knl")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("inv", om.findStrict("xdc.runtime.knl.Cache_Proxy.inv", "xdc.runtime.knl"));
        vo.bind("wb", om.findStrict("xdc.runtime.knl.Cache_Proxy.wb", "xdc.runtime.knl"));
        vo.bind("wbInv", om.findStrict("xdc.runtime.knl.Cache_Proxy.wbInv", "xdc.runtime.knl"));
        vo.bind("wait", om.findStrict("xdc.runtime.knl.Cache_Proxy.wait", "xdc.runtime.knl"));
        vo.bind("$$fxntab", Global.newArray("xdc_runtime_knl_Cache_Proxy_DELEGATE__Handle__label", "xdc_runtime_knl_Cache_Proxy_DELEGATE__Module__startupDone", "xdc_runtime_knl_Cache_Proxy_DELEGATE__Object__create", "xdc_runtime_knl_Cache_Proxy_DELEGATE__Object__delete", "xdc_runtime_knl_Cache_Proxy_DELEGATE__Object__get", "xdc_runtime_knl_Cache_Proxy_DELEGATE__Object__first", "xdc_runtime_knl_Cache_Proxy_DELEGATE__Object__next", "xdc_runtime_knl_Cache_Proxy_DELEGATE__Params__init", "xdc_runtime_knl_Cache_Proxy_DELEGATE__Proxy__abstract", "xdc_runtime_knl_Cache_Proxy_DELEGATE__Proxy__delegate", "xdc_runtime_knl_Cache_Proxy_DELEGATE__inv", "xdc_runtime_knl_Cache_Proxy_DELEGATE__wb", "xdc_runtime_knl_Cache_Proxy_DELEGATE__wbInv", "xdc_runtime_knl_Cache_Proxy_DELEGATE__wait"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Cache_Proxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Cache_Proxy");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.Thread", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.GateThread", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.GateProcess", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.SemThread", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.SemProcess", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.SyncGeneric", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.SyncNull", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.SyncSemThread", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.GateThreadSupportNull", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.GateProcessSupportNull", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.GateH_Proxy", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.Semaphore_Proxy", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.Thread_Proxy", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.Sync_Proxy", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.GateThread_Proxy", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.GateProcess_Proxy", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.SemThread_Proxy", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("xdc.runtime.knl.SemProcess_Proxy", "xdc.runtime.knl")).findStrict("PARAMS", "xdc.runtime.knl");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.GateH", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.Semaphore", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.Thread", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.Sync", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.GateThread", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.GateProcess", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.SemThread", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.SemProcess", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.SyncGeneric", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.SyncNull", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.SyncSemThread", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.Cache", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.CacheSupportNull", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.GateThreadSupportNull", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.GateProcessSupportNull", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.GateH_Proxy", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.Semaphore_Proxy", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.Thread_Proxy", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.Sync_Proxy", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.GateThread_Proxy", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.GateProcess_Proxy", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.SemThread_Proxy", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.SemProcess_Proxy", "xdc.runtime.knl"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.runtime.knl.Cache_Proxy", "xdc.runtime.knl"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.runtime.knl.GateH")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.Semaphore")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.Thread")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.Sync")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.GateThread")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.GateProcess")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.ISemaphore")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.SemThread")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.SemProcess")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.ISync")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.SyncGeneric")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.SyncNull")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.SyncSemThread")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.Cache")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.ICacheSupport")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.CacheSupportNull")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.IGateThreadSupport")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.GateThreadSupportNull")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.IGateProcessSupport")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.GateProcessSupportNull")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.ISemThreadSupport")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.ISemProcessSupport")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.IThreadSupport")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.GateH_Proxy")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.Semaphore_Proxy")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.Thread_Proxy")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.Sync_Proxy")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.GateThread_Proxy")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.GateProcess_Proxy")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.SemThread_Proxy")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.SemProcess_Proxy")).bless();
        ((Value.Obj)om.getv("xdc.runtime.knl.Cache_Proxy")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.runtime.knl")).add(pkgV);
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
        GateH$$OBJECTS();
        Semaphore$$OBJECTS();
        Thread$$OBJECTS();
        Sync$$OBJECTS();
        GateThread$$OBJECTS();
        GateProcess$$OBJECTS();
        ISemaphore$$OBJECTS();
        SemThread$$OBJECTS();
        SemProcess$$OBJECTS();
        ISync$$OBJECTS();
        SyncGeneric$$OBJECTS();
        SyncNull$$OBJECTS();
        SyncSemThread$$OBJECTS();
        Cache$$OBJECTS();
        ICacheSupport$$OBJECTS();
        CacheSupportNull$$OBJECTS();
        IGateThreadSupport$$OBJECTS();
        GateThreadSupportNull$$OBJECTS();
        IGateProcessSupport$$OBJECTS();
        GateProcessSupportNull$$OBJECTS();
        ISemThreadSupport$$OBJECTS();
        ISemProcessSupport$$OBJECTS();
        IThreadSupport$$OBJECTS();
        GateH_Proxy$$OBJECTS();
        Semaphore_Proxy$$OBJECTS();
        Thread_Proxy$$OBJECTS();
        Sync_Proxy$$OBJECTS();
        GateThread_Proxy$$OBJECTS();
        GateProcess_Proxy$$OBJECTS();
        SemThread_Proxy$$OBJECTS();
        SemProcess_Proxy$$OBJECTS();
        Cache_Proxy$$OBJECTS();
        GateH$$CONSTS();
        Semaphore$$CONSTS();
        Thread$$CONSTS();
        Sync$$CONSTS();
        GateThread$$CONSTS();
        GateProcess$$CONSTS();
        ISemaphore$$CONSTS();
        SemThread$$CONSTS();
        SemProcess$$CONSTS();
        ISync$$CONSTS();
        SyncGeneric$$CONSTS();
        SyncNull$$CONSTS();
        SyncSemThread$$CONSTS();
        Cache$$CONSTS();
        ICacheSupport$$CONSTS();
        CacheSupportNull$$CONSTS();
        IGateThreadSupport$$CONSTS();
        GateThreadSupportNull$$CONSTS();
        IGateProcessSupport$$CONSTS();
        GateProcessSupportNull$$CONSTS();
        ISemThreadSupport$$CONSTS();
        ISemProcessSupport$$CONSTS();
        IThreadSupport$$CONSTS();
        GateH_Proxy$$CONSTS();
        Semaphore_Proxy$$CONSTS();
        Thread_Proxy$$CONSTS();
        Sync_Proxy$$CONSTS();
        GateThread_Proxy$$CONSTS();
        GateProcess_Proxy$$CONSTS();
        SemThread_Proxy$$CONSTS();
        SemProcess_Proxy$$CONSTS();
        Cache_Proxy$$CONSTS();
        GateH$$CREATES();
        Semaphore$$CREATES();
        Thread$$CREATES();
        Sync$$CREATES();
        GateThread$$CREATES();
        GateProcess$$CREATES();
        ISemaphore$$CREATES();
        SemThread$$CREATES();
        SemProcess$$CREATES();
        ISync$$CREATES();
        SyncGeneric$$CREATES();
        SyncNull$$CREATES();
        SyncSemThread$$CREATES();
        Cache$$CREATES();
        ICacheSupport$$CREATES();
        CacheSupportNull$$CREATES();
        IGateThreadSupport$$CREATES();
        GateThreadSupportNull$$CREATES();
        IGateProcessSupport$$CREATES();
        GateProcessSupportNull$$CREATES();
        ISemThreadSupport$$CREATES();
        ISemProcessSupport$$CREATES();
        IThreadSupport$$CREATES();
        GateH_Proxy$$CREATES();
        Semaphore_Proxy$$CREATES();
        Thread_Proxy$$CREATES();
        Sync_Proxy$$CREATES();
        GateThread_Proxy$$CREATES();
        GateProcess_Proxy$$CREATES();
        SemThread_Proxy$$CREATES();
        SemProcess_Proxy$$CREATES();
        Cache_Proxy$$CREATES();
        GateH$$FUNCTIONS();
        Semaphore$$FUNCTIONS();
        Thread$$FUNCTIONS();
        Sync$$FUNCTIONS();
        GateThread$$FUNCTIONS();
        GateProcess$$FUNCTIONS();
        ISemaphore$$FUNCTIONS();
        SemThread$$FUNCTIONS();
        SemProcess$$FUNCTIONS();
        ISync$$FUNCTIONS();
        SyncGeneric$$FUNCTIONS();
        SyncNull$$FUNCTIONS();
        SyncSemThread$$FUNCTIONS();
        Cache$$FUNCTIONS();
        ICacheSupport$$FUNCTIONS();
        CacheSupportNull$$FUNCTIONS();
        IGateThreadSupport$$FUNCTIONS();
        GateThreadSupportNull$$FUNCTIONS();
        IGateProcessSupport$$FUNCTIONS();
        GateProcessSupportNull$$FUNCTIONS();
        ISemThreadSupport$$FUNCTIONS();
        ISemProcessSupport$$FUNCTIONS();
        IThreadSupport$$FUNCTIONS();
        GateH_Proxy$$FUNCTIONS();
        Semaphore_Proxy$$FUNCTIONS();
        Thread_Proxy$$FUNCTIONS();
        Sync_Proxy$$FUNCTIONS();
        GateThread_Proxy$$FUNCTIONS();
        GateProcess_Proxy$$FUNCTIONS();
        SemThread_Proxy$$FUNCTIONS();
        SemProcess_Proxy$$FUNCTIONS();
        Cache_Proxy$$FUNCTIONS();
        GateH$$SIZES();
        Semaphore$$SIZES();
        Thread$$SIZES();
        Sync$$SIZES();
        GateThread$$SIZES();
        GateProcess$$SIZES();
        ISemaphore$$SIZES();
        SemThread$$SIZES();
        SemProcess$$SIZES();
        ISync$$SIZES();
        SyncGeneric$$SIZES();
        SyncNull$$SIZES();
        SyncSemThread$$SIZES();
        Cache$$SIZES();
        ICacheSupport$$SIZES();
        CacheSupportNull$$SIZES();
        IGateThreadSupport$$SIZES();
        GateThreadSupportNull$$SIZES();
        IGateProcessSupport$$SIZES();
        GateProcessSupportNull$$SIZES();
        ISemThreadSupport$$SIZES();
        ISemProcessSupport$$SIZES();
        IThreadSupport$$SIZES();
        GateH_Proxy$$SIZES();
        Semaphore_Proxy$$SIZES();
        Thread_Proxy$$SIZES();
        Sync_Proxy$$SIZES();
        GateThread_Proxy$$SIZES();
        GateProcess_Proxy$$SIZES();
        SemThread_Proxy$$SIZES();
        SemProcess_Proxy$$SIZES();
        Cache_Proxy$$SIZES();
        GateH$$TYPES();
        Semaphore$$TYPES();
        Thread$$TYPES();
        Sync$$TYPES();
        GateThread$$TYPES();
        GateProcess$$TYPES();
        ISemaphore$$TYPES();
        SemThread$$TYPES();
        SemProcess$$TYPES();
        ISync$$TYPES();
        SyncGeneric$$TYPES();
        SyncNull$$TYPES();
        SyncSemThread$$TYPES();
        Cache$$TYPES();
        ICacheSupport$$TYPES();
        CacheSupportNull$$TYPES();
        IGateThreadSupport$$TYPES();
        GateThreadSupportNull$$TYPES();
        IGateProcessSupport$$TYPES();
        GateProcessSupportNull$$TYPES();
        ISemThreadSupport$$TYPES();
        ISemProcessSupport$$TYPES();
        IThreadSupport$$TYPES();
        GateH_Proxy$$TYPES();
        Semaphore_Proxy$$TYPES();
        Thread_Proxy$$TYPES();
        Sync_Proxy$$TYPES();
        GateThread_Proxy$$TYPES();
        GateProcess_Proxy$$TYPES();
        SemThread_Proxy$$TYPES();
        SemProcess_Proxy$$TYPES();
        Cache_Proxy$$TYPES();
        if (isROV) {
            GateH$$ROV();
            Semaphore$$ROV();
            Thread$$ROV();
            Sync$$ROV();
            GateThread$$ROV();
            GateProcess$$ROV();
            ISemaphore$$ROV();
            SemThread$$ROV();
            SemProcess$$ROV();
            ISync$$ROV();
            SyncGeneric$$ROV();
            SyncNull$$ROV();
            SyncSemThread$$ROV();
            Cache$$ROV();
            ICacheSupport$$ROV();
            CacheSupportNull$$ROV();
            IGateThreadSupport$$ROV();
            GateThreadSupportNull$$ROV();
            IGateProcessSupport$$ROV();
            GateProcessSupportNull$$ROV();
            ISemThreadSupport$$ROV();
            ISemProcessSupport$$ROV();
            IThreadSupport$$ROV();
            GateH_Proxy$$ROV();
            Semaphore_Proxy$$ROV();
            Thread_Proxy$$ROV();
            Sync_Proxy$$ROV();
            GateThread_Proxy$$ROV();
            GateProcess_Proxy$$ROV();
            SemThread_Proxy$$ROV();
            SemProcess_Proxy$$ROV();
            Cache_Proxy$$ROV();
        }//isROV
        $$SINGLETONS();
        GateH$$SINGLETONS();
        Semaphore$$SINGLETONS();
        Thread$$SINGLETONS();
        Sync$$SINGLETONS();
        GateThread$$SINGLETONS();
        GateProcess$$SINGLETONS();
        ISemaphore$$SINGLETONS();
        SemThread$$SINGLETONS();
        SemProcess$$SINGLETONS();
        ISync$$SINGLETONS();
        SyncGeneric$$SINGLETONS();
        SyncNull$$SINGLETONS();
        SyncSemThread$$SINGLETONS();
        Cache$$SINGLETONS();
        ICacheSupport$$SINGLETONS();
        CacheSupportNull$$SINGLETONS();
        IGateThreadSupport$$SINGLETONS();
        GateThreadSupportNull$$SINGLETONS();
        IGateProcessSupport$$SINGLETONS();
        GateProcessSupportNull$$SINGLETONS();
        ISemThreadSupport$$SINGLETONS();
        ISemProcessSupport$$SINGLETONS();
        IThreadSupport$$SINGLETONS();
        GateH_Proxy$$SINGLETONS();
        Semaphore_Proxy$$SINGLETONS();
        Thread_Proxy$$SINGLETONS();
        Sync_Proxy$$SINGLETONS();
        GateThread_Proxy$$SINGLETONS();
        GateProcess_Proxy$$SINGLETONS();
        SemThread_Proxy$$SINGLETONS();
        SemProcess_Proxy$$SINGLETONS();
        Cache_Proxy$$SINGLETONS();
        $$INITIALIZATION();
    }
}
