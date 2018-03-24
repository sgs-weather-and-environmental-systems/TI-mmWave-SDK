/*****************************************************************************/
/* COMPILER.H v16.9.6                                                        */
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
#ifndef _COMPILER_H_
#define _COMPILER_H_

/*****************************************************************************/
/* AUTOSAR Release: 3.1                                                      */
/*****************************************************************************/

#include <Compiler_Cfg.h>

#define _TEXAS_INSTRUMENTS_C_TMS470_
#define _TEXAS_INSTRUMENTS_C_ARM_

#define COMPILER_MAJOR_VERSION __TI_COMPILER_MAJOR_VERSION__
#define COMPILER_MINOR_VERSION __TI_COMPILER_MINOR_VERSION__
#define COMPILER_PATCH_VERSION __TI_COMPILER_PATCH_VERSION__

/*****************************************************************************/
/* Define:       AUTOMATIC                                                   */
/* Description:  Used for the declaration of local pointers                  */
/*****************************************************************************/
#define AUTOMATIC

/*****************************************************************************/
/* Define:       TYPEDEF                                                     */
/* Description:  The memory class shall be used within type definitions,     */
/*               where no memory qualifier can be specified                  */
/*****************************************************************************/
#define TYPEDEF

/*****************************************************************************/
/* Define:       STATIC                                                      */
/* Description:  Abstraction of the keyword static                           */
/*****************************************************************************/
#define STATIC static

/*****************************************************************************/
/* Define:       NULL_PTR                                                    */
/* Description:  Void pointer to 0                                           */
/*****************************************************************************/
#define NULL_PTR ((void *)0x0)

/*****************************************************************************/
/* Define:       INLINE                                                      */
/* Description:  Abstraction of the keyword inline                           */
/*****************************************************************************/
#define INLINE __inline

/*****************************************************************************/
/* Define:       LOCAL_INLINE                                                */
/* Description:  Abstraction of keyword inline with static scope.            */
/*****************************************************************************/
#define LOCAL_INLINE static __inline

/*****************************************************************************/
/* Macro name: FUNC                                                          */
/* Parameters: rettype     return type of the function                       */
/*             memclass    classification of the function itself             */
/*****************************************************************************/
#define FUNC(rettype, memclass) rettype

/*****************************************************************************/
/* Macro name: P2VAR                                                         */
/* Parameters: ptrtype     type of the referenced variable                   */
/*             memclass    classification of the pointer's variable itself   */
/*             ptrclass    defines the classification of the pointer's       */
/*                         distance                                          */
/*****************************************************************************/
#define P2VAR(ptrtype, memclass, ptrclass) ptrtype *

/*****************************************************************************/
/* Macro name: P2CONST                                                       */
/* Parameters: ptrtype     type of the referenced constant                   */
/*             memclass    classification of the pointer's varaible itself   */
/*             ptrclass    defines the classification of the pointer's       */
/*                         distance                                          */
/*****************************************************************************/
#define P2CONST(ptrtype, memclass, ptrclass) const ptrtype *

/*****************************************************************************/
/* Macro name: CONSTP2VAR                                                    */
/* Parameters: ptrtype     type of the referenced variable                   */
/*             memclass    classification of the pointer's constant itself   */
/*             ptrclass    defines the classification of the pointer's       */
/*                         distance                                          */
/*****************************************************************************/
#define CONSTP2VAR(ptrtype, memclass, ptrclass) ptrtype * const

/*****************************************************************************/
/* Macro name: CONSTP2CONST                                                  */
/* Parameters: ptrtype     type of the referenced constant                   */
/*             memclass    classification of the pointer's constant itself   */
/*             ptrclass    defines the classification of the pointer's       */
/*                         distance                                          */
/*****************************************************************************/
#define CONSTP2CONST(ptrtype, memclass, ptrclass) const ptrtype * const

/*****************************************************************************/
/* Macro name: P2FUNC                                                        */
/* Parameters: rettype     return type of the function                       */
/*             ptrclass    defines the classification of the pointer's       */
/*                         distance                                          */
/*             fctname     function name respectively name of the defined    */
/*                         type                                              */
/*****************************************************************************/
#define P2FUNC(rettype, ptrclass, fctname) rettype (*fctname)

/*****************************************************************************/
/* Macro name: CONST                                                         */
/* Parameters: consttype   type of the constant                              */
/*             memclass    classification of the constant itself             */
/*****************************************************************************/
#define CONST(consttype, memclass) const consttype

/*****************************************************************************/
/* Macro name: VAR                                                           */
/* Parameters: vartype     type of the variable                              */
/*             memclass    classification of the variable itself             */
/*****************************************************************************/
#define VAR(vartype, memclass) vartype


#endif /* _COMPILER_H_ */
