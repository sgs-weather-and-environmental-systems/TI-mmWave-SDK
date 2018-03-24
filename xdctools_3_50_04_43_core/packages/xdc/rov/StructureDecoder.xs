/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * 
 */
 /*
 *  ======== StructureDecoder.xs ========
 *  The StructureDecoder is organized into 'fetch' and 'decode' APIs. The
 *  'fetch' APIs are intended as the real interface to the StructureDecoder,
 *  and they in turn call down to the appropriate decode API.
 *
 *  Of the 'decode' APIs, there are two categories, those that take a type 
 *  object (an object from the XDC object model):
 *    decodeStruct
 *    decodeStructArray
 *  and those that take a type string (a specially formatted type string):
 *    _decodeField
 *    _decodeScalar
 *    _decodeArray
 *
 *  The StructureDecoder only decodes structures and arrays of structures. To
 *  handle scalars, the xdc.rov.support.ScalarStructs module defines structure 
 *  types for each of the scalar types.
 *
 *  The 'fetch' APIs call down to either decodeStruct or decodeStructArray.
 *  These APIs decode the structures by retrieving the list of fields from the
 *  type object. Each field has a specially formatted type string. These
 *  strings are then passed down to the other decode APIs to do the actual 
 *  decoding.
 *
 *  The decode APIs are made slightly more complicated by some optimizations
 *  for decoding arrays. Rather than call a single 'decode' function on each
 *  element in the array, the type information is only interpereted once and
 *  stored in a StructureDecoder.FieldType object, then this object is used
 *  to decode all of the array elements.
 */
 
/*
 *  ======== instance$meta$init ========
 *  Initialize the StructureDecoder instance.
 */
function instance$meta$init(mem, targ)
{
    this.$private.memReader = mem;
    this.$private.targConfig = targ;
    
    /* Create a TargetDecoder for decoding the raw bytes. */
    xdc.loadPackage('xdc.rov');
    
    /* Get the target endianess and convert from string to enum. */
    var endianStr = this.$private.targConfig.model.endian;
    var endian = Packages.xdc.rov.TargetType.strToEndianess(endianStr);
   
    /* Create the TargetDecoder. */
    var bitsPerChar = this.$private.targConfig.bitsPerChar;
    this.$private.targDec = new Packages.xdc.rov.TargetDecoder(endian, 
                                                               bitsPerChar);
}

/*
 *  ===============================
 *      Type-Object Decode APIs
 *  ===============================
 */

/*
 *  ======== decodeStruct ========
 *  Decodes an entire structure by decoding each of the structures fields.  
 *
 *  structType -  Structure type. Not just a string, an actual object with the
 *                 target layout of the structure.
 *  buffer     -  Buffer object containing buffer and current offset.
 *  inStr      -  Optional instance of structType to be filled in.
 */
function decodeStruct(structType, buffer, inStr)
{
    decoderPrint("Decoding structure of type " + (new structType).$type);
    /* 
     * The caller can optionally pass a structure to fill in. Otherwise, create
     * one to be filled in.
     */
    var str;
    if (inStr != null) {
        str = inStr;
    }
    else {
        str = _createObjFromType(structType, buffer.addr + buffer.off); 
    }
    
    /* Store the initial offset. */
    var base = buffer.off;    
    
    /*
     * From package schema:
     *
     * var so = xdc.om['ti.sysbios.knl.Swi.HookSet'];
     * so.$$bind('$$sizes', [
     *     ['registerFxn', 'UFxn'],
     *     ['createFxn', 'UFxn'],
     *     ...,
     * ]);
     *
     * 'sizes' is a 2D array; each entry represents a field and is a pair
     * including the field name and the field type.
     */
    var sizes = structType.$$sizes;
    
    /* For each field in the structure... */
    for (var i = 0; i < sizes.length; i++) {
        var field = sizes[i];
        var fieldName = field[0];
        var fieldType = field[1];
        decoderPrint("  Decoding field " + fieldName + " (" + fieldType + ")");
        /* Update offset for field */
        buffer.off = base + structType.$offsetof(fieldName);
        
        /* Decode the field */
        str[fieldName] = this._decodeField(fieldType, buffer);
    }
    
    return (str);
}

/*
 *  ======== _createObjFromType ========
 *  In order to have better control over the contents and display of structs,
 *  ROV creates untyped JavaScript objects to represent structs, and copies
 *  over any fields from the typed struct that it needs.
 *  This helper function copies over the type name and any $fetchDesc
 *  properties of the struct.
 */
function _createObjFromType(structType, addr)
{
    var obj = {};
    
    obj.$addr = $addr(addr);
    
    /* 
     * Create a temporary instance of the type used to copy over some of 
     * the fields from the typed object into the untyped one.
     */
    var temp = new structType;
    
    /* Copy over the type */
    obj.$type = temp.$type;
        
    /* Copy over any $fetchDesc fields. */
    for (var fld in temp) {
        /* Check if there is a $fetchDesc for this field, and if so, copy it */
        var fetchDesc = fld + '$fetchDesc';
        if (fetchDesc in temp) {
            obj[fetchDesc] = temp[fetchDesc];
        }
    }    
    
    return (obj);
}

/*
 *  ======== decodeStructArray ========
 *  Decodes an array of structures given the structure's XDC OM type object.
 *  
 *  This API exists to perform some optimizations when decoding an array 
 *  of a single type of object. Rather than call _createObjFromType for each
 *  object in the array, it creates a single object to use as a model, then
 *  clones this object to be used for each array element.
 */
function decodeStructArray(strType, buffer, length)
{
    var arr = new Array();
    
    /* 
     * Create a JavaScript object representation of the structure, then use
     * this object as a model and clone it rather than calling 
     * _createObjFromType for each element.
     */
    var strModel = _createObjFromType(strType, buffer.addr + buffer.off);
    
    /* Store the initial offset. */
    var base = buffer.off;  
    
    for (var i = 0; i < length; i++) {        
        /* Update the offset. */
        buffer.off = base + (i * strType.$sizeof()); 

        /* Clone the object and update the address. */
        var str = _cloneObject(strModel);
        str.$addr = buffer.addr + buffer.off;

        /* Decode the structure, pass in in the structure to fill. */
        this.decodeStruct(strType, buffer, str);
        
        arr[i] = str;
    }
    
    return (arr);
}

/*
 *  ======== _cloneObject ========
 *  Does a shallow copy of 'obj' to create a new object. The object returned
 *  has all of the same fields as the original, but this is not a deep copy of
 *  all of the object's values.
 */
function _cloneObject(obj)
{
    var clone = new Object();
    
    for (var p in obj) {
        clone[p] = obj[p];
    }
    
    return (clone);
}

/*
 *  ========================
 *      Type String APIs
 *  ========================
 */

/*
 *  ======== _parseTypeString ========
 *  This function interperets a field's type string. The type string comes from
 *  the $$sizes property of the structure's type object (from the XDC object
 *  model).
 *
 *  The string is parsed and the interperetation is stored in a 
 *  StructureDecoder.FieldType object. This allows this parsing code to be 
 *  shared between different APIs. It is also used as an optimization for
 *  decoding arrays, allowing the StructureDecoder to parse the string once and
 *  apply it to all of the elements in the array.
 *
 *  Only the fields in the FieldType object relevant to the type are filled in.
 *
 *  The type string begins with a letter indicating whether the field is an
 *  embedded array ('A'), an embedded structure ('S'), or one of the scalar
 *  types ('N', 'T', 'E', or 'U').
 *
 *  The definition of a structure's type strings can be found in the package's
 *  schema file, 'package/<package_name>.java'
 */
function _parseTypeString(fieldType)
{
    var StructureDecoder = xdc.useModule('xdc.rov.StructureDecoder');
    
    var type = new StructureDecoder.FieldType;
    
    switch (fieldType[0]) {

        /* 
         * 'A': an embedded array, followed by the array length and type. 
         * Example: 
         *  'A16;UInt32'
         */
        case 'A': {
            type.isArrType = true;
            
            var sep = fieldType.indexOf(';');
            
            /* Get the fixed length of the embedded array */
            type.len = Number(fieldType.substring(1, sep));
            
            /* Get the type of the array elements. */
            type.elemType = fieldType.substring(sep + 1);
            
            decoderPrint("    Field is an embedded array; len: " + type.len +
                         " type: " + type.elemType);
            
            return (type);
        }
    
        /* 
         * 'S': Structure
         * Example:  
         *  'Sti.sysbios.misc.Queue;Elem' 
         */
        case 'S': {
            type.isStrType = true;
            
            /* Get the structure's definition from the object model */
            var structNames = fieldType.substring(1).split(';');
            var modName = structNames[0];
            var structName = structNames[1];
            
            decoderPrint("    Field is a structure of type " + modName + "." +
                         structName);
            
            type.strType = xdc.om[modName][structName];
            
            return (type);
        }
    
        /*
         * Scalar values 
         *  'N': Enum
         *  'T': Signed
         *  'E': Encoded
         *  'U': Unsigned
         *
         * Examples:
         *  'UPtr'
         *  'TInt'
         *  'UInt'
         *  'Nti.sysbios.knl.Task.Mode'
         *  'UIArg'
         */
        case 'N':  
        case 'T':  
        case 'E':  
        case 'U': {
            type.isScalarType = true;
            
            type.signed = fieldType[0] != 'U';
            type.isEnum = fieldType[0] == 'N';
            type.isEncoded = fieldType[0] == 'E';

            /* Determine the size and alignment of the type. */
            
            /* 
             * The type of an enum is not always an int. A type can be 
             * specified by the user. Or, on some targets, the compiler may
             * 'pack' the enum and choose the smallest possible type to hold
             * the values.
             */
            if (type.isEnum) {
                var stdType = $$getEnumType(fieldType, 
                                            this.$private.targConfig);
                type.size = stdType.size;
                type.align = stdType.align;
            }
            /* TODO - An encoded type is not necessarily always an int. */
            else if (type.isEncoded) {
                var tname = 't_Int';
                type.size = this.$private.targConfig.stdTypes[tname].size;
                type.align = this.$private.targConfig.stdTypes[tname].align;
            }
            /* For all other scalars, the type is specified by the string. */
            else {
                var tname = 't_' + fieldType.substring(1);
                type.size = this.$private.targConfig.stdTypes[tname].size;
                type.align = this.$private.targConfig.stdTypes[tname].align;
            }            
            
            /* Pointer types are all presented as addresses */
            type.isAddr = (tname == 't_Ptr' || tname == 't_Fxn' ||
                           tname == 't_IArg');
           
            type.fldType = fieldType;
           
            decoderPrint("    Field is a scalar (" + fieldType + "), size: "
                         + type.size
                         + " align: " + type.align);
           
            return (type);   
        }
        
        default: {
            throw (new Error("Unknown type code '" + fieldType +
                             "'; can't decode value"));
        }
    }
}
 
/*
 *  ======== _decodeField ========
 *  Decodes a single field within a structure and returns its value.
 *
 *  This function will increment the offset field in the 'buffer'
 *  argument. The decodeStruct API will reset the offset for each field, but
 *  for decoding arrays,
 *
 *  fieldType - Type string
 *  buffer    - Buffer object containing buffer and current offset.
 */
function _decodeField(fieldType, buffer)
{
    var type = this._parseTypeString(fieldType);
    
    /* Embedded array */
    if (type.isArrType) {
        return (this._decodeArray(type.elemType, buffer, type.len));
    }
    /* Structure */
    else if (type.isStrType) {       
        return (this.decodeStruct(type.strType, buffer));
    }
    /* Scalar */
    else if (type.isScalarType) {        
        return (this._decodeScalar(type, buffer));
    }

    /* Should never reach here... */
    return (undefined);
}
 
/*
 *  ======== _decodeArray ========
 *  This API decodes an array of any type of elements given the elements' type
 *  string.
 *
 *  decodeStructArray takes an XDC OM type object, while _decodeArray takes a
 *  type string. _decodeArray calls down to decodeStructArray if the element
 *  type is a structure.
 */
function _decodeArray(fieldType, buffer, length)
{
    var arr = new Array();

    /* Parse the type string */
    var type = this._parseTypeString(fieldType);
    
    /* Array of embedded arrays. */
    if (type.isArrType) {
        /* Decode each of the arrays. */
        for (var i = 0; i < length; i++) {
            arr[i] = this._decodeArray(arrType.elemType, buffer, arrType.len);
        }
            
        return (arr);
    }
    /* Array of structures. */
    else if (type.isStrType) {
        return (this.decodeStructArray(type.strType, buffer, length));
    }
    /* Array of scalars. */
    else if (type.isScalarType) {               
        /* Decode each of the scalar values. */
        for (var i = 0; i < length; i++) {
            arr[i] = this._decodeScalar(type, buffer);
            buffer.off += type.size;
        }
 
        return (arr);
    }

    /* Should never reach here... */
    return (undefined);
}

/*
 *  ======== _decodeScalar ========
 *  Decodes a scalar value of 'type' at the offset specified in 'buffer.off'.
 */
function _decodeScalar(type, buffer)
{
    /* 
     * Adjust the offset of the field within the structure based on the
     * target's required alignment of the field type. 
     */
    var d = buffer.off % type.align;
    if (d > 0) {
        buffer.off += type.align - d;
    }
    
    /* Decode the value */
    var val = this.$private.targDec.decodeMAUs(buffer.buffer, buffer.off, 
                                               type.size, type.signed);
    
    decoderPrint("      Value " + val + " at offset: " + buffer.off + 
                 ", size: " + type.size);
    
    /* 
     * Use address type for pointers and functions. Also use it for
     * UArgs so that these are displayed in hex by default (since
     * they are often pointers).
     */
    if (type.isAddr) {
        val = $addr(Number(val));
    }

    /* Can't catch Java exception, so check for too large Integer */
    if (type.isEnum && val > java.lang.Integer.MAX_VALUE) {
        throw (new Error("Value " + val 
            + " is too large to convert to Java Integer"));
    }
    
    /* For Enums, return an Enum object. */
    if (type.isEnum) {
        /* First, parse the type string for the name of the enum. */
        var index = type.fldType.indexOf(';');
        var enumName;
        if (index == -1) {
            enumName = type.fldType.substring(1);
        }
        else {
            enumName = type.fldType.substring(1, index);
        }
        
        return ($$Enum(xdc.om[enumName], null, val));
    }

    return (val);
}

/*
 *  ==================
 *      Fetch APIs
 *  ==================
 */
 
/*
 *  ======== fetchStruct ========
 *  Reads and decodes a structure from the target, given its type and address.
 */
function fetchStruct(structType, addr, addrCheck)
{
    var StructureDecoder = xdc.useModule('xdc.rov.StructureDecoder');
    
    /* Read the structure's raw bytes from the target. */
    var buf = this.$private.memReader.readMaus(Number(addr),
                                               structType.$sizeof(),
                                               addrCheck);

    /* Wrap the data in a Buffer object. */
    var buffer = new StructureDecoder.Buffer;
    buffer.buffer = buf;
    buffer.addr = addr;
    buffer.off = 0;
    
    /* Decode the structure. */
    var str = this.decodeStruct(structType, buffer);

    return (str);
}

/*
 *  ======== fetchArray ========
 */
function fetchArray(structType, addr, len, isScalar, addrCheck)
{
    var StructureDecoder = xdc.useModule('xdc.rov.StructureDecoder');
    
    /* If the array has zero length throw an exception. */
    if (len == 0) {
        throw (new Error("fetchArray called with length 0."));
    }

    /* Read the array's raw bytes from memory. */
    var buf = this.$private.memReader.readMaus(Number(addr),
                                               structType.$sizeof() * len, 
                                               addrCheck);
    
    /* Create a Buffer object around the target data. */
    var buffer = new StructureDecoder.Buffer;
    buffer.buffer = buf;
    buffer.addr = addr;
    buffer.off = 0;

    if (isScalar) {
        /* The scalar structs only have one field. */
        var fieldType = structType.$$sizes[0][1];
        return (this._decodeArray(fieldType, buffer, len));
    }
    else {
        var array = this.decodeStructArray(structType, buffer, len);
    }
    
    return (array);
}

/*
 *  ======== decoderPrint ========
 *  Print statements used for debugging issues with the StructureDecoder.
 */
function decoderPrint(msg)
{
    //print(msg);
}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

