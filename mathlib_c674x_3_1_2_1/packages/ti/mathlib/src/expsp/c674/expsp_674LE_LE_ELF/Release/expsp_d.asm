;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:47:32 2016                                *
;******************************************************************************
	.compiler_opts --abi=eabi --c64p_l1d_workaround=off --endian=little --hll_source=on --long_precision_bits=32 --mem_model:code=near --mem_model:const=data --mem_model:data=far --object_format=elf --silicon_version=6740 --symdebug:none 

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C674x                                          *
;*   Optimization      : Enabled at level 3                                   *
;*   Optimizing for    : Speed                                                *
;*                       Based on options: -o3, no -ms                        *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Data Access Model : Far                                                  *
;*   Pipelining        : Enabled                                              *
;*   Speculate Loads   : Enabled with threshold = 0                           *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : No Debug Info                                        *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss

	.global	a
	.sect	".fardata:a", RW
	.clink
	.align	8
	.elfsym	a,SYM_SIZE(804)
a:
	.word	0b4000001h		; a[0] @ 0
	.word	03edd9cabh		; a[1] @ 32
	.word	0bf5d9cabh		; a[2] @ 64
	.word	03fa63583h		; a[3] @ 96
	.word	0bfdd9ca6h		; a[4] @ 128
	.word	0400a81e9h		; a[5] @ 160
	.word	0c026357eh		; a[6] @ 192
	.word	04041e914h		; a[7] @ 224
	.word	0c05d9caah		; a[8] @ 256
	.word	040795040h		; a[9] @ 288
	.word	0c08a81e9h		; a[10] @ 320
	.word	040985bb4h		; a[11] @ 352
	.word	0c0a6357eh		; a[12] @ 384
	.word	040b40f49h		; a[13] @ 416
	.word	0c0c1e912h		; a[14] @ 448
	.word	040cfc2ddh		; a[15] @ 480
	.word	0c0dd9ca8h		; a[16] @ 512
	.word	040eb7673h		; a[17] @ 544
	.word	0c0f9503eh		; a[18] @ 576
	.word	041039504h		; a[19] @ 608
	.word	0c10a81e9h		; a[20] @ 640
	.word	041116eceh		; a[21] @ 672
	.word	0c1185bb4h		; a[22] @ 704
	.word	0411f4899h		; a[23] @ 736
	.word	0c126357eh		; a[24] @ 768
	.word	0412d2268h		; a[25] @ 800
	.word	0c1340f47h		; a[26] @ 832
	.word	0413afc31h		; a[27] @ 864
	.word	0c141e910h		; a[28] @ 896
	.word	04148d5fah		; a[29] @ 928
	.word	0c14fc2d9h		; a[30] @ 960
	.word	04156afc2h		; a[31] @ 992
	.word	0c15d9cach		; a[32] @ 1024
	.word	04164898bh		; a[33] @ 1056
	.word	0c16b7675h		; a[34] @ 1088
	.word	041726354h		; a[35] @ 1120
	.word	0c179503eh		; a[36] @ 1152
	.word	041801e94h		; a[37] @ 1184
	.word	0c1839503h		; a[38] @ 1216
	.word	041870b78h		; a[39] @ 1248
	.word	0c18a81e8h		; a[40] @ 1280
	.word	0418df85ch		; a[41] @ 1312
	.word	0c1916ecch		; a[42] @ 1344
	.word	04194e541h		; a[43] @ 1376
	.word	0c1985bb6h		; a[44] @ 1408
	.word	0419bd225h		; a[45] @ 1440
	.word	0c19f489ah		; a[46] @ 1472
	.word	041a2bf0ah		; a[47] @ 1504
	.word	0c1a6357eh		; a[48] @ 1536
	.word	041a9abf3h		; a[49] @ 1568
	.word	0c1ad2263h		; a[50] @ 1600
	.word	041b098d8h		; a[51] @ 1632
	.word	0c1b40f47h		; a[52] @ 1664
	.word	041b785bch		; a[53] @ 1696
	.word	0c1bafc2ch		; a[54] @ 1728
	.word	041be72a0h		; a[55] @ 1760
	.word	0c1c1e915h		; a[56] @ 1792
	.word	041c55f85h		; a[57] @ 1824
	.word	0c1c8d5fah		; a[58] @ 1856
	.word	041cc4c69h		; a[59] @ 1888
	.word	0c1cfc2deh		; a[60] @ 1920
	.word	041d3394eh		; a[61] @ 1952
	.word	0c1d6afc2h		; a[62] @ 1984
	.word	041da2637h		; a[63] @ 2016
	.word	0c1dd9ca7h		; a[64] @ 2048
	.word	041e1131ch		; a[65] @ 2080
	.word	0c1e4898bh		; a[66] @ 2112
	.word	041e834d7h		; a[67] @ 2144
	.word	0c1eb7675h		; a[68] @ 2176
	.word	041eeece4h		; a[69] @ 2208
	.word	0c1f26359h		; a[70] @ 2240
	.word	041f5d9c9h		; a[71] @ 2272
	.word	0c1f9503eh		; a[72] @ 2304
	.word	041fcc6b2h		; a[73] @ 2336
	.word	0c2001e91h		; a[74] @ 2368
	.word	04201d9cbh		; a[75] @ 2400
	.word	0c2039503h		; a[76] @ 2432
	.word	04205503eh		; a[77] @ 2464
	.word	0c2070b75h		; a[78] @ 2496
	.word	04208c6b0h		; a[79] @ 2528
	.word	0c20a81eah		; a[80] @ 2560
	.word	0420c3d22h		; a[81] @ 2592
	.word	0c20df85ch		; a[82] @ 2624
	.word	0420fb394h		; a[83] @ 2656
	.word	0c2116ecfh		; a[84] @ 2688
	.word	042132a09h		; a[85] @ 2720
	.word	0c214e541h		; a[86] @ 2752
	.word	04216a07bh		; a[87] @ 2784
	.word	0c2185bb3h		; a[88] @ 2816
	.word	0421a16edh		; a[89] @ 2848
	.word	0c21bd225h		; a[90] @ 2880
	.word	0421d8d60h		; a[91] @ 2912
	.word	0c21f489ah		; a[92] @ 2944
	.word	0422103d2h		; a[93] @ 2976
	.word	0c222bf0ch		; a[94] @ 3008
	.word	042247a44h		; a[95] @ 3040
	.word	0c226357eh		; a[96] @ 3072
	.word	04227f0b6h		; a[97] @ 3104
	.word	0c229abf1h		; a[98] @ 3136
	.word	0422b672bh		; a[99] @ 3168
	.word	0c22d2263h		; a[100] @ 3200
	.word	0422edd9dh		; a[101] @ 3232
	.word	0c23098d5h		; a[102] @ 3264
	.word	04232540fh		; a[103] @ 3296
	.word	0c2340f4ah		; a[104] @ 3328
	.word	04235ca82h		; a[105] @ 3360
	.word	0c23785bch		; a[106] @ 3392
	.word	0423940f4h		; a[107] @ 3424
	.word	0c23afc2eh		; a[108] @ 3456
	.word	0423cb766h		; a[109] @ 3488
	.word	0c23e72a0h		; a[110] @ 3520
	.word	042402ddbh		; a[111] @ 3552
	.word	0c241e913h		; a[112] @ 3584
	.word	04243a44dh		; a[113] @ 3616
	.word	0c2455f85h		; a[114] @ 3648
	.word	042471abfh		; a[115] @ 3680
	.word	0c248d5f7h		; a[116] @ 3712
	.word	0424a9131h		; a[117] @ 3744
	.word	0c24c4c6ch		; a[118] @ 3776
	.word	0424e07a4h		; a[119] @ 3808
	.word	0c24fc2deh		; a[120] @ 3840
	.word	042517e16h		; a[121] @ 3872
	.word	0c2533950h		; a[122] @ 3904
	.word	04254f48bh		; a[123] @ 3936
	.word	0c256afc2h		; a[124] @ 3968
	.word	042586afdh		; a[125] @ 4000
	.word	0c25a2637h		; a[126] @ 4032
	.word	0425be16fh		; a[127] @ 4064
	.word	0c25d9ca7h		; a[128] @ 4096
	.word	0425f57e1h		; a[129] @ 4128
	.word	0c261131ch		; a[130] @ 4160
	.word	04262ce53h		; a[131] @ 4192
	.word	0c264898eh		; a[132] @ 4224
	.word	0426644c8h		; a[133] @ 4256
	.word	0c2680292h		; a[134] @ 4288
	.word	04269bb38h		; a[135] @ 4320
	.word	0c26b7672h		; a[136] @ 4352
	.word	0426d31adh		; a[137] @ 4384
	.word	0c26eece4h		; a[138] @ 4416
	.word	04270a81fh		; a[139] @ 4448
	.word	0c2726359h		; a[140] @ 4480
	.word	042741e91h		; a[141] @ 4512
	.word	0c275d9cbh		; a[142] @ 4544
	.word	042779503h		; a[143] @ 4576
	.word	0c279503eh		; a[144] @ 4608
	.word	0427b0b75h		; a[145] @ 4640
	.word	0c27cc6b0h		; a[146] @ 4672
	.word	0427e81eah		; a[147] @ 4704
	.word	0c2801e91h		; a[148] @ 4736
	.word	04280fc2eh		; a[149] @ 4768
	.word	0c281d9cbh		; a[150] @ 4800
	.word	04282b767h		; a[151] @ 4832
	.word	0c2839505h		; a[152] @ 4864
	.word	0428472a0h		; a[153] @ 4896
	.word	0c285503eh		; a[154] @ 4928
	.word	042862dd9h		; a[155] @ 4960
	.word	0c2870b75h		; a[156] @ 4992
	.word	04287e913h		; a[157] @ 5024
	.word	0c288c6b0h		; a[158] @ 5056
	.word	04289a44ch		; a[159] @ 5088
	.word	0c28a81e9h		; a[160] @ 5120
	.word	0428b5f86h		; a[161] @ 5152
	.word	0c28c3d22h		; a[162] @ 5184
	.word	0428d1abfh		; a[163] @ 5216
	.word	0c28df85ch		; a[164] @ 5248
	.word	0428ed5f8h		; a[165] @ 5280
	.word	0c28fb396h		; a[166] @ 5312
	.word	042909131h		; a[167] @ 5344
	.word	0c2916ecfh		; a[168] @ 5376
	.word	042924c6ah		; a[169] @ 5408
	.word	0c2932a08h		; a[170] @ 5440
	.word	0429407a4h		; a[171] @ 5472
	.word	0c294e541h		; a[172] @ 5504
	.word	04295c2deh		; a[173] @ 5536
	.word	0c296a07ah		; a[174] @ 5568
	.word	042977e17h		; a[175] @ 5600
	.word	0c2985bb4h		; a[176] @ 5632
	.word	042993950h		; a[177] @ 5664
	.word	0c29a16edh		; a[178] @ 5696
	.word	0429af48bh		; a[179] @ 5728
	.word	0c29bd227h		; a[180] @ 5760
	.word	0429cafc2h		; a[181] @ 5792
	.word	0c29d8d60h		; a[182] @ 5824
	.word	0429e6afbh		; a[183] @ 5856
	.word	0c29f4899h		; a[184] @ 5888
	.word	042a02636h		; a[185] @ 5920
	.word	0c2a103d2h		; a[186] @ 5952
	.word	042a1e16fh		; a[187] @ 5984
	.word	0c2a2bf0bh		; a[188] @ 6016
	.word	042a39ca8h		; a[189] @ 6048
	.word	0c2a47a45h		; a[190] @ 6080
	.word	042a557e1h		; a[191] @ 6112
	.word	0c2a6357eh		; a[192] @ 6144
	.word	042a7131ch		; a[193] @ 6176
	.word	0c2a7f0b8h		; a[194] @ 6208
	.word	042a8ce53h		; a[195] @ 6240
	.word	0c2a9abf1h		; a[196] @ 6272
	.word	042aa898ch		; a[197] @ 6304
	.word	0c2ab672ah		; a[198] @ 6336
	.word	042ac44c7h		; a[199] @ 6368
	.word	0c2ad2263h		; a[200] @ 6400

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\010763 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\010765 
	.sect	".text"
	.clink
	.global	main

;******************************************************************************
;* FUNCTION NAME: main                                                        *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,  *
;*                           A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20,B21, *
;*                           B22,B23,B24,B25,B26,B27,B28,B29,B30,B31          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,DP,SP,A16,A17,A18,A19,A20,A21,A22,A23,A24,   *
;*                           A25,A26,A27,A28,A29,A30,A31,B16,B17,B18,B19,B20, *
;*                           B21,B22,B23,B24,B25,B26,B27,B28,B29,B30,B31      *
;*   Local Frame Size  : 8 Args + 64 Auto + 56 Save = 128 byte                *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |124| 
           STW     .D2T1   A10,*SP--(8)      ; |124| 
           STDW    .D2T2   B13:B12,*SP--     ; |124| 
           STDW    .D2T2   B11:B10,*SP--     ; |124| 
           STDW    .D2T1   A15:A14,*SP--     ; |124| 

           STDW    .D2T1   A13:A12,*SP--     ; |124| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(80)      ; |124| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |133| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     a,A12

           MVKH    .S1     a,A12
||         MVKL    .S2     output,B11

           CALL    .S1     expf              ; |142| 
||         MV      .L1     A12,A13
||         MV      .D1X    B4,A11
||         MVKH    .S2     output,B11
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A13++,A4         ; |142| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |142| 
$C$RL1:    ; CALL OCCURS {expf} {0}          ; |142| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |142| 
||         SUB     .L1     A11,1,A0          ; |141| 
||         SUB     .S1     A11,1,A11         ; |141| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |141| 

           ADD     .L2     B10,B4,B4         ; |142| 
||         ADD     .S2     4,B10,B10         ; |141| 

   [ A0]   CALL    .S1     expf              ; |142| 
||         STW     .D2T1   A4,*B4            ; |142| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A12,A10
||         ADD     .S2     4,B11,B12

           MV      .L1X    B4,A11
||         CALL    .S1     expsp             ; |145| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |145| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |145| 
$C$RL2:    ; CALL OCCURS {expsp} {0}         ; |145| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |145| 
||         SUB     .L1     A11,1,A0          ; |144| 
||         SUB     .S1     A11,1,A11         ; |144| 

   [ A0]   BNOP    .S1     $C$L2,3           ; |144| 

           ADD     .L2     B10,B4,B4         ; |145| 
||         ADD     .S2     4,B10,B10         ; |144| 

   [ A0]   CALL    .S1     expsp             ; |145| 
||         STW     .D2T1   A4,*B4            ; |145| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L2}         ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A10,A12
||         ADD     .S2     4,B12,B13

           MV      .L1X    B4,A11
||         CALL    .S1     expsp_c           ; |148| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |148| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |148| 
$C$RL3:    ; CALL OCCURS {expsp_c} {0}       ; |148| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |148| 
||         SUB     .L1     A11,1,A0          ; |147| 
||         SUB     .S1     A11,1,A11         ; |147| 

   [ A0]   B       .S2     $C$L3             ; |147| 
|| [!A0]   ZERO    .L1     A7
|| [!A0]   MVKL    .S1     0x3d317000,A5

   [!A0]   MVKH    .S1     0xfff00000,A7

   [!A0]   MVKH    .S1     0x3d317000,A5
|| [!A0]   STW     .D2T1   A7,*+SP(32)

   [!A0]   MV      .L2X    A7,B23
|| [!A0]   ZERO    .L1     A7

           ADD     .L2     B10,B4,B4         ; |148| 
||         ADD     .S2     4,B10,B10         ; |147| 

   [ A0]   CALL    .S2     expsp_c           ; |148| 
||         STW     .D2T1   A4,*B4            ; |148| 
|| [!A0]   MVKL    .S1     ti_math_kTable,A4

           ; BRANCHCC OCCURS {$C$L3}         ; |147| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           STW     .D2T1   A5,*+SP(20)
||         SET     .S1     A7,0x17,0x1d,A5
||         MVKL    .S2     ti_math_jTable,B6
||         MV      .L2X    A5,B25
||         ZERO    .L1     A6

           MVKL    .S1     0x3effffff,A3
||         MVKL    .S2     0x3605fdf4,B12
||         ZERO    .L2     B31
||         ADD     .D2     4,B13,B13

           MVKL    .S1     0x7f7fffff,A12
||         MVKH    .S2     ti_math_jTable,B6
||         MV      .L2X    A5,B22
||         ADD     .L1     -2,A5,A5
||         STW     .D2T2   B31,*+SP(52)

           MVKH    .S1     ti_math_kTable,A4
||         MVKH    .S2     0x3605fdf4,B12
||         MV      .L1     A5,A7
||         STW     .D2T1   A5,*+SP(44)
||         ZERO    .L2     B19

           MVKH    .S1     0x3effffff,A3
||         MVKL    .S2     0x41b8aa3b,B4
||         STW     .D2T1   A4,*+SP(28)
||         MV      .L2X    A10,B8

           MVKH    .S1     0x7f7fffff,A12
||         MVKL    .S2     0x3e2abce4,B5
||         STW     .D2T1   A3,*+SP(36)
||         MV      .L2X    A4,B24
||         ADD     .L1     1,A3,A4
||         MV      .D1X    B12,A16

           MVKH    .S1     0xbf000000,A6
||         MVKH    .S2     0x41b8aa3b,B4
||         STW     .D2T1   A4,*+SP(16)
||         ADD     .L2X    1,A3,B26

           MVKL    .S1     0x42b17218,A13
||         MVKH    .S2     0x3e2abce4,B5
||         STW     .D2T1   A6,*+SP(12)
||         MV      .L2X    A12,B18

           MVK     .S1     0x72,A8
||         STW     .D2T2   B5,*+SP(40)
||         DINT                              ; interrupts off
||         MV      .L2X    A6,B28

           MVKL    .S1     0xc2aeac50,A14
||         STW     .D2T1   A8,*+SP(48)
||         MV      .L2     B4,B27
||         MV      .S2     B5,B21

           MVKH    .S1     0x42b17218,A13
||         LDW     .D2T1   *+SP(36),A8
||         MV      .L2X    A8,B20

           MVKH    .S1     0xc2aeac50,A14
||         MV      .L1     A13,A3
||         STW     .D2T1   A12,*+SP(56)

           MVK     .S1     0xc9,A9
||         MV      .L1     A14,A6
||         STW     .D2T2   B6,*+SP(24)

           SUB     .L1     A9,1,A1
||         MV      .S1X    B6,A9
||         LDW     .D2T2   *B13,B9

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/expsp/expsp_d.c
;*      Loop source line                 : 150
;*      Loop opening brace source line   : 150
;*      Loop closing brace source line   : 152
;*      Known Minimum Trip Count         : 201                    
;*      Known Maximum Trip Count         : 201                    
;*      Known Max Trip Count Factor      : 201
;*      Loop Carried Dependency Bound(^) : 72
;*      Unpartitioned Resource Bound     : 8
;*      Partitioned Resource Bound(*)    : 9
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        4     
;*      .S units                     3        4     
;*      .D units                     1        3     
;*      .M units                     7        7     
;*      .X cross paths               9*       5     
;*      .T address paths             1        3     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        7     (.L or .S unit)
;*      Addition ops (.LSD)          2        9     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             2        8     
;*      Bound(.L .S .D .LS .LSD)     2        9*    
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 72 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: | * *  ****      *               |        **        ***********   |
;*       1: | * *  ****      *               |        **        ***********   |
;*       2: | * *  ****      *               |        **        ***********   |
;*       3: | * *  ****      *               |        **        ***********   |
;*       4: | * *  ****      *               |        **        ***********   |
;*       5: | * *  ****      *               |    *   **        ***********   |
;*       6: | * *  ****      *               |    *   **        ************  |
;*       7: | * *  ****      *               |    *   **        ************  |
;*       8: | * *  ****      *               |    *   **        ************  |
;*       9: | * *  ****      *               |    **  **        ************  |
;*      10: | * *  ****      *               |    * * **        ************  |
;*      11: | * *  ****      *               |    * * **        ************  |
;*      12: | * *  ****      *               |    * * **        ************  |
;*      13: | * *  ****      *               |    *** **        ************  |
;*      14: | * *  ****      *               |    * * **        ************  |
;*      15: | * *  ****      *               |    * * **        ************  |
;*      16: | * *  ****      *               |    * * **        ************  |
;*      17: | * *  ****      *               |    *** **        ************  |
;*      18: | * *  ****      *               |    *** **        ************  |
;*      19: | * *  ****      *               |    *** **        ************  |
;*      20: | * ** ****      *               |    *** **        ************  |
;*      21: | * *  ****      *               |    * * **        ************  |
;*      22: | * *  ****      *               |    *** **        ************  |
;*      23: | * *  ****      *               |    *** **        ************  |
;*      24: | * *  ****      *               |    * * **        ************  |
;*      25: | * *******      *               |    * * **      **************  |
;*      26: | * *******      *               |    *** **      **************  |
;*      27: | * *******      **              |    * * **      **************  |
;*      28: | * *******      **              |    * * **      **************  |
;*      29: | * *  ****      **              |    * * **        ************  |
;*      30: | * *  ****      **              |    *** **        ************  |
;*      31: | * *  ****      *               |    * * **        ************  |
;*      32: | * *  ****      *               |    * * **        ************  |
;*      33: | * *  ****      *               |    * * **        ************  |
;*      34: | * *  ****      *               |    *** **        ************  |
;*      35: | * *******      *               |    *** **        ************  |
;*      36: | * *******      *               |    *** **        ************  |
;*      37: | * ** ****      *               |    ** ***        ************  |
;*      38: | * ** ****      *               |    ******        ************  |
;*      39: | * *******      *               |    * ****        ************  |
;*      40: | * *******      *               |    *  ***        ************  |
;*      41: | * *******      *               |    *  ***        ************  |
;*      42: | * *******      *               |    ** ***        ************  |
;*      43: | * *******      **              |    *  ***        ************  |
;*      44: | * *******      **              |    *  ***        ************  |
;*      45: | * *******      **              |    *  ***        ************  |
;*      46: | * *******      **              |    ** ***        ************  |
;*      47: | * *******      *               |    *  ***        ************  |
;*      48: | * *******      *               |    *  ***        ************  |
;*      49: | * *******      *               |    *  ***        ************  |
;*      50: | * *******      *               |    ** ***        ************  |
;*      51: | * ** ****      *               |    *  ***        ************  |
;*      52: | * ** ****      *               |    *  ***        ************  |
;*      53: | * ** ****      *               |    *  ***        ************  |
;*      54: | * ** ****      *               |    ** ***        ************  |
;*      55: | * ** ****      *               |    *  ***        ************  |
;*      56: | * ** ****      *               |    *  ***        ************  |
;*      57: | * ** ****      *               |    *  ***        ************  |
;*      58: | * *  ****      *               |    ******        ************  |
;*      59: | * *  ****      *               |    ******        ************  |
;*      60: | * *  ****      *               |    *   **        ************  |
;*      61: | * *  ****      *               |    *   **        ************  |
;*      62: | * *  ****      *               |    *   **        ************  |
;*      63: | * *  ****      *               |    *   **        ************  |
;*      64: | * *  ****      *               |    *   **        ************  |
;*      65: | * *  ****      *               |*   * ****        ***********   |
;*      66: | * *  ****      *               |    *   **        ***********   |
;*      67: | * *  ****      *               |    *   **        ***********   |
;*      68: | * ** ****      *               |        **        ***********   |
;*      69: |** ** ****      *               |     *  **        ***********   |
;*      70: |** *  ****      *               |    **  **        ***********   |
;*      71: | * *  ****      *               |    *** **        ***********   |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*
;*      Minimum safe trip count       : 1
;*
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.250, max 1.000 }
;*      Mem bank perf. penalty (est.) : 0.3%
;*
;*      Effective ii                : { min 72.00, est 72.25, max 73.00 }
;*
;*
;*      Total cycles (est.)         : 0 + min_trip_cnt * 72 = 14472        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A1,1,A1
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C111:
;*   0              LDW     .D2T2   *B8++,B4          ; |76|  ^ 
;*   1              NOP             4
;*   5              MPYSP   .M2     B27,B4,B5         ; |76|  ^ 
;*     ||           EXTU    .S2     B4,1,24,B29       ; |88| 
;*   6              NOP             3
;*   9              CMPLTSP .S2     B5,B28,B6         ; |76| 
;*     ||           ADDSP   .L2     B26,B5,B5         ; |76|  ^ 
;*  10              NOP             3
;*  13              SPTRUNC .L2     B5,B5             ; |76|  ^ 
;*  14              NOP             3
;*  17              SUB     .S2     B5,B6,B6          ; |76|  ^ 
;*     ||           SUB     .L2     B5,B6,B5          ; |88| 
;*  18              INTSP   .L2     B6,B5             ; |76|  ^ 
;*     ||           SHL     .S2     B5,16,B5          ; |88| 
;*  19              EXTU    .S2     B6,28,30,B5       ; |88| 
;*     ||           AND     .L1X    3,B6,A4           ; |88| 
;*     ||           AND     .L2     B23,B5,B6         ; |88| 
;*  20              LDDW    .D2T2   *+B24[B5],B17:B16 ; |88| 
;*     ||           LDDW    .D1T1   *+A9[A4],A5:A4    ; |88| 
;*  21              NOP             1
;*  22              MPYSP   .M2     B25,B5,B5         ; |76|  ^ 
;*  23              MPYSP   .M1X    A16,B5,A17        ; |76| 
;*  24              NOP             1
;*  25              MPYDP   .M1X    A5:A4,B17:B16,A5:A4 ; |88| 
;*  26              SUBSP   .L2     B4,B5,B5          ; |76|  ^ 
;*  27              NOP             3
;*  30              SUBSP   .L2X    B5,A17,B5         ; |76|  ^ 
;*  31              NOP             3
;*  34              MPYSP   .M2     B5,B5,B6          ; |76|  ^ 
;*  35              MPYSP   .M1X    A7,B5,A5          ; |88| 
;*  36              ADD     .L2X    B6,A5,B7          ; |88| 
;*  37              NOP             1
;*  38              MPYSP   .M2     B6,B5,B5          ; |88|  ^ 
;*  39              MPYSP   .M1X    A8,B6,A17         ; |88| 
;*  40              NOP             2
;*  42              MPYSP   .M2     B21,B5,B5         ; |88|  ^ 
;*  43              NOP             3
;*  46              ADDSP   .L2X    A17,B5,B5         ; |88|  ^ 
;*  47              NOP             3
;*  50              ADDSP   .L2X    B5,A5,B5          ; |88|  ^ 
;*  51              NOP             3
;*  54              ADDSP   .L2     B22,B5,B5         ; |88|  ^ 
;*  55              NOP             2
;*  57              MV      .S2X    A4,B6             ; |88| 
;*  58              MPYSPDP .M2     B5,B7:B6,B7:B6    ; |88|  ^ 
;*  59              NOP             5
;*  64              CMPLTU  .L2     B29,B20,B0        ; |88| 
;*  65      [ B0]   ADDSP   .S2     B22,B4,B5         ; |88| 
;*     ||   [!B0]   DPSP    .L2     B7:B6,B5          ; |88|  ^ 
;*  66      [ A1]   BDEC    .S1     $C$C111,A1        ; |150| 
;*  67              MV      .L1X    B4,A4             ; |76| Define a twin register
;*  68              CMPLTSP .S1     A4,A6,A0          ; |88| 
;*  69      [!A0]   MV      .S2     B5,B4             ; |88|  ^ 
;*     ||   [ A0]   MV      .L2     B19,B4            ; |88| 
;*     ||           CMPGTSP .S1     A4,A3,A0          ; |88| 
;*  70      [!A0]   MV      .S2     B4,B6             ; |88|  ^ 
;*     ||   [ A0]   MV      .L2     B18,B6            ; |88| 
;*  71              STW     .D2T2   B6,*B9++          ; |88|  ^ 
;*  72              ; BRANCHCC OCCURS {$C$C111}       ; |150| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 72
           LDW     .D2T2   *B8++,B4          ; |76| <0,0>  ^ 
           NOP             4

           EXTU    .S2     B4,1,24,B29       ; |88| <0,5> 
||         MPYSP   .M2     B27,B4,B5         ; |76| <0,5>  ^ 

           NOP             3

           CMPLTSP .S2     B5,B28,B6         ; |76| <0,9> 
||         ADDSP   .L2     B26,B5,B5         ; |76| <0,9>  ^ 

           NOP             3
           SPTRUNC .L2     B5,B5             ; |76| <0,13>  ^ 
           NOP             3

           SUB     .L2     B5,B6,B5          ; |88| <0,17> 
||         SUB     .S2     B5,B6,B6          ; |76| <0,17>  ^ 

           SHL     .S2     B5,16,B5          ; |88| <0,18> 
||         INTSP   .L2     B6,B5             ; |76| <0,18>  ^ 

           AND     .L2     B23,B5,B6         ; |88| <0,19> 
||         EXTU    .S2     B6,28,30,B5       ; |88| <0,19> 
||         AND     .L1X    3,B6,A4           ; |88| <0,19> 

           LDDW    .D2T2   *+B24[B5],B17:B16 ; |88| <0,20> 
||         LDDW    .D1T1   *+A9[A4],A5:A4    ; |88| <0,20> 

           NOP             1
           MPYSP   .M2     B25,B5,B5         ; |76| <0,22>  ^ 
           MPYSP   .M1X    A16,B5,A17        ; |76| <0,23> 
           NOP             1
           MPYDP   .M1X    A5:A4,B17:B16,A5:A4 ; |88| <0,25> 
           SUBSP   .L2     B4,B5,B5          ; |76| <0,26>  ^ 
           NOP             3
           SUBSP   .L2X    B5,A17,B5         ; |76| <0,30>  ^ 
           NOP             3
           MPYSP   .M2     B5,B5,B6          ; |76| <0,34>  ^ 
           MPYSP   .M1X    A7,B5,A5          ; |88| <0,35> 
           ADD     .L2X    B6,A5,B7          ; |88| <0,36> 
           NOP             1
           MPYSP   .M2     B6,B5,B5          ; |88| <0,38>  ^ 
           MPYSP   .M1X    A8,B6,A17         ; |88| <0,39> 
           NOP             2
           MPYSP   .M2     B21,B5,B5         ; |88| <0,42>  ^ 
           NOP             3
           ADDSP   .L2X    A17,B5,B5         ; |88| <0,46>  ^ 
           NOP             3
           ADDSP   .L2X    B5,A5,B5          ; |88| <0,50>  ^ 
           NOP             3
           ADDSP   .L2     B22,B5,B5         ; |88| <0,54>  ^ 
           NOP             2
           MV      .S2X    A4,B6             ; |88| <0,57> 
           MPYSPDP .M2     B5,B7:B6,B7:B6    ; |88| <0,58>  ^ 
           NOP             5
           CMPLTU  .L2     B29,B20,B0        ; |88| <0,64> 

   [ B0]   ADDSP   .S2     B22,B4,B5         ; |88| <0,65> 
|| [!B0]   DPSP    .L2     B7:B6,B5          ; |88| <0,65>  ^ 

   [ A1]   BDEC    .S1     $C$L5,A1          ; |150| <0,66> 
           MV      .L1X    B4,A4             ; |76| <0,67> Define a twin register
           CMPLTSP .S1     A4,A6,A0          ; |88| <0,68> 

           CMPGTSP .S1     A4,A3,A0          ; |88| <0,69> 
|| [ A0]   MV      .L2     B19,B4            ; |88| <0,69> 
|| [!A0]   MV      .S2     B5,B4             ; |88| <0,69>  ^ 

   [ A0]   MV      .L2     B18,B6            ; |88| <0,70> 
|| [!A0]   MV      .S2     B4,B6             ; |88| <0,70>  ^ 

           STW     .D2T2   B6,*B9++          ; |88| <0,71>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           STW     .D2T2   B26,*+SP(16)
           STW     .D2T2   B25,*+SP(20)
           STW     .D2T2   B24,*+SP(28)
           STW     .D2T2   B23,*+SP(32)
           STW     .D2T2   B21,*+SP(40)
           STW     .D2T2   B20,*+SP(48)
           STW     .D2T2   B19,*+SP(52)
           STW     .D2T2   B18,*+SP(56)
           STW     .D2T1   A9,*+SP(24)
           STW     .D2T1   A8,*+SP(36)
           STW     .D2T1   A7,*+SP(44)

           MV      .L1     A6,A14
||         RINT                              ; interrupts on
||         MV      .L2X    A16,B12
||         STW     .D2T2   B28,*+SP(12)
||         MV      .S1     A10,A4            ; |153| 

           CALLP   .S2     expsp_v,B3
||         LDW     .D2T2   *+B11(16),B4      ; |153| 
||         MVK     .S1     0xc9,A6           ; |153| 
||         MV      .L1     A3,A13
||         MV      .L2     B22,B10
||         MV      .D1X    B27,A15

$C$RL4:    ; CALL OCCURS {expsp_v} {0}       ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 40
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0x3eb0c6f7,B7

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D1T1   A4,*+A3(4)        ; |66| 
||         LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B11,A5
||         STW     .D1T1   A4,*+A3(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A5,A4            ; |68| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     fcn_pass,A3
||         ADD     .L2     4,B13,B4
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B11,A5
||         STW     .D1T1   A4,*+A3(12)       ; |68| 
||         STW     .D2T2   B4,*+SP(64)
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A5,A4            ; |69| 
||         LDW     .D2T2   *B4,B4            ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S2     fcn_pass,B4
||         MVKL    .S1     fcn_pass,A3

           MVKH    .S2     fcn_pass,B4
||         MVKH    .S1     fcn_pass,A3

           ADD     .L2     4,B4,B4
           LDW     .D2T2   *B4,B0            ; |72| 
           STW     .D1T1   A4,*+A3(16)       ; |69| 
           STW     .D2T2   B4,*+SP(68)
           ADD     .L2X    8,A3,B4
           STW     .D2T2   B4,*+SP(72)       ; |69| 

   [!B0]   B       .S2     $C$L7             ; |72| 
|| [!B0]   MVKL    .S1     all_pass,A3
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [!B0]   ZERO    .D2     B4                ; |72| 

   [!B0]   CALL    .S2     print_test_results ; |159| 
|| [!B0]   MVKH    .S1     all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L7}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1

   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
||         MVK     .L2     0x1,B4            ; |72| 

   [!A0]   ZERO    .L2     B4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |159| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |159| 
||         STW     .D1T2   B4,*A3            ; |72| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |159| 

$C$RL9:    ; CALL OCCURS {print_test_results} {0}  ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MVKL    .S2     a_sc,B6

           LDW     .D2T1   *+SP(52),A6
||         MVKH    .S2     a_sc,B6
||         ZERO    .L2     B5
||         ZERO    .L1     A5

           MVKH    .S1     0xff800000,A5
||         MVKH    .S2     0xbf800000,B5
||         ZERO    .L1     A7
||         MV      .L2     B10,B4            ; |171| 

           MV      .L2     B6,B4
||         STDW    .D2T2   B5:B4,*+B6(16)    ; |171| 
||         MVKH    .S1     0x80000000,A7
||         ADD     .L1     1,A12,A4

           MVK     .L2     0x8,B4
||         STDW    .D2T1   A5:A4,*+B4(8)     ; |169| 
||         ADD     .L1     -1,A7,A8
||         MV      .S1X    B11,A11
||         MVK     .D1     -1,A9             ; |173| 

           STDW    .D2T1   A9:A8,*+B6(24)    ; |173| 
||         MV      .L1X    B6,A10            ; |167| 

           CALL    .S1     expf              ; |176| 
||         MV      .L1X    B4,A12            ; |169| 
||         STDW    .D2T1   A7:A6,*B6         ; |167| 
||         ZERO    .L2     B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A10,A4           ; |176| 
           ADDKPC  .S2     $C$RL10,B3,3      ; |176| 
$C$RL10:   ; CALL OCCURS {expf} {0}          ; |176| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D1T1   *A11,A3           ; |176| 
           NOP             4
           ADD     .L1X    B11,A3,A3         ; |176| 
           STW     .D1T1   A4,*A3            ; |176| 

           CALLP   .S2     expsp,B3
||         LDW     .D1T1   *A10,A4           ; |177| 

$C$RL11:   ; CALL OCCURS {expsp} {0}         ; |177| 
           LDW     .D1T1   *+A11(4),A3       ; |177| 
           NOP             4
           ADD     .L1X    B11,A3,A3         ; |177| 
           STW     .D1T1   A4,*A3            ; |177| 

           CALLP   .S2     expsp_c,B3
||         LDW     .D1T1   *A10,A4           ; |178| 

$C$RL12:   ; CALL OCCURS {expsp_c} {0}       ; |178| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 81
           LDW     .D1T1   *+A11(8),A3       ; |178| 
           LDW     .D2T1   *+SP(16),A31
           LDW     .D2T1   *+SP(12),A30
           LDW     .D2T2   *+SP(24),B4       ; |90| 
           LDW     .D2T1   *+SP(28),A28      ; |90| 
           ADD     .L1X    B11,A3,A3         ; |178| 
           STW     .D1T1   A4,*A3            ; |178| 
           LDW     .D1T1   *A10++,A6         ; |179| 
           LDW     .D2T1   *+SP(20),A29      ; |90| 
           LDW     .D2T1   *+SP(36),A27
           LDW     .D2T2   *+SP(40),B31      ; |90| 
           LDW     .D2T1   *+SP(44),A26
           MPYSP   .M1     A15,A6,A4         ; |69| 
           LDW     .D2T1   *+SP(32),A24      ; |90| 
           LDW     .D2T2   *B13,B30          ; |179| 
           LDW     .D2T1   *+SP(48),A22      ; |93| 
           ADDSP   .L1     A31,A4,A3         ; |69| 
           CMPLTSP .S1     A4,A30,A0         ; |70| 
           EXTU    .S1     A6,1,24,A23       ; |93| 
           CMPLTSP .S1     A6,A14,A1         ; |98| 
           SPTRUNC .L1     A3,A7             ; |69| 
           CMPGTSP .S1     A6,A13,A2         ; |103| 
           NOP             2
   [ A0]   SUB     .L1     A7,1,A7           ; |71| 

           INTSP   .L1     A7,A8             ; |90| 
||         EXTU    .S1     A7,28,30,A5       ; |90| 

           LDDW    .D1T1   *+A28[A5],A5:A4   ; |90| 
           AND     .L2X    3,A7,B5           ; |90| 
           LDDW    .D2T2   *+B4[B5],B5:B4    ; |90| 
           MPYSP   .M1     A29,A8,A3         ; |90| 
           MPYSP   .M2X    B12,A8,B6         ; |90| 
           SHL     .S1     A7,16,A25         ; |90| 
           CMPLTU  .L1     A23,A22,A0        ; |93| 
           SUBSP   .L1     A6,A3,A3          ; |90| 
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |90| 
           NOP             3
           SUBSP   .L2X    A3,B6,B7          ; |90| 
           NOP             3
           MPYSP   .M2     B7,B7,B6          ; |90| 
           MPYSP   .M1X    A26,B7,A3         ; |90| 
           NOP             2
           MPYSP   .M2     B6,B7,B8          ; |90| 
           MPYSP   .M1X    A27,B6,A4         ; |90| 
           NOP             2
           MPYSP   .M2     B31,B8,B6         ; |90| 
           NOP             3
           ADDSP   .L2X    A4,B6,B6          ; |90| 
           NOP             3
           ADDSP   .L2X    B6,A3,B6          ; |90| 
           AND     .L1     A24,A25,A3        ; |90| 
           NOP             2
           ADDSP   .L2     B10,B6,B6         ; |90| 
           ADD     .L2X    A3,B5,B5          ; |90| 
           NOP             2
           MPYSPDP .M2     B6,B5:B4,B5:B4    ; |90| 
           ADD     .L2     B11,B30,B6        ; |179| 
           ADD     .L2     4,B11,B11         ; |175| 
           NOP             4
           DPSP    .L2     B5:B4,B5          ; |90| 

   [ A0]   ADDSP   .L2X    B10,A6,B5         ; |94| 
|| [ A1]   LDW     .D2T2   *+SP(52),B5       ; |103| 
||         SUB     .L1     A12,1,A1          ; |175| 
||         SUB     .S1     A12,1,A12         ; |175| 

   [ A1]   BNOP    .S1     $C$L8,4           ; |175| 
|| [ A2]   LDW     .D2T2   *+SP(56),B5       ; |99| 

   [ A1]   CALL    .S1     expf              ; |176| 
||         STW     .D2T2   B5,*B6            ; |179| 

           ; BRANCHCC OCCURS {$C$L8}         ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           MV      .L2X    A11,B11           ; |181| 
||         CALL    .S1     expsp_v           ; |181| 

           LDW     .D2T2   *+B11(16),B4      ; |181| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           ADDKPC  .S2     $C$RL13,B3,0      ; |181| 
           MVK     .L1     0x8,A6            ; |181| 
$C$RL13:   ; CALL OCCURS {expsp_v} {0}       ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .L1     0x8,A6            ; |66| 
||         MVK     .S1     0x9,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     fcn_pass,B5
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .L1     0x8,A6            ; |67| 
||         MVK     .S1     0x9,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A11,A4           ; |68| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVK     .L1     0x8,A6            ; |68| 
||         MVK     .S1     0x9,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4

           LDW     .D2T1   *+SP(64),A12      ; |68| 
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     fcn_pass,B4

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D1T1   *A11,A4           ; |69| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A12,B4           ; |69| 
||         MVK     .L1     0x8,A6            ; |69| 
||         MVK     .S1     0x9,A8            ; |69| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(68),A3       ; |69| 
           LDW     .D2T2   *+SP(72),B13
           MVKL    .S2     fcn_pass,B4
           MVKH    .S2     fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A3,*+SP(60)       ; |69| 
           NOP             3

   [!A0]   B       .S1     $C$L9             ; |72| 
|| [ A0]   LDW     .D2T2   *B13,B0           ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |185| 
   [ A0]   ADD     .L2     4,B13,B4
   [!A0]   MVKL    .S2     all_pass,B4
   [!A0]   ZERO    .L2     B5                ; |72| 
   [!A0]   MVKH    .S2     all_pass,B4
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           MVK     .L2     0x1,B5            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   ZERO    .L2     B5                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |185| 
           MVKL    .S2     all_pass,B4
           MVKH    .S2     all_pass,B4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x3,A4            ; |185| 
||         STW     .D2T2   B5,*B4            ; |72| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |185| 

$C$RL18:   ; CALL OCCURS {print_test_results} {0}  ; |185| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S1     a_ext,A3
           MVKH    .S1     a_ext,A3
           MV      .L1     A3,A10            ; |188| 

           MVK     .S1     0xed,A3
||         ZERO    .L1     A4
||         MV      .L2X    A3,B4             ; |188| 

           SET     .S1     A4,0x17,0x17,A4

           MV      .L2X    A3,B11            ; |188| 
||         STW     .D2T1   A4,*B4            ; |188| 
||         ZERO    .L1     A11
||         CALL    .S1     expf              ; |190| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A10,A4           ; |190| 
           ADDKPC  .S2     $C$RL19,B3,3      ; |190| 
$C$RL19:   ; CALL OCCURS {expf} {0}          ; |190| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T1   *A3,A3            ; |190| 
           ZERO    .L1     A31
           MVKH    .S1     0xc3800000,A31
           NOP             2
           ADD     .L1     A11,A3,A3         ; |190| 
           STW     .D1T1   A4,*A3            ; |190| 
           LDW     .D1T1   *A10,A4           ; |191| 
           NOP             4
           CMPGTSP .S1     A4,A31,A0         ; |191| 
   [!A0]   B       .S1     $C$L11            ; |191| 
   [ A0]   CALL    .S1     expsp             ; |191| 
   [!A0]   CALL    .S1     expf              ; |191| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L11}        ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL20,B3,0      ; |191| 
$C$RL20:   ; CALL OCCURS {expsp} {0}         ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S2     $C$L12            ; |191| 
||         MVKL    .S1     output,A3

           MVKH    .S1     output,A3
           LDW     .D1T2   *+A3(4),B5        ; |191| 
           MV      .L2X    A4,B4             ; |191| 
           NOP             2
           ; BRANCH OCCURS {$C$L12}          ; |191| 
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL21,B3,1      ; |191| 
$C$RL21:   ; CALL OCCURS {expf} {0}          ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T2   *+A3(4),B5        ; |191| 
           MV      .L2X    A4,B4             ; |191| 
           NOP             2
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 8
           NOP             1
           ADD     .L2X    A11,B5,B5         ; |191| 

           STW     .D2T2   B4,*B5            ; |191| 
||         CALL    .S1     expsp_c           ; |192| 

           LDW     .D1T1   *A10,A4           ; |192| 
           ADDKPC  .S2     $C$RL22,B3,3      ; |192| 
$C$RL22:   ; CALL OCCURS {expsp_c} {0}       ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 100
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3
           LDW     .D1T1   *+A3(8),A3        ; |192| 
           LDW     .D2T1   *+SP(16),A31
           LDW     .D2T1   *+SP(12),A30
           LDW     .D2T2   *+SP(24),B5       ; |90| 
           LDW     .D2T1   *+SP(28),A5       ; |90| 
           ADD     .L1     A11,A3,A3         ; |192| 
           STW     .D1T1   A4,*A3            ; |192| 
           LDW     .D1T1   *A10,A6           ; |193| 
           LDW     .D2T1   *+SP(20),A29      ; |90| 
           LDW     .D2T1   *+SP(36),A28
           LDW     .D2T2   *+SP(40),B31      ; |90| 
           LDW     .D2T1   *+SP(44),A27
           MPYSP   .M1     A15,A6,A4         ; |69| 
           LDW     .D2T1   *+SP(32),A25      ; |90| 
           MVKL    .S1     output+12,A24
           LDW     .D2T1   *+SP(48),A22      ; |93| 
           ADDSP   .L1     A31,A4,A3         ; |69| 
           CMPLTSP .S1     A4,A30,A0         ; |70| 
           MVKH    .S1     output+12,A24
           EXTU    .S1     A6,1,24,A23       ; |93| 
           SPTRUNC .L1     A3,A7             ; |69| 
           CMPLTSP .S1     A6,A14,A1         ; |98| 
           CMPGTSP .S1     A6,A13,A2         ; |103| 
           NOP             1
   [ A0]   SUB     .L1     A7,1,A7           ; |71| 

           INTSP   .L1     A7,A8             ; |90| 
||         EXTU    .S1     A7,28,30,A4       ; |90| 

           LDDW    .D1T1   *+A5[A4],A5:A4    ; |90| 
           AND     .L2X    3,A7,B4           ; |90| 
           LDDW    .D2T2   *+B5[B4],B5:B4    ; |90| 
           MPYSP   .M1     A29,A8,A3         ; |90| 
           MPYSP   .M2X    B12,A8,B6         ; |90| 
           SHL     .S1     A7,16,A26         ; |90| 
           CMPLTU  .L1     A23,A22,A0        ; |93| 
           SUBSP   .L1     A6,A3,A3          ; |90| 
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |90| 
           LDW     .D1T1   *A24,A5           ; |193| 
           NOP             2
           SUBSP   .L2X    A3,B6,B7          ; |90| 
           NOP             3
           MPYSP   .M2     B7,B7,B6          ; |90| 
           MPYSP   .M1X    A27,B7,A3         ; |90| 
           NOP             2
           MPYSP   .M2     B6,B7,B8          ; |90| 
           MPYSP   .M1X    A28,B6,A4         ; |90| 
           NOP             2
           MPYSP   .M2     B31,B8,B6         ; |90| 
           NOP             3
           ADDSP   .L2X    A4,B6,B6          ; |90| 
           ADD     .L1     A11,A5,A4         ; |193| 
           ADD     .L1     4,A11,A11         ; |189| 
           NOP             1
           ADDSP   .L2X    B6,A3,B6          ; |90| 
           AND     .L1     A25,A26,A3        ; |90| 
           NOP             2
           ADDSP   .L2     B10,B6,B6         ; |90| 
           ADD     .L2X    A3,B5,B5          ; |90| 
           NOP             2
           MPYSPDP .M2     B6,B5:B4,B5:B4    ; |90| 
           NOP             6
           DPSP    .L2     B5:B4,B4          ; |90| 

   [ A0]   ADDSP   .L2X    B10,A6,B4         ; |94| 
|| [ A1]   LDW     .D2T2   *+SP(52),B4       ; |103| 

   [ A2]   LDW     .D2T2   *+SP(56),B4       ; |99| 
           MVKL    .S2     0xc000cccc,B5
           MVKH    .S2     0xc000cccc,B5
           SUB     .L1X    B11,1,A1          ; |189| 
           SUB     .L2     B11,1,B11         ; |189| 
           STW     .D1T2   B4,*A4            ; |193| 
           LDW     .D1T2   *A10,B6           ; |194| 
           MVKL    .S2     0xcccccccd,B4
           MVKH    .S2     0xcccccccd,B4
   [!A1]   MVKL    .S2     output,B11
   [!A1]   MVKH    .S2     output,B11
           MPYSPDP .M2     B6,B5:B4,B5:B4    ; |194| 
           NOP             5
   [ A1]   B       .S1     $C$L10            ; |189| 
           DPSP    .L2     B5:B4,B4          ; |194| 
           NOP             3

   [ A1]   CALL    .S1     expf              ; |190| 
||         STW     .D1T2   B4,*++A10         ; |194| 

           ; BRANCHCC OCCURS {$C$L10}        ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     expsp_v           ; |196| 
           LDW     .D2T2   *+B11(16),B4      ; |196| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           ADDKPC  .S2     $C$RL23,B3,0      ; |196| 
           MVK     .S1     0xed,A6           ; |196| 
$C$RL23:   ; CALL OCCURS {expsp_v} {0}       ; |196| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .S1     0xed,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL24:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     fcn_pass,B5
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .S1     0xed,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B11,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVK     .S1     0xed,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     fcn_pass,B4
           MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1X    B11,A3            ; |68| 
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         LDW     .D1T2   *A12,B4           ; |69| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0xed,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL27:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(60),A3       ; |69| 
           MVKL    .S2     fcn_pass,B4
           MVKH    .S2     fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           NOP             1
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [ A0]   ADD     .L2     4,B13,B4
|| [!A0]   B       .S1     $C$L13            ; |72| 
|| [ A0]   LDW     .D2T2   *B13,B0           ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |200| 
   [!A0]   MVKL    .S1     all_pass,A3
   [!A0]   MVKH    .S1     all_pass,A3
   [!A0]   ZERO    .L2     B4                ; |72| 
   [!A0]   MV      .L2X    A3,B5
           ; BRANCHCC OCCURS {$C$L13}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1

   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
||         MVK     .L2     0x1,B4            ; |72| 

   [!A0]   ZERO    .L2     B4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |200| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             1
           MV      .L2X    A3,B5
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x4,A4            ; |200| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL28,B3,0      ; |200| 

$C$RL28:   ; CALL OCCURS {print_test_results} {0}  ; |200| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S2     cycle_counts+24,B5

           MVKH    .S2     cycle_counts+24,B5
||         ZERO    .L2     B4                ; |114| 
||         ZERO    .L1     A10               ; |114| 
||         ZERO    .S1     A11               ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A11:A10,*B5       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           CALL    .S2     gimme_random      ; |210| 
||         MVK     .S1     0x80,A31
||         ZERO    .L1     A4

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKH    .S1     0xc2c80000,A4

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 
||         MVKL    .S1     t_offset,A3

           ADD     .L2     B31,B6,B5         ; |117| 
||         ZERO    .L1     A4
||         MV      .S2X    A4,B13
||         MVKH    .S1     t_offset,A3

           MV      .L2     B13,B4            ; |210| 
||         STDW    .D1T2   B5:B4,*A3         ; |117| 
||         MVKH    .S1     0x43480000,A4
||         STW     .D2T1   A31,*+SP(60)      ; |117| 
||         MV      .L1     A10,A12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL29,B3,0      ; |210| 
$C$RL29:   ; CALL OCCURS {gimme_random} {0}  ; |210| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 95
           MVKL    .S2     input,B4
           MVKH    .S2     input,B4
           LDW     .D2T2   *B4,B4            ; |210| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |210| 

           STW     .D1T1   A4,*A3            ; |210| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 
           LDW     .D2T1   *+SP(16),A3
           MPYSP   .M1     A15,A4,A6         ; |69| 
           LDW     .D2T1   *+SP(12),A31
           LDW     .D2T1   *+SP(20),A30      ; |90| 
           LDW     .D2T1   *+SP(28),A29      ; |90| 
           ADDSP   .L1     A3,A6,A3          ; |69| 
           LDW     .D2T2   *+SP(24),B4       ; |90| 
           CMPLTSP .S1     A6,A31,A0         ; |70| 
           LDW     .D2T1   *+SP(36),A28
           SPTRUNC .L1     A3,A5             ; |69| 
           LDW     .D2T2   *+SP(40),B31      ; |90| 
           LDW     .D2T1   *+SP(44),A27
           LDW     .D2T1   *+SP(32),A25      ; |90| 
   [ A0]   SUB     .L1     A5,1,A5           ; |71| 

           INTSP   .L1     A5,A8             ; |90| 
||         EXTU    .S1     A5,28,30,A7       ; |90| 

           LDDW    .D1T1   *+A29[A7],A7:A6   ; |90| 
           AND     .L2X    3,A5,B5           ; |90| 
           LDDW    .D2T2   *+B4[B5],B5:B4    ; |90| 
           MPYSP   .M1     A30,A8,A3         ; |90| 
           MPYSP   .M2X    B12,A8,B8         ; |90| 
           MVKL    .S1     output+12,A24
           SHL     .S1     A5,16,A26         ; |90| 
           SUBSP   .L1     A4,A3,A3          ; |90| 
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |90| 
           LDW     .D2T1   *+SP(48),A22      ; |214| 
           EXTU    .S1     A4,1,24,A23       ; |93| 
           MVKH    .S1     output+12,A24
           SUBSP   .L2X    A3,B8,B9          ; |90| 
           CMPLTSP .S1     A4,A14,A1         ; |98| 
           CMPGTSP .S1     A4,A13,A2         ; |103| 
           CMPLTU  .L1     A23,A22,A0        ; |93| 
           MPYSP   .M2     B9,B9,B8          ; |90| 
           MPYSP   .M1X    A27,B9,A3         ; |90| 
           LDW     .D1T1   *A24,A5           ; |214| 
           MVKL    .S1     t_start,A23
           MPYSP   .M2     B8,B9,B16         ; |90| 
           MPYSP   .M1X    A28,B8,A6         ; |90| 
           MVKH    .S1     t_start,A23
           STDW    .D1T2   B7:B6,*A23
           MPYSP   .M2     B31,B16,B8        ; |90| 
           ADD     .L1     A12,A5,A21        ; |214| 
           NOP             2
           ADDSP   .L2X    A6,B8,B8          ; |90| 
           NOP             3
           ADDSP   .L2X    B8,A3,B8          ; |90| 
           AND     .L1     A25,A26,A3        ; |90| 
           NOP             2
           ADDSP   .L2     B10,B8,B8         ; |90| 
           ADD     .L2X    A3,B5,B5          ; |90| 
           NOP             2
           MPYSPDP .M2     B8,B5:B4,B5:B4    ; |90| 
           NOP             6
           DPSP    .L2     B5:B4,B4          ; |90| 

   [ A0]   ADDSP   .L2X    B10,A4,B4         ; |94| 
|| [ A1]   LDW     .D2T2   *+SP(52),B4       ; |214| 

   [ A2]   LDW     .D2T2   *+SP(56),B4       ; |99| 
           NOP             4

           STW     .D1T2   B4,*A21           ; |214| 
||         MVC     .S2     TSCL,B4           ; |128| 

           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     t_offset,B11
||         LDW     .D2T1   *+SP(60),A20      ; |130| 
||         MVKL    .S1     t_stop,A4
||         ADD     .L1     4,A12,A12         ; |208| 

           MVKH    .S2     t_offset,B11
||         MVKH    .S1     t_stop,A4

           LDDW    .D2T2   *B11,B17:B16      ; |130| 
||         MVKL    .S2     cycle_counts+24,B8
||         MVKL    .S1     cycle_counts+24,A3

           MVKH    .S2     cycle_counts+24,B8
||         STDW    .D1T2   B5:B4,*A4         ; |128| 
||         MVKH    .S1     cycle_counts+24,A3

           LDDW    .D2T2   *B8,B19:B18       ; |130| 
           SUB     .L1     A20,1,A0          ; |208| 

   [ A0]   ZERO    .L1     A4
||         STW     .D2T1   A0,*+SP(60)       ; |130| 

           ADDU    .L2     B16,B6,B9:B8      ; |130| 
|| [ A0]   MVKH    .S1     0x43480000,A4

           ADD     .S2     B9,B17,B6         ; |130| 
|| [ A0]   B       .S1     $C$L14            ; |208| 
||         SUBU    .L2     B4,B8,B9:B8       ; |130| 
|| [ A0]   MV      .D2     B13,B4            ; |210| 

   [ A0]   CALL    .S1     gimme_random      ; |210| 
||         ADD     .L2     B6,B7,B6          ; |130| 
||         EXT     .S2     B9,24,24,B9       ; |130| 

           ADDU    .L2     B18,B8,B7:B6      ; |130| 
||         SUB     .S2     B5,B6,B8          ; |130| 

           ADD     .L2     B8,B9,B8          ; |130| 
||         ADD     .S2     B7,B19,B7         ; |130| 

           ADD     .L2     B7,B8,B7          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T2   B7:B6,*A3         ; |130| 

           ; BRANCHCC OCCURS {$C$L14}        ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A3,A5:A4         ; |135| 
           ADDKPC  .S2     $C$RL30,B3,3      ; |135| 
$C$RL30:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           MV      .L1     A11,A12           ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL31:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MVKL    .S2     cycle_counts+24,B4
           MVKH    .S2     cycle_counts+24,B4
           MVK     .S1     24,A3

           SUB     .L1X    B4,A3,A3
||         STDW    .D2T1   A5:A4,*B4         ; |135| 
||         MV      .L2X    A10,B5            ; |114| 

           MVC     .S2     B5,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A3       ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B5,B4,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B7,B6,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 
||         MVK     .S1     0x80,A3

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MV      .L1     A3,A14            ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |223| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |223| 
||         CALL    .S1     expf              ; |223| 

           LDW     .D1T1   *A3,A4            ; |223| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |223| 
$C$RL32:   ; CALL OCCURS {expf} {0}          ; |223| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output,B10
           MVKH    .S2     output,B10
           LDW     .D2T2   *B10,B4           ; |223| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |223| 

           STW     .D1T1   A4,*A3            ; |223| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_start,B5
||         MV      .L1X    B11,A15           ; |128| 
||         MVKL    .S1     cycle_counts,A3
||         SUB     .D1     A14,1,A0          ; |221| 
||         MV      .L2     B4,B17            ; |128| 

           MVKH    .S2     t_start,B5
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         MVKH    .S1     cycle_counts,A3
||         SUB     .L1     A14,1,A14         ; |221| 

           LDDW    .D2T2   *B5,B9:B8         ; |130| 
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S2     cycle_counts,B4
||         MVKL    .S1     t_stop,A31
||         ADD     .L1     4,A12,A12         ; |221| 

           MVKH    .S1     t_stop,A31
           MVKH    .S2     cycle_counts,B4
           STDW    .D1T2   B17:B16,*A31      ; |128| 
   [!A0]   MV      .L1X    B4,A14
           ADDU    .L2X    A4,B8,B7:B6       ; |130| 

           ADD     .S2X    B7,A5,B5          ; |130| 
|| [ A0]   B       .S1     $C$L15            ; |221| 
||         SUBU    .L2     B16,B6,B7:B6      ; |130| 

           ADD     .D2     B5,B9,B5          ; |130| 
||         EXT     .S2     B7,24,24,B8       ; |130| 
||         ADDU    .L2X    A6,B6,B7:B6       ; |130| 

           SUB     .L2     B17,B5,B5         ; |130| 

           ADD     .L2X    B7,A7,B5          ; |130| 
||         ADD     .S2     B5,B8,B7          ; |130| 

           ADD     .L2     B5,B7,B7          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B7:B6,*B4         ; |130| 

           ; BRANCHCC OCCURS {$C$L15}        ; |221| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |135| 
$C$RL33:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A10,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL34:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A14(8)  ; |114| 
||         MV      .L2X    A11,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A14        ; |135| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B5,B4,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B6,B5          ; |117| 
||         MVK     .S1     0x80,A3

           ADD     .L2     B5,B6,B5          ; |117| 
||         MV      .S2X    A15,B7            ; |117| 

           STDW    .D2T2   B5:B4,*B7         ; |117| 
||         MV      .L2X    A3,B11            ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |232| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |232| 
||         CALL    .S1     expsp             ; |232| 

           LDW     .D1T1   *A3,A4            ; |232| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |232| 
$C$RL35:   ; CALL OCCURS {expsp} {0}         ; |232| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADD     .L2     4,B10,B4
           LDW     .D2T2   *B4,B4            ; |232| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |232| 

           STW     .D1T1   A4,*A3            ; |232| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B8           ; |128| 

           MVKL    .S2     t_start,B4
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         SUB     .L1X    B11,1,A0          ; |230| 
||         MVKL    .S1     t_stop,A31
||         MV      .L2     B8,B17            ; |128| 
||         SUB     .D2     B11,1,B11         ; |230| 

           MVKH    .S2     t_start,B4
||         ADDAD   .D1     A14,1,A3
||         MVKH    .S1     t_stop,A31
||         ADD     .L1     4,A12,A12         ; |230| 

           LDDW    .D2T2   *B4,B7:B6         ; |130| 
           MVK     .S2     8,B12
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADD     .L2X    A14,B12,B12
           ADDU    .L2X    A4,B6,B5:B4       ; |130| 

           ADD     .S2X    B5,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L16            ; |230| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B8,B6,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B12        ; |130| 

           ; BRANCHCC OCCURS {$C$L16}        ; |230| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(8),A5:A4    ; |135| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |135| 
$C$RL36:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A10,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL37:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A14(16) ; |114| 
||         MV      .L2X    A11,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B12        ; |135| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B4          ; |117| 
||         MVK     .S1     0x80,A3

           ADD     .L2     B4,B5,B7          ; |117| 

           STDW    .D1T2   B7:B6,*A15        ; |117| 
||         MV      .L2X    A3,B11            ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |241| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |241| 
||         CALL    .S1     expsp_c           ; |241| 

           LDW     .D1T1   *A3,A4            ; |241| 
           ADDKPC  .S2     $C$RL38,B3,3      ; |241| 
$C$RL38:   ; CALL OCCURS {expsp_c} {0}       ; |241| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADDAD   .D2     B10,1,B4
           LDW     .D2T2   *B4,B4            ; |241| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |241| 

           STW     .D1T1   A4,*A3            ; |241| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_start,B12
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         SUB     .L1X    B11,1,A0          ; |239| 
||         MV      .L2     B4,B17            ; |128| 
||         MVKL    .S1     t_stop,A31
||         SUB     .D2     B11,1,B11         ; |239| 

           MVKH    .S1     t_stop,A31
||         ADD     .L1     4,A12,A12         ; |239| 
||         MVKH    .S2     t_start,B12

           LDDW    .D2T2   *B12,B7:B6        ; |130| 
           ADDAD   .D1     A14,2,A3
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B17:B16,*A31      ; |128| 
           MV      .L2X    A3,B13            ; |128| 
           ADDU    .L2X    A4,B6,B9:B8       ; |130| 

           ADD     .S2X    B9,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L17            ; |239| 
||         SUBU    .L2     B16,B8,B5:B4      ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B8       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B6,B7         ; |130| 
||         MV      .S2     B4,B6             ; |130| 
||         ADD     .D2X    B5,A7,B4          ; |130| 

           ADD     .L2     B7,B8,B5          ; |130| 
           ADD     .L2     B4,B5,B7          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B7:B6,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L17}        ; |239| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(16),A5:A4   ; |135| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |135| 
$C$RL39:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 109
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A10,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL40:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 

           MV      .L2X    A11,B4            ; |114| 
||         MV      .L1X    B13,A12           ; |135| 
||         STDW    .D1T1   A11:A10,*+A14(32) ; |114| 

           STDW    .D1T1   A5:A4,*A12        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 

           STDW    .D2T2   B7:B6,*B12        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           MVKL    .S2     input,B9
||         ADD     .L2     B31,B6,B5         ; |117| 

           MVKH    .S2     input,B9
||         MV      .L1X    B10,A10           ; |117| 
||         STDW    .D1T2   B5:B4,*A15        ; |117| 

           CALLP   .S2     expsp_v,B3
||         LDW     .D1T2   *+A10(16),B4      ; |248| 
||         LDW     .D2T1   *B9,A4            ; |248| 
||         MVK     .S1     0x80,A6           ; |248| 

$C$RL41:   ; CALL OCCURS {expsp_v} {0}       ; |248| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         LDDW    .D2T2   *B12,B9:B8        ; |130| 

           MVK     .S2     16,B10
           ADD     .L2X    A12,B10,B10
           LDDW    .D2T2   *B10,B7:B6        ; |130| 
           MV      .L2     B4,B17            ; |128| 
           ADDU    .L1X    A4,B8,A7:A6       ; |130| 
           ADD     .L1     A7,A5,A3          ; |130| 
           SUBU    .L1X    B16,A6,A5:A4      ; |130| 

           ADD     .L2X    A3,B9,B5          ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           ADDU    .L1X    B6,A4,A5:A4       ; |130| 
||         SUB     .L2     B17,B5,B5         ; |130| 

           MVKL    .S2     t_stop,B4
||         ADD     .L2X    B5,A3,B5          ; |130| 

           ADD     .L2X    A5,B7,B6          ; |130| 
||         MVKH    .S2     t_stop,B4

           STDW    .D2T2   B17:B16,*B4       ; |128| 
||         ADD     .L2     B6,B5,B4          ; |130| 

           NOP             1

           CALLP   .S2     __c6xabi_fltllif,B3
||         MV      .L1X    B4,A5             ; |130| 

$C$RL42:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A11,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL43:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STDW    .D2T1   A5:A4,*B10        ; |130| 
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 

$C$RL44:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0xa0b5ed8d,B6

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MV      .S1     A3,A11            ; |66| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A5,*+A11(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL45:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           STW     .D1T1   A4,*+A11(8)       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T2   *+SP(64),B4       ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D1T1   A4,*+A11(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A10,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL47:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(68),B4       ; |69| 
           STW     .D1T1   A4,*+A11(16)      ; |69| 
           NOP             3
           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T2   *+SP(72),B4
           NOP             3

   [!B0]   B       .S1     $C$L18            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B4,B0            ; |72| 
   [ B1]   ADD     .L2     4,B4,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L18}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
   [!B0]   MV      .L1     A12,A0            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [ A0]   B       .S1     $C$L19            ; |72| 
   [ A0]   CALL    .S1     print_test_results ; |254| 
   [ A0]   MVKL    .S1     all_pass,A3
   [ A0]   MVKH    .S1     all_pass,A3
           NOP             2
           ; BRANCHCC OCCURS {$C$L19}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |254| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           MV      .L1     A12,A4
           NOP             1
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x2,A4            ; |254| 
||         ADDKPC  .S2     $C$RL48,B3,0      ; |254| 

$C$RL48:   ; CALL OCCURS {print_test_results} {0}  ; |254| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |255| 

$C$RL49:   ; CALL OCCURS {printf} {0}        ; |255| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |255| 

$C$RL50:   ; CALL OCCURS {printf} {0}        ; |255| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |262| 

$C$RL51:   ; CALL OCCURS {print_profile_results} {0}  ; |262| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |265| 

$C$RL52:   ; CALL OCCURS {print_memory_results} {0}  ; |265| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(80),B3      ; |266| 
           LDDW    .D2T1   *++SP,A13:A12     ; |266| 
           LDDW    .D2T1   *++SP,A15:A14     ; |266| 
           LDDW    .D2T2   *++SP,B11:B10     ; |266| 
           LDDW    .D2T2   *++SP,B13:B12     ; |266| 

           LDW     .D2T1   *++SP(8),A10      ; |266| 
||         RET     .S2     B3                ; |266| 

           LDW     .D2T1   *++SP(8),A11      ; |266| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |266| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"expSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	expf
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	expsp
	.global	expsp_c
	.global	expsp_v
	.global	ti_math_kTable
	.global	ti_math_jTable
	.global	t_start
	.global	t_stop
	.global	t_offset
	.global	cycle_counts
	.global	fcn_pass
	.global	all_pass
	.global	a_ext
	.global	a_sc
	.global	output
	.global	input
	.global	__c6xabi_fltllif
	.global	__c6xabi_fixdlli

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_Long_Precision_Bits(2)
	.battr "TI", Tag_File, 1, Tag_Bitfield_layout(2)
	.battr "TI", Tag_File, 1, Tag_ABI_enum_size(3)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_wchar_t(1)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_array_object_alignment(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_array_object_align_expected(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_PIC(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_PID(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_DSBT(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_stack_align_needed(0)
	.battr "c6xabi", Tag_File, 1, Tag_ABI_stack_align_preserved(0)
	.battr "TI", Tag_File, 1, Tag_Tramps_Use_SOC(1)
