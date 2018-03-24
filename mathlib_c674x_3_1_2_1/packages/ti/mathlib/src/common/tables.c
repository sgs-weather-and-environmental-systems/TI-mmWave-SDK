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

/* ======================================================================= */
/* tables.c - Tables used in SP and DP floating point routines             */
/* ======================================================================= */

/* Log table */
double ti_math_logtable[8] = {
   0.0000000000,             
  -0.1177830356,             
  -0.2231435513,             
  -0.3184537311,             
  -0.4054651081,             
  -0.4855078157,             
  -0.5596157879,             
  -0.6286086594              
};

/* ti_math_kTable */
double ti_math_kTable[4] = {
  1.000000000,              /* 2^(0/4) */
  1.189207115,              /* 2^(1/4) */
  1.414213562,              /* 2^(2/4) */
  1.681792831               /* 2^(3/4) */
};                          
                            
/* ti_math_jTable */                
double ti_math_jTable[4] = {        
  1.000000000,              /* 2^(0/16) */ 
  1.044273782,              /* 2^(1/16) */ 
  1.090507733,              /* 2^(2/16) */ 
  1.138788635               /* 2^(3/16) */ 
}; 

double ti_math_vTable[4] = { 
  0.00000000000000000000,   
  0.52359877559829887308,   
  1.57079632679489661923,   
  1.04719755119659774615    
};

/* ======================================================================== */
/*  End of file: tables.c                                                   */
/* ======================================================================== */
