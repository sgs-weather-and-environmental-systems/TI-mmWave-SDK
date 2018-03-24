/****************************************************************************/
/*  numconst.h       v8.1.3                                                 */
/*                                                                          */
/* Copyright (c) 1997-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/

#ifndef __numconst__
#define __numconst__


#define ZERO      CNST(0.0)
#define SIXTEENTH CNST(0.0625)
#define EIGHTH    CNST(0.125)
#define TENTH     CNST(0.1)
#define QUARTER   CNST(0.25)
#define THIRD     CNST(0.3333333333333333333333333333333333333333333333333)
#define HALF      CNST(0.5)
#define ONE       CNST(1.0)
#define TWO       CNST(2.0)
#define THREE     CNST(3.0)
#define FOUR      CNST(4.0)
#define SIX       CNST(6.0)
#define TEN       CNST(10.0)
#define SIXTEEN   CNST(16.0)

#define M_ONE     CNST(-1.0)
#define M_TWO     CNST(-2.0)


#define Pi          CNST(3.14159265358979323846264338327950288419716939937510)
#define Two_Pi      (MPYF(Pi,TWO))
#define One_Over_Pi CNST(0.31830988618379067153776752674502872406891929148091)
#define Two_Over_Pi (MPYF(TWO,One_Over_Pi))

#define Pi_Over_Two   (MPYF(Pi,HALF))
#define Pi_Over_Three (DIVF(Pi,CNST(3.0)))
#define Pi_Over_Four  (MPYF(Pi,CNST(0.25)))
#define Pi_Over_Six   (MPYF(Pi_Over_Three,HALF))

#define Pi_Squared   CNST(9.86960440108935861883449099987615113531369940724079)
#define Ln_Pi        CNST(1.14472988584940017414342735135305871164729481291531)
#define Log_Pi       CNST(0.49714987269413385435126828829089887365167832438044)
#define Log_Sqrt_Two_Pi CNST(0.39908993417905752478250359150769595020993410292127)


#define Naperian_e CNST(2.71828182845904523536028747135266249775724709369995)
#define One_Over_e CNST(0.36787944117144232159552377016146086744581113103176)

#define e_Squared CNST(7.38905609893065022723042746057500781318031557055184)

#define Ln_10 CNST(2.30258509299404568401799145468436420760110148862877)
#define One_Over_Log_e Ln_10

#define One_Over_Ln_10 CNST(0.43429448190325182765112891891660508229439700580366)
#define Log_e One_Over_Ln_10


#define Pi_To_e            CNST(22.4591577183610454734271522) 
#define e_To_Pi            CNST(23.1406926327792690057290864)
#define e_To_Minus_Pi      CNST( 0.0432139182637722497744177)
#define e_To_Hlf_Pi        CNST( 4.8104773809653516554730357)
#define e_To_Minus_Hlf_Pi  CNST( 0.2078795763507619085469556)


#define Sqrt_2       CNST(1.41421356237309504880168872420969807856967187537694)
#define Cube_Root_2  CNST(1.25992104989487316476721060727822835057025146470150)
#define One_Over_Sqrt_2 CNST(0.70710678118654752440)
#define Ln_2         CNST(0.69314718055994530941723212145817656807550013436025)
#define One_Over_Ln_2 CNST(1.44269504088896340735)
#define Log_2        CNST(0.30102999566398119521373889472449302676818988146210)
#define Sqrt_3       CNST(1.73205080756887729352744634150587236694280525381038)

#define Cube_Root_3  CNST(1.44224957030740838232163831078010958839186925349935)
#define Ln_3         CNST(1.09861228866810969139524523692252570464749055782274)
#define Log_3        CNST(0.47712125471966243729502790325511530920012886419069)


#define Gamma     CNST( 0.57721566490153286061) /* Euler's Constant */
#define Ln_Gamma  CNST(-0.54953931298164482234)

#define Phi CNST(1.618033988749894848204586834365638117720309180) /* Gold Ratio*/

#endif /* __numconst__*/
