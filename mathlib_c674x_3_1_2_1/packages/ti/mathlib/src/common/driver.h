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
/* driver.h - Common test driver utilities                                 */
/* ======================================================================= */

#ifndef DRIVER_H_
#define DRIVER_H_ 1

#include <time.h>
#include <c6x.h>


/* Miscellaneous defines */
#define MTH_TWO_PI          (6.283185)
#define MTH_MAX_TESTVAL      2000
#define MTH_SEED_DEF         0x2A3A4A5A
#define MTH_SEED_FNAME      "seedfile.txt"
#define MTH_NUM_OUTPUT       5
#define MTH_NUM_INPUT        2

/* Driver test codes */
#define MTH_TST_PREDEF      1
#define MTH_TST_RANDOM      2
#define MTH_TST_SPECIAL     3
#define MTH_TST_EXTENDED    4

/* Profiling function codes */
#define MTH_FCN_RTS         0
#define MTH_FCN_ASM         1
#define MTH_FCN_CI          2
#define MTH_FCN_INL         3
#define MTH_FCN_VEC         4

/* Test requirement bitfield */
#define MTH_REQ_DEFAULT     0
#define MTH_REQ_PERCENT     1
#define MTH_REQ_NOTZERO     2
#define MTH_REQ_NOTNAN      4
#define MTH_REQ_IGNORE_INF  8


/* Horizontal line print macro */
#define print_hline() {                                   \
  printf ("----------------------------------------");    \
  printf ("----------------------------------------\n");  \
}


/* External seed variables */
extern int seed;
extern FILE *fp;

/* Handle COFF versus ELF for memory size symbols */
#if defined(__TI_EABI__)
# define kernel_asm_size _kernel_asm_size
# define kernel_vec_size _kernel_vec_size
# define kernel_ci_size  _kernel_ci_size
#endif

/* External symbols used for kernel size calculation */
extern char kernel_asm_size;
extern char kernel_vec_size;
extern char kernel_ci_size;

/* Global profiling variables */
extern long long t_start;
extern long long t_stop;
extern long long t_offset;
extern long long cycle_counts[MTH_NUM_OUTPUT];

/* External seed variables */
extern int fcn_pass[MTH_NUM_OUTPUT];
extern int all_pass;


/* Inline profiling routines */
static inline void profile_init (int code) {
  /* Initialize the corresponding cycle count */
  cycle_counts[code] = (clock_t) 0;
  TSCL = 0;
  t_start= _itoll(TSCH, TSCL);
  t_offset = _itoll(TSCH, TSCL) - t_start;
}

static inline void profile_start (void) {
  /* Latch the start time */
  t_start= _itoll(TSCH, TSCL);
//  t_offset = _itoll(TSCH, TSCL) - t_start;
}

static inline void profile_update (int code) {
  /* Latch the stop time */
  t_stop= _itoll(TSCH, TSCL);
  /* Accumulate the cycles */
  cycle_counts[code] += t_stop - t_start - t_offset;
}

static inline void profile_avg (int code, int n) {
  /* Average the cycles */
  cycle_counts[code] = (long long) ((float) cycle_counts[code] / (float) n + 0.5);
}


/* Prototypes */
extern void driver_init           (char *str);
extern void print_profile_results (char *str);
extern void print_memory_results  (char *str);
extern void print_test_results    (int code);

#endif /* DRIVER_H_ */

/* ======================================================================== */
/*  End of file: driver.h                                                   */
/* ======================================================================== */
