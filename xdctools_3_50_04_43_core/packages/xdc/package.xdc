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
/*!
 *  ======== xdc ========
 *  Core interfaces and modules necessary for the XDC runtime.
 *
 *  In addition to the interfaces specified below, this package also supplies
 *  a C/C++ header, `std.h` that facilitates the creation of portable sources.
 *  This header defines a set of "base" types that enable the creation
 *  of C-code that is portable between any two targets.  C source code that
 *  relies exclusively on these types is portable to all targets and
 *  platforms.  Where appropriate, the types defined below are related to the
 *  types defined in the library headers prescribed by the C99 standard
 *  (ISO/IEC 9899:1999).
 *
 *  Why not simply use the C99 types?  Having a
 *  unique set of names provides a layer of insulation between a portable code
 *  base and a particular compiler; e.g., even if a compiler does not support
 *  the C99 types or defines them inappropriately for a particular device, it
 *  is possible to use the compiler without changing the code base.  Thus, the
 *  developer is not forced to choose the lesser of two evils: waiting for a
 *  change to the compiler or forking the code base for a particular compiler
 *  device combination.
 *
 *  There are several situations where a small separate set of portable types
 *  can help the maintainability of a code base.
 *  @p(blist)
 *      - not all of the types described in the C99 standard are required to 
 *        be defined by conformant implementations nor is it possible for all
 *        devices to implement some of the types specified (e.g., `int8_t` is
 *        not implemented on C54 devices); so it is difficult to identify
 *        non-portable source code.
 *      - not all compilers provide C99 type support; if XDC supplies the type
 *        definition and the compiler is updated to include C99 types, a
 *        compilation error will occur if the source includes the C99
 *        headers.
 *      - not all compiler and device combinations are conformant; even high
 *        quality compilers may not properly define the types for each device
 *        supported by compiler.
 *
 *  @a(Usage)
 *  @p(code)
 *      #include <xdc/std.h>
 *  @p
 *
 *  To compile sources that include `xdc/std.h`, two symbols must be defined
 *  before including this header:
 *  @p(dlist)
 *      - `xdc_target_types__`
 *          the package qualified path of the target's standard types header;
 *          e.g., `ti/targets/std.h`.  This value is specified in the target's
 *          `stdInclude` config parameter; see
 *          `{@link xdc.bld.ITarget#stdInclude}`
 *
 *      - `xdc_target_name__`
 *          the target's module name without the package prefix; e.g., `C64`
 *          rather than `ti.targets.C64`.
 *  @p
 *  For example, to compile sources for the `ti.targets.C64` target using TI's
 *  `cl6x` compiler, the following command line is sufficient:
 *  @p(code)
 *      cl6x -Dxdc_target_types__=ti/targets/std.h -Dxdc_target_name__=C64
 *  @p
 *
 *  Each of the type names below has an equivalent "long name"; i.e., a name
 *  that has an "`xdc_`" prefix.  For example, the type `Bool` can also be
 *  written as "`xdc_Bool`".  Long names exist to avoid conflicts with
 *  names defined or used by existing code bases.
 *
 *  In the event that one of the short type names below conflicts with another
 *  type name (that can not be changed), it is possble to disable the short
 *  names by defining the symbol `xdc__nolocalnames` before including
 *  `xdc/std.h`.
 *  @p(code)
 *      #define xdc__nolocalnames
 *      #include <xdc/std.h>
 *  @p
 *
 *  There are two other symbols that affect the definitions provided by
 *  `std.h`: `xdc__strict` and `xdc__deprecated_types`.  These symbols, like
 *  `xdc__nolocalnames`, enable you to easily control the definitions provided
 *  `std.h`.  In this case, however, these symbols are used to manage the
 *  deprecation of symbols provided in earlier releases.  For more information
 *  about when to use these symbols, see {@link http://rtsc.eclipse.org/docs-tip/Integrating_RTSC_Modules#Disabling_and_Enabling_Deprecated_Definitions Disabling and Enabling Deprecated Definitions}`.
 *
 *  @a(Standard Types)
 *  This header may be included multiple times and defines the following
 *  target-dependent types:
 *  @p(dlist)
 *      - `Bool`
 *          this type is large enough to hold the values `0` or `1`.  The
 *          constants TRUE and FALSE are of this type; see below.
 *      - `String`
 *          this type is defined to be a `char *` and exists to allow code
 *          to distinguish between pointers to buffers of raw data and
 *          '\0' terminated strings.
 *      - `CString`
 *          this type is defined to be a `const char *` and exists to allow 
 *          code to distinguish between pointers to a modifiable '\0'
 *          terminated sequence of characters (i.e., a `String`) and one that
 *          is not modifiable (e.g., a literal string such as
 *          `"hello world\n"`).
 *      - `Int`n, where n = 8, 16, or 32
 *          signed integer type that is large enough to hold n bits; the
 *          actual target type may by be larger than n.  This type is
 *          equivalent to one of the C99 types `int_least`n`_t` or
 *          `int_fast`n`_t`; see  Section 7.18.
 *      - `UInt`n, where n = 8, 16, or 32
 *          unsigned integer type that is large enough to hold n bits; the
 *          actual target type may by be larger than n.  This type is
 *          equivalent to one of the C99 types `uint_least`n`_t` or
 *          `uint_fast`n`_t`; see ISO/IEC 9899:1999 Section 7.18.
 *      - `Bits`n, where n = 8, 16, or 32
 *          unsigned integer type that is precisely n bits. Not all targets
 *          support all values of n; if the target does not support an exact
 *          size the corresponding type is not defined.  This type is
 *          equivalent to the corresponding C99 type `uint`n`_t`; see ISO/IEC
 *          9899:1999 Section 7.18.
 *      - `Fxn`
 *          this type is a pointer to code; it can hold a pointer to any
 *          function.
 *      - `Ptr`
 *          this type is a pointer to data; it can hold a pointer to any
 *          data structure.
 *      - `IArg`
 *          this integer type is large enough to hold a `Fxn`, `Ptr`, or
 *          `Int`.
 *      - `UArg`
 *          this unsigned integer type is large enough to hold a `Fxn`,
 *          `Ptr`, or `Int`.
 *      - `LLong`
 *          this long integer type is large enough to hold a `Long` and is
 *          defined as a 'long long' type on targets that support this type;
 *          otherwise, it is simply a `Long`.
 *
 *          Note that C99 requires the `long long` type to be at least 64-bits
 *          wide (See ISO/IEC 9899:1999 Section 5.2.4.2.1).  But some
 *          compilers do not support 64-bit integral types and some don't
 *          support the `long long` even though they do support 64-bit
 *          integral types.  Since these variations limit the portability of
 *          valid C sources, the LLong type is always defined, is always at
 *          least as wide as the `Long` type, and is at least 64-bits wide for
 *          targets that support 64-bit integral types.
 *
 *      - `ULLong`
 *          this unsigned long integer type is large enough to hold a `ULong`
 *          and is defined as a 'unsigned long long' type on targets that
 *          support this type; otherwise, it is simply a `ULong`.
 *  @p
 *
 *  The `xdc/std.h` header also defines the following aliases for the base C
 *  types.  These aliases exist so that C sources can consistently follow
 *  a naming convention in which all type names are written in camel-case.
 *  @p(dlist)
 *      - `Char` and `UChar`
 *          aliases for `char` and `unsigned char`, respectively
 *      - `Short` and `UShort`
 *          aliases for `short` and `unsigned short`, respectively
 *      - `Int` and `UInt`
 *          aliases for `int` and `unsigned int`, respectively
 *      - `Long` and `ULong`
 *          aliases for `long` and `unsigned long`, respectively
 *      - `Double` and `LDouble`
 *          aliases for `double` and `long double`, respectively
 *      - `SizeT`
 *          alias for `size_t`
 *      - `VaList`
 *          alias for `va_list`
 *  @p
 *  The types above are defined for all targets.  Some targets can support
 *  the following additional types.  Since these types are not always
 *  supported by a target, these types should only be used when no other
 *  type sufficies.
 *  @p(dlist)
 *      - `Bits`n, where n = 8, 16, or 32
 *          this unsigned integer type is precisely n-bits wide.  This type is
 *          equivalent to the optional C99 type `uint`n`_t`; see ISO/IEC
 *          9899:1999 Section 7.18.1.1.  This type is defined if and
 *          only if the preprocessor macro `xdc__BITS`n`__` is defined.
 *  @p
 *  
 *  @a(64 Bit Types)
 *  Although the C99 standard requires support for 64-bit types, not all
 *  compiler/device combinations can usefully support them.  As a result,
 *  the 64-bit types described here may not be defined for all targets.  For
 *  each type there is a corresponding pre-processor macro which is
 *  defined if and only if the type is supported.
 *  @p(dlist)
 *      - `Int64`
 *          signed integer type that is large enough to hold 64 bits; the
 *          actual target type may by be wider than 64 bits.  This type is
 *          equivalent to one of the C99 types `int_least64_t` or
 *          `int_fast64_t`; see  Section 7.18.  This type is defined if and
 *          only if the preprocessor macro `xdc__INT64__` is defined.
 *      - `UInt64`
 *          unsigned integer type that is large enough to hold n bits; the
 *          actual target type may by be wider than 64 bits.  This type is
 *          equivalent to one of the C99 types `uint_least64_t` or
 *          `uint_fast64_t`; see ISO/IEC 9899:1999 Section 7.18.  This type
 *          is defined if and only if the preprocessor macro
 *          `xdc__INT64__` is defined.
 *      - `Bits64`
 *          unsigned integer type that is precisely 64 bits wide. If the target
 *          does not support an exact 64-bit size, this type is not defined.
 *          This type is equivalent to the corresponding C99 type
 *          `uint64_t`; see ISO/IEC 9899:1999 Section 7.18.  This type is
 *          defined if and only if the preprocessor macro `xdc__BITS64__` is
 *          defined.
 *  @p
 *
 *  @a(Predefined Macros)
 *  In addition to the type definitions above, `xdc/std.h` also defines the
 *  following commonly used constants
 *  @p(dlist)
 *      - `NULL`
 *          defined as `0`
 *      - `TRUE`
 *          defined as `((Bool)1)`
 *      - `FALSE`
 *          defined as `((Bool)0)`
 *  @p
 *
 *  Finally, `xdc/std.h` defines the following target-independent symbols
 *  that have target-dependent values; these predefined macros enable
 *  conditional compilation of source files based on target-specific
 *  attributes.  
 *  @p(dlist)
 *      - {c_target_name}
 *          this symbol (the target's fully qualified name with all '.'s
 *          replaced with '_') is always defined and allows one to easily
 *          include target-specific headers or define symbols with
 *          target-specific values.
 *
 *      - `xdc_target__isaCompatible_`{isa_name}
 *          for every ISA named in the array returned by this target's
 *          `{@link xdc.bld.ITarget#getISAChain()}` method, a symbol of this
 *          name is defined.  In addition to enabling one to create code
 *          specific to a particular ISA, this allows one to create code that
 *          depends on TI's C6x architecture without being dependent
 *          on a particular member of the C6x family, for example.
 *
 *      - `xdc_target__isa_`{isa}
 *          this symbol is always defined  and {isa} is the
 *          target's `isa` (see `{@link xdc.bld.ITarget#isa}`).
 *
 *      - `xdc_target__`{little,big}`Endian`
 *          if this target's `{@link xdc.bld.ITarget#model}.endian` property is
 *          specified, this symbol is defined and {little,big} is replaced
 *          by `model.endian`.
 *
 *      - `xdc_target__`{code_model_name}`Code`
 *          if this target's `{@link xdc.bld.ITarget#model}.codeModel` is
 *          specified, this symbol is defined and {code_model_name} is
 *          replaced by `model.codeModel`.
 *
 *      - `xdc_target__`{data_model_name}`Data`
 *          if this target's `{@link xdc.bld.ITarget#model}.dataModel` is
 *          specified, this symbol is defined and {data_model_name} is
 *          replaced by `model.dataModel`.
 *
 *      - `xdc_target__os_`{os_name}
 *          this symbol is always defined  and {os_name} is the
 *          target's os name (see `{@link xdc.bld.ITarget#os}`).
 *
 *      - `xdc_target__sizeof_`{type_name}
 *          this symbol is defined for each type name supported in the target's
 *          `{@link xdc.bld.ITarget#stdTypes}` structure, {type_name} is the
 *          name of one of the standard types supported above, and the 
 *          value is `sizeof(type_name)`.
 *
 *      - `xdc_target__alignof_`{type_name}
 *          this symbol is defined for each type name supported in the target's
 *          `{@link xdc.bld.ITarget#stdTypes}` structure, {type_name} is the
 *          name of one of the standard types supported above, and the
 *          value is the alignment required by the compiler for {type_name}.
 *
 *      - `xdc_target__bitsPerChar`
 *          this symbol is always defined and specifies the number of bits 
 *          in the target's `char`.  This value combined with the
 *          `xdc_target__sizeof_` values allows C code to determine the
 *          precise number of bits in any of the standard types.
 *  @p
 *
 *  @a(See)
 *  {@link http://www.open-std.org/jtc1/sc22/wg14/www/standards ISO-IEC JTC1-SC22-WG14 - C Approved standards}
 *
 *  @a(Throws)
 *  `XDCException` exceptions are thrown for fatal errors. The following
 *  error codes are reported in the exception message:
 *  @p(dlist)
 *      - `xdc.PACKAGE_NOT_FOUND`
 *           This error is reported whenever a specified package is not found
 *           This may happen for the following reasons:
 *      @p(blist)
 *            -  Ensure that the package in question is contained in one of
 *               the repositories named in the package path.  
 *            -  The package has not been built by the `xdc` tool even though
 *               the physical package directory may be present along the
 *               package path
 *   @p(dlist)
 *     - `xdc.FILE_NOT_FOUND`
 *            This error is reported when a specified file is not found. 
 *            Ensure that any directory name prefix in the name is a package
 *            directory contained in one of the repositories named in the
 *            package path.  For example, if "ti/targets/linkcmd.xdt" can't
 *            be found, make sure the directory `ti/targets/` is contained in
 *            at least one repository named in the package path.
 *      - `xdc.MODULE_NOT_FOUND`
 *            This error is reported when a specified module can't be
 *            found. Ensure that the package containing the module in
 *            question is contained in at least one repository named in
 *            the package path.
 *            Also ensure that the module name is qualified with the
 *            package name. For example, to refer to the module `Engine`
 *            in the package `ti.sdo.ce`, the module name should be
 *            specified as `ti.sdo.ce.Engine`.
 *      - `xdc.TOOL_USAGE_ERROR`
 *            This error may happen when the `xs` tool is not passed the
 *            expected command line arguments. 
 *      - `xdc.MODULE_UNDEFINED_MAIN_FUNCTION`
 *            This error is reported when the `xs` tool is passed a module
 *            that does not define a `main` function. Ensure that the
 *            meta-domain implementation of the module has a `main` function.
 *      - `xdc.SPEC_FILE_ERROR`
 *            This error is reported when there is a parsing error in a
 *            specification file. Check the spec. file for syntax errors.
 *      - `xdc.DEPRECATED_FUNCTION`
 *            This error is reported whenever a deprecated function is called.
 *      - `xdc.STATIC_INSTANCE`
 *            This error is reported when a function create() is called at the
 *            configuration time for a module that does not implement the
 *            function instance$static$init and therefore does not support
 *            static instances. 
 */
package xdc [1, 1, 1] {
    /* base interface for all XDC packages */
    interface IPackage;
    module Warnings;
}
/*
 *  @(#) xdc; 1, 1, 1,0; 11-8-2017 17:10:07; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

