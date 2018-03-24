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
 * */
package xdc.tools.cdoc;

/*!
 *  ======== Example ========
 *  XDOC markup language examples for modules and interfaces
 *
 *  This module demonstrates the features of XDOC on the declarations
 *  of an XDC module. View the source text of this .xdc file for details
 *  on how to use these examples.
 */
module Example {
    /*!
     *  ======== AStruct ========
     *  Example structure declaration
     *
     * @field(aField) example field documentation
     */
    struct AStruct {
        Int aField;
    };

    /*!
     *  ======== aFunction ========
     *  Example function documentation
     *
     * @param(aParam) example function parameter documentation
     */
    Void aFunction(Int aParam);

    /*!
     *  ======== AnEnum ========
     *  Example enum documentation
     *
     *  @value(AVALUE)  example enum value documentation
     */
    enum AnEnum {
        AVALUE
    };
    /*!
     *  ======== AUnion ========
     *  Example union documentation
     *
     *  @field(aString) example union field documentation
     */
    union AUnion {
        String aString;
        Int anInt;
    };

    /*!
     *  ======== u ========
     *  Example statically initialized union documentation
     */
    config AUnion u = {aString: 'hello', anInt: 1234};

    /*!
     *  ======== ATypedEnum ========
     *  Example typed enumeration
     *
     *  This declaration defines a new type named ATypedEnum which is
     *  an alias of Int and two constants of type ATypedEnum.
     *
     *  Unlike ordinary C enums, where the compiler is free to choose an
     *  arbitrary type for enums, this declaration ensures that the new
     *  type is of a specific named type (in this case, Int).
     *
     *  @value(LOOP)  example "typed" enum value documentation
     */
    enum ATypedEnum : Int {
        LOOP = 6,
        PRINT = 28
    };
    
    /*!
     *  ======== ACmd ========
     *  Example "tagged union" documentation
     *
     *  This structure illustrates the "tagged union" pattern: one
     *  field of the structure indicates how to interpret the rest of the
     *  structure.
     *
     * @field(args) example structure field documentation
     */
    struct ACmd {
        ATypedEnum cmdId;
        union  {
            struct {
                Int count;
            } loop;

            struct {
                String msg;
            } print;
        } args;
    };

}
/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

