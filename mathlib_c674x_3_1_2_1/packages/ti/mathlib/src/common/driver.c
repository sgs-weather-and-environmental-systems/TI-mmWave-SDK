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
/* driver.c - Common test driver utilities                                 */
/* ======================================================================= */

#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "driver.h"


/* Global random data seed */
int seed;
FILE *fp;

/* Global profiling variables */
long long t_start;
long long t_stop;
long long t_offset;
long long cycle_counts[MTH_NUM_OUTPUT];

/* Global test results */
int fcn_pass[MTH_NUM_OUTPUT];
int all_pass;


/* Initialize testing */
void driver_init (char *str)
{
  /* Driver heading */
  printf ("\n\n\n\n");
  print_hline();
  printf ("Verification Results:  %s\n", str);
  print_hline();

  /* Initialize random data generation */
  seed = MTH_SEED_DEF;
 //if ((fp = fopen(MTH_SEED_FNAME, "r")) != NULL) {
 //   fscanf (fp, "%d", &seed);
 //   fclose(fp);
  //}
  srand (seed);
}


/* Display profiling results in a consistent manner */
void print_profile_results (char *str) 
{
  printf ("\n");
  print_hline ();
  printf ("Cycle Profile:  %s\n", str);
  print_hline ();
  printf ("RTS:     %d cycles\n", (int) cycle_counts[MTH_FCN_RTS]);
  printf ("ASM:     %d cycles\n", (int) cycle_counts[MTH_FCN_ASM]);
  printf ("C:       %d cycles\n", (int) cycle_counts[MTH_FCN_CI]);
  printf ("Inline:  %d cycles\n", (int) cycle_counts[MTH_FCN_INL]);
  printf ("Vector:  %d cycles\n", (int) cycle_counts[MTH_FCN_VEC]);
  print_hline ();
}


/* Display memory results in a consistent manner */
void print_memory_results (char *str) 
{
  printf ("\n");
  print_hline ();
  printf ("Memory Profile:  %s\n", str);
  print_hline ();
  printf ("ASM:     %d bytes\n", (int) &kernel_asm_size);
  printf ("C:       %d bytes\n", (int) &kernel_ci_size);
  printf ("Vector:  %d bytes\n", (int) &kernel_vec_size);
  print_hline ();
}


/* Display test results in a consistent manner */
void print_test_results (int code)
{
  int comma = 0;

  /* Results header */
  if (code == MTH_TST_PREDEF) {
    printf ("Pre-defined Data: ");
  }
  else if (code == MTH_TST_RANDOM) {
    printf ("Random Data (seed = %d): ", seed);
  }
  else if (code == MTH_TST_SPECIAL) {
    printf ("Special Case Data: ");
  }
  else if (code == MTH_TST_EXTENDED) {
    printf ("Extended Range Data: ");
  }
  else {
    printf ("Undefined test code \"%d\"\n", code);
    exit (2);
  }

  /* Display results */
  if (all_pass) {
    printf (" Passed\n");
    
    /* Handle next seed generation */
    seed = rand(); 
    if (!(fp = fopen (MTH_SEED_FNAME, "w"))) {  
      printf ("Error writing seed file \"%s\"\n", MTH_SEED_FNAME);
      exit (1);
    }
    fprintf (fp, "%d\n", seed);
    fclose (fp);
  }
  else {
    printf (" Failed (");
    /* Provide list of failed functions */
    if (!fcn_pass[MTH_FCN_ASM]) {
      printf ("ASM");
      comma = 1;
    }
    if (!fcn_pass[MTH_FCN_CI]) {
      if (comma) printf (",");
      printf ("C");
      comma = 1;
    }
    if (!fcn_pass[MTH_FCN_INL]) {
      if (comma) printf (",");
      printf ("INL");
      comma = 1;
    }
    if (!fcn_pass[MTH_FCN_VEC]) {
      if (comma) printf (",");
      printf ("VEC");
    }
    printf (")\n");
  }
}


/* ======================================================================== */
/*  End of file: driver.c                                                   */
/* ======================================================================== */
