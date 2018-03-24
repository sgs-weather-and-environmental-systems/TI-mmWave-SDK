/*****************************************************************************/
/* COMPILER_CFG.H v16.9.6                                                    */
/*                                                                           */
/* Copyright (c) 2008-2017 Texas Instruments Incorporated                    */
/* http://www.ti.com/                                                        */
/*                                                                           */
/*  Redistribution and  use in source  and binary forms, with  or without    */
/*  modification,  are permitted provided  that the  following conditions    */
/*  are met:                                                                 */
/*                                                                           */
/*     Redistributions  of source  code must  retain the  above copyright    */
/*     notice, this list of conditions and the following disclaimer.         */
/*                                                                           */
/*     Redistributions in binary form  must reproduce the above copyright    */
/*     notice, this  list of conditions  and the following  disclaimer in    */
/*     the  documentation  and/or   other  materials  provided  with  the    */
/*     distribution.                                                         */
/*                                                                           */
/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
/*     of its  contributors may  be used to  endorse or  promote products    */
/*     derived  from   this  software  without   specific  prior  written    */
/*     permission.                                                           */
/*                                                                           */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
/*                                                                           */
/*****************************************************************************/
#ifndef _COMPILER_CFG_H_
#define _COMPILER_CFG_H_

/*****************************************************************************/
/* This is an empty header file which should be replaced by the end user.    */
/*                                                                           */
/* According to the AUTOSAR document "Specification of Compiler Abstraction" */
/* version 2.0.1, as part of AUTOSAR release 3.1, COMPILER55:                */
/*   The file Compiler_Cfg.h shall contain the module specific parameters    */
/*   (ptrclass and memclass) that are passed to the macros defined in        */
/*   Compiler.h.                                                             */
/*                                                                           */
/* The following is the form of these macro definitions.  MSN stands for     */
/* "Module Short Name of BSW module list"                                    */
/*                                                                           */
/* #define <MSN>_CODE                                                        */
/* #define <MSN>_CONST                                                       */
/* #define <MSN>_APPL_DATA                                                   */
/* #define <MSN>_APPL_CONST                                                  */
/* #define <MSN>_APPL_CODE                                                   */
/* #define <MSN>_VAR_NOINIT                                                  */
/* #define <MSN>_VAR_POWER_ON_INIT                                           */
/* #define <MSN>_VAR_FAST                                                    */
/* #define <MSN>_VAR                                                         */
/*                                                                           */
/* NOTE: On 32 bit architectures these definitions are required to be empty  */
/*****************************************************************************/

#endif /* _COMPILER_CFG_H_ */
