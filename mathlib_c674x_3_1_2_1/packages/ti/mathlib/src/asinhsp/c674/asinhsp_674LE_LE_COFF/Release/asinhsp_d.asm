;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:34:39 2016                                *
;******************************************************************************
	.compiler_opts --abi=coffabi --c64p_l1d_workaround=off --endian=little --hll_source=on --long_precision_bits=40 --mem_model:code=near --mem_model:const=data --mem_model:data=far --object_format=coff --silicon_version=6740 --symdebug:none 

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

;*****************************************************************************
;* CINIT RECORDS                                                             *
;*****************************************************************************
	.sect	".cinit"
	.align	8
	.field  	$C$IR_1,32
	.field  	_a+0,32
	.word	04957871bh		; _a[0] @ 0
	.word	04908cbd1h		; _a[1] @ 32
	.word	047eecb43h		; _a[2] @ 64
	.word	048ee9b46h		; _a[3] @ 96
	.word	04769c16dh		; _a[4] @ 128
	.word	0490eab2dh		; _a[5] @ 160
	.word	048b6ed1ah		; _a[6] @ 192
	.word	0495ea9a7h		; _a[7] @ 224
	.word	0494dc1fdh		; _a[8] @ 256
	.word	04898b6a0h		; _a[9] @ 288
	.word	04930b6dfh		; _a[10] @ 320
	.word	04944ccfah		; _a[11] @ 352
	.word	047f88b18h		; _a[12] @ 384
	.word	04963d7dah		; _a[13] @ 416
	.word	048b938b1h		; _a[14] @ 448
	.word	048139381h		; _a[15] @ 480
	.word	048cbaa02h		; _a[16] @ 512
	.word	04849ed94h		; _a[17] @ 544
	.word	048045b00h		; _a[18] @ 576
	.word	048f63ebbh		; _a[19] @ 608
	.word	04941aaadh		; _a[20] @ 640
	.word	048f564dfh		; _a[21] @ 672
	.word	048b757c2h		; _a[22] @ 704
	.word	0473703c5h		; _a[23] @ 736
	.word	0496a808ah		; _a[24] @ 768
	.word	0493e1256h		; _a[25] @ 800
	.word	047b88105h		; _a[26] @ 832
	.word	048fc9eeeh		; _a[27] @ 864
	.word	04834bea7h		; _a[28] @ 896
	.word	04911c0d2h		; _a[29] @ 928
	.word	049513659h		; _a[30] @ 960
	.word	048860d4ah		; _a[31] @ 992
	.word	048a89e0ah		; _a[32] @ 1024
	.word	047be1956h		; _a[33] @ 1056
	.word	0494deeddh		; _a[34] @ 1088
	.word	0487faa44h		; _a[35] @ 1120
	.word	0495cd230h		; _a[36] @ 1152
	.word	046b547c8h		; _a[37] @ 1184
	.word	049462ceeh		; _a[38] @ 1216
	.word	046b4a24ah		; _a[39] @ 1248
	.word	04963162fh		; _a[40] @ 1280
	.word	0492bad91h		; _a[41] @ 1312
	.word	047f16f7bh		; _a[42] @ 1344
	.word	04925e39eh		; _a[43] @ 1376
	.word	04792067ah		; _a[44] @ 1408
	.word	047986297h		; _a[45] @ 1440
	.word	049313b6ah		; _a[46] @ 1472
	.word	0496a6642h		; _a[47] @ 1504
	.word	049105773h		; _a[48] @ 1536
	.word	04921834ah		; _a[49] @ 1568
	.word	04825efa4h		; _a[50] @ 1600
	.word	0483683e5h		; _a[51] @ 1632
	.word	04898ffaah		; _a[52] @ 1664
	.word	0490ab25ch		; _a[53] @ 1696
	.word	049106a3ch		; _a[54] @ 1728
	.word	048804359h		; _a[55] @ 1760
	.word	04926cf68h		; _a[56] @ 1792
	.word	048fa39aah		; _a[57] @ 1824
	.word	049318d2bh		; _a[58] @ 1856
	.word	0492d6a0bh		; _a[59] @ 1888
	.word	04931b46ch		; _a[60] @ 1920
	.word	04941e5f9h		; _a[61] @ 1952
	.word	0495d3faeh		; _a[62] @ 1984
	.word	04916d9e3h		; _a[63] @ 2016
	.word	04791cabbh		; _a[64] @ 2048
	.word	0489911deh		; _a[65] @ 2080
	.word	047169421h		; _a[66] @ 2112
	.word	049276bcdh		; _a[67] @ 2144
	.word	049656cbdh		; _a[68] @ 2176
	.word	04909736bh		; _a[69] @ 2208
	.word	0491dd177h		; _a[70] @ 2240
	.word	0484260c2h		; _a[71] @ 2272
	.word	04800c84dh		; _a[72] @ 2304
	.word	0491866b7h		; _a[73] @ 2336
	.word	0494c5549h		; _a[74] @ 2368
	.word	0470af778h		; _a[75] @ 2400
	.word	0476bf3cch		; _a[76] @ 2432
	.word	0482b19f3h		; _a[77] @ 2464
	.word	0489935fah		; _a[78] @ 2496
	.word	049256990h		; _a[79] @ 2528
	.word	0492fa1f6h		; _a[80] @ 2560
	.word	048ed9ea6h		; _a[81] @ 2592
	.word	048b44df1h		; _a[82] @ 2624
	.word	0483b6845h		; _a[83] @ 2656
	.word	0492bbdfbh		; _a[84] @ 2688
	.word	048d1ce69h		; _a[85] @ 2720
	.word	04959df7fh		; _a[86] @ 2752
	.word	04868ceedh		; _a[87] @ 2784
	.word	0484319cah		; _a[88] @ 2816
	.word	048e0c3c8h		; _a[89] @ 2848
	.word	048b5ecb1h		; _a[90] @ 2880
	.word	0479e3e23h		; _a[91] @ 2912
	.word	049723aa5h		; _a[92] @ 2944
	.word	0491a135ah		; _a[93] @ 2976
	.word	04955eaf1h		; _a[94] @ 3008
	.word	04908ebf4h		; _a[95] @ 3040
	.word	048d97097h		; _a[96] @ 3072
	.word	0491145cdh		; _a[97] @ 3104
	.word	047a7b105h		; _a[98] @ 3136
	.word	047f86b73h		; _a[99] @ 3168
	.word	04901f0eah		; _a[100] @ 3200
	.word	0490f1638h		; _a[101] @ 3232
	.word	0487b1acdh		; _a[102] @ 3264
	.word	04946cb74h		; _a[103] @ 3296
	.word	04946e2f5h		; _a[104] @ 3328
	.word	048d817e1h		; _a[105] @ 3360
	.word	0487435e6h		; _a[106] @ 3392
	.word	0487e8188h		; _a[107] @ 3424
	.word	048da3d4eh		; _a[108] @ 3456
	.word	049115d7eh		; _a[109] @ 3488
	.word	048fc9925h		; _a[110] @ 3520
	.word	04927689ah		; _a[111] @ 3552
	.word	0482c0ac6h		; _a[112] @ 3584
	.word	0476c3f9dh		; _a[113] @ 3616
	.word	047d330b5h		; _a[114] @ 3648
	.word	0495e0b86h		; _a[115] @ 3680
	.word	048aad192h		; _a[116] @ 3712
	.word	048df9681h		; _a[117] @ 3744
	.word	049204a29h		; _a[118] @ 3776
	.word	048a8415bh		; _a[119] @ 3808
	.word	0495ad583h		; _a[120] @ 3840
	.word	0497352c7h		; _a[121] @ 3872
	.word	048c1e600h		; _a[122] @ 3904
	.word	042c07aefh		; _a[123] @ 3936
	.word	048aa2d46h		; _a[124] @ 3968
	.word	048eb6cd4h		; _a[125] @ 4000
	.word	048194c2fh		; _a[126] @ 4032
	.word	048e76e3dh		; _a[127] @ 4064
	.word	0494c096ah		; _a[128] @ 4096
	.word	04894d14ah		; _a[129] @ 4128
	.word	048afbbd2h		; _a[130] @ 4160
	.word	0496b7cfeh		; _a[131] @ 4192
	.word	047855ba7h		; _a[132] @ 4224
	.word	048e403ffh		; _a[133] @ 4256
	.word	04661ba32h		; _a[134] @ 4288
	.word	048754124h		; _a[135] @ 4320
	.word	048b02c69h		; _a[136] @ 4352
	.word	04903f5d3h		; _a[137] @ 4384
	.word	0493316fch		; _a[138] @ 4416
	.word	04930195fh		; _a[139] @ 4448
	.word	0491785d5h		; _a[140] @ 4480
	.word	0492e1bb1h		; _a[141] @ 4512
	.word	0492e9093h		; _a[142] @ 4544
	.word	048ad76f3h		; _a[143] @ 4576
	.word	048a4146ah		; _a[144] @ 4608
	.word	04938f2c1h		; _a[145] @ 4640
	.word	04939c9d5h		; _a[146] @ 4672
	.word	0492d6871h		; _a[147] @ 4704
	.word	049163462h		; _a[148] @ 4736
	.word	046f3bdb2h		; _a[149] @ 4768
	.word	0487895cbh		; _a[150] @ 4800
	.word	0496956ech		; _a[151] @ 4832
	.word	048048994h		; _a[152] @ 4864
	.word	048f41007h		; _a[153] @ 4896
	.word	04832e271h		; _a[154] @ 4928
	.word	0494e8b25h		; _a[155] @ 4960
	.word	0482f1064h		; _a[156] @ 4992
	.word	0492f4a61h		; _a[157] @ 5024
	.word	047e8aafah		; _a[158] @ 5056
	.word	049339fd7h		; _a[159] @ 5088
	.word	049158ec5h		; _a[160] @ 5120
	.word	049496a4fh		; _a[161] @ 5152
	.word	04865afa3h		; _a[162] @ 5184
	.word	0490ac894h		; _a[163] @ 5216
	.word	0495e5082h		; _a[164] @ 5248
	.word	0490cb1fch		; _a[165] @ 5280
	.word	04892d18dh		; _a[166] @ 5312
	.word	04955f3fdh		; _a[167] @ 5344
	.word	04805d05dh		; _a[168] @ 5376
	.word	0488edb8ch		; _a[169] @ 5408
	.word	049219af7h		; _a[170] @ 5440
	.word	049434d13h		; _a[171] @ 5472
	.word	0496688a9h		; _a[172] @ 5504
	.word	0495d6498h		; _a[173] @ 5536
	.word	0488962aeh		; _a[174] @ 5568
	.word	0474e9466h		; _a[175] @ 5600
	.word	0490dedffh		; _a[176] @ 5632
	.word	049678fb4h		; _a[177] @ 5664
	.word	0492c6e8bh		; _a[178] @ 5696
	.word	0496b8d3dh		; _a[179] @ 5728
	.word	049584b5ch		; _a[180] @ 5760
	.word	048fdfb29h		; _a[181] @ 5792
	.word	0477d5cfdh		; _a[182] @ 5824
	.word	048d81506h		; _a[183] @ 5856
	.word	04890af8dh		; _a[184] @ 5888
	.word	048a64596h		; _a[185] @ 5920
	.word	047c603f8h		; _a[186] @ 5952
	.word	049727d74h		; _a[187] @ 5984
	.word	0494ed6edh		; _a[188] @ 6016
	.word	0492e1b84h		; _a[189] @ 6048
	.word	048022fbdh		; _a[190] @ 6080
	.word	04930e498h		; _a[191] @ 6112
	.word	0481a83d0h		; _a[192] @ 6144
	.word	04902690ah		; _a[193] @ 6176
	.word	047a8837bh		; _a[194] @ 6208
	.word	0489aed95h		; _a[195] @ 6240
	.word	048d9850dh		; _a[196] @ 6272
	.word	0488ec95ah		; _a[197] @ 6304
	.word	048e9b849h		; _a[198] @ 6336
	.word	0478d102dh		; _a[199] @ 6368
	.word	04901495eh		; _a[200] @ 6400
$C$IR_1:	.set	804

	.global	_a
_a:	.usect	".far",804,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\029722 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\029724 
;**	Parameter deleted: req_flags == 1;
;**	Parameter deleted: tol == 1e-06;
	.sect	".text"
	.clink

;******************************************************************************
;* FUNCTION NAME: allequal                                                    *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,B0,B1, *
;*                           B2,B3,B4,B5,B6,B7,B8,B9,SP,A16,A17,A18,A19,A20,  *
;*                           A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,B16, *
;*                           B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27,B28, *
;*                           B29,B30,B31                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,B0,B1, *
;*                           B2,B3,B4,B5,B6,B7,B8,B9,DP,SP,A16,A17,A18,A19,   *
;*                           A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31, *
;*                           B16,B17,B18,B19,B20,B21,B22,B23,B24,B25,B26,B27, *
;*                           B28,B29,B30,B31                                  *
;*   Local Frame Size  : 0 Args + 0 Auto + 24 Save = 24 byte                  *
;******************************************************************************
_allequal:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STW     .D2T1   A11,*SP--(8)      ; |63| 
||         MVKL    .S2     0xa0b5ed8d,B6

           STDW    .D2T1   A13:A12,*SP--     ; |63| 
||         MVKL    .S1     _output,A11
||         MVKL    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A10,*SP--(8)      ; |63| 
||         MVKH    .S1     _output,A11
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MV      .L1     A4,A6             ; |63| 
||         MVKH    .S2     0x3eb0c6f7,B7
||         MVK     .S1     0x1,A8            ; |66| 

           MV      .L1X    B3,A13            ; |63| 
||         CALLP   .S2     _isequal,B3
||         MV      .S1     A4,A10            ; |63| 
||         LDW     .D1T1   *A11,A4           ; |66| 

$C$RL0:    ; CALL OCCURS {_isequal} {0}      ; |66| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKL    .S1     _fcn_pass,A12
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S1     _fcn_pass,A12
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A3,*+A12(4)       ; |66| 
||         MV      .L1     A10,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL1:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A3,*+A12(8)       ; |67| 
||         MV      .L1     A10,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL2:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           STW     .D1T1   A4,*+A12(12)      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A11,A3            ; |66| 
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MV      .L1     A10,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL3:    ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2X    4,A12,B4
           LDW     .D2T1   *B4,A0            ; |72| 
           STW     .D1T1   A4,*+A12(16)      ; |69| 
           ADD     .L2X    8,A12,B4
           NOP             2

   [!A0]   BNOP    .S1     $C$L1,5           ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 
|| [ A0]   ADD     .L2     4,B4,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1

   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
||         MVKL    .S1     _all_pass,A3

   [ A0]   B       .S2     $C$L2             ; |72| 
||         MVKH    .S1     _all_pass,A3
|| [ A0]   MV      .L2X    A13,B3            ; |74| 

   [ A0]   STW     .D1T1   A4,*A3            ; |72| 
   [ A0]   LDW     .D2T1   *++SP(8),A10      ; |74| 

   [ A0]   RET     .S2     B3                ; |74| 
|| [ A0]   LDDW    .D2T1   *++SP,A13:A12     ; |74| 

   [ A0]   LDW     .D2T1   *++SP(8),A11      ; |74| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L2}         ; |72| 
;** --------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 7
           MVKL    .S1     _all_pass,A3

           MVKH    .S1     _all_pass,A3
||         ZERO    .L1     A4                ; |72| 

           STW     .D1T1   A4,*A3            ; |72| 

           LDW     .D2T1   *++SP(8),A10      ; |74| 
||         MV      .L2X    A13,B3            ; |74| 

           LDDW    .D2T1   *++SP,A13:A12     ; |74| 
||         RET     .S2     B3                ; |74| 

           LDW     .D2T1   *++SP(8),A11      ; |74| 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 3
           NOP             3
           ; BRANCH OCCURS {B3}              ; |74| 
	.sect	".text"
	.clink
	.global	_main

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
;*   Local Frame Size  : 8 Args + 8 Auto + 56 Save = 72 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |143| 
           STW     .D2T1   A10,*SP--(8)      ; |143| 
           STDW    .D2T2   B13:B12,*SP--     ; |143| 
           STDW    .D2T2   B11:B10,*SP--     ; |143| 
           STDW    .D2T1   A15:A14,*SP--     ; |143| 

           STDW    .D2T1   A13:A12,*SP--     ; |143| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(24)      ; |143| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL4:    ; CALL OCCURS {_driver_init} {0}  ; |151| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A14

           MVKH    .S1     _a,A14
||         MVKL    .S2     _output,B10

           CALL    .S1     _asinhf           ; |160| 
||         MV      .L1     A14,A10
||         MV      .D1X    B4,A11
||         MVKH    .S2     _output,B10
||         ZERO    .L2     B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A10++,A4         ; |160| 
           ADDKPC  .S2     $C$RL5,B3,3       ; |160| 
$C$RL5:    ; CALL OCCURS {_asinhf} {0}       ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B10,B4           ; |160| 
||         SUB     .L1     A11,1,A0          ; |159| 
||         SUB     .S1     A11,1,A11         ; |159| 

   [ A0]   BNOP    .S1     $C$L3,3           ; |159| 

           ADD     .L2     B11,B4,B4         ; |160| 
||         ADD     .S2     4,B11,B11         ; |159| 

   [ A0]   CALL    .S1     _asinhf           ; |160| 
||         STW     .D2T1   A4,*B4            ; |160| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L3}         ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B11
||         MV      .L1     A14,A11
||         ADD     .S2     4,B10,B12

           MV      .L1X    B4,A10
||         CALL    .S1     _asinhsp          ; |163| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A11++,A4         ; |163| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |163| 
$C$RL6:    ; CALL OCCURS {_asinhsp} {0}      ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |163| 
||         SUB     .L1     A10,1,A0          ; |162| 
||         SUB     .S1     A10,1,A10         ; |162| 

   [ A0]   BNOP    .S1     $C$L4,3           ; |162| 

           ADD     .L2     B11,B4,B4         ; |163| 
||         ADD     .S2     4,B11,B11         ; |162| 

   [ A0]   CALL    .S1     _asinhsp          ; |163| 
||         STW     .D2T1   A4,*B4            ; |163| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L4}         ; |162| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B11
||         MV      .L1     A14,A11
||         ADD     .S2     4,B12,B12

           MV      .L1X    B4,A10
||         CALL    .S1     _asinhsp_c        ; |166| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A11++,A4         ; |166| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |166| 
$C$RL7:    ; CALL OCCURS {_asinhsp_c} {0}    ; |166| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |166| 
||         SUB     .L1     A10,1,A0          ; |165| 
||         SUB     .S1     A10,1,A10         ; |165| 

   [ A0]   BNOP    .S2     $C$L5,2           ; |165| 
|| [!A0]   ZERO    .L1     A13
|| [!A0]   MVKL    .S1     0xfefa39ec,A10
|| [!A0]   ZERO    .D1     A12               ; |90| 

   [!A0]   MVKL    .S1     0x3fe62e42,A11

           ADD     .L2     B11,B4,B4         ; |166| 
||         ADD     .S2     4,B11,B11         ; |165| 

   [ A0]   CALL    .S1     _asinhsp_c        ; |166| 
|| [!A0]   ADD     .L2     4,B12,B11
||         STW     .D2T1   A4,*B4            ; |166| 

           ; BRANCHCC OCCURS {$C$L5}         ; |165| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           MVK     .S1     0xfffffc01,A27
||         MVK     .S2     0xc9,B0
||         MV      .L1     A14,A17
||         ZERO    .D1     A18               ; |90| 
||         LDW     .D2T2   *B11,B18
||         ZERO    .L2     B28

           MVKH    .S1     0xfefa39ec,A10
||         MV      .L2X    A12,B29

           MVKH    .S1     0x3fe62e42,A11
           SET     .S1     A13,0x14,0x1d,A13
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Disqualified loop: Did not find partition
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A17++,A6         ; |123| 
           NOP             4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 133
           MPYSP   .M1     A6,A6,A7          ; |123| 
           ZERO    .L1     A3
           SET     .S1     A3,0x17,0x1d,A3
           ZERO    .L1     A8
           ADDSP   .L1     A3,A7,A3          ; |123| 
           SET     .S1     A8,0x18,0x1d,A8
           ZERO    .L1     A9
           SET     .S1     A9,0x16,0x1d,A9
           SPDP    .S1     A3,A5:A4          ; |123| 
           MPYSP   .M1     A8,A3,A31         ; |123| 
           RSQRDP  .S1     A5:A4,A5:A4       ; |123| 
           ZERO    .L1     A29
           DPSP    .L1     A5:A4,A5          ; |123| 
           ABSSP   .S1     A6,A16            ; |123| 
           MPYSP   .M1     A16,A16,A30       ; |123| 
           ZERO    .S1     A28
           MPYSP   .M1     A5,A31,A8         ; |123| 
           SUB     .L2     B0,1,B0           ; |168| 
           CMPEQSP .S1     A3,A30,A0         ; |123| 
   [ A0]   MV      .L1     A16,A3            ; |123| 
           MPYSP   .M1     A5,A8,A8          ; |123| 
           MVKL    .S2     0xbf000003,B4
           MVKH    .S2     0xbf000003,B4
           MVKL    .S2     0xbe2a9a99,B6
           SUBSP   .L1     A9,A8,A8          ; |123| 
           MVKL    .S2     0x3d966b1c,B7
           MVKL    .S1     0x3e436581,A26
           MVKH    .S1     0x3e436581,A26
           MPYSP   .M1     A5,A8,A5          ; |123| 
           MVKL    .S1     0xbe804d66,A23
           MVKL    .S1     0xbe6bd0fc,A25
           MVKH    .S1     0xbe804d66,A23
           MPYSP   .M1     A5,A5,A8          ; |123| 
           MVKH    .S1     0xbe6bd0fc,A25
           MVKL    .S1     _ti_math_logtable,A2
           MVKH    .S1     _ti_math_logtable,A2
           MPYSP   .M1     A31,A8,A4         ; |123| 
           MVKH    .S2     0xbe2a9a99,B6
           MPYSP   .M2X    B6,A7,B6          ; |90| 
           MPYSP   .M1     A7,A7,A31         ; |90| 
           SUBSP   .L1     A9,A4,A4          ; |123| 
           MVKH    .S2     0x3d966b1c,B7
           MVKL    .S2     0x7f7fffff,B31
           MPYSP   .M1     A7,A31,A30        ; |90| 
           MPYSP   .M1     A5,A4,A4          ; |123| 
           SET     .S1     A28,0x18,0x1d,A5
           MPYSP   .M2X    B7,A31,B7         ; |90| 
           MVKH    .S2     0x7f7fffff,B31
   [!A0]   MPYSP   .M1     A3,A4,A3          ; |123| 
           SET     .S1     A29,0x18,0x1d,A4
           MPYSP   .M1     A4,A16,A4         ; |123| 
           ADDSP   .L2     B7,B6,B6          ; |90| 
           MPYSP   .M1     A5,A3,A3          ; |123| 
           MVKL    .S1     0xbd07484c,A29
           MVKH    .S1     0xbd07484c,A29
           MVKL    .S2     0x3f317218,B30
           ADDSP   .L1     A4,A3,A22         ; |123| 
           MVKH    .S2     0x3f317218,B30
           ZERO    .L1     A28
           NOP             1
           SPDP    .S1     A22,A5:A4         ; |90| 
           CMPGTSP .S2X    A22,B31,B1        ; |90| 
           RCPDP   .S1     A5:A4,A5:A4       ; |90| 
           NOP             1
           CLR     .S1     A5,0,16,A3        ; |90| 
           MV      .L1     A3,A19            ; |90| 
           MPYSPDP .M1     A22,A19:A18,A9:A8 ; |90| 
           EXTU    .S1     A3,1,21,A4        ; |90| 
           ADD     .L1     A27,A4,A4         ; |90| 
           INTDP   .L1     A4,A5:A4          ; |90| 
           EXTU    .S1     A3,12,29,A3       ; |90| 
           NOP             2
           SUBDP   .L1     A9:A8,A13:A12,A9:A8 ; |90| 
           MPYDP   .M1     A11:A10,A5:A4,A21:A20 ; |90| 
           NOP             5
           DPSP    .L1     A9:A8,A4          ; |90| 
           NOP             3
           MPYSP   .M1     A26,A4,A5         ; |90| 
           MPYSP   .M1     A4,A4,A24         ; |90| 
           NOP             2
           ADDSP   .L1     A23,A5,A19        ; |90| 
           MPYSP   .M1     A25,A24,A23       ; |90| 
           MVKL    .S1     0x3eaaa872,A25

           MPYSP   .M1     A24,A4,A3         ; |90| 
||         LDDW    .D1T1   *+A2[A3],A5:A4    ; |90| 

           MPYSP   .M1     A24,A24,A1        ; |90| 
           ADDSP   .L1     A23,A19,A19       ; |90| 
           MVKH    .S1     0x3eaaa872,A25
           MPYSP   .M1     A25,A3,A3         ; |90| 
           SUBDP   .L1     A5:A4,A21:A20,A5:A4 ; |90| 
           MPYSP   .M1     A1,A19,A19        ; |90| 
           MPYSP   .M2X    B4,A24,B4         ; |90| 
           NOP             2
           ADDSP   .L1     A19,A3,A3         ; |90| 
           NOP             2
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |90| 
           NOP             1
           ADDSP   .L2X    A3,B4,B4          ; |90| 
           MPYSP   .M1     A29,A30,A3        ; |90| 
           NOP             2
           SPDP    .S2     B4,B5:B4          ; |90| 
           NOP             1
           ADDDP   .L2X    B5:B4,A5:A4,B5:B4 ; |90| 
           NOP             6

           ADDSP   .S2X    A3,B6,B5          ; |90| 
||         DPSP    .L2     B5:B4,B4          ; |90| 

           MVKL    .S1     0x42b17218,A3
           MVKH    .S1     0x42b17218,A3
           NOP             1

   [ B1]   MV      .L2X    A3,B4             ; |90| 
||         SET     .S1     A28,0x18,0x1d,A3

           CMPGTSP .S1     A16,A3,A0         ; |90| 
||         ADDSP   .L2     B30,B4,B4         ; |90| 
||         ZERO    .L1     A3
||         MPYSP   .M2X    A6,B5,B6          ; |90| 
||         SET     .S2     B28,0x17,0x1d,B5

           MVKH    .S1     0xbf800000,A3
           CMPLTSP .S2X    A6,B29,B1         ; |90| 

   [ B1]   MV      .S2X    A3,B5             ; |90| 
|| [ B0]   B       .S1     $C$L6             ; |168| 

   [ A0]   MPYSP   .M2     B5,B4,B4          ; |90| 
|| [!A0]   ADDSP   .L2X    A6,B6,B4          ; |90| 

           NOP             3

           STW     .D2T2   B4,*B18++         ; |90| 
|| [!B0]   ADD     .L2     4,B11,B4

           ; BRANCHCC OCCURS {$C$L6}         ; |168| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     _asinhsp_v        ; |171| 
||         STW     .D2T2   B4,*+SP(16)

           LDW     .D2T2   *B4,B4            ; |171| 
           ADDKPC  .S2     $C$RL8,B3,2       ; |171| 

           MVK     .S1     0xc9,A6           ; |171| 
||         MV      .L1     A14,A4            ; |171| 

$C$RL8:    ; CALL OCCURS {_asinhsp_v} {0}    ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .S1     0xc9,A4           ; |174| 

$C$RL9:    ; CALL OCCURS {_allequal} {0}     ; |174| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x1,A4            ; |175| 

$C$RL10:   ; CALL OCCURS {_print_test_results} {0}  ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _a_sc,B4
           MVKH    .S2     _a_sc,B4

           MVKL    .S2     0x7f7fffff,B31
||         ZERO    .L1     A3
||         ZERO    .L2     B7

           MV      .L1X    B4,A4             ; |183| 
||         MVKH    .S2     0xbf800000,B7
||         MVKH    .S1     0x80000000,A3
||         ZERO    .L2     B6
||         MV      .D1     A12,A2

           STDW    .D1T1   A3:A2,*A4         ; |183| 
||         SET     .S2     B6,0x17,0x1d,B6

           STDW    .D1T2   B7:B6,*+A4(16)    ; |187| 
||         ADD     .L1     -1,A3,A6
||         MVKH    .S2     0x7f7fffff,B31
||         ZERO    .L2     B5
||         MVK     .S1     -1,A7             ; |189| 

           MV      .L1     A4,A3
||         STDW    .D1T1   A7:A6,*+A4(24)    ; |189| 
||         ADD     .L2     1,B31,B4
||         MV      .S1X    B4,A14            ; |183| 
||         MVKH    .S2     0xff800000,B5

           CALL    .S1     _asinhf           ; |192| 
||         STDW    .D1T2   B5:B4,*+A3(8)     ; |185| 
||         MV      .L1X    B10,A15
||         MV      .L2X    A12,B12           ; |185| 
||         MVK     .S2     0x8,B13

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A14,A4           ; |192| 
           ADDKPC  .S2     $C$RL11,B3,3      ; |192| 
$C$RL11:   ; CALL OCCURS {_asinhf} {0}       ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D1T1   *A15,A3           ; |192| 
           NOP             4
           ADD     .L2X    B12,A3,B4         ; |192| 
           STW     .D2T1   A4,*B4            ; |192| 

           CALLP   .S2     _asinhsp,B3
||         LDW     .D1T1   *A14,A4           ; |193| 

$C$RL12:   ; CALL OCCURS {_asinhsp} {0}      ; |193| 
           LDW     .D1T1   *+A15(4),A3       ; |193| 
           NOP             4
           ADD     .L2X    B12,A3,B4         ; |193| 
           STW     .D2T1   A4,*B4            ; |193| 

           CALLP   .S2     _asinhsp_c,B3
||         LDW     .D1T1   *A14,A4           ; |194| 

$C$RL13:   ; CALL OCCURS {_asinhsp_c} {0}    ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 147
           LDW     .D1T1   *+A15(8),A3       ; |194| 
           ZERO    .L1     A31
           ZERO    .L1     A30
           ZERO    .L1     A28
           ZERO    .L1     A27
           ADD     .L2X    B12,A3,B4         ; |194| 
           STW     .D2T1   A4,*B4            ; |194| 
           LDW     .D1T1   *A14++,A16        ; |195| 
           SET     .S1     A31,0x17,0x1d,A3
           LDW     .D2T2   *B11,B25          ; |195| 
           MV      .L2X    A12,B26
           MVKL    .S2     0xbf000003,B31
           MPYSP   .M1     A16,A16,A17       ; |169| 
           ABSSP   .S1     A16,A18           ; |168| 
           MPYSP   .M1     A18,A18,A26       ; |125| 
           ZERO    .L1     A25
           ADDSP   .L1     A3,A17,A6         ; |123| 
           SET     .S1     A30,0x18,0x1d,A3
           MVKH    .S2     0xbf000003,B31
           MVKL    .S2     0xbe2a9a99,B30
           SPDP    .S1     A6,A5:A4          ; |123| 
           MPYSP   .M1     A3,A6,A29         ; |123| 
           RSQRDP  .S1     A5:A4,A5:A4       ; |123| 
           MVKL    .S2     0x3d966b1c,B29
           DPSP    .L1     A5:A4,A4          ; |123| 
           CMPEQSP .S1     A6,A26,A0         ; |125| 
           MVK     .S1     0xfffffc01,A23
           MVKL    .S1     0x3e436581,A20
           MPYSP   .M1     A4,A29,A3         ; |123| 
           MVKH    .S1     0x3e436581,A20
           MVKH    .S2     0xbe2a9a99,B30
           MVKH    .S2     0x3d966b1c,B29
           MPYSP   .M1     A4,A3,A7          ; |123| 
           SET     .S1     A28,0x16,0x1d,A3
           MVKL    .S2     0x7f7fffff,B28
           MVKL    .S1     0xbe804d66,A2
           SUBSP   .L1     A3,A7,A3          ; |123| 
           MVKH    .S2     0x7f7fffff,B28
           MVKL    .S1     0xbe6bd0fc,A1
           MVKL    .S2     0x3f317218,B27
           MPYSP   .M1     A4,A3,A4          ; |123| 
           MVKH    .S1     0xbe804d66,A2
           MVKH    .S2     0x3f317218,B27
           MVKH    .S1     0xbe6bd0fc,A1
           MPYSP   .M1     A4,A4,A3          ; |123| 
           CMPLTSP .S2X    A16,B26,B2        ; |172| 
           MPYSP   .M2X    B30,A17,B6        ; |181| 
           MVKL    .S1     _ti_math_logtable,A30
           MPYSP   .M1     A29,A3,A5         ; |123| 
           SET     .S1     A27,0x16,0x1d,A3
           MVKH    .S1     _ti_math_logtable,A30
           MVKL    .S1     0x3eaaa872,A29
           SUBSP   .L1     A3,A5,A3          ; |123| 
           MVKH    .S1     0x3eaaa872,A29
           MPYSP   .M1     A17,A17,A27       ; |181| 
           ZERO    .S1     A26
           MPYSP   .M1     A4,A3,A3          ; |123| 
           SET     .S1     A25,0x18,0x1d,A4
           MPYSP   .M1     A4,A18,A5         ; |90| 
           MPYSP   .M2X    B29,A27,B7        ; |181| 
           MPYSP   .M1     A6,A3,A3          ; |123| 
           MVKL    .S1     0xbd07484c,A25
           MVKH    .S1     0xbd07484c,A25
           ADDSP   .L2     B7,B6,B6          ; |181| 
   [ A0]   MV      .L1     A18,A3            ; |126| 
           MPYSP   .M1     A4,A3,A3          ; |90| 
           NOP             3
           ADDSP   .L1     A5,A3,A19         ; |90| 
           NOP             3
           SPDP    .S1     A19,A5:A4         ; |90| 
           CMPGTSP .S2X    A19,B28,B0        ; |92| 
           RCPDP   .S1     A5:A4,A5:A4       ; |90| 
           NOP             1

           CLR     .S1     A5,0,16,A21       ; |90| 
||         MV      .L1     A12,A4            ; |90| 

           MV      .L1     A21,A5            ; |90| 
           MPYSPDP .M1     A19,A5:A4,A7:A6   ; |90| 
           EXTU    .S1     A21,1,21,A24      ; |90| 
           ADD     .L1     A23,A24,A3        ; |90| 
           INTDP   .L1     A3,A5:A4          ; |90| 
           EXTU    .S1     A21,12,29,A31     ; |90| 
           ZERO    .L1     A24
           NOP             1
           SUBDP   .L1     A7:A6,A13:A12,A7:A6 ; |90| 
           MPYDP   .M1     A11:A10,A5:A4,A9:A8 ; |90| 
           NOP             5
           DPSP    .L1     A7:A6,A5          ; |90| 
           NOP             3
           MPYSP   .M1     A20,A5,A22        ; |90| 
           MPYSP   .M1     A5,A5,A20         ; |90| 
           NOP             2
           ADDSP   .L1     A2,A22,A22        ; |90| 
           MPYSP   .M1     A1,A20,A23        ; |90| 

           MPYSP   .M1     A20,A5,A21        ; |90| 
||         LDDW    .D1T1   *+A30[A31],A5:A4  ; |90| 

           MPYSP   .M1     A20,A20,A28       ; |90| 
           MPYSP   .M2X    B31,A20,B4        ; |90| 
           ADDSP   .L1     A23,A22,A22       ; |90| 
           MPYSP   .M1     A29,A21,A3        ; |90| 
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |90| 
           SUB     .S1X    B13,1,A2          ; |191| 
           MPYSP   .M1     A28,A22,A8        ; |90| 
           SUB     .L2     B13,1,B13         ; |191| 
   [!A2]   LDW     .D2T1   *+SP(16),A14
           NOP             1
           ADDSP   .L1     A8,A3,A8          ; |90| 

           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |90| 
||         MPYSP   .M1     A17,A27,A6        ; |181| 

           NOP             3

           ADDSP   .L2X    A8,B4,B5          ; |90| 
||         MPYSP   .M1     A25,A6,A3         ; |181| 

           NOP             3
           SPDP    .S2     B5,B5:B4          ; |90| 
           ADDSP   .L2X    A3,B6,B6          ; |181| 
           ADDDP   .L2X    B5:B4,A5:A4,B5:B4 ; |90| 
           MVKL    .S1     0x42b17218,A4
           MVKH    .S1     0x42b17218,A4
           NOP             3
           MPYSP   .M1X    A16,B6,A3         ; |181| 
           DPSP    .L2     B5:B4,B4          ; |90| 
           ADD     .L2     B12,B25,B5        ; |195| 
           ADD     .L2     4,B12,B12         ; |191| 
           ADDSP   .L1     A16,A3,A3         ; |181| 

   [ B0]   MV      .L2X    A4,B4             ; |93| 
||         SET     .S1     A26,0x17,0x1d,A4

           ADDSP   .L2     B27,B4,B6         ; |190| 
||         ZERO    .S2     B4

           MVKH    .S2     0xbf800000,B4

   [!B2]   MV      .L2X    A4,B4             ; |172| 
||         SET     .S1     A24,0x18,0x1d,A4

           CMPGTSP .S1     A18,A4,A0         ; |194| 

   [ A2]   BNOP    .S1     $C$L7,3           ; |191| 
||         MPYSP   .M2     B4,B6,B4          ; |190| 

   [!A0]   MV      .L2X    A3,B4             ; |195| 

   [ A2]   CALL    .S1     _asinhf           ; |192| 
||         STW     .D2T2   B4,*B5            ; |195| 

           ; BRANCHCC OCCURS {$C$L7}         ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     _asinhsp_v        ; |197| 
           LDW     .D1T2   *A14,B4           ; |197| 
           MVKL    .S1     _a_sc,A4
           MVKH    .S1     _a_sc,A4
           ADDKPC  .S2     $C$RL14,B3,0      ; |197| 
           MVK     .L1     0x8,A6            ; |197| 
$C$RL14:   ; CALL OCCURS {_asinhsp_v} {0}    ; |197| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .L1     0x8,A4            ; |200| 

$C$RL15:   ; CALL OCCURS {_allequal} {0}     ; |200| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x3,A4            ; |201| 

$C$RL16:   ; CALL OCCURS {_print_test_results} {0}  ; |201| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S2     _a_ext,B4
           MVK     .S2     0xed,B31

           MVKH    .S2     _a_ext,B4
||         ZERO    .L1     A3

           STW     .D2T2   B31,*+SP(12)      ; |204| 
||         SET     .S1     A3,0x17,0x17,A3

           CALL    .S1     _asinhf           ; |206| 
||         STW     .D2T1   A3,*B4            ; |204| 
||         MV      .L1X    B4,A15            ; |204| 

           LDW     .D1T1   *A15,A4           ; |206| 
||         MVKL    .S2     0xcccccccd,B12

           MVKL    .S2     0xc000cccc,B13
           MVKH    .S2     0xcccccccd,B12

           MVKH    .S2     0xc000cccc,B13
||         MV      .L2X    A12,B10

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
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL17,B3,0      ; |206| 
$C$RL17:   ; CALL OCCURS {_asinhf} {0}       ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *A3,A3            ; |206| 
           NOP             4
           ADD     .L1X    B10,A3,A3         ; |206| 
           STW     .D1T1   A4,*A3            ; |206| 

           CALLP   .S2     _asinhsp,B3
||         LDW     .D1T1   *A15,A4           ; |207| 

$C$RL18:   ; CALL OCCURS {_asinhsp} {0}      ; |207| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(4),A3        ; |207| 
           MV      .L2X    A4,B4             ; |207| 
           NOP             3
           ADD     .L1X    B10,A3,A3         ; |207| 
           STW     .D1T2   B4,*A3            ; |207| 

           CALLP   .S2     _asinhsp_c,B3
||         LDW     .D1T1   *A15,A4           ; |208| 

$C$RL19:   ; CALL OCCURS {_asinhsp_c} {0}    ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 174
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(8),A3        ; |208| 
           ZERO    .L1     A31
           ZERO    .L1     A30
           ZERO    .L1     A28
           ZERO    .L1     A27
           ADD     .L2X    B10,A3,B4         ; |208| 
           STW     .D2T1   A4,*B4            ; |208| 
           LDW     .D1T1   *A15,A8           ; |209| 
           SET     .S1     A31,0x17,0x1d,A3
           ZERO    .L1     A25
           LDW     .D2T2   *B11,B26          ; |209| 
           MVKL    .S2     0xbf000003,B31
           MPYSP   .M1     A8,A8,A18         ; |169| 
           ABSSP   .S1     A8,A9             ; |168| 
           MPYSP   .M1     A9,A9,A26         ; |125| 
           MVKH    .S2     0xbf000003,B31
           ADDSP   .L1     A3,A18,A6         ; |123| 
           SET     .S1     A30,0x18,0x1d,A3
           MVKL    .S2     0xbe2a9a99,B30
           MVK     .S1     0xfffffc01,A23
           SPDP    .S1     A6,A5:A4          ; |123| 
           MPYSP   .M1     A3,A6,A29         ; |123| 
           RSQRDP  .S1     A5:A4,A5:A4       ; |123| 
           MVKL    .S2     0x3d966b1c,B29
           DPSP    .L1     A5:A4,A4          ; |123| 
           CMPEQSP .S1     A6,A26,A0         ; |125| 
           MVKL    .S1     0x3e436581,A2
           MVKH    .S2     0xbe2a9a99,B30
           MPYSP   .M1     A4,A29,A3         ; |123| 
           MVKH    .S1     0x3e436581,A2
           MVKH    .S2     0x3d966b1c,B29
           MVKL    .S1     0xbe804d66,A1
           MPYSP   .M1     A4,A3,A7          ; |123| 
           SET     .S1     A28,0x16,0x1d,A3
           MVKL    .S2     0x7f7fffff,B28
           MVKH    .S1     0xbe804d66,A1
           SUBSP   .L1     A3,A7,A3          ; |123| 
           MVKH    .S2     0x7f7fffff,B28
           MVKL    .S1     0xbe6bd0fc,A31
           MVKH    .S1     0xbe6bd0fc,A31
           MPYSP   .M1     A4,A3,A4          ; |123| 
           MPYSP   .M1     A18,A18,A26       ; |181| 
           MVKL    .S1     _ti_math_logtable,A28
           MVKH    .S1     _ti_math_logtable,A28
           MPYSP   .M1     A4,A4,A3          ; |123| 
           MVKL    .S2     0x3f317218,B27
           MPYSP   .M2X    B30,A18,B6        ; |181| 
           MPYSP   .M2X    B29,A26,B7        ; |181| 
           MPYSP   .M1     A29,A3,A5         ; |123| 
           SET     .S1     A27,0x16,0x1d,A3
           MVKL    .S1     0x3eaaa872,A27
           MVKH    .S1     0x3eaaa872,A27
           SUBSP   .L1     A3,A5,A3          ; |123| 
           ADDSP   .L2     B7,B6,B6          ; |181| 
           MVKH    .S2     0x3f317218,B27
           NOP             1
           MPYSP   .M1     A4,A3,A3          ; |123| 
           NOP             3
           MPYSP   .M1     A6,A3,A4          ; |123| 
           SET     .S1     A25,0x18,0x1d,A3
           MPYSP   .M1     A3,A9,A5          ; |90| 
           MVKL    .S1     0xbd07484c,A25
   [ A0]   MV      .L1     A9,A4             ; |126| 
           MPYSP   .M1     A3,A4,A3          ; |90| 
           MVKH    .S1     0xbd07484c,A25
           NOP             2
           ADDSP   .L1     A5,A3,A19         ; |90| 
           NOP             3
           SPDP    .S1     A19,A5:A4         ; |90| 
           CMPGTSP .S2X    A19,B28,B0        ; |92| 
           RCPDP   .S1     A5:A4,A5:A4       ; |90| 
           NOP             1

           CLR     .S1     A5,0,16,A21       ; |90| 
||         MV      .L1     A12,A4            ; |90| 

           MV      .L1     A21,A5            ; |90| 
           MPYSPDP .M1     A19,A5:A4,A7:A6   ; |90| 
           EXTU    .S1     A21,1,21,A24      ; |90| 
           ADD     .L1     A23,A24,A3        ; |90| 
           INTDP   .L1     A3,A5:A4          ; |90| 
           EXTU    .S1     A21,12,29,A30     ; |90| 
           ZERO    .L1     A24
           NOP             1
           SUBDP   .L1     A7:A6,A13:A12,A7:A6 ; |90| 
           MPYDP   .M1     A11:A10,A5:A4,A17:A16 ; |90| 
           NOP             5
           DPSP    .L1     A7:A6,A20         ; |90| 
           NOP             3
           MPYSP   .M1     A2,A20,A22        ; |90| 
           MPYSP   .M1     A20,A20,A5        ; |90| 
           ZERO    .L1     A2
           NOP             1
           ADDSP   .L1     A1,A22,A22        ; |90| 
           MPYSP   .M1     A31,A5,A23        ; |90| 
           MPYSP   .M1     A5,A20,A4         ; |90| 
           LDDW    .D1T1   *+A28[A30],A21:A20 ; |90| 
           MPYSP   .M1     A5,A5,A29         ; |90| 
           ADDSP   .L1     A23,A22,A22       ; |90| 
           MPYSP   .M1     A27,A4,A3         ; |90| 
           MPYSP   .M2X    B31,A5,B4         ; |90| 
           SUBDP   .L1     A21:A20,A17:A16,A17:A16 ; |90| 
           MPYSP   .M1     A29,A22,A4        ; |90| 
           NOP             3
           ADDSP   .L1     A4,A3,A20         ; |90| 
           NOP             2
           ADDDP   .L1     A17:A16,A7:A6,A5:A4 ; |90| 
           MPYSP   .M1     A18,A26,A6        ; |181| 
           ADDSP   .L2X    A20,B4,B5         ; |90| 
           NOP             2
           MPYSP   .M1     A25,A6,A3         ; |181| 
           SPDP    .S2     B5,B5:B4          ; |90| 
           NOP             1
           ADDDP   .L2X    B5:B4,A5:A4,B5:B4 ; |90| 
           NOP             2
           ADDSP   .S2X    A3,B6,B7          ; |181| 
           MVKL    .S1     0x42b17218,A3
           MVKH    .S1     0x42b17218,A3
           NOP             1
           DPSP    .L2     B5:B4,B6          ; |90| 
           MPYSP   .M1X    A8,B7,A4          ; |181| 
           MV      .L2X    A12,B4
           CMPLTSP .S2X    A8,B4,B2          ; |172| 

   [ B0]   MV      .L2X    A3,B6             ; |93| 
||         ZERO    .L1     A3

           MVKH    .S1     0xbf800000,A3
           ADDSP   .S2     B27,B6,B6         ; |190| 

   [ B2]   MV      .L2X    A3,B4             ; |172| 
||         SET     .S1     A24,0x17,0x1d,A3

           ADDSP   .L1     A8,A4,A4          ; |181| 
   [!B2]   MV      .L2X    A3,B4             ; |172| 
           MPYSP   .M2     B4,B6,B4          ; |190| 
           ADD     .L2     B10,B26,B5        ; |209| 
           SET     .S1     A2,0x18,0x1d,A3
           CMPGTSP .S1     A9,A3,A0          ; |194| 
   [!A0]   MV      .L2X    A4,B4             ; |195| 
           STW     .D2T2   B4,*B5            ; |209| 
           LDW     .D1T2   *A15,B4           ; |210| 
           ADD     .L2     4,B10,B10         ; |205| 
           NOP             3
           MPYSPDP .M2     B4,B13:B12,B5:B4  ; |210| 
           NOP             6

           DPSP    .L2     B5:B4,B5          ; |210| 
||         LDW     .D2T2   *+SP(12),B4

           NOP             3
           STW     .D1T2   B5,*++A15         ; |210| 

           SUB     .L1X    B4,1,A0           ; |205| 
||         SUB     .L2     B4,1,B4           ; |205| 

           STW     .D2T2   B4,*+SP(12)       ; |210| 
|| [ A0]   B       .S2     $C$L8             ; |205| 
|| [!A0]   MVKL    .S1     _output,A3

   [ A0]   CALL    .S2     _asinhf           ; |206| 
|| [!A0]   MVKH    .S1     _output,A3

   [ A0]   LDW     .D1T1   *A15,A4           ; |206| 

   [!A0]   CALL    .S1     _asinhsp_v        ; |212| 
|| [!A0]   MV      .L2X    A3,B10            ; |212| 

   [!A0]   LDW     .D2T2   *+B10(16),B4      ; |212| 
   [!A0]   MVKL    .S1     _a_ext,A4
           ; BRANCHCC OCCURS {$C$L8}         ; |205| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           MVKH    .S1     _a_ext,A4
           MVK     .S1     0xed,A6           ; |212| 
           ADDKPC  .S2     $C$RL20,B3,0      ; |212| 
$C$RL20:   ; CALL OCCURS {_asinhsp_v} {0}    ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 40
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xed,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL21:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3eb0c6f7,B7

           MVKL    .S1     _fcn_pass,A10
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     _fcn_pass,A10
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D1T1   A4,*+A10(4)       ; |66| 
||         LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xed,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL22:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D1T1   A4,*+A10(8)       ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0xed,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL23:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           STW     .D1T1   A4,*+A10(12)      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B10,A3            ; |68| 
||         LDW     .D1T2   *A14,B4           ; |69| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MVK     .S1     0xed,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL24:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2X    4,A10,B11
           LDW     .D2T2   *B11,B0           ; |72| 
           STW     .D1T1   A4,*+A10(16)      ; |69| 
           ADD     .L2X    8,A10,B10
           NOP             2

   [!B0]   MVKL    .S1     _all_pass,A3
|| [!B0]   B       .S2     $C$L9             ; |72| 
|| [!B0]   MV      .L1     A12,A4
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     _print_test_results ; |218| 
|| [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [!B0]   MV      .L1     A12,A0            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   MV      .L1     A12,A4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |218| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x4,A4            ; |218| 
||         ADDKPC  .S2     $C$RL25,B3,0      ; |218| 

$C$RL25:   ; CALL OCCURS {_print_test_results} {0}  ; |218| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         MV      .L2X    A12,B4            ; |114| 
||         MV      .L1     A12,A10           ; |114| 
||         MV      .D1     A12,A11           ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A3       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     _t_start,A3

           MVKH    .S1     _t_start,A3
||         MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           CALL    .S2     _gimme_random     ; |228| 
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKL    .S1     0x49742410,A15

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 
||         MVKL    .S1     _t_offset,A3

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     _t_offset,A3

           ZERO    .L2     B4
||         STDW    .D1T2   B5:B4,*A3         ; |117| 
||         MVKH    .S1     0x49742410,A15

           MVKH    .S2     0xbf800000,B4
||         MV      .L1     A15,A4            ; |228| 
||         MVK     .S1     0x80,A12
||         MV      .D1     A10,A13           ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL26,B3,0      ; |228| 
$C$RL26:   ; CALL OCCURS {_gimme_random} {0}  ; |228| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 161
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |228| 
           NOP             4
           ADD     .L1     A13,A3,A3         ; |228| 

           STW     .D1T1   A4,*A3            ; |228| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 

           MPYSP   .M1     A4,A4,A9          ; |169| 
||         ZERO    .L1     A3
||         ZERO    .S1     A31
||         ZERO    .D1     A30
||         MVKL    .S2     0xfefa39ec,B4

           SET     .S1     A3,0x17,0x1d,A3
||         ZERO    .L1     A29
||         ZERO    .D1     A27
||         MVKL    .S2     0x3fe62e42,B5

           ABSSP   .S1     A4,A8             ; |168| 
||         ZERO    .L1     A19
||         MV      .D1     A10,A18           ; |90| 
||         MVKH    .S2     0xfefa39ec,B4

           MPYSP   .M1     A8,A8,A28         ; |125| 
||         SET     .S1     A19,0x14,0x1d,A19
||         MVKH    .S2     0x3fe62e42,B5

           SET     .S1     A31,0x18,0x1d,A3
||         ADDSP   .L1     A3,A9,A16         ; |123| 
||         MVKL    .S2     0xbf000003,B31

           MVK     .S1     0xfffffc01,A26
||         MVKH    .S2     0xbf000003,B31

           MVKL    .S1     0x3e436581,A25
||         MVKL    .S2     0x3d966b1c,B29

           MVKH    .S1     0x3e436581,A25
||         MVKL    .S2     0xbe2a9a99,B30

           SPDP    .S1     A16,A7:A6         ; |123| 
||         MPYSP   .M1     A3,A16,A5         ; |123| 
||         MVKH    .S2     0x3d966b1c,B29

           MVKH    .S2     0xbe2a9a99,B30

           RSQRDP  .S1     A7:A6,A7:A6       ; |123| 
||         MPYSP   .M2X    B30,A9,B8         ; |181| 
||         MVKL    .S2     0x7f7fffff,B28

           MVKH    .S2     0x7f7fffff,B28

           DPSP    .L1     A7:A6,A6          ; |123| 
||         CMPEQSP .S1     A16,A28,A0        ; |125| 
||         MVKL    .S2     0x3f317218,B27

           MVKL    .S1     0xbe804d66,A24
||         MVKH    .S2     0x3f317218,B27

           MVKL    .S1     0xbe6bd0fc,A23
||         MVKL    .S2     _t_start,B26

           MVKH    .S1     0xbe804d66,A24
||         MVKH    .S2     _t_start,B26

           MPYSP   .M1     A6,A5,A3          ; |123| 
||         MVKH    .S1     0xbe6bd0fc,A23
||         STDW    .D2T2   B7:B6,*B26

           MVKL    .S1     _ti_math_logtable,A2
           MVKH    .S1     _ti_math_logtable,A2
           NOP             1

           MPYSP   .M1     A6,A3,A7          ; |123| 
||         SET     .S1     A30,0x16,0x1d,A3

           MVKL    .S1     0x3eaaa872,A30
           MVKH    .S1     0x3eaaa872,A30
           NOP             1
           SUBSP   .L1     A3,A7,A3          ; |123| 
           NOP             3
           MPYSP   .M1     A6,A3,A3          ; |123| 
           NOP             3
           MPYSP   .M1     A3,A3,A6          ; |123| 
           NOP             3

           MPYSP   .M1     A5,A6,A5          ; |123| 
||         SET     .S1     A29,0x16,0x1d,A6

           MPYSP   .M1     A9,A9,A29         ; |181| 
           NOP             2
           SUBSP   .L1     A6,A5,A5          ; |123| 
           MPYSP   .M1     A9,A29,A28        ; |181| 
           MPYSP   .M2X    B29,A29,B9        ; |181| 
           NOP             1

           MPYSP   .M1     A3,A5,A3          ; |123| 
||         SET     .S1     A27,0x18,0x1d,A5

           MPYSP   .M1     A5,A8,A6          ; |90| 
||         MVKL    .S1     0xbd07484c,A27

           MVKH    .S1     0xbd07484c,A27
||         ADDSP   .L2     B9,B8,B8          ; |181| 

           NOP             1
           MPYSP   .M1     A16,A3,A3         ; |123| 
           NOP             3
   [ A0]   MV      .L1     A8,A3             ; |126| 
           MPYSP   .M1     A5,A3,A3          ; |90| 
           NOP             3
           ADDSP   .L1     A6,A3,A16         ; |90| 
           NOP             3
           SPDP    .S1     A16,A7:A6         ; |90| 
           CMPGTSP .S2X    A16,B28,B0        ; |92| 
           RCPDP   .S1     A7:A6,A7:A6       ; |90| 
           NOP             1

           CLR     .S1     A7,0,16,A17       ; |90| 
||         MV      .L1     A10,A6            ; |90| 

           MV      .L1     A17,A7            ; |90| 
||         EXTU    .S1     A17,1,21,A5       ; |90| 

           MPYSPDP .M1     A16,A7:A6,A7:A6   ; |90| 
||         ADD     .L1     A26,A5,A3         ; |90| 
||         EXTU    .S1     A17,12,29,A17     ; |90| 

           MVKL    .S1     _output+12,A26
           MVKH    .S1     _output+12,A26
           NOP             4

           SUBDP   .S1     A7:A6,A19:A18,A7:A6 ; |90| 
||         INTDP   .L1     A3,A19:A18        ; |90| 

           NOP             5

           MPYDP   .M2X    B5:B4,A19:A18,B5:B4 ; |90| 
||         LDDW    .D1T1   *+A2[A17],A19:A18 ; |90| 

           DPSP    .L1     A7:A6,A21         ; |90| 
           NOP             3
           MPYSP   .M1     A21,A21,A20       ; |90| 

           MPYSP   .M1     A25,A21,A22       ; |90| 
||         ZERO    .L1     A25

           NOP             2
           MPYSP   .M1     A20,A20,A31       ; |90| 

           ADDSP   .L1     A24,A22,A5        ; |90| 
||         MPYSP   .M1     A23,A20,A22       ; |90| 
||         ZERO    .S1     A24

           MPYSP   .M1     A20,A21,A1        ; |90| 
||         SUBDP   .S1X    A19:A18,B5:B4,A19:A18 ; |90| 
||         MPYSP   .M2X    B31,A20,B4        ; |90| 

           NOP             2
           ADDSP   .L1     A22,A5,A5         ; |90| 
           MPYSP   .M1     A30,A1,A3         ; |90| 
           NOP             2

           MPYSP   .M1     A31,A5,A5         ; |90| 
||         ADDDP   .L1     A19:A18,A7:A6,A7:A6 ; |90| 

           NOP             3

           ADDSP   .L1     A5,A3,A5          ; |90| 
||         MPYSP   .M1     A27,A28,A3        ; |181| 

           NOP             4

           ADDSP   .L2X    A5,B4,B5          ; |90| 
||         LDW     .D1T1   *A26,A5           ; |232| 

           ADDSP   .L2X    A3,B8,B9          ; |181| 
||         MVKL    .S1     0x42b17218,A3

           MVKH    .S1     0x42b17218,A3
           NOP             1
           SPDP    .S2     B5,B5:B4          ; |90| 
           ADD     .L1     A13,A5,A23        ; |232| 

           ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |90| 
||         MPYSP   .M1X    A4,B9,A6          ; |181| 

           NOP             6

           DPSP    .L2     B5:B4,B8          ; |90| 
||         MV      .S2X    A11,B4

           CMPLTSP .S2X    A4,B4,B2          ; |172| 
||         ADDSP   .S1     A4,A6,A4          ; |181| 

           NOP             2

   [ B0]   MV      .L2X    A3,B8             ; |93| 
||         ZERO    .L1     A3

           MVKH    .S1     0xbf800000,A3
||         ADDSP   .L2     B27,B8,B5         ; |190| 

           NOP             1

   [ B2]   MV      .L2X    A3,B4             ; |172| 
||         SET     .S1     A25,0x17,0x1d,A3

           NOP             1

   [!B2]   MV      .L2X    A3,B4             ; |172| 
||         SET     .S1     A24,0x18,0x1d,A3

           MPYSP   .M2     B4,B5,B4          ; |190| 
||         CMPGTSP .S1     A8,A3,A0          ; |194| 

           NOP             3
   [!A0]   MV      .L2X    A4,B4             ; |195| 

           STW     .D1T2   B4,*A23           ; |232| 
||         MVC     .S2     TSCL,B4           ; |128| 

           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     _t_offset,B12
||         MVKL    .S1     _cycle_counts+24,A3
||         SUB     .L1     A12,1,A0          ; |226| 

           MVKH    .S2     _t_offset,B12
||         MVKH    .S1     _cycle_counts+24,A3

           LDDW    .D2T2   *B12,B9:B8        ; |130| 
||         LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         MVKL    .S2     _t_stop,B25
||         MV      .L1     A3,A14            ; |128| 

           MVKH    .S2     _t_stop,B25
           STDW    .D2T2   B5:B4,*B25        ; |128| 
           NOP             2
           ADDU    .L2     B8,B6,B17:B16     ; |130| 

           ADD     .S2     B17,B9,B16        ; |130| 
||         SUBU    .L2     B4,B16,B9:B8      ; |130| 
|| [ A0]   B       .S1     $C$L10            ; |226| 
|| [ A0]   ZERO    .D2     B4

           ADD     .D2     B16,B7,B7         ; |130| 
|| [ A0]   CALL    .S1     _gimme_random     ; |228| 
||         EXT     .S2     B9,24,24,B16      ; |130| 
||         ADDU    .L2X    A4,B8,B9:B8       ; |130| 
|| [ A0]   MV      .L1     A15,A4            ; |228| 

           SUB     .L2     B5,B7,B7          ; |130| 
|| [ A0]   MVKH    .S2     0xbf800000,B4

           ADD     .L2X    B9,A5,B7          ; |130| 
||         ADD     .S2     B7,B16,B9         ; |130| 

           ADD     .L2     B7,B9,B9          ; |130| 

           STDW    .D1T2   B9:B8,*A14        ; |130| 
||         ADD     .L1     4,A13,A13         ; |226| 
||         SUB     .S1     A12,1,A12         ; |226| 

           ; BRANCHCC OCCURS {$C$L10}        ; |226| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALLP   .S2     __fltllif,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |135| 

$C$RL27:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           MV      .L1     A10,A12           ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL28:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11

           MV      .L2X    A14,B4
||         SUBAW   .D1     A14,6,A3

           STDW    .D1T1   A11:A10,*A3       ; |114| 
||         MV      .L2X    A11,B5            ; |114| 

           MVC     .S2     B5,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B5,B4,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B7,B6,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 
||         MVK     .S1     0x80,A3

           STDW    .D2T2   B5:B4,*B12        ; |117| 
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
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |241| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |241| 
||         CALL    .S1     _asinhf           ; |241| 

           LDW     .D1T1   *A3,A4            ; |241| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |241| 
$C$RL29:   ; CALL OCCURS {_asinhf} {0}       ; |241| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |241| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |241| 

           STW     .D1T1   A4,*A3            ; |241| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_start,B5
||         MV      .L1X    B12,A15           ; |128| 
||         MVKL    .S1     _cycle_counts,A3
||         SUB     .D1     A14,1,A0          ; |239| 
||         MV      .L2     B4,B17            ; |128| 

           MVKH    .S2     _t_start,B5
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         MVKH    .S1     _cycle_counts,A3
||         SUB     .L1     A14,1,A14         ; |239| 

           LDDW    .D2T2   *B5,B7:B6         ; |130| 
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S2     _cycle_counts,B4
||         MVKL    .S1     _t_stop,A31
||         ADD     .L1     4,A12,A12         ; |239| 

           MVKH    .S1     _t_stop,A31
           MVKH    .S2     _cycle_counts,B4
           STDW    .D1T2   B17:B16,*A31      ; |128| 
   [!A0]   MV      .L1X    B4,A14
           ADDU    .L2X    A4,B6,B9:B8       ; |130| 

           ADD     .S2X    B9,A5,B5          ; |130| 
|| [ A0]   B       .S1     $C$L11            ; |239| 
||         SUBU    .L2     B16,B8,B9:B8      ; |130| 

           ADD     .D2     B5,B7,B5          ; |130| 
||         ADDU    .L2X    A6,B8,B7:B6       ; |130| 
||         EXT     .S2     B9,24,24,B8       ; |130| 

           SUB     .L2     B17,B5,B5         ; |130| 

           ADD     .L2X    B7,A7,B5          ; |130| 
||         ADD     .S2     B5,B8,B7          ; |130| 

           ADD     .L2     B5,B7,B7          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B7:B6,*B4         ; |130| 

           ; BRANCHCC OCCURS {$C$L11}        ; |239| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL30,B3,3      ; |135| 
$C$RL30:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
           CALLP   .S2     __fixdlli,B3
$C$RL31:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A14(16) ; |114| 
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
||         MV      .L2X    A3,B12            ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |250| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |250| 
||         CALL    .S1     _asinhsp_c        ; |250| 

           LDW     .D1T1   *A3,A4            ; |250| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |250| 
$C$RL32:   ; CALL OCCURS {_asinhsp_c} {0}    ; |250| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output+8,B4
           MVKH    .S2     _output+8,B4
           LDW     .D2T2   *B4,B4            ; |250| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |250| 

           STW     .D1T1   A4,*A3            ; |250| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S2     _t_start,B4
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         SUB     .L1X    B12,1,A0          ; |248| 
||         MV      .L2     B6,B9             ; |128| 
||         MVKL    .S1     _t_stop,A31
||         SUB     .D2     B12,1,B12         ; |248| 

           MVKH    .S2     _t_start,B4
||         ADDAD   .D1     A14,2,A3
||         MVKH    .S1     _t_stop,A31
||         ADD     .L1     4,A12,A12         ; |248| 

           LDDW    .D2T2   *B4,B17:B16       ; |130| 
           MVK     .S2     16,B13
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B9:B8,*A31        ; |128| 
           ADD     .L2X    A14,B13,B13
           ADDU    .L2X    A4,B16,B5:B4      ; |130| 

   [ A0]   B       .S1     $C$L12            ; |248| 
||         ADD     .S2X    B5,A5,B6          ; |130| 
||         SUBU    .L2     B8,B4,B5:B4       ; |130| 

           ADD     .D2     B6,B17,B6         ; |130| 
||         EXT     .S2     B5,24,24,B31      ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B9,B6,B7          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B7,B31,B6         ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L12}        ; |248| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(16),A5:A4   ; |135| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |135| 
$C$RL33:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
           CALLP   .S2     __fixdlli,B3
$C$RL34:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A14(8)  ; |114| 
||         MV      .L2X    A11,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B13        ; |135| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B5,B4,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B7,B6,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 
||         MVK     .S1     0x80,A3

           STDW    .D1T2   B5:B4,*A15        ; |117| 
||         STW     .D2T1   A3,*+SP(12)       ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |259| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |259| 
||         CALL    .S1     _asinhsp          ; |259| 

           LDW     .D1T1   *A3,A4            ; |259| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |259| 
$C$RL35:   ; CALL OCCURS {_asinhsp} {0}      ; |259| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output+4,B4
           MVKH    .S2     _output+4,B4
           LDW     .D2T2   *B4,B4            ; |259| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |259| 

           STW     .D1T1   A4,*A3            ; |259| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_start,B12
||         LDW     .D2T1   *+SP(12),A30      ; |128| 
||         ADDAD   .D1     A14,1,A3
||         MV      .L2     B4,B9             ; |128| 
||         MVKL    .S1     _t_stop,A31
||         ADD     .L1     4,A12,A12         ; |257| 

           MVKH    .S2     _t_start,B12
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         MVKH    .S1     _t_stop,A31

           MV      .L2X    A3,B13            ; |128| 
||         LDDW    .D2T2   *B12,B7:B6        ; |130| 

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B9:B8,*A31        ; |128| 
           SUB     .L1     A30,1,A0          ; |257| 
           STW     .D2T1   A0,*+SP(12)       ; |130| 
           ADDU    .L2X    A4,B6,B17:B16     ; |130| 

           ADD     .L2X    B17,A5,B6         ; |130| 
|| [ A0]   B       .S1     $C$L13            ; |257| 
||         MV      .S2     B16,B4            ; |130| 

           SUBU    .L2     B8,B4,B5:B4       ; |130| 
||         ADD     .S2     B6,B7,B6          ; |130| 

           EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 
||         SUB     .D2     B9,B6,B6          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L13}        ; |257| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(8),A5:A4    ; |135| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |135| 
$C$RL36:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 112
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A11,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL37:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 

           MV      .L2X    A10,B4            ; |114| 
||         MV      .L1X    B13,A12           ; |135| 
||         STDW    .D1T1   A11:A10,*+A14(32) ; |114| 

           STDW    .D1T1   A5:A4,*A12        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D2T2   B7:B6,*B12        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3

           MV      .L1     A3,A10            ; |117| 
||         MVKL    .S1     _input,A3
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           MVKH    .S1     _input,A3
||         EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 

           MV      .L2X    A3,B9             ; |266| 
||         STDW    .D1T2   B5:B4,*A15        ; |117| 

           CALLP   .S2     _asinhsp_v,B3
||         LDW     .D2T1   *B9,A4            ; |266| 
||         LDW     .D1T2   *+A10(16),B4      ; |266| 
||         MVK     .S1     0x80,A6           ; |266| 

$C$RL38:   ; CALL OCCURS {_asinhsp_v} {0}    ; |266| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         LDDW    .D2T2   *B12,B9:B8        ; |130| 

           MVK     .S2     24,B12
           ADD     .L2X    A12,B12,B12
           LDDW    .D2T2   *B12,B7:B6        ; |130| 
           MVKL    .S1     _t_stop,A3

           ADDU    .L1X    A4,B8,A7:A6       ; |130| 
||         MVKH    .S1     _t_stop,A3

           ADD     .S1     A7,A5,A4          ; |130| 
||         SUBU    .L1X    B16,A6,A7:A6      ; |130| 

           MV      .L2     B4,B17            ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         MV      .L1     A6,A3             ; |130| 

           ADD     .L2X    A4,B9,B5          ; |130| 
||         ADDU    .L1X    B6,A3,A5:A4       ; |130| 
||         EXT     .S1     A7,24,24,A3       ; |130| 

           SUB     .L2     B17,B5,B5         ; |130| 
           ADD     .L2X    B5,A3,B5          ; |130| 
           ADD     .L2X    A5,B7,B6          ; |130| 

           STDW    .D2T2   B17:B16,*B4       ; |128| 
||         ADD     .L2     B6,B5,B4          ; |130| 

           NOP             1

           CALLP   .S2     __fltllif,B3
||         MV      .L1X    B4,A5             ; |130| 

$C$RL39:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A11,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL40:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STDW    .D2T1   A5:A4,*B12        ; |130| 
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 

$C$RL41:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0xa0b5ed8d,B6

           MVKL    .S1     _fcn_pass,A3
||         MVKL    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVKH    .S1     _fcn_pass,A3
||         MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MV      .S1     A3,A11            ; |66| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A5,*+A11(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL42:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           STW     .D1T1   A4,*+A11(8)       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL43:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T2   *+SP(16),B4       ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D1T1   A4,*+A11(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A10,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL44:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *B11,B0           ; |72| 
           STW     .D1T1   A4,*+A11(16)      ; |69| 
           NOP             3

   [!B0]   BNOP    .S1     $C$L14,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           ; BRANCHCC OCCURS {$C$L14}        ; |72| 
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
   [ A0]   B       .S1     $C$L15            ; |72| 
   [ A0]   CALL    .S1     _print_test_results ; |272| 
   [ A0]   MVKL    .S1     _all_pass,A3
   [ A0]   MVKH    .S1     _all_pass,A3
           NOP             2
           ; BRANCHCC OCCURS {$C$L15}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |272| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           MV      .L1     A12,A4
           NOP             1
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x2,A4            ; |272| 
||         ADDKPC  .S2     $C$RL45,B3,0      ; |272| 

$C$RL45:   ; CALL OCCURS {_print_test_results} {0}  ; |272| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |273| 

$C$RL46:   ; CALL OCCURS {_printf} {0}       ; |273| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |273| 

$C$RL47:   ; CALL OCCURS {_printf} {0}       ; |273| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |280| 

$C$RL48:   ; CALL OCCURS {_print_profile_results} {0}  ; |280| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |283| 

$C$RL49:   ; CALL OCCURS {_print_memory_results} {0}  ; |283| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(24),B3      ; |284| 
           LDDW    .D2T1   *++SP,A13:A12     ; |284| 
           LDDW    .D2T1   *++SP,A15:A14     ; |284| 
           LDDW    .D2T2   *++SP,B11:B10     ; |284| 
           LDDW    .D2T2   *++SP,B13:B12     ; |284| 

           LDW     .D2T1   *++SP(8),A10      ; |284| 
||         RET     .S2     B3                ; |284| 

           LDW     .D2T1   *++SP(8),A11      ; |284| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |284| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"asinhSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_asinhf
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_asinhsp_c
	.global	_asinhsp
	.global	_asinhsp_v
	.global	_ti_math_logtable
	.global	_t_start
	.global	_t_stop
	.global	_t_offset
	.global	_cycle_counts
	.global	_fcn_pass
	.global	_all_pass
	.global	_a_ext
	.global	_a_sc
	.global	_output
	.global	_input
	.global	__fltllif
	.global	__fixdlli

;******************************************************************************
;* BUILD ATTRIBUTES                                                           *
;******************************************************************************
	.battr "TI", Tag_File, 1, Tag_ABI_stack_align_needed(0)
	.battr "TI", Tag_File, 1, Tag_ABI_stack_align_preserved(0)
	.battr "TI", Tag_File, 1, Tag_Tramps_Use_SOC(1)
