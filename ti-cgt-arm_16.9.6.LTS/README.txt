                       ARM C/C++ CODE GENERATION TOOLS
                            16.9.6.LTS Release Notes
                                    October 2017

================================================================================
Contents
================================================================================
1) Support Information
2) Code size improvements
3) Option Cleanup
4) License Change
5) No ARM CGT v16.9.5.LTS

-------------------------------------------------------------------------------
1.  Support Information
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
1.1) List of Fixed and Known Defects
-------------------------------------------------------------------------------

As of the 16.9.1.LTS release, the DefectHistory.txt file has been replaced with
the two files Open_defects.html and Closed_defects.html. These show the open and
closed defects for the 16.9.x.LTS compiler branch. For open bugs, a status of 
Accepted means that the bug has not been examined yet, whereas a status of
Open or Planned means that an evaluation or fix is in progress.

-------------------------------------------------------------------------------
1.2) Compiler Wiki
-------------------------------------------------------------------------------

A Wiki has been established to assist developers in using TI Embedded
Processor Software and Tools.  Developers are encouraged to read and
contribute to the articles.  Registered users can update missing or
incorrect information.  There is a large section of compiler-related
material.  Please visit:

http://processors.wiki.ti.com/index.php?title=Category:Compiler

-------------------------------------------------------------------------------
1.3) Compiler Documentation Errata
-------------------------------------------------------------------------------

Errata for the "TI ARM Optimizing Compiler User's Guide" and the
"TI ARM Assembly Language User's Guide" is available online at the
Texas Instruments Embedded Processors CG Wiki:

http://processors.wiki.ti.com/index.php?title=Category:Compiler

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
1.6) Long Term Support release
-------------------------------------------------------------------------------
The ARM CGT v16.9.0.LTS release is a long term support (LTS) release. This
release will be supported for roughly 2 years with periodic bug fix updates.


-------------------------------------------------------------------------------
2.  Code size improvements
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
2.1  64 bit constant load to register
-------------------------------------------------------------------------------
Cortex-M3/M4 targets have additional optimized MOV instructions implemented for
loads of 64 bit constants to registers.  

-------------------------------------------------------------------------------
2.2  Compressed section alignment
-------------------------------------------------------------------------------
Within initialization tables (.cinit section used to initialize global variables
at startup), compressed sections (RLE and LZSS) are now byte aligned to reduce
holes in the .cinit table.

-------------------------------------------------------------------------------
2.3  LZSS Compression
-------------------------------------------------------------------------------
The linker has historically supported LZSS and RLE compression algorithms
for C auto initialization tables (cinit) and copy tables. The compression
algorithm used is determined by the --cinit_compression and --copy_compression
options and the default has been RLE. In this release we have improve the
LZSS algorithm enough to make it the default algorithm. It no longer uses
4K of stack space and the code size has been made comparable to RLE. In
addition, it can now compress runs of characters almost as efficiently as RLE,
with the benefit of compressing other types of data as well. Our analysis
shows that it beats RLE in almost all cases, and in the few where RLE is
better the difference is 1-3%. If you notice the size of .cinit growing
after switching to this compiler version, consider using the
--cinit_compression=rle linker option and please report the issue on the
E2E forum.

-------------------------------------------------------------------------------
2.4  Improved inlining
-------------------------------------------------------------------------------
We made improvements to our inlining algorithm that allow better automatic
inlining of functions with single call sites. For small functions, this can
result in code size improvements.

-------------------------------------------------------------------------------
2.5  Improved stack utilization
-------------------------------------------------------------------------------
The improvements in inlining exposed issues with constant values being stored
on the stack. The changes in this release avoid using stack space for
constant values that can be easily loaded into a register at every use.

-------------------------------------------------------------------------------
3    Option Cleanup
-------------------------------------------------------------------------------
In this release we removed several options that were either duplicates or
unnecessary. For an overview of the changes please see
http://processors.wiki.ti.com/index.php/Compiler_option_cleanup

-------------------------------------------------------------------------------
4.  License change
-------------------------------------------------------------------------------
The user license has been updated to be TI TSPA (Technology Software Publicly 
Available).  Please see the software manifest accompanying the software for 
applicable licensing terms.


-------------------------------------------------------------------------------
5. No ARM CGT v16.9.5.LTS
-------------------------------------------------------------------------------
Please note that there was no external ARM v16.9.5.LTS release.
