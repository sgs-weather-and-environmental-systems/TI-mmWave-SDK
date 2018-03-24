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
#include <ti/dsplib/src/DSP_add16/DSP_add16.h>
#include <ti/dsplib/src/DSP_add32/DSP_add32.h>
#include <ti/dsplib/src/DSP_autocor/DSP_autocor.h>
#include <ti/dsplib/src/DSP_bexp/DSP_bexp.h>
#include <ti/dsplib/src/DSP_blk_eswap16/DSP_blk_eswap16.h>
#include <ti/dsplib/src/DSP_blk_eswap32/DSP_blk_eswap32.h>
#include <ti/dsplib/src/DSP_blk_eswap64/DSP_blk_eswap64.h>
#include <ti/dsplib/src/DSP_blk_move/DSP_blk_move.h>
#include <ti/dsplib/src/DSP_dotprod/DSP_dotprod.h>
#include <ti/dsplib/src/DSP_dotp_sqr/DSP_dotp_sqr.h>
#include <ti/dsplib/src/DSP_fft16x16r/DSP_fft16x16r.h>
#include <ti/dsplib/src/DSP_fft16x16/DSP_fft16x16.h>
#include <ti/dsplib/src/DSP_fft16x16_imre/DSP_fft16x16_imre.h>
#include <ti/dsplib/src/DSP_fft16x32/DSP_fft16x32.h>
#include <ti/dsplib/src/DSP_fft32x32s/DSP_fft32x32s.h>
#include <ti/dsplib/src/DSP_fft32x32/DSP_fft32x32.h>
#include <ti/dsplib/src/DSP_firlms2/DSP_firlms2.h>
#include <ti/dsplib/src/DSP_fir_cplx/DSP_fir_cplx.h>
#include <ti/dsplib/src/DSP_fir_cplx_hM4X4/DSP_fir_cplx_hM4X4.h>
#include <ti/dsplib/src/DSP_fir_gen/DSP_fir_gen.h>
#include <ti/dsplib/src/DSP_fir_gen_hM17_rA8X8/DSP_fir_gen_hM17_rA8X8.h>
#include <ti/dsplib/src/DSP_fir_r4/DSP_fir_r4.h>
#include <ti/dsplib/src/DSP_fir_r8/DSP_fir_r8.h>
#include <ti/dsplib/src/DSP_fir_r8_hM16_rM8A8X8/DSP_fir_r8_hM16_rM8A8X8.h>
#include <ti/dsplib/src/DSP_fir_sym/DSP_fir_sym.h>
#include <ti/dsplib/src/DSP_fltoq15/DSP_fltoq15.h>
#include <ti/dsplib/src/DSP_ifft16x16/DSP_ifft16x16.h>
#include <ti/dsplib/src/DSP_ifft16x16_imre/DSP_ifft16x16_imre.h>
#include <ti/dsplib/src/DSP_ifft16x32/DSP_ifft16x32.h>
#include <ti/dsplib/src/DSP_ifft32x32/DSP_ifft32x32.h>
#include <ti/dsplib/src/DSP_iir/DSP_iir.h>
#include <ti/dsplib/src/DSP_iir_lat/DSP_iir_lat.h>
#include <ti/dsplib/src/DSP_iir_ss/DSP_iir_ss.h>
#include <ti/dsplib/src/DSP_mat_mul/DSP_mat_mul.h>
#include <ti/dsplib/src/DSP_mat_mul_cplx/DSP_mat_mul_cplx.h>
#include <ti/dsplib/src/DSP_mat_trans/DSP_mat_trans.h>
#include <ti/dsplib/src/DSP_maxidx/DSP_maxidx.h>
#include <ti/dsplib/src/DSP_maxval/DSP_maxval.h>
#include <ti/dsplib/src/DSP_minerror/DSP_minerror.h>
#include <ti/dsplib/src/DSP_minval/DSP_minval.h>
#include <ti/dsplib/src/DSP_mul32/DSP_mul32.h>
#include <ti/dsplib/src/DSP_neg32/DSP_neg32.h>
#include <ti/dsplib/src/DSP_q15tofl/DSP_q15tofl.h>
#include <ti/dsplib/src/DSP_recip16/DSP_recip16.h>
#include <ti/dsplib/src/DSP_vecsumsq/DSP_vecsumsq.h>
#include <ti/dsplib/src/DSP_w_vec/DSP_w_vec.h>
