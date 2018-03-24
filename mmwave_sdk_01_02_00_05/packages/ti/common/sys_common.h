/**
 *   @file  sys_common.h
 *
 *   @brief
 *      This is the common header file used by the various mmWave SDK
 *      modules.
 *
 *  \par
 *  NOTE:
 *      (C) Copyright 2016 Texas Instruments, Inc.
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

#ifndef SYS_COMMON_H
#define SYS_COMMON_H

#include <stdint.h>
#include <stdbool.h>

#ifdef SOC_XWR14XX
#include <ti/common/sys_common_xwr14xx.h>
#endif

#ifdef SOC_XWR16XX
#include <ti/common/sys_common_xwr16xx.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#define     MINUS_ONE           -((int32_t)1)

/******************************************************************************
 * Inline Functions:
 ******************************************************************************/
static inline uint32_t CSL_FMKR(uint8_t msb, uint8_t lsb, uint32_t val);
static inline uint32_t CSL_FEXTR(uint32_t reg, uint8_t msb, uint8_t lsb);
static inline uint32_t CSL_FINSR(uint32_t reg, uint8_t msb, uint8_t lsb, uint32_t val);

/* the Field MaKe (Raw) macro */
static inline uint32_t CSL_FMKR(uint8_t msb, uint8_t lsb, uint32_t val)
{
    uint32_t    mask;
    uint8_t     bits;
    uint32_t    newVal;

    bits = (msb - lsb + 1U);
    mask = (1U << bits);
    mask = mask - 1U;

    newVal = val & mask;

    return (newVal << lsb);
}

/* the Field EXTract (Raw) macro */
static inline uint32_t CSL_FEXTR(volatile uint32_t reg, uint8_t msb, uint8_t lsb)
{
    uint32_t    mask;
    uint8_t     bits;
    uint32_t    value;

    bits = (msb - lsb + 1U);
    mask = (1U << bits);
    mask = mask - 1U;
    value = (reg >> lsb) & mask;
    return value;
}

/* the Field INSert (Raw) macro */
static inline uint32_t CSL_FINSR(volatile uint32_t reg, uint8_t msb, uint8_t lsb, uint32_t val)
{
    uint32_t    mask;
    uint8_t     bits;
    uint32_t    value;
    uint32_t    tmp;

    bits = (msb - lsb + 1U);
    mask = (1U << bits);
    mask = mask - 1U;
    value = (mask << lsb);
    tmp   = (reg & ~value);
    reg   = tmp | CSL_FMKR(msb, lsb, val);
    return reg;
}

/*************************************************************
 * Common MACROs
 *************************************************************/
#define MAX(x,y) ((x) > (y) ? (x) : (y))
#define MIN(x,y) ((x) < (y) ? (x) : (y))

#define ROUND(x) ((x) < 0 ? ((x) - 0.5) : ((x) + 0.5) )

#define MMWDEMO_SATURATE_HIGH(x) ( (x) > 32767 ? (x) = 32767 : (x))
#define MMWDEMO_SATURATE_LOW(x) ( (x) < -32768 ? (x) = -32768 : (x))

/*************************************************************
 * MMWAVE System level defines
 *************************************************************/
#define SYS_COMMON_NUM_RX_CHANNEL                   4U
#define SYS_COMMON_CQ_MAX_CHIRP_THRESHOLD           8U

/* This is the size of the Chirp Parameters (CP) in CBUFF Units */
#define SYS_COMMON_CP_SIZE_CBUFF_UNITS              2U

#define MMWDEMO_MEMORY_ALLOC_DOUBLE_WORD_ALIGN 8
#define MMWDEMO_MEMORY_ALLOC_MAX_STRUCT_ALIGN  sizeof(uint64_t)

/*! @brief  Complex data type. This type of input, (first real than
 * imaginary part), is required for DSP lib FFT functions */
typedef struct cmplx16ReIm_t_
{
    int16_t real; /*!< @brief real part */
    int16_t imag; /*!< @brief imaginary part */
} cmplx16ReIm_t;

/*! @brief  Complex data type, natural for C674x complex
 * multiplication instructions. */
typedef struct cmplx16ImRe_t_
{
    int16_t imag; /*!< @brief imaginary part */
    int16_t real; /*!< @brief real part */
} cmplx16ImRe_t;

/*! @brief  Complex data type. This type of input, (first real than
 * imaginary part), is required for DSP lib FFT functions */
typedef struct cmplx32ReIm_t_
{
    int32_t real; /*!< @brief real part */
    int32_t imag; /*!< @brief imaginary part */
} cmplx32ReIm_t;

/*! @brief  Complex data type, natural for C674x complex
 * multiplication instructions */
typedef struct cmplx32ImRe_t_
{
    int32_t imag; /*!< @brief imaginary part */
    int32_t real; /*!< @brief real part */
} cmplx32ImRe_t;


#ifdef __cplusplus
}
#endif

#endif /* SYS_COMMON_H */

