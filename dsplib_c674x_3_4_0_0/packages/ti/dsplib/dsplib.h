/* ======================================================================= */
/* dsplib.h --  Interface header file                 */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/* Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/  */
/*                                                                         */
/*                                                                         */
/*  Redistribution and use in source and binary forms, with or without     */
/*  modification, are permitted provided that the following conditions     */
/*  are met:                                                               */
/*                                                                         */
/*    Redistributions of source code must retain the above copyright       */
/*    notice, this list of conditions and the following disclaimer.        */
/*                                                                         */
/*    Redistributions in binary form must reproduce the above copyright    */
/*    notice, this list of conditions and the following disclaimer in the  */
/*    documentation and/or other materials provided with the               */
/*    distribution.                                                        */
/*                                                                         */
/*    Neither the name of Texas Instruments Incorporated nor the names of  */
/*    its contributors may be used to endorse or promote products derived  */
/*    from this software without specific prior written permission.        */
/*                                                                         */
/*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    */
/*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,  */
/*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  */
/*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   */
/*                                                                         */
/* ======================================================================= */
#include <ti/dsplib/src/DSPF_blk_eswap16/DSPF_blk_eswap16.h>
#include <ti/dsplib/src/DSPF_blk_eswap32/DSPF_blk_eswap32.h>
#include <ti/dsplib/src/DSPF_blk_eswap64/DSPF_blk_eswap64.h>
#include <ti/dsplib/src/DSPF_fltoq15/DSPF_fltoq15.h>
#include <ti/dsplib/src/DSPF_q15tofl/DSPF_q15tofl.h>
#include <ti/dsplib/src/DSPF_sp_autocor/DSPF_sp_autocor.h>
#include <ti/dsplib/src/DSPF_sp_biquad/DSPF_sp_biquad.h>
#include <ti/dsplib/src/DSPF_sp_bitrev_cplx/DSPF_sp_bitrev_cplx.h>
#include <ti/dsplib/src/DSPF_sp_blk_move/DSPF_sp_blk_move.h>
#include <ti/dsplib/src/DSPF_sp_cfftr2_dit/DSPF_sp_cfftr2_dit.h>
#include <ti/dsplib/src/DSPF_sp_cfftr4_dif/DSPF_sp_cfftr4_dif.h>
#include <ti/dsplib/src/DSPF_sp_convol/DSPF_sp_convol.h>
#include <ti/dsplib/src/DSPF_sp_dotprod/DSPF_sp_dotprod.h>
#include <ti/dsplib/src/DSPF_sp_dotp_cplx/DSPF_sp_dotp_cplx.h>
#include <ti/dsplib/src/DSPF_sp_fftSPxSP/DSPF_sp_fftSPxSP.h>
#include <ti/dsplib/src/DSPF_sp_fircirc/DSPF_sp_fircirc.h>
#include <ti/dsplib/src/DSPF_sp_fir_cplx/DSPF_sp_fir_cplx.h>
#include <ti/dsplib/src/DSPF_sp_fir_gen/DSPF_sp_fir_gen.h>
#include <ti/dsplib/src/DSPF_sp_fir_r2/DSPF_sp_fir_r2.h>
#include <ti/dsplib/src/DSPF_sp_icfftr2_dif/DSPF_sp_icfftr2_dif.h>
#include <ti/dsplib/src/DSPF_sp_ifftSPxSP/DSPF_sp_ifftSPxSP.h>
#include <ti/dsplib/src/DSPF_sp_iirlat/DSPF_sp_iirlat.h>
#include <ti/dsplib/src/DSPF_sp_iir/DSPF_sp_iir.h>
#include <ti/dsplib/src/DSPF_sp_lms/DSPF_sp_lms.h>
#include <ti/dsplib/src/DSPF_sp_mat_mul/DSPF_sp_mat_mul.h>
#include <ti/dsplib/src/DSPF_sp_mat_mul_cplx/DSPF_sp_mat_mul_cplx.h>
#include <ti/dsplib/src/DSPF_sp_mat_mul_gemm/DSPF_sp_mat_mul_gemm.h>
#include <ti/dsplib/src/DSPF_sp_mat_mul_gemm_cplx/DSPF_sp_mat_mul_gemm_cplx.h>
#include <ti/dsplib/src/DSPF_sp_mat_trans/DSPF_sp_mat_trans.h>
#include <ti/dsplib/src/DSPF_sp_maxidx/DSPF_sp_maxidx.h>
#include <ti/dsplib/src/DSPF_sp_maxval/DSPF_sp_maxval.h>
#include <ti/dsplib/src/DSPF_sp_minerr/DSPF_sp_minerr.h>
#include <ti/dsplib/src/DSPF_sp_minval/DSPF_sp_minval.h>
#include <ti/dsplib/src/DSPF_sp_vecmul/DSPF_sp_vecmul.h>
#include <ti/dsplib/src/DSPF_sp_vecrecip/DSPF_sp_vecrecip.h>
#include <ti/dsplib/src/DSPF_sp_vecsum_sq/DSPF_sp_vecsum_sq.h>
#include <ti/dsplib/src/DSPF_sp_w_vec/DSPF_sp_w_vec.h>
#include <ti/dsplib/src/DSP_fir_r8_h16/DSP_fir_r8_h16.h>
#include <ti/dsplib/src/DSP_fir_r8_h24/DSP_fir_r8_h24.h>
#include <ti/dsplib/src/DSP_fir_r8_h8/DSP_fir_r8_h8.h>
