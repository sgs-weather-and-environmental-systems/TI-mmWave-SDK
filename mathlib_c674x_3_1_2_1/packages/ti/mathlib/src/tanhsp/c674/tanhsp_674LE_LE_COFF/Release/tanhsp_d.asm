;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Tue May 17 00:01:14 2016                                *
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
	.word	0b4000001h		; _a[0] @ 0
	.word	0340c1550h		; _a[1] @ 32
	.word	0b4194e9ah		; _a[2] @ 64
	.word	03427c77dh		; _a[3] @ 96
	.word	0b4379e1ah		; _a[4] @ 128
	.word	03448f37ch		; _a[5] @ 160
	.word	0b45bebc0h		; _a[6] @ 192
	.word	03470ae6fh		; _a[7] @ 224
	.word	0b483b36dh		; _a[8] @ 256
	.word	034902227h		; _a[9] @ 288
	.word	0b49dbd56h		; _a[10] @ 320
	.word	034aca158h		; _a[11] @ 352
	.word	0b4bced32h		; _a[12] @ 384
	.word	034cec2e0h		; _a[13] @ 416
	.word	0b4e24789h		; _a[14] @ 448
	.word	034f7a3e7h		; _a[15] @ 480
	.word	0b507823dh		; _a[16] @ 512
	.word	035144cffh		; _a[17] @ 544
	.word	0b5224ce5h		; _a[18] @ 576
	.word	035319f1bh		; _a[19] @ 608
	.word	0b5426395h		; _a[20] @ 640
	.word	03554bd44h		; _a[21] @ 672
	.word	0b568d269h		; _a[22] @ 704
	.word	0357ecce1h		; _a[23] @ 736
	.word	0b58b6d3dh		; _a[24] @ 768
	.word	0359896b1h		; _a[25] @ 800
	.word	0b5a6fe37h		; _a[26] @ 832
	.word	035b6c1cdh		; _a[27] @ 864
	.word	0b5c80267h		; _a[28] @ 896
	.word	035dae3ech		; _a[29] @ 928
	.word	0b5ef8db5h		; _a[30] @ 960
	.word	03603156ch		; _a[31] @ 992
	.word	0b60f753ch		; _a[32] @ 1024
	.word	0361d0019h		; _a[33] @ 1056
	.word	0b62bd23dh		; _a[34] @ 1088
	.word	0363c0a8bh		; _a[35] @ 1120
	.word	0b64dcad3h		; _a[36] @ 1152
	.word	036613812h		; _a[37] @ 1184
	.word	0b6767acfh		; _a[38] @ 1216
	.word	03686dfach		; _a[39] @ 1248
	.word	0b6939b14h		; _a[40] @ 1280
	.word	036a18a2eh		; _a[41] @ 1312
	.word	0b6b0ca03h		; _a[42] @ 1344
	.word	036c17a5fh		; _a[43] @ 1376
	.word	0b6d3be09h		; _a[44] @ 1408
	.word	036e7bb18h		; _a[45] @ 1440
	.word	0b6fd9b31h		; _a[46] @ 1472
	.word	0370ac5f8h		; _a[47] @ 1504
	.word	0b717df9fh		; _a[48] @ 1536
	.word	0372635dbh		; _a[49] @ 1568
	.word	0b735e68dh		; _a[50] @ 1600
	.word	037471273h		; _a[51] @ 1632
	.word	0b759dd49h		; _a[52] @ 1664
	.word	0376e6e50h		; _a[53] @ 1696
	.word	0b7827828h		; _a[54] @ 1728
	.word	0378ec923h		; _a[55] @ 1760
	.word	0b79c43c1h		; _a[56] @ 1792
	.word	037ab041bh		; _a[57] @ 1824
	.word	0b7bb28f0h		; _a[58] @ 1856
	.word	037ccd3edh		; _a[59] @ 1888
	.word	0b7e029e0h		; _a[60] @ 1920
	.word	037f55318h		; _a[61] @ 1952
	.word	0b8063ddch		; _a[62] @ 1984
	.word	03812e9ffh		; _a[63] @ 2016
	.word	0b820c861h		; _a[64] @ 2048
	.word	0382ff5ebh		; _a[65] @ 2080
	.word	0b8409242h		; _a[66] @ 2112
	.word	03852c001h		; _a[67] @ 2144
	.word	0b866a513h		; _a[68] @ 2176
	.word	0387c6aefh		; _a[69] @ 2208
	.word	0b88a1f7ah		; _a[70] @ 2240
	.word	03897296ah		; _a[71] @ 2272
	.word	0b8a56e75h		; _a[72] @ 2304
	.word	038b50c56h		; _a[73] @ 2336
	.word	0b8c6239eh		; _a[74] @ 2368
	.word	038d8d7eah		; _a[75] @ 2400
	.word	0b8ed5042h		; _a[76] @ 2432
	.word	03901dba3h		; _a[77] @ 2464
	.word	0b90e1dd6h		; _a[78] @ 2496
	.word	0391b8848h		; _a[79] @ 2528
	.word	0b92a36f1h		; _a[80] @ 2560
	.word	0393a486bh		; _a[81] @ 2592
	.word	0b94bde30h		; _a[82] @ 2624
	.word	0395f1cf2h		; _a[83] @ 2656
	.word	0b9742ccbh		; _a[84] @ 2688
	.word	039859cd0h		; _a[85] @ 2720
	.word	0b99239beh		; _a[86] @ 2752
	.word	039a0077eh		; _a[87] @ 2784
	.word	0b9af22d1h		; _a[88] @ 2816
	.word	039bfab39h		; _a[89] @ 2848
	.word	0b9d1c32ch		; _a[90] @ 2880
	.word	039e59060h		; _a[91] @ 2912
	.word	0b9fb3c1ah		; _a[92] @ 2944
	.word	03a0979c6h		; _a[93] @ 2976
	.word	0ba167411h		; _a[94] @ 3008
	.word	03a24a7fch		; _a[95] @ 3040
	.word	0ba343321h		; _a[96] @ 3072
	.word	03a4535e8h		; _a[97] @ 3104
	.word	0ba57d3c6h		; _a[98] @ 3136
	.word	03a6c338dh		; _a[99] @ 3168
	.word	0ba813fd7h		; _a[100] @ 3200
	.word	03a8d7357h		; _a[101] @ 3232
	.word	0ba9acdb2h		; _a[102] @ 3264
	.word	03aa96ab7h		; _a[103] @ 3296
	.word	0bab968edh		; _a[104] @ 3328
	.word	03acae99eh		; _a[105] @ 3360
	.word	0bade1143h		; _a[106] @ 3392
	.word	03af307dbh		; _a[107] @ 3424
	.word	0bb04fc83h		; _a[108] @ 3456
	.word	03b118a4eh		; _a[109] @ 3488
	.word	0bb1f477fh		; _a[110] @ 3520
	.word	03b2e50b6h		; _a[111] @ 3552
	.word	0bb3ec549h		; _a[112] @ 3584
	.word	03b50c783h		; _a[113] @ 3616
	.word	0bb647cf5h		; _a[114] @ 3648
	.word	03b7a0eb1h		; _a[115] @ 3680
	.word	0bb88d4d9h		; _a[116] @ 3712
	.word	03b95bf92h		; _a[117] @ 3744
	.word	0bba3e271h		; _a[118] @ 3776
	.word	03bb35af2h		; _a[119] @ 3808
	.word	0bbc44950h		; _a[120] @ 3840
	.word	03bd6d0d8h		; _a[121] @ 3872
	.word	0bbeb182bh		; _a[122] @ 3904
	.word	03c00a4c7h		; _a[123] @ 3936
	.word	0bc0cc9a2h		; _a[124] @ 3968
	.word	03c1a13f7h		; _a[125] @ 4000
	.word	0bc289f7ch		; _a[126] @ 4032
	.word	03c388a80h		; _a[127] @ 4064
	.word	0bc49f62eh		; _a[128] @ 4096
	.word	03c5d06d7h		; _a[129] @ 4128
	.word	0bc71e449h		; _a[130] @ 4160
	.word	03c845cf7h		; _a[131] @ 4192
	.word	0bc90dbb5h		; _a[132] @ 4224
	.word	03c9e8866h		; _a[133] @ 4256
	.word	0bcad7f95h		; _a[134] @ 4288
	.word	03cbde06bh		; _a[135] @ 4320
	.word	0bccfcd0dh		; _a[136] @ 4352
	.word	03ce36ad9h		; _a[137] @ 4384
	.word	0bcf8e2b5h		; _a[138] @ 4416
	.word	03d0830aeh		; _a[139] @ 4448
	.word	0bd150be9h		; _a[140] @ 4480
	.word	03d231dd4h		; _a[141] @ 4512
	.word	0bd3283c6h		; _a[142] @ 4544
	.word	03d435dd3h		; _a[143] @ 4576
	.word	0bd55cf22h		; _a[144] @ 4608
	.word	03d69fe21h		; _a[145] @ 4640
	.word	0bd800a72h		; _a[146] @ 4672
	.word	03d8c20bbh		; _a[147] @ 4704
	.word	0bd995b1eh		; _a[148] @ 4736
	.word	03da7d52dh		; _a[149] @ 4768
	.word	0bdb7ad17h		; _a[150] @ 4800
	.word	03dc903e1h		; _a[151] @ 4832
	.word	0bddbfdb5h		; _a[152] @ 4864
	.word	03df0c217h		; _a[153] @ 4896
	.word	0be03be2ah		; _a[154] @ 4928
	.word	03e102dedh		; _a[155] @ 4960
	.word	0be1dca37h		; _a[156] @ 4992
	.word	03e2caf71h		; _a[157] @ 5024
	.word	0be3cfc9dh		; _a[158] @ 5056
	.word	03e4ed3beh		; _a[159] @ 5088
	.word	0be625a04h		; _a[160] @ 5120
	.word	03e77b81fh		; _a[161] @ 5152
	.word	0be878d4dh		; _a[162] @ 5184
	.word	03e94591ah		; _a[163] @ 5216
	.word	0bea25a22h		; _a[164] @ 5248
	.word	03eb1ad9ah		; _a[165] @ 5280
	.word	0bec27371h		; _a[166] @ 5312
	.word	03ed4ce9fh		; _a[167] @ 5344
	.word	0bee8e567h		; _a[168] @ 5376
	.word	03efee1a9h		; _a[169] @ 5408
	.word	0bf0b789eh		; _a[170] @ 5440
	.word	03f18a322h		; _a[171] @ 5472
	.word	0bf270bd3h		; _a[172] @ 5504
	.word	03f36d0bbh		; _a[173] @ 5536
	.word	0bf4812b8h		; _a[174] @ 5568
	.word	03f5af5c4h		; _a[175] @ 5600
	.word	0bf6fa13eh		; _a[176] @ 5632
	.word	03f832021h		; _a[177] @ 5664
	.word	0bf8f80f5h		; _a[178] @ 5696
	.word	03f9d0cedh		; _a[179] @ 5728
	.word	0bfabe03fh		; _a[180] @ 5760
	.word	03fbc19e3h		; _a[181] @ 5792
	.word	0bfcddb98h		; _a[182] @ 5824
	.word	03fe14a77h		; _a[183] @ 5856
	.word	0bff68eefh		; _a[184] @ 5888
	.word	04006eaabh		; _a[185] @ 5920
	.word	0c013a722h		; _a[186] @ 5952
	.word	04021975bh		; _a[187] @ 5984
	.word	0c030d873h		; _a[188] @ 6016
	.word	040418a2bh		; _a[189] @ 6048
	.word	0c053cf53h		; _a[190] @ 6080
	.word	04067cdffh		; _a[191] @ 6112
	.word	0c07dafe2h		; _a[192] @ 6144
	.word	0408ad14ah		; _a[193] @ 6176
	.word	0c097ec03h		; _a[194] @ 6208
	.word	040a6436ch		; _a[195] @ 6240
	.word	0c0b5f568h		; _a[196] @ 6272
	.word	040c722afh		; _a[197] @ 6304
	.word	0c0d9ef13h		; _a[198] @ 6336
	.word	040ee81c1h		; _a[199] @ 6368
	.word	0c10282ceh		; _a[200] @ 6400
$C$IR_1:	.set	804

	.global	_a
_a:	.usect	".far",804,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\023727 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\023729 
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
;*   Local Frame Size  : 8 Args + 4 Auto + 56 Save = 68 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |124| 
           STW     .D2T1   A10,*SP--(8)      ; |124| 
           STDW    .D2T2   B13:B12,*SP--     ; |124| 
           STDW    .D2T2   B11:B10,*SP--     ; |124| 
           STDW    .D2T1   A15:A14,*SP--     ; |124| 

           STDW    .D2T1   A13:A12,*SP--     ; |124| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(24)      ; |124| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL4:    ; CALL OCCURS {_driver_init} {0}  ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A12

           MVKH    .S1     _a,A12
||         MVKL    .S2     _output,B11

           CALL    .S1     _tanhf            ; |141| 
||         MV      .L1     A12,A13
||         MV      .D1X    B4,A11
||         MVKH    .S2     _output,B11
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A13++,A4         ; |141| 
           ADDKPC  .S2     $C$RL5,B3,3       ; |141| 
$C$RL5:    ; CALL OCCURS {_tanhf} {0}        ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |141| 
||         SUB     .L1     A11,1,A0          ; |140| 
||         SUB     .S1     A11,1,A11         ; |140| 

   [ A0]   BNOP    .S1     $C$L3,3           ; |140| 

           ADD     .L2     B10,B4,B5         ; |141| 
||         ADD     .D2     4,B10,B10         ; |140| 
|| [!A0]   MVK     .S2     0xc9,B4

   [ A0]   CALL    .S1     _tanhf            ; |141| 
||         STW     .D2T1   A4,*B5            ; |141| 

           ; BRANCHCC OCCURS {$C$L3}         ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     _tanhsp           ; |144| 
||         MV      .L1X    B4,A11
||         ZERO    .L2     B10
||         MV      .D1     A12,A10
||         ADD     .S2     4,B11,B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |144| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |144| 
$C$RL6:    ; CALL OCCURS {_tanhsp} {0}       ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |144| 
||         SUB     .L1     A11,1,A0          ; |143| 
||         SUB     .S1     A11,1,A11         ; |143| 

   [ A0]   BNOP    .S1     $C$L4,3           ; |143| 

           ADD     .L2     B10,B4,B5         ; |144| 
||         ADD     .D2     4,B10,B10         ; |143| 
|| [!A0]   MVK     .S2     0xc9,B4

   [ A0]   CALL    .S1     _tanhsp           ; |144| 
||         STW     .D2T1   A4,*B5            ; |144| 

           ; BRANCHCC OCCURS {$C$L4}         ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           ADD     .L2     4,B11,B10
||         ZERO    .S2     B11
||         CALL    .S1     _tanhsp_c         ; |147| 
||         MV      .L1X    B4,A11
||         MV      .D1     A10,A12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |147| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |147| 
$C$RL7:    ; CALL OCCURS {_tanhsp_c} {0}     ; |147| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B10,B4           ; |147| 
||         SUB     .L1     A11,1,A0          ; |146| 
||         SUB     .S1     A11,1,A11         ; |146| 

   [ A0]   BNOP    .S1     $C$L5,3           ; |146| 

           ADD     .L2     B11,B4,B5         ; |147| 
||         ADD     .S2     4,B11,B11         ; |146| 

   [ A0]   CALL    .S2     _tanhsp_c         ; |147| 
||         STW     .D2T1   A4,*B5            ; |147| 
|| [!A0]   MVKL    .S1     0x3cb33c9d,A4

           ; BRANCHCC OCCURS {$C$L5}         ; |146| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           MVKH    .S1     0x3cb33c9d,A4
||         ADD     .L2     4,B10,B16
||         ZERO    .L1     A12
||         MVK     .S2     0xc9,B0
||         SUB     .D1     A10,4,A7
||         ZERO    .D2     B11

           MVKL    .S1     0x3980341a,A5
||         LDW     .D2T1   *B16,A8

           MVKL    .S1     0xbeaaaaab,A13
||         MV      .L2X    A4,B12

           MVKH    .S1     0x3980341a,A5
           MVKH    .S1     0xbeaaaaab,A13
           SET     .S1     A12,0x17,0x1d,A12
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D1T1   *++A7,A3          ; |204| 
           ZERO    .L2     B4
           ZERO    .L1     A31
           MVKH    .S2     0x41100000,B4
           MVKH    .S1     0xbf800000,A31

           ABSSP   .S1     A3,A4             ; |204| 
||         CMPLTSP .S2X    A3,B11,B1         ; |209| 

           CMPLTSP .S1     A4,A12,A0         ; |212| 
||         MPYSP   .M1     A4,A4,A9          ; |128| 
|| [!B1]   MV      .L1     A12,A6            ; |209| 
|| [ B1]   MV      .D1     A31,A6            ; |209| 

   [ A0]   B       .S1     $C$L7             ; |212| 
||         CMPGTSP .S2X    A4,B4,B1          ; |215| 

   [ A0]   MVKL    .S2     0xba9bfbb3,B4
|| [ B1]   MV      .L1     A12,A5            ; |206| 
|| [ A0]   ZERO    .L2     B1                ; |206| nullify predicate

   [ B1]   B       .S1     $C$L8
   [ A0]   MPYSP   .M1     A9,A9,A5          ; |128| 
   [ A0]   MVKL    .S1     0x3980341a,A3
   [ A0]   MVKH    .S1     0x3980341a,A3
           ; BRANCHCC OCCURS {$C$L7}         ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
   [!B1]   ZERO    .L1     A3
   [!B1]   MVKH    .S1     0xc0000000,A3
           ; BRANCHCC OCCURS {$C$L8}  
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 123
           MPYSP   .M1     A3,A4,A3          ; |173| 
           MVKL    .S2     0x41b8aa3b,B4
           MVKH    .S2     0x41b8aa3b,B4
           ZERO    .L2     B5
           SET     .S2     B5,0x18,0x1d,B5
           MPYSP   .M2X    B4,A3,B4          ; |173| 
           ZERO    .L1     A31
           MVKH    .S1     0xbf000000,A31
           MVKL    .S2     0xfef2e4e7,B18
           ADDSP   .L2     B5,B4,B5          ; |173| 
           CMPLTSP .S2X    B4,A31,B4         ; |173| 
           MVKL    .S2     0x3fa62e42,B19
           MVKH    .S2     0xfef2e4e7,B18
           SPTRUNC .L2     B5,B6             ; |173| 
           MVKH    .S2     0x3fa62e42,B19
           MVKL    .S1     _ti_math_jTable,A30
           MVKH    .S1     _ti_math_jTable,A30
           SUB     .L2     B6,B4,B5          ; |173| 
           INTDP   .L2     B5,B9:B8          ; |173| 
           SPDP    .S1     A3,A17:A16        ; |173| 
           MVKL    .S2     _ti_math_kTable,B7
           MVKH    .S2     _ti_math_kTable,B7
           EXTU    .S2     B5,28,30,B31      ; |173| 
           MPYDP   .M2     B19:B18,B9:B8,B9:B8 ; |173| 
           AND     .L1X    3,B5,A3           ; |173| 
           LDDW    .D1T1   *+A30[A3],A5:A4   ; |173| 
           LDDW    .D2T2   *+B7[B31],B19:B18 ; |173| 
           MVKL    .S1     0x3e2aab29,A9
           MVKH    .S1     0x3e2aab29,A9
           MVKL    .S2     0x3f00010f,B30
           MVKH    .S2     0x3f00010f,B30
           SUB     .L2     B6,B4,B4          ; |173| 
           SHL     .S2     B4,16,B4          ; |173| 
           CLR     .S2     B4,0,19,B29       ; |173| 
           SUBDP   .L1X    A17:A16,B9:B8,A19:A18 ; |173| 
           ZERO    .S1     A29
           MPYDP   .M1X    A5:A4,B19:B18,A17:A16 ; |173| 
           MVKL    .S2     0x7f7fffff,B28
           MVKH    .S2     0x7f7fffff,B28
           ZERO    .S1     A28
           NOP             1
           DPSP    .L1     A19:A18,A3        ; |173| 
           NOP             3
           MPYSP   .M1     A3,A3,A4          ; |173| 
           NOP             3
           MPYSP   .M1     A4,A3,A5          ; |173| 
           MPYSP   .M2X    B30,A4,B5         ; |173| 
           MV      .L2X    A16,B4            ; |173| 
           MV      .L1X    B11,A16           ; |64| 
           MPYSP   .M1     A9,A5,A4          ; |173| 
           NOP             3
           ADDSP   .L1X    B5,A4,A4          ; |173| 
           ADD     .L2X    B29,A17,B5        ; |173| 
           SET     .S1     A28,0x14,0x1d,A17
           NOP             1
           ADDSP   .L1     A4,A3,A3          ; |173| 
           NOP             3
           ADDSP   .L1     A12,A3,A3         ; |173| 
           NOP             3
           MPYSPDP .M1X    A3,B5:B4,A5:A4    ; |173| 
           NOP             6
           DPSP    .L1     A5:A4,A3          ; |173| 
           SET     .S1     A29,0x1e,0x1e,A5
           NOP             2
           ADDSP   .L1     A12,A3,A4         ; |173| 
           NOP             3
           RCPSP   .S1     A4,A3             ; |64| 
           MPYSP   .M1     A4,A3,A9          ; |64| 
           ABSSP   .S2X    A4,B4             ; |64| 
           CMPGTSP .S2     B4,B28,B1         ; |64| 
           NOP             1
           SUBSP   .L1     A5,A9,A9          ; |64| 
           NOP             3
           MPYSP   .M1     A3,A9,A3          ; |64| 
           NOP             3
           MPYSP   .M1     A4,A3,A9          ; |64| 
           NOP             3
           SUBSP   .L1     A5,A9,A5          ; |64| 
           NOP             3
           MPYSP   .M1     A3,A5,A3          ; |64| 
           NOP             3
   [!B1]   ADDSP   .L1     A3,A3,A3          ; |64| 
   [ B1]   MV      .L1X    B11,A3            ; |64| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |64| 
           NOP             1
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |64| 
           NOP             1
           BNOP    .S1     $C$L8,4           ; |218| 
           DPSP    .L1     A5:A4,A5          ; |64| 
           ; BRANCH OCCURS {$C$L8}           ; |218| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 32

           MVKH    .S2     0xba9bfbb3,B4
||         MPYSP   .M1     A13,A9,A31        ; |128| 
||         MVKL    .S1     0xbc11371b,A28

           MPYSP   .M1     A3,A5,A17         ; |128| 
||         MPYSP   .M2X    B4,A9,B4          ; |128| 
||         MVKL    .S2     0x3e088889,B31
||         MVKH    .S1     0xbc11371b,A28

           MPYSP   .M1     A5,A9,A16         ; |128| 
||         MVKH    .S2     0x3e088889,B31

           MPYSP   .M1     A5,A5,A3          ; |128| 
||         MPYSP   .M2X    B31,A5,B7         ; |128| 
||         MVKL    .S2     0xbd5d0dd1,B30

           MVKL    .S2     0x3b64dc30,B29
           MVKH    .S2     0xbd5d0dd1,B30

           ADDSP   .L2X    B4,A17,B6         ; |128| 
||         MPYSP   .M1     A5,A16,A29        ; |128| 
||         MVKH    .S2     0x3b64dc30,B29

           MPYSP   .M2X    B30,A16,B8        ; |128| 
           MPYSP   .M1     A5,A3,A30         ; |128| 
           MPYSP   .M2X    B12,A3,B5         ; |128| 
           ADDSP   .L2     B29,B6,B6         ; |128| 
           ADDSP   .L1X    A31,B7,A5         ; |128| 
           MPYSP   .M1     A28,A29,A3        ; |128| 
           ADDSP   .L2     B8,B5,B4          ; |128| 
           MPYSP   .M2X    A30,B6,B5         ; |128| 
           NOP             2
           ADDSP   .L2X    A5,B4,B4          ; |128| 
           ADDSP   .L2X    A3,B5,B5          ; |128| 
           NOP             3
           ADDSP   .L2     B5,B4,B4          ; |128| 
           NOP             4
           MPYSP   .M1X    A4,B4,A3          ; |128| 
           NOP             3
           ADDSP   .L1     A4,A3,A5          ; |128| 
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 8
           SUB     .L2     B0,1,B0           ; |149| 
   [!B0]   ADD     .L2     4,B16,B10
   [ B0]   B       .S1     $C$L6             ; |149| 
           MPYSP   .M1     A6,A5,A3          ; |150| 
           NOP             3

   [!B0]   CALL    .S1     _tanhsp_v         ; |152| 
||         STW     .D1T1   A3,*A8++          ; |150| 

           ; BRANCHCC OCCURS {$C$L6}         ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *B10,B4           ; |152| 
           MVK     .S1     0xc9,A6           ; |152| 
           MV      .L1     A10,A4            ; |152| 
           ADDKPC  .S2     $C$RL8,B3,1       ; |152| 
$C$RL8:    ; CALL OCCURS {_tanhsp_v} {0}     ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .S1     0xc9,A4           ; |157| 

$C$RL9:    ; CALL OCCURS {_allequal} {0}     ; |157| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x1,A4            ; |158| 

$C$RL10:   ; CALL OCCURS {_print_test_results} {0}  ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _a_sc,B4

           MVKH    .S2     _a_sc,B4
||         ZERO    .L2     B7

           MVKH    .S2     0xff800000,B7
||         ZERO    .L2     B6
||         ZERO    .L1     A3

           MV      .L1X    B4,A15            ; |166| 
||         MVKH    .S1     0xbf800000,A3
||         SET     .S2     B6,0x17,0x1e,B6
||         ZERO    .D1     A5

           STDW    .D1T2   B7:B6,*+A15(8)    ; |168| 
||         MVKH    .S1     0x80000000,A5
||         MV      .L2X    A12,B8            ; |170| 
||         MV      .L1X    B11,A4            ; |166| 

           STDW    .D1T1   A5:A4,*A15        ; |166| 
||         MV      .L2X    A3,B9             ; |170| 
||         MVK     .L1     -1,A7             ; |172| 

           STDW    .D1T2   B9:B8,*+A15(16)   ; |170| 
||         ADD     .L1     -1,A5,A6
||         MV      .S1X    B11,A10           ; |166| 

           STDW    .D1T1   A7:A6,*+A15(24)   ; |172| 
||         SUB     .L1X    B4,4,A11
||         MVK     .L2     0x8,B13

;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     _tanhf            ; |175| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *++A11,A4         ; |175| 
           ADDKPC  .S2     $C$RL11,B3,3      ; |175| 
$C$RL11:   ; CALL OCCURS {_tanhf} {0}        ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 28
           MVKL    .S1     _output,A14
           MVKH    .S1     _output,A14
           LDW     .D1T2   *A14,B4           ; |175| 
           NOP             4
           ADD     .L2X    A10,B4,B4         ; |175| 
           STW     .D2T1   A4,*B4            ; |175| 

           CALLP   .S2     _tanhsp,B3
||         LDW     .D1T1   *A11,A4           ; |176| 

$C$RL12:   ; CALL OCCURS {_tanhsp} {0}       ; |176| 
           LDW     .D1T2   *+A14(4),B4       ; |176| 
           NOP             4
           ADD     .L2X    A10,B4,B4         ; |176| 
           STW     .D2T1   A4,*B4            ; |176| 

           CALLP   .S2     _tanhsp_c,B3
||         LDW     .D1T1   *A11,A4           ; |177| 

$C$RL13:   ; CALL OCCURS {_tanhsp_c} {0}     ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           LDW     .D1T1   *+A14(8),A3       ; |177| 
           ZERO    .L2     B4
           ZERO    .L1     A31
           MVKH    .S2     0x41100000,B4
           MVKH    .S1     0xbf800000,A31
           ADD     .L1     A10,A3,A3         ; |177| 
           STW     .D1T1   A4,*A3            ; |177| 
           LDW     .D1T1   *A11,A3           ; |204| 
           NOP             4

           ABSSP   .S1     A3,A4             ; |204| 
||         CMPLTSP .S2X    A3,B11,B0         ; |209| 

           MPYSP   .M1     A4,A4,A6          ; |128| 
||         CMPLTSP .S1     A4,A12,A0         ; |212| 
|| [!B0]   MV      .L1     A12,A8            ; |209| 
|| [ B0]   MV      .D1     A31,A8            ; |209| 

   [ A0]   B       .S1     $C$L11            ; |212| 
||         CMPGTSP .S2X    A4,B4,B0          ; |215| 

   [ A0]   MVKL    .S2     0xba9bfbb3,B4
|| [ A0]   ZERO    .L2     B0                ; |215| nullify predicate

   [ B0]   B       .S1     $C$L10            ; |215| 
           MPYSP   .M1     A6,A6,A5          ; |128| 
   [ A0]   MVKL    .S1     0x3980341a,A3
   [ A0]   MVKH    .S1     0x3980341a,A3
           ; BRANCHCC OCCURS {$C$L11}        ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

   [!B0]   ZERO    .L1     A3
|| [ B0]   B       .S1     $C$L13
|| [ B0]   MV      .D1     A12,A3            ; |206| 

   [!B0]   MVKH    .S1     0xc0000000,A3
           ; BRANCHCC OCCURS {$C$L10}        ; |215| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 126
           MPYSP   .M1     A3,A4,A3          ; |216| 
           MVKL    .S2     0x41b8aa3b,B4
           MVKH    .S2     0x41b8aa3b,B4
           ZERO    .L2     B31
           ZERO    .L2     B6
           MPYSP   .M2X    B4,A3,B5          ; |154| 
           SET     .S2     B31,0x18,0x1d,B4
           MVKH    .S2     0xbf000000,B6
           MVKL    .S1     0x3fa62e42,A5
           ADDSP   .L2     B4,B5,B4          ; |154| 
           CMPLTSP .S2     B5,B6,B0          ; |155| 
           MVKL    .S1     0xfef2e4e7,A4
           MVKH    .S1     0x3fa62e42,A5
           SPTRUNC .L2     B4,B4             ; |154| 
           MVKH    .S1     0xfef2e4e7,A4
           SPDP    .S1     A3,A7:A6          ; |218| 
           MVKL    .S2     0x3f00010f,B29
   [ B0]   SUB     .L2     B4,1,B4           ; |156| 
           INTDP   .L2     B4,B7:B6          ; |218| 
           MVKL    .S2     _ti_math_kTable,B30
           MVKL    .S1     _ti_math_jTable,A31
           MVKL    .S2     0x3e2aab29,B8
           MVKH    .S2     0x3f00010f,B29
           MVKH    .S1     _ti_math_jTable,A31
           MPYDP   .M1X    A5:A4,B7:B6,A5:A4 ; |218| 
           MVKH    .S2     _ti_math_kTable,B30
           MVKH    .S2     0x3e2aab29,B8
           EXTU    .S2     B4,28,30,B28      ; |218| 
           AND     .L1X    3,B4,A30          ; |218| 
           LDDW    .D2T2   *+B30[B28],B7:B6  ; |218| 
           ZERO    .L2     B27
           MVKH    .S2     0xfff00000,B27
           SHL     .S2     B4,16,B26         ; |218| 
           AND     .L2     B27,B26,B4        ; |218| 
           SUBDP   .L1     A7:A6,A5:A4,A5:A4 ; |218| 
           LDDW    .D1T1   *+A31[A30],A7:A6  ; |218| 
           ZERO    .L1     A29
           ZERO    .L1     A28
           MVKL    .S2     0x7f7fffff,B25
           MVKH    .S2     0x7f7fffff,B25
           MPYDP   .M2X    A7:A6,B7:B6,B7:B6 ; |218| 
           DPSP    .L1     A5:A4,A4          ; |218| 
           NOP             3
           MPYSP   .M1     A4,A4,A5          ; |218| 
           SET     .S1     A28,0x14,0x1d,A7
           NOP             2
           MPYSP   .M1     A5,A4,A9          ; |218| 
           MPYSP   .M2X    B29,A5,B5         ; |218| 
           ADD     .L2     B4,B7,B7          ; |218| 
           NOP             2
           MPYSP   .M2X    B8,A9,B8          ; |218| 
           NOP             3
           ADDSP   .L2     B5,B8,B5          ; |218| 
           NOP             4
           ADDSP   .L1X    B5,A4,A3          ; |218| 
           NOP             3
           ADDSP   .L1     A12,A3,A3         ; |218| 
           NOP             3
           MPYSPDP .M1X    A3,B7:B6,A5:A4    ; |218| 
           NOP             6
           DPSP    .L1     A5:A4,A3          ; |218| 
           SET     .S1     A29,0x1e,0x1e,A5
           NOP             2
           ADDSP   .L1     A12,A3,A4         ; |218| 
           NOP             3
           RCPSP   .S1     A4,A3             ; |64| 
           MPYSP   .M1     A4,A3,A6          ; |64| 
           ABSSP   .S2X    A4,B5             ; |70| 
           CMPGTSP .S2     B5,B25,B0         ; |70| 
           NOP             1
           SUBSP   .L1     A5,A6,A6          ; |64| 
           NOP             3
           MPYSP   .M1     A3,A6,A3          ; |64| 
           NOP             3
           MPYSP   .M1     A4,A3,A6          ; |64| 
           NOP             3
           SUBSP   .L1     A5,A6,A5          ; |64| 
           MV      .L1X    B11,A6            ; |218| 
           NOP             2
           MPYSP   .M1     A3,A5,A3          ; |64| 
           NOP             3
           ADDSP   .L1     A3,A3,A3          ; |64| 
           NOP             3
   [ B0]   MV      .L1X    B11,A3            ; |71| 
           SPDP    .S1     A3,A5:A4          ; |218| 
           NOP             1
           SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |218| 
           NOP             1
           BNOP    .S1     $C$L12,4          ; |218| 
           DPSP    .L1     A5:A4,A3          ; |218| 
           ; BRANCH OCCURS {$C$L12}          ; |218| 
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 4

           ADDAW   .D1     A14,3,A4
||         SUB     .L1X    B13,1,A0          ; |174| 
||         SUB     .L2     B13,1,B13         ; |174| 
||         MPYSP   .M1     A8,A3,A3          ; |178| 

           LDW     .D1T1   *A4,A4            ; |178| 
   [ A0]   BNOP    .S1     $C$L9,1           ; |174| 
           ; BRANCH OCCURS {$C$L13}  
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 32

           MVKH    .S2     0xba9bfbb3,B4
||         MPYSP   .M1     A13,A6,A31        ; |128| 
||         MVKL    .S1     0xbc11371b,A28

           MPYSP   .M1     A3,A5,A9          ; |128| 
||         MPYSP   .M2X    B4,A6,B4          ; |128| 
||         MVKL    .S2     0x3e088889,B31
||         MVKH    .S1     0xbc11371b,A28

           MPYSP   .M1     A5,A5,A7          ; |128| 
||         MVKH    .S2     0x3e088889,B31

           MPYSP   .M1     A5,A6,A3          ; |128| 
||         MPYSP   .M2X    B31,A5,B7         ; |128| 
||         MVKL    .S2     0xbd5d0dd1,B30

           MVKL    .S2     0x3b64dc30,B29
           MVKH    .S2     0xbd5d0dd1,B30

           ADDSP   .L2X    B4,A9,B5          ; |128| 
||         MPYSP   .M1     A5,A7,A30         ; |128| 
||         MVKH    .S2     0x3b64dc30,B29

           MPYSP   .M2X    B12,A7,B6         ; |128| 
           MPYSP   .M1     A5,A3,A29         ; |128| 
           MPYSP   .M2X    B30,A3,B8         ; |128| 
           ADDSP   .L2     B29,B5,B5         ; |128| 
           ADDSP   .L1X    A31,B7,A7         ; |128| 
           MPYSP   .M1     A28,A29,A3        ; |128| 
           ADDSP   .L2     B8,B6,B4          ; |128| 
           MPYSP   .M2X    A30,B5,B5         ; |128| 
           NOP             2
           ADDSP   .L2X    A7,B4,B4          ; |128| 
           ADDSP   .L2X    A3,B5,B5          ; |128| 
           NOP             3
           ADDSP   .L2     B5,B4,B4          ; |128| 
           NOP             4
           MPYSP   .M1X    A4,B4,A3          ; |128| 
           NOP             3
           ADDSP   .L1     A4,A3,A3          ; |128| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 4

           ADDAW   .D1     A14,3,A4
||         SUB     .L1X    B13,1,A0          ; |174| 
||         SUB     .L2     B13,1,B13         ; |174| 

           LDW     .D1T1   *A4,A4            ; |178| 
   [ A0]   B       .S1     $C$L9             ; |174| 
           MPYSP   .M1     A8,A3,A3          ; |178| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 4
           NOP             2

           ADD     .L1     A10,A4,A4         ; |178| 
||         ADD     .S1     4,A10,A10         ; |174| 

   [ A0]   CALL    .S1     _tanhf            ; |175| 
||         STW     .D1T1   A3,*A4            ; |178| 

           ; BRANCHCC OCCURS {$C$L9}         ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     _tanhsp_v         ; |180| 
           LDW     .D2T2   *B10,B4           ; |180| 
           ADDKPC  .S2     $C$RL14,B3,2      ; |180| 

           MV      .L1     A15,A4
||         MVK     .S1     0x8,A6            ; |180| 

$C$RL14:   ; CALL OCCURS {_tanhsp_v} {0}     ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .L1     0x8,A4            ; |183| 

$C$RL15:   ; CALL OCCURS {_allequal} {0}     ; |183| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x3,A4            ; |184| 

$C$RL16:   ; CALL OCCURS {_print_test_results} {0}  ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

           MVKL    .S1     _a_ext,A14
||         ZERO    .L2     B4

           MVKH    .S1     _a_ext,A14
||         SET     .S2     B4,0x17,0x17,B4

           STW     .D1T2   B4,*A14           ; |187| 
||         MVK     .S2     0xed,B4

           MV      .L1     A14,A10           ; |187| 

           MV      .L2     B11,B13
||         CALL    .S1     _tanhf            ; |189| 
||         MV      .L1X    B4,A11            ; |187| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A10,A4           ; |189| 
           ADDKPC  .S2     $C$RL17,B3,3      ; |189| 
$C$RL17:   ; CALL OCCURS {_tanhf} {0}        ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 29
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           MV      .L1     A3,A15            ; |189| 
           LDW     .D1T1   *A15,A3           ; |189| 
           NOP             4
           ADD     .L1X    B13,A3,A3         ; |189| 
           STW     .D1T1   A4,*A3            ; |189| 

           CALLP   .S2     _tanhsp,B3
||         LDW     .D1T1   *A10,A4           ; |190| 

$C$RL18:   ; CALL OCCURS {_tanhsp} {0}       ; |190| 
           LDW     .D1T1   *+A15(4),A3       ; |190| 
           NOP             4
           ADD     .L1X    B13,A3,A3         ; |190| 
           STW     .D1T1   A4,*A3            ; |190| 

           CALLP   .S2     _tanhsp_c,B3
||         LDW     .D1T1   *A10,A4           ; |191| 

$C$RL19:   ; CALL OCCURS {_tanhsp_c} {0}     ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           LDW     .D1T1   *+A15(8),A3       ; |191| 
           NOP             4
           ADD     .L2X    B13,A3,B4         ; |191| 
           STW     .D2T1   A4,*B4            ; |191| 
           LDW     .D1T1   *A10,A3           ; |204| 
           ZERO    .L2     B4
           MVKH    .S2     0x41100000,B4
           NOP             2

           ABSSP   .S1     A3,A4             ; |204| 
||         CMPLTSP .S2X    A3,B11,B0         ; |209| 
||         ZERO    .L1     A3

           MPYSP   .M1     A4,A4,A6          ; |128| 
||         CMPLTSP .S1     A4,A12,A0         ; |212| 
|| [!B0]   MV      .L2X    A12,B8            ; |209| 

   [ A0]   BNOP    .S2     $C$L16,1          ; |212| 
||         MVKH    .S1     0xbf800000,A3

   [ B0]   MV      .L2X    A3,B8             ; |209| 
|| [ A0]   MVKL    .S1     0x3980341a,A3

           MPYSP   .M1     A6,A6,A5          ; |128| 
||         CMPGTSP .S2X    A4,B4,B0          ; |215| 
|| [ A0]   MVKH    .S1     0x3980341a,A3

   [ A0]   ZERO    .L2     B0                ; |215| nullify predicate
|| [ A0]   MVKL    .S2     0xba9bfbb3,B4

   [ B0]   B       .S1     $C$L15            ; |215| 
           ; BRANCHCC OCCURS {$C$L16}        ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

   [ B0]   MV      .L2X    A12,B4            ; |206| 
|| [ B0]   B       .S1     $C$L18
|| [!B0]   ZERO    .L1     A3

   [!B0]   MVKH    .S1     0xc0000000,A3
   [!B0]   MPYSP   .M1     A3,A4,A3          ; |216| 
   [!B0]   MVKL    .S2     0x41b8aa3b,B4
   [!B0]   MVKH    .S2     0x41b8aa3b,B4
           ; BRANCHCC OCCURS {$C$L15}        ; |215| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 123
           ZERO    .L2     B31
           MPYSP   .M2X    B4,A3,B5          ; |154| 
           SET     .S2     B31,0x18,0x1d,B4
           ZERO    .L2     B6
           MVKH    .S2     0xbf000000,B6
           ADDSP   .L2     B4,B5,B4          ; |154| 
           CMPLTSP .S2     B5,B6,B0          ; |155| 
           MVKL    .S1     0xfef2e4e7,A4
           MVKL    .S1     0x3fa62e42,A5
           SPTRUNC .L2     B4,B4             ; |154| 
           MVKH    .S1     0xfef2e4e7,A4
           MVKH    .S1     0x3fa62e42,A5
           SPDP    .S1     A3,A7:A6          ; |218| 
   [ B0]   SUB     .L2     B4,1,B4           ; |156| 
           INTDP   .L2     B4,B7:B6          ; |218| 
           MVKL    .S2     0x3f00010f,B29
           MVKL    .S2     _ti_math_kTable,B30
           MVKL    .S2     0x3e2aab29,B9
           MVKH    .S2     0x3f00010f,B29
           MVKL    .S1     _ti_math_jTable,A31
           MPYDP   .M1X    A5:A4,B7:B6,A5:A4 ; |218| 
           MVKH    .S2     _ti_math_kTable,B30
           MVKH    .S1     _ti_math_jTable,A31
           MVKH    .S2     0x3e2aab29,B9
           EXTU    .S2     B4,28,30,B28      ; |218| 
           AND     .L1X    3,B4,A30          ; |218| 
           LDDW    .D2T2   *+B30[B28],B7:B6  ; |218| 
           ZERO    .L2     B27
           MVKH    .S2     0xfff00000,B27
           SHL     .S2     B4,16,B26         ; |218| 
           SUBDP   .L1     A7:A6,A5:A4,A5:A4 ; |218| 
           LDDW    .D1T1   *+A31[A30],A7:A6  ; |218| 
           AND     .L2     B27,B26,B4        ; |218| 
           ZERO    .L1     A29
           ZERO    .L2     B25
           MVKL    .S1     0x7f7fffff,A28
           MPYDP   .M2X    A7:A6,B7:B6,B7:B6 ; |218| 
           DPSP    .L1     A5:A4,A4          ; |218| 
           MVKH    .S1     0x7f7fffff,A28
           NOP             2
           MPYSP   .M1     A4,A4,A5          ; |218| 
           NOP             3
           MPYSP   .M1     A5,A4,A8          ; |218| 
           MPYSP   .M2X    B29,A5,B5         ; |218| 
           ADD     .L2     B4,B7,B7          ; |218| 
           NOP             2
           MPYSP   .M2X    B9,A8,B9          ; |218| 
           NOP             3
           ADDSP   .L2     B5,B9,B5          ; |218| 
           NOP             4
           ADDSP   .L1X    B5,A4,A3          ; |218| 
           SET     .S2     B25,0x14,0x1d,B5
           NOP             2
           ADDSP   .L1     A12,A3,A3         ; |218| 
           NOP             3
           MPYSPDP .M1X    A3,B7:B6,A5:A4    ; |218| 
           NOP             6
           DPSP    .L1     A5:A4,A3          ; |218| 
           SET     .S1     A29,0x1e,0x1e,A5
           NOP             2
           ADDSP   .L1     A12,A3,A4         ; |218| 
           NOP             3
           RCPSP   .S1     A4,A3             ; |64| 
           MPYSP   .M1     A4,A3,A6          ; |64| 
           ABSSP   .S2X    A4,B4             ; |70| 
           CMPGTSP .S2X    B4,A28,B0         ; |70| 
           MV      .L2     B11,B4            ; |218| 
           SUBSP   .L1     A5,A6,A6          ; |64| 
           NOP             3
           MPYSP   .M1     A3,A6,A3          ; |64| 
           NOP             3
           MPYSP   .M1     A4,A3,A6          ; |64| 
           NOP             3
           SUBSP   .L1     A5,A6,A5          ; |64| 
           NOP             3
           MPYSP   .M1     A3,A5,A3          ; |64| 
           NOP             3
           ADDSP   .L1     A3,A3,A3          ; |64| 
           NOP             3
   [ B0]   MV      .L1X    B11,A3            ; |71| 
           SPDP    .S1     A3,A5:A4          ; |218| 
           NOP             2
           SUBDP   .L2X    A5:A4,B5:B4,B5:B4 ; |218| 
           NOP             1
           BNOP    .S1     $C$L17,4          ; |218| 
           DPSP    .L2     B5:B4,B4          ; |218| 
           ; BRANCH OCCURS {$C$L17}          ; |218| 
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .S2     12,B5
||         MPYSP   .M2     B8,B4,B4          ; |192| 
||         MVKL    .S1     0xcccccccd,A4
||         SUB     .L1     A11,1,A0          ; |188| 
||         SUB     .D1     A11,1,A11         ; |188| 

           ; BRANCH OCCURS {$C$L18}  
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 31

           MVKH    .S2     0xba9bfbb3,B4
||         MPYSP   .M1     A13,A6,A31        ; |128| 
||         MVKL    .S1     0xbc11371b,A28

           MPYSP   .M1     A3,A5,A8          ; |128| 
||         MPYSP   .M2X    B4,A6,B4          ; |128| 
||         MVKL    .S2     0x3e088889,B31
||         MVKH    .S1     0xbc11371b,A28

           MPYSP   .M1     A5,A6,A3          ; |128| 
||         MVKH    .S2     0x3e088889,B31

           MPYSP   .M1     A5,A5,A7          ; |128| 
||         MPYSP   .M2X    B31,A5,B9         ; |128| 
||         MVKL    .S2     0xbd5d0dd1,B30

           MVKL    .S2     0x3b64dc30,B29
           MVKH    .S2     0xbd5d0dd1,B30

           ADDSP   .L2X    B4,A8,B6          ; |128| 
||         MPYSP   .M1     A5,A3,A29         ; |128| 
||         MVKH    .S2     0x3b64dc30,B29

           MPYSP   .M2X    B30,A3,B5         ; |128| 
           MPYSP   .M1     A5,A7,A30         ; |128| 
           MPYSP   .M2X    B12,A7,B7         ; |128| 
           ADDSP   .L2     B29,B6,B4         ; |128| 
           ADDSP   .L1X    A31,B9,A7         ; |128| 
           MPYSP   .M1     A28,A29,A3        ; |128| 
           ADDSP   .L2     B5,B7,B5          ; |128| 
           MPYSP   .M2X    A30,B4,B4         ; |128| 
           NOP             2
           ADDSP   .L2X    A7,B5,B5          ; |128| 
           ADDSP   .L2X    A3,B4,B4          ; |128| 
           NOP             3
           ADDSP   .L2     B4,B5,B4          ; |128| 
           NOP             3
           MPYSP   .M2X    A4,B4,B4          ; |128| 
           NOP             3
           ADDSP   .L2X    A4,B4,B4          ; |128| 
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 4

           MVK     .S2     12,B5
||         SUB     .L1     A11,1,A0          ; |188| 

           MVKL    .S1     0xcccccccd,A4
           SUB     .L1     A11,1,A11         ; |188| 
           MPYSP   .M2     B8,B4,B4          ; |192| 
;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 25
           ADD     .L2X    A15,B5,B5
           LDW     .D2T2   *B5,B5            ; |192| 
           MVKL    .S1     0xc000cccc,A5
           MVKH    .S1     0xc000cccc,A5
           MVKH    .S1     0xcccccccd,A4
           NOP             1
           ADD     .L2     B13,B5,B5         ; |192| 
           STW     .D2T2   B4,*B5            ; |192| 
           LDW     .D1T1   *A10,A3           ; |193| 
           ADD     .L2     4,B13,B13         ; |188| 
           NOP             3
           MPYSPDP .M1     A3,A5:A4,A5:A4    ; |193| 
           NOP             5
   [ A0]   B       .S1     $C$L14            ; |188| 
           DPSP    .L1     A5:A4,A3          ; |193| 
           NOP             3

   [ A0]   CALL    .S1     _tanhf            ; |189| 
||         STW     .D1T1   A3,*++A10         ; |193| 

           ; BRANCHCC OCCURS {$C$L14}        ; |188| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     _tanhsp_v         ; |195| 
           LDW     .D2T2   *B10,B4           ; |195| 
           ADDKPC  .S2     $C$RL20,B3,2      ; |195| 

           MV      .L1     A14,A4
||         MVK     .S1     0xed,A6           ; |195| 

$C$RL20:   ; CALL OCCURS {_tanhsp_v} {0}     ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .S1     0xed,A4           ; |198| 

$C$RL21:   ; CALL OCCURS {_allequal} {0}     ; |198| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x4,A4            ; |199| 

$C$RL22:   ; CALL OCCURS {_print_test_results} {0}  ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MV      .L1X    B11,A11           ; |114| 
||         MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         MV      .L2     B11,B4            ; |114| 
||         MV      .L1X    B11,A10           ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A3       ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S1     _t_offset,A4

           CALL    .S1     _gimme_random     ; |209| 
||         EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         MVKH    .S1     _t_offset,A4

           ZERO    .L1     A4
||         STDW    .D1T2   B7:B6,*A4         ; |117| 
||         MVK     .S1     0x80,A3

           MVKH    .S1     0x41a00000,A4
||         ZERO    .L2     B4
||         STW     .D2T1   A3,*+SP(12)       ; |117| 
||         MV      .S2     B11,B13           ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 2
           MVKH    .S2     0xc1200000,B4
           ADDKPC  .S2     $C$RL23,B3,0      ; |209| 
$C$RL23:   ; CALL OCCURS {_gimme_random} {0}  ; |209| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |209| 
           NOP             4
           ADD     .L2X    B13,A3,B4         ; |209| 

           STW     .D2T1   A4,*B4            ; |209| 
||         MVC     .S2     TSCL,B4           ; |122| 

           NOP             1

           MV      .L1X    B4,A6             ; |122| Define a twin register
||         MVC     .S2     TSCH,B4           ; |122| 

           ABSSP   .S1     A4,A5             ; |204| 
||         CMPLTSP .S2X    A4,B11,B0         ; |209| 
||         ZERO    .L1     A3

           MPYSP   .M1     A5,A5,A4          ; |128| 
||         CMPLTSP .S1     A5,A12,A0         ; |212| 
||         MV      .L1X    B4,A7             ; |122| 
||         ZERO    .L2     B4
|| [!B0]   MV      .S2X    A12,B8            ; |209| 

   [ A0]   B       .S2     $C$L21            ; |212| 
||         MVKH    .S1     0xbf800000,A3

           MVKH    .S2     0x41100000,B4
|| [ A0]   MVKL    .S1     0x3980341a,A8

   [ B0]   MV      .L2X    A3,B8             ; |209| 
|| [ A0]   MVKH    .S1     0x3980341a,A8

           MPYSP   .M1     A4,A4,A3          ; |128| 
||         CMPGTSP .S2X    A5,B4,B0          ; |215| 

   [ A0]   ZERO    .L2     B0                ; |215| nullify predicate
|| [ A0]   MVKL    .S2     0xba9bfbb3,B4

   [ B0]   B       .S1     $C$L20            ; |215| 
           ; BRANCHCC OCCURS {$C$L21}        ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

   [ B0]   B       .S1     $C$L23
|| [!B0]   MVKL    .S2     0x41b8aa3b,B4
|| [ B0]   MV      .L2X    A12,B4            ; |206| 

   [!B0]   ZERO    .L1     A3
   [!B0]   MVKH    .S1     0xc0000000,A3
   [!B0]   MPYSP   .M1     A3,A5,A3          ; |216| 
   [!B0]   MVKH    .S2     0x41b8aa3b,B4
           ; BRANCHCC OCCURS {$C$L20}        ; |215| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 124
           ZERO    .L2     B31
           ZERO    .L2     B6
           MPYSP   .M2X    B4,A3,B5          ; |154| 
           SET     .S2     B31,0x18,0x1d,B4
           MVKH    .S2     0xbf000000,B6
           MVKL    .S1     0x3fa62e42,A5
           ADDSP   .L2     B4,B5,B4          ; |154| 
           CMPLTSP .S2     B5,B6,B0          ; |155| 
           MVKL    .S1     0xfef2e4e7,A4
           MVKH    .S1     0x3fa62e42,A5
           SPTRUNC .L2     B4,B4             ; |154| 
           MVKH    .S1     0xfef2e4e7,A4
           SPDP    .S1     A3,A9:A8          ; |218| 
           MVKL    .S2     0x3f00010f,B29
   [ B0]   SUB     .L2     B4,1,B4           ; |156| 
           INTDP   .L2     B4,B7:B6          ; |218| 
           MVKL    .S2     _ti_math_kTable,B30
           MVKL    .S2     0x3e2aab29,B9
           MVKH    .S2     0x3f00010f,B29
           MVKL    .S1     _ti_math_jTable,A31
           MVKH    .S2     _ti_math_kTable,B30
           MPYDP   .M1X    A5:A4,B7:B6,A5:A4 ; |218| 
           MVKH    .S1     _ti_math_jTable,A31
           MVKH    .S2     0x3e2aab29,B9
           EXTU    .S2     B4,28,30,B28      ; |218| 
           AND     .L1X    3,B4,A30          ; |218| 
           LDDW    .D2T2   *+B30[B28],B7:B6  ; |218| 
           ZERO    .L2     B27
           MVKH    .S2     0xfff00000,B27
           SHL     .S2     B4,16,B26         ; |218| 
           AND     .L2     B27,B26,B4        ; |218| 
           SUBDP   .L1     A9:A8,A5:A4,A5:A4 ; |218| 
           LDDW    .D1T1   *+A31[A30],A9:A8  ; |218| 
           ZERO    .L1     A29
           ZERO    .L2     B25
           MVKL    .S1     0x7f7fffff,A28
           MVKH    .S1     0x7f7fffff,A28
           MPYDP   .M2X    A9:A8,B7:B6,B7:B6 ; |218| 
           DPSP    .L1     A5:A4,A4          ; |218| 
           NOP             3
           MPYSP   .M1     A4,A4,A5          ; |218| 
           NOP             3
           MPYSP   .M1     A5,A4,A16         ; |218| 
           MPYSP   .M2X    B29,A5,B5         ; |218| 
           ADD     .L2     B4,B7,B7          ; |218| 
           NOP             2
           MPYSP   .M2X    B9,A16,B9         ; |218| 
           NOP             3
           ADDSP   .L2     B5,B9,B5          ; |218| 
           NOP             4
           ADDSP   .L1X    B5,A4,A3          ; |218| 
           SET     .S2     B25,0x14,0x1d,B5
           NOP             2
           ADDSP   .L1     A12,A3,A3         ; |218| 
           NOP             3
           MPYSPDP .M1X    A3,B7:B6,A5:A4    ; |218| 
           NOP             6
           DPSP    .L1     A5:A4,A3          ; |218| 
           SET     .S1     A29,0x1e,0x1e,A5
           NOP             2
           ADDSP   .L1     A12,A3,A4         ; |218| 
           NOP             3
           RCPSP   .S1     A4,A3             ; |64| 
           MPYSP   .M1     A4,A3,A8          ; |64| 
           ABSSP   .S2X    A4,B4             ; |70| 
           CMPGTSP .S2X    B4,A28,B0         ; |70| 
           MV      .L2     B11,B4            ; |218| 
           SUBSP   .L1     A5,A8,A8          ; |64| 
           NOP             3
           MPYSP   .M1     A3,A8,A3          ; |64| 
           NOP             3
           MPYSP   .M1     A4,A3,A8          ; |64| 
           NOP             3
           SUBSP   .L1     A5,A8,A5          ; |64| 
           NOP             3
           MPYSP   .M1     A3,A5,A3          ; |64| 
           NOP             3
           ADDSP   .L1     A3,A3,A3          ; |64| 
           NOP             3
   [ B0]   MV      .L1X    B11,A3            ; |71| 
           SPDP    .S1     A3,A5:A4          ; |218| 
           NOP             2
           SUBDP   .L2X    A5:A4,B5:B4,B5:B4 ; |218| 
           NOP             1
           BNOP    .S1     $C$L22,4          ; |218| 
           DPSP    .L2     B5:B4,B4          ; |218| 
           ; BRANCH OCCURS {$C$L22}          ; |218| 
;** --------------------------------------------------------------------------*
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 1

           MVKL    .S2     _output+12,B5
||         MPYSP   .M2     B8,B4,B4          ; |213| 
||         MVKL    .S1     _t_start,A3

           ; BRANCH OCCURS {$C$L23}  
;** --------------------------------------------------------------------------*
$C$L21:    
;          EXCLUSIVE CPU CYCLES: 31

           MVKH    .S2     0xba9bfbb3,B4
||         MPYSP   .M1     A13,A4,A31        ; |128| 
||         MVKL    .S1     0xbc11371b,A28

           MPYSP   .M1     A8,A3,A16         ; |128| 
||         MPYSP   .M2X    B4,A4,B4          ; |128| 
||         MVKL    .S2     0x3e088889,B31
||         MVKH    .S1     0xbc11371b,A28

           MPYSP   .M1     A3,A4,A8          ; |128| 
||         MVKH    .S2     0x3e088889,B31

           MPYSP   .M1     A3,A3,A9          ; |128| 
||         MPYSP   .M2X    B31,A3,B9         ; |128| 
||         MVKL    .S2     0xbd5d0dd1,B30

           MVKL    .S2     0x3b64dc30,B29
           MVKH    .S2     0xbd5d0dd1,B30

           ADDSP   .L2X    B4,A16,B6         ; |128| 
||         MPYSP   .M1     A3,A8,A29         ; |128| 
||         MVKH    .S2     0x3b64dc30,B29

           MPYSP   .M2X    B30,A8,B5         ; |128| 
           MPYSP   .M1     A3,A9,A30         ; |128| 
           MPYSP   .M2X    B12,A9,B7         ; |128| 
           ADDSP   .L2     B29,B6,B4         ; |128| 
           ADDSP   .L1X    A31,B9,A9         ; |128| 
           MPYSP   .M1     A28,A29,A3        ; |128| 
           ADDSP   .L2     B5,B7,B5          ; |128| 
           MPYSP   .M2X    A30,B4,B4         ; |128| 
           NOP             2
           ADDSP   .L2X    A9,B5,B5          ; |128| 
           ADDSP   .L2X    A3,B4,B4          ; |128| 
           NOP             3
           ADDSP   .L2     B4,B5,B4          ; |128| 
           NOP             3
           MPYSP   .M2X    A5,B4,B4          ; |128| 
           NOP             3
           ADDSP   .L2X    A5,B4,B4          ; |128| 
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 4
           MVKL    .S1     _t_start,A3
           MVKL    .S2     _output+12,B5
           NOP             1
           MPYSP   .M2     B8,B4,B4          ; |213| 
;** --------------------------------------------------------------------------*
$C$L23:    
;          EXCLUSIVE CPU CYCLES: 24
           MVKH    .S2     _output+12,B5
           LDW     .D2T2   *B5,B5            ; |213| 
           MVKH    .S1     _t_start,A3
           STDW    .D1T1   A7:A6,*A3
           NOP             2
           ADD     .L2     B13,B5,B5         ; |213| 

           STW     .D2T2   B4,*B5            ; |213| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     _t_offset,A15
||         LDW     .D2T1   *+SP(12),A31      ; |128| 
||         MVKL    .S2     _cycle_counts+24,B5
||         MV      .L2     B4,B9             ; |128| 

           MVKH    .S1     _t_offset,A15
||         MVKH    .S2     _cycle_counts+24,B5
||         ADD     .L2     4,B13,B13         ; |207| 

           LDDW    .D1T1   *A15,A9:A8        ; |130| 
||         LDDW    .D2T2   *B5,B7:B6         ; |130| 
||         MVKL    .S1     _t_stop,A3

           MV      .L1X    B5,A14            ; |130| 
||         MVKH    .S1     _t_stop,A3

           STDW    .D1T2   B9:B8,*A3         ; |128| 
           SUB     .L1     A31,1,A0          ; |207| 
           STW     .D2T1   A0,*+SP(12)       ; |130| 
           ADDU    .L1     A8,A6,A5:A4       ; |130| 
           ADD     .L1     A5,A9,A5          ; |130| 

           SUBU    .L2X    B8,A4,B5:B4       ; |130| 
||         ADD     .L1     A5,A7,A4          ; |130| 
|| [ A0]   B       .S1     $C$L19            ; |207| 

           EXT     .S2     B5,24,24,B16      ; |130| 
||         ADDU    .L2     B6,B4,B5:B4       ; |130| 

   [ A0]   CALL    .S1     _gimme_random     ; |209| 
||         SUB     .L2X    B9,A4,B6          ; |130| 
||         ADD     .S2     B5,B7,B5          ; |130| 
|| [ A0]   ZERO    .L1     A4

           ADD     .L2     B6,B16,B6         ; |130| 
|| [ A0]   MVKH    .S1     0x41a00000,A4

           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D1T2   B5:B4,*A14        ; |130| 
|| [ A0]   ZERO    .L2     B4

           ; BRANCHCC OCCURS {$C$L19}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL24,B3,3      ; |135| 
$C$RL24:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
           CALLP   .S2     __fixdlli,B3
$C$RL25:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11

           MVK     .S2     24,B5
||         MV      .L2X    A14,B4

           SUB     .L2X    A14,B5,B5
||         STDW    .D2T1   A5:A4,*B4         ; |135| 
||         MV      .S2     B11,B31           ; |114| 

           MVC     .S2     B31,TSCL          ; |115| 
||         STDW    .D2T1   A11:A10,*B5       ; |114| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 
||         MVK     .S1     0x80,A3

           STDW    .D1T2   B7:B6,*A15        ; |117| 
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
$C$L24:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |222| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |222| 
||         CALL    .S1     _tanhf            ; |222| 

           LDW     .D1T1   *A3,A4            ; |222| 
           ADDKPC  .S2     $C$RL26,B3,3      ; |222| 
$C$RL26:   ; CALL OCCURS {_tanhf} {0}        ; |222| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output,B13
           MVKH    .S2     _output,B13
           LDW     .D2T2   *B13,B4           ; |222| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |222| 

           STW     .D1T1   A4,*A3            ; |222| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_start,B5
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         MVKL    .S1     _cycle_counts,A3
||         SUB     .L1     A14,1,A0          ; |220| 
||         MV      .L2     B4,B17            ; |128| 

           MVKH    .S2     _t_start,B5
||         MVKH    .S1     _cycle_counts,A3
||         SUB     .L1     A14,1,A14         ; |220| 
||         ADD     .D1     4,A12,A12         ; |220| 

           LDDW    .D2T2   *B5,B7:B6         ; |130| 
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S2     _cycle_counts,B4
||         MVKL    .S1     _t_stop,A31

           MVKH    .S1     _t_stop,A31
           MVKH    .S2     _cycle_counts,B4
           STDW    .D1T2   B17:B16,*A31      ; |128| 
   [!A0]   MV      .L1X    B4,A14
           ADDU    .L2X    A4,B6,B9:B8       ; |130| 

           ADD     .S2X    B9,A5,B5          ; |130| 
|| [ A0]   B       .S1     $C$L24            ; |220| 
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

           ; BRANCHCC OCCURS {$C$L24}        ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL27,B3,3      ; |135| 
$C$RL27:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
$C$RL28:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A14(16) ; |114| 
||         MV      .L2     B11,B4            ; |114| 

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
$C$L25:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |231| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |231| 
||         CALL    .S1     _tanhsp_c         ; |231| 

           LDW     .D1T1   *A3,A4            ; |231| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |231| 
$C$RL29:   ; CALL OCCURS {_tanhsp_c} {0}     ; |231| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADDAD   .D2     B13,1,B4
           LDW     .D2T2   *B4,B4            ; |231| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |231| 

           STW     .D1T1   A4,*A3            ; |231| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_start,B5
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         SUB     .L1X    B11,1,A0          ; |229| 
||         MV      .L2     B4,B17            ; |128| 
||         MVKL    .S1     _t_stop,A31
||         SUB     .D2     B11,1,B11         ; |229| 

           MVKH    .S2     _t_start,B5
||         ADDAD   .D1     A14,2,A3
||         MVKH    .S1     _t_stop,A31
||         ADD     .L1     4,A12,A12         ; |229| 

           LDDW    .D2T2   *B5,B7:B6         ; |130| 
           MVK     .S2     16,B12
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADD     .L2X    A14,B12,B12
           ADDU    .L2X    A4,B6,B9:B8       ; |130| 

           ADD     .S2X    B9,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L25            ; |229| 
||         SUBU    .L2     B16,B8,B5:B4      ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B31      ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B6,B7         ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B7,B31,B6         ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B12        ; |130| 

           ; BRANCHCC OCCURS {$C$L25}        ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(16),A5:A4   ; |135| 
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

           ADD     .L2     B4,B5,B7          ; |117| 
||         MVK     .S1     0x80,A3

           STDW    .D1T2   B7:B6,*A15        ; |117| 
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
$C$L26:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |240| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |240| 
||         CALL    .S1     _tanhsp           ; |240| 

           LDW     .D1T1   *A3,A4            ; |240| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |240| 
$C$RL32:   ; CALL OCCURS {_tanhsp} {0}       ; |240| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 23
           ADD     .L2     4,B13,B4
           LDW     .D2T2   *B4,B4            ; |240| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |240| 

           STW     .D1T1   A4,*A3            ; |240| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_start,B11
||         LDW     .D2T1   *+SP(12),A30      ; |128| 
||         ADDAD   .D1     A14,1,A3
||         MV      .L2     B4,B9             ; |128| 
||         MVKL    .S1     _t_stop,A31
||         ADD     .L1     4,A12,A12         ; |238| 

           MVKH    .S2     _t_start,B11
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         MVKH    .S1     _t_stop,A31

           MV      .L2X    A3,B12            ; |128| 
||         LDDW    .D2T2   *B11,B17:B16      ; |130| 

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B9:B8,*A31        ; |128| 
           SUB     .L1     A30,1,A0          ; |238| 
           STW     .D2T1   A0,*+SP(12)       ; |130| 
           ADDU    .L2X    A4,B16,B7:B6      ; |130| 

           SUBU    .L2     B8,B6,B5:B4       ; |130| 
||         ADD     .S2X    B7,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L26            ; |238| 

           ADD     .D2     B6,B17,B6         ; |130| 
||         EXT     .S2     B5,24,24,B31      ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B9,B6,B7          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B7,B31,B6         ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B12        ; |130| 

           ; BRANCHCC OCCURS {$C$L26}        ; |238| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(8),A5:A4    ; |135| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |135| 
$C$RL33:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 109
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A11,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL34:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 

           MV      .L2X    A10,B4            ; |114| 
||         MV      .L1X    B12,A12           ; |135| 
||         STDW    .D1T1   A11:A10,*+A14(32) ; |114| 

           STDW    .D1T1   A5:A4,*A12        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B9             ; |116| 

           STDW    .D2T2   B9:B8,*B11        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B7           ; |117| 

           MVKL    .S1     _input,A3
||         SUBU    .L2     B4,B8,B5:B4       ; |117| 

           MVKH    .S1     _input,A3
||         EXT     .S2     B5,24,24,B7       ; |117| 
||         SUB     .L2     B7,B9,B5          ; |117| 

           ADD     .L2     B5,B7,B5          ; |117| 

           MV      .L2X    A3,B6             ; |247| 
||         MV      .L1X    B13,A10           ; |117| 
||         STDW    .D1T2   B5:B4,*A15        ; |117| 

           CALLP   .S2     _tanhsp_v,B3
||         LDW     .D2T1   *B6,A4            ; |247| 
||         LDW     .D1T2   *+A10(16),B4      ; |247| 
||         MVK     .S1     0x80,A6           ; |247| 

$C$RL35:   ; CALL OCCURS {_tanhsp_v} {0}     ; |247| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B6           ; |128| 

           LDDW    .D1T1   *A15,A7:A6        ; |130| 
||         LDDW    .D2T2   *B11,B5:B4        ; |130| 

           MVK     .S2     24,B11
           ADD     .L2X    A12,B11,B11
           MV      .L2     B6,B17            ; |128| 
           LDDW    .D2T2   *B11,B7:B6        ; |130| 
           ADDU    .L1X    A6,B4,A5:A4       ; |130| 
           ADD     .L1     A5,A7,A3          ; |130| 
           SUBU    .L1X    B16,A4,A5:A4      ; |130| 

           ADD     .L2X    A3,B5,B4          ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           ADDU    .L1X    B6,A4,A5:A4       ; |130| 
||         SUB     .L2     B17,B4,B4         ; |130| 

           ADD     .L2X    B4,A3,B5          ; |130| 
           ADD     .L2X    A5,B7,B4          ; |130| 

           ADD     .L2     B4,B5,B4          ; |130| 
||         MVKL    .S2     _t_stop,B8

           MVKH    .S2     _t_stop,B8

           CALLP   .S2     __fltllif,B3
||         MV      .L1X    B4,A5             ; |130| 
||         STDW    .D2T2   B17:B16,*B8       ; |128| 

$C$RL36:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A11,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL37:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A6             ; |130| 
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MV      .S1     A5,A7             ; |130| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         STDW    .D2T1   A7:A6,*B11        ; |130| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL38:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVKL    .S1     _fcn_pass,A11
||         MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S1     _fcn_pass,A11
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A5,*+A11(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL39:   ; CALL OCCURS {_isequal} {0}      ; |67| 
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

$C$RL40:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D1T1   A4,*+A11(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |69| 
||         LDW     .D2T2   *B10,B4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL41:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2X    4,A11,B4
           LDW     .D2T2   *B4,B0            ; |72| 
           STW     .D1T1   A4,*+A11(16)      ; |69| 
           ADD     .L2X    8,A11,B4
           NOP             2

   [!B0]   BNOP    .S1     $C$L27,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           ; BRANCHCC OCCURS {$C$L27}        ; |72| 
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
   [ A0]   B       .S1     $C$L28            ; |72| 
   [ A0]   CALL    .S1     _print_test_results ; |253| 
   [ A0]   MVKL    .S1     _all_pass,A3
   [ A0]   MVKH    .S1     _all_pass,A3
           NOP             2
           ; BRANCHCC OCCURS {$C$L28}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L27:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |253| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           MV      .L1     A12,A4
           NOP             1
;** --------------------------------------------------------------------------*
$C$L28:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x2,A4            ; |253| 
||         ADDKPC  .S2     $C$RL42,B3,0      ; |253| 

$C$RL42:   ; CALL OCCURS {_print_test_results} {0}  ; |253| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |254| 

$C$RL43:   ; CALL OCCURS {_printf} {0}       ; |254| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |254| 

$C$RL44:   ; CALL OCCURS {_printf} {0}       ; |254| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |261| 

$C$RL45:   ; CALL OCCURS {_print_profile_results} {0}  ; |261| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |264| 

$C$RL46:   ; CALL OCCURS {_print_memory_results} {0}  ; |264| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(24),B3      ; |265| 
           LDDW    .D2T1   *++SP,A13:A12     ; |265| 
           LDDW    .D2T1   *++SP,A15:A14     ; |265| 
           LDDW    .D2T2   *++SP,B11:B10     ; |265| 
           LDDW    .D2T2   *++SP,B13:B12     ; |265| 

           LDW     .D2T1   *++SP(8),A10      ; |265| 
||         RET     .S2     B3                ; |265| 

           LDW     .D2T1   *++SP(8),A11      ; |265| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |265| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"tanhSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_tanhf
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_tanhsp_c
	.global	_tanhsp
	.global	_tanhsp_v
	.global	_ti_math_kTable
	.global	_ti_math_jTable
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
