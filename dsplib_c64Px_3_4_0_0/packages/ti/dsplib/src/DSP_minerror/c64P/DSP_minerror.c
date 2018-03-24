/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  DSPLIB  DSP Signal Processing Library                                  */
/*                                                                         */
/*  This library contains proprietary intellectual property of Texas       */
/*  Instruments, Inc.  The library and its source code are protected by    */
/*  various copyrights, and portions may also be protected by patents or   */
/*  other legal protections.                                               */
/*                                                                         */
/*  This software is licensed for use with Texas Instruments TMS320        */
/*  family DSPs.  This license was provided to you prior to installing     */
/*  the software.  You may review this license by consulting the file      */
/*  TI_license.PDF which accompanies the files in this library.            */
/*                                                                         */
/* ----------------------------------------------------------------------- */
/*                                                                         */
/* DSP_minerror.c -- Minimum Energy Error Search                           */
/*                   Optimized C Implementation (w/ Intrinsics)            */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_minerror (                                                 */
/*         const short *restrict GSP0_TABLE,                               */
/*         const short *restrict errCoefs,                                 */
/*         int         *restrict max_index                                 */
/*     )                                                                   */
/*                                                                         */
/*     GSP0_TABLE[256*9] :  Pointer to GSP0 terms array.                   */
/*                          Must be double-word aligned.                   */
/*     errCoefs[9]       :  Array of error coefficients.                   */
/*     max_index         :  Index to GSP0_TABLE[max_index], the first      */
/*                          element of the 9-element vector that resulted  */
/*                          in the maximum dot product.                    */
/*     return int        :  Maximum dot product result.                    */
/*                                                                         */
/*  Description                                                            */
/*      Performs a dot product on 256 pairs of 9 element vectors and       */
/*      searches for the pair of vectors which produces the maximum dot    */
/*      product result and returns the value of the highest dot product.   */
/*      This is a large part of the VSELP vocoder codebook search.         */
/*                                                                         */
/*  Assumptions                                                            */
/*     Arrays GSP0_TABLE and errCoefs                                      */
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

#pragma CODE_SECTION(DSP_minerror, ".text:optimized");

#include "DSP_minerror.h"

#define GSP0_TERMS 9
#define GSP0_NUM 256

#ifdef _LITTLE_ENDIAN
int DSP_minerror (
    const short *restrict GSP0_TABLE, /* Pointer to GSP0 terms array          */
    const short *restrict errCoefs,   /* Array of error coefficients          */
    int *restrict max_index           /* Index to the 9-element vector that   */
                                      /* resulted in the maximum dot product  */
)
{
    const short *Table_ptr_a, *Table_ptr_b;

    int i, maxVal;
    int cnt, c, dist, val0, val1, val2, val3;
    int it_i, save;

    unsigned int c76, c54, c32, c10;
    unsigned int c87, c65, c43, c21;
    unsigned int c08;

    unsigned int tb0_76, tb0_54, tb0_32, tb0_10;
    unsigned int tb1_87, tb1_65, tb1_43, tb1_21;
    unsigned int tb2_76, tb2_54, tb2_32, tb2_10;
    unsigned int tb3_87, tb3_65, tb3_43, tb3_21;
    unsigned int tb32_08, tb10_08;

    double table_dword0, table_dword1, table_dword2;
    double table_dword3, table_dword4, table_dword5;
    double table_dword6, table_dword7, table_dword8;
    double tbdwd0, tbdwd1;
    double coef_7654, coef_3210;

    /*------------------------------------------------------------*/
    /* Use non-aligned loads to load in various packed combina-   */
    /* tions of the coefficients and extract them, using _lo      */
    /* and _hi intrinsic.                                         */
    /*------------------------------------------------------------*/
    coef_3210 = _amemd8_const(&errCoefs[0]);
    coef_7654 = _amemd8_const(&errCoefs[4]);
    c87 = _mem4_const(&errCoefs[7]);

    c10 = _lo(coef_3210);
    c32 = _hi(coef_3210);
    c54 = _lo(coef_7654);
    c76 = _hi(coef_7654);

    c21 = _packlh2(c32, c10);
    c43 = _packlh2(c54, c32);
    c65 = _packlh2(c76, c54);

    /*-----------------------------------------------------------*/
    /* Obtain a pointer to the GSP0_TABLE, by obtaining the add- */
    /* ress of the first element. It is preferrrable to linear-  */
    /* ze the stride into the array, into a 1D array.            */
    /*-----------------------------------------------------------*/
    Table_ptr_a = &GSP0_TABLE[0];
    Table_ptr_b = Table_ptr_a + 4;

    /*------------------------------------------------------------*/
    /* cnt, contains the offset from the starting location.       */
    /* dist, contains the offset in bytes between succesive locns */
    /* "c08" packed coefficient of c0 and c8                      */
    /*------------------------------------------------------------*/
    cnt = -GSP0_TERMS;
    c = 0;
    dist = GSP0_TERMS;
    c08 = _packlh2(c10, c87);

    /*------------------------------------------------------------*/
    /* Since four rows are processed simultaneously, the # iter-  */
    /* ataions of the loop is GSP0_NUM /4, 64 iterations. Init-   */
    /* ialize the maxVal to a negative quantity. Set "save" to    */
    /* "0" as initial value.                                      */
    /*------------------------------------------------------------*/
    it_i = GSP0_NUM;
    maxVal = -32767;    /* Min val for ints */
    save = 0;

    for (i = 0; i < it_i; i += 4) {
        /*-----------------------------------------------------------*/
        /* The use of twin pointers helps to parallelize the loads.  */
        /* Load GSP0_TABLE values for the first "4" rows and obt-    */
        /* ain the individual values using the _lo and _hi intr-     */
        /* insic instructions.                                       */
        /*-----------------------------------------------------------*/
        table_dword0 = _amemd8_const(Table_ptr_a);
        Table_ptr_a += 8;

        table_dword1 = _amemd8_const(Table_ptr_b);
        Table_ptr_b += 8;

        table_dword2 = _amemd8_const(Table_ptr_a);
        Table_ptr_a += 8;

        table_dword3 = _amemd8_const(Table_ptr_b);
        Table_ptr_b += 8;

        table_dword4 = _amemd8_const(Table_ptr_a);
        Table_ptr_a += 8;

        table_dword5 = _amemd8_const(Table_ptr_b);
        Table_ptr_b += 8;

        table_dword6 = _amemd8_const(Table_ptr_a);
        Table_ptr_a += 8;

        table_dword7 = _amemd8_const(Table_ptr_b);
        Table_ptr_b += 8;

        table_dword8 = _amemd8_const(Table_ptr_a);

        /*-----------------------------------------------------------*/
        /* Use exchange of pointers, after loading the data as only  */
        /* 9 double words have been loaded.                          */
        /*-----------------------------------------------------------*/
        Table_ptr_a = Table_ptr_b;
        Table_ptr_b = Table_ptr_a + 4;

        /*-----------------------------------------------------------*/
        /* Obtain GSP0_TABLE entries for row "4i"                    */
        /*-----------------------------------------------------------*/
        tb0_10 = _lo(table_dword0);
        tb0_32 = _hi(table_dword0);
        tb0_54 = _lo(table_dword1);
        tb0_76 = _hi(table_dword1);

        /*-----------------------------------------------------------*/
        /* Obtain GSP0_TABLE entries for row "4i + 1"                */
        /*-----------------------------------------------------------*/
        tb10_08 = _lo(table_dword2);
        tb1_21 = _hi(table_dword2);
        tb1_43 = _lo(table_dword3);
        tb1_65 = _hi(table_dword3);
        tb1_87 = _lo(table_dword4);

        /*-----------------------------------------------------------*/
        /* Obtain "GSP0_TABLE" entries for row "4i + 2"              */
        /*-----------------------------------------------------------*/
        tb2_10 = _hi(table_dword4);
        tb2_32 = _lo(table_dword5);
        tb2_54 = _hi(table_dword5);
        tb2_76 = _lo(table_dword6);

        /*-----------------------------------------------------------*/
        /* Obtain "GSP0_TABLE" entries for row "4i + 3"              */
        /*-----------------------------------------------------------*/
        tb32_08 = _hi(table_dword6);
        tb3_21 = _lo(table_dword7);
        tb3_43 = _hi(table_dword7);
        tb3_65 = _lo(table_dword8);
        tb3_87 = _hi(table_dword8);

        /*---------------------------------------------------------*/
        /* Perform the first eight multiplies of any row using     */
        /* _dotp2's. The last multiply is performed as "mpy2"      */
        /* because it also contains the data for the next row.     */
        /* This prevents the results from being added together     */
        /* after multiplication. The low half, result of the       */
        /* double word contains result for row 0, high half        */
        /* contains result for row 1. Simultaneously perform       */
        /* accumulation for all four rows.                         */
        /*---------------------------------------------------------*/
        tbdwd0 = _mpy2(tb10_08, c08);

        val0 = _dotp2(tb0_10, c10);
        val0 += _dotp2(tb0_32, c32);
        val0 += _dotp2(tb0_54, c54);
        val0 += _dotp2(tb0_76, c76);
        val0 += _lo(tbdwd0);

        val1 = _hi(tbdwd0);
        val1 += _dotp2(tb1_21, c21);
        val1 += _dotp2(tb1_43, c43);
        val1 += _dotp2(tb1_65, c65);
        val1 += _dotp2(tb1_87, c87);

        /*--------------------------------------------------------*/
        /* Perform similar set of operations for row 2 and 3      */
        /*--------------------------------------------------------*/
        tbdwd1 = _mpy2(tb32_08, c08);

        val2 = _dotp2(tb2_10, c10);
        val2 += _dotp2(tb2_32, c32);
        val2 += _dotp2(tb2_54, c54);
        val2 += _dotp2(tb2_76, c76);
        val2 += _lo(tbdwd1);

        val3 = _hi(tbdwd1);
        val3 += _dotp2(tb3_21, c21);
        val3 += _dotp2(tb3_43, c43);
        val3 += _dotp2(tb3_65, c65);
        val3 += _dotp2(tb3_87, c87);

        /*--------------------------------------------------------*/
        /* Compare against existing maximum, and change if accum. */
        /* is larger than existing maximum.                       */
        /*--------------------------------------------------------*/
        c = (val0 > maxVal) ? 1 : 0;
        cnt = cnt + dist;
        if (c) maxVal = val0;
        if (c) save   = cnt;

        c = (val1 > maxVal) ? 1 : 0;
        cnt = cnt + dist;
        if (c) maxVal = val1;
        if (c) save   = cnt;

        c = (val2 > maxVal) ? 1 : 0;
        cnt = cnt + dist;
        if (c) maxVal = val2;
        if (c) save   = cnt;

        c = (val3 > maxVal) ? 1 : 0;
        cnt = cnt + dist;
        if (c) maxVal = val3;
        if (c) save   = cnt;
    }
    /*------------------------------------------------------------*/
    /* Return saved index and the maximum value found, this is    */
    /* the one with the least error.                              */
    /*------------------------------------------------------------*/
    *max_index = save;
    return (maxVal);
}
#else
int DSP_minerror (
    const short *restrict GSP0_TABLE, /* Pointer to GSP0 terms array          */
    const short *restrict errCoefs,   /* Array of error coefficients          */
    int *restrict max_index           /* Index to the 9-element vector that   */
                                      /* resulted in the maximum dot product  */
)
{
    const short *Table_ptr_a, *Table_ptr_b;

    int i, maxVal;
    int cnt, c, dist, val0, val1, val2, val3;
    int it_i, save;

    unsigned int c67, c45, c23, c01;
    unsigned int c78, c56, c34, c12;
    unsigned int c80;

    unsigned int tb0_67, tb0_45, tb0_23, tb0_01;
    unsigned int tb1_78, tb1_56, tb1_34, tb1_12;
    unsigned int tb2_67, tb2_45, tb2_23, tb2_01;
    unsigned int tb3_78, tb3_56, tb3_34, tb3_12;
    unsigned int tb23_80, tb01_80;

    double table_dword0, table_dword1, table_dword2;
    double table_dword3, table_dword4, table_dword5;
    double table_dword6, table_dword7, table_dword8;
    double tbdwd0, tbdwd1;
    double coef_4567, coef_0123;

    /*------------------------------------------------------------*/
    /* Use non-aligned loads to load in various packed combina-   */
    /* tions of the coefficients and extract them, using _lo      */
    /* and _hi intrinsic.                                         */
    /*------------------------------------------------------------*/
    coef_0123 = _amemd8_const(&errCoefs[0]);
    coef_4567 = _amemd8_const(&errCoefs[4]);
    c78 = _mem4_const(&errCoefs[7]);

    c23 = _lo(coef_0123);
    c01 = _hi(coef_0123);
    c67 = _lo(coef_4567);
    c45 = _hi(coef_4567);

    c12 = _packlh2(c01, c23);
    c34 = _packlh2(c23, c45);
    c56 = _packlh2(c45, c67);

    /*-----------------------------------------------------------*/
    /* Obtain a pointer to the GSP0_TABLE, by obtaining the add- */
    /* ress of the first element. It is preferrrable to linear-  */
    /* ze the stride into the array, into a 1D array.            */
    /*-----------------------------------------------------------*/
    Table_ptr_a = &GSP0_TABLE[0];
    Table_ptr_b = Table_ptr_a + 4;

    /*------------------------------------------------------------*/
    /* cnt, contains the offset from the starting location.       */
    /* dist, contains the offset in bytes between succesive locns */
    /* "c08" packed coefficient of c0 and c8                      */
    /*------------------------------------------------------------*/
    cnt = -GSP0_TERMS;
    c = 0;
    dist = GSP0_TERMS;
    c80 = _packlh2(c78, c01);

    /*------------------------------------------------------------*/
    /* Since four rows are processed simultaneously, the # iter-  */
    /* ataions of the loop is GSP0_NUM /4, 64 iterations. Init-   */
    /* ialize the maxVal to a negative quantity. Set "save" to    */
    /* "0" as initial value.                                      */
    /*------------------------------------------------------------*/
    it_i = GSP0_NUM;
    maxVal = -32767;    /* Min val for ints */
    save = 0;

    for (i = 0; i < it_i; i += 4) {
        /*-----------------------------------------------------------*/
        /* The use of twin pointers helps to parallelize the loads.  */
        /* Load GSP0_TABLE values for the first "4" rows and obt-    */
        /* ain the individual values using the _lo and _hi intr-     */
        /* insic instructions.                                       */
        /*-----------------------------------------------------------*/
        table_dword0 = _amemd8_const(Table_ptr_a);
        Table_ptr_a += 8;

        table_dword1 = _amemd8_const(Table_ptr_b);
        Table_ptr_b += 8;

        table_dword2 = _amemd8_const(Table_ptr_a);
        Table_ptr_a += 8;

        table_dword3 = _amemd8_const(Table_ptr_b);
        Table_ptr_b += 8;

        table_dword4 = _amemd8_const(Table_ptr_a);
        Table_ptr_a += 8;

        table_dword5 = _amemd8_const(Table_ptr_b);
        Table_ptr_b += 8;

        table_dword6 = _amemd8_const(Table_ptr_a);
        Table_ptr_a += 8;

        table_dword7 = _amemd8_const(Table_ptr_b);
        Table_ptr_b += 8;

        table_dword8 = _amemd8_const(Table_ptr_a);

        /*-----------------------------------------------------------*/
        /* Use exchange of pointers, after loading the data as only  */
        /* 9 double words have been loaded.                          */
        /*-----------------------------------------------------------*/
        Table_ptr_a = Table_ptr_b;
        Table_ptr_b = Table_ptr_a + 4;

        /*-----------------------------------------------------------*/
        /* Obtain GSP0_TABLE entries for row "4i"                    */
        /*-----------------------------------------------------------*/
        tb0_01 = _hi(table_dword0);
        tb0_23 = _lo(table_dword0);
        tb0_45 = _hi(table_dword1);
        tb0_67 = _lo(table_dword1);
        /*-----------------------------------------------------------*/
        /* Obtain GSP0_TABLE entries for row "4i + 1"                */
        /*-----------------------------------------------------------*/
        tb01_80 = _hi(table_dword2);
        tb1_12 = _lo(table_dword2);
        tb1_34 = _hi(table_dword3);
        tb1_56 = _lo(table_dword3);
        tb1_78 = _hi(table_dword4);

        /*-----------------------------------------------------------*/
        /* Obtain "GSP0_TABLE" entries for row "4i + 2"              */
        /*-----------------------------------------------------------*/
        tb2_01 = _lo(table_dword4);
        tb2_23 = _hi(table_dword5);
        tb2_45 = _lo(table_dword5);
        tb2_67 = _hi(table_dword6);

        /*-----------------------------------------------------------*/
        /* Obtain "GSP0_TABLE" entries for row "4i + 3"              */
        /*-----------------------------------------------------------*/
        tb23_80 = _lo(table_dword6);
        tb3_12 = _hi(table_dword7);
        tb3_34 = _lo(table_dword7);
        tb3_56 = _hi(table_dword8);
        tb3_78 = _lo(table_dword8);

        /*---------------------------------------------------------*/
        /* Perform the first eight multiplies of any row using     */
        /* _dotp2's. The last multiply is performed as "mpy2"      */
        /* because it also contains the data for the next row.     */
        /* This prevents the results from being added together     */
        /* after multiplication. The low half, result of the       */
        /* double word contains result for row 0, high half        */
        /* contains result for row 1. Simultaneously perform       */
        /* accumulation for all four rows.                         */
        /*---------------------------------------------------------*/
        tbdwd0 = _mpy2(tb01_80, c80);

        val0 = _dotp2(tb0_01, c01);
        val0 += _dotp2(tb0_23, c23);
        val0 += _dotp2(tb0_45, c45);
        val0 += _dotp2(tb0_67, c67);
        val0 += _hi(tbdwd0);

        val1 = _lo(tbdwd0);
        val1 += _dotp2(tb1_12, c12);
        val1 += _dotp2(tb1_34, c34);
        val1 += _dotp2(tb1_56, c56);
        val1 += _dotp2(tb1_78, c78);

        /*--------------------------------------------------------*/
        /* Perform similar set of operations for row 2 and 3      */
        /*--------------------------------------------------------*/
        tbdwd1 = _mpy2(tb23_80, c80);

        val2 = _dotp2(tb2_01, c01);
        val2 += _dotp2(tb2_23, c23);
        val2 += _dotp2(tb2_45, c45);
        val2 += _dotp2(tb2_67, c67);
        val2 += _hi(tbdwd1);

        val3 = _lo(tbdwd1);
        val3 += _dotp2(tb3_12, c12);
        val3 += _dotp2(tb3_34, c34);
        val3 += _dotp2(tb3_56, c56);
        val3 += _dotp2(tb3_78, c78);

        /*--------------------------------------------------------*/
        /* Compare against existing maximum, and change if accum. */
        /* is larger than existing maximum.                       */
        /*--------------------------------------------------------*/
        c = (val0 > maxVal) ? 1 : 0;
        cnt = cnt + dist;
        if (c) maxVal = val0;
        if (c) save   = cnt;

        c = (val1 > maxVal) ? 1 : 0;
        cnt = cnt + dist;
        if (c) maxVal = val1;
        if (c) save   = cnt;

        c = (val2 > maxVal) ? 1 : 0;
        cnt = cnt + dist;
        if (c) maxVal = val2;
        if (c) save   = cnt;

        c = (val3 > maxVal) ? 1 : 0;
        cnt = cnt + dist;
        if (c) maxVal = val3;
        if (c) save   = cnt;
    }
    /*------------------------------------------------------------*/
    /* Return saved index and the maximum value found, this is    */
    /* the one with the least error.                              */
    /*------------------------------------------------------------*/
    *max_index = save;
    return (maxVal);
}
#endif
/* ======================================================================= */
/*  End of file:  DSP_minerror.c                                           */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

