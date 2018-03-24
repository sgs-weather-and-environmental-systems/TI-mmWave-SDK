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
 *  ======== StructureDecoder.xdc ========
 */

package xdc.rov;

/*!
 *  ======== StructureDecoder ========
 *  Module for retrieving and decoding target structures.  
 *
 *  The StructureDecoder is responsible for decoding target data given the
 *  raw target bytes and the data's type as defined in XDC. It also contains
 *  APIs for retrieving data from the target given the data's address.
 *  
 *  The StructureDecoder relies on the TargetDecoder to decode the raw target 
 *  bytes, but is itself responsible for decoding the structure layout. The 
 *  decodeStruct API takes as an argument the structure's type representation
 *  in the XDC object model, and refers to this object to determine the size 
 *  and offsets of the structure's fields.
 *
 *  The object returned by decodeStruct is not the typed Java representation of
 *  the structure, but rather a typeless JavaScript object which simply
 *  contains all of the same fields. This allows ROV to control the type of the
 *  fields, and specifically to represent arrays as addresses rather than as
 *  objects.
 *
 *  All of the 'decode' methods are essentially private methods. The intended
 *  interface to the StructureDecoder is through the 'fetch' APIs.
 */
metaonly module StructureDecoder
{
    /*!
     *  ======== Buffer ========
     *  Target buffer
     *  
     *  This structure encapsulates a buffer of target memory (`buffer`), 
     *  the buffer's original target address (`addr`), and a running offset
     *  into that buffer (`off`). 
     *
     *  Decoding a structure is a recursive process, since the structure may
     *  include fields which are also structures. As `StructureDecoder` 
     *  decodes each field, it updates the `off` field to move to the next
     *  field.
     *
     *  The original address of the buffer is stored as well so that each
     *  structure field can be given a `$addr` property with its target 
     *  address.
     */
    metaonly struct Buffer {
        Any    buffer;
        Int    addr;
        Int    off;
    }

    /*!
     *  @_nodoc
     *  ======== FieldType ========
     *  Object representing the type of a field.
     *
     *  An object of this type is returned by the `{@link #parseTypeString}`
     *  method.
     * 
     *  A field can either be a scalar, a structure, or an array.
     */
    metaonly struct FieldType {
        /* Scalar */
        Bool    isScalarType;
        Bool    signed;
        Bool    isEnum;
        Bool    isEncoded;
        Int     size;
        Int     align;
        Bool    isAddr;
        String  fldType;
        
        /* Structure */
        Bool    isStrType;
        Any     strType;
        
        /* Array */
        Bool    isArrType;
        Int     len;
        String  elemType;
    }
    
instance:
    /*!
     *  ======== create ========
     *  Create a StructureDecoder instance
     *  
     *  The StructureDecoder requires a MemoryImage instance and the target
     *  configuration object from the ROV recap file; i.e.,
     *  recap.build.target.
     */
    create(Any mem, Any targConfig);
    
    /*!
     *  ======== fetchStruct ========
     *  Retrieve and decode a structure from the target
     *
     *  This method retrieves and decodes a structure of the given type at
     *  the given address from the target.
     *  @p(dlist)
     *     - `structType`
     *            Structure type. Not just a string, it is the XDC object
     *            model representation of the type.
     *     - `addr`
     *            Target address of the structure to retrieve.
     *     - `addrCheck`
     *            Whether to check the memory read against the section map.
     *  @p
     */
    Any fetchStruct(Any structType, Int addr, Bool addrCheck);
    
    /*!
     *  ======== fetchArray ========
     *  Retrieve and decode an array of structures from the target
     *
     *  @p(dlist)
     *     - `structType`
     *           Structure type. Not just a string, it is the XDC object 
     *           model representation of the type.
     *     - `addr`
     *           Target address of the structure to retrieve.
     *     - `len`
     *           Number of entries in the array.
     *     - `isScalar`
     *           Whether it is an array of scalars.
     *     - `addrCheck`
     *           Whether to check the memory read against the section map.
     *  @p
     */
    Any fetchArray(Any structType, Int addr, Int len, Bool isScalar, 
                   Bool addrCheck);
    
    /*!
     *  ======== decodeStruct ========
     *  Decode an entire structure by decoding each of the structure's fields
     *
     *  @p(dlist)
     *     - `structType`
     *           Structure type. Not just a string, it is the XDC object 
     *           model representation of the type.
     *     - `buffer`
     *           Buffer of target memory containing raw data.
     *     - `inStr`
     *           Optional structure to fill in. Otherwise decodeStruct will
     *           create a new one.
     *  @p
     */
    Any decodeStruct(Any structType, Buffer buffer, Any inStr = null);
    
    /*!
     *  ======== decodeStructArray ========
     *  Decode an array of structures
     *  
     *  This API exists to perform some optimizations when decoding an array
     *  of a single type of object.
     *
     *  @p(dlist)
     *     - `structType`
     *           Structure type of the elements in the array. Not just a 
     *           string, it is the XDC object model representation of the 
     *           type.
     *     - `buffer`
     *           Buffer of target memory containing raw data.
     *     - `len`
     *           Number of elements in the array.
     *  @p
     */
    Any decodeStructArray(Any structType, Buffer buffer, Int len);
    
    /*!
     *  @_nodoc
     *  ======== _parseTypeString ========
     *  Convert a type string to a FieldType
     *  
     *  This method interperets a type string from a $$sizes structure, and
     *  returns the interpretation in a FieldType object.
     */
    FieldType _parseTypeString(String fieldType);
    
    /*!
     *  @_nodoc
     *  ======== _decodeField ========
     *  Decodes a single field within a structure and returns its value.
     *  This API is only called by decodeStruct. It does not take an XDC type
     *  object but just a string representing the type of a single field within
     *  a structure.
     *
     *  @p(dlist)
     *      - `fieldType`
     *            Type info for the field.
     *      - `buffer`
     *            Buffer of target memory containing raw data.
     *  @p
     *
     *  TODO - This should be spec'd, but currently it can't because it will
     *  not properly return an Enum object.
     */
    //Any _decodeField(String fieldType, Buffer buffer);
    function _decodeField(fieldType, buffer);

    /*!
     *  @_nodoc
     *  ======== _decodeArray ========
     *  This API decodes an array of any type of elements given the elements' 
     *  type string.
     *
     *  decodeStructArray takes an XDC OM type object, while decodeArray takes
     *  a type string. decodeArray calls down to decodeStructArray if the 
     *  element type is a structure.
     *
     *  @p(dlist)
     *      - `elemType`
     *            Type info for the elements of the array.
     *      - `buffer`
     *            Buffer of target memory containing raw data.
     *      - `len`
     *            Number of elements in the array.
     *  @p
     */
    Any _decodeArray(String elemType, Buffer buffer, Int len);
    
    /*!
     *  @_nodoc
     *  ======== _decodeScalar ========
     *  Decodes a scalar value of 'type' at the offset specified in
     *  'buffer.off'.
     *
     *  @p(dlist)
     *      - `type`
     *            Type info for the scalar
     *      - `buffer`
     *            Buffer of target memory containing raw data.
     *  @p
     *
     *  TODO - This should be spec'd, but currently it can't because it will
     *  not properly return an Enum object.
     */
    //Any _decodeScalar(FieldType type, Buffer buffer);
    function _decodeScalar(type, buffer);
    
}
/*
 *  @(#) xdc.rov; 1, 0, 1,0; 11-8-2017 17:11:10; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

