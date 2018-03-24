;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:32:19 2016                                *
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
	.word	04957871bh		; a[0] @ 0
	.word	04908cbd1h		; a[1] @ 32
	.word	047eecb43h		; a[2] @ 64
	.word	048ee9b46h		; a[3] @ 96
	.word	04769c16dh		; a[4] @ 128
	.word	0490eab2dh		; a[5] @ 160
	.word	048b6ed1ah		; a[6] @ 192
	.word	0495ea9a7h		; a[7] @ 224
	.word	0494dc1fdh		; a[8] @ 256
	.word	04898b6a0h		; a[9] @ 288
	.word	04930b6dfh		; a[10] @ 320
	.word	04944ccfah		; a[11] @ 352
	.word	047f88b18h		; a[12] @ 384
	.word	04963d7dah		; a[13] @ 416
	.word	048b938b1h		; a[14] @ 448
	.word	048139381h		; a[15] @ 480
	.word	048cbaa02h		; a[16] @ 512
	.word	04849ed94h		; a[17] @ 544
	.word	048045b00h		; a[18] @ 576
	.word	048f63ebbh		; a[19] @ 608
	.word	04941aaadh		; a[20] @ 640
	.word	048f564dfh		; a[21] @ 672
	.word	048b757c2h		; a[22] @ 704
	.word	0473703c5h		; a[23] @ 736
	.word	0496a808ah		; a[24] @ 768
	.word	0493e1256h		; a[25] @ 800
	.word	047b88105h		; a[26] @ 832
	.word	048fc9eeeh		; a[27] @ 864
	.word	04834bea7h		; a[28] @ 896
	.word	04911c0d2h		; a[29] @ 928
	.word	049513659h		; a[30] @ 960
	.word	048860d4ah		; a[31] @ 992
	.word	048a89e0ah		; a[32] @ 1024
	.word	047be1956h		; a[33] @ 1056
	.word	0494deeddh		; a[34] @ 1088
	.word	0487faa44h		; a[35] @ 1120
	.word	0495cd230h		; a[36] @ 1152
	.word	046b547c8h		; a[37] @ 1184
	.word	049462ceeh		; a[38] @ 1216
	.word	046b4a24ah		; a[39] @ 1248
	.word	04963162fh		; a[40] @ 1280
	.word	0492bad91h		; a[41] @ 1312
	.word	047f16f7bh		; a[42] @ 1344
	.word	04925e39eh		; a[43] @ 1376
	.word	04792067ah		; a[44] @ 1408
	.word	047986297h		; a[45] @ 1440
	.word	049313b6ah		; a[46] @ 1472
	.word	0496a6642h		; a[47] @ 1504
	.word	049105773h		; a[48] @ 1536
	.word	04921834ah		; a[49] @ 1568
	.word	04825efa4h		; a[50] @ 1600
	.word	0483683e5h		; a[51] @ 1632
	.word	04898ffaah		; a[52] @ 1664
	.word	0490ab25ch		; a[53] @ 1696
	.word	049106a3ch		; a[54] @ 1728
	.word	048804359h		; a[55] @ 1760
	.word	04926cf68h		; a[56] @ 1792
	.word	048fa39aah		; a[57] @ 1824
	.word	049318d2bh		; a[58] @ 1856
	.word	0492d6a0bh		; a[59] @ 1888
	.word	04931b46ch		; a[60] @ 1920
	.word	04941e5f9h		; a[61] @ 1952
	.word	0495d3faeh		; a[62] @ 1984
	.word	04916d9e3h		; a[63] @ 2016
	.word	04791cabbh		; a[64] @ 2048
	.word	0489911deh		; a[65] @ 2080
	.word	047169421h		; a[66] @ 2112
	.word	049276bcdh		; a[67] @ 2144
	.word	049656cbdh		; a[68] @ 2176
	.word	04909736bh		; a[69] @ 2208
	.word	0491dd177h		; a[70] @ 2240
	.word	0484260c2h		; a[71] @ 2272
	.word	04800c84dh		; a[72] @ 2304
	.word	0491866b7h		; a[73] @ 2336
	.word	0494c5549h		; a[74] @ 2368
	.word	0470af778h		; a[75] @ 2400
	.word	0476bf3cch		; a[76] @ 2432
	.word	0482b19f3h		; a[77] @ 2464
	.word	0489935fah		; a[78] @ 2496
	.word	049256990h		; a[79] @ 2528
	.word	0492fa1f6h		; a[80] @ 2560
	.word	048ed9ea6h		; a[81] @ 2592
	.word	048b44df1h		; a[82] @ 2624
	.word	0483b6845h		; a[83] @ 2656
	.word	0492bbdfbh		; a[84] @ 2688
	.word	048d1ce69h		; a[85] @ 2720
	.word	04959df7fh		; a[86] @ 2752
	.word	04868ceedh		; a[87] @ 2784
	.word	0484319cah		; a[88] @ 2816
	.word	048e0c3c8h		; a[89] @ 2848
	.word	048b5ecb1h		; a[90] @ 2880
	.word	0479e3e23h		; a[91] @ 2912
	.word	049723aa5h		; a[92] @ 2944
	.word	0491a135ah		; a[93] @ 2976
	.word	04955eaf1h		; a[94] @ 3008
	.word	04908ebf4h		; a[95] @ 3040
	.word	048d97097h		; a[96] @ 3072
	.word	0491145cdh		; a[97] @ 3104
	.word	047a7b105h		; a[98] @ 3136
	.word	047f86b73h		; a[99] @ 3168
	.word	04901f0eah		; a[100] @ 3200
	.word	0490f1638h		; a[101] @ 3232
	.word	0487b1acdh		; a[102] @ 3264
	.word	04946cb74h		; a[103] @ 3296
	.word	04946e2f5h		; a[104] @ 3328
	.word	048d817e1h		; a[105] @ 3360
	.word	0487435e6h		; a[106] @ 3392
	.word	0487e8188h		; a[107] @ 3424
	.word	048da3d4eh		; a[108] @ 3456
	.word	049115d7eh		; a[109] @ 3488
	.word	048fc9925h		; a[110] @ 3520
	.word	04927689ah		; a[111] @ 3552
	.word	0482c0ac6h		; a[112] @ 3584
	.word	0476c3f9dh		; a[113] @ 3616
	.word	047d330b5h		; a[114] @ 3648
	.word	0495e0b86h		; a[115] @ 3680
	.word	048aad192h		; a[116] @ 3712
	.word	048df9681h		; a[117] @ 3744
	.word	049204a29h		; a[118] @ 3776
	.word	048a8415bh		; a[119] @ 3808
	.word	0495ad583h		; a[120] @ 3840
	.word	0497352c7h		; a[121] @ 3872
	.word	048c1e600h		; a[122] @ 3904
	.word	042c07aefh		; a[123] @ 3936
	.word	048aa2d46h		; a[124] @ 3968
	.word	048eb6cd4h		; a[125] @ 4000
	.word	048194c2fh		; a[126] @ 4032
	.word	048e76e3dh		; a[127] @ 4064
	.word	0494c096ah		; a[128] @ 4096
	.word	04894d14ah		; a[129] @ 4128
	.word	048afbbd2h		; a[130] @ 4160
	.word	0496b7cfeh		; a[131] @ 4192
	.word	047855ba7h		; a[132] @ 4224
	.word	048e403ffh		; a[133] @ 4256
	.word	04661ba32h		; a[134] @ 4288
	.word	048754124h		; a[135] @ 4320
	.word	048b02c69h		; a[136] @ 4352
	.word	04903f5d3h		; a[137] @ 4384
	.word	0493316fch		; a[138] @ 4416
	.word	04930195fh		; a[139] @ 4448
	.word	0491785d5h		; a[140] @ 4480
	.word	0492e1bb1h		; a[141] @ 4512
	.word	0492e9093h		; a[142] @ 4544
	.word	048ad76f3h		; a[143] @ 4576
	.word	048a4146ah		; a[144] @ 4608
	.word	04938f2c1h		; a[145] @ 4640
	.word	04939c9d5h		; a[146] @ 4672
	.word	0492d6871h		; a[147] @ 4704
	.word	049163462h		; a[148] @ 4736
	.word	046f3bdb2h		; a[149] @ 4768
	.word	0487895cbh		; a[150] @ 4800
	.word	0496956ech		; a[151] @ 4832
	.word	048048994h		; a[152] @ 4864
	.word	048f41007h		; a[153] @ 4896
	.word	04832e271h		; a[154] @ 4928
	.word	0494e8b25h		; a[155] @ 4960
	.word	0482f1064h		; a[156] @ 4992
	.word	0492f4a61h		; a[157] @ 5024
	.word	047e8aafah		; a[158] @ 5056
	.word	049339fd7h		; a[159] @ 5088
	.word	049158ec5h		; a[160] @ 5120
	.word	049496a4fh		; a[161] @ 5152
	.word	04865afa3h		; a[162] @ 5184
	.word	0490ac894h		; a[163] @ 5216
	.word	0495e5082h		; a[164] @ 5248
	.word	0490cb1fch		; a[165] @ 5280
	.word	04892d18dh		; a[166] @ 5312
	.word	04955f3fdh		; a[167] @ 5344
	.word	04805d05dh		; a[168] @ 5376
	.word	0488edb8ch		; a[169] @ 5408
	.word	049219af7h		; a[170] @ 5440
	.word	049434d13h		; a[171] @ 5472
	.word	0496688a9h		; a[172] @ 5504
	.word	0495d6498h		; a[173] @ 5536
	.word	0488962aeh		; a[174] @ 5568
	.word	0474e9466h		; a[175] @ 5600
	.word	0490dedffh		; a[176] @ 5632
	.word	049678fb4h		; a[177] @ 5664
	.word	0492c6e8bh		; a[178] @ 5696
	.word	0496b8d3dh		; a[179] @ 5728
	.word	049584b5ch		; a[180] @ 5760
	.word	048fdfb29h		; a[181] @ 5792
	.word	0477d5cfdh		; a[182] @ 5824
	.word	048d81506h		; a[183] @ 5856
	.word	04890af8dh		; a[184] @ 5888
	.word	048a64596h		; a[185] @ 5920
	.word	047c603f8h		; a[186] @ 5952
	.word	049727d74h		; a[187] @ 5984
	.word	0494ed6edh		; a[188] @ 6016
	.word	0492e1b84h		; a[189] @ 6048
	.word	048022fbdh		; a[190] @ 6080
	.word	04930e498h		; a[191] @ 6112
	.word	0481a83d0h		; a[192] @ 6144
	.word	04902690ah		; a[193] @ 6176
	.word	047a8837bh		; a[194] @ 6208
	.word	0489aed95h		; a[195] @ 6240
	.word	048d9850dh		; a[196] @ 6272
	.word	0488ec95ah		; a[197] @ 6304
	.word	048e9b849h		; a[198] @ 6336
	.word	0478d102dh		; a[199] @ 6368
	.word	04901495eh		; a[200] @ 6400

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\007885 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\007887 
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
allequal:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STW     .D2T1   A11,*SP--(8)      ; |63| 
||         MVKL    .S2     0xa0b5ed8d,B6

           STDW    .D2T1   A13:A12,*SP--     ; |63| 
||         MVKL    .S1     output,A11
||         MVKL    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A10,*SP--(8)      ; |63| 
||         MVKH    .S1     output,A11
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MV      .L1     A4,A6             ; |63| 
||         MVKH    .S2     0x3eb0c6f7,B7
||         MVK     .S1     0x1,A8            ; |66| 

           MV      .L1X    B3,A13            ; |63| 
||         CALLP   .S2     isequal,B3
||         MV      .S1     A4,A10            ; |63| 
||         LDW     .D1T1   *A11,A4           ; |66| 

$C$RL0:    ; CALL OCCURS {isequal} {0}       ; |66| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKL    .S1     fcn_pass,A12
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S1     fcn_pass,A12
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A12(4)       ; |66| 
||         MV      .L1     A10,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL1:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A12(8)       ; |67| 
||         MV      .L1     A10,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL2:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           STW     .D1T1   A4,*+A12(12)      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A11,A3            ; |66| 
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         MV      .L1     A10,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL3:    ; CALL OCCURS {isequal} {0}       ; |69| 
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
||         MVKL    .S1     all_pass,A3

   [ A0]   B       .S2     $C$L2             ; |72| 
||         MVKH    .S1     all_pass,A3
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
           MVKL    .S1     all_pass,A3

           MVKH    .S1     all_pass,A3
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
;*   Local Frame Size  : 8 Args + 20 Auto + 56 Save = 84 byte                 *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |143| 
           STW     .D2T1   A10,*SP--(8)      ; |143| 
           STDW    .D2T2   B13:B12,*SP--     ; |143| 
           STDW    .D2T2   B11:B10,*SP--     ; |143| 
           STDW    .D2T1   A15:A14,*SP--     ; |143| 

           STDW    .D2T1   A13:A12,*SP--     ; |143| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(40)      ; |143| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL4:    ; CALL OCCURS {driver_init} {0}   ; |151| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     a,A10

           MVKH    .S1     a,A10

           CALL    .S1     acoshf            ; |160| 
||         MV      .L1     A10,A12
||         MV      .D1X    B4,A11
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |160| 
           ADDKPC  .S2     $C$RL5,B3,3       ; |160| 
$C$RL5:    ; CALL OCCURS {acoshf} {0}        ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     output,B4
||         SUB     .L1     A11,1,A0          ; |159| 
||         SUB     .S1     A11,1,A11         ; |159| 

           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |160| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |159| 

           ADD     .L2     B10,B4,B4         ; |160| 
||         ADD     .S2     4,B10,B10         ; |159| 

   [ A0]   CALL    .S1     acoshf            ; |160| 
||         STW     .D2T1   A4,*B4            ; |160| 
|| [!A0]   MVKL    .S2     output,B4

           ; BRANCHCC OCCURS {$C$L3}         ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           ZERO    .L2     B10
||         MVKH    .S2     output,B4

           ADD     .L2     4,B4,B11
||         MVK     .S2     0xc9,B4

           MV      .L1     A10,A15

           MV      .L1X    B4,A11
||         CALL    .S1     acoshsp           ; |163| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A10++,A4         ; |163| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |163| 
$C$RL6:    ; CALL OCCURS {acoshsp} {0}       ; |163| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |163| 
||         SUB     .L1     A11,1,A0          ; |162| 
||         SUB     .S1     A11,1,A11         ; |162| 

   [ A0]   BNOP    .S1     $C$L4,3           ; |162| 

           ADD     .L2     B10,B4,B4         ; |163| 
||         ADD     .S2     4,B10,B10         ; |162| 

   [ A0]   CALL    .S1     acoshsp           ; |163| 
||         STW     .D2T1   A4,*B4            ; |163| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L4}         ; |162| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A15,A11
||         ADD     .S2     4,B11,B11

           MV      .L1X    B4,A10
||         CALL    .S1     acoshsp_c         ; |166| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A11++,A4         ; |166| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |166| 
$C$RL7:    ; CALL OCCURS {acoshsp_c} {0}     ; |166| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |166| 
||         SUB     .L1     A10,1,A0          ; |165| 
||         SUB     .S1     A10,1,A10         ; |165| 

   [ A0]   BNOP    .S2     $C$L5,2           ; |165| 
|| [!A0]   ZERO    .L1     A13
|| [!A0]   ZERO    .D1     A9                ; |90| 
|| [!A0]   MVKL    .S1     0xfefa39ec,A10
|| [!A0]   ADD     .L2     4,B11,B12

   [!A0]   MVKL    .S1     0x3fe62e42,A11

           ADD     .L2     B10,B4,B4         ; |166| 
||         ADD     .S2     4,B10,B10         ; |165| 

   [ A0]   CALL    .S1     acoshsp_c         ; |166| 
||         STW     .D2T1   A4,*B4            ; |166| 

           ; BRANCHCC OCCURS {$C$L5}         ; |165| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           MVK     .S1     0xfffffc01,A26
||         MVK     .S2     0xc9,B1
||         MV      .L1     A15,A8
||         ZERO    .D1     A12               ; |90| 
||         LDW     .D2T2   *B12,B16

           MVKH    .S1     0xfefa39ec,A10
||         ZERO    .L1     A29
||         ZERO    .D1     A28

           MVKH    .S1     0x3fe62e42,A11
||         ZERO    .L1     A23
||         ZERO    .D1     A2

           MV      .L1     A9,A30            ; |123| 
||         SET     .S1     A13,0x14,0x1d,A13

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Disqualified loop: Did not find partition
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A8++,A16         ; |123| 
           NOP             4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 137
           MPYSP   .M1     A16,A16,A6        ; |123| 
           ZERO    .L1     A3
           SET     .S1     A3,0x17,0x1d,A3
           ZERO    .L1     A7
           SUBSP   .L1     A6,A3,A3          ; |123| 
           SET     .S1     A7,0x18,0x1d,A7
           ZERO    .L1     A17
           SET     .S1     A17,0x16,0x1d,A17
           SPDP    .S1     A3,A5:A4          ; |123| 
           MPYSP   .M1     A7,A3,A31         ; |123| 
           RSQRDP  .S1     A5:A4,A5:A4       ; |123| 
           MVKL    .S2     0x3e436581,B4
           DPSP    .L1     A5:A4,A4          ; |123| 
           CMPEQSP .S1     A3,A6,A1          ; |123| 
           CMPEQSP .S1     A3,A30,A0         ; |123| 
   [ A1]   MV      .S1     A16,A18           ; |123| 
           MPYSP   .M1     A4,A31,A7         ; |123| 
           MVKH    .S2     0x3e436581,B4
           MVKL    .S2     0xbe804d66,B5
           MVKL    .S2     0xbe6bd0fc,B6
           MPYSP   .M1     A4,A7,A7          ; |123| 
           MVKL    .S1     ti_math_logtable,A21
           MVKH    .S2     0xbe804d66,B5
           MVKH    .S1     ti_math_logtable,A21
           SUBSP   .L1     A17,A7,A7         ; |123| 
           MVKH    .S2     0xbe6bd0fc,B6
           MVKL    .S2     0x3eaaa872,B31
           MVKH    .S2     0x3eaaa872,B31
           MPYSP   .M1     A4,A7,A4          ; |123| 
           MVKL    .S1     0xbf000003,A24
           MVKH    .S1     0xbf000003,A24
           MVKL    .S2     0x3f317218,B30
           MPYSP   .M1     A4,A4,A7          ; |123| 
           MVKH    .S2     0x3f317218,B30
           SUB     .L2     B1,1,B1           ; |168| 
   [!B1]   ADD     .L1X    4,B12,A14
           MPYSP   .M1     A31,A7,A5         ; |123| 
           NOP             3
           SUBSP   .L1     A17,A5,A5         ; |123| 
           NOP             3
           MPYSP   .M1     A4,A5,A4          ; |123| 
           SET     .S1     A28,0x18,0x1d,A5
           NOP             2
   [!A1]   MPYSP   .M1     A3,A4,A18         ; |123| 
           SET     .S1     A29,0x18,0x1d,A4
   [ A0]   MV      .L1     A30,A3            ; |123| 
           MPYSP   .M1     A4,A16,A4         ; |123| 
   [!A0]   MV      .L1     A18,A3            ; |123| 
           MPYSP   .M1     A5,A3,A3          ; |123| 
           NOP             3
           ADDSP   .L1     A4,A3,A3          ; |123| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |90| 
           NOP             1
           RCPDP   .S1     A5:A4,A5:A4       ; |90| 
           NOP             1

           CLR     .S1     A5,0,16,A17       ; |90| 
||         MV      .L1     A9,A4             ; |90| 

           MV      .L1     A17,A5            ; |90| 
           MPYSPDP .M1     A3,A5:A4,A7:A6    ; |90| 
           EXTU    .S1     A17,1,21,A27      ; |90| 
           ADD     .L1     A26,A27,A4        ; |90| 
           INTDP   .L1     A4,A5:A4          ; |90| 
           EXTU    .S1     A17,12,29,A25     ; |90| 
           NOP             2
           SUBDP   .L1     A7:A6,A13:A12,A7:A6 ; |90| 
           MPYDP   .M1     A11:A10,A5:A4,A5:A4 ; |90| 
           NOP             5
           DPSP    .L1     A7:A6,A20         ; |90| 
           NOP             3
           MPYSP   .M1     A20,A20,A19       ; |90| 
           MPYSP   .M2X    B4,A20,B4         ; |90| 
           NOP             3

           ADDSP   .L2     B5,B4,B5          ; |90| 
||         MPYSP   .M2X    B6,A19,B4         ; |90| 

           MPYSP   .M1     A19,A20,A22       ; |90| 
           LDDW    .D1T1   *+A21[A25],A21:A20 ; |90| 
           MPYSP   .M1     A19,A19,A17       ; |90| 
           ADDSP   .L2     B4,B5,B5          ; |90| 
           NOP             1
           MPYSP   .M2X    B31,A22,B4        ; |90| 
           SUBDP   .L1     A21:A20,A5:A4,A5:A4 ; |90| 
           MPYSP   .M2X    A17,B5,B5         ; |90| 
           MPYSP   .M1     A24,A19,A17       ; |90| 
           NOP             2
           ADDSP   .L2     B5,B4,B4          ; |90| 
           NOP             1
           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |90| 
           NOP             1
           ADDSP   .L2X    B4,A17,B4         ; |90| 
           NOP             3
           SPDP    .S2     B4,B5:B4          ; |90| 
           NOP             1
           ADDDP   .L2X    B5:B4,A5:A4,B5:B4 ; |90| 
           NOP             6

           DPSP    .L2     B5:B4,B4          ; |90| 
||         MVKL    .S2     0x7f7fffff,B5

           MVKH    .S2     0x7f7fffff,B5
           CMPGTSP .S2X    A3,B5,B0          ; |90| 
   [ B0]   MVKL    .S2     0x40562e42,B5
   [!B0]   SPDP    .S2     B4,B5:B4          ; |90| 
           SET     .S1     A23,0x17,0x1d,A3
   [ B0]   MVKL    .S2     0xfeba1ace,B4
   [ B0]   MVKH    .S2     0xfeba1ace,B4
   [ B0]   MVKH    .S2     0x40562e42,B5
           DPSP    .L2     B5:B4,B4          ; |90| 
           CMPLTSP .S1     A16,A3,A0         ; |90| 
           SET     .S1     A2,0x0,0x1e,A3
   [ B1]   B       .S1     $C$L6             ; |168| 
   [!A0]   ADDSP   .L2     B30,B4,B4         ; |90| 
   [ A0]   MV      .L2X    A3,B4             ; |90| 
           NOP             2

   [!B1]   CALL    .S1     acoshsp_v         ; |171| 
||         STW     .D2T2   B4,*B16++         ; |90| 

           ; BRANCHCC OCCURS {$C$L6}         ; |168| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T2   *A14,B4           ; |171| 
           MV      .L1     A15,A4            ; |171| 
           MVK     .S1     0xc9,A6           ; |171| 
           ADDKPC  .S2     $C$RL8,B3,1       ; |171| 
$C$RL8:    ; CALL OCCURS {acoshsp_v} {0}     ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     allequal,B3
||         MVK     .S1     0xc9,A4           ; |174| 

$C$RL9:    ; CALL OCCURS {allequal} {0}      ; |174| 

           CALLP   .S2     print_test_results,B3
||         MVK     .L1     0x1,A4            ; |175| 

$C$RL10:   ; CALL OCCURS {print_test_results} {0}  ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13

           MVKL    .S2     a_sc,B4
||         MVK     .L2     0x8,B31

           ZERO    .L2     B8
||         MV      .S2X    A12,B6            ; |189| 
||         MVK     .D2     -1,B9             ; |189| 

           MVKH    .S2     a_sc,B4
||         MVKL    .S1     0x7f7fffff,A3
||         ZERO    .L2     B11
||         STW     .D2T1   A13,*+SP(20)      ; |90| 

           MV      .L2     B4,B5             ; |183| 
||         MVKH    .S1     0x7f7fffff,A3
||         SET     .S2     B8,0x0,0x1e,B8
||         STW     .D2T2   B31,*+SP(12)      ; |185| 

           ZERO    .L2     B10
||         ADD     .L1     1,A3,A4
||         MV      .S1X    B6,A3
||         MVKH    .S2     0xbf800000,B11
||         STDW    .D2T2   B9:B8,*+B5(24)    ; |189| 

           SET     .S2     B10,0x17,0x1d,B10
||         MV      .L1     A12,A15           ; |189| 
||         MV      .S1X    B4,A12            ; |183| 
||         MV      .L2     B5,B4
||         STW     .D2T1   A3,*+SP(16)       ; |185| 

           ZERO    .L1     A5
||         ADD     .L2     1,B8,B7
||         STDW    .D2T2   B11:B10,*+B4(16)  ; |187| 

           MVKH    .S1     0xff800000,A5
||         STDW    .D2T2   B7:B6,*B4         ; |183| 

           STDW    .D2T1   A5:A4,*+B4(8)     ; |185| 
||         CALL    .S1     acoshf            ; |192| 

           LDW     .D1T1   *A12,A4           ; |192| 
           MV      .L2     B6,B10
           NOP             2
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
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL11,B3,0      ; |192| 
$C$RL11:   ; CALL OCCURS {acoshf} {0}        ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 28
           MVKL    .S2     output,B13
           MVKH    .S2     output,B13
           LDW     .D2T2   *B13,B4           ; |192| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |192| 
           STW     .D2T1   A4,*B4            ; |192| 

           CALLP   .S2     acoshsp,B3
||         LDW     .D1T1   *A12,A4           ; |193| 

$C$RL12:   ; CALL OCCURS {acoshsp} {0}       ; |193| 
           LDW     .D2T2   *+B13(4),B4       ; |193| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |193| 
           STW     .D2T1   A4,*B4            ; |193| 

           CALLP   .S2     acoshsp_c,B3
||         LDW     .D1T1   *A12,A4           ; |194| 

$C$RL13:   ; CALL OCCURS {acoshsp_c} {0}     ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 148
           LDW     .D2T2   *+B13(8),B4       ; |194| 
           ZERO    .L1     A3
           SET     .S1     A3,0x17,0x1d,A3
           ZERO    .L1     A31
           ZERO    .L1     A30
           ADD     .L2     B10,B4,B4         ; |194| 
           STW     .D2T1   A4,*B4            ; |194| 
           LDW     .D1T1   *A12++,A6         ; |195| 
           ZERO    .L1     A29
           MV      .L1     A15,A28           ; |123| 
           ZERO    .L1     A27
           MVK     .S1     0xfffffc01,A24
           MPYSP   .M1     A6,A6,A8          ; |159| 
           MVKL    .S2     0x3e436581,B31
           MVKH    .S2     0x3e436581,B31
           MVKL    .S2     0xbe6bd0fc,B6
           SUBSP   .L1     A8,A3,A5          ; |159| 
           SET     .S1     A31,0x18,0x1d,A3
           MVKL    .S1     ti_math_logtable,A22
           MVKL    .S2     0xbe804d66,B30
           SPDP    .S1     A5,A17:A16        ; |123| 
           MPYSP   .M1     A3,A5,A7          ; |123| 
           RSQRDP  .S1     A17:A16,A17:A16   ; |123| 
           MVKH    .S2     0xbe6bd0fc,B6
           DPSP    .L1     A17:A16,A4        ; |123| 
           CMPEQSP .S1     A5,A8,A1          ; |125| 
           CMPEQSP .S1     A5,A28,A0         ; |129| 
           MVKH    .S1     ti_math_logtable,A22
           MPYSP   .M1     A4,A7,A3          ; |123| 
           MVKH    .S2     0xbe804d66,B30
           MVKL    .S2     0x3eaaa872,B29
           MVKH    .S2     0x3eaaa872,B29
           MPYSP   .M1     A4,A3,A9          ; |123| 
           SET     .S1     A30,0x16,0x1d,A3
           MVKL    .S1     0xbf000003,A21
           MVKH    .S1     0xbf000003,A21
           SUBSP   .L1     A3,A9,A3          ; |123| 
           ZERO    .L1     A20
           ZERO    .L1     A2
           MVKL    .S2     0x7f7fffff,B28
           MPYSP   .M1     A4,A3,A4          ; |123| 
           MVKH    .S2     0x7f7fffff,B28
           MVKL    .S2     0x3f317218,B27
           MVKH    .S2     0x3f317218,B27
           MPYSP   .M1     A4,A4,A3          ; |123| 
           NOP             3
           MPYSP   .M1     A7,A3,A7          ; |123| 
           SET     .S1     A29,0x16,0x1d,A3
           NOP             2
           SUBSP   .L1     A3,A7,A3          ; |123| 
           NOP             3
           MPYSP   .M1     A4,A3,A3          ; |123| 
           SET     .S1     A27,0x18,0x1d,A4
           MPYSP   .M1     A4,A6,A26         ; |90| 
           NOP             1
           MPYSP   .M1     A5,A3,A3          ; |123| 
           NOP             3
   [ A1]   MV      .L1     A6,A3             ; |126| 
   [ A0]   MV      .L1     A15,A3            ; |126| 
           MPYSP   .M1     A4,A3,A3          ; |90| 
           NOP             3
           ADDSP   .L1     A26,A3,A18        ; |90| 
           NOP             3
           SPDP    .S1     A18,A5:A4         ; |90| 
           CMPGTSP .S2X    A18,B28,B0        ; |92| 
           RCPDP   .S1     A5:A4,A5:A4       ; |90| 
           NOP             1

           CLR     .S1     A5,0,16,A7        ; |90| 
||         MV      .L1     A15,A4            ; |90| 

           MV      .L1     A7,A5             ; |90| 
           MPYSPDP .M1     A18,A5:A4,A9:A8   ; |90| 
           EXTU    .S1     A7,1,21,A25       ; |90| 
           ADD     .L1     A24,A25,A3        ; |90| 
           INTDP   .L1     A3,A17:A16        ; |90| 
           MV      .L1     A15,A4            ; |90| 
           MV      .L1     A13,A5            ; |90| 
           EXTU    .S1     A7,12,29,A23      ; |90| 
           SUBDP   .L1     A9:A8,A5:A4,A9:A8 ; |90| 
           MPYDP   .M1     A11:A10,A17:A16,A5:A4 ; |90| 
           NOP             5
           DPSP    .L1     A9:A8,A16         ; |90| 
           NOP             3
           MPYSP   .M1     A16,A16,A3        ; |90| 
           MPYSP   .M2X    B31,A16,B5        ; |90| 
           NOP             3

           ADDSP   .L2     B30,B5,B4         ; |90| 
||         MPYSP   .M2X    B6,A3,B5          ; |90| 

           MPYSP   .M1     A3,A16,A19        ; |90| 
           LDDW    .D1T1   *+A22[A23],A17:A16 ; |90| 
           MPYSP   .M1     A3,A3,A7          ; |90| 
           ADDSP   .L2     B5,B4,B5          ; |90| 
           MPYSP   .M1     A21,A3,A3         ; |90| 
           MPYSP   .M2X    B29,A19,B4        ; |90| 
           SUBDP   .L1     A17:A16,A5:A4,A5:A4 ; |90| 
           MPYSP   .M2X    A7,B5,B5          ; |90| 
           LDW     .D2T2   *+SP(12),B6       ; |164| 
           NOP             2
           ADDSP   .L2     B5,B4,B4          ; |90| 
           NOP             1
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |90| 
           NOP             1
           ADDSP   .L2X    B4,A3,B4          ; |90| 
           MVKL    .S1     0x42b17218,A3
           MVKH    .S1     0x42b17218,A3
           NOP             1
           SPDP    .S2     B4,B5:B4          ; |90| 
           NOP             1
           ADDDP   .L2X    B5:B4,A5:A4,B5:B4 ; |90| 
           NOP             6
           DPSP    .L2     B5:B4,B4          ; |90| 
           NOP             3

   [ B0]   MV      .L2X    A3,B4             ; |93| 
||         SET     .S1     A20,0x17,0x1d,A3

           ADDSP   .L2     B27,B4,B4         ; |161| 
||         LDW     .D2T2   *B12,B27          ; |195| 

           CMPLTSP .S1     A6,A3,A0          ; |163| 
           SET     .S1     A2,0x0,0x1e,A3
           NOP             1

   [ A0]   MV      .L2X    A3,B4             ; |164| 
||         SUB     .L1X    B6,1,A0           ; |191| 

   [ A0]   B       .S1     $C$L7             ; |191| 
||         ADD     .L2     B10,B27,B5        ; |195| 

   [ A0]   CALL    .S1     acoshf            ; |192| 
||         STW     .D2T2   B4,*B5            ; |195| 
||         SUB     .L2     B6,1,B4           ; |191| 

   [!A0]   CALL    .S1     acoshsp_v         ; |197| 
|| [ A0]   LDW     .D1T1   *A12,A4           ; |192| 
||         STW     .D2T2   B4,*+SP(12)       ; |195| 

   [!A0]   LDW     .D2T2   *+B13(16),B4      ; |197| 
   [!A0]   MVKL    .S1     a_sc,A4
           ADD     .L2     4,B10,B10         ; |191| 
           ; BRANCHCC OCCURS {$C$L7}         ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MVKH    .S1     a_sc,A4

           MVK     .L1     0x8,A6            ; |197| 
||         ADDKPC  .S2     $C$RL14,B3,0      ; |197| 

$C$RL14:   ; CALL OCCURS {acoshsp_v} {0}     ; |197| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 40
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B13,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MVK     .L1     0x8,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL15:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0x3eb0c6f7,B7

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D1T1   A4,*+A3(4)        ; |66| 
||         LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .L1     0x8,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B13,A5            ; |197| 
||         STW     .D1T1   A4,*+A3(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A5,A4            ; |68| 
||         LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVK     .L1     0x8,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0x3eb0c6f7,B7
||         STW     .D2T1   A14,*+SP(20)      ; |68| 

           MV      .L1X    B13,A5            ; |197| 
||         MV      .L2X    A14,B4            ; |66| 
||         STW     .D1T1   A4,*+A3(12)       ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A5,A4            ; |69| 
||         LDW     .D2T2   *B4,B4            ; |69| 
||         MVK     .L1     0x8,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL18:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S2     fcn_pass,B4
||         MVKL    .S1     fcn_pass,A3

           MVKH    .S2     fcn_pass,B4
           ADD     .L2     4,B4,B4
           LDW     .D2T2   *B4,B0            ; |72| 
           MVKH    .S1     fcn_pass,A3
           STW     .D1T1   A4,*+A3(16)       ; |69| 
           STW     .D2T2   B4,*+SP(24)
           ADD     .L2X    8,A3,B4

   [!B0]   B       .S2     $C$L8             ; |72| 
|| [!B0]   MVKL    .S1     all_pass,A3
|| [!B0]   MV      .L1     A15,A4
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     print_test_results ; |201| 
|| [!B0]   MVKH    .S1     all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

           STW     .D2T2   B11,*+SP(12)      ; |69| 
           STW     .D2T2   B4,*+SP(28)       ; |69| 
   [ B1]   ADD     .L2     4,B4,B4
           NOP             1
           ; BRANCHCC OCCURS {$C$L8}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [!B0]   MV      .L1     A15,A0            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   MV      .L1     A15,A4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |201| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |201| 
||         ADDKPC  .S2     $C$RL19,B3,0      ; |201| 

$C$RL19:   ; CALL OCCURS {print_test_results} {0}  ; |201| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S2     a_ext,B4
           MVK     .S2     0x77,B31

           MVKH    .S2     a_ext,B4
||         ZERO    .L1     A3

           STW     .D2T2   B31,*+SP(16)      ; |204| 
||         SET     .S1     A3,0x17,0x1d,A3

           CALL    .S1     acoshf            ; |206| 
||         STW     .D2T1   A3,*B4            ; |204| 
||         MV      .L1X    B4,A15            ; |204| 

           LDW     .D1T1   *A15,A4           ; |206| 
||         MVKL    .S2     0xcccccccd,B10

           MVKL    .S2     0x4000cccc,B11
           MVKH    .S2     0xcccccccd,B10

           MVKH    .S2     0x4000cccc,B11
||         ZERO    .L1     A12               ; |90| 
||         ZERO    .L2     B13               ; |90| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL20,B3,0      ; |206| 
$C$RL20:   ; CALL OCCURS {acoshf} {0}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |206| 
           NOP             4
           ADD     .L2     B13,B4,B4         ; |206| 
           STW     .D2T1   A4,*B4            ; |206| 

           CALLP   .S2     acoshsp,B3
||         LDW     .D1T1   *A15,A4           ; |207| 

$C$RL21:   ; CALL OCCURS {acoshsp} {0}       ; |207| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |207| 
           NOP             4
           ADD     .L2     B13,B4,B4         ; |207| 
           STW     .D2T1   A4,*B4            ; |207| 

           CALLP   .S2     acoshsp_c,B3
||         LDW     .D1T1   *A15,A4           ; |208| 

$C$RL22:   ; CALL OCCURS {acoshsp_c} {0}     ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 169
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |208| 
           ZERO    .L1     A3
           SET     .S1     A3,0x17,0x1d,A3
           ZERO    .L1     A31
           ZERO    .L1     A29
           ADD     .L2     B13,B4,B4         ; |208| 
           STW     .D2T1   A4,*B4            ; |208| 
           LDW     .D1T1   *A15,A6           ; |209| 
           ZERO    .L1     A28
           MV      .L1     A12,A27           ; |123| 
           ZERO    .L1     A26
           MVK     .S1     0xfffffc01,A25
           MPYSP   .M1     A6,A6,A8          ; |159| 
           MVKL    .S2     0x3e436581,B31
           MVKL    .S1     ti_math_logtable,A24
           MVKH    .S2     0x3e436581,B31
           SUBSP   .L1     A8,A3,A7          ; |159| 
           SET     .S1     A31,0x18,0x1d,A3
           MVKH    .S1     ti_math_logtable,A24
           MVKL    .S2     0xbe6bd0fc,B5
           SPDP    .S1     A7,A5:A4          ; |123| 
           MPYSP   .M1     A3,A7,A30         ; |123| 
           RSQRDP  .S1     A5:A4,A5:A4       ; |123| 
           MVKL    .S2     0xbe804d66,B30
           DPSP    .L1     A5:A4,A4          ; |123| 
           CMPEQSP .S1     A7,A8,A1          ; |125| 
           CMPEQSP .S1     A7,A27,A0         ; |129| 
           MVKH    .S2     0xbe6bd0fc,B5
           MPYSP   .M1     A4,A30,A3         ; |123| 
           MVKH    .S2     0xbe804d66,B30
           MVKL    .S2     0x3eaaa872,B29
           MVKH    .S2     0x3eaaa872,B29
           MPYSP   .M1     A4,A3,A9          ; |123| 
           SET     .S1     A29,0x16,0x1d,A3
           MVKL    .S1     0xbf000003,A23
           MVKH    .S1     0xbf000003,A23
           SUBSP   .L1     A3,A9,A3          ; |123| 
           LDW     .D2T2   *B12,B27          ; |209| 
           ZERO    .L1     A22
           ZERO    .S1     A21
           MPYSP   .M1     A4,A3,A4          ; |123| 
           MVKL    .S2     0x7f7fffff,B28
           MVKH    .S2     0x7f7fffff,B28
           MVKL    .S2     0x3f317218,B26
           MPYSP   .M1     A4,A4,A3          ; |123| 
           MVKH    .S2     0x3f317218,B26
           ADD     .L2     B13,B27,B25       ; |209| 
           ADD     .L2     4,B13,B13         ; |205| 
           MPYSP   .M1     A30,A3,A5         ; |123| 
           SET     .S1     A28,0x16,0x1d,A3
           NOP             2
           SUBSP   .L1     A3,A5,A3          ; |123| 
           NOP             3
           MPYSP   .M1     A4,A3,A3          ; |123| 
           NOP             3
           MPYSP   .M1     A7,A3,A4          ; |123| 
           SET     .S1     A26,0x18,0x1d,A3
           MPYSP   .M1     A3,A6,A5          ; |90| 
           NOP             1
   [ A1]   MV      .L1     A6,A4             ; |126| 
   [ A0]   MV      .L1     A12,A4            ; |126| 
           MPYSP   .M1     A3,A4,A3          ; |90| 
           NOP             3
           ADDSP   .L1     A5,A3,A4          ; |90| 
           NOP             3
           SPDP    .S1     A4,A9:A8          ; |90| 
           CMPGTSP .S2X    A4,B28,B0         ; |92| 
           RCPDP   .S1     A9:A8,A9:A8       ; |90| 
           NOP             1

           CLR     .S1     A9,0,16,A5        ; |90| 
||         MV      .L1     A12,A8            ; |90| 

           MV      .L1     A5,A9             ; |90| 
           MPYSPDP .M1     A4,A9:A8,A9:A8    ; |90| 
           EXTU    .S1     A5,1,21,A7        ; |90| 
           ADD     .L1     A25,A7,A3         ; |90| 
           INTDP   .L1     A3,A17:A16        ; |90| 
           EXTU    .S1     A5,12,29,A5       ; |90| 
           NOP             2
           SUBDP   .L1     A9:A8,A13:A12,A9:A8 ; |90| 
           MPYDP   .M1     A11:A10,A17:A16,A17:A16 ; |90| 
           NOP             5
           DPSP    .L1     A9:A8,A18         ; |90| 
           NOP             3
           MPYSP   .M1     A18,A18,A7        ; |90| 
           MPYSP   .M2X    B31,A18,B6        ; |90| 
           NOP             3

           ADDSP   .L2     B30,B6,B4         ; |90| 
||         MPYSP   .M2X    B5,A7,B5          ; |90| 

           MPYSP   .M1     A7,A18,A5         ; |90| 
||         LDDW    .D1T1   *+A24[A5],A19:A18 ; |90| 

           MPYSP   .M1     A7,A7,A3          ; |90| 
           NOP             1
           ADDSP   .L2     B5,B4,B5          ; |90| 
           NOP             1
           MPYSP   .M2X    B29,A5,B4         ; |90| 
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |90| 
           MPYSP   .M2X    A3,B5,B5          ; |90| 
           MPYSP   .M1     A23,A7,A3         ; |90| 
           NOP             2
           ADDSP   .L2     B5,B4,B4          ; |90| 
           NOP             1
           ADDDP   .L1     A17:A16,A9:A8,A9:A8 ; |90| 
           NOP             1
           ADDSP   .L2X    B4,A3,B4          ; |90| 
           MVKL    .S1     0x42b17218,A3
           MVKH    .S1     0x42b17218,A3
           NOP             1
           SPDP    .S2     B4,B5:B4          ; |90| 
           NOP             1
           ADDDP   .L2X    B5:B4,A9:A8,B5:B4 ; |90| 
           NOP             6
           DPSP    .L2     B5:B4,B5          ; |90| 
           NOP             3

   [ B0]   MV      .L2X    A3,B5             ; |93| 
||         SET     .S1     A22,0x17,0x1d,A3

           ADDSP   .L2     B26,B5,B4         ; |161| 
           CMPLTSP .S1     A6,A3,A0          ; |163| 
           SET     .S1     A21,0x0,0x1e,A3
           NOP             1
   [ A0]   MV      .L2X    A3,B4             ; |164| 
           STW     .D2T2   B4,*B25           ; |209| 
           LDW     .D1T2   *A15,B4           ; |210| 
           NOP             4
           MPYSPDP .M2     B4,B11:B10,B5:B4  ; |210| 
           NOP             6

           DPSP    .L2     B5:B4,B5          ; |210| 
||         LDW     .D2T2   *+SP(16),B4

           NOP             3
           STW     .D1T2   B5,*++A15         ; |210| 

           SUB     .L1X    B4,1,A0           ; |205| 
||         SUB     .L2     B4,1,B4           ; |205| 

   [ A0]   B       .S1     $C$L9             ; |205| 
|| [!A0]   MVKL    .S2     output,B10
|| [ A0]   LDW     .D1T1   *A15,A4           ; |206| 
||         STW     .D2T2   B4,*+SP(16)       ; |210| 

   [ A0]   CALL    .S1     acoshf            ; |206| 
|| [!A0]   MVKH    .S2     output,B10

   [!A0]   CALL    .S1     acoshsp_v         ; |212| 
   [!A0]   LDW     .D2T2   *+B10(16),B4      ; |212| 
   [!A0]   MVKL    .S1     a_ext,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L9}         ; |205| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MVKH    .S1     a_ext,A4

           MVK     .S1     0x77,A6           ; |212| 
||         ADDKPC  .S2     $C$RL23,B3,0      ; |212| 

$C$RL23:   ; CALL OCCURS {acoshsp_v} {0}     ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 42
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0x77,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL24:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B12
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     fcn_pass,B12
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B12(4)       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0x77,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D2T1   A4,*+B12(8)       ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0x77,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L2     B10,B4            ; |68| 
||         STW     .D2T1   A4,*+B12(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A14,B4           ; |69| 
||         MVK     .S1     0x77,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL27:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(24),A3       ; |69| 
           LDW     .D2T2   *+SP(28),B4
           STW     .D2T1   A4,*+B12(16)      ; |69| 
           NOP             2
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [ A0]   ADD     .L2     4,B4,B4
|| [!A0]   B       .S1     $C$L10            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |218| 
   [!A0]   MVKL    .S1     all_pass,A3
   [!A0]   MVKH    .S1     all_pass,A3
   [!A0]   MV      .L2X    A12,B4
   [!A0]   MV      .L2X    A3,B5
           ; BRANCHCC OCCURS {$C$L10}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   MV      .L1     A12,A0            ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1

   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
||         MVK     .L2     0x1,B4            ; |72| 

   [!A0]   MV      .L2X    A12,B4
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |218| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             1
           MV      .L2X    A3,B5
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x4,A4            ; |218| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL28,B3,0      ; |218| 

$C$RL28:   ; CALL OCCURS {print_test_results} {0}  ; |218| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S1     cycle_counts+24,A3

           MVKH    .S1     cycle_counts+24,A3
||         MV      .L2X    A12,B4            ; |114| 
||         MV      .L1     A12,A10           ; |114| 
||         MV      .D1     A12,A11           ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A3       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     t_start,A3

           MVKH    .S1     t_start,A3
||         MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 
||         MVKL    .S1     t_offset,A3

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     t_offset,A3

           MVK     .S2     0x80,B4
||         STDW    .D1T2   B5:B4,*A3         ; |117| 

           CALL    .S2     gimme_random      ; |228| 
||         MVKL    .S1     0x49742410,A13

           LDW     .D2T2   *+SP(12),B4       ; |228| 
||         MV      .L1X    B4,A12            ; |117| 
||         MVKH    .S1     0x49742410,A13
||         MV      .L2X    A12,B10

           MV      .L1     A13,A4            ; |228| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL29,B3,2      ; |228| 
$C$RL29:   ; CALL OCCURS {gimme_random} {0}  ; |228| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 156
           MVKL    .S2     input,B4
           MVKH    .S2     input,B4
           LDW     .D2T2   *B4,B4            ; |228| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |228| 

           STW     .D2T1   A4,*B4            ; |228| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 
           MPYSP   .M1     A4,A4,A8          ; |159| 
           ZERO    .L1     A3
           SET     .S1     A3,0x17,0x1d,A3
           ZERO    .L1     A31
           SUBSP   .L1     A8,A3,A5          ; |159| 
           SET     .S1     A31,0x18,0x1d,A3
           ZERO    .L1     A29
           ZERO    .S1     A28
           SPDP    .S1     A5,A7:A6          ; |120| 
           MPYSP   .M1     A3,A5,A30         ; |120| 
           RSQRDP  .S1     A7:A6,A7:A6       ; |120| 
           MV      .L1     A10,A27           ; |123| 
           DPSP    .L1     A7:A6,A6          ; |120| 
           ZERO    .L1     A26
           ZERO    .L1     A25
           CMPEQSP .S1     A5,A8,A0          ; |125| 
           MPYSP   .M1     A6,A30,A3         ; |120| 
           CMPEQSP .S1     A5,A27,A1         ; |129| 
           MVKL    .S2     0x3e436581,B31
           MV      .L2X    A11,B4            ; |90| 
           MPYSP   .M1     A6,A3,A9          ; |120| 
           SET     .S1     A29,0x16,0x1d,A3
           ZERO    .L2     B5
           MV      .L2X    A4,B22            ; |232| 
           SUBSP   .L1     A3,A9,A3          ; |120| 
           MV      .L1     A10,A2            ; |90| 
           SET     .S2     B5,0x14,0x1d,B5
           MVKH    .S2     0x3e436581,B31
           MPYSP   .M1     A6,A3,A6          ; |120| 
           MVKL    .S2     0xbe804d66,B30
           MVK     .S1     0xfffffc01,A23
           MVKL    .S2     0xbe6bd0fc,B29
           MPYSP   .M1     A6,A6,A3          ; |123| 
           MVKL    .S1     ti_math_logtable,A21
           MVKL    .S1     0xfefa39ec,A8
           MVKH    .S1     0xfefa39ec,A8
           MPYSP   .M1     A30,A3,A7         ; |123| 
           SET     .S1     A28,0x16,0x1d,A3
           MVKL    .S1     0x3fe62e42,A9
           MVKH    .S1     0x3fe62e42,A9
           SUBSP   .L1     A3,A7,A3          ; |123| 
           MVKH    .S1     ti_math_logtable,A21
           MVKH    .S2     0xbe804d66,B30
           MVKH    .S2     0xbe6bd0fc,B29
           MPYSP   .M1     A6,A3,A3          ; |123| 
           SET     .S1     A26,0x18,0x1d,A6
           MPYSP   .M1     A6,A4,A6          ; |90| 
           MVKL    .S2     0x3eaaa872,B27
           MPYSP   .M1     A5,A3,A3          ; |123| 
           SET     .S1     A25,0x18,0x1d,A5
           MVKH    .S2     0x3eaaa872,B27
           MVKL    .S1     0xbf000003,A20
   [ A0]   MV      .L1     A4,A3             ; |232| 
   [ A1]   MV      .L1     A10,A3            ; |232| 
           MPYSP   .M1     A5,A3,A3          ; |90| 
           MVKH    .S1     0xbf000003,A20
           MVKL    .S2     0x7f7fffff,B24
           MVKH    .S2     0x7f7fffff,B24
           ADDSP   .L1     A6,A3,A5          ; |90| 
           ZERO    .L1     A18
           MVKL    .S2     output+12,B26
           MVKL    .S2     0x42b17218,B25
           SPDP    .S1     A5,A7:A6          ; |90| 
           MVKH    .S2     output+12,B26
           RCPDP   .S1     A7:A6,A7:A6       ; |90| 
           ZERO    .L1     A19
           CLR     .S1     A7,0,16,A3        ; |90| 
           MPYSPDP .M1     A5,A3:A2,A7:A6    ; |90| 
           EXTU    .S1     A3,1,21,A24       ; |90| 
           EXTU    .S1     A3,12,29,A22      ; |90| 
           MVKH    .S2     0x42b17218,B25
           MVKL    .S2     0x3f317218,B23
           MVKH    .S2     0x3f317218,B23
           CMPGTSP .S2X    A5,B24,B0         ; |92| 
           NOP             1
           SUBDP   .L2X    A7:A6,B5:B4,B9:B8 ; |90| 
           ADD     .L1     A23,A24,A6        ; |90| 
           INTDP   .L1     A6,A7:A6          ; |90| 
           NOP             4

           DPSP    .L2     B9:B8,B17         ; |90| 
||         MPYDP   .M1     A9:A8,A7:A6,A7:A6 ; |90| 

           LDDW    .D1T1   *+A21[A22],A9:A8  ; |90| 
           NOP             2
           MPYSP   .M2     B31,B17,B18       ; |90| 
           MPYSP   .M2     B17,B17,B16       ; |90| 
           NOP             2
           ADDSP   .L2     B30,B18,B4        ; |90| 
           MPYSP   .M2     B29,B16,B18       ; |90| 
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |90| 
           MPYSP   .M2     B16,B17,B5        ; |90| 
           MPYSP   .M2     B16,B16,B28       ; |90| 
           ADDSP   .L2     B18,B4,B17        ; |90| 
           MPYSP   .M1X    A20,B16,A3        ; |90| 
           MPYSP   .M2     B27,B5,B4         ; |90| 
           NOP             1
           MPYSP   .M2     B28,B17,B5        ; |90| 
           NOP             3

           ADDDP   .L2X    A7:A6,B9:B8,B5:B4 ; |90| 
||         ADDSP   .S2     B5,B4,B16         ; |90| 

           NOP             3
           ADDSP   .L2X    B16,A3,B8         ; |90| 
           SET     .S1     A19,0x17,0x1d,A3
           MVKL    .S1     t_start,A19
           MVKH    .S1     t_start,A19
           SPDP    .S2     B8,B9:B8          ; |90| 
           STDW    .D1T2   B7:B6,*A19
           ADDDP   .L2     B9:B8,B5:B4,B5:B4 ; |90| 
           LDW     .D2T2   *B26,B8           ; |232| 
           NOP             5
           DPSP    .L2     B5:B4,B4          ; |90| 
           ADD     .L2     B10,B8,B21        ; |232| 
           NOP             2
   [ B0]   MV      .L2     B25,B4            ; |93| 
           ADDSP   .L2     B23,B4,B5         ; |161| 
           CMPLTSP .S2X    B22,A3,B0         ; |163| 
           SET     .S1     A18,0x0,0x1e,A3
           NOP             1
   [ B0]   MV      .L2X    A3,B5             ; |164| 

           STW     .D2T2   B5,*B21           ; |232| 
||         MVC     .S2     TSCL,B18          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     t_offset,A15
||         SUB     .L1     A12,1,A0          ; |226| 
||         MV      .L2     B4,B19            ; |128| 
||         MVKL    .S2     t_stop,B16
||         ADD     .D2     4,B10,B10         ; |226| 
||         SUB     .D1     A12,1,A12         ; |226| 

           MVKH    .S1     t_offset,A15
||         MVKH    .S2     t_stop,B16

           STDW    .D2T2   B19:B18,*B16      ; |128| 
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 

           MVKL    .S1     cycle_counts+24,A3
           MVKH    .S1     cycle_counts+24,A3
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           MV      .L1     A3,A14            ; |128| 

           ADDU    .L2X    A4,B6,B9:B8       ; |130| 
|| [ A0]   MV      .L1     A13,A4            ; |228| 

           ADD     .S2X    B9,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L11            ; |226| 
||         SUBU    .L2     B18,B8,B5:B4      ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B5       ; |130| 

           ADDU    .L2X    A6,B4,B7:B6       ; |130| 
||         SUB     .S2     B19,B6,B4         ; |130| 

   [ A0]   CALL    .S1     gimme_random      ; |228| 
||         ADD     .L2     B4,B5,B5          ; |130| 
||         ADD     .S2X    B7,A7,B4          ; |130| 

           ADD     .L2     B4,B5,B7          ; |130| 
|| [ A0]   LDW     .D2T2   *+SP(12),B4       ; |228| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T2   B7:B6,*A14        ; |130| 

           ; BRANCHCC OCCURS {$C$L11}        ; |226| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL30,B3,3      ; |135| 
$C$RL30:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
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
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL31:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           MV      .L2X    A14,B4

           MV      .L2X    A11,B31           ; |114| 
||         MVK     .S2     24,B5

           SUB     .L2X    A14,B5,B5
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           MVC     .S2     B31,TSCL          ; |115| 
||         STDW    .D2T1   A11:A10,*B5       ; |114| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B6,B5,B9:B8       ; |117| 

           SUB     .L2     B7,B4,B5          ; |117| 
||         EXT     .S2     B9,24,24,B6       ; |117| 

           MV      .L2     B8,B4             ; |117| 
||         ADD     .S2     B5,B6,B5          ; |117| 
||         MVK     .S1     0x80,A3

           STDW    .D1T2   B5:B4,*A15        ; |117| 
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
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B6           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |241| 
           MV      .L2     B5,B7             ; |122| 
           MVKL    .S2     t_start,B4
           MVKH    .S2     t_start,B4
           STDW    .D2T2   B7:B6,*B4         ; |122| 

           ADD     .L1     A12,A3,A3         ; |241| 
||         CALL    .S1     acoshf            ; |241| 

           LDW     .D1T1   *A3,A4            ; |241| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |241| 
$C$RL32:   ; CALL OCCURS {acoshf} {0}        ; |241| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output,B10
           MVKH    .S2     output,B10
           LDW     .D2T2   *B10,B4           ; |241| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |241| 

           STW     .D1T1   A4,*A3            ; |241| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_start,B5
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         MVKL    .S1     cycle_counts,A3
||         SUB     .L1     A14,1,A0          ; |239| 
||         MV      .L2     B4,B17            ; |128| 

           MVKH    .S2     t_start,B5
||         MVKH    .S1     cycle_counts,A3
||         SUB     .L1     A14,1,A14         ; |239| 
||         ADD     .D1     4,A12,A12         ; |239| 

           LDDW    .D2T2   *B5,B9:B8         ; |130| 
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S2     cycle_counts,B4
||         MVKL    .S1     t_stop,A31

           MVKH    .S1     t_stop,A31
           MVKH    .S2     cycle_counts,B4
           STDW    .D1T2   B17:B16,*A31      ; |128| 
   [!A0]   MV      .L1X    B4,A14
           ADDU    .L2X    A4,B8,B7:B6       ; |130| 

           ADD     .S2X    B7,A5,B5          ; |130| 
|| [ A0]   B       .S1     $C$L12            ; |239| 
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

           ; BRANCHCC OCCURS {$C$L12}        ; |239| 
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

           STDW    .D1T1   A11:A10,*+A14(16) ; |114| 
||         MV      .L2X    A11,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A14        ; |135| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B9           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B9,B4,B4          ; |117| 
||         MVK     .S1     0x80,A3

           ADD     .L2     B4,B5,B7          ; |117| 
||         MV      .S2X    A15,B8            ; |117| 

           STDW    .D2T2   B7:B6,*B8         ; |117| 
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
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |250| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |250| 
||         CALL    .S1     acoshsp_c         ; |250| 

           LDW     .D1T1   *A3,A4            ; |250| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |250| 
$C$RL35:   ; CALL OCCURS {acoshsp_c} {0}     ; |250| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADDAD   .D2     B10,1,B4
           LDW     .D2T2   *B4,B4            ; |250| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |250| 

           STW     .D1T1   A4,*A3            ; |250| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B8           ; |128| 

           MVKL    .S2     t_start,B4
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         SUB     .L1X    B11,1,A0          ; |248| 
||         MVKL    .S1     t_stop,A31
||         MV      .L2     B8,B17            ; |128| 
||         SUB     .D2     B11,1,B11         ; |248| 

           MVKH    .S2     t_start,B4
||         ADDAD   .D1     A14,2,A3
||         MVKH    .S1     t_stop,A31
||         ADD     .L1     4,A12,A12         ; |248| 

           LDDW    .D2T2   *B4,B7:B6         ; |130| 
           MVK     .S2     16,B12
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADD     .L2X    A14,B12,B12
           ADDU    .L2X    A4,B6,B5:B4       ; |130| 

           ADD     .S2X    B5,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L13            ; |248| 
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

           ; BRANCHCC OCCURS {$C$L13}        ; |248| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(16),A5:A4   ; |135| 
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

           STDW    .D1T1   A11:A10,*+A14(8)  ; |114| 
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
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |259| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |259| 
||         CALL    .S1     acoshsp           ; |259| 

           LDW     .D1T1   *A3,A4            ; |259| 
           ADDKPC  .S2     $C$RL38,B3,3      ; |259| 
$C$RL38:   ; CALL OCCURS {acoshsp} {0}       ; |259| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADD     .L2     4,B10,B4
           LDW     .D2T2   *B4,B4            ; |259| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |259| 

           STW     .D1T1   A4,*A3            ; |259| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_start,B12
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         SUB     .L1X    B11,1,A0          ; |257| 
||         MV      .L2     B4,B17            ; |128| 
||         MVKL    .S1     t_stop,A31
||         SUB     .D2     B11,1,B11         ; |257| 

           MVKH    .S1     t_stop,A31
||         ADD     .L1     4,A12,A12         ; |257| 
||         MVKH    .S2     t_start,B12

           LDDW    .D2T2   *B12,B9:B8        ; |130| 
           ADDAD   .D1     A14,1,A3
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B17:B16,*A31      ; |128| 
           MV      .L2X    A3,B13            ; |128| 
           ADDU    .L2X    A4,B8,B7:B6       ; |130| 

           SUBU    .L2     B16,B6,B5:B4      ; |130| 
||         ADD     .S2X    B7,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L14            ; |257| 

           ADD     .D2     B6,B9,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B6,B6         ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L14}        ; |257| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(8),A5:A4    ; |135| 
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

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D2T2   B5:B4,*B12        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           MVKL    .S1     input,A3
||         SUBU    .L2     B6,B4,B7:B6       ; |117| 

           MVKH    .S1     input,A3
||         EXT     .S2     B7,24,24,B7       ; |117| 
||         SUB     .L2     B8,B5,B5          ; |117| 

           ADD     .L2     B5,B7,B5          ; |117| 
||         MV      .S2     B6,B4             ; |117| 

           MV      .L2X    A3,B9             ; |266| 
||         MV      .L1X    B10,A10           ; |117| 
||         STDW    .D1T2   B5:B4,*A15        ; |117| 

           CALLP   .S2     acoshsp_v,B3
||         LDW     .D2T1   *B9,A4            ; |266| 
||         LDW     .D1T2   *+A10(16),B4      ; |266| 
||         MVK     .S1     0x80,A6           ; |266| 

$C$RL41:   ; CALL OCCURS {acoshsp_v} {0}     ; |266| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         LDDW    .D2T2   *B12,B9:B8        ; |130| 

           MVK     .S2     24,B10
           ADD     .L2X    A12,B10,B10
           LDDW    .D2T2   *B10,B7:B6        ; |130| 
           MVKL    .S1     t_stop,A3

           ADDU    .L1X    A4,B8,A7:A6       ; |130| 
||         MVKH    .S1     t_stop,A3

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
||         MVK     .L1     0x1,A8            ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 

$C$RL44:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVKL    .S1     fcn_pass,A11
||         MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S1     fcn_pass,A11
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A11(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

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
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T2   *+SP(20),B4       ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D1T1   A4,*+A11(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *B4,B4            ; |69| 
||         LDW     .D1T1   *A10,A4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL47:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(24),B4       ; |69| 
           STW     .D1T1   A4,*+A11(16)      ; |69| 
           NOP             3
           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T2   *+SP(28),B4
           NOP             3

   [!B0]   B       .S1     $C$L15            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B4,B0            ; |72| 
   [ B1]   ADD     .L2     4,B4,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L15}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
   [!B0]   MV      .L1     A12,A0            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [ A0]   B       .S1     $C$L16            ; |72| 
   [ A0]   CALL    .S1     print_test_results ; |272| 
           MVK     .L1     0x1,A3            ; |72| 
   [ A0]   MVKL    .S1     all_pass,A4
   [ A0]   MVKH    .S1     all_pass,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L16}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |272| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           MV      .L1     A12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |272| 
||         ADDKPC  .S2     $C$RL48,B3,0      ; |272| 

$C$RL48:   ; CALL OCCURS {print_test_results} {0}  ; |272| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |273| 

$C$RL49:   ; CALL OCCURS {printf} {0}        ; |273| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |273| 

$C$RL50:   ; CALL OCCURS {printf} {0}        ; |273| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |280| 

$C$RL51:   ; CALL OCCURS {print_profile_results} {0}  ; |280| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |283| 

$C$RL52:   ; CALL OCCURS {print_memory_results} {0}  ; |283| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(40),B3      ; |284| 
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
$C$SL1:	.string	"acoshSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	acoshf
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	acoshsp_c
	.global	acoshsp
	.global	acoshsp_v
	.global	ti_math_logtable
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
