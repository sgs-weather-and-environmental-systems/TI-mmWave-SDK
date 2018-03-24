/*
 * (C) Copyright 2017, Texas Instruments Incorporated -  http://www.ti.com/
 *-------------------------------------------------------------------------
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are
 *  met:
 *
 *    Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 *  IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 *  TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 *  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT,  STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/**
 *   @file     mmwavelib_fft.h
 *
 *   @brief    Header file for FFT utility routines
 */

#ifndef MMWAVELIB_FFT_H
#define MMWAVELIB_FFT_H 1

#include <stdint.h>
#include <c6x.h>

void mmwavelib_windowing16x32(const int16_t inp[restrict],
                              const int32_t win[restrict],
                              int32_t out[restrict], uint32_t len);
void mmwavelib_windowing16x16(int16_t inp[restrict],
                              const int16_t win[restrict], uint32_t len);

void mmwavelib_windowing16x16_evenlen(int16_t inp[restrict],
                                      const int16_t win[restrict],
                                      uint32_t len);

void mmwavelib_fft16ptZeroPadded32x32(const int32_t * restrict inp,
                                      const int32_t * restrict twiddle,
                                      int32_t * restrict temp,
                                      int32_t * restrict out,
                                      uint32_t numLines,
                                      uint32_t numSkipSamples);

void mmwavelib_dftSingleBin(const uint32_t inBuf[restrict],
                            const uint32_t sincos[restrict],
                            uint64_t * restrict output,
                            uint32_t length, uint32_t doppInd);


void mmwavelib_dftSingleBinWithWindow(
                   const uint32_t inBuf[restrict],
                   const uint32_t sincos[restrict],
                   const int32_t win[restrict],
                   uint64_t * restrict output,
                   uint32_t length,
                   uint32_t doppInd);


#endif                          /* _MMWAVELIB_FFT_H_ */
