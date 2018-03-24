/* ======================================================================== *
 * MATHLIB -- TI Floating-Point Math Function Library                       *
 *                                                                          *
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
 * @mainpage  @PACKAGE User's Manual (@TARGETX)
 *
 * @HLINE
 *
 * @section content  Contents
 *  
 *  <ol>
 *    <li> @ref intro
 *    <li> @ref getstart
 *    <li> @ref examples
 *    <li> @ref integrate
 * @if C66 <li> @ref misra @endif
 *  </ol>
 *
 *
 * @HLINE
 *
 *
 * @section intro  Introduction to @PACKAGE
 *
 *  The Texas Instruments @PACKAGE library is an optimized floating-point math 
 *  function library for C programmers using TI floating point devices.  These 
 *  routines are typically used in computationally intensive real-time applications 
 *  where optimal execution speed is critical. By using these routines instead of 
 *  the routines found in the existing run-time-support libraries, you can achieve 
 *  execution speeds considerably faster without rewriting existing code. The
 *  @PACKAGE library includes all floating-point math routines currently provided 
 *  in existing run-time-support libraries. These new functions can be called with 
 *  the current run-time-support library names or the new names included in the 
 *  @PACKAGE library.
 * 
 *
 * @subsection features  Features and Benefits
 *  The TI @TARGETX @PACKAGE contains commonly used floating point math routines, 
 *  as well as source code that allows you to modify functions to match your 
 *  specific needs.
 *
 *  - ANSI C source code models
 *  - C-callable routines fully compatible with the TI C6000 compiler
 *  - Host library to enable PC based development and testing
 *  - CCS v5 projects to rebuild library or individual routines unit test.
 *  - Benchmarks (cycles)
 *  - Tested against reference C model
 *  - Unit-test for each routines.
 * @if C66 - MISRA compliant c66x implementation @endif
 *
 * 
 * @subsection routines  Software Routines
 *  The rich set of software routines included in @PACKAGE are organized into 
 *  two categories:
 *  
 *    -# Single precision floating point
 *    -# Double precision floating point
 *
 *  For detailed descriptions of each @PACKAGE function see the <a href="@PKGMANLINK">@PACKAGE Function Reference</a>.
 *
 * @HLINE
 * 
 *
 * @section getstart  Getting Started
 *
 *  Unless otherwise specified, the @PACKAGE package installs under
 *  <tt>C:\\ti\\</tt> in directory <tt> @PKGDIR</tt>.  
 *  The directory structure of the installed package will look similar to that 
 *  displayed below in Figure 1, though the release notes will match the installation
 *  version.  
 *  
 *  <table rules="none" frame="void" cellspacing="0" cellpadding="0">
 * @if C66 
 *    <tr><td>
 *      @image html mathlib_c66_directory.jpg "Figure 1. @TARGETX @PACKAGE Directory Structure"
 *    </td></tr>
 * @elseif C674
 *    <tr><td>
 *      @image html mathlib_c674_directory.jpg "Figure 1. @TARGETX @PACKAGE Directory Structure"
 *    </td></tr>
 * @else
 *    <tr><td>
 *      <b>ERROR:  UNRECOGNIZED TARGET</b>
 *    </td></tr>
 * @endif
 *  </table> 
 *
 *
 *  The files that comprise the @PACKAGE installation can be categorized into the 
 *  following five categories:
 *
 *    -# Documentation
 *    -# Component Repository
 *    -# Kernel Source
 *    -# Eclipse Support
 *    -# Internal Meta Data
 *
 *
 * @subsection documents  Documentation
 *  Installation places all @PACKAGE documentation in a @c @b Docs directory in the 
 *  @PACKAGE root.  The following documentation comes with the delivery:
 *
 *    - @PKGRELNOTES
 *    - docs/@PKGMANCHM
 *    - docs/@PKGMANHTML
 *    - docs/@PKGSWMFEST @if C66
 *    - docs/@MISRADOC   @endif
 *  
 *  @note Files and paths are relative to the @PACKAGE root installation directory
 *
 *
 * @subsection repository  Component Repository
 *  The installation creates a @c @b Components directory in the @PACKAGE root
 *  folder.  This directory serves as a repository for all packages included
 *  in the @PACKAGE installation.  Each package in this repository is compressed.
 *
 *
 * @subsection kernelsrc  Kernel Source 
 *  The installation also creates a @c @b Packages directory in the @PACKAGE root
 *  folder.  This directory holds all kernels contained within the @PACKAGE 
 *  library.  This directory follows the standard TI directory structure.  As an 
 *  example, the files that comprise the @PACKAGE kernel @c @b @KERNELEX will be 
 *  located, relative to the @PACKAGE root installation directory, at
 *  <tt>packages/ti/@package/src/@KERNELEX/</tt>.  
 *
 *  Each Kernel is delivered with a pre-compiled CCSv5 project that illustrates 
 *  the kernel API and performs several validation tests.  Each project provides
 *  an estimate of kernel cycle and program memory requirements.
 *
 *
 * @subsection eclipsedir  Eclipse Support
 *  The @c @b Eclipse directory contains all files required for @PACKAGE to be 
 *  recognized by Eclipse (CCS Version 4) as a plug-in.  This is a support
 *  directory and can be safely ignored.
 *
 * 
 * @subsection metadata  Internal Meta Data
 *  The @PACKAGE installation creates a @c @b Package directory.  This directory 
 *  contains meta information required by the TI packaging tools.  This is a 
 *  support directory and can be safely ignored.  
 *
 *
 * @HLINE
 * 
 *
 * @section examples  @PACKAGE Usage Examples 
 *
 *  The examples folder will provide example applications that employ @PACKAGE to 
 *  achieve higher-level mathematical functions.  
 *
 *
 * @HLINE
 * 
 *
 * @section integrate  Integration
 *
 *  Since @PACKAGE is a collection of individual kernels, any combination of the 
 *  kernels that comprise @PACKAGE may be integrated into a system individually.
 *  Integration, for single or multiple kernels, requires four simple steps:
 *
 *    -# Compile @PACKAGE for @TARGETX (optional)
 *    -# Add API calls within system code 
 *    -# Compile system code
 *    -# Link @PACKAGE 
 *
 *  The sections that follow provide details regarding the above four steps.
 *
 *  
 *  @subsection compile  Compile @PACKAGE for @TARGETX (optional)
 *  On installation, the @PACKAGE libraries are built and ready to link.  Therefore,
 *  this step is only required when the original kernel source code has been refined 
 *  or contributions have been added.  See @ref buildprocess for details regarding 
 *  re-building @PACKAGE .
 *   
 *   
 *  @subsection kernelcalls  Add @PACKAGE API Calls
 *  Add calls to @PACKAGE kernels within the system source code as necessary.
 *  Any system source file that contains calls to an @PACKAGE kernel will require 
 *  that the @PACKAGE header file <tt> @PKGHEADER </tt> is included.  See the 
 *  <a href="@PKGMANLINK">@PACKAGE Function Reference</a> for details on individual 
 *  kernel APIs.
 *
 *
 *  @subsection syscompile  System Compilation
 *  To re-compile the system code, the path to the <tt>packages</tt> directory will 
 *  need to be added to the compiler's include path search list.  This path will
 *  depend on the @PACKAGE root installation directory.  This allows the main 
 *  @PACKAGE header file to be moved from within the installation directory and 
 *  still recognize the individual kernel headers.
 *
 *
 *  @subsection linking  Linking @PACKAGE
 *  The path to the @PACKAGE libraries must be provided to the linker via: <br>
 *  -l <MATHLIB_INSTALL_DIR>/packages/ti/mathlib/lib/mathlib.lib
 *
 * @if C66 
 *   @HLINE
 *   @section misra  MISRA Compliance
 *    The c66x release complies with MISRA standards as detailed in docs/@MISRADOC
 * @endif
 *
 */


/**
 * @page buildprocess  @PACKAGE Build Process
 *  
 * @HLINE
 *
 * @section content  Page Contents
 *  
 *  <ul>
 *    <li> @ref ccs_build
 *    <li> @ref gnu_build
 *  </ul>
 *  
 * @HLINE
 *
 *
 * @section ccs_build  CCS Build Process
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
 * @subsection ccs_tools  Required Tools
 *
 *  The following tools are required to build @PACKAGE using CCS (links provided).
 *  Download and install all tools to a single local (@c @b C:) directory, 
 *  for example, <tt><b>c:\\ti</b></tt>.
 *
 *  - <a target=_blank href="https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm">Code Generation Tools</a>
 *  - <a target=_blank href="http://processors.wiki.ti.com/index.php/Download_CCS">Code Composer Studio</a>
@ *
 *  @note  A "My.TI" account is required for download and can be registered at <a target=_blank href="http://my.ti.com">my.ti.com</a>
 * 
 *
 * @subsection ccs_compilepkg  Procedure for @PACKAGE
 *
 *  The @PACKAGE supports CCSV5.2 & above. The @PACKAGE may be built following the procedure below:
 *
 *   -# Open the CCSv5 application
 *   -# Import the @PACKAGE @b makefile based project 
 *     - Open the @b Project menu
 *     - Select <b>Import Existing Eclipse Project</b>
 *     - Import from the @PACKAGE @c @b packages/ti/@package/lib directory
 *   -# Build the project
 *     - Select <b>Rebuild Active Project</b> from @b Project menu 
 *
 * @subsection ccs_compileknl  Procedure for Individual Kernels 
 *
 *  Any individual kernel within @PACKAGE may be tested via CCS following 
 *  the procedure below:
 *
 *   -# Open the CCSv5 application
 *   -# Import the @PACKAGE kernel unit test project 
 *     - Open the @b Project menu
 *     - Select <b>Import Existing Eclipse Project</b>
 *     - Import from the @PACKAGE @c @b /packages/ti/@package/src/\<kernel\> directory
 *   -# Use the @b Debug profile for debugging kernel unit tests
 *     - Open the @b Project menu
 *     - Select <b>Active Build Configuration</b> and set to @b Debug/Release
 *   -# Build and test the project
 *     - Select <b>Rebuild Active Project</b> from @b Project menu 
 *     - Test using the proper target configuration
 *  
 * @HLINE
 *
 *
 * @section gnu_build  Makefile Build Process
 *
 *  A GNU @b makefile is also provided for rebuilding @PACKAGE via GNU make utility. This file 
 *  is located in the @c @b packages/ti/@package folder. The makefile provides a list 
 *  of all tools, common build utilities and build rules required for generating 
 *  @PACKAGE binary. 
 * 
 *
 * @subsection gnu_tools  Required Tools
 *
 *  The following tools are required to build @PACKAGE using GNU make (links provided).
 *  Download and install all tools to a single local (@c @b C:) directory, 
 *  for example, <tt><b>c:\\ti</b></tt>.
 *
 *  - <a target=_blank href="https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm">Code Generation Tools</a>
 *  - GNU Make (External Tool)
 *
 *  @note  A "My.TI" account is required for download and can be registered at <a target=_blank href="http://my.ti.com">my.ti.com</a>
 * 
 * 
 * @subsection gnu_compilepkg  Procedure for @PACKAGE
 *
 *  The @PACKAGE may be built using GNU make following the procedure below:
 *
 *   -# Add @b cygwin/bin to the environment PATH (Windows only)
 *   -# Correct the @b C6x_GEN_INSTALL_DIR path in the @b makefile (two options)
 *     - Directly modify the makefile OR
 *     - Set the @b C6x_GEN_INSTALL_DIR in the environment with the proper tools path  
 *   -# Build the library
 *     - Enter <b><tt>make all</tt></b> to build the library
 *     - Enter <b><tt>make clean</tt></b> to clean all generated object files and artifacts
 *  
 *
 */



