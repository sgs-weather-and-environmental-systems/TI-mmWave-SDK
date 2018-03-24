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

public class xdc_bld
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
        Global.callFxn("loadPackage", xdcO, "xdc.services.global");
        Global.callFxn("loadPackage", xdcO, "xdc.services.intern.cmd");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.bld.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.bld", new Value.Obj("xdc.bld", pkgP));
    }

    void BuildEnvironment$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.BuildEnvironment.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.BuildEnvironment", new Value.Obj("xdc.bld.BuildEnvironment", po));
        pkgV.bind("BuildEnvironment", vo);
        // decls 
        om.bind("xdc.bld.BuildEnvironment.HostOS", new Proto.Enm("xdc.bld.BuildEnvironment.HostOS"));
    }

    void PackageContents$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.PackageContents.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.PackageContents", new Value.Obj("xdc.bld.PackageContents", po));
        pkgV.bind("PackageContents", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.PackageContents$$Attrs", new Proto.Obj());
        om.bind("xdc.bld.PackageContents.Attrs", new Proto.Str(spo, true));
    }

    void Release$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Release.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Release", new Value.Obj("xdc.bld.Release", po));
        pkgV.bind("Release", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.Release$$Attrs", new Proto.Obj());
        om.bind("xdc.bld.Release.Attrs", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.Release$$Desc", new Proto.Obj());
        om.bind("xdc.bld.Release.Desc", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.bld.Release.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.bld.Release$$Object", new Proto.Obj());
        om.bind("xdc.bld.Release.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.bld.Release$$Params", new Proto.Obj());
        om.bind("xdc.bld.Release.Params", new Proto.Str(po, true));
    }

    void Library$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Library.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Library", new Value.Obj("xdc.bld.Library", po));
        pkgV.bind("Library", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.Library$$Attrs", new Proto.Obj());
        om.bind("xdc.bld.Library.Attrs", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.bld.Library.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.bld.Library$$Object", new Proto.Obj());
        om.bind("xdc.bld.Library.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.bld.Library$$Params", new Proto.Obj());
        om.bind("xdc.bld.Library.Params", new Proto.Str(po, true));
    }

    void Test$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Test.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Test", new Value.Obj("xdc.bld.Test", po));
        pkgV.bind("Test", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.Test$$Attrs", new Proto.Obj());
        om.bind("xdc.bld.Test.Attrs", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.bld.Test.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.bld.Test$$Object", new Proto.Obj());
        om.bind("xdc.bld.Test.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.bld.Test$$Params", new Proto.Obj());
        om.bind("xdc.bld.Test.Params", new Proto.Str(po, true));
    }

    void Object$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Object.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Object", new Value.Obj("xdc.bld.Object", po));
        pkgV.bind("Object", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.Object$$Attrs", new Proto.Obj());
        om.bind("xdc.bld.Object.Attrs", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.bld.Object.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.bld.Object$$Object", new Proto.Obj());
        om.bind("xdc.bld.Object.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.bld.Object$$Params", new Proto.Obj());
        om.bind("xdc.bld.Object.Params", new Proto.Str(po, true));
    }

    void Executable$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Executable.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Executable", new Value.Obj("xdc.bld.Executable", po));
        pkgV.bind("Executable", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.Executable$$Attrs", new Proto.Obj());
        om.bind("xdc.bld.Executable.Attrs", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.bld.Executable.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.bld.Executable$$Object", new Proto.Obj());
        om.bind("xdc.bld.Executable.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.bld.Executable$$Params", new Proto.Obj());
        om.bind("xdc.bld.Executable.Params", new Proto.Str(po, true));
    }

    void Repository$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Repository.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Repository", new Value.Obj("xdc.bld.Repository", po));
        pkgV.bind("Repository", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.Repository$$Attrs", new Proto.Obj());
        om.bind("xdc.bld.Repository.Attrs", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.bld.Repository.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.bld.Repository$$Object", new Proto.Obj());
        om.bind("xdc.bld.Repository.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.bld.Repository$$Params", new Proto.Obj());
        om.bind("xdc.bld.Repository.Params", new Proto.Str(po, true));
    }

    void Assembly$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Assembly.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Assembly", new Value.Obj("xdc.bld.Assembly", po));
        pkgV.bind("Assembly", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.bld.Assembly.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.bld.Assembly$$Object", new Proto.Obj());
        om.bind("xdc.bld.Assembly.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.bld.Assembly$$Params", new Proto.Obj());
        om.bind("xdc.bld.Assembly.Params", new Proto.Str(po, true));
    }

    void Configuration$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Configuration.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Configuration", new Value.Obj("xdc.bld.Configuration", po));
        pkgV.bind("Configuration", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.Configuration$$Attrs", new Proto.Obj());
        om.bind("xdc.bld.Configuration.Attrs", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.bld.Configuration.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.bld.Configuration$$Object", new Proto.Obj());
        om.bind("xdc.bld.Configuration.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.bld.Configuration$$Params", new Proto.Obj());
        om.bind("xdc.bld.Configuration.Params", new Proto.Str(po, true));
    }

    void Script$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Script.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Script", new Value.Obj("xdc.bld.Script", po));
        pkgV.bind("Script", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.Script$$Attrs", new Proto.Obj());
        om.bind("xdc.bld.Script.Attrs", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.bld.Script.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.bld.Script$$Object", new Proto.Obj());
        om.bind("xdc.bld.Script.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.bld.Script$$Params", new Proto.Obj());
        om.bind("xdc.bld.Script.Params", new Proto.Str(po, true));
    }

    void Manifest$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Manifest.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Manifest", new Value.Obj("xdc.bld.Manifest", po));
        pkgV.bind("Manifest", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.Manifest$$Filter", new Proto.Obj());
        om.bind("xdc.bld.Manifest.Filter", new Proto.Str(spo, true));
    }

    void Utils$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.Utils.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.Utils", new Value.Obj("xdc.bld.Utils", po));
        pkgV.bind("Utils", vo);
        // decls 
    }

    void ITarget$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.ITarget.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.ITarget", new Value.Obj("xdc.bld.ITarget", po));
        pkgV.bind("ITarget", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$Model", new Proto.Obj());
        om.bind("xdc.bld.ITarget.Model", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$DebugGen", new Proto.Obj());
        om.bind("xdc.bld.ITarget.DebugGen", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$Extension", new Proto.Obj());
        om.bind("xdc.bld.ITarget.Extension", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$CompileOptions", new Proto.Obj());
        om.bind("xdc.bld.ITarget.CompileOptions", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$OptionSet", new Proto.Obj());
        om.bind("xdc.bld.ITarget.OptionSet", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$CompileGoal", new Proto.Obj());
        om.bind("xdc.bld.ITarget.CompileGoal", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$LinkGoal", new Proto.Obj());
        om.bind("xdc.bld.ITarget.LinkGoal", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$ArchiveGoal", new Proto.Obj());
        om.bind("xdc.bld.ITarget.ArchiveGoal", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$CommandSet", new Proto.Obj());
        om.bind("xdc.bld.ITarget.CommandSet", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$TypeInfo", new Proto.Obj());
        om.bind("xdc.bld.ITarget.TypeInfo", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget$$StdTypes", new Proto.Obj());
        om.bind("xdc.bld.ITarget.StdTypes", new Proto.Str(spo, true));
    }

    void ITarget2$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.ITarget2.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.ITarget2", new Value.Obj("xdc.bld.ITarget2", po));
        pkgV.bind("ITarget2", vo);
        // decls 
        om.bind("xdc.bld.ITarget2.Model", om.findStrict("xdc.bld.ITarget.Model", "xdc.bld"));
        om.bind("xdc.bld.ITarget2.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "xdc.bld"));
        om.bind("xdc.bld.ITarget2.Extension", om.findStrict("xdc.bld.ITarget.Extension", "xdc.bld"));
        om.bind("xdc.bld.ITarget2.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "xdc.bld"));
        om.bind("xdc.bld.ITarget2.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "xdc.bld"));
        om.bind("xdc.bld.ITarget2.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "xdc.bld"));
        om.bind("xdc.bld.ITarget2.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "xdc.bld"));
        om.bind("xdc.bld.ITarget2.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "xdc.bld"));
        om.bind("xdc.bld.ITarget2.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "xdc.bld"));
        om.bind("xdc.bld.ITarget2.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"));
        om.bind("xdc.bld.ITarget2.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "xdc.bld"));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget2$$Command", new Proto.Obj());
        om.bind("xdc.bld.ITarget2.Command", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITarget2$$Options", new Proto.Obj());
        om.bind("xdc.bld.ITarget2.Options", new Proto.Str(spo, true));
    }

    void ITarget3$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.ITarget3.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.ITarget3", new Value.Obj("xdc.bld.ITarget3", po));
        pkgV.bind("ITarget3", vo);
        // decls 
        om.bind("xdc.bld.ITarget3.Model", om.findStrict("xdc.bld.ITarget.Model", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.Extension", om.findStrict("xdc.bld.ITarget.Extension", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.Command", om.findStrict("xdc.bld.ITarget2.Command", "xdc.bld"));
        om.bind("xdc.bld.ITarget3.Options", om.findStrict("xdc.bld.ITarget2.Options", "xdc.bld"));
    }

    void ITargetFilter$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.bld.ITargetFilter.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.bld.ITargetFilter", new Value.Obj("xdc.bld.ITargetFilter", po));
        pkgV.bind("ITargetFilter", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.bld.ITargetFilter$$InstDesc", new Proto.Obj());
        om.bind("xdc.bld.ITargetFilter.InstDesc", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITargetFilter$$GenDesc", new Proto.Obj());
        om.bind("xdc.bld.ITargetFilter.GenDesc", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.bld.ITargetFilter$$MacroDesc", new Proto.Obj());
        om.bind("xdc.bld.ITargetFilter.MacroDesc", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.bld.ITargetFilter.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.bld.ITargetFilter$$Object", new Proto.Obj());
        om.bind("xdc.bld.ITargetFilter.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.bld.ITargetFilter$$Params", new Proto.Obj());
        om.bind("xdc.bld.ITargetFilter.Params", new Proto.Str(po, true));
    }

    void BuildEnvironment$$CONSTS()
    {
        // module BuildEnvironment
        om.bind("xdc.bld.BuildEnvironment.WINDOWS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.bld.BuildEnvironment.HostOS", "xdc.bld"), "xdc.bld.BuildEnvironment.WINDOWS", 0));
        om.bind("xdc.bld.BuildEnvironment.SOLARIS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.bld.BuildEnvironment.HostOS", "xdc.bld"), "xdc.bld.BuildEnvironment.SOLARIS", 1));
        om.bind("xdc.bld.BuildEnvironment.LINUX", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.bld.BuildEnvironment.HostOS", "xdc.bld"), "xdc.bld.BuildEnvironment.LINUX", 2));
        om.bind("xdc.bld.BuildEnvironment.MACOS", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("xdc.bld.BuildEnvironment.HostOS", "xdc.bld"), "xdc.bld.BuildEnvironment.MACOS", 3));
    }

    void PackageContents$$CONSTS()
    {
        // module PackageContents
    }

    void Release$$CONSTS()
    {
        // module Release
    }

    void Library$$CONSTS()
    {
        // module Library
    }

    void Test$$CONSTS()
    {
        // module Test
    }

    void Object$$CONSTS()
    {
        // module Object
    }

    void Executable$$CONSTS()
    {
        // module Executable
    }

    void Repository$$CONSTS()
    {
        // module Repository
    }

    void Assembly$$CONSTS()
    {
        // module Assembly
    }

    void Configuration$$CONSTS()
    {
        // module Configuration
    }

    void Script$$CONSTS()
    {
        // module Script
    }

    void Manifest$$CONSTS()
    {
        // module Manifest
    }

    void Utils$$CONSTS()
    {
        // module Utils
    }

    void ITarget$$CONSTS()
    {
        // interface ITarget
    }

    void ITarget2$$CONSTS()
    {
        // interface ITarget2
    }

    void ITarget3$$CONSTS()
    {
        // interface ITarget3
    }

    void ITargetFilter$$CONSTS()
    {
        // interface ITargetFilter
    }

    void BuildEnvironment$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void PackageContents$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Release$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.bld.Release$$create", new Proto.Fxn(om.findStrict("xdc.bld.Release.Module", "xdc.bld"), om.findStrict("xdc.bld.Release.Instance", "xdc.bld"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.bld.Release.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Release$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Release'];\n");
            sb.append("var __inst = xdc.om['xdc.bld.Release.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.bld']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("__inst.otherFiles = __mod.PARAMS.otherFiles;\n");
            sb.append("__inst.excludeDirs = __mod.PARAMS.excludeDirs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.bld.Release$$construct", new Proto.Fxn(om.findStrict("xdc.bld.Release.Module", "xdc.bld"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.bld.Release$$Object", "xdc.bld"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.bld.Release.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Release$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Release'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("__inst.otherFiles = __mod.PARAMS.otherFiles;\n");
            sb.append("__inst.excludeDirs = __mod.PARAMS.excludeDirs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Library$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.bld.Library$$create", new Proto.Fxn(om.findStrict("xdc.bld.Library.Module", "xdc.bld"), om.findStrict("xdc.bld.Library.Instance", "xdc.bld"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.bld.Library.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Library$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Library'];\n");
            sb.append("var __inst = xdc.om['xdc.bld.Library.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.bld']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.target = __mod.PARAMS.target;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.bld.Library$$construct", new Proto.Fxn(om.findStrict("xdc.bld.Library.Module", "xdc.bld"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.bld.Library$$Object", "xdc.bld"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.bld.Library.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Library$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Library'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.target = __mod.PARAMS.target;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Test$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.bld.Test$$create", new Proto.Fxn(om.findStrict("xdc.bld.Test.Module", "xdc.bld"), om.findStrict("xdc.bld.Test.Instance", "xdc.bld"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.bld.Test.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Test$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Test'];\n");
            sb.append("var __inst = xdc.om['xdc.bld.Test.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.bld']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.bld.Test$$construct", new Proto.Fxn(om.findStrict("xdc.bld.Test.Module", "xdc.bld"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.bld.Test$$Object", "xdc.bld"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.bld.Test.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Test$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Test'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Object$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.bld.Object$$create", new Proto.Fxn(om.findStrict("xdc.bld.Object.Module", "xdc.bld"), om.findStrict("xdc.bld.Object.Instance", "xdc.bld"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.bld.Object.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Object$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Object'];\n");
            sb.append("var __inst = xdc.om['xdc.bld.Object.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.bld']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.bld.Object$$construct", new Proto.Fxn(om.findStrict("xdc.bld.Object.Module", "xdc.bld"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.bld.Object$$Object", "xdc.bld"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.bld.Object.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Object$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Object'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Executable$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.bld.Executable$$create", new Proto.Fxn(om.findStrict("xdc.bld.Executable.Module", "xdc.bld"), om.findStrict("xdc.bld.Executable.Instance", "xdc.bld"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.bld.Executable.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Executable$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Executable'];\n");
            sb.append("var __inst = xdc.om['xdc.bld.Executable.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.bld']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.platform = __mod.PARAMS.platform;\n");
            sb.append("__inst.target = __mod.PARAMS.target;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.bld.Executable$$construct", new Proto.Fxn(om.findStrict("xdc.bld.Executable.Module", "xdc.bld"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.bld.Executable$$Object", "xdc.bld"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.bld.Executable.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Executable$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Executable'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.platform = __mod.PARAMS.platform;\n");
            sb.append("__inst.target = __mod.PARAMS.target;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Repository$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.bld.Repository$$create", new Proto.Fxn(om.findStrict("xdc.bld.Repository.Module", "xdc.bld"), om.findStrict("xdc.bld.Repository.Instance", "xdc.bld"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.bld.Repository.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Repository$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Repository'];\n");
            sb.append("var __inst = xdc.om['xdc.bld.Repository.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.bld']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.bld.Repository$$construct", new Proto.Fxn(om.findStrict("xdc.bld.Repository.Module", "xdc.bld"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.bld.Repository$$Object", "xdc.bld"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.bld.Repository.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Repository$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Repository'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Assembly$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.bld.Assembly$$create", new Proto.Fxn(om.findStrict("xdc.bld.Assembly.Module", "xdc.bld"), om.findStrict("xdc.bld.Assembly.Instance", "xdc.bld"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.bld.Assembly.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Assembly$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Assembly'];\n");
            sb.append("var __inst = xdc.om['xdc.bld.Assembly.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.bld']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.platform = __mod.PARAMS.platform;\n");
            sb.append("__inst.target = __mod.PARAMS.target;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.bld.Assembly$$construct", new Proto.Fxn(om.findStrict("xdc.bld.Assembly.Module", "xdc.bld"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.bld.Assembly$$Object", "xdc.bld"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.bld.Assembly.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Assembly$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Assembly'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.platform = __mod.PARAMS.platform;\n");
            sb.append("__inst.target = __mod.PARAMS.target;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Configuration$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.bld.Configuration$$create", new Proto.Fxn(om.findStrict("xdc.bld.Configuration.Module", "xdc.bld"), om.findStrict("xdc.bld.Configuration.Instance", "xdc.bld"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.bld.Configuration.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Configuration$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Configuration'];\n");
            sb.append("var __inst = xdc.om['xdc.bld.Configuration.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.bld']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.platform = __mod.PARAMS.platform;\n");
            sb.append("__inst.target = __mod.PARAMS.target;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.bld.Configuration$$construct", new Proto.Fxn(om.findStrict("xdc.bld.Configuration.Module", "xdc.bld"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.bld.Configuration$$Object", "xdc.bld"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.bld.Configuration.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Configuration$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Configuration'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.platform = __mod.PARAMS.platform;\n");
            sb.append("__inst.target = __mod.PARAMS.target;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Script$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.bld.Script$$create", new Proto.Fxn(om.findStrict("xdc.bld.Script.Module", "xdc.bld"), om.findStrict("xdc.bld.Script.Instance", "xdc.bld"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("xdc.bld.Script.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Script$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Script'];\n");
            sb.append("var __inst = xdc.om['xdc.bld.Script.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.bld']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.bld.Script$$construct", new Proto.Fxn(om.findStrict("xdc.bld.Script.Module", "xdc.bld"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.bld.Script$$Object", "xdc.bld"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("xdc.bld.Script.Params", "xdc.bld"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$bld$Script$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.bld.Script'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Manifest$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Utils$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ITarget$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ITarget2$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ITarget3$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ITargetFilter$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void BuildEnvironment$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn BuildEnvironment.usePlatform
        fxn = (Proto.Fxn)om.bind("xdc.bld.BuildEnvironment$$usePlatform", new Proto.Fxn(om.findStrict("xdc.bld.BuildEnvironment.Module", "xdc.bld"), null, 0, -1, false));
        // fxn BuildEnvironment.isInTargetsArray
        fxn = (Proto.Fxn)om.bind("xdc.bld.BuildEnvironment$$isInTargetsArray", new Proto.Fxn(om.findStrict("xdc.bld.BuildEnvironment.Module", "xdc.bld"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF);
        // fxn BuildEnvironment.printBuildTargets
        fxn = (Proto.Fxn)om.bind("xdc.bld.BuildEnvironment$$printBuildTargets", new Proto.Fxn(om.findStrict("xdc.bld.BuildEnvironment.Module", "xdc.bld"), $$T_Str, 0, 0, false));
        // fxn BuildEnvironment.onInit
        fxn = (Proto.Fxn)om.bind("xdc.bld.BuildEnvironment$$onInit", new Proto.Fxn(om.findStrict("xdc.bld.BuildEnvironment.Module", "xdc.bld"), null, 0, -1, false));
        // fxn BuildEnvironment.getReleaseDescs
        fxn = (Proto.Fxn)om.bind("xdc.bld.BuildEnvironment$$getReleaseDescs", new Proto.Fxn(om.findStrict("xdc.bld.BuildEnvironment.Module", "xdc.bld"), new Proto.Arr((Proto)om.findStrict("xdc.bld.Release.Desc", "xdc.bld"), false), 1, 1, false));
                fxn.addArg(0, "pname", $$T_Str, $$UNDEF);
        // fxn BuildEnvironment.initializeModel
        fxn = (Proto.Fxn)om.bind("xdc.bld.BuildEnvironment$$initializeModel", new Proto.Fxn(om.findStrict("xdc.bld.BuildEnvironment.Module", "xdc.bld"), null, 0, -1, false));
    }

    void PackageContents$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn PackageContents.addLibrary
        fxn = (Proto.Fxn)om.bind("xdc.bld.PackageContents$$addLibrary", new Proto.Fxn(om.findStrict("xdc.bld.PackageContents.Module", "xdc.bld"), (Proto)om.findStrict("xdc.bld.Library.Instance", "xdc.bld"), 3, 2, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF);
                fxn.addArg(2, "libAttrs", (Proto)om.findStrict("xdc.bld.Library.Attrs", "xdc.bld"), Global.newObject());
        // fxn PackageContents.addExecutable
        fxn = (Proto.Fxn)om.bind("xdc.bld.PackageContents$$addExecutable", new Proto.Fxn(om.findStrict("xdc.bld.PackageContents.Module", "xdc.bld"), (Proto)om.findStrict("xdc.bld.Executable.Instance", "xdc.bld"), 4, 3, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF);
                fxn.addArg(2, "platform", $$T_Str, $$UNDEF);
                fxn.addArg(3, "exeAttrs", (Proto)om.findStrict("xdc.bld.Executable.Attrs", "xdc.bld"), Global.newObject());
        // fxn PackageContents.addRepository
        fxn = (Proto.Fxn)om.bind("xdc.bld.PackageContents$$addRepository", new Proto.Fxn(om.findStrict("xdc.bld.PackageContents.Module", "xdc.bld"), (Proto)om.findStrict("xdc.bld.Repository.Instance", "xdc.bld"), 2, 1, false));
                fxn.addArg(0, "repositoryName", $$T_Str, $$UNDEF);
                fxn.addArg(1, "repAttrs", (Proto)om.findStrict("xdc.bld.Repository.Attrs", "xdc.bld"), Global.newObject());
        // fxn PackageContents.addRelease
        fxn = (Proto.Fxn)om.bind("xdc.bld.PackageContents$$addRelease", new Proto.Fxn(om.findStrict("xdc.bld.PackageContents.Module", "xdc.bld"), (Proto)om.findStrict("xdc.bld.Release.Instance", "xdc.bld"), 2, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "relAttrs", (Proto)om.findStrict("xdc.bld.Release.Attrs", "xdc.bld"), Global.newObject());
        // fxn PackageContents.addScript
        fxn = (Proto.Fxn)om.bind("xdc.bld.PackageContents$$addScript", new Proto.Fxn(om.findStrict("xdc.bld.PackageContents.Module", "xdc.bld"), (Proto)om.findStrict("xdc.bld.Script.Instance", "xdc.bld"), 2, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "scriptAttrs", (Proto)om.findStrict("xdc.bld.Script.Attrs", "xdc.bld"), Global.newObject());
        // fxn PackageContents.addAssembly
        fxn = (Proto.Fxn)om.bind("xdc.bld.PackageContents$$addAssembly", new Proto.Fxn(om.findStrict("xdc.bld.PackageContents.Module", "xdc.bld"), (Proto)om.findStrict("xdc.bld.Assembly.Instance", "xdc.bld"), 4, 3, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF);
                fxn.addArg(2, "platform", $$T_Str, $$UNDEF);
                fxn.addArg(3, "exeAttrs", (Proto)om.findStrict("xdc.bld.Executable.Attrs", "xdc.bld"), Global.newObject());
        // fxn PackageContents.addConfiguration
        fxn = (Proto.Fxn)om.bind("xdc.bld.PackageContents$$addConfiguration", new Proto.Fxn(om.findStrict("xdc.bld.PackageContents.Module", "xdc.bld"), (Proto)om.findStrict("xdc.bld.Configuration.Instance", "xdc.bld"), 4, 3, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF);
                fxn.addArg(2, "platform", $$T_Str, $$UNDEF);
                fxn.addArg(3, "cfgAttrs", (Proto)om.findStrict("xdc.bld.Configuration.Attrs", "xdc.bld"), Global.newObject());
        // fxn PackageContents.onInit
        fxn = (Proto.Fxn)om.bind("xdc.bld.PackageContents$$onInit", new Proto.Fxn(om.findStrict("xdc.bld.PackageContents.Module", "xdc.bld"), null, 0, -1, false));
    }

    void Release$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Library$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Library.addObjects
        fxn = (Proto.Fxn)om.bind("xdc.bld.Library$$addObjects", new Proto.Fxn(om.findStrict("xdc.bld.Library.Instance", "xdc.bld"), null, 2, 1, false));
                fxn.addArg(0, "names", new Proto.Arr($$T_Str, false), $$DEFAULT);
                fxn.addArg(1, "objAttrs", (Proto)om.findStrict("xdc.bld.Object.Attrs", "xdc.bld"), Global.newObject());
    }

    void Test$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Object$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Executable$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Executable.addObjects
        fxn = (Proto.Fxn)om.bind("xdc.bld.Executable$$addObjects", new Proto.Fxn(om.findStrict("xdc.bld.Executable.Instance", "xdc.bld"), null, 2, 1, false));
                fxn.addArg(0, "names", new Proto.Arr($$T_Str, false), $$DEFAULT);
                fxn.addArg(1, "objAttrs", (Proto)om.findStrict("xdc.bld.Object.Attrs", "xdc.bld"), Global.newObject());
        // fxn Executable.addTest
        fxn = (Proto.Fxn)om.bind("xdc.bld.Executable$$addTest", new Proto.Fxn(om.findStrict("xdc.bld.Executable.Instance", "xdc.bld"), (Proto)om.findStrict("xdc.bld.Test.Instance", "xdc.bld"), 1, 1, false));
                fxn.addArg(0, "testAttrs", (Proto)om.findStrict("xdc.bld.Test.Attrs", "xdc.bld"), $$DEFAULT);
    }

    void Repository$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Repository.addPackages
        fxn = (Proto.Fxn)om.bind("xdc.bld.Repository$$addPackages", new Proto.Fxn(om.findStrict("xdc.bld.Repository.Instance", "xdc.bld"), null, 1, 1, false));
                fxn.addArg(0, "names", new Proto.Arr($$T_Str, false), $$DEFAULT);
    }

    void Assembly$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Configuration$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Configuration.getBaseName
        fxn = (Proto.Fxn)om.bind("xdc.bld.Configuration$$getBaseName", new Proto.Fxn(om.findStrict("xdc.bld.Configuration.Instance", "xdc.bld"), $$T_Str, 0, 0, false));
    }

    void Script$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Script.addTest
        fxn = (Proto.Fxn)om.bind("xdc.bld.Script$$addTest", new Proto.Fxn(om.findStrict("xdc.bld.Script.Instance", "xdc.bld"), (Proto)om.findStrict("xdc.bld.Test.Instance", "xdc.bld"), 1, 0, false));
                fxn.addArg(0, "testAttrs", (Proto)om.findStrict("xdc.bld.Test.Attrs", "xdc.bld"), Global.newObject());
    }

    void Manifest$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Manifest.getAllFiles
        fxn = (Proto.Fxn)om.bind("xdc.bld.Manifest$$getAllFiles", new Proto.Fxn(om.findStrict("xdc.bld.Manifest.Module", "xdc.bld"), null, 1, 1, false));
                fxn.addArg(0, "verbatimDirs", new Proto.Arr($$T_Str, false), $$DEFAULT);
    }

    void Utils$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Utils.expandString
        fxn = (Proto.Fxn)om.bind("xdc.bld.Utils$$expandString", new Proto.Fxn(om.findStrict("xdc.bld.Utils.Module", "xdc.bld"), $$T_Str, 2, 2, false));
                fxn.addArg(0, "cmd", $$T_Str, $$UNDEF);
                fxn.addArg(1, "values", $$T_Obj, $$UNDEF);
        // fxn Utils.expandDbgName
        fxn = (Proto.Fxn)om.bind("xdc.bld.Utils$$expandDbgName", new Proto.Fxn(om.findStrict("xdc.bld.Utils.Module", "xdc.bld"), null, 0, -1, false));
        // fxn Utils.parsePlatName
        fxn = (Proto.Fxn)om.bind("xdc.bld.Utils$$parsePlatName", new Proto.Fxn(om.findStrict("xdc.bld.Utils.Module", "xdc.bld"), null, 0, -1, false));
        // fxn Utils.display
        fxn = (Proto.Fxn)om.bind("xdc.bld.Utils$$display", new Proto.Fxn(om.findStrict("xdc.bld.Utils.Module", "xdc.bld"), null, 2, 2, false));
                fxn.addArg(0, "msg", $$T_Str, $$UNDEF);
                fxn.addArg(1, "obj", $$T_Obj, $$UNDEF);
    }

    void ITarget$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ITarget.archive
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget$$archive", new Proto.Fxn(om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), new Proto.Adr("xdc_bld_ITarget_CommandSet*", "PS"), 1, 1, false));
                fxn.addArg(0, "goal", new Proto.Adr("xdc_bld_ITarget_ArchiveGoal*", "PS"), $$UNDEF);
        // fxn ITarget.compile
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget$$compile", new Proto.Fxn(om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), new Proto.Adr("xdc_bld_ITarget_CommandSet*", "PS"), 1, 1, false));
                fxn.addArg(0, "goal", new Proto.Adr("xdc_bld_ITarget_CompileGoal*", "PS"), $$UNDEF);
        // fxn ITarget.scompile
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget$$scompile", new Proto.Fxn(om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), new Proto.Adr("xdc_bld_ITarget_CommandSet*", "PS"), 1, 1, false));
                fxn.addArg(0, "goal", new Proto.Adr("xdc_bld_ITarget_CompileGoal*", "PS"), $$UNDEF);
        // fxn ITarget.link
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget$$link", new Proto.Fxn(om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), new Proto.Adr("xdc_bld_ITarget_CommandSet*", "PS"), 1, 1, false));
                fxn.addArg(0, "goal", new Proto.Adr("xdc_bld_ITarget_LinkGoal*", "PS"), $$UNDEF);
        // fxn ITarget.getVersion
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget$$getVersion", new Proto.Fxn(om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$T_Str, 0, 0, false));
        // fxn ITarget.getISAChain
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget$$getISAChain", new Proto.Fxn(om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), null, 0, -1, false));
        // fxn ITarget.findSuffix
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget$$findSuffix", new Proto.Fxn(om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), null, 0, -1, false));
        // fxn ITarget.selectSuffix
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget$$selectSuffix", new Proto.Fxn(om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$T_Str, 1, 1, false));
                fxn.addArg(0, "suffixList", new Proto.Arr($$T_Str, false), $$DEFAULT);
    }

    void ITarget2$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ITarget2.genConstCustom
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget2$$genConstCustom", new Proto.Fxn(om.findStrict("xdc.bld.ITarget2.Module", "xdc.bld"), $$T_Str, 2, 2, false));
                fxn.addArg(0, "names", new Proto.Arr($$T_Str, false), $$DEFAULT);
                fxn.addArg(1, "types", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn ITarget2.genVisibleData
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget2$$genVisibleData", new Proto.Fxn(om.findStrict("xdc.bld.ITarget2.Module", "xdc.bld"), $$T_Str, 3, 3, false));
                fxn.addArg(0, "quals", new Proto.Arr($$T_Str, false), $$DEFAULT);
                fxn.addArg(1, "types", new Proto.Arr($$T_Str, false), $$DEFAULT);
                fxn.addArg(2, "names", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn ITarget2.genVisibleFxns
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget2$$genVisibleFxns", new Proto.Fxn(om.findStrict("xdc.bld.ITarget2.Module", "xdc.bld"), $$T_Str, 3, 3, false));
                fxn.addArg(0, "types", new Proto.Arr($$T_Str, false), $$DEFAULT);
                fxn.addArg(1, "names", new Proto.Arr($$T_Str, false), $$DEFAULT);
                fxn.addArg(2, "args", new Proto.Arr($$T_Str, false), $$DEFAULT);
        // fxn ITarget2.genVisibleLibFxns
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget2$$genVisibleLibFxns", new Proto.Fxn(om.findStrict("xdc.bld.ITarget2.Module", "xdc.bld"), $$T_Str, 3, 3, false));
                fxn.addArg(0, "types", new Proto.Arr($$T_Str, false), $$DEFAULT);
                fxn.addArg(1, "names", new Proto.Arr($$T_Str, false), $$DEFAULT);
                fxn.addArg(2, "args", new Proto.Arr($$T_Str, false), $$DEFAULT);
    }

    void ITarget3$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ITarget3.getRawVersion
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITarget3$$getRawVersion", new Proto.Fxn(om.findStrict("xdc.bld.ITarget3.Module", "xdc.bld"), $$T_Str, 0, 0, false));
    }

    void ITargetFilter$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ITargetFilter.archive
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITargetFilter$$archive", new Proto.Fxn(om.findStrict("xdc.bld.ITargetFilter.Instance", "xdc.bld"), null, 0, -1, false));
        // fxn ITargetFilter.compile
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITargetFilter$$compile", new Proto.Fxn(om.findStrict("xdc.bld.ITargetFilter.Instance", "xdc.bld"), null, 0, -1, false));
        // fxn ITargetFilter.getGenTab
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITargetFilter$$getGenTab", new Proto.Fxn(om.findStrict("xdc.bld.ITargetFilter.Instance", "xdc.bld"), null, 0, -1, false));
        // fxn ITargetFilter.getDefs
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITargetFilter$$getDefs", new Proto.Fxn(om.findStrict("xdc.bld.ITargetFilter.Instance", "xdc.bld"), null, 0, -1, false));
        // fxn ITargetFilter.link
        fxn = (Proto.Fxn)om.bind("xdc.bld.ITargetFilter$$link", new Proto.Fxn(om.findStrict("xdc.bld.ITargetFilter.Instance", "xdc.bld"), null, 0, -1, false));
    }

    void BuildEnvironment$$SIZES()
    {
    }

    void PackageContents$$SIZES()
    {
    }

    void Release$$SIZES()
    {
    }

    void Library$$SIZES()
    {
    }

    void Test$$SIZES()
    {
    }

    void Object$$SIZES()
    {
    }

    void Executable$$SIZES()
    {
    }

    void Repository$$SIZES()
    {
    }

    void Assembly$$SIZES()
    {
    }

    void Configuration$$SIZES()
    {
    }

    void Script$$SIZES()
    {
    }

    void Manifest$$SIZES()
    {
    }

    void Utils$$SIZES()
    {
    }

    void ITarget$$SIZES()
    {
    }

    void ITarget2$$SIZES()
    {
    }

    void ITarget3$$SIZES()
    {
    }

    void ITargetFilter$$SIZES()
    {
    }

    void BuildEnvironment$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/BuildEnvironment.xs");
        om.bind("xdc.bld.BuildEnvironment$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.BuildEnvironment.Module", "xdc.bld");
        po.init("xdc.bld.BuildEnvironment.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("hostOS", (Proto)om.findStrict("xdc.bld.BuildEnvironment.HostOS", "xdc.bld"), $$UNDEF, "rh");
        po.addFld("hostOSName", $$T_Str, $$UNDEF, "rh");
        po.addFld("useTargets", $$T_Str, $$UNDEF, "wh");
        po.addFld("excludeTargets", $$T_Str, $$UNDEF, "wh");
        po.addFld("targets", new Proto.Arr((Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), false), $$DEFAULT, "wh");
        po.addFld("nativeTarget", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), null, "wh");
        po.addFld("platformTable", new Proto.Map($$T_Obj), Global.newArray(new Object[]{}), "wh");
        po.addFld("platforms", new Proto.Map($$T_Obj), $$DEFAULT, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.BuildEnvironment$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.BuildEnvironment$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.BuildEnvironment$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("usePlatform", (Proto.Fxn)om.findStrict("xdc.bld.BuildEnvironment$$usePlatform", "xdc.bld"), Global.get(cap, "usePlatform"));
                po.addFxn("isInTargetsArray", (Proto.Fxn)om.findStrict("xdc.bld.BuildEnvironment$$isInTargetsArray", "xdc.bld"), Global.get(cap, "isInTargetsArray"));
                po.addFxn("printBuildTargets", (Proto.Fxn)om.findStrict("xdc.bld.BuildEnvironment$$printBuildTargets", "xdc.bld"), Global.get(cap, "printBuildTargets"));
                po.addFxn("onInit", (Proto.Fxn)om.findStrict("xdc.bld.BuildEnvironment$$onInit", "xdc.bld"), Global.get(cap, "onInit"));
                po.addFxn("getReleaseDescs", (Proto.Fxn)om.findStrict("xdc.bld.BuildEnvironment$$getReleaseDescs", "xdc.bld"), Global.get(cap, "getReleaseDescs"));
                po.addFxn("initializeModel", (Proto.Fxn)om.findStrict("xdc.bld.BuildEnvironment$$initializeModel", "xdc.bld"), Global.get(cap, "initializeModel"));
    }

    void PackageContents$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/PackageContents.xs");
        om.bind("xdc.bld.PackageContents$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.PackageContents.Module", "xdc.bld");
        po.init("xdc.bld.PackageContents.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.PackageContents.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po.addFld("cfgDir", $$T_Str, "package/cfg/", "wh");
        po.addFld("docDir", $$T_Str, $$UNDEF, "wh");
        po.addFld("imports", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("libDir", $$T_Str, "package/lib/", "wh");
        po.addFld("libTemplate", $$T_Str, null, "wh");
        po.addFld("relDir", $$T_Str, "package/rel/", "wh");
        po.addFld("producerId", $$T_Str, $$UNDEF, "wh");
        po.addFld("version", $$T_Str, $$UNDEF, "wh");
        po.addFld("interfaces", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("makePrologue", $$T_Str, "", "wh");
        po.addFld("makeEpilogue", $$T_Str, "", "wh");
        po.addFld("defaultRelease", (Proto)om.findStrict("xdc.bld.Release.Instance", "xdc.bld"), $$UNDEF, "wh");
        po.addFld("releasePrefix", $$T_Str, "", "wh");
        po.addFld("modules", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("otherFiles", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("excludeDirs", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("generatedFiles", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("otherSrcs", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("packagePath", $$T_Str, null, "wh");
        po.addFld("uses", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.PackageContents$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.PackageContents$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.PackageContents$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("addLibrary", (Proto.Fxn)om.findStrict("xdc.bld.PackageContents$$addLibrary", "xdc.bld"), Global.get(cap, "addLibrary"));
                po.addFxn("addExecutable", (Proto.Fxn)om.findStrict("xdc.bld.PackageContents$$addExecutable", "xdc.bld"), Global.get(cap, "addExecutable"));
                po.addFxn("addRepository", (Proto.Fxn)om.findStrict("xdc.bld.PackageContents$$addRepository", "xdc.bld"), Global.get(cap, "addRepository"));
                po.addFxn("addRelease", (Proto.Fxn)om.findStrict("xdc.bld.PackageContents$$addRelease", "xdc.bld"), Global.get(cap, "addRelease"));
                po.addFxn("addScript", (Proto.Fxn)om.findStrict("xdc.bld.PackageContents$$addScript", "xdc.bld"), Global.get(cap, "addScript"));
                po.addFxn("addAssembly", (Proto.Fxn)om.findStrict("xdc.bld.PackageContents$$addAssembly", "xdc.bld"), Global.get(cap, "addAssembly"));
                po.addFxn("addConfiguration", (Proto.Fxn)om.findStrict("xdc.bld.PackageContents$$addConfiguration", "xdc.bld"), Global.get(cap, "addConfiguration"));
                po.addFxn("onInit", (Proto.Fxn)om.findStrict("xdc.bld.PackageContents$$onInit", "xdc.bld"), Global.get(cap, "onInit"));
        // struct PackageContents.Attrs
        po = (Proto.Obj)om.findStrict("xdc.bld.PackageContents$$Attrs", "xdc.bld");
        po.init("xdc.bld.PackageContents.Attrs", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("profile", $$T_Str, $$UNDEF, "w");
                po.addFld("aopts", $$T_Str, $$UNDEF, "w");
                po.addFld("copts", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgcopts", $$T_Str, $$UNDEF, "w");
                po.addFld("defs", $$T_Str, $$UNDEF, "w");
                po.addFld("incs", $$T_Str, $$UNDEF, "w");
                po.addFld("xsopts", $$T_Str, $$UNDEF, "w");
                po.addFld("lopts", $$T_Str, $$UNDEF, "w");
                po.addFld("exportDoc", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportExe", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportCfg", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportSrc", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportAll", $$T_Bool, $$UNDEF, "w");
                po.addFld("relScript", $$T_Str, $$UNDEF, "w");
                po.addFld("relScriptArgs", $$T_Str, $$UNDEF, "w");
                po.addFld("compress", $$T_Bool, $$UNDEF, "w");
                po.addFld("archiver", $$T_Str, $$UNDEF, "w");
    }

    void Release$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.bld.Release.Module", "xdc.bld");
        po.init("xdc.bld.Release.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.bld.Release$$create", "xdc.bld"), Global.get("xdc$bld$Release$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.bld.Release$$construct", "xdc.bld"), Global.get("xdc$bld$Release$$construct"));
        po = (Proto.Obj)om.findStrict("xdc.bld.Release.Instance", "xdc.bld");
        po.init("xdc.bld.Release.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Release.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po.addFld("otherFiles", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("excludeDirs", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Release$$Params", "xdc.bld");
        po.init("xdc.bld.Release.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Release.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po.addFld("otherFiles", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("excludeDirs", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Release$$Object", "xdc.bld");
        po.init("xdc.bld.Release.Object", om.findStrict("xdc.bld.Release.Instance", "xdc.bld"));
        // struct Release.Attrs
        po = (Proto.Obj)om.findStrict("xdc.bld.Release$$Attrs", "xdc.bld");
        po.init("xdc.bld.Release.Attrs", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("archiver", $$T_Str, $$UNDEF, "w");
                po.addFld("compress", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportDoc", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportExe", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportCfg", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportSrc", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportAll", $$T_Bool, $$UNDEF, "w");
                po.addFld("relScript", $$T_Str, $$UNDEF, "w");
                po.addFld("relScriptArgs", $$T_Str, $$UNDEF, "w");
                po.addFld("prefix", $$T_Str, $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
        // struct Release.Desc
        po = (Proto.Obj)om.findStrict("xdc.bld.Release$$Desc", "xdc.bld");
        po.init("xdc.bld.Release.Desc", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("aname", $$T_Str, $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
        // typedef Release.DescArray
        om.bind("xdc.bld.Release.DescArray", new Proto.Arr((Proto)om.findStrict("xdc.bld.Release.Desc", "xdc.bld"), false));
    }

    void Library$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/Library.xs");
        om.bind("xdc.bld.Library$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.Library.Module", "xdc.bld");
        po.init("xdc.bld.Library.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.bld.Library$$create", "xdc.bld"), Global.get("xdc$bld$Library$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.bld.Library$$construct", "xdc.bld"), Global.get("xdc$bld$Library$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.Library$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.Library$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.bld.Library$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.Library$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.bld.Library.Instance", "xdc.bld");
        po.init("xdc.bld.Library.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Library.Attrs", "xdc.bld"), $$DEFAULT, "wh");
                po.addFxn("addObjects", (Proto.Fxn)om.findStrict("xdc.bld.Library$$addObjects", "xdc.bld"), Global.get(cap, "addObjects"));
        po = (Proto.Obj)om.findStrict("xdc.bld.Library$$Params", "xdc.bld");
        po.init("xdc.bld.Library.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Library.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Library$$Object", "xdc.bld");
        po.init("xdc.bld.Library.Object", om.findStrict("xdc.bld.Library.Instance", "xdc.bld"));
                po.addFxn("addObjects", (Proto.Fxn)om.findStrict("xdc.bld.Library$$addObjects", "xdc.bld"), Global.get(cap, "addObjects"));
        // struct Library.Attrs
        po = (Proto.Obj)om.findStrict("xdc.bld.Library$$Attrs", "xdc.bld");
        po.init("xdc.bld.Library.Attrs", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("profile", $$T_Str, $$UNDEF, "w");
                po.addFld("aopts", $$T_Str, $$UNDEF, "w");
                po.addFld("copts", $$T_Str, $$UNDEF, "w");
                po.addFld("defs", $$T_Str, $$UNDEF, "w");
                po.addFld("incs", $$T_Str, $$UNDEF, "w");
                po.addFld("aropts", $$T_Str, $$UNDEF, "w");
                po.addFld("suffix", $$T_Str, $$UNDEF, "w");
                po.addFld("exportSrc", $$T_Bool, $$UNDEF, "w");
                po.addFld("releases", new Proto.Arr((Proto)om.findStrict("xdc.bld.Release.Instance", "xdc.bld"), false), $$DEFAULT, "w");
    }

    void Test$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.bld.Test.Module", "xdc.bld");
        po.init("xdc.bld.Test.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.bld.Test$$create", "xdc.bld"), Global.get("xdc$bld$Test$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.bld.Test$$construct", "xdc.bld"), Global.get("xdc$bld$Test$$construct"));
        po = (Proto.Obj)om.findStrict("xdc.bld.Test.Instance", "xdc.bld");
        po.init("xdc.bld.Test.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Test.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Test$$Params", "xdc.bld");
        po.init("xdc.bld.Test.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Test.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Test$$Object", "xdc.bld");
        po.init("xdc.bld.Test.Object", om.findStrict("xdc.bld.Test.Instance", "xdc.bld"));
        // struct Test.Attrs
        po = (Proto.Obj)om.findStrict("xdc.bld.Test$$Attrs", "xdc.bld");
        po.init("xdc.bld.Test.Attrs", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("args", $$T_Str, $$UNDEF, "w");
                po.addFld("execCmd", $$T_Str, $$UNDEF, "w");
                po.addFld("execArgs", $$T_Str, $$UNDEF, "w");
                po.addFld("groupName", $$T_Str, $$UNDEF, "w");
                po.addFld("refOutput", $$T_Str, $$UNDEF, "w");
                po.addFld("cmpCmd", $$T_Str, $$UNDEF, "w");
                po.addFld("refExitCode", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
    }

    void Object$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.bld.Object.Module", "xdc.bld");
        po.init("xdc.bld.Object.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.bld.Object$$create", "xdc.bld"), Global.get("xdc$bld$Object$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.bld.Object$$construct", "xdc.bld"), Global.get("xdc$bld$Object$$construct"));
        po = (Proto.Obj)om.findStrict("xdc.bld.Object.Instance", "xdc.bld");
        po.init("xdc.bld.Object.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Object.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Object$$Params", "xdc.bld");
        po.init("xdc.bld.Object.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Object.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Object$$Object", "xdc.bld");
        po.init("xdc.bld.Object.Object", om.findStrict("xdc.bld.Object.Instance", "xdc.bld"));
        // struct Object.Attrs
        po = (Proto.Obj)om.findStrict("xdc.bld.Object$$Attrs", "xdc.bld");
        po.init("xdc.bld.Object.Attrs", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("profile", $$T_Str, $$UNDEF, "w");
                po.addFld("aopts", $$T_Str, $$UNDEF, "w");
                po.addFld("copts", $$T_Str, $$UNDEF, "w");
                po.addFld("defs", $$T_Str, $$UNDEF, "w");
                po.addFld("incs", $$T_Str, $$UNDEF, "w");
                po.addFld("preBuilt", $$T_Bool, $$UNDEF, "w");
    }

    void Executable$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/Executable.xs");
        om.bind("xdc.bld.Executable$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.Executable.Module", "xdc.bld");
        po.init("xdc.bld.Executable.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.bld.Executable$$create", "xdc.bld"), Global.get("xdc$bld$Executable$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.bld.Executable$$construct", "xdc.bld"), Global.get("xdc$bld$Executable$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.Executable$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.Executable$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.bld.Executable$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.Executable$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.bld.Executable.Instance", "xdc.bld");
        po.init("xdc.bld.Executable.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("platform", $$T_Str, $$UNDEF, "wh");
        po.addFld("target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Executable.Attrs", "xdc.bld"), $$DEFAULT, "wh");
                po.addFxn("addObjects", (Proto.Fxn)om.findStrict("xdc.bld.Executable$$addObjects", "xdc.bld"), Global.get(cap, "addObjects"));
                po.addFxn("addTest", (Proto.Fxn)om.findStrict("xdc.bld.Executable$$addTest", "xdc.bld"), Global.get(cap, "addTest"));
        po = (Proto.Obj)om.findStrict("xdc.bld.Executable$$Params", "xdc.bld");
        po.init("xdc.bld.Executable.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("platform", $$T_Str, $$UNDEF, "wh");
        po.addFld("target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Executable.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Executable$$Object", "xdc.bld");
        po.init("xdc.bld.Executable.Object", om.findStrict("xdc.bld.Executable.Instance", "xdc.bld"));
                po.addFxn("addObjects", (Proto.Fxn)om.findStrict("xdc.bld.Executable$$addObjects", "xdc.bld"), Global.get(cap, "addObjects"));
                po.addFxn("addTest", (Proto.Fxn)om.findStrict("xdc.bld.Executable$$addTest", "xdc.bld"), Global.get(cap, "addTest"));
        // struct Executable.Attrs
        po = (Proto.Obj)om.findStrict("xdc.bld.Executable$$Attrs", "xdc.bld");
        po.init("xdc.bld.Executable.Attrs", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("profile", $$T_Str, $$UNDEF, "w");
                po.addFld("aopts", $$T_Str, $$UNDEF, "w");
                po.addFld("copts", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgcopts", $$T_Str, $$UNDEF, "w");
                po.addFld("defs", $$T_Str, $$UNDEF, "w");
                po.addFld("incs", $$T_Str, $$UNDEF, "w");
                po.addFld("lopts", $$T_Str, $$UNDEF, "w");
                po.addFld("xsopts", $$T_Str, $$UNDEF, "w");
                po.addFld("cpuId", $$T_Str, $$UNDEF, "w");
                po.addFld("rtsName", $$T_Str, $$UNDEF, "w");
                po.addFld("cpuArgs", $$T_Obj, $$UNDEF, "w");
                po.addFld("sharedCfg", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgScript", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgHome", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgArgs", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgArgsEncoded", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportExe", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportCfg", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportSrc", $$T_Bool, $$UNDEF, "w");
                po.addFld("releases", new Proto.Arr((Proto)om.findStrict("xdc.bld.Release.Instance", "xdc.bld"), false), $$DEFAULT, "w");
                po.addFld("test", (Proto)om.findStrict("xdc.bld.Test.Attrs", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("linkTemplate", $$T_Str, $$UNDEF, "w");
    }

    void Repository$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/Repository.xs");
        om.bind("xdc.bld.Repository$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.Repository.Module", "xdc.bld");
        po.init("xdc.bld.Repository.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.bld.Repository$$create", "xdc.bld"), Global.get("xdc$bld$Repository$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.bld.Repository$$construct", "xdc.bld"), Global.get("xdc$bld$Repository$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.Repository$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.Repository$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.bld.Repository$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.Repository$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.bld.Repository.Instance", "xdc.bld");
        po.init("xdc.bld.Repository.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Repository.Attrs", "xdc.bld"), $$DEFAULT, "wh");
                po.addFxn("addPackages", (Proto.Fxn)om.findStrict("xdc.bld.Repository$$addPackages", "xdc.bld"), Global.get(cap, "addPackages"));
        po = (Proto.Obj)om.findStrict("xdc.bld.Repository$$Params", "xdc.bld");
        po.init("xdc.bld.Repository.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Repository.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Repository$$Object", "xdc.bld");
        po.init("xdc.bld.Repository.Object", om.findStrict("xdc.bld.Repository.Instance", "xdc.bld"));
                po.addFxn("addPackages", (Proto.Fxn)om.findStrict("xdc.bld.Repository$$addPackages", "xdc.bld"), Global.get(cap, "addPackages"));
        // struct Repository.Attrs
        po = (Proto.Obj)om.findStrict("xdc.bld.Repository$$Attrs", "xdc.bld");
        po.init("xdc.bld.Repository.Attrs", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("releases", new Proto.Arr((Proto)om.findStrict("xdc.bld.Release.Instance", "xdc.bld"), false), $$DEFAULT, "w");
                po.addFld("search", $$T_Bool, $$UNDEF, "w");
                po.addFld("archivePath", $$T_Str, $$UNDEF, "w");
    }

    void Assembly$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.bld.Assembly.Module", "xdc.bld");
        po.init("xdc.bld.Assembly.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.bld.Assembly$$create", "xdc.bld"), Global.get("xdc$bld$Assembly$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.bld.Assembly$$construct", "xdc.bld"), Global.get("xdc$bld$Assembly$$construct"));
        po = (Proto.Obj)om.findStrict("xdc.bld.Assembly.Instance", "xdc.bld");
        po.init("xdc.bld.Assembly.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("platform", $$T_Str, $$UNDEF, "wh");
        po.addFld("target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Executable.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Assembly$$Params", "xdc.bld");
        po.init("xdc.bld.Assembly.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("platform", $$T_Str, $$UNDEF, "wh");
        po.addFld("target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Executable.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Assembly$$Object", "xdc.bld");
        po.init("xdc.bld.Assembly.Object", om.findStrict("xdc.bld.Assembly.Instance", "xdc.bld"));
    }

    void Configuration$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/Configuration.xs");
        om.bind("xdc.bld.Configuration$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.Configuration.Module", "xdc.bld");
        po.init("xdc.bld.Configuration.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.bld.Configuration$$create", "xdc.bld"), Global.get("xdc$bld$Configuration$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.bld.Configuration$$construct", "xdc.bld"), Global.get("xdc$bld$Configuration$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.Configuration$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.Configuration$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.bld.Configuration$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.Configuration$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.bld.Configuration.Instance", "xdc.bld");
        po.init("xdc.bld.Configuration.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("platform", $$T_Str, $$UNDEF, "wh");
        po.addFld("target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Configuration.Attrs", "xdc.bld"), $$DEFAULT, "wh");
                po.addFxn("getBaseName", (Proto.Fxn)om.findStrict("xdc.bld.Configuration$$getBaseName", "xdc.bld"), Global.get(cap, "getBaseName"));
        po = (Proto.Obj)om.findStrict("xdc.bld.Configuration$$Params", "xdc.bld");
        po.init("xdc.bld.Configuration.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("platform", $$T_Str, $$UNDEF, "wh");
        po.addFld("target", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Configuration.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Configuration$$Object", "xdc.bld");
        po.init("xdc.bld.Configuration.Object", om.findStrict("xdc.bld.Configuration.Instance", "xdc.bld"));
                po.addFxn("getBaseName", (Proto.Fxn)om.findStrict("xdc.bld.Configuration$$getBaseName", "xdc.bld"), Global.get(cap, "getBaseName"));
        // struct Configuration.Attrs
        po = (Proto.Obj)om.findStrict("xdc.bld.Configuration$$Attrs", "xdc.bld");
        po.init("xdc.bld.Configuration.Attrs", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("profile", $$T_Str, $$UNDEF, "w");
                po.addFld("aopts", $$T_Str, $$UNDEF, "w");
                po.addFld("copts", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgcopts", $$T_Str, $$UNDEF, "w");
                po.addFld("defs", $$T_Str, $$UNDEF, "w");
                po.addFld("incs", $$T_Str, $$UNDEF, "w");
                po.addFld("lopts", $$T_Str, $$UNDEF, "w");
                po.addFld("xsopts", $$T_Str, $$UNDEF, "w");
                po.addFld("cpuId", $$T_Str, $$UNDEF, "w");
                po.addFld("rtsName", $$T_Str, $$UNDEF, "w");
                po.addFld("cpuArgs", $$T_Obj, $$UNDEF, "w");
                po.addFld("cfgScript", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgHome", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgArgs", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgArgsEncoded", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportCfg", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportSrc", $$T_Bool, $$UNDEF, "w");
                po.addFld("releases", new Proto.Arr((Proto)om.findStrict("xdc.bld.Release.Instance", "xdc.bld"), false), $$DEFAULT, "w");
                po.addFld("linkTemplate", $$T_Str, $$UNDEF, "w");
                po.addFld("prelink", $$T_Bool, $$UNDEF, "w");
    }

    void Script$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/Script.xs");
        om.bind("xdc.bld.Script$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.Script.Module", "xdc.bld");
        po.init("xdc.bld.Script.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.bld.Script$$create", "xdc.bld"), Global.get("xdc$bld$Script$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.bld.Script$$construct", "xdc.bld"), Global.get("xdc$bld$Script$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.Script$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.Script$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.bld.Script$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.Script$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.bld.Script.Instance", "xdc.bld");
        po.init("xdc.bld.Script.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Script.Attrs", "xdc.bld"), $$DEFAULT, "wh");
                po.addFxn("addTest", (Proto.Fxn)om.findStrict("xdc.bld.Script$$addTest", "xdc.bld"), Global.get(cap, "addTest"));
        po = (Proto.Obj)om.findStrict("xdc.bld.Script$$Params", "xdc.bld");
        po.init("xdc.bld.Script.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.bld.Script.Attrs", "xdc.bld"), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.bld.Script$$Object", "xdc.bld");
        po.init("xdc.bld.Script.Object", om.findStrict("xdc.bld.Script.Instance", "xdc.bld"));
                po.addFxn("addTest", (Proto.Fxn)om.findStrict("xdc.bld.Script$$addTest", "xdc.bld"), Global.get(cap, "addTest"));
        // struct Script.Attrs
        po = (Proto.Obj)om.findStrict("xdc.bld.Script$$Attrs", "xdc.bld");
        po.init("xdc.bld.Script.Attrs", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("hasMain", $$T_Bool, $$UNDEF, "w");
                po.addFld("exportSrc", $$T_Bool, $$UNDEF, "w");
                po.addFld("releases", new Proto.Arr((Proto)om.findStrict("xdc.bld.Release.Instance", "xdc.bld"), false), $$DEFAULT, "w");
    }

    void Manifest$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/Manifest.xs");
        om.bind("xdc.bld.Manifest$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.Manifest.Module", "xdc.bld");
        po.init("xdc.bld.Manifest.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("compatibilityKey", $$T_Str, $$UNDEF, "wh");
        po.addFld("buildCount", $$T_Str, $$UNDEF, "wh");
        po.addFld("packageName", $$T_Str, $$UNDEF, "wh");
        po.addFld("releaseName", $$T_Str, $$UNDEF, "wh");
        po.addFld("files", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("filterMap", new Proto.Map((Proto)om.findStrict("xdc.bld.Manifest.Filter", "xdc.bld")), $$DEFAULT, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.Manifest$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.Manifest$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.Manifest$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("getAllFiles", (Proto.Fxn)om.findStrict("xdc.bld.Manifest$$getAllFiles", "xdc.bld"), Global.get(cap, "getAllFiles"));
        // struct Manifest.Filter
        po = (Proto.Obj)om.findStrict("xdc.bld.Manifest$$Filter", "xdc.bld");
        po.init("xdc.bld.Manifest.Filter", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("operation", $$T_Obj, $$UNDEF, "w");
                po.addFld("args", new Proto.Arr($$T_Obj, false), $$DEFAULT, "w");
                po.addFld("newFileName", $$T_Str, $$UNDEF, "w");
                po.addFld("newFileMode", $$T_Str, $$UNDEF, "w");
    }

    void Utils$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/Utils.xs");
        om.bind("xdc.bld.Utils$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.Utils.Module", "xdc.bld");
        po.init("xdc.bld.Utils.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.Utils$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.Utils$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.Utils$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("expandString", (Proto.Fxn)om.findStrict("xdc.bld.Utils$$expandString", "xdc.bld"), Global.get(cap, "expandString"));
                po.addFxn("expandDbgName", (Proto.Fxn)om.findStrict("xdc.bld.Utils$$expandDbgName", "xdc.bld"), Global.get(cap, "expandDbgName"));
                po.addFxn("parsePlatName", (Proto.Fxn)om.findStrict("xdc.bld.Utils$$parsePlatName", "xdc.bld"), Global.get(cap, "parsePlatName"));
                po.addFxn("display", (Proto.Fxn)om.findStrict("xdc.bld.Utils$$display", "xdc.bld"), Global.get(cap, "display"));
    }

    void ITarget$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/ITarget.xs");
        om.bind("xdc.bld.ITarget$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld");
        po.init("xdc.bld.ITarget.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "rh");
        po.addFld("suffix", $$T_Str, $$UNDEF, "rh");
        po.addFld("compatibleSuffixes", new Proto.Arr($$T_Str, false), $$DEFAULT, "wh");
        po.addFld("isa", $$T_Str, $$UNDEF, "rh");
        po.addFld("model", (Proto)om.findStrict("xdc.bld.ITarget.Model", "xdc.bld"), $$DEFAULT, "rh");
        po.addFld("os", $$T_Str, $$UNDEF, "rh");
        po.addFld("rts", $$T_Str, $$UNDEF, "rh");
        po.addFld("base", (Proto)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"), $$UNDEF, "rh");
        po.addFld("dllExt", $$T_Str, $$UNDEF, "wh");
        po.addFld("execExt", $$T_Str, $$UNDEF, "wh");
        po.addFld("platform", $$T_Str, $$UNDEF, "wh");
        po.addFld("platforms", new Proto.Arr($$T_Str, false), Global.newArray(new Object[]{}), "wh");
        po.addFld("binaryParser", $$T_Str, $$UNDEF, "wh");
        po.addFld("version", $$T_Str, $$UNDEF, "wh");
        po.addFld("versionRaw", $$T_Str, $$UNDEF, "wh");
        po.addFld("debugGen", (Proto)om.findStrict("xdc.bld.ITarget.DebugGen", "xdc.bld"), $$DEFAULT, "wh");
        po.addFld("extensions", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.Extension", "xdc.bld")), Global.newArray(new Object[]{Global.newArray(new Object[]{".asm", Global.newObject("suf", ".asm", "typ", "asm")}), Global.newArray(new Object[]{".c", Global.newObject("suf", ".c", "typ", "c")}), Global.newArray(new Object[]{".cpp", Global.newObject("suf", ".cpp", "typ", "cpp")}), Global.newArray(new Object[]{".cxx", Global.newObject("suf", ".cxx", "typ", "cpp")}), Global.newArray(new Object[]{".C", Global.newObject("suf", ".C", "typ", "cpp")}), Global.newArray(new Object[]{".cc", Global.newObject("suf", ".cc", "typ", "cpp")})}), "wh");
        po.addFld("versionMap", new Proto.Map($$T_Str), Global.newArray(new Object[]{}), "wh");
        po.addFld("alignDirectiveSupported", $$T_Bool, false, "rh");
        po.addFld("rootDir", $$T_Str, $$UNDEF, "wh");
        po.addFld("profiles", new Proto.Map((Proto)om.findStrict("xdc.bld.ITarget.OptionSet", "xdc.bld")), Global.newArray(new Object[]{Global.newArray(new Object[]{"release", Global.newObject()}), Global.newArray(new Object[]{"debug", Global.newObject()})}), "wh");
        po.addFld("sectMap", new Proto.Map($$T_Str), $$DEFAULT, "rh");
        po.addFld("stdInclude", $$T_Str, $$UNDEF, "rh");
        po.addFld("stdTypes", (Proto)om.findStrict("xdc.bld.ITarget.StdTypes", "xdc.bld"), Global.newObject("t_IArg", Global.newObject("size", 0L, "align", 0L), "t_Char", Global.newObject("size", 0L, "align", 0L), "t_Double", Global.newObject("size", 0L, "align", 0L), "t_Float", Global.newObject("size", 0L, "align", 0L), "t_Fxn", Global.newObject("size", 0L, "align", 0L), "t_Int", Global.newObject("size", 0L, "align", 0L), "t_Int8", Global.newObject("size", 0L, "align", 0L), "t_Int16", Global.newObject("size", 0L, "align", 0L), "t_Int32", Global.newObject("size", 0L, "align", 0L), "t_Int40", Global.newObject("size", 0L, "align", 0L), "t_Int64", Global.newObject("size", 0L, "align", 0L), "t_Long", Global.newObject("size", 0L, "align", 0L), "t_LDouble", Global.newObject("size", 0L, "align", 0L), "t_LLong", Global.newObject("size", 0L, "align", 0L), "t_Ptr", Global.newObject("size", 0L, "align", 0L), "t_Short", Global.newObject("size", 0L, "align", 0L), "t_Size", Global.newObject("size", 0L, "align", 0L)), "rh");
        po.addFld("bitsPerChar", Proto.Elm.newCNum("(xdc_Int)"), 8L, "rh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.ITarget$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.ITarget$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.ITarget$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "xdc.bld"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "xdc.bld"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "xdc.bld"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "xdc.bld"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "xdc.bld"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "xdc.bld"), fxn);
        // struct ITarget.Model
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$Model", "xdc.bld");
        po.init("xdc.bld.ITarget.Model", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("endian", $$T_Str, $$UNDEF, "w");
                po.addFld("codeModel", $$T_Str, $$UNDEF, "w");
                po.addFld("dataModel", $$T_Str, $$UNDEF, "w");
                po.addFld("shortEnums", $$T_Bool, $$UNDEF, "w");
        // struct ITarget.DebugGen
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$DebugGen", "xdc.bld");
        po.init("xdc.bld.ITarget.DebugGen", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("execTemplate", $$T_Str, $$UNDEF, "w");
                po.addFld("execPattern", $$T_Str, $$UNDEF, "w");
                po.addFld("packageTemplate", $$T_Str, $$UNDEF, "w");
                po.addFld("packagePattern", $$T_Str, $$UNDEF, "w");
        // struct ITarget.Extension
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$Extension", "xdc.bld");
        po.init("xdc.bld.ITarget.Extension", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("suf", $$T_Str, $$UNDEF, "w");
                po.addFld("typ", $$T_Str, $$UNDEF, "w");
        // struct ITarget.CompileOptions
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$CompileOptions", "xdc.bld");
        po.init("xdc.bld.ITarget.CompileOptions", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("aopts", $$T_Str, $$UNDEF, "w");
                po.addFld("copts", $$T_Str, $$UNDEF, "w");
                po.addFld("cfgcopts", $$T_Str, $$UNDEF, "w");
                po.addFld("defs", $$T_Str, $$UNDEF, "w");
                po.addFld("incs", $$T_Str, $$UNDEF, "w");
        // struct ITarget.OptionSet
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$OptionSet", "xdc.bld");
        po.init("xdc.bld.ITarget.OptionSet", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("compileOpts", (Proto)om.findStrict("xdc.bld.ITarget.CompileOptions", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("linkOpts", $$T_Str, $$UNDEF, "w");
                po.addFld("archiveOpts", $$T_Str, $$UNDEF, "w");
                po.addFld("filters", new Proto.Arr((Proto)om.findStrict("xdc.bld.ITargetFilter.InstDesc", "xdc.bld"), false), $$DEFAULT, "w");
        // struct ITarget.CompileGoal
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$CompileGoal", "xdc.bld");
        po.init("xdc.bld.ITarget.CompileGoal", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("base", $$T_Str, $$UNDEF, "w");
                po.addFld("dstPrefix", $$T_Str, $$UNDEF, "w");
                po.addFld("dstSuffix", $$T_Str, $$UNDEF, "w");
                po.addFld("srcSuffix", $$T_Str, $$UNDEF, "w");
                po.addFld("srcPrefix", $$T_Str, $$UNDEF, "w");
                po.addFld("profile", $$T_Str, $$UNDEF, "w");
                po.addFld("opts", (Proto)om.findStrict("xdc.bld.ITarget.CompileOptions", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("configOpts", $$T_Bool, $$UNDEF, "w");
        // struct ITarget.LinkGoal
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$LinkGoal", "xdc.bld");
        po.init("xdc.bld.ITarget.LinkGoal", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("base", $$T_Str, $$UNDEF, "w");
                po.addFld("dstPrefix", $$T_Str, $$UNDEF, "w");
                po.addFld("dstSuffix", $$T_Str, $$UNDEF, "w");
                po.addFld("files", $$T_Str, $$UNDEF, "w");
                po.addFld("profile", $$T_Str, $$UNDEF, "w");
                po.addFld("opts", $$T_Str, $$UNDEF, "w");
                po.addFld("dllMode", $$T_Bool, $$UNDEF, "w");
                po.addFld("isRom", $$T_Bool, $$UNDEF, "w");
        // struct ITarget.ArchiveGoal
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$ArchiveGoal", "xdc.bld");
        po.init("xdc.bld.ITarget.ArchiveGoal", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("base", $$T_Str, $$UNDEF, "w");
                po.addFld("dstPrefix", $$T_Str, $$UNDEF, "w");
                po.addFld("dstSuffix", $$T_Str, $$UNDEF, "w");
                po.addFld("files", $$T_Str, $$UNDEF, "w");
                po.addFld("profile", $$T_Str, $$UNDEF, "w");
                po.addFld("opts", $$T_Str, $$UNDEF, "w");
        // struct ITarget.CommandSet
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$CommandSet", "xdc.bld");
        po.init("xdc.bld.ITarget.CommandSet", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("msg", $$T_Str, $$UNDEF, "w");
                po.addFld("cmds", $$T_Str, $$UNDEF, "w");
                po.addFld("path", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("envs", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
        // typedef ITarget.StringArray
        om.bind("xdc.bld.ITarget.StringArray", new Proto.Arr($$T_Str, false));
        // struct ITarget.TypeInfo
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$TypeInfo", "xdc.bld");
        po.init("xdc.bld.ITarget.TypeInfo", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("size", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("align", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // struct ITarget.StdTypes
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget$$StdTypes", "xdc.bld");
        po.init("xdc.bld.ITarget.StdTypes", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("t_IArg", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Char", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Double", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Float", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Fxn", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Int", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Int8", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Int16", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Int32", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Int40", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Int64", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Long", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_LDouble", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_LLong", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Ptr", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Short", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
                po.addFld("t_Size", (Proto)om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"), $$DEFAULT, "w");
    }

    void ITarget2$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/ITarget2.xs");
        om.bind("xdc.bld.ITarget2$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget2.Module", "xdc.bld");
        po.init("xdc.bld.ITarget2.Module", om.findStrict("xdc.bld.ITarget.Module", "xdc.bld"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("ar", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "xdc.bld"), $$DEFAULT, "rh");
        po.addFld("arOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "xdc.bld"), Global.newObject("prefix", "", "suffix", ""), "wh");
        po.addFld("lnk", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "xdc.bld"), $$DEFAULT, "rh");
        po.addFld("lnkOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "xdc.bld"), Global.newObject("prefix", "", "suffix", ""), "wh");
        po.addFld("cc", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "xdc.bld"), $$DEFAULT, "rh");
        po.addFld("ccOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "xdc.bld"), Global.newObject("prefix", "", "suffix", ""), "wh");
        po.addFld("ccConfigOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "xdc.bld"), Global.newObject("prefix", "$(ccOpts.prefix)", "suffix", "$(ccOpts.suffix)"), "wh");
        po.addFld("asm", (Proto)om.findStrict("xdc.bld.ITarget2.Command", "xdc.bld"), $$DEFAULT, "rh");
        po.addFld("asmOpts", (Proto)om.findStrict("xdc.bld.ITarget2.Options", "xdc.bld"), Global.newObject("prefix", "", "suffix", ""), "wh");
        po.addFld("includeOpts", $$T_Str, $$UNDEF, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.ITarget2$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.ITarget2$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.ITarget2$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "xdc.bld"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "xdc.bld"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "xdc.bld"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "xdc.bld"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "xdc.bld"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "xdc.bld"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "xdc.bld"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "xdc.bld"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "xdc.bld"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "xdc.bld"), fxn);
        // struct ITarget2.Command
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget2$$Command", "xdc.bld");
        po.init("xdc.bld.ITarget2.Command", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("cmd", $$T_Str, $$UNDEF, "w");
                po.addFld("opts", $$T_Str, $$UNDEF, "w");
        // struct ITarget2.Options
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget2$$Options", "xdc.bld");
        po.init("xdc.bld.ITarget2.Options", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("prefix", $$T_Str, $$UNDEF, "w");
                po.addFld("suffix", $$T_Str, $$UNDEF, "w");
    }

    void ITarget3$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/ITarget3.xs");
        om.bind("xdc.bld.ITarget3$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget3.Module", "xdc.bld");
        po.init("xdc.bld.ITarget3.Module", om.findStrict("xdc.bld.ITarget2.Module", "xdc.bld"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("rawVersion", $$T_Str, $$UNDEF, "wh");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.ITarget3$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.ITarget3$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.ITarget3$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$archive", "xdc.bld"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$compile", "xdc.bld"), fxn);
                fxn = Global.get(cap, "scompile");
                if (fxn != null) po.addFxn("scompile", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$scompile", "xdc.bld"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$link", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getVersion");
                if (fxn != null) po.addFxn("getVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getVersion", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getISAChain");
                if (fxn != null) po.addFxn("getISAChain", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$getISAChain", "xdc.bld"), fxn);
                fxn = Global.get(cap, "findSuffix");
                if (fxn != null) po.addFxn("findSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$findSuffix", "xdc.bld"), fxn);
                fxn = Global.get(cap, "selectSuffix");
                if (fxn != null) po.addFxn("selectSuffix", (Proto.Fxn)om.findStrict("xdc.bld.ITarget$$selectSuffix", "xdc.bld"), fxn);
                fxn = Global.get(cap, "genConstCustom");
                if (fxn != null) po.addFxn("genConstCustom", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genConstCustom", "xdc.bld"), fxn);
                fxn = Global.get(cap, "genVisibleData");
                if (fxn != null) po.addFxn("genVisibleData", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleData", "xdc.bld"), fxn);
                fxn = Global.get(cap, "genVisibleFxns");
                if (fxn != null) po.addFxn("genVisibleFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleFxns", "xdc.bld"), fxn);
                fxn = Global.get(cap, "genVisibleLibFxns");
                if (fxn != null) po.addFxn("genVisibleLibFxns", (Proto.Fxn)om.findStrict("xdc.bld.ITarget2$$genVisibleLibFxns", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getRawVersion");
                if (fxn != null) po.addFxn("getRawVersion", (Proto.Fxn)om.findStrict("xdc.bld.ITarget3$$getRawVersion", "xdc.bld"), fxn);
    }

    void ITargetFilter$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/ITargetFilter.xs");
        om.bind("xdc.bld.ITargetFilter$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.bld.ITargetFilter.Module", "xdc.bld");
        po.init("xdc.bld.ITargetFilter.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.bld.ITargetFilter$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.bld.ITargetFilter$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.bld.ITargetFilter$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.bld.ITargetFilter$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.bld.ITargetFilter.Instance", "xdc.bld");
        po.init("xdc.bld.ITargetFilter.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                fxn = Global.get(cap, "archive");
                if (fxn != null) po.addFxn("archive", (Proto.Fxn)om.findStrict("xdc.bld.ITargetFilter$$archive", "xdc.bld"), fxn);
                fxn = Global.get(cap, "compile");
                if (fxn != null) po.addFxn("compile", (Proto.Fxn)om.findStrict("xdc.bld.ITargetFilter$$compile", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getGenTab");
                if (fxn != null) po.addFxn("getGenTab", (Proto.Fxn)om.findStrict("xdc.bld.ITargetFilter$$getGenTab", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getDefs");
                if (fxn != null) po.addFxn("getDefs", (Proto.Fxn)om.findStrict("xdc.bld.ITargetFilter$$getDefs", "xdc.bld"), fxn);
                fxn = Global.get(cap, "link");
                if (fxn != null) po.addFxn("link", (Proto.Fxn)om.findStrict("xdc.bld.ITargetFilter$$link", "xdc.bld"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.bld.ITargetFilter$$Params", "xdc.bld");
        po.init("xdc.bld.ITargetFilter.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        // struct ITargetFilter.InstDesc
        po = (Proto.Obj)om.findStrict("xdc.bld.ITargetFilter$$InstDesc", "xdc.bld");
        po.init("xdc.bld.ITargetFilter.InstDesc", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("moduleName", $$T_Str, $$UNDEF, "w");
                po.addFld("params", $$T_Obj, $$UNDEF, "w");
        // struct ITargetFilter.GenDesc
        po = (Proto.Obj)om.findStrict("xdc.bld.ITargetFilter$$GenDesc", "xdc.bld");
        po.init("xdc.bld.ITargetFilter.GenDesc", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("template", $$T_Str, $$UNDEF, "w");
                po.addFld("file", $$T_Str, $$UNDEF, "w");
        // struct ITargetFilter.MacroDesc
        po = (Proto.Obj)om.findStrict("xdc.bld.ITargetFilter$$MacroDesc", "xdc.bld");
        po.init("xdc.bld.ITargetFilter.MacroDesc", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("value", $$T_Str, $$UNDEF, "w");
    }

    void BuildEnvironment$$ROV()
    {
    }

    void PackageContents$$ROV()
    {
    }

    void Release$$ROV()
    {
    }

    void Library$$ROV()
    {
    }

    void Test$$ROV()
    {
    }

    void Object$$ROV()
    {
    }

    void Executable$$ROV()
    {
    }

    void Repository$$ROV()
    {
    }

    void Assembly$$ROV()
    {
    }

    void Configuration$$ROV()
    {
    }

    void Script$$ROV()
    {
    }

    void Manifest$$ROV()
    {
    }

    void Utils$$ROV()
    {
    }

    void ITarget$$ROV()
    {
    }

    void ITarget2$$ROV()
    {
    }

    void ITarget3$$ROV()
    {
    }

    void ITargetFilter$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.bld.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.bld"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/bld/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "xdc.bld"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "xdc.bld"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "xdc.bld"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "xdc.bld"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "xdc.bld"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "xdc.bld", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.bld");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.bld.");
        pkgV.bind("$vers", Global.newArray(1, 0, 2));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.services.global", Global.newArray()));
        imports.add(Global.newArray("xdc.services.intern.cmd", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.bld'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.bld$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.bld$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.bld$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void BuildEnvironment$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.BuildEnvironment", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.BuildEnvironment.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.BuildEnvironment", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.bld.BuildEnvironment$$capsule", "xdc.bld"));
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("HostOS", om.findStrict("xdc.bld.BuildEnvironment.HostOS", "xdc.bld"));
        vo.bind("WINDOWS", om.findStrict("xdc.bld.BuildEnvironment.WINDOWS", "xdc.bld"));
        vo.bind("SOLARIS", om.findStrict("xdc.bld.BuildEnvironment.SOLARIS", "xdc.bld"));
        vo.bind("LINUX", om.findStrict("xdc.bld.BuildEnvironment.LINUX", "xdc.bld"));
        vo.bind("MACOS", om.findStrict("xdc.bld.BuildEnvironment.MACOS", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.BuildEnvironment$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("BuildEnvironment", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("BuildEnvironment");
    }

    void PackageContents$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.PackageContents", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.PackageContents.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.PackageContents", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.bld.PackageContents$$capsule", "xdc.bld"));
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Attrs", om.findStrict("xdc.bld.PackageContents.Attrs", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.PackageContents.Attrs", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.PackageContents$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("PackageContents", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("PackageContents");
    }

    void Release$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Release", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Release.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Release", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.bld.Release.Instance", "xdc.bld"));
        vo.bind("Params", om.findStrict("xdc.bld.Release.Params", "xdc.bld"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.bld.Release.Params", "xdc.bld")).newInstance());
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Attrs", om.findStrict("xdc.bld.Release.Attrs", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.Release.Attrs", "xdc.bld"));
        vo.bind("Desc", om.findStrict("xdc.bld.Release.Desc", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.Release.Desc", "xdc.bld"));
        vo.bind("DescArray", om.findStrict("xdc.bld.Release.DescArray", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Release$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.bld.Release.Object", "xdc.bld"));
        pkgV.bind("Release", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Release");
    }

    void Library$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Library", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Library.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Library", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.bld.Library$$capsule", "xdc.bld"));
        vo.bind("Instance", om.findStrict("xdc.bld.Library.Instance", "xdc.bld"));
        vo.bind("Params", om.findStrict("xdc.bld.Library.Params", "xdc.bld"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.bld.Library.Params", "xdc.bld")).newInstance());
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Attrs", om.findStrict("xdc.bld.Library.Attrs", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.Library.Attrs", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Library$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.bld.Library.Object", "xdc.bld"));
        pkgV.bind("Library", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Library");
    }

    void Test$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Test", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Test.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Test", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.bld.Test.Instance", "xdc.bld"));
        vo.bind("Params", om.findStrict("xdc.bld.Test.Params", "xdc.bld"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.bld.Test.Params", "xdc.bld")).newInstance());
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Attrs", om.findStrict("xdc.bld.Test.Attrs", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.Test.Attrs", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Test$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.bld.Test.Object", "xdc.bld"));
        pkgV.bind("Test", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Test");
    }

    void Object$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Object", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Object.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Object", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.bld.Object.Instance", "xdc.bld"));
        vo.bind("Params", om.findStrict("xdc.bld.Object.Params", "xdc.bld"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.bld.Object.Params", "xdc.bld")).newInstance());
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Attrs", om.findStrict("xdc.bld.Object.Attrs", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.Object.Attrs", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Object$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.bld.Object.Object", "xdc.bld"));
        pkgV.bind("Object", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Object");
    }

    void Executable$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Executable", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Executable.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Executable", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.bld.Executable$$capsule", "xdc.bld"));
        vo.bind("Instance", om.findStrict("xdc.bld.Executable.Instance", "xdc.bld"));
        vo.bind("Params", om.findStrict("xdc.bld.Executable.Params", "xdc.bld"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.bld.Executable.Params", "xdc.bld")).newInstance());
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Attrs", om.findStrict("xdc.bld.Executable.Attrs", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.Executable.Attrs", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Executable$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.bld.Executable.Object", "xdc.bld"));
        pkgV.bind("Executable", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Executable");
    }

    void Repository$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Repository", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Repository.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Repository", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.bld.Repository$$capsule", "xdc.bld"));
        vo.bind("Instance", om.findStrict("xdc.bld.Repository.Instance", "xdc.bld"));
        vo.bind("Params", om.findStrict("xdc.bld.Repository.Params", "xdc.bld"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.bld.Repository.Params", "xdc.bld")).newInstance());
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Attrs", om.findStrict("xdc.bld.Repository.Attrs", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.Repository.Attrs", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Repository$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.bld.Repository.Object", "xdc.bld"));
        pkgV.bind("Repository", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Repository");
    }

    void Assembly$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Assembly", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Assembly.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Assembly", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.bld.Assembly.Instance", "xdc.bld"));
        vo.bind("Params", om.findStrict("xdc.bld.Assembly.Params", "xdc.bld"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.bld.Assembly.Params", "xdc.bld")).newInstance());
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Assembly$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.bld.Assembly.Object", "xdc.bld"));
        pkgV.bind("Assembly", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Assembly");
    }

    void Configuration$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Configuration", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Configuration.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Configuration", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.bld.Configuration$$capsule", "xdc.bld"));
        vo.bind("Instance", om.findStrict("xdc.bld.Configuration.Instance", "xdc.bld"));
        vo.bind("Params", om.findStrict("xdc.bld.Configuration.Params", "xdc.bld"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.bld.Configuration.Params", "xdc.bld")).newInstance());
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Attrs", om.findStrict("xdc.bld.Configuration.Attrs", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.Configuration.Attrs", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Configuration$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.bld.Configuration.Object", "xdc.bld"));
        pkgV.bind("Configuration", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Configuration");
    }

    void Script$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Script", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Script.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Script", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.bld.Script$$capsule", "xdc.bld"));
        vo.bind("Instance", om.findStrict("xdc.bld.Script.Instance", "xdc.bld"));
        vo.bind("Params", om.findStrict("xdc.bld.Script.Params", "xdc.bld"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.bld.Script.Params", "xdc.bld")).newInstance());
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Attrs", om.findStrict("xdc.bld.Script.Attrs", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.Script.Attrs", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Script$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.bld.Script.Object", "xdc.bld"));
        pkgV.bind("Script", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Script");
    }

    void Manifest$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Manifest", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Manifest.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Manifest", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.bld.Manifest$$capsule", "xdc.bld"));
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Filter", om.findStrict("xdc.bld.Manifest.Filter", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.Manifest.Filter", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Manifest$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Manifest", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Manifest");
    }

    void Utils$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.Utils", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.Utils.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.Utils", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.bld.Utils$$capsule", "xdc.bld"));
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.bld")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.bld.Utils$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Utils", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Utils");
    }

    void ITarget$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.ITarget", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.ITarget", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.bld.ITarget$$capsule", "xdc.bld"));
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "xdc.bld"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "xdc.bld"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "xdc.bld"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "xdc.bld"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "xdc.bld"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "xdc.bld"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "xdc.bld"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "xdc.bld"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "xdc.bld"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "xdc.bld"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITarget", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITarget");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ITarget2$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.ITarget2", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget2.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.ITarget2", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.bld.ITarget2$$capsule", "xdc.bld"));
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "xdc.bld"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "xdc.bld"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "xdc.bld"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "xdc.bld"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "xdc.bld"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "xdc.bld"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "xdc.bld"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "xdc.bld"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "xdc.bld"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "xdc.bld"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "xdc.bld"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "xdc.bld"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITarget2", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITarget2");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ITarget3$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.ITarget3", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.ITarget3.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.ITarget3", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.bld.ITarget3$$capsule", "xdc.bld"));
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("Model", om.findStrict("xdc.bld.ITarget.Model", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Model", "xdc.bld"));
        vo.bind("DebugGen", om.findStrict("xdc.bld.ITarget.DebugGen", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.DebugGen", "xdc.bld"));
        vo.bind("Extension", om.findStrict("xdc.bld.ITarget.Extension", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.Extension", "xdc.bld"));
        vo.bind("CompileOptions", om.findStrict("xdc.bld.ITarget.CompileOptions", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileOptions", "xdc.bld"));
        vo.bind("OptionSet", om.findStrict("xdc.bld.ITarget.OptionSet", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.OptionSet", "xdc.bld"));
        vo.bind("CompileGoal", om.findStrict("xdc.bld.ITarget.CompileGoal", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CompileGoal", "xdc.bld"));
        vo.bind("LinkGoal", om.findStrict("xdc.bld.ITarget.LinkGoal", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.LinkGoal", "xdc.bld"));
        vo.bind("ArchiveGoal", om.findStrict("xdc.bld.ITarget.ArchiveGoal", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.ArchiveGoal", "xdc.bld"));
        vo.bind("CommandSet", om.findStrict("xdc.bld.ITarget.CommandSet", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.CommandSet", "xdc.bld"));
        vo.bind("StringArray", om.findStrict("xdc.bld.ITarget.StringArray", "xdc.bld"));
        vo.bind("TypeInfo", om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.TypeInfo", "xdc.bld"));
        vo.bind("StdTypes", om.findStrict("xdc.bld.ITarget.StdTypes", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget.StdTypes", "xdc.bld"));
        vo.bind("Command", om.findStrict("xdc.bld.ITarget2.Command", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Command", "xdc.bld"));
        vo.bind("Options", om.findStrict("xdc.bld.ITarget2.Options", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITarget2.Options", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.bld");
        inherits.add("xdc.bld");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITarget3", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITarget3");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ITargetFilter$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.bld.ITargetFilter", "xdc.bld");
        po = (Proto.Obj)om.findStrict("xdc.bld.ITargetFilter.Module", "xdc.bld");
        vo.init2(po, "xdc.bld.ITargetFilter", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.bld.ITargetFilter$$capsule", "xdc.bld"));
        vo.bind("Instance", om.findStrict("xdc.bld.ITargetFilter.Instance", "xdc.bld"));
        vo.bind("Params", om.findStrict("xdc.bld.ITargetFilter.Params", "xdc.bld"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.bld.ITargetFilter.Params", "xdc.bld")).newInstance());
        vo.bind("$package", om.findStrict("xdc.bld", "xdc.bld"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("InstDesc", om.findStrict("xdc.bld.ITargetFilter.InstDesc", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITargetFilter.InstDesc", "xdc.bld"));
        vo.bind("GenDesc", om.findStrict("xdc.bld.ITargetFilter.GenDesc", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITargetFilter.GenDesc", "xdc.bld"));
        vo.bind("MacroDesc", om.findStrict("xdc.bld.ITargetFilter.MacroDesc", "xdc.bld"));
        tdefs.add(om.findStrict("xdc.bld.ITargetFilter.MacroDesc", "xdc.bld"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITargetFilter", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITargetFilter");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.BuildEnvironment", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.PackageContents", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Release", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Library", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Test", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Object", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Executable", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Repository", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Assembly", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Configuration", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Script", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Manifest", "xdc.bld"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.bld.Utils", "xdc.bld"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.bld.BuildEnvironment")).bless();
        ((Value.Obj)om.getv("xdc.bld.PackageContents")).bless();
        ((Value.Obj)om.getv("xdc.bld.Release")).bless();
        ((Value.Obj)om.getv("xdc.bld.Library")).bless();
        ((Value.Obj)om.getv("xdc.bld.Test")).bless();
        ((Value.Obj)om.getv("xdc.bld.Object")).bless();
        ((Value.Obj)om.getv("xdc.bld.Executable")).bless();
        ((Value.Obj)om.getv("xdc.bld.Repository")).bless();
        ((Value.Obj)om.getv("xdc.bld.Assembly")).bless();
        ((Value.Obj)om.getv("xdc.bld.Configuration")).bless();
        ((Value.Obj)om.getv("xdc.bld.Script")).bless();
        ((Value.Obj)om.getv("xdc.bld.Manifest")).bless();
        ((Value.Obj)om.getv("xdc.bld.Utils")).bless();
        ((Value.Obj)om.getv("xdc.bld.ITarget")).bless();
        ((Value.Obj)om.getv("xdc.bld.ITarget2")).bless();
        ((Value.Obj)om.getv("xdc.bld.ITarget3")).bless();
        ((Value.Obj)om.getv("xdc.bld.ITargetFilter")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.bld")).add(pkgV);
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
        BuildEnvironment$$OBJECTS();
        PackageContents$$OBJECTS();
        Release$$OBJECTS();
        Library$$OBJECTS();
        Test$$OBJECTS();
        Object$$OBJECTS();
        Executable$$OBJECTS();
        Repository$$OBJECTS();
        Assembly$$OBJECTS();
        Configuration$$OBJECTS();
        Script$$OBJECTS();
        Manifest$$OBJECTS();
        Utils$$OBJECTS();
        ITarget$$OBJECTS();
        ITarget2$$OBJECTS();
        ITarget3$$OBJECTS();
        ITargetFilter$$OBJECTS();
        BuildEnvironment$$CONSTS();
        PackageContents$$CONSTS();
        Release$$CONSTS();
        Library$$CONSTS();
        Test$$CONSTS();
        Object$$CONSTS();
        Executable$$CONSTS();
        Repository$$CONSTS();
        Assembly$$CONSTS();
        Configuration$$CONSTS();
        Script$$CONSTS();
        Manifest$$CONSTS();
        Utils$$CONSTS();
        ITarget$$CONSTS();
        ITarget2$$CONSTS();
        ITarget3$$CONSTS();
        ITargetFilter$$CONSTS();
        BuildEnvironment$$CREATES();
        PackageContents$$CREATES();
        Release$$CREATES();
        Library$$CREATES();
        Test$$CREATES();
        Object$$CREATES();
        Executable$$CREATES();
        Repository$$CREATES();
        Assembly$$CREATES();
        Configuration$$CREATES();
        Script$$CREATES();
        Manifest$$CREATES();
        Utils$$CREATES();
        ITarget$$CREATES();
        ITarget2$$CREATES();
        ITarget3$$CREATES();
        ITargetFilter$$CREATES();
        BuildEnvironment$$FUNCTIONS();
        PackageContents$$FUNCTIONS();
        Release$$FUNCTIONS();
        Library$$FUNCTIONS();
        Test$$FUNCTIONS();
        Object$$FUNCTIONS();
        Executable$$FUNCTIONS();
        Repository$$FUNCTIONS();
        Assembly$$FUNCTIONS();
        Configuration$$FUNCTIONS();
        Script$$FUNCTIONS();
        Manifest$$FUNCTIONS();
        Utils$$FUNCTIONS();
        ITarget$$FUNCTIONS();
        ITarget2$$FUNCTIONS();
        ITarget3$$FUNCTIONS();
        ITargetFilter$$FUNCTIONS();
        BuildEnvironment$$SIZES();
        PackageContents$$SIZES();
        Release$$SIZES();
        Library$$SIZES();
        Test$$SIZES();
        Object$$SIZES();
        Executable$$SIZES();
        Repository$$SIZES();
        Assembly$$SIZES();
        Configuration$$SIZES();
        Script$$SIZES();
        Manifest$$SIZES();
        Utils$$SIZES();
        ITarget$$SIZES();
        ITarget2$$SIZES();
        ITarget3$$SIZES();
        ITargetFilter$$SIZES();
        BuildEnvironment$$TYPES();
        PackageContents$$TYPES();
        Release$$TYPES();
        Library$$TYPES();
        Test$$TYPES();
        Object$$TYPES();
        Executable$$TYPES();
        Repository$$TYPES();
        Assembly$$TYPES();
        Configuration$$TYPES();
        Script$$TYPES();
        Manifest$$TYPES();
        Utils$$TYPES();
        ITarget$$TYPES();
        ITarget2$$TYPES();
        ITarget3$$TYPES();
        ITargetFilter$$TYPES();
        if (isROV) {
            BuildEnvironment$$ROV();
            PackageContents$$ROV();
            Release$$ROV();
            Library$$ROV();
            Test$$ROV();
            Object$$ROV();
            Executable$$ROV();
            Repository$$ROV();
            Assembly$$ROV();
            Configuration$$ROV();
            Script$$ROV();
            Manifest$$ROV();
            Utils$$ROV();
            ITarget$$ROV();
            ITarget2$$ROV();
            ITarget3$$ROV();
            ITargetFilter$$ROV();
        }//isROV
        $$SINGLETONS();
        BuildEnvironment$$SINGLETONS();
        PackageContents$$SINGLETONS();
        Release$$SINGLETONS();
        Library$$SINGLETONS();
        Test$$SINGLETONS();
        Object$$SINGLETONS();
        Executable$$SINGLETONS();
        Repository$$SINGLETONS();
        Assembly$$SINGLETONS();
        Configuration$$SINGLETONS();
        Script$$SINGLETONS();
        Manifest$$SINGLETONS();
        Utils$$SINGLETONS();
        ITarget$$SINGLETONS();
        ITarget2$$SINGLETONS();
        ITarget3$$SINGLETONS();
        ITargetFilter$$SINGLETONS();
        $$INITIALIZATION();
    }
}
