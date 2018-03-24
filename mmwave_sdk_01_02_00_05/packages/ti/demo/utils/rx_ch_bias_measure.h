/**
 *   @file  rx_ch_bias_measure.h
 *
 *   @brief
 *      This is the data path processing header.
 *
 *  \par
 *  NOTE:
 *      (C) Copyright 2017 Texas Instruments, Inc.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions
 *  are met:
 *
 *    Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#ifndef RX_CH_BIAS_MEASURE_H
#define RX_CH_BIAS_MEASURE_H


#include <ti/common/sys_common.h>
#include <ti/demo/io_interface/mmw_config.h>
#ifdef __cplusplus
extern "C" {
#endif

/**
 *  @b Description
 *  @n
 *        Measurement procedure for range bias estimation and rx channel gain/phase offset:
 *        1. For range bias estimation, it is assumed that the strong reflector is positioned at
 *           bore sight at distance > 1m. A peak is searched in Detection matrix,
 *           (zero Doppler range profile), in the vicinity of the expected reflector position.
 *            Range position is estimated using a three-point quadratic fit.
 *            Although the peak is estimated from detection matrix, the quadratic
 *            fit uses linear magnitude to fit.
 *        2. Compensation coefficients for the Rx channel gain/phase offset are calculated
 *           as: c[i] = conj(Rx[i])/|Rx[i]|^2 * |RxMin|, for i=0,...,numVirtualAntennas-1
 *           Rx[i] are 2D antenna symbols taken from the saved zero Doppler column of the
 *           radarCube matrix, at the range index found in step 1.
 *
 *  @param[in]  targetDistance  : Target distance in meters placed at bore sight
 *
 *  @param[in]  rangeResolution : Profile range resolution in meters per range bin
 *
 *  @param[in]  searchWinSize   : Peak search window size in meters around the expected target position
 *
 *  @param[in]  detMatrix       : Detection matrix, where the peak is searched.
 *                                The size of the matrix is R x D, where R is number
 *                                of range bins, and D is number of Doppler bins. The peak is
 *                                searched in the column zero, zero Doppler column.
 *
 *  @param[in]  numDopplerBins  : Number of Doppler bins
 *
 *  @param[in]  numVirtualAntennas : Number of virtual antennas
 *
 *  @param[in]  numColInSymbolMatrix : Number of columns in the Symbol matrix
 *
 *  @param[in]  symbolMatrix : Symbol matrix with 2D symbols. The size is (R x numColInSymbolMatrix),
 *                             where R is number of range bins.
 *
 *  @param[in]  numRxAnt : Number of Rx antennas
 *
 *  @param[in]  numTxAnt : Number Tx antennas
 *
 *  @param[in]  txOrder : Index oredr of Tx antennas in TDM MIMO
 *
 *  @param[out]  compRxChanCfg : Output structure with estimated parameters:
 *                               range bias, and rx channel gain/phase
 *                               compensation coefficients
 *
 *
 *  @retval
 *      Not Applicable.
 */
void MmwDemo_rangeBiasRxChPhaseMeasure(float targetDistance,
                                       float rangeResolution,
                                       float searchWinSize,
                                       uint16_t *detMatrix,
                                       uint16_t numDopplerBins,
                                       uint32_t numVirtualAntennas,
                                       uint32_t numColInSymbolMatrix,
                                       uint32_t *symbolMatrix,
                                       uint32_t numRxAnt,
                                       uint32_t numTxAnt,
                                       uint32_t *txOrder,
                                       MmwDemo_compRxChannelBiasCfg_t *compRxChanCfg);

/**
 *  @b Description
 *  @n  Quadratic fit through three points
 *
 *  @param[in]  x : X array of three points
 *
 *  @param[in]  y : Y array of three points
 *
 *  @param[out]  xv : X coordinate of the vertex
 *
 *  @param[out]  yv : Y coordinate of the vertex
 *
 *  @retval
 *      Not Applicable.
 */
void MmwDemo_quadFit(float *x, float*y, float *xv, float *yv);

#ifdef __cplusplus
}
#endif

#endif /* RX_CH_BIAS_MEASURE_H */

