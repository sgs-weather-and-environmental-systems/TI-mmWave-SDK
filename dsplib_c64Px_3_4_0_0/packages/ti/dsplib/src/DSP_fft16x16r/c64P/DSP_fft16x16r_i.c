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
/*  NAME                                                                   */
/*      DSP_fft16x16r -- fft16x16r                                         */
/*                                                                         */
/*  USAGE                                                                  */
/*                                                                         */
/*      void DSP_fft16x16r_i (                                             */
/*          int n,                                                         */
/*          short * ptr_x,                                                 */
/*          const short * ptr_w,                                           */
/*          short * ptr_y,                                                 */
/*          int radix,                                                     */
/*          int offset,                                                    */
/*          int n_max                                                      */
/*      );                                                                 */
/*                                                                         */
/*      N      = length of fft in complex samples, power of 2 <=16384      */
/*      ptr_x  = pointer to complex data input                             */
/*      ptr_w  = pointer to complex twiddle factor (see below)             */
/*      radix  = smallest fft butterfly used in computation for decomposi  */
/*      offset = index in complex samples of sub-fft from start of main f  */
/*      n_max  = size of main fft in complex samples                       */
/*                                                                         */
/*      (See the C compiler reference guide.)                              */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*      The benchmark performs a mixed radix forwards fft using            */
/*      a special sequence of coefficients generated in the following      */
/*      way:                                                               */
/*                                                                         */
/*    int gen_twiddle_fft16x16(short *w, int n)                            */
/*    {                                                                    */
/*        int i, j, k;                                                     */
/*        double M = 32767.5;                                              */
/*                                                                         */
/*        for (j = 1, k = 0; j < n >> 2; j = j << 2) {                     */
/*            for (i = 0; i < n >> 2; i += j << 1) {                       */
/*                w[k + 11] =  d2s(M * cos(6.0 * PI * (i + j) / n));       */
/*                w[k + 10] =  d2s(M * sin(6.0 * PI * (i + j) / n));       */
/*                w[k +  9] =  d2s(M * cos(6.0 * PI * (i    ) / n));       */
/*                w[k +  8] =  d2s(M * sin(6.0 * PI * (i    ) / n));       */
/*                                                                         */
/*                w[k +  7] = -d2s(M * cos(4.0 * PI * (i + j) / n));       */
/*                w[k +  6] = -d2s(M * sin(4.0 * PI * (i + j) / n));       */
/*                w[k +  5] = -d2s(M * cos(4.0 * PI * (i    ) / n));       */
/*                w[k +  4] = -d2s(M * sin(4.0 * PI * (i    ) / n));       */
/*                                                                         */
/*                w[k +  3] =  d2s(M * cos(2.0 * PI * (i + j) / n));       */
/*                w[k +  2] =  d2s(M * sin(2.0 * PI * (i + j) / n));       */
/*                w[k +  1] =  d2s(M * cos(2.0 * PI * (i    ) / n));       */
/*                w[k +  0] =  d2s(M * sin(2.0 * PI * (i    ) / n));       */
/*                                                                         */
/*                k += 12;                                                 */
/*            }                                                            */
/*        }                                                                */
/*        return k;                                                        */
/*    }                                                                    */
/*      This redundent set of twiddle factors is size 2*N short samples.   */
/*      As pointed out later dividing these twiddle factors by 2 will give */
/*      an effective divide by 4 at each stage to guarentee no overflow.   */
/*      The function is accurate to about 68dB of signal to noise ratio    */
/*      to the DFT function below:                                         */
/*                                                                         */
/*       void dft(int n, short x[], short y[])                             */
/*       {                                                                 */
/*          int k,i, index;                                                */
/*          const double PI = 3.14159654;                                  */
/*          short * p_x;                                                   */
/*          double arg, fx_0, fx_1, fy_0, fy_1, co, si;                    */
/*                                                                         */
/*          for(k = 0; k<n; k++)                                           */
/*          {                                                              */
/*            p_x = x;                                                     */
/*            fy_0 = 0;                                                    */
/*            fy_1 = 0;                                                    */
/*            for(i=0; i<n; i++)                                           */
/*            {                                                            */
/*              fx_0 = (double)p_x[0];                                     */
/*              fx_1 = (double)p_x[1];                                     */
/*              p_x += 2;                                                  */
/*              index = (i*k) % n;                                         */
/*              arg = 2*PI*index/n;                                        */
/*              co = cos(arg);                                             */
/*              si = -sin(arg);                                            */
/*              fy_0 += ((fx_0 * co) - (fx_1 * si));                       */
/*              fy_1 += ((fx_1 * co) + (fx_0 * si));                       */
/*            }                                                            */
/*            y[2*k] = (short)2*fy_0/sqrt(N);                              */
/*            y[2*k+1] = (short)2*fy_1/sqrt(N);                            */
/*          }                                                              */
/*       }                                                                 */
/*      Scaling takes place at each stage except the last one.             */
/*      This is a divide by 2 to prevent overflow. All shifts are rounded  */
/*      reduce truncation noise power by 3dB.                              */
/*      The function takes the table and input data and calculates the fft */
/*      producing the frequency domain data in the Y array.                */
/*      As the fft allows every input point to effect every output point i */
/*      a cache based system such as the c64xx, this causes cache thrashin */
/*      This is mitigated by allowing the main fft of size N to be divided */
/*      into several steps, allowing as much data reuse as possible.       */
/*                                                                         */
/*      For example the following function:                                */
/*                                                                         */
/*      fft16x16r  (1024, &x_asm[0], &w[0], y_asm, 4, 0, 1024);            */
/*                                                                         */
/*      is equvalent to:                                                   */
/*                                                                         */
/*      fft16x16r  (1024,&x_asm[2*0],  &w[0]    ,y_asm,256,  0,1024);      */
/*      fft16x16r  (256, &x_asm[2*0],  &w[2*768],y_asm,4,    0,1024);      */
/*      fft16x16r  (256, &x_asm[2*256],&w[2*768],y_asm,4,  256,1024);      */
/*      fft16x16r  (256, &x_asm[2*512],&w[2*768],y_asm,4,  512,1024);      */
/*      fft16x16r  (256, &x_asm[2*768],&w[2*768],y_asm,4,  768,1024);      */
/*                                                                         */
/*      Notice how the 1st fft function is called on the entire 1K data se */
/*      it covers the 1st pass of the fft until the butterfly size is 256. */
/*      The following 4 ffts do 256 pt ffts 25% of the size. These continu */
/*      down to the end when the buttefly is of size 4. The use an index t */
/*      the main twiddle factor array of 0.75*2*N. This is because the     */
/*      twiddle factor array is composed of successively decimated version */
/*      of the main array.                                                 */
/*                                                                         */
/*      N not equal to a power of 4 can be used, i.e. 512. In this case to */
/*      decompose the fft the following would be needed :                  */
/*                                                                         */
/*      fft16x16r   (512, &x_asm[0],&w[0],y_asm,2,  0,512);                */
/*                                                                         */
/*      is equvalent to:                                                   */
/*                                                                         */
/*      fft16x16r   (512, &x_asm[0],    &w[0],    y_asm,128,  0,512);      */
/*      fft16x16r   (128, &x_asm[2*0],  &w[2*384],y_asm,2,    0,512);      */
/*      fft16x16r   (128, &x_asm[2*128],&w[2*384],y_asm,2,  128,512);      */
/*      fft16x16r   (128, &x_asm[2*256],&w[2*384],y_asm,2,  256,512);      */
/*      fft16x16r   (128, &x_asm[2*384],&w[2*384],y_asm,2,  384,512);      */
/*                                                                         */
/*      The twiddle factor array is composed of log4(N) sets of twiddle    */
/*      factors, (3/4)*N, (3/16)*N, (3/64)*N, etc.  The index into this    */
/*      array for each stage of the fft is calculated by summing these     */
/*      indices up appropriately.                                          */
/*      For multiple ffts they can share the same table by calling the sma */
/*      ffts from further down in the twiddle factor array. In the same wa */
/*      as the decomposition works for more data reuse.                    */
/*                                                                         */
/*      Thus, the above decomposition can be summarized for a general N ,  */
/*      radix "rad" as follows:                                            */
/*                                                                         */
/*  fft16x16r(N,  &x_cn[0],         &w[0],         y_cn, N/4, 0,     N     */
/*  fft16x16r(N/4,&x_cn[0],         &w[2*(3*N/4)], y_cn, rad, 0,     N     */
/*  fft16x16r(N/4,&x_cn[2*(N/4)],   &w[2*(3*N/4)], y_cn, rad, N/4,   N     */
/*  fft16x16r(N/4,&x_cn[2*(N/2)],   &w[2*(3*N/4)], y_cn, rad, N/2,   N     */
/*  fft16x16r(N/4,&x_cn[2*(3*N/4)], &w[2*3*N/4)],  y_cn, rad, 3*N/4, N     */
/*                                                                         */
/*      As discussed previously, N can be either a power of 4 or 2.  If  N */
/*      N is a power  of 4, rad = 4, and if N is a power of 2, and not  a  */
/*      power of 4, then rad = 2. "rad" is used to control how many stages */
/*      of decomposition are performed. It is also used to dtermine whethe */
/*      a radix4 or radix2 decomposition should be performed at the last   */
/*      stage. Hence when "rad" is set to "N/4" the first stage of the     */
/*      transform alone is performed and the code exits. To complete the   */
/*      FFT four other calls are required to perform N/4 size FFT's. In    */
/*      fact the ordering of these 4 FFT's amonst themselves does not      */
/*      matter and hence from a cahe perspective it helps to go through    */
/*      the remaining 4 FFT's in exactly the opposite order to the first.  */
/*                                                                         */
/*      This is illustrated as follows:                                    */
/*                                                                         */
/*  fft16x16r(N,  &x_cn[0],         &w[0],         y_cn, N/4, 0,     N     */
/*  fft16x16r(N/4,&x_cn[2*(3*N/4)], &w[2*3*N/4)],  y_cn, rad, 3*N/4, N     */
/*  fft16x16r(N/4,&x_cn[2*(N/2)],   &w[2*(3*N/4)], y_cn, rad, N/2,   N     */
/*  fft16x16r(N/4,&x_cn[2*(N/4)],   &w[2*(3*N/4)], y_cn, rad, N/4,   N     */
/*  fft16x16r(N/4,&x_cn[0],         &w[2*(3*N/4)], y_cn, rad, 0,     N     */
/*                                                                         */
/*      In addition this function can be used to minimize call overhead, b */
/*      completing the FFT with one function call invocation as shown belo */
/*                                                                         */
/*      fft16x16r(N, &x_cn[0], &w[0], y_cn, rad, 0, N)                     */
/*                                                                         */
/*   ASSUMPTIONS:                                                          */
/*      n must be a power of 2 and n >= 8  n <= 16384 points.              */
/*      Complex time data x and twiddle facotrs w are aligned on double    */
/*      word boundares. Real values are stored in even word positions and  */
/*      imaginary values in odd positions.                                 */
/*                                                                         */
/*      All data is in short precision integer fixed point form. The       */
/*      complex frequency data will be returned in linear order.           */
/*                                                                         */
/*   TECHNIQUES                                                            */
/*      A special sequence of coeffs. used as generated above              */
/*      produces the fft. This collapses the inner 2 loops in the          */
/*      taditional Burrus and Parks implementation Fortran Code.           */
/*                                                                         */
/*      The revised FFT uses a redundant sequence of twiddle factors to    */
/*      allow a linear access through the data. This linear access enables */
/*      data and instruction level parallelism.                            */
/*      The data produced by the fft16x16r fft is in normal form, the      */
/*      whole data array is written into a new output buffer.              */
/*                                                                         */
/*      The fft16x16r butterfly is bit reversed, i.e. the inner 2 points o */
/*      the butterfly are crossed over, this has the effect of making the  */
/*      data come out in bit reversed rather than in radix 4 digit reverse */
/*      order. This simplifies the last pass of the loop. It is performed  */
/*      using the _bitr instruction on C64x architecture.                  */
/*                                                                         */
/*   NOTES                                                                 */
/*      For more aggressive overflow control the shift in the DC term can  */
/*      adjusted to 2 and the twiddle factors shifted right by 1. This giv */
/*      a divide by 4 at each stage. For better accuracy the data can be p */
/*      asserted left by so many bits so that as it builds in magnitude th */
/*      divide by 2 prevents too much growth. An optimal point for example */
/*      with an 8192pt fft with input data precision of 8 bits is to asert */
/*      the input 4 bits left to make it 12 bits. This gives an SNR of 68d */
/*      at the output. By trying combinations the optimal can be found.    */
/*      If scaling isnot required it is possible to replace the MPY by SMP */
/*      this will give a shift left by 1 so a shift right by 16 gives a    */
/*      total 15 bit shift right. The DC term must be adjusted to give a   */
/*      zero shift.                                                        */
/*                                                                         */
/*   C CODE                                                                */
/*      The following code is the traditional Burrus and Parks implemen-   */
/*      tation, which performs a mixed radix FFT capable of 2^M, 4^M.      */
/*      However it does not support multiple calls. It uses a traditional  */
/*      twiddle factor array wn, generated as follows:                     */
/*                                                                         */
/*      const double M = 32767.0;                                          */
/*      const double PI = 3.141592654;                                     */
/*                                                                         */
/*      for (i=0, k = 0; i < 3*(N>>2); i++)                                */
/*      {                                                                  */
/*         theta1 = 2*PI*i/N;                                              */
/*         x_t = M*cos(theta1);                                            */
/*         y_t = M*sin(theta1);                                            */
/*         wn[k]   = (short) x_t;                                          */
/*         if (x_t >= M) wn[k  ] = 0x7fff;                                 */
/*         wn[k+1] = (short) y_t;                                          */
/*         if (y_t >= M) wn[k+1] = 0x7fff;                                 */
/*         k+=2;                                                           */
/*      }                                                                  */
/*                                                                         */
/*      The C code that implements the traditional mixed radix FFT is      */
/*      shown below. It has three nested loops, one for the stages,        */
/*      one for the groups of butterflies, one for the passes.             */
/*                                                                         */
/* void fft16x16r_i (int n, short x[], short wn[],                         */
/*       short y[], int radix, int offset, int nmax)                       */
/* {                                                                       */
/*    int    n1, n2, ie, ia1, ia2, ia3, i0, i1, i2, i3, i, l0;             */
/*    short  co1, co2, co3, si1, si2, si3;                                 */
/*    short  xt0, yt0, xt1, yt1, xt2, yt2;                                 */
/*    short  xh0,xh1,xh20,xh21,xl0,xl1,xl20,xl21;                          */
/*    short * ptr_x0, * y0;                                                */
/*    unsigned int  j0, j1, k0, k1, k, j;                                  */
/*    short x0, x1, x2, x3, x4, x5, x6, x7;                                */
/*    short xh0_0, xh1_0, xh0_1, xh1_1;                                    */
/*    short xl0_0, xl1_0, xl0_1, xl1_1;                                    */
/*    short yt3, yt4, yt5, yt6, yt7;                                       */
/*                                                                         */
/*    n2 = n;                                                              */
/*    ie = 1;                                                              */
/*    for (k = n; k > radix; k >>= 2)                                      */
/*    {                                                                    */
/*        n1 = n2;                                                         */
/*        n2 >>= 2;                                                        */
/*        ia1 = 0;                                                         */
/*        for (j = 0; j < n2; j++)                                         */
/*        {                                                                */
/*            ia2 = ia1 + ia1;                                             */
/*            ia3 = ia2 + ia1;                                             */
/*            co1 = w[2 * ia1    ];                                        */
/*            si1 = w[2 * ia1 + 1];                                        */
/*            co2 = w[2 * ia2    ];                                        */
/*            si2 = w[2 * ia2 + 1];                                        */
/*            co3 = w[2 * ia3    ];                                        */
/*            si3 = w[2 * ia3 + 1];                                        */
/*            ia1 = ia1 + ie;                                              */
/*            for (i0 = j; i0 < n; i0 += n1)                               */
/*            {                                                            */
/*                i1 = i0 + n2;                                            */
/*                i2 = i1 + n2;                                            */
/*                i3 = i2 + n2;                                            */
/*                                                                         */
/*                xh0  = x[2 * i0    ] + x[2 * i2    ];                    */
/*                xh1  = x[2 * i0 + 1] + x[2 * i2 + 1];                    */
/*                xl0  = x[2 * i0    ] - x[2 * i2    ];                    */
/*                xl1  = x[2 * i0 + 1] - x[2 * i2 + 1];                    */
/*                                                                         */
/*                xh20 = x[2 * i1    ] + x[2 * i3    ];                    */
/*                xh21 = x[2 * i1 + 1] + x[2 * i3 + 1];                    */
/*                xl20 = x[2 * i1    ] - x[2 * i3    ];                    */
/*                xl21 = x[2 * i1 + 1] - x[2 * i3 + 1];                    */
/*                                                                         */
/*                x[2 * i0    ] = (xh0 + xh20 + 1)>>1;                     */
/*                x[2 * i0 + 1] = (xh1 + xh21 + 1)>>1;                     */
/*                                                                         */
/*                xt0  = xh0 - xh20;                                       */
/*                yt0  = xh1 - xh21;                                       */
/*                xt1  = xl0 + xl21;                                       */
/*                yt2  = xl1 + xl20;                                       */
/*                xt2  = xl0 - xl21;                                       */
/*                yt1  = xl1 - xl20;                                       */
/*                                                                         */
/*                x[2 * i2    ]= (xt1 * co1 + yt1 * si1 + 0x00008000)>> 16 */
/*                x[2 * i2 + 1]= (yt1 * co1 - xt1 * si1 + 0x00008000)>> 16 */
/*                x[2 * i1    ]= (xt0 * co2 + yt0 * si2 + 0x00008000)>> 16 */
/*                x[2 * i1 + 1]= (yt0 * co2 - xt0 * si2 + 0x00008000)>> 16 */
/*                x[2 * i3    ]= (xt2 * co3 + yt2 * si3 + 0x00008000)>> 16 */
/*                x[2 * i3 + 1]= (yt2 * co3 - xt2 * si3 + 0x00008000)>> 16 */
/*            }                                                            */
/*        }                                                                */
/*                                                                         */
/*        ie <<= 2;                                                        */
/*    }                                                                    */
/*                                                                         */
/*    j = 0;                                                               */
/*    ptr_x0 = x;                                                          */
/*    y0 = y;                                                              */
/*    l0 = _norm(n) - 17;                                                  */
/*                                                                         */
/*    if(radix == 2 || radix  == 4) for (i = 0; i < n; i += 4)             */
/*    {                                                                    */
/*                                                                         */
/*                                                                         */
/*            j0 = (j     ) & 0x3F;                                        */
/*            j1 = (j >> 6) & 0x3F;                                        */
/*            k0 = _bitr(j0) << 10;                                        */
/*            k1 = _bitr(j1) << 10 ;                                       */
/*            k = (k0 << 6) |  k1;                                         */
/*            if (l0 < 0) k = k << -l0;                                    */
/*            else        k = k >> l0;                                     */
/*            j++;                                                         */
/*                                                                         */
/*            x0   = ptr_x0[0];  x1 = ptr_x0[1];                           */
/*            x2   = ptr_x0[2];  x3 = ptr_x0[3];                           */
/*            x4   = ptr_x0[4];  x5 = ptr_x0[5];                           */
/*            x6   = ptr_x0[6];  x7 = ptr_x0[7];                           */
/*            ptr_x0 += 8;                                                 */
/*                                                                         */
/*            xh0_0  = x0 + x4;                                            */
/*            xh1_0  = x1 + x5;                                            */
/*            xh0_1  = x2 + x6;                                            */
/*            xh1_1  = x3 + x7;                                            */
/*                                                                         */
/*            if (radix == 2)                                              */
/*            {                                                            */
/*                xh0_0 = x0;                                              */
/*                xh1_0 = x1;                                              */
/*                xh0_1 = x2;                                              */
/*                xh1_1 = x3;                                              */
/*            }                                                            */
/*                                                                         */
/*            yt0  = xh0_0 + xh0_1;                                        */
/*            yt1  = xh1_0 + xh1_1;                                        */
/*            yt4  = xh0_0 - xh0_1;                                        */
/*            yt5  = xh1_0 - xh1_1;                                        */
/*                                                                         */
/*            xl0_0  = x0 - x4;                                            */
/*            xl1_0  = x1 - x5;                                            */
/*            xl0_1  = x2 - x6;                                            */
/*            xl1_1  = x3 - x7;                                            */
/*                                                                         */
/*            if (radix == 2)                                              */
/*            {                                                            */
/*                  xl0_0 = x4;                                            */
/*                  xl1_0 = x5;                                            */
/*                  xl1_1 = x6;                                            */
/*                  xl0_1 = x7;                                            */
/*            }                                                            */
/*                                                                         */
/*            yt2  = xl0_0 + xl1_1;                                        */
/*            yt3  = xl1_0 - xl0_1;                                        */
/*                                                                         */
/*            yt6  = xl0_0 - xl1_1;                                        */
/*            yt7  = xl1_0 + xl0_1;                                        */
/*                                                                         */
/*            if (radix == 2)                                              */
/*            {                                                            */
/*                 yt7  = xl1_0 - xl0_1;                                   */
/*                 yt3  = xl1_0 + xl0_1;                                   */
/*            }                                                            */
/*                                                                         */
/*            y0[k] = yt0; y0[k+1] = yt1;                                  */
/*            k += n>>1                                                    */
/*            y0[k] = yt2; y0[k+1] = yt3;                                  */
/*            k += n>>1;                                                   */
/*            y0[k] = yt4; y0[k+1] = yt5;                                  */
/*            k += n>>1;                                                   */
/*            y0[k] = yt6; y0[k+1] = yt7;                                  */
/*       }                                                                 */
/*   }                                                                     */
/*                                                                         */
/*      Although code shown above is the simplest equivalent way of writin */
/*      this code, it already carries several optimization ideas. It has   */
/*      a special last stage to avoid multiplication by 1. In addition it  */
/*      was shown by Panos Papamichalis that if the two middle legs of a   */
/*      radix 4 butterfly are reversed, the outputs for a radix4 transform */
/*      end up in the bit reversed fashion. The code also carries a linear */
/*      time look up table for bit reversal. This can be used as shown in  */
/*      the code to construct a bit reversed index. The last stage perfo-  */
/*      rms either a radix4 or radix2 as the case may be.                  */
/*                                                                         */
/*      The code shown below performs loop coalescing as it is realized    */
/*      that while the "i" and "j" loop individually iterate for variable  */
/*      number of times, together they always iterate for N/4 times. The   */
/*      natural C code and the code shown below use a modified twiddle     */
/*      factor array to allow for vectorization of the loop. In addition   */
/*      bit-reversal is performed by a macro BIT_REV. This makes the bit-  */
/*      reversal table redundant.                                          */
/*                                                                         */
/*      This is the C equivalent of the assembly code without restrictions */
/*      Note that the assembly code is hand optimized and restrictions may */
/*      apply.                                                             */
/*                                                                         */
/*                                                                         */
/*      void fft16x16r_i (int n, short ptr_x[], short ptr_w[],             */
/*                   short ptr_y[], int n_min, int offset, int n_max       */
/*      {                                                                  */
/*        int  i, j, k, l1, l2, h2, predj;                                 */
/*        int  tw_offset, stride, fft_jmp;                                 */
/*                                                                         */
/*        short x0, x1, x2, x3,x4,x5,x6,x7;                                */
/*        short xt0, yt0, xt1, yt1, xt2, yt2, yt3;                         */
/*        short yt4, yt5, yt6, yt7;                                        */
/*        short si1,si2,si3,co1,co2,co3;                                   */
/*        short xh0,xh1,xh20,xh21,xl0,xl1,xl20,xl21;                       */
/*        short x_0, x_1, x_l1, x_l1p1, x_h2 , x_h2p1, x_l2, x_l2p1;       */
/*        short xl0_0, xl1_0, xl0_1, xl1_1;                                */
/*        short xh0_0, xh1_0, xh0_1, xh1_1;                                */
/*        short *x,*w;                                                     */
/*        int   k0, k1, j0, j1, l0, radix;                                 */
/*        short * y0, * ptr_x0, * ptr_x2;                                  */
/*                                                                         */
/*        radix = n_min;                                                   */
/*                                                                         */
/*        stride = n; -* n is the number of complex samples *-             */
/*        tw_offset = 0;                                                   */
/*        while (stride > radix)                                           */
/*        {                                                                */
/*            j = 0;                                                       */
/*            fft_jmp = stride + (stride>>1);                              */
/*            h2 = stride>>1;                                              */
/*            l1 = stride;                                                 */
/*            l2 = stride + (stride>>1);                                   */
/*            x = ptr_x;                                                   */
/*            w = ptr_w + tw_offset;                                       */
/*                                                                         */
/*            for (i = 0; i < n; i += 4)                                   */
/*            {                                                            */
/*                co1 = w[j];                                              */
/*                si1 = w[j+1];                                            */
/*                co2 = w[j+2];                                            */
/*                si2 = w[j+3];                                            */
/*                co3 = w[j+4];                                            */
/*                si3 = w[j+5];                                            */
/*                                                                         */
/*                x_0    = x[0];                                           */
/*                x_1    = x[1];                                           */
/*                x_h2   = x[h2];                                          */
/*                x_h2p1 = x[h2+1];                                        */
/*                x_l1   = x[l1];                                          */
/*                x_l1p1 = x[l1+1];                                        */
/*                x_l2   = x[l2];                                          */
/*                x_l2p1 = x[l2+1];                                        */
/*                                                                         */
/*                xh0  = x_0    + x_l1;                                    */
/*                xh1  = x_1    + x_l1p1;                                  */
/*                xl0  = x_0    - x_l1;                                    */
/*                xl1  = x_1    - x_l1p1;                                  */
/*                                                                         */
/*                xh20 = x_h2   + x_l2;                                    */
/*                xh21 = x_h2p1 + x_l2p1;                                  */
/*                xl20 = x_h2   - x_l2;                                    */
/*                xl21 = x_h2p1 - x_l2p1;                                  */
/*                                                                         */
/*                ptr_x0 = x;                                              */
/*                ptr_x0[0] = ((short) (xh0 + xh20))>>1; can be changed to */
/*                ptr_x0[1] = ((short) (xh1 + xh21))>>1; can be changed to */
/*                                                                         */
/*                ptr_x2 = ptr_x0;                                         */
/*                x += 2;                                                  */
/*                j += 6;                                                  */
/*                predj = (j - fft_jmp);                                   */
/*                if (!predj) x += fft_jmp;                                */
/*                if (!predj) j = 0;                                       */
/*                                                                         */
/*                xt0 = xh0 - xh20;                                        */
/*                yt0 = xh1 - xh21;                                        */
/*                xt1 = xl0 + xl21;                                        */
/*                yt2 = xl1 + xl20;                                        */
/*                xt2 = xl0 - xl21;                                        */
/*                yt1 = xl1 - xl20;                                        */
/*                                                                         */
/*                ptr_x2[l1  ] = (xt1 * co1 + yt1 * si1 + 0x8000)>>16;     */
/*                ptr_x2[l1+1] = (yt1 * co1 - xt1 * si1 + 0x8000)>>16;     */
/*                ptr_x2[h2  ] = (xt0 * co2 + yt0 * si2 + 0x8000)>>16;     */
/*                ptr_x2[h2+1] = (yt0 * co2 - xt0 * si2 + 0x8000)>>16;     */
/*                ptr_x2[l2  ] = (xt2 * co3 + yt2 * si3 + 0x8000)>>16;     */
/*                ptr_x2[l2+1] = (yt2 * co3 - xt2 * si3 + 0x8000)>>16;     */
/*            }                                                            */
/*            tw_offset += fft_jmp;                                        */
/*            stride = stride>>2;                                          */
/*        }-* end while *-                                                 */
/*                                                                         */
/*        j = offset>>2;                                                   */
/*                                                                         */
/*        ptr_x0 = ptr_x;                                                  */
/*        y0 = ptr_y;                                                      */
/*        l0 = _norm(nmax) - 17; -* get size of fft *-                     */
/*                                                                         */
/*        if (radix <= 4) for (i = 0; i < n; i += 4)                       */
/*        {                                                                */
/*                -* reversal computation *-                               */
/*                                                                         */
/*                j0 = (j     ) & 0x3F;                                    */
/*                j1 = (j >> 6) & 0x3F;                                    */
/*                k0 = _bitr(j0) << 10;                                    */
/*                k1 = _bitr(j1) << 10;                                    */
/*                k = (k0 << 6) |  k1;                                     */
/*                k = k >> l0;                                             */
/*                j++;        -* multiple of 4 index *-                    */
/*                                                                         */
/*                x0   = ptr_x0[0];  x1 = ptr_x0[1];                       */
/*                x2   = ptr_x0[2];  x3 = ptr_x0[3];                       */
/*                x4   = ptr_x0[4];  x5 = ptr_x0[5];                       */
/*                x6   = ptr_x0[6];  x7 = ptr_x0[7];                       */
/*                ptr_x0 += 8;                                             */
/*                                                                         */
/*                xh0_0  = x0 + x4;                                        */
/*                xh1_0  = x1 + x5;                                        */
/*                xh0_1  = x2 + x6;                                        */
/*                xh1_1  = x3 + x7;                                        */
/*                                                                         */
/*                if (radix == 2) {                                        */
/*                  xh0_0 = x0;                                            */
/*                  xh1_0 = x1;                                            */
/*                  xh0_1 = x2;                                            */
/*                  xh1_1 = x3;                                            */
/*                }                                                        */
/*                                                                         */
/*                yt0  = xh0_0 + xh0_1;                                    */
/*                yt1  = xh1_0 + xh1_1;                                    */
/*                yt4  = xh0_0 - xh0_1;                                    */
/*                yt5  = xh1_0 - xh1_1;                                    */
/*                                                                         */
/*                xl0_0  = x0 - x4;                                        */
/*                xl1_0  = x1 - x5;                                        */
/*                xl0_1  = x2 - x6;                                        */
/*                xl1_1  = x3 - x7;                                        */
/*                                                                         */
/*                if (radix == 2) {                                        */
/*                  xl0_0 = x4;                                            */
/*                  xl1_0 = x5;                                            */
/*                  xl1_1 = x6;                                            */
/*                  xl0_1 = x7;                                            */
/*                }                                                        */
/*                                                                         */
/*                yt2  = xl0_0 + xl1_1;                                    */
/*                yt3  = xl1_0 - xl0_1;                                    */
/*                yt6  = xl0_0 - xl1_1;                                    */
/*                yt7  = xl1_0 + xl0_1;                                    */
/*                                                                         */
/*                if (radix == 2) {                                        */
/*                  yt7  = xl1_0 - xl0_1;                                  */
/*                  yt3  = xl1_0 + xl0_1;                                  */
/*                }                                                        */
/*                                                                         */
/*                y0[k] = yt0; y0[k+1] = yt1;                              */
/*                k += n>>1;                                               */
/*                y0[k] = yt2; y0[k+1] = yt3;                              */
/*                k += n>>1;                                               */
/*                y0[k] = yt4; y0[k+1] = yt5;                              */
/*                k += n>>1;                                               */
/*                y0[k] = yt6; y0[k+1] = yt7;                              */
/*        }                                                                */
/*     }                                                                   */
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

#pragma CODE_SECTION(DSP_fft16x16r_i, ".text:optimized");

#include "DSP_fft16x16r_i.h"

static inline void radix_2(short *restrict ptr_x, short *restrict ptr_y, int n, int offset, int n_max);
static inline void radix_4(short *restrict ptr_x, short *restrict ptr_y, int n, int offset, int n_max);

#ifdef _LITTLE_ENDIAN
void DSP_fft16x16r_i (
    int n,
    short * restrict ptr_x,
    const short * restrict ptr_w,
    short * restrict ptr_y,
    int radix,
    int offset,
    int n_max
)
{
    const short * restrict w;
    short * restrict x, * restrict x2, * restrict x0;

    unsigned int j;

    int i, l1;
    int l2, h2, fft_jmp;
    int predj, tw_offset, stride;
    int x_1_x_0, x_3_x_2, x_1o_x_0o, x_3o_x_2o;
    int xh2_1_xh2_0, xh2_3_xh2_2, xl0_0_xl1_0, xl0_1_xl1_1;
    int xl1_1_xl1_0, xl1_3_xl1_2, xl2_1_xl2_0, xl2_3_xl2_2;

    unsigned int xl1_1_0, xl1_3_2, xl2_1_0, xl2_3_2;
    unsigned int xh2_1_0, xh2_3_2;
    unsigned int myt0_0_mxt0_0, myt0_1_mxt0_1;
    unsigned int xt1_0_yt2_0, xt1_1_yt2_1, xt2_0_yt1_0, xt2_1_yt1_1;
    unsigned int yt1_0_xt1_0, yt1_1_xt1_1, yt2_0_xt2_0, yt2_1_xt2_1;

    unsigned int co11_si11, co10_si10, co21_si21;
    unsigned int co20_si20, co30_si30, co31_si31;

    unsigned int xh1_0_xh0_0, xh1_1_xh0_1, xh21_0_xh20_0;
    unsigned int xh21_1_xh20_1;
    unsigned int xl1_0_xl0_0, xl1_1_xl0_1, xl21_0_xl20_0, xl21_1_xl20_1;

    double co11si11_co10si10, co21si21_co20si20, co31si31_co30si30;
    double x_l1_32_x_l1_10, x_l2_32_x_l2_10, x_h2_32_x_h2_10;
    double x_32_x_10;

    long long xh1_0_xh0_0_xl1_0_xl0_0, xh1_1_xh0_1_xl1_1_xl0_1;
    long long xh21_0_xh20_0_xl21_0_xl20_0, xh21_1_xh20_1_xl21_1_xl20_1;
    long long xt1_0_yt2_0_xt2_0_yt1_0, xt1_1_yt2_1_xt2_1_yt1_1;
    long long yt1_0_xt1_0_yt2_0_xt2_0, yt1_1_xt1_1_yt2_1_xt2_1;

    /*----------------------------------------------------------------------*/
    /* The stride is quartered with every iteration of the outer loop. It   */
    /* denotes the seperation between any two adjacent inputs to the butter */
    /* -fly. This should start out at N/4, hence stride is initially set to */
    /* N. For every stride, 6*stride twiddle factors are accessed. The      */
    /* "tw_offset" is the offset within the current twiddle factor sub-     */
    /* table. This is set to zero, at the start of the code and is used to  */
    /* obtain the appropriate sub-table twiddle pointer by offseting it     */
    /* with the base pointer "ptr_w".                                       */
    /*----------------------------------------------------------------------*/
    stride = n;
    tw_offset = 0;
    fft_jmp = 6 * stride;

    _nassert(stride > 4);
    #pragma MUST_ITERATE(1,,1);

    while (stride > radix) {
        /*-----------------------------------------------------------------*/
        /* At the start of every iteration of the outer loop, "j" is set   */
        /* to zero, as "w" is pointing to the correct location within the  */
        /* twiddle factor array. For every iteration of the inner loop     */
        /* 6 * stride twiddle factors are accessed. For eg,                */
        /*                                                                 */
        /* #Iteration of outer loop  # twiddle factors    #times cycled    */
        /*  1                          6 N/4               1               */
        /*  2                          6 N/16              4               */
        /*  ...                                                            */
        /*-----------------------------------------------------------------*/
        j =  0;
        fft_jmp >>= 2;

        /*-----------------------------------------------------------------*/
        /* Set up offsets to access "N/4", "N/2", "3N/4" complex point or  */
        /* "N/2", "N", "3N/2" half word                                    */
        /*-----------------------------------------------------------------*/
        h2 = stride >> 1;
        l1 = stride;
        l2 = stride + (stride >> 1);

        /*-----------------------------------------------------------------*/
        /*  Reset "x" to point to the start of the input data array.       */
        /* "tw_offset" starts off at 0, and increments by "6 * stride"     */
        /*  The stride quarters with every iteration of the outer loop     */
        /*-----------------------------------------------------------------*/
        x = ptr_x;
        w = ptr_w + tw_offset;
        tw_offset += fft_jmp;

        stride >>= 2;

        /*----------------------------------------------------------------*/
        /* The following loop iterates through the different butterflies, */
        /* within a given stage. Recall that there are logN to base 4     */
        /* stages. Certain butterflies share the twiddle factors. These   */
        /* are grouped together. On the very first stage there are no     */
        /* butterflies that share the twiddle factor, all N/4 butter-     */
        /* flies have different factors. On the next stage two sets of    */
        /* N/8 butterflies share the same twiddle factor. Hence after     */
        /* half the butterflies are performed, j the index into the       */
        /* factor array resets to 0, and the twiddle factors are reused.  */
        /* When this happens, the data pointer 'x' is incremented by the  */
        /* fft_jmp amount. In addition the following code is unrolled to  */
        /* perform "2" radix4 butterflies in parallel.                    */
        /*----------------------------------------------------------------*/
        _nassert((int)(w) % 8 == 0);
        _nassert((int)(x) % 8 == 0);
        _nassert(h2 % 8 == 0);
        _nassert(l1 % 8 == 0);
        _nassert(l2 % 8 == 0);
        _nassert(n >= 16);
        #pragma MUST_ITERATE(2,,2);
        for (i = 0; i < n; i += 8) {
            /*------------------------------------------------------------*/
            /* Read the first 12 twiddle factors, six of which are used   */
            /* for one radix 4 butterfly and six of which are used for    */
            /* next one.                                                  */
            /*                                                            */
            /*  co10 = w[j+1];        si10 = w[j+0];                      */
            /*  co11 = w[j+3];        si11 = w[j+2];                      */
            /*  co20 = w[j+5];        si20 = w[j+4];                      */
            /*  co21 = w[j+7];        si21 = w[j+6];                      */
            /*  co30 = w[j+9];        si30 = w[j+8];                      */
            /*  co31 = w[j+11];       si31 = w[j+10];                     */
            /*                                                            */
            /*  The code shown above performs half word wide loads. The   */
            /*  C64x can perform double word wide loads. This is done by  */
            /*  the use of the _amemd8_const intrinsic. The const quali-  */
            /*  fies the fact that this array will only be read from and  */
            /*  not written to.                                           */
            /*------------------------------------------------------------*/
            co11si11_co10si10 = _amemd8_const(&w[j]);
            co21si21_co20si20 = _amemd8_const(&w[j + 4]);
            co31si31_co30si30 = _amemd8_const(&w[j + 8]);

            /*-------------------------------------------------------------*/
            /* Access low and high halves using the _lo and _hi intrinsics */
            /* to obtain the individual 32 bit values. Each 32 bit value   */
            /* contains a packed twiddle factor of the form co_xxsi_xx     */
            /*-------------------------------------------------------------*/
            co10_si10 = _lo(co11si11_co10si10);
            co11_si11 = _hi(co11si11_co10si10);
            co20_si20 = _lo(co21si21_co20si20);
            co21_si21 = _hi(co21si21_co20si20);
            co30_si30 = _lo(co31si31_co30si30);
            co31_si31 = _hi(co31si31_co30si30);

            /*------------------------------------------------------------*/
            /* Read in the first complex input for the butterflies.       */
            /* 1st complex input to 1st butterfly: x[0] + jx[1]           */
            /* 1st complex input to 2nd butterfly: x[2] + jx[3]           */
            /* Read in the complex inputs for the butterflies. Each of the*/
            /* successive complex inputs of the butterfly are seperated   */
            /* by a fixed amount known as stride. The stride starts out   */
            /* at N/4, and quarters with every stage.                     */
            /*                                                            */
            /*  x_0    =   x[0];          x_1    =   x[1];                */
            /*  x_2    =   x[2];          x_3    =   x[3];                */
            /*  x_l1_0 =   x[l1  ];       x_l1_1 =   x[l1 + 1];           */
            /*  x_l1_2 =   x[l1 + 2];     x_l1_3 =   x[l1 + 3];           */
            /*  x_l2_0 =   x[l2  ];       x_l2_1 =   x[l2 + 1];           */
            /*  x_l2_2 =   x[l2 + 2];     x_l2_3 =   x[l2 + 3];           */
            /*  x_h2_0 =   x[h2  ];       x_h2_1 =   x[h2 + 1];           */
            /*  x_h2_2 =   x[h2 + 2];     x_h2_3 =   x[h2 + 3];           */
            /*                                                            */
            /* These loads are performed using _amemd8. Note that there   */
            /* is no const qualifier in this case as this loop writes     */
            /* back results into the data array "x". The "a" in _amemd8   */
            /* qualifies the fact that the loads are aligned.             */
            /*------------------------------------------------------------*/
            x_32_x_10       = _amemd8(&x[0]);
            x_l1_32_x_l1_10 = _amemd8(&x[l1]);
            x_l2_32_x_l2_10 = _amemd8(&x[l2]);
            x_h2_32_x_h2_10 = _amemd8(&x[h2]);

            /*------------------------------------------------------------*/
            /*  Access the low and high halves using the _lo and _hi      */
            /*  intrinsic. This helps to obtain the individual "32" bit   */
            /*  quantities from a 64 bit wide double word.                */
            /*------------------------------------------------------------*/
            x_1_x_0     = _lo(x_32_x_10);
            x_3_x_2     = _hi(x_32_x_10);
            xl1_1_xl1_0 = _lo(x_l1_32_x_l1_10);
            xl1_3_xl1_2 = _hi(x_l1_32_x_l1_10);
            xl2_1_xl2_0 = _lo(x_l2_32_x_l2_10);
            xl2_3_xl2_2 = _hi(x_l2_32_x_l2_10);
            xh2_1_xh2_0 = _lo(x_h2_32_x_h2_10);
            xh2_3_xh2_2 = _hi(x_h2_32_x_h2_10);

            /*-----------------------------------------------------------*/
            /* Two butterflies are evaluated in parallel. The following  */
            /* results will be shown for one butterfly only, although    */
            /* both are being evaluated in parallel.                     */
            /*                                                           */
            /* Perform radix2 style DIF butterflies.                     */
            /*                                                           */
            /*  xh0_0  = x_0    + x_l1_0;     xh1_0  = x_1    + x_l1_1;  */
            /*  xh0_1  = x_2    + x_l1_2;     xh1_1  = x_3    + x_l1_3;  */
            /*  xl0_0  = x_0    - x_l1_0;     xl1_0  = x_1    - x_l1_1;  */
            /*  xl0_1  = x_2    - x_l1_2;     xl1_1  = x_3    - x_l1_3;  */
            /*  xh20_0 = x_h2_0 + x_l2_0;     xh21_0 = x_h2_1 + x_l2_1;  */
            /*  xh20_1 = x_h2_2 + x_l2_2;     xh21_1 = x_h2_3 + x_l2_3;  */
            /*  xl20_0 = x_h2_0 - x_l2_0;     xl21_0 = x_h2_1 - x_l2_1;  */
            /*  xl20_1 = x_h2_2 - x_l2_2;     xl21_1 = x_h2_3 - x_l2_3;  */
            /*                                                           */
            /*  These are done using packed data processing, and these   */
            /*  are done using _add2, _sub2.                             */
            /*  For example "xh1_0_xh0_0" has a packed value xh1_0,      */
            /*  xh0_0.                                                   */
            /*-----------------------------------------------------------*/
            xh1_0_xh0_0_xl1_0_xl0_0 = _addsub2(x_1_x_0, xl1_1_xl1_0);
            xh1_1_xh0_1_xl1_1_xl0_1 = _addsub2(x_3_x_2, xl1_3_xl1_2);

            xh1_0_xh0_0 = _hill(xh1_0_xh0_0_xl1_0_xl0_0);
            xh1_1_xh0_1 = _hill(xh1_1_xh0_1_xl1_1_xl0_1);
            xl1_0_xl0_0 = _loll(xh1_0_xh0_0_xl1_0_xl0_0);
            xl1_1_xl0_1 = _loll(xh1_1_xh0_1_xl1_1_xl0_1);

            xh21_0_xh20_0_xl21_0_xl20_0 = _addsub2(xh2_1_xh2_0, xl2_1_xl2_0);
            xh21_1_xh20_1_xl21_1_xl20_1 = _addsub2(xh2_3_xh2_2, xl2_3_xl2_2);

            xh21_0_xh20_0 = _hill(xh21_0_xh20_0_xl21_0_xl20_0);
            xh21_1_xh20_1 = _hill(xh21_1_xh20_1_xl21_1_xl20_1);
            xl21_0_xl20_0 = _loll(xh21_0_xh20_0_xl21_0_xl20_0);
            xl21_1_xl20_1 = _loll(xh21_1_xh20_1_xl21_1_xl20_1);

            /*----------------------------------------------------------*/
            /* Derive output pointers using the input pointer "x"       */
            /*----------------------------------------------------------*/
            x0 = (short *)_mvd((int)x);
            x2 = (short *)_mvd((int)x0);

            /*-----------------------------------------------------------*/
            /* When the twiddle factors are not to be re-used, j is      */
            /* incremented by 12, to reflect the fact that 12 half words */
            /* are consumed in every iteration. The input data pointer   */
            /* increments by 4. Note that within a stage, the stride     */
            /* does not change and hence the offsets for the other three */
            /* legs, 0, h2, l1, l2.                                      */
            /*-----------------------------------------------------------*/
            j += 12;
            x += 4;

            predj = (j - fft_jmp);
            if (!predj) x += fft_jmp;
            if (!predj) j = 0;

            /*----------------------------------------------------------*/
            /* These four partial results can be re-written to show     */
            /* the underlying DIF structure similar to radix2 as        */
            /* follows:                                                 */
            /*                                                          */
            /* X(4k)  = (x(n)+x(n + N/2)) + (x(n+N/4)+ x(n + 3N/4))     */
            /* X(4k+1)= (x(n)-x(n + N/2)) -j(x(n+N/4) - x(n + 3N/4))    */
            /* x(4k+2)= (x(n)+x(n + N/2)) - (x(n+N/4)+ x(n + 3N/4))     */
            /* X(4k+3)= (x(n)-x(n + N/2)) +j(x(n+N/4) - x(n + 3N/4))    */
            /*                                                          */
            /* which leads to the real and imaginary values as foll:    */
            /*                                                          */
            /* y0r = x0r + x2r +  x1r +  x3r    =  xh0 + xh20           */
            /* y0i = x0i + x2i +  x1i +  x3i    =  xh1 + xh21           */
            /* y1r = x0r - x2r + (x1i -  x3i)   =  xl0 + xl21           */
            /* y1i = x0i - x2i - (x1r -  x3r)   =  xl1 - xl20           */
            /* y2r = x0r + x2r - (x1r +  x3r)   =  xh0 - xh20           */
            /* y2i = x0i + x2i - (x1i +  x3i    =  xh1 - xh21           */
            /* y3r = x0r - x2r - (x1i -  x3i)   =  xl0 - xl21           */
            /* y3i = x0i - x2i + (x1r -  x3r)   =  xl1 + xl20           */
            /*                                                          */
            /* Note that in this version of the code both rounding and  */
            /* scaling are implemented.                                 */
            /* ---------------------------------------------------------*/
            /*----------------------------------------------------------*/
            /* x0[0] = (xh0_0 + xh20_0 + 1) >> 1;                       */
            /* x0[1] = (xh1_0 + xh21_0 + 1) >> 1;                       */
            /* x0[2] = (xh0_1 + xh20_1 + 1) >> 1;                       */
            /* x0[3] = (xh1_1 + xh21_1 + 1) >> 1;                       */
            /*                                                          */
            /* "y0x0" and "y1x1" are the first four outputs of the      */
            /*  radix4 butterfly. These are computed on the C64x        */
            /* using _avg2.                                             */
            /*----------------------------------------------------------*/
            x_1o_x_0o = _avg2(xh21_0_xh20_0, xh1_0_xh0_0);
            x_3o_x_2o = _avg2(xh21_1_xh20_1, xh1_1_xh0_1);

            /*----------------------------------------------------------*/
            /* Perform one more stage of radix2 decompositions as shown */
            /* These are performed using packed data processing.        */
            /*                                                          */
            /* xt0_0 = xh0_0 - xh20_0;  yt0_0 = xh1_0 - xh21_0;         */
            /* xt0_1 = xh0_1 - xh20_1;  yt0_1 = xh1_1 - xh21_1;         */
            /* xt1_0 = xl0_0 + xl21_0;  yt2_0 = xl1_0 + xl20_0;         */
            /* xt2_0 = xl0_0 - xl21_0;  yt1_0 = xl1_0 - xl20_0;         */
            /* xt1_1 = xl0_1 + xl21_1;  yt2_1 = xl1_1 + xl20_1;         */
            /* xt2_1 = xl0_1 - xl21_1;  yt1_1 = xl1_1 - xl20_1;         */
            /*                                                          */
            /*----------------------------------------------------------*/
            myt0_0_mxt0_0 = _sub2(xh21_0_xh20_0, xh1_0_xh0_0);
            myt0_1_mxt0_1 = _sub2(xh21_1_xh20_1, xh1_1_xh0_1);

            /*----------------------------------------------------------*/
            /* Repack coefficients to sustain packed data processing.   */
            /* This requires a swizzle so that intermediate results     */
            /* end up in the right spot. This is needed to compute      */
            /* other intermediate results using add2 and sub2.          */
            /*----------------------------------------------------------*/
            xl0_0_xl1_0 = _packlh2(xl1_0_xl0_0, xl1_0_xl0_0);
            xl0_1_xl1_1 = _packlh2(xl1_1_xl0_1, xl1_1_xl0_1);

            //;----------------------------------------------------------;
            //; xt1_0 = xl0_0 + xl21_0   yt2_0 = xl1_0 + xl20_0          ;
            //; xt1_1 = xl0_1 + xl21_1   yt2_1 = xl1_1 + xl20_1          ;
            //; xt2_0 = xl0_0 - xl21_0   yt1_0 = xl1_0 - xl20_0          ;
            //; xt2_1 = xl0_1 - xl21_1   yt1_1 = xl1_1 - xl20_1          ;
            //;----------------------------------------------------------;
            xt1_0_yt2_0_xt2_0_yt1_0 = _addsub2(xl0_0_xl1_0, xl21_0_xl20_0);
            xt1_1_yt2_1_xt2_1_yt1_1 = _addsub2(xl0_1_xl1_1, xl21_1_xl20_1);

            xt1_0_yt2_0 = _hill(xt1_0_yt2_0_xt2_0_yt1_0);
            xt1_1_yt2_1 = _hill(xt1_1_yt2_1_xt2_1_yt1_1);
            xt2_0_yt1_0 = _loll(xt1_0_yt2_0_xt2_0_yt1_0);
            xt2_1_yt1_1 = _loll(xt1_1_yt2_1_xt2_1_yt1_1);

            /*----------------------------------------------------------*/
            /* Repack results so that xt_XXyt_XX are a packed  32 bit   */
            /* quantity. The operations performed above tend to leave   */
            /* the results as xt_XXyt_YY and xt_YYyt_XX. This is where  */
            /* the packed instructions come in handy. For example       */
            /* xt_XXyt_XX = -packlh2(xt_XXyt_YY, xt_YY, yt_XX)          */
            /*----------------------------------------------------------*/
            yt1_0_xt1_0_yt2_0_xt2_0 = _dpackx2(xt1_0_yt2_0, xt2_0_yt1_0);
            yt1_1_xt1_1_yt2_1_xt2_1 = _dpackx2(xt1_1_yt2_1, xt2_1_yt1_1);

            yt1_0_xt1_0 = _hill(yt1_0_xt1_0_yt2_0_xt2_0);
            yt1_1_xt1_1 = _hill(yt1_1_xt1_1_yt2_1_xt2_1);
            yt2_0_xt2_0 = _loll(yt1_0_xt1_0_yt2_0_xt2_0);
            yt2_1_xt2_1 = _loll(yt1_1_xt1_1_yt2_1_xt2_1);

            /*---------------------------------------------------------*/
            /* Notice that in this version of the code the two middle  */
            /* legs are swapped as indicated by the stores to x[l1]..  */
            /* x[l1 + 3] which preceede the stores to x[h2]..x[h2 + 3] */
            /* This reversal guarantees that a radix4 DIF butterfly    */
            /* produces results in digit reversed order. Note that in  */
            /* addition to the rounding, the shift is performed by 16, */
            /* as opposed to 15, to give scaling.                      */
            /*                                                         */
            /* x2[l1  ] = (si10 * yt1_0 + co10 * xt1_0 + 0x4000) >> 16;*/
            /* x2[l1+1] = (co10 * yt1_0 - si10 * xt1_0 + 0x4000) >> 16;*/
            /* x2[l1+2] = (si11 * yt1_1 + co11 * xt1_1 + 0x4000) >> 16;*/
            /* x2[l1+3] = (co11 * yt1_1 - si11 * xt1_1 + 0x4000) >> 16;*/
            /*                                                         */
            /* These four results are retained in registers and a      */
            /* double word is formed so that it can be stored with     */
            /* one STDW.                                               */
            /*---------------------------------------------------------*/
            xh2_1_0 = _cmpyr(co10_si10, yt1_0_xt1_0);
            xh2_3_2 = _cmpyr(co11_si11, yt1_1_xt1_1);

            /*---------------------------------------------------------*/
            /* The following code computes intermediate results for:   */
            /*                                                         */
            /* x2[h2  ] = (si20 * yt0_0 + co20 * xt0_0 + 0x4000) >> 16;*/
            /* x2[h2+1] = (co20 * yt0_0 - si20 * xt0_0 + 0x4000) >> 16;*/
            /* x2[h2+2] = (si21 * yt0_1 + co21 * xt0_1 + 0x4000) >> 16;*/
            /* x2[h2+3] = (co21 * yt0_1 - si21 * xt0_1 + 0x4000) >> 16;*/
            /*---------------------------------------------------------*/
            xl1_1_0 = _cmpyr(co20_si20, myt0_0_mxt0_0);
            xl1_3_2 = _cmpyr(co21_si21, myt0_1_mxt0_1);

            /*---------------------------------------------------------*/
            /* The following code computes intermediate results for:   */
            /*                                                         */
            /* x2[l2  ] = (si30 * yt2_0 + co30 * xt2_0 + 0x4000) >> 16;*/
            /* x2[l2+1] = (co30 * yt2_0 - si30 * xt2_0 + 0x4000) >> 16;*/
            /* x2[l2+2] = (si31 * yt2_1 + co31 * xt2_1 + 0x4000) >> 16;*/
            /* x2[l2+3] = (co31 * yt2_1 - si31 * xt2_1 + 0x4000) >> 16;*/
            /*---------------------------------------------------------*/
            xl2_1_0 = _cmpyr(co30_si30, yt2_0_xt2_0);
            xl2_3_2 = _cmpyr(co31_si31, yt2_1_xt2_1);

            /*---------------------------------------------------------*/
            /* Store out the outputs to the four legs of the butterfly */
            /* using aligned store double words. Notice the use of the */
            /* indices "l1", "l2", "h2" to derive the pointers for the */
            /* legs of the butterfly.                                  */
            /*---------------------------------------------------------*/
            _amemd8(&x2[0])  = _itod(x_3o_x_2o, x_1o_x_0o);
            _amemd8(&x2[h2]) = _itod(xl1_3_2, xl1_1_0);
            _amemd8(&x2[l1]) = _itod(xh2_3_2, xh2_1_0);
            _amemd8(&x2[l2]) = _itod(xl2_3_2, xl2_1_0);
        }
    }

    if (radix == 2)
        radix_2(ptr_x, ptr_y, n, offset, n_max);
    else if (radix == 4)
        radix_4(ptr_x, ptr_y, n, offset, n_max);

    return;
}


void radix_2(
    short * restrict ptr_x,
    short * restrict ptr_y,
    int n,
    int offset,
    int n_max
)
{
    short * restrict ptr_x0;
    short * restrict y0, * restrict y1, * restrict y2, * restrict y3;

    unsigned int x_10, x_32, x_54, x_76;
    unsigned int x_l1_0_x_l0_0, x_l0_1_x_l1_1;
    unsigned int yt5yt4, yt1yt0, yt7_yt2, yt3_yt6, yt3yt2, yt7yt6;
    unsigned int x_m7m6;

    int i, j, k, l0;

    double x_32_x_10, x_76_x_54;

    /*-----------------------------------------------------------------*/
    /* Use index at offset/4 for bit reversal. Set up input , output   */
    /* pointers to store away the result. The last stage perfoms 1     */
    /* radix4 butterfly or 4 radix2 burtterflies per iteration.        */
    /*-----------------------------------------------------------------*/
    j = offset >> 2;
    ptr_x0 = ptr_x;

    y0 = ptr_y;
    y1 = y0 + (n_max >> 1);
    y2 = y1 + (n_max >> 1);
    y3 = y2 + (n_max >> 1);

    l0 = _norm(n_max) + 3;

    _nassert((int)(n) % 4  == 0);
    _nassert((int)(ptr_x0) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    _nassert((int)(y1) % 8 == 0);
    _nassert((int)(y2) % 8 == 0);
    _nassert((int)(y3) % 8 == 0);
    _nassert(n >= 16);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < n; i += 4) {
        /*--------------------------------------------------------*/
        /* The following macro performs bit reversal of index "j" */
        /* of size "l0" bits into index "k". This forms the index */
        /* with respect to pointers y0, y1, y2, y3 into which  4  */
        /* consecutive inputs map into.                           */
        /*--------------------------------------------------------*/
        k = _bitr(j) >> l0;
        j += 1;

        x_32_x_10 = _amemd8(&ptr_x0[2*i]);
        x_76_x_54 = _amemd8(&ptr_x0[2*i + 4]);

        x_10 = _lo(x_32_x_10);
        x_32 = _hi(x_32_x_10);
        x_54 = _lo(x_76_x_54);
        x_76 = _hi(x_76_x_54);

        /*-------------------------------------------------------*/
        /* Swizzle the data and compute the negative for change  */
        /* if radix is 2 rather than 4.                          */
        /*-------------------------------------------------------*/
        x_m7m6 = _sub2(0, x_76);

        /*----------------------------------------------------*/
        /* These results are appropriately changed if radix   */
        /* is 2, so that when the next set of radix 4 steps   */
        /* performed then the results are same as radix 2.    */
        /*                                                    */
        /* xl0_0   =   x_4;     xl1_0   =   x_5;              */
        /* xl1_1   =   x_6;     xl0_1   =   -x_7;             */
        /*----------------------------------------------------*/
        x_l1_0_x_l0_0 = _rotl(x_54, 0);
        x_l0_1_x_l1_1 = _packhl2(x_m7m6, x_76);

        /*--------------------------------------------------------*/
        /* Perform nest step of radix4 for lower leg. This will   */
        /* result in the correct results radix4 or radix2         */
        /* yt2  = xl0_0 + xl1_1; yt7  = xl1_0 + xl0_1;            */
        /* yt6  = xl0_0 - xl1_1; yt3  = xl1_0 - xl0_1;            */
        /*--------------------------------------------------------*/
        yt7_yt2 = _add2(x_l1_0_x_l0_0, x_l0_1_x_l1_1);
        yt3_yt6 = _sub2(x_l1_0_x_l0_0, x_l0_1_x_l1_1);

        /*--------------------------------------------------------*/
        /* Repack results so that dajacent results are packed to- */
        /* gether for comitting to memory as a store double word  */
        /*--------------------------------------------------------*/
        yt3yt2 = _packhl2(yt3_yt6, yt7_yt2);
        yt7yt6 = _packhl2(yt7_yt2, yt3_yt6);

        /*---------------------------------------------------------*/
        /* Perform radix4 decomposition as a series of radix2 DIF  */
        /* compositions. This yields yt1:yt0 and yt5:yt4           */
        /*                                                         */
        /*  xh0_0  = x_0   +  x_4;     xh1_0  = x_1 + x_5;         */
        /*  xh0_1  = x_2   +  x_6;     xh1_1  = x_3 + x_7;         */
        /*  yt0    = xh0_0 +  xh0_1;   yt1  = xh1_0 + xh1_1;       */
        /*  yt4    = xh0_0 -  xh0_1;   yt5  = xh1_0 - xh1_1;       */
        /*                                                         */
        /*---------------------------------------------------------*/
        yt1yt0 = _add2(x_10, x_32);
        yt5yt4 = _sub2(x_10, x_32);

        /*---------------------------------------------------------*/
        /*  Store out the results of the radix4 butterfly as 4 o/p */
        /* or the result of 2 radix2 butterflies. These results    */
        /* are stored out using store words _amem4 intrinsic.      */
        /*---------------------------------------------------------*/
        _amem4(&y0[k]) = yt1yt0;
        _amem4(&y1[k]) = yt3yt2;
        _amem4(&y2[k]) = yt5yt4;
        _amem4(&y3[k]) = yt7yt6;
    }
}

void radix_4(
    short * restrict ptr_x,
    short * restrict ptr_y,
    int n,
    int offset,
    int n_max
)
{
    short * restrict ptr_x0;
    short * restrict y0, * restrict y1, * restrict y2, * restrict y3;
    unsigned int x_10, x_32, x_54, x_76;
    unsigned int x_h1_0_x_h0_0, x_h1_1_x_h0_1;
    unsigned int x_l1_0_x_l0_0, x_l1_1_x_l0_1, x_l0_1_x_l1_1;
    unsigned int yt5yt4, yt1yt0, yt7_yt2, yt3_yt6, yt3yt2, yt7yt6;
    int i, j, k, l0;
    double x_32_x_10, x_76_x_54;

    /*-----------------------------------------------------------------*/
    /* Use index at offset/4 for bit reversal. Set up input , output   */
    /* pointers to store away the result. The last stage perfoms 1     */
    /* radix4 butterfly or 4 radix2 burtterflies per iteration.        */
    /*-----------------------------------------------------------------*/
    j = offset >> 2;
    ptr_x0 = ptr_x;

    y0 = ptr_y;
    y1 = y0 + (n_max >> 1);
    y2 = y1 + (n_max >> 1);
    y3 = y2 + (n_max >> 1);

    l0 = _norm(n_max) + 3;

    _nassert((int)(n) % 4  == 0);
    _nassert((int)(ptr_x0) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    _nassert((int)(y1) % 8 == 0);
    _nassert((int)(y2) % 8 == 0);
    _nassert((int)(y3) % 8 == 0);
    _nassert(n >= 16);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < n; i += 4) {
        /*--------------------------------------------------------*/
        /* The following macro performs bit reversal of index "j" */
        /* of size "l0" bits into index "k". This forms the index */
        /* with respect to pointers y0, y1, y2, y3 into which  4  */
        /* consecutive inputs map into.                           */
        /*--------------------------------------------------------*/
        k = _bitr(j) >> l0;
        j += 1;

        x_32_x_10 = _amemd8(&ptr_x0[2*i]);
        x_76_x_54 = _amemd8(&ptr_x0[2*i + 4]);

        x_10 = _lo(x_32_x_10);
        x_32 = _hi(x_32_x_10);
        x_54 = _lo(x_76_x_54);
        x_76 = _hi(x_76_x_54);

        /*--------------------------------------------------------*/
        /* Read in the input data, from the first eight locations.*/
        /* These results are transformed as radix 4               */
        /*  xl0_0  = x_0 - x_4; xl1_0  = x_1 - x_5;               */
        /*  xl0_1  = x_2 - x_6; xl1_1  = x_3 - x_7;               */
        /*--------------------------------------------------------*/
        x_l1_0_x_l0_0 = _sub2(x_10, x_54);
        x_l1_1_x_l0_1 = _sub2(x_32, x_76);

        /*-------------------------------------------------------*/
        /* Swizzle the data and compute the negative for change  */
        /* if radix is 2 rather than 4.                          */
        /*-------------------------------------------------------*/
        x_l0_1_x_l1_1 = _rotl(x_l1_1_x_l0_1, 16);

        /*--------------------------------------------------------*/
        /* Perform nest step of radix4 for lower leg. This will   */
        /* result in the correct results radix4 or radix2         */
        /* yt2  = xl0_0 + xl1_1; yt7  = xl1_0 + xl0_1;            */
        /* yt6  = xl0_0 - xl1_1; yt3  = xl1_0 - xl0_1;            */
        /*--------------------------------------------------------*/
        yt7_yt2 = _add2(x_l1_0_x_l0_0, x_l0_1_x_l1_1);
        yt3_yt6 = _sub2(x_l1_0_x_l0_0, x_l0_1_x_l1_1);

        /*--------------------------------------------------------*/
        /* Repack results so that dajacent results are packed to- */
        /* gether for comitting to memory as a store double word  */
        /*--------------------------------------------------------*/
        yt3yt2 = _packhl2(yt3_yt6, yt7_yt2);
        yt7yt6 = _packhl2(yt7_yt2, yt3_yt6);

        /*---------------------------------------------------------*/
        /* Perform radix4 decomposition as a series of radix2 DIF  */
        /* compositions. This yields yt1:yt0 and yt5:yt4           */
        /*                                                         */
        /*  xh0_0  = x_0   +  x_4;     xh1_0  = x_1 + x_5;         */
        /*  xh0_1  = x_2   +  x_6;     xh1_1  = x_3 + x_7;         */
        /*  yt0    = xh0_0 +  xh0_1;   yt1  = xh1_0 + xh1_1;       */
        /*  yt4    = xh0_0 -  xh0_1;   yt5  = xh1_0 - xh1_1;       */
        /*                                                         */
        /*---------------------------------------------------------*/
        x_h1_0_x_h0_0 = _add2(x_54, x_10);
        x_h1_1_x_h0_1 = _add2(x_76, x_32);
        yt1yt0 = _add2(x_h1_0_x_h0_0, x_h1_1_x_h0_1);
        yt5yt4 = _sub2(x_h1_0_x_h0_0, x_h1_1_x_h0_1);

        /*---------------------------------------------------------*/
        /*  Store out the results of the radix4 butterfly as 4 o/p */
        /* or the result of 2 radix2 butterflies. These results    */
        /* are stored out using store words _amem4 intrinsic.      */
        /*---------------------------------------------------------*/
        _amem4(&y0[k]) = yt1yt0;
        _amem4(&y1[k]) = yt3yt2;
        _amem4(&y2[k]) = yt5yt4;
        _amem4(&y3[k]) = yt7yt6;
    }
}

#else
void DSP_fft16x16r_i (
    int n,
    short * restrict ptr_x,
    const short * restrict ptr_w,
    short * restrict ptr_y,
    int radix,
    int offset,
    int n_max
)
{
    const short * restrict w;
    short * restrict x, * restrict x2, * restrict x0;

    unsigned int j;

    int i, l1;
    int l2, h2, fft_jmp;
    int predj, tw_offset, stride;
    int x_0_x_1, x_2_x_3, x_0o_x_1o, x_2o_x_3o;
    int xh2_0_xh2_1, xh2_2_xh2_3, xl1_0_xl0_0, xl1_1_xl0_1;
    int xl1_0_xl1_1, xl1_2_xl1_3, xl2_0_xl2_1, xl2_2_xl2_3;

    unsigned int xl1_0_1, xl1_2_3, xl2_0_1, xl2_2_3;
    unsigned int xh2_0_1, xh2_2_3;
    unsigned int mxt0_0_myt0_0, mxt0_1_myt0_1;

    unsigned int yt2_0_xt1_0, yt2_1_xt1_1, yt1_0_xt2_0, yt1_1_xt2_1;
    unsigned int xt1_0_yt1_0, xt1_1_yt1_1, xt2_0_yt2_0, xt2_1_yt2_1;

    unsigned int co11_si11, co10_si10, co21_si21;
    unsigned int co20_si20, co30_si30, co31_si31;

    unsigned int xh0_0_xh1_0, xh0_1_xh1_1, xh20_0_xh21_0;
    unsigned int xh20_1_xh21_1;
    unsigned int xl0_0_xl1_0, xl0_1_xl1_1, xl20_0_xl21_0, xl20_1_xl21_1;

    double co10si10_co11si11, co20si20_co21si21, co30si30_co31si31;
    double x_l1_01_x_l1_23, x_l2_01_x_l2_23, x_h2_01_x_h2_23;
    double x_01_x_23;

    long long xh0_0_xh1_0_xl0_0_xl1_0, xh0_1_xh1_1_xl0_1_xl1_1;
    long long xh20_0_xh21_0_xl20_0_xl21_0, xh20_1_xh21_1_xl20_1_xl21_1;
    
    long long yt2_0_xt1_0_yt1_0_xt2_0, yt2_1_xt1_1_yt1_1_xt2_1;
    long long xt2_0_yt2_0_xt1_0_yt1_0, xt2_1_yt2_1_xt1_1_yt1_1;

    /*----------------------------------------------------------------------*/
    /* The stride is quartered with every iteration of the outer loop. It   */
    /* denotes the seperation between any two adjacent inputs to the butter */
    /* -fly. This should start out at N/4, hence stride is initially set to */
    /* N. For every stride, 6*stride twiddle factors are accessed. The      */
    /* "tw_offset" is the offset within the current twiddle factor sub-     */
    /* table. This is set to zero, at the start of the code and is used to  */
    /* obtain the appropriate sub-table twiddle pointer by offseting it     */
    /* with the base pointer "ptr_w".                                       */
    /*----------------------------------------------------------------------*/
    stride = n;
    tw_offset = 0;
    fft_jmp = 6 * stride;

    _nassert(stride > 4);
    #pragma MUST_ITERATE(1,,1);

    while (stride > radix) {
        /*-----------------------------------------------------------------*/
        /* At the start of every iteration of the outer loop, "j" is set   */
        /* to zero, as "w" is pointing to the correct location within the  */
        /* twiddle factor array. For every iteration of the inner loop     */
        /* 6 * stride twiddle factors are accessed. For eg,                */
        /*                                                                 */
        /* #Iteration of outer loop  # twiddle factors    #times cycled    */
        /*  1                          6 N/4               1               */
        /*  2                          6 N/16              4               */
        /*  ...                                                            */
        /*-----------------------------------------------------------------*/
        j =  0;
        fft_jmp >>= 2;

        /*-----------------------------------------------------------------*/
        /* Set up offsets to access "N/4", "N/2", "3N/4" complex point or  */
        /* "N/2", "N", "3N/2" half word                                    */
        /*-----------------------------------------------------------------*/
        h2 = stride >> 1;
        l1 = stride;
        l2 = stride + (stride >> 1);

        /*-----------------------------------------------------------------*/
        /*  Reset "x" to point to the start of the input data array.       */
        /* "tw_offset" starts off at 0, and increments by "6 * stride"     */
        /*  The stride quarters with every iteration of the outer loop     */
        /*-----------------------------------------------------------------*/
        x = ptr_x;
        w = ptr_w + tw_offset;
        tw_offset += fft_jmp;

        stride >>= 2;

        /*----------------------------------------------------------------*/
        /* The following loop iterates through the different butterflies, */
        /* within a given stage. Recall that there are logN to base 4     */
        /* stages. Certain butterflies share the twiddle factors. These   */
        /* are grouped together. On the very first stage there are no     */
        /* butterflies that share the twiddle factor, all N/4 butter-     */
        /* flies have different factors. On the next stage two sets of    */
        /* N/8 butterflies share the same twiddle factor. Hence after     */
        /* half the butterflies are performed, j the index into the       */
        /* factor array resets to 0, and the twiddle factors are reused.  */
        /* When this happens, the data pointer 'x' is incremented by the  */
        /* fft_jmp amount. In addition the following code is unrolled to  */
        /* perform "2" radix4 butterflies in parallel.                    */
        /*----------------------------------------------------------------*/
        _nassert((int)(w) % 8 == 0);
        _nassert((int)(x) % 8 == 0);
        _nassert(h2 % 8 == 0);
        _nassert(l1 % 8 == 0);
        _nassert(l2 % 8 == 0);
        _nassert(n >= 16);
        #pragma MUST_ITERATE(2,,2);
        for (i = 0; i < n; i += 8) {
            /*------------------------------------------------------------*/
            /* Read the first 12 twiddle factors, six of which are used   */
            /* for one radix 4 butterfly and six of which are used for    */
            /* next one.                                                  */
            /*                                                            */
            /*  si10 = w[j+1];        co10 = w[j+0];                      */
            /*  si11 = w[j+3];        co11 = w[j+2];                      */
            /*  si20 = w[j+5];        co20 = w[j+4];                      */
            /*  si21 = w[j+7];        co21 = w[j+6];                      */
            /*  si30 = w[j+9];        co30 = w[j+8];                      */
            /*  si31 = w[j+11];       co31 = w[j+10];                     */
            /*                                                            */
            /*  The code shown above performs half word wide loads. The   */
            /*  C64x can perform double word wide loads. This is done by  */
            /*  the use of the _amemd8_const intrinsic. The const quali-  */
            /*  fies the fact that this array will only be read from and  */
            /*  not written to.                                           */
            /*------------------------------------------------------------*/
            co10si10_co11si11 = _amemd8_const(&w[j]);
            co20si20_co21si21 = _amemd8_const(&w[j + 4]);
            co30si30_co31si31 = _amemd8_const(&w[j + 8]);

            /*-------------------------------------------------------------*/
            /* Access low and high halves using the _lo and _hi intrinsics */
            /* to obtain the individual 32 bit values. Each 32 bit value   */
            /* contains a packed twiddle factor of the form co_xxsi_xx     */
            /*-------------------------------------------------------------*/
            co10_si10 = _hi(co10si10_co11si11);
            co11_si11 = _lo(co10si10_co11si11);
            co20_si20 = _hi(co20si20_co21si21);
            co21_si21 = _lo(co20si20_co21si21);
            co30_si30 = _hi(co30si30_co31si31);
            co31_si31 = _lo(co30si30_co31si31);

            /*------------------------------------------------------------*/
            /* Read in the first complex input for the butterflies.       */
            /* 1st complex input to 1st butterfly: x[0] + jx[1]           */
            /* 1st complex input to 2nd butterfly: x[2] + jx[3]           */
            /* Read in the complex inputs for the butterflies. Each of the*/
            /* successive complex inputs of the butterfly are seperated   */
            /* by a fixed amount known as stride. The stride starts out   */
            /* at N/4, and quarters with every stage.                     */
            /*                                                            */
            /*  x_0    =   x[0];          x_1    =   x[1];                */
            /*  x_2    =   x[2];          x_3    =   x[3];                */
            /*  x_l1_0 =   x[l1  ];       x_l1_1 =   x[l1 + 1];           */
            /*  x_l1_2 =   x[l1 + 2];     x_l1_3 =   x[l1 + 3];           */
            /*  x_l2_0 =   x[l2  ];       x_l2_1 =   x[l2 + 1];           */
            /*  x_l2_2 =   x[l2 + 2];     x_l2_3 =   x[l2 + 3];           */
            /*  x_h2_0 =   x[h2  ];       x_h2_1 =   x[h2 + 1];           */
            /*  x_h2_2 =   x[h2 + 2];     x_h2_3 =   x[h2 + 3];           */
            /*                                                            */
            /* These loads are performed using _amemd8. Note that there   */
            /* is no const qualifier in this case as this loop writes     */
            /* back results into the data array "x". The "a" in _amemd8   */
            /* qualifies the fact that the loads are aligned.             */
            /*------------------------------------------------------------*/
            x_01_x_23       = _amemd8(&x[0]);
            x_l1_01_x_l1_23 = _amemd8(&x[l1]);
            x_l2_01_x_l2_23 = _amemd8(&x[l2]);
            x_h2_01_x_h2_23 = _amemd8(&x[h2]);

            /*------------------------------------------------------------*/
            /*  Access the low and high halves using the _lo and _hi      */
            /*  intrinsic. This helps to obtain the individual "32" bit   */
            /*  quantities from a 64 bit wide double word.                */
            /*------------------------------------------------------------*/
            x_0_x_1     = _hi(x_01_x_23);
            x_2_x_3     = _lo(x_01_x_23);
            xl1_0_xl1_1 = _hi(x_l1_01_x_l1_23);
            xl1_2_xl1_3 = _lo(x_l1_01_x_l1_23);
            xl2_0_xl2_1 = _hi(x_l2_01_x_l2_23);
            xl2_2_xl2_3 = _lo(x_l2_01_x_l2_23);
            xh2_0_xh2_1 = _hi(x_h2_01_x_h2_23);
            xh2_2_xh2_3 = _lo(x_h2_01_x_h2_23);

            /*-----------------------------------------------------------*/
            /* Two butterflies are evaluated in parallel. The following  */
            /* results will be shown for one butterfly only, although    */
            /* both are being evaluated in parallel.                     */
            /*                                                           */
            /* Perform radix2 style DIF butterflies.                     */
            /*                                                           */
            /*  xh0_0  = x_0    + x_l1_0;     xh1_0  = x_1    + x_l1_1;  */
            /*  xh0_1  = x_2    + x_l1_2;     xh1_1  = x_3    + x_l1_3;  */
            /*  xl0_0  = x_0    - x_l1_0;     xl1_0  = x_1    - x_l1_1;  */
            /*  xl0_1  = x_2    - x_l1_2;     xl1_1  = x_3    - x_l1_3;  */
            /*  xh20_0 = x_h2_0 + x_l2_0;     xh21_0 = x_h2_1 + x_l2_1;  */
            /*  xh20_1 = x_h2_2 + x_l2_2;     xh21_1 = x_h2_3 + x_l2_3;  */
            /*  xl20_0 = x_h2_0 - x_l2_0;     xl21_0 = x_h2_1 - x_l2_1;  */
            /*  xl20_1 = x_h2_2 - x_l2_2;     xl21_1 = x_h2_3 - x_l2_3;  */
            /*                                                           */
            /*  These are done using packed data processing, and these   */
            /*  are done using _add2, _sub2.                             */
            /*  For example "xh1_0_xh0_0" has a packed value xh1_0,      */
            /*  xh0_0.                                                   */
            /*-----------------------------------------------------------*/
            xh0_0_xh1_0_xl0_0_xl1_0 = _addsub2(x_0_x_1, xl1_0_xl1_1);
            xh0_1_xh1_1_xl0_1_xl1_1 = _addsub2(x_2_x_3, xl1_2_xl1_3);

            xh0_0_xh1_0 = _hill(xh0_0_xh1_0_xl0_0_xl1_0);
            xh0_1_xh1_1 = _hill(xh0_1_xh1_1_xl0_1_xl1_1);
            xl0_0_xl1_0 = _loll(xh0_0_xh1_0_xl0_0_xl1_0);
            xl0_1_xl1_1 = _loll(xh0_1_xh1_1_xl0_1_xl1_1);

            xh20_0_xh21_0_xl20_0_xl21_0 = _addsub2(xh2_0_xh2_1, xl2_0_xl2_1);
            xh20_1_xh21_1_xl20_1_xl21_1 = _addsub2(xh2_2_xh2_3, xl2_2_xl2_3);

            xh20_0_xh21_0 = _hill(xh20_0_xh21_0_xl20_0_xl21_0);
            xh20_1_xh21_1 = _hill(xh20_1_xh21_1_xl20_1_xl21_1);
            xl20_0_xl21_0 = _loll(xh20_0_xh21_0_xl20_0_xl21_0);
            xl20_1_xl21_1 = _loll(xh20_1_xh21_1_xl20_1_xl21_1);

            /*----------------------------------------------------------*/
            /* Derive output pointers using the input pointer "x"       */
            /*----------------------------------------------------------*/
            x0 = (short *)_mvd((int)x);
            x2 = (short *)_mvd((int)x0);

            /*-----------------------------------------------------------*/
            /* When the twiddle factors are not to be re-used, j is      */
            /* incremented by 12, to reflect the fact that 12 half words */
            /* are consumed in every iteration. The input data pointer   */
            /* increments by 4. Note that within a stage, the stride     */
            /* does not change and hence the offsets for the other three */
            /* legs, 0, h2, l1, l2.                                      */
            /*-----------------------------------------------------------*/
            j += 12;
            x += 4;

            predj = (j - fft_jmp);
            if (!predj) x += fft_jmp;
            if (!predj) j = 0;

            /*----------------------------------------------------------*/
            /* These four partial results can be re-written to show     */
            /* the underlying DIF structure similar to radix2 as        */
            /* follows:                                                 */
            /*                                                          */
            /* X(4k)  = (x(n)+x(n + N/2)) + (x(n+N/4)+ x(n + 3N/4))     */
            /* X(4k+1)= (x(n)-x(n + N/2)) -j(x(n+N/4) - x(n + 3N/4))    */
            /* x(4k+2)= (x(n)+x(n + N/2)) - (x(n+N/4)+ x(n + 3N/4))     */
            /* X(4k+3)= (x(n)-x(n + N/2)) +j(x(n+N/4) - x(n + 3N/4))    */
            /*                                                          */
            /* which leads to the real and imaginary values as foll:    */
            /*                                                          */
            /* y0r = x0r + x2r +  x1r +  x3r    =  xh0 + xh20           */
            /* y0i = x0i + x2i +  x1i +  x3i    =  xh1 + xh21           */
            /* y1r = x0r - x2r + (x1i -  x3i)   =  xl0 + xl21           */
            /* y1i = x0i - x2i - (x1r -  x3r)   =  xl1 - xl20           */
            /* y2r = x0r + x2r - (x1r +  x3r)   =  xh0 - xh20           */
            /* y2i = x0i + x2i - (x1i +  x3i    =  xh1 - xh21           */
            /* y3r = x0r - x2r - (x1i -  x3i)   =  xl0 - xl21           */
            /* y3i = x0i - x2i + (x1r -  x3r)   =  xl1 + xl20           */
            /*                                                          */
            /* Note that in this version of the code both rounding and  */
            /* scaling are implemented.                                 */
            /* ---------------------------------------------------------*/
            /*----------------------------------------------------------*/
            /* x0[0] = (xh0_0 + xh20_0 + 1) >> 1;                       */
            /* x0[1] = (xh1_0 + xh21_0 + 1) >> 1;                       */
            /* x0[2] = (xh0_1 + xh20_1 + 1) >> 1;                       */
            /* x0[3] = (xh1_1 + xh21_1 + 1) >> 1;                       */
            /*                                                          */
            /* "y0x0" and "y1x1" are the first four outputs of the      */
            /*  radix4 butterfly. These are computed on the C64x        */
            /* using _avg2.                                             */
            /*----------------------------------------------------------*/
            x_0o_x_1o = _avg2(xh20_0_xh21_0, xh0_0_xh1_0);
            x_2o_x_3o = _avg2(xh20_1_xh21_1, xh0_1_xh1_1);

            /*----------------------------------------------------------*/
            /* Perform one more stage of radix2 decompositions as shown */
            /* These are performed using packed data processing.        */
            /*                                                          */
            /* xt0_0 = xh0_0 - xh20_0;  yt0_0 = xh1_0 - xh21_0;         */
            /* xt0_1 = xh0_1 - xh20_1;  yt0_1 = xh1_1 - xh21_1;         */
            /* xt1_0 = xl0_0 + xl21_0;  yt2_0 = xl1_0 + xl20_0;         */
            /* xt2_0 = xl0_0 - xl21_0;  yt1_0 = xl1_0 - xl20_0;         */
            /* xt1_1 = xl0_1 + xl21_1;  yt2_1 = xl1_1 + xl20_1;         */
            /* xt2_1 = xl0_1 - xl21_1;  yt1_1 = xl1_1 - xl20_1;         */
            /*                                                          */
            /*----------------------------------------------------------*/
            mxt0_0_myt0_0 = _sub2(xh20_0_xh21_0, xh0_0_xh1_0);
            mxt0_1_myt0_1 = _sub2(xh20_1_xh21_1, xh0_1_xh1_1);

            /*----------------------------------------------------------*/
            /* Repack coefficients to sustain packed data processing.   */
            /* This requires a swizzle so that intermediate results     */
            /* end up in the right spot. This is needed to compute      */
            /* other intermediate results using add2 and sub2.          */
            /*----------------------------------------------------------*/
            xl1_0_xl0_0 = _packlh2(xl0_0_xl1_0, xl0_0_xl1_0);
            xl1_1_xl0_1 = _packlh2(xl0_1_xl1_1, xl0_1_xl1_1);

            //;----------------------------------------------------------;
            //; xt1_0 = xl0_0 + xl21_0   yt2_0 = xl1_0 + xl20_0          ;
            //; xt1_1 = xl0_1 + xl21_1   yt2_1 = xl1_1 + xl20_1          ;
            //; xt2_0 = xl0_0 - xl21_0   yt1_0 = xl1_0 - xl20_0          ;
            //; xt2_1 = xl0_1 - xl21_1   yt1_1 = xl1_1 - xl20_1          ;
            //;----------------------------------------------------------;
            yt2_0_xt1_0_yt1_0_xt2_0 = _addsub2(xl1_0_xl0_0, xl20_0_xl21_0);
            yt2_1_xt1_1_yt1_1_xt2_1 = _addsub2(xl1_1_xl0_1, xl20_1_xl21_1);

            yt2_0_xt1_0 = _hill(yt2_0_xt1_0_yt1_0_xt2_0);
            yt2_1_xt1_1 = _hill(yt2_1_xt1_1_yt1_1_xt2_1);
            yt1_0_xt2_0 = _loll(yt2_0_xt1_0_yt1_0_xt2_0);
            yt1_1_xt2_1 = _loll(yt2_1_xt1_1_yt1_1_xt2_1);

            /*----------------------------------------------------------*/
            /* Repack results so that xt_XXyt_XX are a packed  32 bit   */
            /* quantity. The operations performed above tend to leave   */
            /* the results as xt_XXyt_YY and xt_YYyt_XX. This is where  */
            /* the packed instructions come in handy. For example       */
            /* xt_XXyt_XX = -packlh2(xt_XXyt_YY, xt_YY, yt_XX)          */
            /*----------------------------------------------------------*/
            xt2_0_yt2_0_xt1_0_yt1_0 = _dpackx2(yt2_0_xt1_0, yt1_0_xt2_0);
            xt2_1_yt2_1_xt1_1_yt1_1 = _dpackx2(yt2_1_xt1_1, yt1_1_xt2_1);

            xt2_0_yt2_0 = _hill(xt2_0_yt2_0_xt1_0_yt1_0);
            xt2_1_yt2_1 = _hill(xt2_1_yt2_1_xt1_1_yt1_1);
            xt1_0_yt1_0 = _loll(xt2_0_yt2_0_xt1_0_yt1_0);
            xt1_1_yt1_1 = _loll(xt2_1_yt2_1_xt1_1_yt1_1);

            /*---------------------------------------------------------*/
            /* Notice that in this version of the code the two middle  */
            /* legs are swapped as indicated by the stores to x[l1]..  */
            /* x[l1 + 3] which preceede the stores to x[h2]..x[h2 + 3] */
            /* This reversal guarantees that a radix4 DIF butterfly    */
            /* produces results in digit reversed order. Note that in  */
            /* addition to the rounding, the shift is performed by 16, */
            /* as opposed to 15, to give scaling.                      */
            /*                                                         */
            /* x2[l1  ] = (si10 * yt1_0 + co10 * xt1_0 + 0x4000) >> 16;*/
            /* x2[l1+1] = (co10 * yt1_0 - si10 * xt1_0 + 0x4000) >> 16;*/
            /* x2[l1+2] = (si11 * yt1_1 + co11 * xt1_1 + 0x4000) >> 16;*/
            /* x2[l1+3] = (co11 * yt1_1 - si11 * xt1_1 + 0x4000) >> 16;*/
            /*                                                         */
            /* These four results are retained in registers and a      */
            /* double word is formed so that it can be stored with     */
            /* one STDW.                                               */
            /*---------------------------------------------------------*/
            xh2_0_1 = _cmpyr(co10_si10, xt1_0_yt1_0);
            xh2_2_3 = _cmpyr(co11_si11, xt1_1_yt1_1);

            /*---------------------------------------------------------*/
            /* The following code computes intermediate results for:   */
            /*                                                         */
            /* x2[h2  ] = (si20 * yt0_0 + co20 * xt0_0 + 0x4000) >> 16;*/
            /* x2[h2+1] = (co20 * yt0_0 - si20 * xt0_0 + 0x4000) >> 16;*/
            /* x2[h2+2] = (si21 * yt0_1 + co21 * xt0_1 + 0x4000) >> 16;*/
            /* x2[h2+3] = (co21 * yt0_1 - si21 * xt0_1 + 0x4000) >> 16;*/
            /*---------------------------------------------------------*/
            xl1_0_1 = _cmpyr(co20_si20, mxt0_0_myt0_0);
            xl1_2_3 = _cmpyr(co21_si21, mxt0_1_myt0_1);

            /*---------------------------------------------------------*/
            /* The following code computes intermediate results for:   */
            /*                                                         */
            /* x2[l2  ] = (si30 * yt2_0 + co30 * xt2_0 + 0x4000) >> 16;*/
            /* x2[l2+1] = (co30 * yt2_0 - si30 * xt2_0 + 0x4000) >> 16;*/
            /* x2[l2+2] = (si31 * yt2_1 + co31 * xt2_1 + 0x4000) >> 16;*/
            /* x2[l2+3] = (co31 * yt2_1 - si31 * xt2_1 + 0x4000) >> 16;*/
            /*---------------------------------------------------------*/
            xl2_0_1 = _cmpyr(co30_si30, xt2_0_yt2_0);
            xl2_2_3 = _cmpyr(co31_si31, xt2_1_yt2_1);

            /*---------------------------------------------------------*/
            /* Store out the outputs to the four legs of the butterfly */
            /* using aligned store double words. Notice the use of the */
            /* indices "l1", "l2", "h2" to derive the pointers for the */
            /* legs of the butterfly.                                  */
            /*---------------------------------------------------------*/
            _amemd8(&x2[0])  = _itod(x_0o_x_1o, x_2o_x_3o);
            _amemd8(&x2[h2]) = _itod(xl1_0_1, xl1_2_3);
            _amemd8(&x2[l1]) = _itod(xh2_0_1, xh2_2_3);
            _amemd8(&x2[l2]) = _itod(xl2_0_1, xl2_2_3);
        }
    }

    if (radix == 2)
        radix_2(ptr_x, ptr_y, n, offset, n_max);
    else if (radix == 4)
        radix_4(ptr_x, ptr_y, n, offset, n_max);

    return;
}


void radix_2(
    short * restrict ptr_x,
    short * restrict ptr_y,
    int n,
    int offset,
    int n_max
)
{
    short * restrict ptr_x0;
    short * restrict y0, * restrict y1, * restrict y2, * restrict y3;

    unsigned int x_01, x_23, x_45, x_67;
    unsigned int x_l0_0_x_l1_0, x_l1_1_x_l0_1;
    unsigned int yt4yt5, yt0yt1, yt2_yt7, yt6_yt3, yt2yt3, yt6yt7;
    unsigned int x_m6m7;

    int i, j, k, l0;

    double x_01_x_23, x_45_x_67;

    /*-----------------------------------------------------------------*/
    /* Use index at offset/4 for bit reversal. Set up input , output   */
    /* pointers to store away the result. The last stage perfoms 1     */
    /* radix4 butterfly or 4 radix2 burtterflies per iteration.        */
    /*-----------------------------------------------------------------*/
    j = offset >> 2;
    ptr_x0 = ptr_x;

    y0 = ptr_y;
    y1 = y0 + (n_max >> 1);
    y2 = y1 + (n_max >> 1);
    y3 = y2 + (n_max >> 1);

    l0 = _norm(n_max) + 3;

    _nassert((int)(n) % 4  == 0);
    _nassert((int)(ptr_x0) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    _nassert((int)(y1) % 8 == 0);
    _nassert((int)(y2) % 8 == 0);
    _nassert((int)(y3) % 8 == 0);
    _nassert(n >= 16);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < n; i += 4) {
        /*--------------------------------------------------------*/
        /* The following macro performs bit reversal of index "j" */
        /* of size "l0" bits into index "k". This forms the index */
        /* with respect to pointers y0, y1, y2, y3 into which  4  */
        /* consecutive inputs map into.                           */
        /*--------------------------------------------------------*/
        k = _bitr(j) >> l0;
        j += 1;

        x_01_x_23 = _amemd8(&ptr_x0[2*i]);
        x_45_x_67 = _amemd8(&ptr_x0[2*i + 4]);

        x_01 = _hi(x_01_x_23);
        x_23 = _lo(x_01_x_23);
        x_45 = _hi(x_45_x_67);
        x_67 = _lo(x_45_x_67);

        /*-------------------------------------------------------*/
        /* Swizzle the data and compute the negative for change  */
        /* if radix is 2 rather than 4.                          */
        /*-------------------------------------------------------*/
        x_m6m7 = _sub2(0, x_67);

        /*----------------------------------------------------*/
        /* These results are appropriately changed if radix   */
        /* is 2, so that when the next set of radix 4 steps   */
        /* performed then the results are same as radix 2.    */
        /*                                                    */
        /* xl0_0   =   x_4;     xl1_0   =   x_5;              */
        /* xl1_1   =   x_6;     xl0_1   =   -x_7;             */
        /*----------------------------------------------------*/
        x_l0_0_x_l1_0 = _rotl(x_45, 0);
        x_l1_1_x_l0_1 = _packhl2(x_67, x_m6m7);

        /*--------------------------------------------------------*/
        /* Perform nest step of radix4 for lower leg. This will   */
        /* result in the correct results radix4 or radix2         */
        /* yt2  = xl0_0 + xl1_1; yt7  = xl1_0 + xl0_1;            */
        /* yt6  = xl0_0 - xl1_1; yt3  = xl1_0 - xl0_1;            */
        /*--------------------------------------------------------*/
        yt2_yt7 = _add2(x_l0_0_x_l1_0, x_l1_1_x_l0_1);
        yt6_yt3 = _sub2(x_l0_0_x_l1_0, x_l1_1_x_l0_1);

        /*--------------------------------------------------------*/
        /* Repack results so that dajacent results are packed to- */
        /* gether for comitting to memory as a store double word  */
        /*--------------------------------------------------------*/
        yt2yt3 = _packhl2(yt2_yt7, yt6_yt3);
        yt6yt7 = _packhl2(yt6_yt3, yt2_yt7);

        /*---------------------------------------------------------*/
        /* Perform radix4 decomposition as a series of radix2 DIF  */
        /* compositions. This yields yt1:yt0 and yt5:yt4           */
        /*                                                         */
        /*  xh0_0  = x_0   +  x_4;     xh1_0  = x_1 + x_5;         */
        /*  xh0_1  = x_2   +  x_6;     xh1_1  = x_3 + x_7;         */
        /*  yt0    = xh0_0 +  xh0_1;   yt1  = xh1_0 + xh1_1;       */
        /*  yt4    = xh0_0 -  xh0_1;   yt5  = xh1_0 - xh1_1;       */
        /*                                                         */
        /*---------------------------------------------------------*/
        yt0yt1 = _add2(x_01, x_23);
        yt4yt5 = _sub2(x_01, x_23);

        /*---------------------------------------------------------*/
        /*  Store out the results of the radix4 butterfly as 4 o/p */
        /* or the result of 2 radix2 butterflies. These results    */
        /* are stored out using store words _amem4 intrinsic.      */
        /*---------------------------------------------------------*/
        _amem4(&y0[k]) = yt0yt1;
        _amem4(&y1[k]) = yt2yt3;
        _amem4(&y2[k]) = yt4yt5;
        _amem4(&y3[k]) = yt6yt7;
    }
}

void radix_4(
    short * restrict ptr_x,
    short * restrict ptr_y,
    int n,
    int offset,
    int n_max
)
{
    short * restrict ptr_x0;
    short * restrict y0, * restrict y1, * restrict y2, * restrict y3;
    unsigned int x_01, x_23, x_45, x_67;
    unsigned int x_h0_0_x_h1_0, x_h0_1_x_h1_1;
    unsigned int x_l0_0_x_l1_0, x_l0_1_x_l1_1, x_l1_1_x_l0_1;
    unsigned int yt4yt5, yt0yt1, yt2_yt7, yt6_yt3, yt2yt3, yt6yt7;
    int i, j, k, l0;
    double x_01_x_23, x_45_x_67;

    /*-----------------------------------------------------------------*/
    /* Use index at offset/4 for bit reversal. Set up input , output   */
    /* pointers to store away the result. The last stage perfoms 1     */
    /* radix4 butterfly or 4 radix2 burtterflies per iteration.        */
    /*-----------------------------------------------------------------*/
    j = offset >> 2;
    ptr_x0 = ptr_x;

    y0 = ptr_y;
    y1 = y0 + (n_max >> 1);
    y2 = y1 + (n_max >> 1);
    y3 = y2 + (n_max >> 1);

    l0 = _norm(n_max) + 3;

    _nassert((int)(n) % 4  == 0);
    _nassert((int)(ptr_x0) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    _nassert((int)(y1) % 8 == 0);
    _nassert((int)(y2) % 8 == 0);
    _nassert((int)(y3) % 8 == 0);
    _nassert(n >= 16);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < n; i += 4) {
        /*--------------------------------------------------------*/
        /* The following macro performs bit reversal of index "j" */
        /* of size "l0" bits into index "k". This forms the index */
        /* with respect to pointers y0, y1, y2, y3 into which  4  */
        /* consecutive inputs map into.                           */
        /*--------------------------------------------------------*/
        k = _bitr(j) >> l0;
        j += 1;

        x_01_x_23 = _amemd8(&ptr_x0[2*i]);
        x_45_x_67 = _amemd8(&ptr_x0[2*i + 4]);

        x_01 = _hi(x_01_x_23);
        x_23 = _lo(x_01_x_23);
        x_45 = _hi(x_45_x_67);
        x_67 = _lo(x_45_x_67);

        /*--------------------------------------------------------*/
        /* Read in the input data, from the first eight locations.*/
        /* These results are transformed as radix 4               */
        /*  xl0_0  = x_0 - x_4; xl1_0  = x_1 - x_5;               */
        /*  xl0_1  = x_2 - x_6; xl1_1  = x_3 - x_7;               */
        /*--------------------------------------------------------*/
        x_l0_0_x_l1_0 = _sub2(x_01, x_45);
        x_l0_1_x_l1_1 = _sub2(x_23, x_67);

        /*-------------------------------------------------------*/
        /* Swizzle the data and compute the negative for change  */
        /* if radix is 2 rather than 4.                          */
        /*-------------------------------------------------------*/
        x_l1_1_x_l0_1 = _rotl(x_l0_1_x_l1_1, 16);

        /*--------------------------------------------------------*/
        /* Perform nest step of radix4 for lower leg. This will   */
        /* result in the correct results radix4 or radix2         */
        /* yt2  = xl0_0 + xl1_1; yt7  = xl1_0 + xl0_1;            */
        /* yt6  = xl0_0 - xl1_1; yt3  = xl1_0 - xl0_1;            */
        /*--------------------------------------------------------*/
        yt2_yt7 = _add2(x_l0_0_x_l1_0, x_l1_1_x_l0_1);
        yt6_yt3 = _sub2(x_l0_0_x_l1_0, x_l1_1_x_l0_1);

        /*--------------------------------------------------------*/
        /* Repack results so that dajacent results are packed to- */
        /* gether for comitting to memory as a store double word  */
        /*--------------------------------------------------------*/
        yt2yt3 = _packhl2(yt2_yt7, yt6_yt3);
        yt6yt7 = _packhl2(yt6_yt3, yt2_yt7);

        /*---------------------------------------------------------*/
        /* Perform radix4 decomposition as a series of radix2 DIF  */
        /* compositions. This yields yt1:yt0 and yt5:yt4           */
        /*                                                         */
        /*  xh0_0  = x_0   +  x_4;     xh1_0  = x_1 + x_5;         */
        /*  xh0_1  = x_2   +  x_6;     xh1_1  = x_3 + x_7;         */
        /*  yt0    = xh0_0 +  xh0_1;   yt1  = xh1_0 + xh1_1;       */
        /*  yt4    = xh0_0 -  xh0_1;   yt5  = xh1_0 - xh1_1;       */
        /*                                                         */
        /*---------------------------------------------------------*/
        x_h0_0_x_h1_0 = _add2(x_45, x_01);
        x_h0_1_x_h1_1 = _add2(x_67, x_23);
        yt0yt1 = _add2(x_h0_0_x_h1_0, x_h0_1_x_h1_1);
        yt4yt5 = _sub2(x_h0_0_x_h1_0, x_h0_1_x_h1_1);

        /*---------------------------------------------------------*/
        /*  Store out the results of the radix4 butterfly as 4 o/p */
        /* or the result of 2 radix2 butterflies. These results    */
        /* are stored out using store words _amem4 intrinsic.      */
        /*---------------------------------------------------------*/
        _amem4(&y0[k]) = yt0yt1;
        _amem4(&y1[k]) = yt2yt3;
        _amem4(&y2[k]) = yt4yt5;
        _amem4(&y3[k]) = yt6yt7;
    }
}
#endif
/* ======================================================================== */
/*  End of file: DSP_fft16x16r_i.c                                          */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */

