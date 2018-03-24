               TMS320C6000 C/C++ CODE GENERATION TOOLS
                         8.1.3 Release Notes
                              January 2017    

The C6000 CGT v8.1.3 release is intended for MCSDK, OpenMP, and/or OpenCL
project development. For new and existing general purpose C6000-based
application development projects, we recommend the use of the latest
available C6000 CGT v7.4.x release (v7.4.20 as of November 2016).

===============================================================================
Contents
===============================================================================

1) Support Information
   1.1) List of Fixed and Known Defects
   1.2) Compiler Wiki
   1.3) Compiler Documentation Errata
   1.4) TI E2E Community
   1.5) Defect Tracking Database

2) Changes to Support of Legacy ABIs and Processor Variants
   2.1) Discontinued Support for COFF
   2.2) Discontinued Support for Legacy Processor Variants
   2.3) Guidance and Recommended Usage

3) STLport C++ RTS

4) Support for Vector Data Types
   4.1) Basic Usage
   4.2) Vector Data Types and Operations

5) Linker Support for Weak Absolute Symbols
   5.1) Defining Weak Absolute Symbols in Assembly
   5.2) Defining Weak Absolute Symbols in Linker Command Files
   5.3) Linker's Handling of Weak and Strong Definitions of Absolute Symbols

-------------------------------------------------------------------------------
1) Support Information
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
1.1) List of Fixed and Known Defects
-------------------------------------------------------------------------------

As of the 8.1.3 release, the DefectHistory.txt file has been replaced with
the two files Open_defects.html and Closed_defects.html. These show the open and
closed defects for the 8.1.x compiler branch. For open bugs, a status of 
Open or Accepted means that the bug has not been examined yet, whereas a status of
Planned means that an evaluation or fix is in progress.

-------------------------------------------------------------------------------
1.2) Compiler Wiki
-------------------------------------------------------------------------------

A Wiki has been established to assist developers in using TI Embedded
Processor Software and Tools.  Developers are encouraged to read and
contribute to the articles.  Registered users can update missing or
incorrect information.  There is a large section of compiler-related
material.  Please visit:

http://tiexpressdsp.com/wiki/index.php?title=Category:CGT

-------------------------------------------------------------------------------
1.3) Compiler Documentation Errata
-------------------------------------------------------------------------------

Errata for the "TMS320C6000 Optimizing Compiler User's Guide" and the
"TMS320C6000 Assembly Language User's Guide" is available online at the
Texas Instruments Embedded Processors CG Wiki:

http://tiexpressdsp.com/wiki/index.php?title=Category:CGT

under the 'Compiler Documentation Errata' link.

-------------------------------------------------------------------------------
1.4) TI E2E Community
-------------------------------------------------------------------------------

Questions concerning TI Code Generation Tools can be posted to the TI E2E
Community forums.  The "Development Tools" forum can be found at:

http://e2e.ti.com/support/development_tools/f/default.aspx

-------------------------------------------------------------------------------
1.5) Defect Tracking Database
-------------------------------------------------------------------------------

Compiler defect reports can be tracked at the Development Tools bug
database, SDOWP. The log in page for SDOWP, as well as a link to create
an account with the defect tracking database is found at:

https://cqweb.ext.ti.com/pages/SDO-Web.html

A my.ti.com account is required to access this page.  To find an issue
in SDOWP, enter your bug id in the "Find Record ID" box once logged in.
To find tables of all compiler issues click the queries under the folder:

"Public Queries" -> "Development Tools" -> "TI C-C++ Compiler"

With your SDOWP account you can save your own queries in your
"Personal Queries" folder.


-------------------------------------------------------------------------------
2) Changes to Support of Legacy ABIs and Processor Variants
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
2.1) Discontinued Support for COFF
-------------------------------------------------------------------------------

v8.1 no longer supports the COFF object file format.  Only ELF is supported.  
In addition, the --abi option is deprecated.  The default and only ABI is 
"eabi" and likewise, the default and only object file format is ELF.

-------------------------------------------------------------------------------
2.2) Discontinued Support for Legacy Processor Variants
-------------------------------------------------------------------------------

v8.1 no longer supports older CPUs.  v8.1 supports -mv6400+ (-mv6400p), 
-mv6740, and -mv6600.  This release no longer supports -mv6200, -mv6400, 
-mv6700, -mv6700+ (-mv6700p), or -mvtesla.

-------------------------------------------------------------------------------
2.3) Guidance and Recommended Usage
-------------------------------------------------------------------------------

The C6000 CGT v8.1 is a *NEW* compiler:
* v8.1 will support C6400+, C6740, and C6600 in ELF EABI mode only
* v7.4.x will continue to support all C6000 processor variants in ELF EABI
  or COFF ABI mode
* C++ object code generated by compilers older than v8.0 is *NOT* compatible
  with v8.1 RTS object libraries

You should use v8.1 if you are:
* Developing new applications for OpenCL, OpenMP, or HPC-MCSDK
* Developing new applications that utilize new compiler features that are
  available only in v8.0 and beyond (Native Vector Types, for example)

You should use v7.4.x if you are:
* Maintaining an existing code base that you don't want or need to transition
  to a new compiler
* Developing new applications or maintaining existing applications that use
  the COFF ABI
* Developing new applications or maintaining existing applications on C6200,
  C6400, C6700, C6700+, or Tesla.


-------------------------------------------------------------------------------
3) STLport C++ RTS                      
-------------------------------------------------------------------------------
v8.0 introduced the STLport C++03 RTS. The move to STLport will break ABI
compatibility with previous C++ RTS releases. Attempting to link old C++
object code with the new RTS will result in a link-time error. Suppressing
this error will likely result in undefined symbols or undefined behavior during
execution. Breakages are known to occur in particular for object code using
locale, iostream, and string.

In most cases, recompiling old source code with the new RTS should be safe.
However, for non-standard API extensions to the C++ library, compatibility is
not guaranteed. This includes usage of hash_map, slist, and rope.

Dependence between locale and iostream is increased in STLport. Usage of one
will likely cause the other to be linked as well. This may cause an additive
increase in both code size and initialization time.

C ABI compatibility will not be affected by this change.


-------------------------------------------------------------------------------
4) Support for Vector Data Types
-------------------------------------------------------------------------------

Beginning with the C6000 CGT v8.0.0 alpha 3 release, the C/C++ compiler now
supports the use of OpenCL-like vector data types in C/C++ source files.

-------------------------------------------------------------------------------
4.1) Basic Usage
-------------------------------------------------------------------------------

  Support for vector data types is available on all C6x architecures this
  compiler release supports (see section 2).

  Support for vector data types is enabled when the "--vectypes" option is 
  specified on the compiler command line when compiling a source file for one
  of the above target architectures.

  For example:

    %> cl6x -mv6600 --vectypes -o1 example.c

  Support for vector data types requires the use of the optimizer. That is,
  the "--vectypes" option must be specified in combination with "-o0", "-o1",
  "-o2", or "-o3" on the compiler command line.

  All of the vector data types and related built-in functions that are 
  supported in the C6x programming model are specified in the "c6x_vec.h" 
  header file that you can find in the "include" sub-directory where your 
  C6000 CGT was installed.

  Any C/C++ source file that utilizes vector data types or any of the built-in
  functions must "#include <c6x_vec.h>" in that source file.


-------------------------------------------------------------------------------
4.2) Vector Data Types and Operations
-------------------------------------------------------------------------------

  Vector Data Types
  -----------------

  A vector type name is a concatenation of element type name with a number
  representing vector length. A vector with such type consists of vector length
  number of vector elements. 

  The C6x programming model implementation of vector data types and operations
  follows the OpenCL C language specification very closely. For a more detailed
  description of OpenCL vector data types and operations, please see "The
  OpenCL Specification" version 1.2 which is available from the Khronos OpenCL
  Working Group:

    http://www.khronos.org/opencl/

  Chapter 6, section 6.1.2 of "The OpenCL Specification" version 1.2 provides
  a detailed description of the built-in vector data types supported in the 
  OpenCL C programming language.

  The C6x programming model provides the following built-in vector data 
  types:

  o Element type names and sizes

    char	char, 8 bits
    uchar	unsigned char, 8 bits
    short	short, 16 bits
    ushort	unsigned short, 16 bits
    int		int, 32 bits
    uint	unsigned int, 32 bits
    longlong	long long, 64 bits
    ulonglong	unsigned long long, 64 bits
    float	IEEE single precision floating-point, 32 bits
    double	IEEE double precision floating-point, 64 bits

    NOTE: In order to avoid confusion between C6000's definition of long 
    (32-bits) and OpenCL's definition of long (64-bits), native vector types
    with a base type of long or unsigned long (ulong) have not been provided.
    In order to use native vector types like long2, the user can simply 
    implement a simple preprocessor macro such as:
        #define long2 longlong2
    or
        #define long2 int2
    depending what element type and size is desired.

  o Valid vector lengths: 2, 3, 4, 8, 16

    For example, a "uchar8" is a vector of 8 unsigned chars. Its length is 8
    and its size is 64 bits.

  The C6x programming model also provides an extension to the OpenCL C
  programming language for representing vectors of complex type. A prefix of
  'c' is used to indicate a complex type name. Each complex type vector 
  element contains a real part and an imaginary part with the real part 
  occupying the lower address in memory.

  o Complex element type names and sizes:

    cchar	complex char type, 16 bits
    cshort	complex short type, 32 bits
    cint	complex int type, 64 bits
    clonglong	complex long long type, 128 bits
    cfloat	complex float type, 64 bits
    cdouble	complex double type, 128 bits

  o Valid lengths for complex type vectors: 1, 2, 4, 8

    For example, a "cfloat2" is a vector of 2 complex floats. Its length is 2
    and its size is 128 bits. Each "cfloat2" vector element contains a real
    float and an imaginary float.


  Vector Operations: component access
  -----------------------------------
  
  A component access can occur on the left-hand-side (lhs) or right-hand-side
  (rhs) of an assignment operator. If specified on the lhs of an assignment,
  each component must be uniquely identifiable.

  The C6x programming model implementation supports OpenCL C like swizzle
  operators:

  o A suffix of ".x", ".y", ".z", or ".w" can be used to access an element
    of a vector whose length is <= 4.

      char4 my_c4 = (char4)(1, 2, 3, 4);
      char    tmp = my_c4.y * my_c4.w;  /* ".y" accesses 2nd element
                                        *  ".w" accesses 4th element
					*  tmp = 2 * 4 = 8;
					*/

  o A suffix of ".s0", ".s1", ..., ".s9", ".sa", ..., ".sf" can be used
    to access one of up to 16 elements in a vector.

      uchar16 ucvec16 = (uchar16)(1, 2, 3, 4, 5, 6, 7, 
                                  8, 9, 10, 11, 12, 13, 14, 15, 16 );
      uchar8  ucvec8  = (uchar8)(2, 4, 6, 8, 10, 12, 14, 16);

      int tmp = ucvec16.sa * ucvec8.s7; /* ".sa" is 11th element of ucvec16
                                        *  ".s7" is 8th element of ucvec8
					*  tmp = 11 * 16 = 176;
					*/

  o A suffix of ".even" or ".odd" can be used to access the even or odd
    elements of a vector.

      ushort4 usvec4 = (ushort4)(1, 2, 3, 4);
      ushort2 usvecodd  = usvec4.odd;  /* usvecodd  = (ushort2)(2, 4); */
      ushort2 usveceven = usvec4.even; /* usveceven = (ushort2)(1, 3); */

  o A suffix of ".hi" or ".lo" can be used to access the elements in the
    upper half of a vector (for ".hi") or the elements in the lower half
    of a vector (for ".lo").

      ushort8 usvec8 = (ushort8)(1, 2, 3, 4, 5, 6, 7, 8);
      ushort4 usvechi = usvec8.hi; /* usvechi = (ushort4)(5, 6, 7, 8); */
      ushort4 usveclo = usvec8.lo; /* usveclo = (ushort4)(1, 2, 3, 4); */

  The C6x programming model also supports an extension to the OpenCL C
  programming language for accessing elements of a complex type vector:

  o A suffix of ".r" can be used to access the real parts of each of
    the elements in a complex type vector.

      cfloat2 cfa = (cfloat2)(1.0, -2.0, 3.0, -4.0);
      float2  rfa = cfa.r; /* ".r" accesses real parts of cfa elements
                           *  rfa = (float2)(1.0, 3.0);
			   */

  o A suffix of ".i" can be used to access the imaginary parts of each of
    the elements in a complex type vector.

      cfloat2 cfa = (cfloat2)(1.0, -2.0, 3.0, -4.0);
      float2  ifa = cfa.i; /* ".i" accesses imaginary parts of cfa elements
                           *  ifa = (float2)(-2.0, -4.0);
			   */

  Swizzle operators can also be combined if the result of the combination
  is well-defined:

      ushort4 usvec4 = (ushort4)(1, 2, 3, 4);
      ...
      usvec4.hi.even = 5;  /* After this assignment,
                           *  usvec4 contains (1, 2, 5, 4)
			   */


  Vector Operations: concatenation
  --------------------------------

  Scalar entities or shorter vectors can be concatenated together to form
  longer vectors. When all of the components involved are constants, the
  result is a vector literal. Otherwise, the vector's value is determined at 
  run-time.

  o Vector literals

    (short4)(1, 2, 3, 4);
    (float2)(3.2, -2.3);

  o Vector concatenation

    void foo(int a, int b)
    {
       int2 myvec = (int2)(a, b);
       ...
    }


  Vector Operations: conversion and re-interpretation
  ---------------------------------------------------

  The C6x programming model includes functions that can convert or re-interpret
  the elements of one vector type as another vector type. 

  o convert_<destination type>(<source type object>) can be used to perform
    an element by element conversion of one vector type object into another
    vector type object. The source vector type and the destination vector
    type must be the same length.

      void foo(int a, int b)
      {
	 /* initialize a short2 vector from a converted int2 vector */
         short2 svec2 = convert_short2((int2)(a, b));
	 ...
      }

  o as_<destination type>(<source type object>) can be used to 
    re-interpret the original vector type of an object as another
    vector type. The source type and destination type must be the
    same size.

    extern longlong lla;
    float2   fltvec2 = as_float2(lla);

  Neither the convert_<destination type>(<source type object>) nor the
  as_<destination type>(<source type object>) is available for use with
  complex types.


  Vector Operations: infix operators
  ----------------------------------

  When infix operators are applied to vector type objects, the operator
  is applied element by element. That is, each element in the result vector
  is the result of applying the infix operator to the corresponding elements
  in the source vector(s).

  o Unary:
   
    Negate: -
    Bitwise complement: ~
    Logical not (integer vectors only): !

      int4 pos_i4 = (int4)(1, 2, 3, 4);
      int4 neg_i4 = -pos_i4; /* Use of negate operator initializes
                             *  neg_i4 to (-1, -2, -3, -4)
			     */

  o Binary 
  
    Assignment operators: =, op= (+=, for example)
    Arithmetic operators: +, - , *, /
    Modulo operator (integer vectors only): %
    Bitwise operators: &, |, ^, <<, >>
    Relational operators: >, >=, ==, !=, <=, <
    Increment / decrement (integer vectors only): ++(), ()++, --(), ()--
    Logical operators (integer vectors only): &&, ||

      /* Assume iv4 argument contains (1, 2, 3, 4) coming in */
      void foo(int4 iv4)
      {
         int4 local_iva = iv4++; /* local_iva = (1, 2, 3, 4) */
         int4 local_ivb = iv4++; /* local_ivb = (2, 3, 4, 5) */

	 /* local_ivc = (1, 2, 3, 4) + (2, 3, 4, 5) = (3, 5, 7, 9) */
         int4 local_ivc = local_iva + local_ivb;
      }
      /* iv4 contains (3, 4, 5, 6) on exit from foo() */

  o Operators available with complex vector types

    Arithmetic operators: +, - , *, /
    Increment / decrement (by 1+0i): ++(), ()++, --(), ()--

      /* On C6400+, the following code will call a built-in function to */
      /* perform the copmlex multiply and divide operations. However,   */
      /* on C6600, the compiler will generate a CMPYSP instruction to   */
      /* carry out the complex multiply or divide operation.            */
      void foo()
      {
         cfloat2 va = (cfloat2) (1.0, -2.0, 3.0, -4.0);
         cfloat2 vb = (cfloat2) (4.0, -2.0, -4.0, 2.0);

         /* For details about the rules for complex multiplication and  */
	 /* division, please see Annex G of the C99 C language          */
	 /* specification.                                              */

	 /* vc = < (0.0, -10.0), (-4.0, 22.0)> */
         cfloat2 vc = va * vb;

	 /* vd = < (0.4, -0.3), (-1.0, 0.5)> */
         cfloat2 vd = va / vb;
	 ...
      }


  Vector Operations: built-in functions
  -------------------------------------

  Prototypes for all of the vector built-in functions supported in the
  C6x programming model are listed in the "c6x_vec.h" header file that
  you can find in the "include" sub-directory where your C6000 CGT
  package was installed. Please refer to the contents of "c6x_vec.h" 
  for a complete list of the vector built-in functions.

  Here is an example which uses vector built-in functions:

  [vbif_ex.c]

    #include <stdio.h>
    #include <c6x_vec.h>

    void print_short4(char *s, short4 v)
    {
       printf("%s", s);
       printf(" <%d, %d, %d, %d>\n", v.x, v.y, v.z, v.w);
    }

    int main()
    {
       short4 va = (short4) (1, 2, 3, -32766);
       short4 vb = (short4) (5, 32767, -13, 17);
       short4 vc = va + vb;
       short4 vd = va - vb;
       short4 ve = __add_sat(va, vb);
       short4 vf = __sub_sat(va, vb);
       print_short4("va=", va);
       print_short4("vb=", vb);
       print_short4("vc=(va+vb)=", vc);
       print_short4("vd=(va-vb)=", vd);
       print_short4("ve=__add_sat(va,vb)=", ve);
       print_short4("vf=__sub_sat(va,vb)=", vf);
       return 0;
    }

  Compile:

    %> cl6x -mv6400+ --vectypes -o1 -k vbif_ex.c -z -o vbif_ex.out -llnk.cmd

    Note: 
       - lnk.cmd contains a reference to rts64plus_elf.lib
       - rts64plus_elf.lib contains c6x_veclib.obj which defines the built-in
	 functions, __add_sat() and __sub_sat()

  Run:

    Load and run vbif_ex.out from your favorite C6400+ loader to get the
    following result:

    va= <1, 2, 3, -32766>
    vb= <5, 32767, -13, 17>
    vc=(va+vb)= <6, -32767, -10, -32749>
    vd=(va-vb)= <-4, -32765, 16, 32753>
    ve=__add_sat(va,vb)= <6, 32767, -10, -32749>
    vf=__sub_sat(va,vb)= <-4, -32765, 16, -32768>


-------------------------------------------------------------------------------
5) Linker Support for Weak Absolute Symbols
-------------------------------------------------------------------------------

Beginning with the C6000 v8.0.2 Code Generation Tools, the linker will 
process absolute symbols that are defined with "weak" binding differently 
from absolute symbols that are defined with global binding (the default). 

Instead of including a weak absolute symbol in the output file's symbol table 
by default (as it would for a global absolute symbol), the linker will only
include a weak absolute symbol in the output of a "final" link if the symbol
is required to resolve an otherwise unresolved reference.

This enhancement allows the user to associate addresses with symbols that
are known to have been pre-loaded (like function addresses in system 
memory, for example) and then be able to link a current application against
a pre-loaded memory image. If such symbols are defined as weak absolute
symbols, then the linker can minimize the number of symbols included in
the output file's symbol table to only those that are required to resolve
references. Reducing the size of the output file's symbol table can help to
reduce the link-time, especially if there are a large number of pre-loaded
symbols to link against.

-------------------------------------------------------------------------------
5.1) Defining Weak Absolute Symbols in Assembly
-------------------------------------------------------------------------------

To define a weak absolute symbol in an input object file, the source file
can be written in assembly and contain a combination of .weak and .set
directives. For example, the definition of a weak absolute symbol
"ext_addr_sym" might look like this:

                .weak   ext_addr_sym
ext_addr_sym    .set    0x12345678

The assembly source file simply has to be assembled and the resulting object
file fed into the link so that "ext_addr_sym" is presented as a weak absolute
symbol in a final link and is a candidate for removal if it is not referenced 
from elsewhere in the application.

-------------------------------------------------------------------------------
5.2) Defining Weak Absolute Symbols in Linker Command Files
-------------------------------------------------------------------------------

To define a weak linker defined symbol in a linker command file, the new
"weak" operator can be applied to an identifier in an assignment expression
to designate that symbol as eligible for removal from the output file's symbol
table if it is not referenced.

In a linker command file, an assignment expression outside a MEMORY or 
SECTIONS directive can be used to define a weak linker defined absolute
symbol. For example, "ext_addr_sym" can be defined as follows:

weak(ext_addr_sym) = 0x12345678;

If the linker command file is used in a final link, then "ext_addr_sym" is
presented to the linker as a weak absolute symbol and will not be included
in the resulting linked output file if it is not referenced.

-------------------------------------------------------------------------------
5.3) Linker's Handling of Weak and Strong Definitions of Absolute Symbols
-------------------------------------------------------------------------------

In a given link, the linker may be presented with multiple definitions of 
the same absolute symbol. Some definitions may have weak binding and others
may have strong binding. "Strong" in this context means that the symbol
has not been given a weak binding by either of the two methods described
above in sections 5.1 and 5.2. Some definitions may come from an input object 
file and others may come from a linker command file. The linker employs the
following guidelines in determining which definition of a given absolute 
symbol is used to resolve references to it:

O Strong Absolute Symbol Defined in an Input Object File vs. Strong Absolute 
  Symbol Defined in Linker Command File

  If presented with two strong definitions of the same absolute symbol, the
  linker will choose the definition from the linker command file to resolve
  references to the symbol. If both strong definitions come from input
  object files, then the linker emit a symbol redefinition error and halt
  the link.

O Strong Absolute Symbol Defined in an Input Object File vs. Weak Absolute 
  Symbol Defined in Linker Command File

  If presented with a strong definition of an absolute symbol from an input
  object file and a weak definition of the same absolute symbol from a
  linker command file, then the linker will choose the strong definition
  from the input object file to resolve references to the symbol.

O Weak Absolute Symbol Defined in an Input Object File vs. Strong Absolute 
  Symbol Defined in Linker Command File

  If presented with a weak definition of an absolute symbol from an input
  object file and a strong definition of the same absolute symbol from a
  linker command file, then the linker will choose the strong definition
  from the linker command file to resolve references to the symbol.

O Weak Absolute Symbol Defined in an Input Object File vs. Weak Absolute 
  Symbol Defined in Linker Command File

  If presented with a weak definition of an absolute symbol from an input
  object file and a weak definition of the same absolute symbol from a
  linker command file, then the linker will choose the weak definition 
  from the linker command file to resolve references to the symbol.


-- End Of File --
