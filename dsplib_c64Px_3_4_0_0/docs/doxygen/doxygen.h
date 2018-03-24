/* ======================================================================== *
 * DSPLIB -- TI Digital Signal Processing Library                          *
 *                                                                          *
 *   Doxygen generation header file                                         *
 *                                                                          *
 * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/   *
 *                                                                          *
 *                                                                          *
 *  Redistribution and use in source and binary forms, with or without      *
 *  modification, are permitted provided that the following conditions      *
 *  are met:                                                                *
 *                                                                          *
 *    Redistributions of source code must retain the above copyright        *
 *    notice, this list of conditions and the following disclaimer.         *
 *                                                                          *
 *    Redistributions in binary form must reproduce the above copyright     *
 *    notice, this list of conditions and the following disclaimer in the   *
 *    documentation and/or other materials provided with the                *
 *    distribution.                                                         *
 *                                                                          *
 *    Neither the name of Texas Instruments Incorporated nor the names of   *
 *    its contributors may be used to endorse or promote products derived   *
 *    from this software without specific prior written permission.         *
 *                                                                          *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     *
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       *
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   *
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT    *
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   *
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        *
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   *
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   *
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     *
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   *
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    *
 * ======================================================================== */

/**
 * @mainpage  @PACKAGE User's Manual (@TARGETN)
 *
 *  @HLINE
 *
 *  <div>
 *    <p>&nbsp;</p>
 *    @section start Getting Started
 *    <table @TSTYLE>
 *      <tr>
 *        <td><a @ASTYLE href="intro.html">Introduction</a></td>
 *        <td>@PACKAGE features and advantages</td>
 *      </tr>
 *      <tr>
 *        <td><a @ASTYLE href="install.html">Package Contents</a></td>
 *        <td>What the installation provides and where</td>
 *      </tr>
 *      <tr>
 *        <td><a @ASTYLE href="building.html">Building</a></td>
 *        <td>How to build @PACKAGE using CCS Projects or GNU make</td>
 *      </tr>
 *      <tr>
 *        <td><a @ASTYLE href="integrate.html">Integration</a></td>
 *        <td>How to integrate @PACKAGE into your code</td>
 *      </tr>
 *      <tr>
 *        <td><a @ASTYLE href="examples.html">Examples</a></td>
 *        <td>Example projects provided with @PACKAGE </td>
 *      </tr>
 *      <tr>
 *        <td @CSTYLE><a @ASTYLE target="_blank" href="@PKGMODLINK">API Reference</a></td>
 *        <td>Detailed usage for all @PACKAGE kernels</td>
 *      </tr>
 *    </table>
 *  </div>
 *
 *
 *  <div>
 *    <p>&nbsp;</p>
 *    @section dox Additional Documents
 *    <table @TSTYLE>
 *      <tr>
 *        <td @CSTYLE><a @ASTYLE @BLANK href="../../../@PKGRELNOTES">Release Notes</a></td>
 *        <td>New features, device support, known issues, etc.</td>
 *      </tr>
 *      <tr>
 *        <td><a @ASTYLE @BLANK href="../../@PKGSWMFEST">Software Manifest</a></td>
 *        <td>Link to manifests for all packages in delivery</td>
 *      </tr>
 *      <tr>
 *        <td><a @ASTYLE @BLANK href="../../@PKGTESTREP">Cycle Benchmarks</a></td>
 *        <td>Cycle and memory benchmarking</td>
 *      </tr>
 *    </table>
 *  </div>
 *
 *
 *  <div>
 *    <p>&nbsp;</p>
 *    @section linx Helpful Links
 *    <table @TSTYLE>
 *      <tr>
 *        <td @CSTYLE><a @ASTYLE @BLANK href="https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm">Code Gen Tools</a></td>
 *        <td>Download site for TI DSP code generation tools</td>
 *      </tr>
 *      <tr>
 *        <td><a @ASTYLE @BLANK href="http://processors.wiki.ti.com/index.php/Download_CCS">Code Composer Studio</a></td>
 *        <td>Download site for Code Composer Studio IDE Version 4.2 and 5.0</td>
 *      </tr>
 *      <tr>
 *        <td><a @ASTYLE @BLANK href="http://e2e.ti.com/support/embedded/f/355.aspx">TI-RTOS  E2E Forum</a></td>
 *        <td>Forum for @PACKAGE questions or remarks</td>
 *      </tr>
 *      <tr>
 *        <td><a @ASTYLE @BLANK href="http://processors.wiki.ti.com/index.php/Software_libraries">Library Wiki</a></td>
 *        <td>Find and download the latest DSPLIB release</td>
 *      </tr>
 *    </table>
 *  </div>
 * 
 *  @SPACER
 */

/**
 * @page intro  Introduction 
 * 
 * <table @NSTYLE><tr><td><a @ASTYLE href="index.html">Back</a></td></tr></table>
 *
 * The TI C6000 @PACKAGE is an optimized DSP Function Library for C programmers. It includes many
 * C-callable, optimized, general-purpose signal-processing routines. These routines are typically 
 * used in computationally-intensive real-time applications where optimal execution speed is critical.
 * By using these routines, you can achieve execution speeds considerably faster than equivalent code
 * written in standard ANSI C language. In addition, by providing ready-to-use DSP functions, TI @PACKAGE 
 * can significantly shorten your DSP application development time.
 *
 * @SPACER
 *
 * @section features  Features and Benefits
 *  @SECSTART 
 *  The TI @TARGETN @PACKAGE contains commonly used digital signal processing routines, 
 *  as well as source code that allows you to modify functions to match your 
 *  specific needs.
 *
 *  - ANSI C source code models
 *  - C-callable routines fully compatible with the TI C6000 compiler
 *  - Host library to enable PC based development and testing
 *  - CCS V5 projects to rebuild library or individual routines unit test.
 *  - <a @BLANK href="../../@PKGTESTREP">Benchmarks</a>
 *  - Tested against reference C model
 *  - Unit-test for each routines.
 *  @SECEND
 *
 * @section routines  Software Routines
 *  @SECSTART 
 *  The rich set of software routines included in @PACKAGE are organized into 
 *  seven functional categories:
 *  
 *  -# <a href="./dsplib_html/group___a_d_a_p_t_i_v_e_f_i_l_t_e_r.html">Adaptive filtering</a>
 *  -# <a href="./dsplib_html/group___c_o_r_r_e_l_a_t_i_o_n.html">Correlation</a>
 *  -# <a href="./dsplib_html/group___f_f_t.html">Fast Fourier Transform</a>
 *  -# <a href="./dsplib_html/group___f_i_l_t_c_o_n_v.html">Filtering and convolution</a>
 *  -# <a href="./dsplib_html/group___m_a_t_h.html">Math</a>
 *  -# <a href="./dsplib_html/group___m_a_t_r_i_x.html">Matrix</a>
 *  -# <a href="./dsplib_html/group___m_i_s_c.html">Miscellaneous</a>
 *  @SECEND
 *  
 */


/**
 * @page install  Package Contents
 * 
 * <table @NSTYLE><tr><td><a @ASTYLE href="index.html">Back</a></td></tr></table>
 *
 *  Unless otherwise specified, the @PACKAGE package installs under
 *  <tt>C:\\ti\\</tt> in directory <tt> @PKGDIR</tt>.  
 *  The directory structure of the installed package will look similar to that 
 *  displayed below in Figure 1, though the install folder will match the installation
 *  version.   
 *  
 *  <table rules="none" frame="void" cellspacing="0" cellpadding="0">
 * @if C66 
 *    <tr><td>
 *      @image html dsplib_c66_directory.jpg "Figure 1. @TARGETN @PACKAGE Directory Structure"
 *    </td></tr>
 * @elseif C64P
 *    <tr><td>
 *      @image html dsplib_c64P_directory.jpg "Figure 1. @TARGETN @PACKAGE Directory Structure"
 *    </td></tr>
 * @elseif C674
 *    <tr><td>
 *      @image html dsplib_c674_directory.jpg "Figure 1. @TARGETN @PACKAGE Directory Structure"
 *    </td></tr>
 * @else
 *    <tr><td>
 *      <b>ERROR:  UNRECOGNIZED TARGET</b>
 *    </td></tr>
 * @endif
 *  </table>
 *
 *  The files that comprise the @PACKAGE installation can be categorized into the 
 *  following five categories.  
 *
 *    -# Documentation
 *    -# Component Repository
 *    -# Kernel Source
 *    -# Eclipse Support
 *    -# Internal Meta Data
 *
 *  The sections that follow provide details for each category.
 *
 * @SPACER
 *  
 * @section documents Documentation
 *  @SECSTART 
 *  Installation places all @PACKAGE documentation in a @c @b Docs directory in the 
 *  @PACKAGE root.  The following documentation comes with the delivery:
 *  
 *  - @PKGMANCHM (this document, CHM format)
 *  - @PKGMANHTML (this document, HTML format)
 *  - <a @BLANK href="../../../@PKGRELNOTES">Release Notes</a>
 *  - <a @BLANK href="../../@PKGSWMFEST">Software Manifest</a></td>
 *  - <a @BLANK href="../../@PKGTESTREP">Cycle Benchmarks</a>
 *  @SECEND
 *
 * @section repository  Component Repository
 *  @SECSTART 
 *  The installation creates a @c @b Components directory in the @PACKAGE root
 *  folder.  This directory serves as a repository for all packages included
 *  in the @PACKAGE installation.  Each package in this repository is compressed.
 *  @SECEND
 *
 * @section kernelsrc  Kernel Source 
 *  @SECSTART 
 *  The installation also creates a @c @b Packages directory in the @PACKAGE root
 *  folder.  This directory holds all kernels contained within the @PACKAGE 
 *  library.  This directory follows the standard TI directory structure.  As an 
 *  example, the files that comprise the @PACKAGE kernel @c @b @KERNELEX will be 
 *  located, relative to the @PACKAGE root installation directory, at
 *  <tt>packages/ti/@package/src/@KERNELEX/</tt>.  
 *
 *  Each Kernel is delivered with a CCSV5 project that illustrates 
 *  the kernel API and performs several validation tests.  Each project provides
 *  an estimate of kernel cycle and program memory requirements.
 *  @SECEND
 *
 * @section eclipsedir  Eclipse Support
 *  @SECSTART 
 *  The @c @b Eclipse directory contains all files required for @PACKAGE to be 
 *  recognized by Eclipse (Code Composer Studio) as a plug-in.  This is a support
 *  directory and can be safely ignored.
 *  @SECEND
 *
 * @section metadata  Internal Meta Data
 *  @SECSTART 
 *  The @PACKAGE installation creates a @c @b Package directory.  This directory 
 *  contains meta information required by the TI packaging tools.  This is a 
 *  support directory and can be safely ignored.  
 *  @SECEND
 *
 */


/**
 * @page examples  Examples 
 * 
 * <table @NSTYLE><tr><td><a @ASTYLE href="index.html">Back</a></td></tr></table>
 *
 *  The FFT example is provided in the examples folder. 
 *  This example demonstrates the usage of the various FFT kernels provided with the @PACKAGE. 
 *  The example shows:  
 *
 *   - Twiddle factor generation for the various kernels              
 *   - Scaling that needs to be applied to get similar output when using different kernels                                   
 *   - Demonstrates the usage of FFT APIs  
 *
 *   The examples folder contains an FFT CCS V5 project and a ReadMe.txt.
 *
 */


/**
 * @page integrate  Integration
 * 
 * <table @NSTYLE><tr><td><a @ASTYLE href="index.html">Back</a></td></tr></table>
 *
 *  Since @PACKAGE is a collection of individual kernels, any combination of the 
 *  kernels that comprise @PACKAGE may be integrated into a system individually.
 *  Integration, for single or multiple kernels, requires four simple steps:
 *
 *    -# Compile @PACKAGE for @TARGETN (optional)
 *    -# Add API calls within system code 
 *    -# Compile system code
 *    -# Link @PACKAGE 
 *
 *  The sections that follow provide details regarding the above four steps.
 *
 * @SPACER
 *  
 *  @section compile  Compile @PACKAGE for @TARGETN (optional)
 *  @SECSTART 
 *  On installation, the @PACKAGE libraries are built and ready to link.  Therefore,
 *  this step is only required when the original kernel source code has been refined 
 *  or contributions have been added.  See @ref building for details regarding 
 *  re-building @PACKAGE .
 *  @SECEND
 *   
 *  @section kernelcalls  Add @PACKAGE API Calls
 *  @SECSTART 
 *  Add calls to @PACKAGE kernels within the system source code as necessary.
 *  Any system source file that contains calls to an @PACKAGE kernel will require 
 *  that the @PACKAGE header file <tt> @PKGHEADER </tt> is included.  See the 
 *  <a href="@PKGMANLINK">@PACKAGE Function Reference</a> for details on individual 
 *  kernel APIs.
 *  @SECEND
 *
 *  @section syscompile  System Compilation
 *  @SECSTART 
 *  To re-compile the system code, the path to the <tt>packages</tt> directory will 
 *  need to be added to the compiler's include path search list.  This path will
 *  depend on the @PACKAGE root installation directory.  This allows the main 
 *  @PACKAGE header file to be moved from within the installation directory and 
 *  still recognize the individual kernel headers.
 *  @SECEND
 *
 *  @section linking  Linking @PACKAGE
 *  @SECSTART 
 *  The path to the @PACKAGE libraries must be provided to the linker via: <br>
 *  -l <DSPLIB_INSTALL_DIR>/packages/ti/dsplib/lib/dsplib.lib 
 *  @SECEND
 *
 */


/**
 * @page building  @PACKAGE Build Process
 * 
 * <table @NSTYLE><tr><td><a @ASTYLE href="index.html">Back</a></td></tr></table>
 *
 *  @PACKAGE is provided with two methods for re-building libraries.  For those
 *  familiar with TI's Code Composer Studio (Eclipse-based) IDE, we provide project
 *  for rebuilding library with relative ease.  Likewise, many
 *  developers are more comfortable with the GNU Make utility.  As such, we also
 *  provide Makefiles to re-build the @PACKAGE library.
 *
 * @SPACER
 *
 * @section ccs_howto  Code Composer Studio
 *  @SECSTART 
 *  This release of @PACKAGE provides Code Composer Studio (CCS) Version 5 project 
 *  to re-build library.  This project is located in the @c @b packages/ti/@package/lib folder. 
 *
 *  Follow the instructions at @ref ccs_build for more details.
 *  @SECEND
 *  
 * @section gnu_howto  GNU Makefile
 *  @SECSTART 
 *  A GNU @b makefile is provided for rebuilding @PACKAGE via the GNU make utility.  
 *  This file is located in the @c @b packages/ti/@package folder. The makefile provides 
 *  a list of all tools, common build utilities and build rules required for re-building @PACKAGE binary. 
 *
 *  Follow the instructions at @ref gnu_build for more details.
 *  @SECEND
 *  
 */

/** 
 * @page ccs_build  CCS Build Process
 * 
 * <table @NSTYLE><tr><td><a @ASTYLE href="building.html">Back</a></td></tr></table>
 *
 *  To build any specific kernel for test, benchmarking or to pull in source code changes -
 *  just locate the associated project file, load it and run within the CCS environment.
 *  The sections below provide all necessary details to get started.
 *  
 *    -# Required Tools
 *    -# Re-build @PACKAGE Library
 *    -# Build Individual @PACKAGE Kernel
 *
 *  The sections that follow detail each item above.
 *
 * @SPACER
 *
 * @section ccs_tools  Required Tools
 *  @SECSTART 
 *  The following tools are required to build @PACKAGE using CCS (links provided).
 *  Download and install all tools to a single local (@c @b C:) directory, 
 *  for example, <tt><b>c:\\ti</b></tt>.
 *
 *  - <a target=_blank href="https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm">Code Generation Tools</a>
 *  - <a target=_blank href="http://processors.wiki.ti.com/index.php/Download_CCS">Code Composer Studio</a>
 *
 *  @note  A "My.TI" account is required for download and can be registered at <a target=_blank href="http://my.ti.com">my.ti.com</a>
 *  @SECEND
 *
 * @section ccs_compile_all  @PACKAGE Build Procedure 
 *  @SECSTART
 *  
 * The @PACKAGE package supports CCSV5.2 & above. The @PACKAGE may be build following the procedure below:
 *
 *   -# Open the CCSv5 application
 *   -# Import the @PACKAGE @b makefile based project 
 *     - Open the @b Project menu
 *     - Select <b>Import Existing Eclipse Project</b>
 *     - Import from the @PACKAGE @c @b packages/ti/@package/lib directory
 *   -# Build the project
 *     - Select <b>Rebuild Active Project</b> from @b Project menu 
 *  
 *  @SECEND
 *
 * @section ccs_compile_knl  Individual Kernel Build Procedure 
 *  @SECSTART 
 *  Any individual kernel within @PACKAGE may be compiled and tested via CCS following 
 *  the procedure below:
 *
 *   -# Open the CCSV5 application
 *   -# Import the @PACKAGE kernel project 
 *     - Open the @b Project menu
 *     - Select <b>Import Existing Eclipse Project</b>
 *     - Import from the @PACKAGE @c @b /packages/ti/@package/src/\<kernel\> directory
 *   -# Use the @b Debug/Release profile for debugging/modifing/optimizing kernels
 *     - Open the @b Project menu
 *     - Select <b>Active Build Configuration</b> and set to @b Debug/Release
 *   -# Build and test the project
 *     - Select <b>Rebuild Active Project</b> from @b Project menu 
 *     - Test using the proper target configuration
 *
 *  @SECEND
 *  
 */


/** 
 * @page gnu_build  GNU Make Build Process
 * 
 * <table @NSTYLE><tr><td><a @ASTYLE href="building.html">Back</a></td></tr></table>
 *
 *  A GNU @b makefile is also provided for rebuilding @PACKAGE via the GNU make utility.  
 *  This file is located in the @c @b packages/ti/@package folder. The makefile provides 
 *  a list of all tools, common build utilities and build rules required for generating 
 *  @PACKAGE binary. 
 *
 *  -# Required Tools
 *  -# Re-build @PACKAGE Library
 *
 *  The sections that follow detail each item above.
 *
 * @SPACER
 *
 * @section gnu_tools  Required Tools
 *  @SECSTART 
 *  The following tools are required to build @PACKAGE using GNU make (links provided).
 *  Download and install all tools to a single local (@c @b C:) directory, 
 *  for example, <tt><b>c:\\ti</b></tt>.
 *
 *  - <a target=_blank href="https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm">Code Generation Tools</a>
 *  - GNU Make (External Tool)
 *
 *  @note  A "My.TI" account is required for download and can be registered at <a target=_blank href="http://my.ti.com">my.ti.com</a>
 *  @SECEND
 * 
 * 
 * @section gnu_compile_all  @PACKAGE Build Procedure 
 *  @SECSTART 
 *  The @PACKAGE may be compiled using GNU make following the procedure below.  
 *  Note that the first three items are followed by two options, either of which 
 *  may be used to accomplish the goal.
 *
 *   -# Add @b cygwin/bin to the environment PATH (Windows only)
 *   -# Correct the @b C6x_GEN_INSTALL_DIR path in the @b makefile (two options)
 *     - Directly modify the makefile  OR
 *     - Set the @b C6x_GEN_INSTALL_DIR in the environment with the proper tools path  
 *   -# Build the library
 *     - Enter <b><tt>make all</tt></b> to build the library 
 *     - Enter <b><tt>make clean</tt></b> to clean all generated object files and artifacts
 *  @SECEND
 *
 */


