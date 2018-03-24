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

public class xdc_rov_support
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
        pkgP = (Proto.Obj)om.bind("xdc.rov.support.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.rov.support", new Value.Obj("xdc.rov.support", pkgP));
    }

    void ScalarStructs$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.rov.support.ScalarStructs", new Value.Obj("xdc.rov.support.ScalarStructs", po));
        pkgV.bind("ScalarStructs", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Bits8", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Bits8", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Bits16", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Bits16", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Bits32", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Bits32", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Char", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Char", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_UChar", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_UChar", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Double", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Double", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Float", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Float", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Fxn", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Fxn", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_IArg", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_IArg", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_UArg", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_UArg", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Int", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Int", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_UInt", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_UInt", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Int8", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Int8", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_UInt8", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_UInt8", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Int16", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Int16", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_UInt16", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_UInt16", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Int32", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Int32", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_UInt32", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_UInt32", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Long", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Long", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_ULong", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_ULong", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_LLong", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_LLong", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_ULLong", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_ULLong", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_LDouble", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_LDouble", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Ptr", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Ptr", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_SizeT", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_SizeT", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_Short", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_Short", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_UShort", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_UShort", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_String", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_String", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("xdc.rov.support.ScalarStructs$$S_VaList", new Proto.Obj());
        om.bind("xdc.rov.support.ScalarStructs.S_VaList", new Proto.Str(spo, false));
    }

    void ScalarStructs$$CONSTS()
    {
        // module ScalarStructs
    }

    void ScalarStructs$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ScalarStructs$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ScalarStructs$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Bits8", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Bits8']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Bits8']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Bits8'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Bits16", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UInt16"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Bits16']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Bits16']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Bits16'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Bits32", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Bits32']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Bits32']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Bits32'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Char", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TChar"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Char']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Char']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Char'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_UChar", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UChar"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_UChar']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_UChar']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_UChar'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Double", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TDouble"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Double']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Double']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Double'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Float", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TFloat"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Float']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Float']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Float'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Fxn", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UFxn"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Fxn']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Fxn']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Fxn'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_IArg", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TIArg"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_IArg']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_IArg']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_IArg'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_UArg", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UIArg"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_UArg']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_UArg']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_UArg'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Int", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Int']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Int']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Int'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_UInt", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Int8", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Int8']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Int8']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Int8'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_UInt8", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt8']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt8']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt8'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Int16", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TInt16"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Int16']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Int16']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Int16'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_UInt16", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UInt16"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt16']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt16']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt16'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Int32", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Int32']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Int32']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Int32'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_UInt32", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt32']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt32']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_UInt32'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Long", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TLong"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Long']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Long']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Long'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_ULong", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "ULong"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_ULong']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_ULong']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_ULong'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_LLong", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TLLong"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_LLong']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_LLong']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_LLong'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_ULLong", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "ULLong"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_ULLong']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_ULLong']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_ULLong'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_LDouble", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TLDouble"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_LDouble']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_LDouble']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_LDouble'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Ptr", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Ptr']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Ptr']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Ptr'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_SizeT", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "USize"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_SizeT']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_SizeT']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_SizeT'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_Short", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "TShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_Short']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_Short']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_Short'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_UShort", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_UShort']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_UShort']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_UShort'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_String", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_String']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_String']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_String'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("xdc.rov.support.ScalarStructs.S_VaList", "xdc.rov.support");
        sizes.clear();
        sizes.add(Global.newArray("elem", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['xdc.rov.support.ScalarStructs.S_VaList']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['xdc.rov.support.ScalarStructs.S_VaList']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['xdc.rov.support.ScalarStructs.S_VaList'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void ScalarStructs$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs.Module", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.Module", om.findStrict("xdc.runtime.IModule.Module", "xdc.rov.support"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        // struct ScalarStructs.S_Bits8
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Bits8", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Bits8", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Bits16
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Bits16", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Bits16", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Bits32
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Bits32", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Bits32", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Char
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Char", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Char", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Char)"), $$UNDEF, "w");
        // struct ScalarStructs.S_UChar
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UChar", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_UChar", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_UChar)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Double
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Double", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Double", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Double)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Float
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Float", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Float", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Fxn
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Fxn", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Fxn", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF, "w");
        // struct ScalarStructs.S_IArg
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_IArg", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_IArg", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
        // struct ScalarStructs.S_UArg
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UArg", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_UArg", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
        // struct ScalarStructs.S_Int
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Int", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Int", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // struct ScalarStructs.S_UInt
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UInt", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_UInt", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Int8
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Int8", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Int8", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Int8)"), $$UNDEF, "w");
        // struct ScalarStructs.S_UInt8
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UInt8", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_UInt8", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Int16
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Int16", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Int16", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Int16)"), $$UNDEF, "w");
        // struct ScalarStructs.S_UInt16
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UInt16", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_UInt16", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_UInt16)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Int32
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Int32", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Int32", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Int32)"), $$UNDEF, "w");
        // struct ScalarStructs.S_UInt32
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UInt32", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_UInt32", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Long
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Long", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Long", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Long)"), $$UNDEF, "w");
        // struct ScalarStructs.S_ULong
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_ULong", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_ULong", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_ULong)"), $$UNDEF, "w");
        // struct ScalarStructs.S_LLong
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_LLong", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_LLong", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_LLong)"), $$UNDEF, "w");
        // struct ScalarStructs.S_ULLong
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_ULLong", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_ULLong", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_ULLong)"), $$UNDEF, "w");
        // struct ScalarStructs.S_LDouble
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_LDouble", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_LDouble", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_LDouble)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Ptr
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Ptr", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Ptr", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct ScalarStructs.S_SizeT
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_SizeT", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_SizeT", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
        // struct ScalarStructs.S_Short
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Short", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_Short", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_Short)"), $$UNDEF, "w");
        // struct ScalarStructs.S_UShort
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UShort", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_UShort", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_UShort)"), $$UNDEF, "w");
        // struct ScalarStructs.S_String
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_String", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_String", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", $$T_Str, $$UNDEF, "w");
        // struct ScalarStructs.S_VaList
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_VaList", "xdc.rov.support");
        po.init("xdc.rov.support.ScalarStructs.S_VaList", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("elem", Proto.Elm.newCNum("(xdc_VaList)"), $$UNDEF, "w");
    }

    void ScalarStructs$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.support.ScalarStructs", "xdc.rov.support");
        vo.bind("S_Bits8$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Bits8", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Bits8", "xdc.rov.support");
        vo.bind("S_Bits16$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Bits16", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Bits16", "xdc.rov.support");
        vo.bind("S_Bits32$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Bits32", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Bits32", "xdc.rov.support");
        vo.bind("S_Char$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Char", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Char", "xdc.rov.support");
        vo.bind("S_UChar$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UChar", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UChar", "xdc.rov.support");
        vo.bind("S_Double$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Double", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Double", "xdc.rov.support");
        vo.bind("S_Float$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Float", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Float", "xdc.rov.support");
        vo.bind("S_Fxn$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Fxn", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Fxn", "xdc.rov.support");
        vo.bind("S_IArg$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_IArg", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_IArg", "xdc.rov.support");
        vo.bind("S_UArg$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UArg", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UArg", "xdc.rov.support");
        vo.bind("S_Int$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Int", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Int", "xdc.rov.support");
        vo.bind("S_UInt$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UInt", "xdc.rov.support");
        vo.bind("S_Int8$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Int8", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Int8", "xdc.rov.support");
        vo.bind("S_UInt8$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt8", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UInt8", "xdc.rov.support");
        vo.bind("S_Int16$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Int16", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Int16", "xdc.rov.support");
        vo.bind("S_UInt16$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt16", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UInt16", "xdc.rov.support");
        vo.bind("S_Int32$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Int32", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Int32", "xdc.rov.support");
        vo.bind("S_UInt32$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt32", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UInt32", "xdc.rov.support");
        vo.bind("S_Long$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Long", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Long", "xdc.rov.support");
        vo.bind("S_ULong$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_ULong", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_ULong", "xdc.rov.support");
        vo.bind("S_LLong$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_LLong", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_LLong", "xdc.rov.support");
        vo.bind("S_ULLong$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_ULLong", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_ULLong", "xdc.rov.support");
        vo.bind("S_LDouble$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_LDouble", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_LDouble", "xdc.rov.support");
        vo.bind("S_Ptr$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Ptr", "xdc.rov.support");
        vo.bind("S_SizeT$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_SizeT", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_SizeT", "xdc.rov.support");
        vo.bind("S_Short$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Short", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_Short", "xdc.rov.support");
        vo.bind("S_UShort$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UShort", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_UShort", "xdc.rov.support");
        vo.bind("S_String$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_String", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_String", "xdc.rov.support");
        vo.bind("S_VaList$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_VaList", "isScalar", false));
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs$$S_VaList", "xdc.rov.support");
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.rov.support.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.rov.support"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "xdc.rov.support", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.rov.support");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.rov.support.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.rov.support'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.rov.support$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.rov.support$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.rov.support$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void ScalarStructs$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.rov.support.ScalarStructs", "xdc.rov.support");
        po = (Proto.Obj)om.findStrict("xdc.rov.support.ScalarStructs.Module", "xdc.rov.support");
        vo.init2(po, "xdc.rov.support.ScalarStructs", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("xdc.rov.support", "xdc.rov.support"));
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
        vo.bind("S_Bits8", om.findStrict("xdc.rov.support.ScalarStructs.S_Bits8", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Bits8", "xdc.rov.support"));
        vo.bind("S_Bits16", om.findStrict("xdc.rov.support.ScalarStructs.S_Bits16", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Bits16", "xdc.rov.support"));
        vo.bind("S_Bits32", om.findStrict("xdc.rov.support.ScalarStructs.S_Bits32", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Bits32", "xdc.rov.support"));
        vo.bind("S_Char", om.findStrict("xdc.rov.support.ScalarStructs.S_Char", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Char", "xdc.rov.support"));
        vo.bind("S_UChar", om.findStrict("xdc.rov.support.ScalarStructs.S_UChar", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_UChar", "xdc.rov.support"));
        vo.bind("S_Double", om.findStrict("xdc.rov.support.ScalarStructs.S_Double", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Double", "xdc.rov.support"));
        vo.bind("S_Float", om.findStrict("xdc.rov.support.ScalarStructs.S_Float", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Float", "xdc.rov.support"));
        vo.bind("S_Fxn", om.findStrict("xdc.rov.support.ScalarStructs.S_Fxn", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Fxn", "xdc.rov.support"));
        vo.bind("S_IArg", om.findStrict("xdc.rov.support.ScalarStructs.S_IArg", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_IArg", "xdc.rov.support"));
        vo.bind("S_UArg", om.findStrict("xdc.rov.support.ScalarStructs.S_UArg", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_UArg", "xdc.rov.support"));
        vo.bind("S_Int", om.findStrict("xdc.rov.support.ScalarStructs.S_Int", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Int", "xdc.rov.support"));
        vo.bind("S_UInt", om.findStrict("xdc.rov.support.ScalarStructs.S_UInt", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_UInt", "xdc.rov.support"));
        vo.bind("S_Int8", om.findStrict("xdc.rov.support.ScalarStructs.S_Int8", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Int8", "xdc.rov.support"));
        vo.bind("S_UInt8", om.findStrict("xdc.rov.support.ScalarStructs.S_UInt8", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_UInt8", "xdc.rov.support"));
        vo.bind("S_Int16", om.findStrict("xdc.rov.support.ScalarStructs.S_Int16", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Int16", "xdc.rov.support"));
        vo.bind("S_UInt16", om.findStrict("xdc.rov.support.ScalarStructs.S_UInt16", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_UInt16", "xdc.rov.support"));
        vo.bind("S_Int32", om.findStrict("xdc.rov.support.ScalarStructs.S_Int32", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Int32", "xdc.rov.support"));
        vo.bind("S_UInt32", om.findStrict("xdc.rov.support.ScalarStructs.S_UInt32", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_UInt32", "xdc.rov.support"));
        vo.bind("S_Long", om.findStrict("xdc.rov.support.ScalarStructs.S_Long", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Long", "xdc.rov.support"));
        vo.bind("S_ULong", om.findStrict("xdc.rov.support.ScalarStructs.S_ULong", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_ULong", "xdc.rov.support"));
        vo.bind("S_LLong", om.findStrict("xdc.rov.support.ScalarStructs.S_LLong", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_LLong", "xdc.rov.support"));
        vo.bind("S_ULLong", om.findStrict("xdc.rov.support.ScalarStructs.S_ULLong", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_ULLong", "xdc.rov.support"));
        vo.bind("S_LDouble", om.findStrict("xdc.rov.support.ScalarStructs.S_LDouble", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_LDouble", "xdc.rov.support"));
        vo.bind("S_Ptr", om.findStrict("xdc.rov.support.ScalarStructs.S_Ptr", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Ptr", "xdc.rov.support"));
        vo.bind("S_SizeT", om.findStrict("xdc.rov.support.ScalarStructs.S_SizeT", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_SizeT", "xdc.rov.support"));
        vo.bind("S_Short", om.findStrict("xdc.rov.support.ScalarStructs.S_Short", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_Short", "xdc.rov.support"));
        vo.bind("S_UShort", om.findStrict("xdc.rov.support.ScalarStructs.S_UShort", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_UShort", "xdc.rov.support"));
        vo.bind("S_String", om.findStrict("xdc.rov.support.ScalarStructs.S_String", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_String", "xdc.rov.support"));
        vo.bind("S_VaList", om.findStrict("xdc.rov.support.ScalarStructs.S_VaList", "xdc.rov.support"));
        tdefs.add(om.findStrict("xdc.rov.support.ScalarStructs.S_VaList", "xdc.rov.support"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.rov.support")).add(vo);
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
        vo.bind("$$fxntab", Global.newArray("xdc_rov_support_ScalarStructs_Module__startupDone__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("ScalarStructs", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ScalarStructs");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.rov.support.ScalarStructs", "xdc.rov.support"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.rov.support.ScalarStructs")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.rov.support")).add(pkgV);
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
        ScalarStructs$$OBJECTS();
        ScalarStructs$$CONSTS();
        ScalarStructs$$CREATES();
        ScalarStructs$$FUNCTIONS();
        ScalarStructs$$SIZES();
        ScalarStructs$$TYPES();
        if (isROV) {
            ScalarStructs$$ROV();
        }//isROV
        $$SINGLETONS();
        ScalarStructs$$SINGLETONS();
        $$INITIALIZATION();
    }
}
