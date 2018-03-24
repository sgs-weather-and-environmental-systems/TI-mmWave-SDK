/*
 *  ======== Monitor.xs ========
 */

/*
 *  ======== viewInitModule ========
 *  Initialize the Monitor 'Module' view.
 *
 * Note: this function will not be called if there is no Monitor state
 *       structure defined; after all, there is no state to read from
 *       the to initialize obj.
 */
function viewInitModule(view, obj, args)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Monitor = xdc.useModule('xdc.rov.runtime.Monitor');

    /* find and read the monitor's state structure */
    var modCfg = Program.getModuleConfig('xdc.rov.runtime.Monitor');
    var addr = Program.getSymbolValue(String(modCfg.STATEADDR).substr(1));
    if (addr == -1) {
        throw new Error(Monitor.$name
                        + ":can't find monitor state structure (STATEADDR) '"
                        + modCfg.STATEADDR + "'");
        return;
    }
    var state = Program.fetchStruct(Monitor["MonState$fetchDesc"], addr);

    /* set address to the address we actually read; Note: we must use
     * $$bind() because xdc.rov.Program used $$bind to add address (why?)
     */
    view.$$bind("address", addr);

    /* lookup monitor's read/write functions */
    view.readFxn = Program.lookupFuncName(Number(state.read))[0];
    view.writeFxn = Program.lookupFuncName(Number(state.write))[0];

    /* read monitor's command buffer */
    var len = Number(modCfg.MAXCMDSIZE);
    var buffer = Program.fetchArray(Monitor["UCharBuffer$fetchDesc"],
                                         state.buffer, len);

    /* convert command bytes to character array ca[] */
    var ca = [];
    for (var i = 0; i < len; i++) {
        var code = buffer[i].elem;
        if (code == 0 || code == 10 || code == 13) {
            break;
        }
        ca.push(String.fromCharCode(code));
    }

    /* convert ca[] to string and return it in the module's view struct */
    view.command = ca.join("");
}

/*
 *  ======== viewInitUChar ========
 *  Initialize the Monitor 'UChar' view.
 */
function viewInitUChar(view, args)
{
    var type = {
        name: "UChar",
        cols: 8,
        maus: 1,
        heading: "byte"
    };

    _viewInitData(type, view, args);
}

/*
 *  ======== viewInitBits16 ========
 *  Initialize the Monitor Bits16 view.
 */
function viewInitBits16(view, args)
{
    var type = {
        name: "Bits16",
        cols: 8,
        maus: 2,
        heading: "word"
    };

    _viewInitData(type, view, args);
}

/*
 *  ======== viewInitBits32 ========
 *  Initialize the Monitor Bits32 view.
 */
function viewInitBits32(view, args)
{
    var type = {
        name: "Bits32",
        cols: 4,
        maus: 4,
        heading: "word"
    };

    _viewInitData(type, view, args);
}

/*
 *  ======== viewInitSections ========
 *  Initialize the Monitor 'Sections' view.
 */
function viewInitSections(view, args)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Monitor = xdc.useModule('xdc.rov.runtime.Monitor');

    /* Retrieve the MemoryImage java object. */
    var Model = xdc.module("xdc.rov.Model");
    var memReader = Model.getMemoryImageInst();

    /* retrieve the sections list to get the current set of regions */
    var sections = memReader.getSections();
    var sectArray = sections.getSectionArray();

    /* ensure unique base addresses */
    var sectHash =  {};
    for (var i = 0; i < sectArray.length; i++) {
        var sect = sectArray[i];
        var max = sect.length;
        if (sectHash[sect.base] == null || sectHash[sect.base] < max) {
            sectHash[sect.base] = max;
        }
    }

    /* sort sections based on base address */
    sectArray = [];
    for (var b in sectHash) {
        sectArray.push({start: Number(b), len: Number(sectHash[b])});
    }
    sectArray.sort(function(a, b) {return (a.start - b.start);});

    /* create view elements from sorted section array */
    var count = 0;
    var prevEnd = undefined;
    for (var i = 0; i < sectArray.length; i++) {
        var sect = sectArray[i];
        //var elem = new Monitor.SectionView(); /* breaks ROV classic: XDCTOOLS-186 */
        var elem = Program.newViewStruct(Monitor.$name, "Sections");
        elem.name = String(count++);
        elem.start = sect.start;
        elem.len = sect.len;

        var sym = _lookupSym(elem.start);
        elem.startSym = String(sym.name)[0] == '0' ? undefined : sym.name;

        elem.kind = sym.kind == 'f' ? "code" :
            (sym.kind == 'd' ? "data" : undefined);

        elem.gap = prevEnd != null ? (elem.start - (prevEnd + 1)) : 0;

        elem.end = elem.start + elem.len - 1;
        prevEnd = elem.end;

        view.elements.$add(elem);
    }
}

/*
 *  ======== viewInitSymbols ========
 *  Initialize the Monitor 'Symbols' view.
 */
function viewInitSymbols(view, args)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Monitor = xdc.useModule('xdc.rov.runtime.Monitor');

    /* compute start addr, radius, and type */
    var addr;
    var radius;
    var type;

    if (args == null) {
        return;
    }

    /* parse args for addr, radius, and type values */
    var tokens = args.split(/\s*,\s*/);

    var val = Number(tokens[0]);
    addr = isFinite(val) ? val : 0;

    val = Number(tokens[1] != null ? tokens[1] : 1);
    radius = isFinite(val) ? val : 1;

    val = tokens[2];
    type = 'a';
    if (val != null && val.length > 0) {
        type = val[0];
    }

    var symbolHash = {};
    var start = addr - radius;
    var end = start + 2 * radius;
    for (var test = start; test <= end; test++) {
        var sym;
        var kind = type;
        if (type == 'f') {
            sym = Program.lookupFuncName(test)[0];
        }
        else if (type == 'd') {
            sym = Program.lookupDataSymbol(test)[0];
        }
        else {
            kind = 'f';     /* function symbol */
            sym = Program.lookupFuncName(test)[0];
            var dsym = Program.lookupDataSymbol(test)[0];
            if (sym != null && dsym != null) {
                kind = 'a'; /* absolute symbol of unknown type */
            }
            else if (sym == null) {
                kind = 'd'; /* data symbol */
                sym = dsym;
            }
        }
        if (sym != null && sym != "") {
            symbolHash[test] = {type: kind, name: sym};
        }
    }

    /* sort symbols based on address */
    var symbolArray = [];
    for (var b in symbolHash) {
        var sym = symbolHash[b];
        symbolArray.push({addr: Number(b), name: sym.name, type: sym.type});
    }
    symbolArray.sort(function(a, b) {return (a.addr - b.addr);});

    /* create view elements from sorted symbol array */
    var count = 0;
    for (var i = 0; i < symbolArray.length; i++) {
        var symbol = symbolArray[i];
        //var elem = new Monitor.SymbolView(); /* breaks ROV classic: XDCTOOLS-186 */
        var elem = Program.newViewStruct(Monitor.$name, "Symbols");

        elem.name = symbol.name;
        elem.addr = symbol.addr;
        elem.type = symbol.type;

        view.elements.$add(elem);
    }
}

/*
 *  ======== viewInitVariable ========
 *  Initialize the Monitor 'Variable' view.
 */
function viewInitVariable(view, obj, args)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Monitor = xdc.useModule('xdc.rov.runtime.Monitor');

    if (args == null) {
        args = "0";
    }

    /* parse args for name/addr and check values */
    var tokens = args.split(/\s*,\s*/);
    var name = tokens[0];
    var check = true;
    var val = tokens[1];
    if (val != null && (val == "0" || val[0] == "f")) {
        check = false;
    }

    /* convert name/addr to an numeric address */
    var addr = _parseValue(name);
    if (addr == null) {
        var msg = "The specified argument '" + name
            + "' isn't a valid address or program symbol";
        view.$$bind("address", 0);
        Program.displayError(view, "name", msg);
        Program.displayError(view, "address", msg);
        return;
    }

    /* set address to the address we actually read; Note: we must use
     * $$bind() because xdc.rov.Program used $$bind to add address (why?)
     */
    view.$$bind("address", addr);

    var sym = _lookupSym(addr);
    view.name = sym.name;

    try {
        var buffer = Program.fetchArray(Monitor["UCharBuffer$fetchDesc"],
                                         addr, 1, check);
        val = Number(buffer[0].elem);
        view.character = String.fromCharCode(val);
        view.uint8_t = String(val);
        view.int8_t = String((val & 0x80) ? (val - 256) : val);

        buffer = Program.fetchArray(Monitor["Bits16Buffer$fetchDesc"],
                                    addr, 1, check);
        val = Number(buffer[0].elem);
        view.uint16_t = String(val);
        view.int16_t = String((val & 0x8000) ? (val - 65536) : val);

        buffer = Program.fetchArray(Monitor["Bits32Buffer$fetchDesc"],
                                    addr, 1, check);
        val = Number(buffer[0].elem);
        view.uint32_t = String(val);
        view.int32_t = String((val & 0x80000000) ? (val - 4294967296) : val);
    }
    catch (x) {
        Program.displayError(view, "address", String(x));
    }
}

/*
 *  ======== _lookupSym ========
 */
function _lookupSym(addr)
{
    var result = {kind: 'f', name: "0x" + Number(addr).toString(16)};

    var sym = Program.lookupFuncName(Number(addr))[0];
    var dsym = Program.lookupDataSymbol(Number(addr))[0];
    if (sym != null && dsym != null) {
        result.kind = 'a'; /* absolute symbol of unknown type */
        result.name = sym;
    }
    else if (sym == null) {
        result.kind = 'd'; /* data symbol */
        if (dsym != null) {
            result.name = dsym;
        }
    }
    else {
        result.name = sym; /* function symbol */
    }

    return (result);
}

/*
 *  ======== _parseValue ========
 *  Return the numeric value for a string representation of number or symbol
 */
function _parseValue(token)
{
    var result;
    var val;

    /* if it's a number, define result to be its value */
    var digits = "0123456789";
    if (token == null || token.length == 0 || digits.indexOf(token[0]) != -1) {
        val = Number(token);
        if (isFinite(val)) {
            result = val;
        }
    }

    /* if it's not a number, try looking it up in the symbol table */
    if (result == null) {
        val = Program.getSymbolValue(token);
        if (val != -1) {
            result = val;
        }
    }

    /* return our best guess (or undefined) */
    return (result);
}

/*
 *  ======== _viewInitData ========
 *  Initialize the Monitor 'Data' view.
 */
function _viewInitData(type, view, args)
{
    var addr;
    var len;
    var check = true;

    /* compute start addr and len (number of MAUs to display) */
    if (args == null) {
        return;
    }
    else {
        /* parse args for addr, len, and address check values */
        var tokens = args.split(/\s*,\s*/);

        addr = _parseValue(tokens[0]);
        if (addr == null) {
            return;
        }

        var val = Number(tokens[1] != null ? tokens[1] : 1);
        len = isFinite(val) ? val : 1;

        val = tokens[2];
        if (val != null && (val == "0" || val[0] == "f")) {
            check = false;
        }
    }

    if (len == 0) {
        return;
    }

    var Program = xdc.useModule('xdc.rov.Program');
    var Monitor = xdc.useModule('xdc.rov.runtime.Monitor');

    /* Retrieve a buffer's worth of data */
    var buffer = Program.fetchArray(Monitor[type.name + "Buffer$fetchDesc"],
                                         addr, len, check);

    /* Create a view of this buffer (in an elem) ... */
    var count = 0;
    do {
        var elem = Program.newViewStruct(Monitor.$name, type.name);
        elem.addr = addr;
        var i;
        for (i = 0; i < type.cols && count < buffer.length; i++, count++) {
            elem[type.heading + i] = buffer[count].elem;
        }
        for (; i < type.cols; i++) {
            elem[type.heading + i] = undefined;
            //Program.displayError(elem, type.heading + i,
            //    "N/A - value not read from the target");
        }

        /* Add the elem to the list of rows for the <type.name> view */
        view.elements.$add(elem);
        addr += type.cols * type.maus;
    } while (count < buffer.length);
}
