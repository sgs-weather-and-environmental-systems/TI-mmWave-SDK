;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:45:51 2016                                *
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
	.word	0c123972fh		; _a[0] @ 0
	.word	0c2289da2h		; _a[1] @ 32
	.word	0428e08cdh		; _a[2] @ 64
	.word	041135bd1h		; _a[3] @ 96
	.word	0425f6ed4h		; _a[4] @ 128
	.word	0c2a64e0bh		; _a[5] @ 160
	.word	0c2a1417ch		; _a[6] @ 192
	.word	0c144f58bh		; _a[7] @ 224
	.word	0c0ecceebh		; _a[8] @ 256
	.word	042922475h		; _a[9] @ 288
	.word	0c26f31cdh		; _a[10] @ 320
	.word	0c2537aefh		; _a[11] @ 352
	.word	0c27490b3h		; _a[12] @ 384
	.word	0429c7456h		; _a[13] @ 416
	.word	0423631adh		; _a[14] @ 448
	.word	0411af942h		; _a[15] @ 480
	.word	0c1a76a52h		; _a[16] @ 512
	.word	0c28e53d3h		; _a[17] @ 544
	.word	042b6edf9h		; _a[18] @ 576
	.word	0422c6c2ch		; _a[19] @ 608
	.word	0c262f247h		; _a[20] @ 640
	.word	0c219de6dh		; _a[21] @ 672
	.word	0429d9faah		; _a[22] @ 704
	.word	0426c9dc8h		; _a[23] @ 736
	.word	03f485c12h		; _a[24] @ 768
	.word	042737909h		; _a[25] @ 800
	.word	0c24a9d59h		; _a[26] @ 832
	.word	04127e7aah		; _a[27] @ 864
	.word	04289cecdh		; _a[28] @ 896
	.word	042512e2ah		; _a[29] @ 928
	.word	0c100b9b5h		; _a[30] @ 960
	.word	0c0450b4fh		; _a[31] @ 992
	.word	040d2a4f9h		; _a[32] @ 1024
	.word	0c2ba5245h		; _a[33] @ 1056
	.word	04214d8b6h		; _a[34] @ 1088
	.word	04275ed94h		; _a[35] @ 1120
	.word	0418647ech		; _a[36] @ 1152
	.word	0c274e6b8h		; _a[37] @ 1184
	.word	04271f2d7h		; _a[38] @ 1216
	.word	0c13e5ac8h		; _a[39] @ 1248
	.word	04236e3cch		; _a[40] @ 1280
	.word	0409a2690h		; _a[41] @ 1312
	.word	0c196a7a8h		; _a[42] @ 1344
	.word	0c2bb6408h		; _a[43] @ 1376
	.word	0c17995dch		; _a[44] @ 1408
	.word	0c2b971e5h		; _a[45] @ 1440
	.word	0426e2873h		; _a[46] @ 1472
	.word	042b659ebh		; _a[47] @ 1504
	.word	04287ae63h		; _a[48] @ 1536
	.word	0c1115d15h		; _a[49] @ 1568
	.word	0c2c0664eh		; _a[50] @ 1600
	.word	0c22527bdh		; _a[51] @ 1632
	.word	0429181a0h		; _a[52] @ 1664
	.word	0c257bb0ah		; _a[53] @ 1696
	.word	0427c3cd0h		; _a[54] @ 1728
	.word	0428cf43ch		; _a[55] @ 1760
	.word	0c29b9ef4h		; _a[56] @ 1792
	.word	0401a62d1h		; _a[57] @ 1824
	.word	041fff8f0h		; _a[58] @ 1856
	.word	0c28b01e6h		; _a[59] @ 1888
	.word	042a1ca5bh		; _a[60] @ 1920
	.word	0c2707018h		; _a[61] @ 1952
	.word	042359b83h		; _a[62] @ 1984
	.word	0c1465c05h		; _a[63] @ 2016
	.word	0c22344ach		; _a[64] @ 2048
	.word	0429b8b7fh		; _a[65] @ 2080
	.word	042af1ee0h		; _a[66] @ 2112
	.word	042076942h		; _a[67] @ 2144
	.word	0c2b5e602h		; _a[68] @ 2176
	.word	0429d23f5h		; _a[69] @ 2208
	.word	042a4277dh		; _a[70] @ 2240
	.word	040aa90f9h		; _a[71] @ 2272
	.word	041e08fb2h		; _a[72] @ 2304
	.word	0c24042b4h		; _a[73] @ 2336
	.word	042c44f8ah		; _a[74] @ 2368
	.word	0c19b6bfbh		; _a[75] @ 2400
	.word	0c2320857h		; _a[76] @ 2432
	.word	04241a965h		; _a[77] @ 2464
	.word	0c2524059h		; _a[78] @ 2496
	.word	0c1826e8ah		; _a[79] @ 2528
	.word	0429b6ac1h		; _a[80] @ 2560
	.word	0427d698eh		; _a[81] @ 2592
	.word	0c14d8be2h		; _a[82] @ 2624
	.word	0c18f84a9h		; _a[83] @ 2656
	.word	0c29bfc0bh		; _a[84] @ 2688
	.word	0420d5c13h		; _a[85] @ 2720
	.word	0c2a79273h		; _a[86] @ 2752
	.word	042ae14c6h		; _a[87] @ 2784
	.word	0c2213c52h		; _a[88] @ 2816
	.word	0c24ddbe3h		; _a[89] @ 2848
	.word	0c1ad7acfh		; _a[90] @ 2880
	.word	0c23e27d5h		; _a[91] @ 2912
	.word	040dba8f6h		; _a[92] @ 2944
	.word	0c28e6eb0h		; _a[93] @ 2976
	.word	0c21822c1h		; _a[94] @ 3008
	.word	0c1b8599ah		; _a[95] @ 3040
	.word	041aa7a21h		; _a[96] @ 3072
	.word	04234a099h		; _a[97] @ 3104
	.word	0c0299e75h		; _a[98] @ 3136
	.word	0c2c4c52fh		; _a[99] @ 3168
	.word	0c2b68c4ah		; _a[100] @ 3200
	.word	0c2add0bdh		; _a[101] @ 3232
	.word	0c2223cb6h		; _a[102] @ 3264
	.word	0416aa2b5h		; _a[103] @ 3296
	.word	0c2abb107h		; _a[104] @ 3328
	.word	042b4fd69h		; _a[105] @ 3360
	.word	042880945h		; _a[106] @ 3392
	.word	0c25e3922h		; _a[107] @ 3424
	.word	041e1b12ch		; _a[108] @ 3456
	.word	04299dac7h		; _a[109] @ 3488
	.word	042a91497h		; _a[110] @ 3520
	.word	0427a289bh		; _a[111] @ 3552
	.word	0c15b1681h		; _a[112] @ 3584
	.word	0c2a0381bh		; _a[113] @ 3616
	.word	0c2a7edc3h		; _a[114] @ 3648
	.word	042b2771eh		; _a[115] @ 3680
	.word	04284a3afh		; _a[116] @ 3712
	.word	040f87b6fh		; _a[117] @ 3744
	.word	0413ff1b3h		; _a[118] @ 3776
	.word	042a8464bh		; _a[119] @ 3808
	.word	042b12753h		; _a[120] @ 3840
	.word	04291ef3ch		; _a[121] @ 3872
	.word	0c20b5c39h		; _a[122] @ 3904
	.word	0424b964fh		; _a[123] @ 3936
	.word	0419e1b10h		; _a[124] @ 3968
	.word	0c1015da8h		; _a[125] @ 4000
	.word	0c2aaca1bh		; _a[126] @ 4032
	.word	0c272003fh		; _a[127] @ 4064
	.word	0c1f17b5dh		; _a[128] @ 4096
	.word	0c16f22a6h		; _a[129] @ 4128
	.word	0c26eb93ch		; _a[130] @ 4160
	.word	042235e49h		; _a[131] @ 4192
	.word	0c11abf7bh		; _a[132] @ 4224
	.word	04186d17dh		; _a[133] @ 4256
	.word	042894c22h		; _a[134] @ 4288
	.word	0c0fa3b68h		; _a[135] @ 4320
	.word	0429e8bf4h		; _a[136] @ 4352
	.word	0c0b8b804h		; _a[137] @ 4384
	.word	042841c37h		; _a[138] @ 4416
	.word	0c1e2c57ah		; _a[139] @ 4448
	.word	0c1b77482h		; _a[140] @ 4480
	.word	0c1f8dae6h		; _a[141] @ 4512
	.word	0423bad7bh		; _a[142] @ 4544
	.word	0c2c20207h		; _a[143] @ 4576
	.word	0c20282c0h		; _a[144] @ 4608
	.word	0c27da571h		; _a[145] @ 4640
	.word	042850aa9h		; _a[146] @ 4672
	.word	04257cc37h		; _a[147] @ 4704
	.word	0429ed829h		; _a[148] @ 4736
	.word	042112aa0h		; _a[149] @ 4768
	.word	0c29301f7h		; _a[150] @ 4800
	.word	0420e0375h		; _a[151] @ 4832
	.word	042a8474fh		; _a[152] @ 4864
	.word	0c2472567h		; _a[153] @ 4896
	.word	0c200baa4h		; _a[154] @ 4928
	.word	03f8be27ch		; _a[155] @ 4960
	.word	042c274cah		; _a[156] @ 4992
	.word	0c2bd462eh		; _a[157] @ 5024
	.word	0429ec31fh		; _a[158] @ 5056
	.word	0424a1724h		; _a[159] @ 5088
	.word	0c1b2d29dh		; _a[160] @ 5120
	.word	0428e6b40h		; _a[161] @ 5152
	.word	042b910f9h		; _a[162] @ 5184
	.word	041ca23e9h		; _a[163] @ 5216
	.word	0c28c24b7h		; _a[164] @ 5248
	.word	0c211aab6h		; _a[165] @ 5280
	.word	0c1910cedh		; _a[166] @ 5312
	.word	0c2b0c949h		; _a[167] @ 5344
	.word	042c56d90h		; _a[168] @ 5376
	.word	04219b051h		; _a[169] @ 5408
	.word	04283fb0bh		; _a[170] @ 5440
	.word	0421918cbh		; _a[171] @ 5472
	.word	0c1bb6a74h		; _a[172] @ 5504
	.word	042c41471h		; _a[173] @ 5536
	.word	04104ed34h		; _a[174] @ 5568
	.word	0429f28bfh		; _a[175] @ 5600
	.word	0c041c80ch		; _a[176] @ 5632
	.word	042aff0fch		; _a[177] @ 5664
	.word	0415e6cc6h		; _a[178] @ 5696
	.word	042512c95h		; _a[179] @ 5728
	.word	0c27751a1h		; _a[180] @ 5760
	.word	042bedfc3h		; _a[181] @ 5792
	.word	04205bc34h		; _a[182] @ 5824
	.word	0c2a8b63ah		; _a[183] @ 5856
	.word	0c29ca9f7h		; _a[184] @ 5888
	.word	0c231b5a5h		; _a[185] @ 5920
	.word	0c21fe6cdh		; _a[186] @ 5952
	.word	0c1ad3d89h		; _a[187] @ 5984
	.word	0414fd369h		; _a[188] @ 6016
	.word	04231b27fh		; _a[189] @ 6048
	.word	041f67ce2h		; _a[190] @ 6080
	.word	042aaa27ch		; _a[191] @ 6112
	.word	041ad51d4h		; _a[192] @ 6144
	.word	042a0f023h		; _a[193] @ 6176
	.word	041ddd93fh		; _a[194] @ 6208
	.word	041f17881h		; _a[195] @ 6240
	.word	0c2c57cd2h		; _a[196] @ 6272
	.word	0c28d4b3dh		; _a[197] @ 6304
	.word	04297e956h		; _a[198] @ 6336
	.word	0c24f0a04h		; _a[199] @ 6368
	.word	0c250e9b0h		; _a[200] @ 6400
$C$IR_1:	.set	804

	.global	_a
_a:	.usect	".far",804,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\017405 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\017407 
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
;*   Local Frame Size  : 8 Args + 64 Auto + 56 Save = 128 byte                *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |112| 
           STW     .D2T1   A10,*SP--(8)      ; |112| 
           STDW    .D2T2   B13:B12,*SP--     ; |112| 
           STDW    .D2T2   B11:B10,*SP--     ; |112| 
           STDW    .D2T1   A15:A14,*SP--     ; |112| 

           STDW    .D2T1   A13:A12,*SP--     ; |112| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(80)      ; |112| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |120| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A12

           MVKH    .S1     _a,A12

           CALL    .S1     _exp2f            ; |129| 
||         MV      .L1     A12,A13
||         MV      .D1X    B4,A11
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A13++,A4         ; |129| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |129| 
$C$RL1:    ; CALL OCCURS {_exp2f} {0}        ; |129| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     _output,B4
||         SUB     .L1     A11,1,A0          ; |128| 
||         SUB     .S1     A11,1,A11         ; |128| 

           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |129| 
   [ A0]   BNOP    .S1     $C$L1,3           ; |128| 

           ADD     .L2     B10,B4,B4         ; |129| 
||         ADD     .S2     4,B10,B10         ; |128| 

   [ A0]   CALL    .S1     _exp2f            ; |129| 
||         STW     .D2T1   A4,*B4            ; |129| 
|| [!A0]   MVKL    .S2     _output,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |128| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           MVK     .S2     0xc9,B5
||         ZERO    .L2     B10
||         MV      .L1     A12,A10

           MVKH    .S2     _output,B4

           ADD     .L2     4,B4,B4
||         MV      .L1X    B5,A11

           STW     .D2T2   B4,*+SP(52)
||         CALL    .S1     _exp2sp           ; |132| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |132| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |132| 
$C$RL2:    ; CALL OCCURS {_exp2sp} {0}       ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(52),B4       ; |132| 
           SUB     .L1     A11,1,A0          ; |131| 
           SUB     .L1     A11,1,A11         ; |131| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |132| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |131| 

           ADD     .L2     B10,B4,B4         ; |132| 
||         ADD     .S2     4,B10,B10         ; |131| 

   [ A0]   CALL    .S1     _exp2sp           ; |132| 
||         STW     .D2T1   A4,*B4            ; |132| 

           ; BRANCHCC OCCURS {$C$L2}         ; |131| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(52),B4
           MVK     .S2     0xc9,B5
           ZERO    .L2     B10
           MV      .L1     A10,A12
           MV      .L1X    B5,A11
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(56)
||         CALL    .S1     _exp2sp_c         ; |135| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |135| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |135| 
$C$RL3:    ; CALL OCCURS {_exp2sp_c} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(56),B4       ; |135| 
||         SUB     .L1     A11,1,A0          ; |134| 
||         SUB     .S1     A11,1,A11         ; |134| 

   [!A0]   MVKL    .S1     0x3d4cbf5b,A3
|| [!A0]   LDW     .D2T2   *+SP(56),B6
|| [!A0]   MVKL    .S2     0xb95e8083,B5
|| [!A0]   ZERO    .L1     A5
|| [!A0]   ZERO    .D1     A13

   [!A0]   MVKH    .S1     0x3d4cbf5b,A3

   [!A0]   MVKL    .S1     0x3f317218,A6
|| [!A0]   STW     .D2T1   A3,*+SP(36)

   [!A0]   MVKL    .S1     0x7f7fffff,A3

           LDW     .D2T2   *B4,B4            ; |135| 
|| [!A0]   MVKH    .S1     0x3f317218,A6

   [ A0]   BNOP    .S1     $C$L3,3           ; |134| 

           ADD     .L2     B10,B4,B4         ; |135| 
||         ADD     .S2     4,B10,B10         ; |134| 

   [ A0]   CALL    .S2     _exp2sp_c         ; |135| 
||         STW     .D2T1   A4,*B4            ; |135| 
|| [!A0]   MVKL    .S1     0x3f318000,A4

           ; BRANCHCC OCCURS {$C$L3}         ; |134| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11

           MVKL    .S2     0x3fb8aa3b,B4
||         MVK     .S1     0x80,A7
||         ZERO    .L2     B12
||         ZERO    .D2     B7
||         ZERO    .L1     A14

           MVKH    .S1     0x30800000,A5
||         MVKL    .S2     0x3b885308,B11
||         MV      .L2X    A6,B26
||         STW     .D2T1   A6,*+SP(20)
||         ZERO    .L1     A6

           MVKH    .S1     0x43000000,A13
||         MVKH    .S2     0xb95e8083,B5
||         ADD     .L2     4,B6,B13
||         STW     .D2T1   A5,*+SP(24)

           MVKH    .S1     0x7f7fffff,A3
||         MVKH    .S2     0x3fb8aa3b,B4
||         STW     .D2T1   A7,*+SP(32)
||         MV      .L2X    A5,B24

           MVKH    .S1     0x3f318000,A4
||         MVKH    .S2     0x3b885308,B11
||         STW     .D2T2   B4,*+SP(16)
||         MV      .L2X    A13,B17

           MVKH    .S2     0x3e800000,B12
||         MVKH    .S1     0xc2fc0000,A14
||         STW     .D2T1   A4,*+SP(28)
||         MV      .L2X    A3,B18

           MVK     .S1     0xc9,A8
||         SET     .S2     B7,0x1e,0x1e,B6
||         STW     .D2T1   A3,*+SP(40)
||         MV      .L1     A14,A3
||         MV      .L2X    A4,B23

           SET     .S1     A6,0x18,0x1d,A5
||         MV      .L1X    B5,A6
||         SUB     .D1     A8,1,A0
||         LDW     .D2T2   *B13,B16
||         DINT                              ; interrupts off
||         MV      .L2     B4,B27

           LDW     .D2T1   *+SP(36),A4
||         MV      .L2X    A7,B22
||         MV      .S2     B11,B20

           STW     .D2T2   B5,*+SP(12)
||         MV      .L2     B6,B19
||         ZERO    .S2     B25

           MV      .L2X    A10,B9
||         MV      .S2     B12,B21

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/exp2sp/exp2sp_d.c
;*      Loop source line                 : 137
;*      Loop opening brace source line   : 137
;*      Loop closing brace source line   : 139
;*      Known Minimum Trip Count         : 201                    
;*      Known Maximum Trip Count         : 201                    
;*      Known Max Trip Count Factor      : 201
;*      Loop Carried Dependency Bound(^) : 95
;*      Unpartitioned Resource Bound     : 7
;*      Partitioned Resource Bound(*)    : 12
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        2     
;*      .S units                     2        5     
;*      .D units                     0        2     
;*      .M units                     2       12*    
;*      .X cross paths               3        3     
;*      .T address paths             0        2     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           1        7     (.L or .S unit)
;*      Addition ops (.LSD)          0        6     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             2        7     
;*      Bound(.L .S .D .LS .LSD)     1        8     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 95 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |*  ****                         |         *      ************    |
;*       1: |*  ****                         |         *      ************    |
;*       2: |*  ****                         |         *      ************    |
;*       3: |*  ****                         |         *      ************    |
;*       4: |*  ****                         |         *      ************    |
;*       5: |*  ****                         |         *      *************   |
;*       6: |*  ****                         |         *      *************   |
;*       7: |*  ****                         |         *      *************   |
;*       8: |*  ****                         |         *      *************   |
;*       9: |*  ****                         |    *    *      *************   |
;*      10: |*  ****                         |    **   *      *************   |
;*      11: |*  ****                         |*   *    *      *************   |
;*      12: |*  ****                         |    *    *      *************   |
;*      13: |*  ****                         |    *    *      *************   |
;*      14: |*  ****                         |    *    *      *************   |
;*      15: |*  ****                         |    *    *      *************   |
;*      16: |*  ****                         |    **   *      *************   |
;*      17: |*  ****                         |    *    *      *************   |
;*      18: |*  ****                         |    *    *      *************   |
;*      19: |*  ****                         |    *    *      *************   |
;*      20: |*  ****                         |    **   *      *************   |
;*      21: |*  ****                         |    **   *      *************   |
;*      22: |*  ****                         |    *   **      *************   |
;*      23: |*  ****                         |    *   **      *************   |
;*      24: |*  ****                         |    **  **      *************   |
;*      25: |*  ****                         |    **  **      *************   |
;*      26: |*  ****                         |    *   **      *************   |
;*      27: |*  ****                         |    *   **      *************   |
;*      28: |*  ****                         |    **  **      *************   |
;*      29: |*  *****                        |        **      *************   |
;*      30: |*  *****                        |        **      *************   |
;*      31: |*  *****                        |        **      *************   |
;*      32: |*  *****                        |    *   **      *************   |
;*      33: |*  ****                         |        **      *************   |
;*      34: |*  ****                         |        **      *************   |
;*      35: |*  ****                         |        **      *************   |
;*      36: |*  ****                         |     *  **      *************   |
;*      37: |*  ****                         |     *  **      *************   |
;*      38: |*  ****                         |     *  **      *************   |
;*      39: |*  ****                         |     *  **      *************   |
;*      40: |*  ****                         |    **  **      *************   |
;*      41: |*  ****                         |    **  **      *************   |
;*      42: |*  ****                         |     *  **      *************   |
;*      43: |*  ****                         |     *  **      *************   |
;*      44: |*  ****                         |    **  **      *************   |
;*      45: |*  *****                        |     *  **      *************   |
;*      46: |*  ****                         |     *  **      *************   |
;*      47: |*  ****                         |     *  **      *************   |
;*      48: |*  ****                         |    **  **      *************   |
;*      49: |*  *****                        |        **      *************   |
;*      50: |*  *****                        |        **      *************   |
;*      51: |*  *****                        |        **      *************   |
;*      52: |*  *****                        |     *  **      *************   |
;*      53: |*  ****                         |     *  **      *************   |
;*      54: |*  ****                         |     *  **      *************   |
;*      55: |*  ****                         |     *  **      *************   |
;*      56: |*  ****                         |     * ***      *************   |
;*      57: |*  ****                         |     *****      *************   |
;*      58: |*  ****                         |     *****      *************   |
;*      59: |*  ****                         |     *****      *************   |
;*      60: |*  ****                         |     *****      *************   |
;*      61: |*  ****                         |    ******      *************   |
;*      62: |*  ****                         |     *****      *************   |
;*      63: |*  ****                         |     *****      *************   |
;*      64: |*  ****                         |     *****      *************   |
;*      65: |*  ****                         |    ******      *************   |
;*      66: |*  ****                         |     * ***      *************   |
;*      67: |*  ****                         |     * ***      *************   |
;*      68: |*  ****                         |     * ***      *************   |
;*      69: |*  ****                         |     *****      *************   |
;*      70: |*  ****                         |     ** **      *************   |
;*      71: |*  ****                         |     ** **      *************   |
;*      72: |*  ****                         |     ** **      *************   |
;*      73: |*  ****                         |    *** **      *************   |
;*      74: |*  ****                         |     ** **      *************   |
;*      75: |*  ****                         |     ** **      *************   |
;*      76: |*  ****                         |     ** **      *************   |
;*      77: |*  ****                         |    *** **      *************   |
;*      78: |*  ****                         |     *  **      *************   |
;*      79: |*  ****                         |     *  **      *************   |
;*      80: |*  ****                         |     *  **      *************   |
;*      81: |*  ****                         |    **  **      *************   |
;*      82: |*  ****                         |        **      *************   |
;*      83: |*  ****                         |        **      *************   |
;*      84: |*  ****                         |        **      *************   |
;*      85: |*  ****                         |    *   **      *************   |
;*      86: |*  ****                         |        **      *************   |
;*      87: |*  ****                         |        **      *************   |
;*      88: |*  ****                         |        **      *************   |
;*      89: |** ****                         |    *   **      *************   |
;*      90: |*  ****                         |    *    *      *************   |
;*      91: |*  ****                         |    *    *      *************   |
;*      92: |*  ****                         |    *    *      *************   |
;*      93: |*  ****                         |*   *    *      ************    |
;*      94: |*  ****                         |    **   *      ************    |
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
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 0 + min_trip_cnt * 95 = 19095        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A0,1,A0
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C116:
;*   0              LDW     .D2T2   *B9++,B28         ; |53|  ^ 
;*   1              NOP             4
;*   5              MPYSP   .M2     B26,B28,B4        ; |53|  ^ 
;*   6              NOP             3
;*   9              ABSSP   .S2     B4,B5             ; |53|  ^ 
;*  10              CMPLTSP .S2     B5,B24,B0         ; |53|  ^ 
;*  11      [ B0]   MV      .L2     B25,B4            ; |53|  ^ 
;*  12              MPYSP   .M2     B27,B4,B5         ; |53|  ^ 
;*  13              NOP             3
;*  16              SPINT   .L2     B5,B5             ; |53|  ^ 
;*  17              NOP             3
;*  20              INTSP   .L2     B5,B5             ; |53|  ^ 
;*     ||           ADD     .S2     B22,B5,B5         ; |53| 
;*  21              SHL     .S2     B5,23,B8          ; |53| 
;*  22              NOP             2
;*  24              MPYSP   .M2     B23,B5,B5         ; |53|  ^ 
;*  25              MPYSP   .M1X    A6,B5,A7          ; |53| 
;*  26              NOP             2
;*  28              SUBSP   .L2     B4,B5,B4          ; |53|  ^ 
;*  29              NOP             3
;*  32              SUBSP   .L2X    B4,A7,B5          ; |53|  ^ 
;*  33              NOP             3
;*  36              MPYSP   .M2     B5,B5,B4          ; |53|  ^ 
;*  37              NOP             3
;*  40              MPYSP   .M2     B20,B4,B4         ; |53|  ^ 
;*  41              MPYSP   .M1X    A4,B4,A7          ; |53| 
;*  42              NOP             2
;*  44              ADDSP   .L2     B21,B4,B4         ; |53|  ^ 
;*  45              ADDSP   .L1     A5,A7,A7          ; |53| 
;*  46              NOP             2
;*  48              MPYSP   .M2     B5,B4,B5          ; |53|  ^ 
;*  49              NOP             3
;*  52              SUBSP   .L2X    A7,B5,B7          ; |53|  ^ 
;*  53              NOP             3
;*  56              RCPSP   .S2     B7,B6             ; |53|  ^ 
;*  57              MPYSP   .M2     B6,B7,B4          ; |53|  ^ 
;*  58              NOP             3
;*  61              SUBSP   .L2     B19,B4,B4         ; |53|  ^ 
;*  62              NOP             3
;*  65              MPYSP   .M2     B6,B4,B6          ; |53|  ^ 
;*  66              NOP             3
;*  69              MPYSP   .M2     B6,B7,B4          ; |53|  ^ 
;*  70              NOP             3
;*  73              SUBSP   .L2     B19,B4,B4         ; |53|  ^ 
;*  74              NOP             3
;*  77              MPYSP   .M2     B6,B4,B4          ; |53|  ^ 
;*  78              NOP             3
;*  81              MPYSP   .M2     B5,B4,B4          ; |53|  ^ 
;*  82              NOP             3
;*  85              ADDSP   .L2X    A5,B4,B4          ; |53|  ^ 
;*  86              NOP             2
;*  88              CMPLTSP .S1X    B28,A3,A1         ; |53| 
;*  89      [ A1]   MV      .L2     B25,B4            ; |53| 
;*     ||   [!A1]   MPYSP   .M2     B8,B4,B4          ; |53|  ^ 
;*     ||   [ A0]   BDEC    .S1     $C$C116,A0        ; |137| 
;*  90              NOP             2
;*  92              CMPGTSP .S2     B28,B17,B0        ; |53| 
;*  93      [!B0]   MV      .S2     B4,B5             ; |53|  ^ 
;*     ||   [ B0]   MV      .L2     B18,B5            ; |53| 
;*  94              STW     .D2T2   B5,*B16++         ; |53|  ^ 
;*  95              ; BRANCHCC OCCURS {$C$C116}       ; |137| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 95
           LDW     .D2T2   *B9++,B28         ; |53| <0,0>  ^ 
           NOP             4
           MPYSP   .M2     B26,B28,B4        ; |53| <0,5>  ^ 
           NOP             3
           ABSSP   .S2     B4,B5             ; |53| <0,9>  ^ 
           CMPLTSP .S2     B5,B24,B0         ; |53| <0,10>  ^ 
   [ B0]   MV      .L2     B25,B4            ; |53| <0,11>  ^ 
           MPYSP   .M2     B27,B4,B5         ; |53| <0,12>  ^ 
           NOP             3
           SPINT   .L2     B5,B5             ; |53| <0,16>  ^ 
           NOP             3

           ADD     .S2     B22,B5,B5         ; |53| <0,20> 
||         INTSP   .L2     B5,B5             ; |53| <0,20>  ^ 

           SHL     .S2     B5,23,B8          ; |53| <0,21> 
           NOP             2
           MPYSP   .M2     B23,B5,B5         ; |53| <0,24>  ^ 
           MPYSP   .M1X    A6,B5,A7          ; |53| <0,25> 
           NOP             2
           SUBSP   .L2     B4,B5,B4          ; |53| <0,28>  ^ 
           NOP             3
           SUBSP   .L2X    B4,A7,B5          ; |53| <0,32>  ^ 
           NOP             3
           MPYSP   .M2     B5,B5,B4          ; |53| <0,36>  ^ 
           NOP             3
           MPYSP   .M2     B20,B4,B4         ; |53| <0,40>  ^ 
           MPYSP   .M1X    A4,B4,A7          ; |53| <0,41> 
           NOP             2
           ADDSP   .L2     B21,B4,B4         ; |53| <0,44>  ^ 
           ADDSP   .L1     A5,A7,A7          ; |53| <0,45> 
           NOP             2
           MPYSP   .M2     B5,B4,B5          ; |53| <0,48>  ^ 
           NOP             3
           SUBSP   .L2X    A7,B5,B7          ; |53| <0,52>  ^ 
           NOP             3
           RCPSP   .S2     B7,B6             ; |53| <0,56>  ^ 
           MPYSP   .M2     B6,B7,B4          ; |53| <0,57>  ^ 
           NOP             3
           SUBSP   .L2     B19,B4,B4         ; |53| <0,61>  ^ 
           NOP             3
           MPYSP   .M2     B6,B4,B6          ; |53| <0,65>  ^ 
           NOP             3
           MPYSP   .M2     B6,B7,B4          ; |53| <0,69>  ^ 
           NOP             3
           SUBSP   .L2     B19,B4,B4         ; |53| <0,73>  ^ 
           NOP             3
           MPYSP   .M2     B6,B4,B4          ; |53| <0,77>  ^ 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |53| <0,81>  ^ 
           NOP             3
           ADDSP   .L2X    A5,B4,B4          ; |53| <0,85>  ^ 
           NOP             2
           CMPLTSP .S1X    B28,A3,A1         ; |53| <0,88> 

   [ A1]   MV      .L2     B25,B4            ; |53| <0,89> 
|| [ A0]   BDEC    .S1     $C$L5,A0          ; |137| <0,89> 
|| [!A1]   MPYSP   .M2     B8,B4,B4          ; |53| <0,89>  ^ 

           NOP             2
           CMPGTSP .S2     B28,B17,B0        ; |53| <0,92> 

   [ B0]   MV      .L2     B18,B5            ; |53| <0,93> 
|| [!B0]   MV      .S2     B4,B5             ; |53| <0,93>  ^ 

           STW     .D2T2   B5,*B16++         ; |53| <0,94>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           STW     .D2T1   A6,*+SP(12)
           STW     .D2T1   A4,*+SP(36)
           STW     .D2T2   B26,*+SP(20)
           STW     .D2T2   B24,*+SP(24)
           STW     .D2T2   B23,*+SP(28)

           MVKL    .S2     _output,B4
||         STW     .D2T2   B22,*+SP(32)

           MVKH    .S2     _output,B4
||         MV      .L2     B19,B10
||         STW     .D2T2   B18,*+SP(40)

           MV      .L1     A3,A14
||         MV      .S1     A5,A11
||         MV      .D1X    B17,A13
||         MV      .L2     B20,B11
||         STW     .D2T2   B27,*+SP(16)
||         RINT                              ; interrupts on

           CALLP   .S2     _exp2sp_v,B3
||         LDW     .D2T2   *+B4(16),B4       ; |140| 
||         MV      .L1     A10,A4            ; |140| 
||         MVK     .S1     0xc9,A6           ; |140| 
||         MV      .L2     B21,B12
||         MV      .D1X    B25,A12

$C$RL4:    ; CALL OCCURS {_exp2sp_v} {0}     ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 54
           MVKL    .S2     _output,B4
           MVKL    .S2     _output,B5
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     _output,B4
           MVKH    .S2     _output,B5
           MVKH    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B4(4),B4        ; |66| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B5,A4            ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _output,B4
           MVKL    .S2     _fcn_pass,B5
           MVKH    .S2     _output,B4

           LDW     .D2T2   *B4,B8            ; |67| 
||         MVKL    .S2     0x3ee4f8b5,B7

           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B4(8),B4        ; |67| 
||         MV      .L1X    B8,A4             ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .D1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B6

           MVKL    .S1     _output,A3
||         MVKL    .S2     0x3ee4f8b5,B7

           MVKH    .S1     _output,A3
||         MVKH    .S2     _fcn_pass,B6

           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L2X    A3,B4
||         STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0x88e368f1,B6

           MV      .L2X    A3,B5
||         LDW     .D2T2   *+B4(12),B4       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     _output,B4
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     _output,B4

           ADD     .L1X    4,B13,A3
||         STW     .D2T1   A4,*+B5(12)       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           STW     .D2T1   A3,*+SP(60)
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S2     _fcn_pass,B4
           MVKH    .S2     _fcn_pass,B4

           ADD     .L2     4,B4,B4
||         MVKL    .S2     _fcn_pass,B5

           LDW     .D2T2   *B4,B0            ; |72| 
           MVKH    .S2     _fcn_pass,B5
           STW     .D2T2   B4,*+SP(64)
           ADD     .L2     8,B5,B4
           STW     .D2T1   A4,*+B5(16)       ; |69| 

   [!B0]   MVKL    .S1     _all_pass,A3
|| [!B0]   B       .S2     $C$L7             ; |72| 
|| [!B0]   ZERO    .L1     A4                ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     _print_test_results ; |144| 
|| [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

           STW     .D2T2   B4,*+SP(68)       ; |69| 
   [ B1]   ADD     .L2     4,B4,B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L7}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   ZERO    .L1     A4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |144| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x1,A4            ; |144| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |144| 

$C$RL9:    ; CALL OCCURS {_print_test_results} {0}  ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVK     .L2     -1,B9             ; |157| 
||         ZERO    .D2     B7
||         MVKL    .S2     _a_sc,B4

           STW     .D2T2   B13,*+SP(48)
||         MVKH    .S2     _a_sc,B4
||         MV      .L2X    A12,B6            ; |152| 
||         MVK     .L1     0x7,A3

           STW     .D2T1   A3,*+SP(44)       ; |156| 
||         MV      .L2     B4,B8             ; |152| 
||         MVKL    .S2     0x7f7fffff,B31
||         ZERO    .L1     A5

           STW     .D2T2   B9,*+B8(24)       ; |157| 
||         MV      .L2     B8,B30            ; |154| 
||         MVKH    .S1     0xbf800000,A5
||         MVKH    .S2     0x80000000,B7
||         ZERO    .L1     A4

           STDW    .D2T2   B7:B6,*B30        ; |152| 
||         MVKH    .S2     0x7f7fffff,B31
||         SET     .S1     A4,0x17,0x1d,A4
||         ZERO    .L2     B5

           STDW    .D2T1   A5:A4,*+B30(16)   ; |156| 
||         ADD     .L2     1,B31,B4
||         MV      .L1X    B4,A10            ; |152| 
||         MVKH    .S2     0xff800000,B5

           STDW    .D2T2   B5:B4,*+B8(8)     ; |154| 
||         ZERO    .L2     B13

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
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D1T1   *A10,A3           ; |159| 
           CALL    .S1     _exp2             ; |159| 
           ADDKPC  .S2     $C$RL10,B3,2      ; |159| 
           SPDP    .S1     A3,A5:A4          ; |159| 
           NOP             1
$C$RL10:   ; CALL OCCURS {_exp2} {0}         ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |159| 
           DPSP    .L1     A5:A4,A3          ; |159| 
           NOP             3
           ADD     .L2     B13,B4,B4         ; |159| 
           STW     .D2T1   A3,*B4            ; |159| 

           CALLP   .S2     _exp2sp,B3
||         LDW     .D1T1   *A10,A4           ; |160| 

$C$RL11:   ; CALL OCCURS {_exp2sp} {0}       ; |160| 
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(4),B4        ; |160| 
           NOP             4
           ADD     .L2     B13,B4,B4         ; |160| 
           STW     .D2T1   A4,*B4            ; |160| 

           CALLP   .S2     _exp2sp_c,B3
||         LDW     .D1T1   *A10,A4           ; |161| 

$C$RL12:   ; CALL OCCURS {_exp2sp_c} {0}     ; |161| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 110
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(8),B4        ; |161| 
           LDW     .D2T1   *+SP(20),A3
           LDW     .D2T1   *+SP(24),A31      ; |83| 
           LDW     .D2T1   *+SP(16),A30      ; |84| 
           LDW     .D2T1   *+SP(28),A29
           ADD     .L2     B13,B4,B4         ; |161| 
           STW     .D2T1   A4,*B4            ; |161| 
           LDW     .D1T1   *A10++,A5         ; |162| 
           LDW     .D2T2   *+SP(12),B31      ; |95| 
           LDW     .D2T1   *+SP(36),A28
           LDW     .D2T2   *+SP(48),B30
           LDW     .D2T1   *+SP(44),A26      ; |106| 
           MPYSP   .M1     A3,A5,A4          ; |80| 
           LDW     .D2T1   *+SP(32),A27
           CMPLTSP .S1     A5,A14,A1         ; |100| 
           CMPGTSP .S1     A5,A13,A2         ; |105| 
           ABSSP   .S1     A4,A6             ; |83| 
           CMPLTSP .S1     A6,A31,A0         ; |83| 
   [ A0]   MV      .L1     A12,A4            ; |84| 
           MPYSP   .M1     A30,A4,A3         ; |95| 
           SUB     .L1     A26,1,A0          ; |158| 
           STW     .D2T1   A0,*+SP(44)       ; |162| 
           NOP             1
           SPINT   .L1     A3,A7             ; |95| 
           NOP             3
           INTSP   .L1     A7,A6             ; |95| 
           NOP             3
           MPYSP   .M1     A29,A6,A3         ; |95| 
           MPYSP   .M2X    B31,A6,B4         ; |95| 
           NOP             2
           SUBSP   .L1     A4,A3,A3          ; |95| 
           NOP             4
           SUBSP   .L2X    A3,B4,B4          ; |95| 
           NOP             3
           MPYSP   .M2     B4,B4,B5          ; |95| 
           NOP             3
           MPYSP   .M2     B11,B5,B6         ; |95| 
           MPYSP   .M1X    A28,B5,A3         ; |95| 
           NOP             2
           ADDSP   .L2     B12,B6,B5         ; |95| 
           ADDSP   .L1     A11,A3,A3         ; |95| 
           NOP             2
           MPYSP   .M2     B4,B5,B5          ; |95| 
           NOP             3
           SUBSP   .L2X    A3,B5,B4          ; |95| 
           ADD     .L1     A27,A7,A3         ; |97| 
           SHL     .S1     A3,23,A3          ; |97| 
           NOP             1
           RCPSP   .S2     B4,B6             ; |53| 
           MPYSP   .M2     B4,B6,B7          ; |53| 
           NOP             3
           SUBSP   .L2     B10,B7,B7         ; |53| 
           NOP             3
           MPYSP   .M2     B6,B7,B6          ; |53| 
           NOP             3
           MPYSP   .M2     B4,B6,B4          ; |53| 
           NOP             3
           SUBSP   .L2     B10,B4,B4         ; |53| 
           NOP             3
           MPYSP   .M2     B6,B4,B4          ; |53| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |53| 
           NOP             4

           ADDSP   .L1X    A11,B4,A4         ; |97| 
||         LDW     .D2T2   *B30,B4           ; |162| 

           NOP             3
           MPYSP   .M1     A3,A4,A4          ; |97| 

           ADD     .L2     B13,B4,B4         ; |162| 
||         ADD     .S2     4,B13,B13         ; |158| 

   [!A0]   MVKL    .S2     _output,B13
   [!A0]   MVKH    .S2     _output,B13

   [ A0]   BNOP    .S1     $C$L8,4           ; |158| 
|| [ A1]   MV      .L1     A12,A4            ; |101| 
|| [ A2]   LDW     .D2T1   *+SP(40),A4       ; |101| 

   [!A0]   CALL    .S1     _exp2sp_v         ; |164| 
||         STW     .D2T1   A4,*B4            ; |162| 

           ; BRANCHCC OCCURS {$C$L8}         ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B13(16),B4      ; |164| 
           MVKL    .S1     _a_sc,A4
           MVKH    .S1     _a_sc,A4
           MVK     .L1     0x7,A6            ; |164| 
           ADDKPC  .S2     $C$RL13,B3,0      ; |164| 
$C$RL13:   ; CALL OCCURS {_exp2sp_v} {0}     ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *B13,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MVK     .L1     0x7,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     _fcn_pass,B5
           MVKL    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .L1     0x7,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L1X    B13,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVK     .L1     0x7,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {_isequal} {0}      ; |68| 

           LDW     .D2T1   *+SP(60),A3       ; |68| 
||         MVKL    .S2     _fcn_pass,B4

           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     _fcn_pass,B4

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           MV      .L2     B13,B5            ; |68| 
||         STW     .D2T1   A3,*+SP(48)       ; |68| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B5,A4            ; |69| 
||         MVK     .L1     0x7,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL17:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(64),A3       ; |69| 
           LDW     .D2T2   *+SP(68),B13
           MVKL    .S2     _fcn_pass,B4
           MVKH    .S2     _fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A3,*+SP(72)       ; |69| 
           NOP             3

   [!A0]   B       .S1     $C$L9             ; |72| 
|| [ A0]   LDW     .D2T2   *B13,B0           ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |168| 
   [ A0]   ADD     .L2     4,B13,B4
   [!A0]   ZERO    .L1     A4                ; |72| 
   [!A0]   MVKL    .S1     _all_pass,A3
   [!A0]   MVKH    .S1     _all_pass,A3
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   ZERO    .L1     A4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |168| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |168| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |168| 

$C$RL18:   ; CALL OCCURS {_print_test_results} {0}  ; |168| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           MVKL    .S1     _a_ext,A3
           MVKH    .S1     _a_ext,A3

           ZERO    .L1     A4
||         MVK     .S2     0xed,B31

           MV      .L2X    A3,B4             ; |171| 
||         SET     .S1     A4,0x17,0x17,A4
||         STW     .D2T2   B31,*+SP(44)      ; |171| 

           STW     .D2T1   A4,*B4            ; |171| 
||         MV      .L1     A3,A10            ; |171| 

           LDW     .D1T1   *A10,A3           ; |173| 
           CALL    .S1     _exp2             ; |173| 
           ZERO    .L1     A15
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |173| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL19,B3,0      ; |173| 
$C$RL19:   ; CALL OCCURS {_exp2} {0}         ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |173| 
           DPSP    .L1     A5:A4,A4          ; |173| 
           ZERO    .L2     B31
           MVKH    .S2     0xc3800000,B31
           NOP             1
           ADD     .L1X    A15,B4,A3         ; |173| 
           STW     .D1T1   A4,*A3            ; |173| 
           LDW     .D1T1   *A10,A4           ; |174| 
           NOP             4
           CMPGTSP .S2X    A4,B31,B0         ; |174| 
   [!B0]   B       .S1     $C$L11            ; |174| 
   [ B0]   CALL    .S1     _exp2sp           ; |174| 
   [!B0]   CALL    .S1     _exp2             ; |174| 
   [!B0]   SPDP    .S1     A4,A5:A4          ; |174| 
           NOP             2
           ; BRANCHCC OCCURS {$C$L11}        ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL20,B3,0      ; |174| 
$C$RL20:   ; CALL OCCURS {_exp2sp} {0}       ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8

           MVKL    .S2     _output,B4
||         SPDP    .S1     A4,A5:A4          ; |174| 

           MVKH    .S2     _output,B4

           BNOP    .S1     $C$L12,4          ; |174| 
||         LDW     .D2T2   *+B4(4),B4        ; |174| 
||         DPSP    .L1     A5:A4,A3          ; |174| 

           ADD     .L1X    A15,B4,A4         ; |174| 
           ; BRANCH OCCURS {$C$L12}          ; |174| 
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL21,B3,1      ; |174| 
$C$RL21:   ; CALL OCCURS {_exp2} {0}         ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(4),B4        ; |174| 
           DPSP    .L1     A5:A4,A3          ; |174| 
           NOP             3
           ADD     .L1X    A15,B4,A4         ; |174| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     _exp2sp_c         ; |175| 
||         STW     .D1T1   A3,*A4            ; |174| 

           LDW     .D1T1   *A10,A4           ; |175| 
           ADDKPC  .S2     $C$RL22,B3,3      ; |175| 
$C$RL22:   ; CALL OCCURS {_exp2sp_c} {0}     ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 134
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(8),B4        ; |175| 
           LDW     .D2T1   *+SP(20),A31
           LDW     .D2T1   *+SP(24),A30      ; |83| 
           LDW     .D2T1   *+SP(16),A29      ; |84| 
           LDW     .D2T1   *+SP(28),A28
           ADD     .L1X    A15,B4,A3         ; |175| 
           STW     .D1T1   A4,*A3            ; |175| 
           LDW     .D1T1   *A10,A5           ; |176| 
           LDW     .D2T2   *+SP(12),B31      ; |95| 
           LDW     .D2T1   *+SP(36),A27
           LDW     .D2T1   *+SP(32),A25
           MVKL    .S1     _output+12,A26
           MPYSP   .M1     A31,A5,A4         ; |80| 
           MVKH    .S1     _output+12,A26
           CMPLTSP .S1     A5,A14,A1         ; |100| 
           CMPGTSP .S1     A5,A13,A2         ; |105| 
           ABSSP   .S1     A4,A6             ; |83| 
           CMPLTSP .S1     A6,A30,A0         ; |83| 
   [ A0]   MV      .L1     A12,A4            ; |84| 
           MPYSP   .M1     A29,A4,A3         ; |95| 
           NOP             3
           SPINT   .L1     A3,A7             ; |95| 
           NOP             3
           INTSP   .L1     A7,A6             ; |95| 
           NOP             3
           MPYSP   .M1     A28,A6,A3         ; |95| 
           MPYSP   .M2X    B31,A6,B4         ; |95| 
           ADD     .L1     A25,A7,A6         ; |97| 
           SHL     .S1     A6,23,A6          ; |97| 
           SUBSP   .L1     A4,A3,A3          ; |95| 
           NOP             4
           SUBSP   .L2X    A3,B4,B4          ; |95| 
           NOP             3
           MPYSP   .M2     B4,B4,B5          ; |95| 
           NOP             3
           MPYSP   .M2     B11,B5,B6         ; |95| 
           MPYSP   .M1X    A27,B5,A3         ; |95| 
           NOP             2
           ADDSP   .L2     B12,B6,B5         ; |95| 
           ADDSP   .L1     A11,A3,A3         ; |95| 
           NOP             2
           MPYSP   .M2     B4,B5,B5          ; |95| 
           NOP             3
           SUBSP   .L2X    A3,B5,B4          ; |95| 
           LDW     .D1T1   *A26,A3           ; |176| 
           NOP             2
           RCPSP   .S2     B4,B6             ; |53| 
           MPYSP   .M2     B4,B6,B7          ; |53| 
           ADD     .L1     A15,A3,A5         ; |176| 
           ADD     .L1     4,A15,A15         ; |172| 
           NOP             1
           SUBSP   .L2     B10,B7,B7         ; |53| 
           NOP             3
           MPYSP   .M2     B6,B7,B6          ; |53| 
           NOP             3
           MPYSP   .M2     B4,B6,B4          ; |53| 
           NOP             3
           SUBSP   .L2     B10,B4,B4         ; |53| 
           NOP             3
           MPYSP   .M2     B6,B4,B4          ; |53| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |53| 
           MVKL    .S2     0xc000cccc,B5
           MVKH    .S2     0xc000cccc,B5
           NOP             2
           ADDSP   .L1X    A11,B4,A4         ; |97| 
           MVKL    .S2     0xcccccccd,B4
           MVKH    .S2     0xcccccccd,B4
           NOP             1
           MPYSP   .M1     A6,A4,A4          ; |97| 
           NOP             3

   [ A1]   MV      .L1     A12,A4            ; |101| 
|| [ A2]   LDW     .D2T1   *+SP(40),A4       ; |101| 

           NOP             4
           STW     .D1T1   A4,*A5            ; |176| 
           LDW     .D1T2   *A10,B6           ; |177| 
           NOP             4
           MPYSPDP .M2     B6,B5:B4,B5:B4    ; |177| 
           NOP             6

           DPSP    .L2     B5:B4,B5          ; |177| 
||         LDW     .D2T2   *+SP(44),B4

           NOP             3
           STW     .D1T2   B5,*++A10         ; |177| 

           SUB     .L1X    B4,1,A0           ; |172| 
||         SUB     .L2     B4,1,B4           ; |172| 

   [ A0]   B       .S1     $C$L10            ; |172| 
|| [ A0]   LDW     .D1T1   *A10,A3           ; |173| 
||         STW     .D2T2   B4,*+SP(44)       ; |177| 
|| [!A0]   MVKL    .S2     _output,B4

   [ A0]   CALL    .S1     _exp2             ; |173| 
   [!A0]   MVKH    .S2     _output,B4
   [!A0]   LDW     .D2T2   *+B4(16),B4       ; |179| 
   [!A0]   CALL    .S1     _exp2sp_v         ; |179| 
           SPDP    .S1     A3,A5:A4          ; |173| 
           ; BRANCHCC OCCURS {$C$L10}        ; |172| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL23,B3,0      ; |179| 
           MVKL    .S1     _a_ext,A4
           MVKH    .S1     _a_ext,A4
           MVK     .S1     0xed,A6           ; |179| 
$C$RL23:   ; CALL OCCURS {_exp2sp_v} {0}     ; |179| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 54
           MVKL    .S2     _output,B5
           MVKL    .S2     _output,B4
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     _output,B5
           MVKH    .S2     _output,B4
           MVKH    .S2     0x88e368f1,B6

           LDW     .D2T1   *B5,A4            ; |66| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B4(4),B4        ; |66| 
||         MVK     .S1     0xed,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL24:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _output,B4
           MVKL    .S2     _fcn_pass,B6
           MVKH    .S2     _output,B4

           LDW     .D2T2   *B4,B5            ; |67| 
||         MVKL    .S2     0x3ee4f8b5,B7

           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0x88e368f1,B6

           MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B4(8),B4        ; |67| 
||         MV      .L1X    B5,A4             ; |67| 
||         MVK     .S1     0xed,A6           ; |67| 
||         MVK     .D1     0x1,A8            ; |67| 

$C$RL25:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x88e368f1,B6

           MVKL    .S1     _output,A3
||         MVKL    .S2     0x3ee4f8b5,B7

           MVKH    .S1     _output,A3
||         MVKH    .S2     _fcn_pass,B5

           MVKH    .S2     0x88e368f1,B6

           MV      .L2X    A3,B4             ; |174| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B4(12),B4       ; |68| 
||         LDW     .D1T1   *A3,A4            ; |68| 
||         MVK     .S1     0xed,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL26:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     _output,B4
           MVKL    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *+SP(48),A3       ; |68| 
||         MVKL    .S2     0x88e368f1,B6

           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     _output,B4
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B5(12)       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0xed,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL27:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(72),A3       ; |69| 
           MVKL    .S2     _fcn_pass,B4
           MVKH    .S2     _fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           NOP             1
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [!A0]   B       .S1     $C$L13            ; |72| 
|| [ A0]   LDW     .D2T2   *B13,B0           ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |183| 
   [ A0]   ADD     .L2     4,B13,B4
   [!A0]   ZERO    .L1     A3                ; |72| 
   [!A0]   MVKL    .S1     _all_pass,A4
   [!A0]   MVKH    .S1     _all_pass,A4
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
||         MVK     .S1     0x1,A3            ; |72| 

   [!A0]   ZERO    .L1     A3                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |183| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x4,A4            ; |183| 
||         ADDKPC  .S2     $C$RL28,B3,0      ; |183| 

$C$RL28:   ; CALL OCCURS {_print_test_results} {0}  ; |183| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L2     B5                ; |114| 

           STW     .D2T2   B5,*+SP(48)       ; |114| 
||         ZERO    .L2     B4                ; |114| 
||         MVKL    .S2     _cycle_counts+24,B7

           MVKH    .S2     _cycle_counts+24,B7
||         STW     .D2T2   B4,*+SP(44)       ; |114| 
||         ZERO    .L2     B6                ; |114| 

           MVC     .S2     B6,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B7         ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           CALL    .S1     _gimme_random     ; |193| 
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 
||         MVKL    .S1     _t_offset,A5

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     _t_offset,A5

           ZERO    .L2     B4
||         STDW    .D1T2   B5:B4,*A5         ; |117| 

           MVKH    .S2     0xc2c80000,B4
||         ZERO    .L1     A10               ; |191| 
||         ZERO    .S1     A4

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

           ADDKPC  .S2     $C$RL29,B3,0      ; |193| 
||         MVKH    .S1     0x43480000,A4

$C$RL29:   ; CALL OCCURS {_gimme_random} {0}  ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 126
           MVKL    .S2     _input,B4
           MVKH    .S2     _input,B4
           LDW     .D2T1   *B4,A3            ; |193| 
           NOP             4

           STW     .D1T1   A4,*+A3[A10]      ; |193| 
||         MVC     .S2     TSCL,B8           ; |122| 

           MVC     .S2     TSCH,B9           ; |122| 
           LDW     .D2T1   *+SP(20),A3       ; |122| 
           LDW     .D2T1   *+SP(24),A31      ; |83| 
           LDW     .D2T1   *+SP(16),A30      ; |84| 
           LDW     .D2T1   *+SP(28),A29
           LDW     .D2T2   *+SP(12),B4       ; |95| 
           MPYSP   .M1     A3,A4,A5          ; |80| 
           LDW     .D2T1   *+SP(36),A28
           LDW     .D2T1   *+SP(32),A27      ; |197| 
           CMPLTSP .S1     A4,A14,A1         ; |100| 
           ABSSP   .S1     A5,A6             ; |83| 
           CMPLTSP .S1     A6,A31,A0         ; |83| 
   [ A0]   MV      .L1     A12,A5            ; |84| 
           MPYSP   .M1     A30,A5,A3         ; |95| 
           CMPGTSP .S1     A4,A13,A2         ; |105| 
           MVKL    .S2     _t_start,B31
           MVKH    .S2     _t_start,B31
           SPINT   .L1     A3,A6             ; |95| 
           STDW    .D2T2   B9:B8,*B31
           NOP             2
           INTSP   .L1     A6,A7             ; |95| 
           NOP             3
           MPYSP   .M1     A29,A7,A3         ; |95| 
           MPYSP   .M2X    B4,A7,B4          ; |95| 
           NOP             2
           SUBSP   .L1     A5,A3,A3          ; |95| 
           ADD     .L1     A27,A6,A5         ; |97| 
           SHL     .S1     A5,23,A5          ; |97| 
           MVKL    .S1     _output+12,A27
           MVKH    .S1     _output+12,A27
           SUBSP   .L2X    A3,B4,B4          ; |95| 
           LDW     .D1T1   *A27,A26          ; |197| 
           NOP             2
           MPYSP   .M2     B4,B4,B5          ; |95| 
           NOP             3
           MPYSP   .M2     B11,B5,B6         ; |95| 
           MPYSP   .M1X    A28,B5,A3         ; |95| 
           NOP             2
           ADDSP   .L2     B12,B6,B5         ; |95| 
           ADDSP   .L1     A11,A3,A3         ; |95| 
           NOP             2
           MPYSP   .M2     B4,B5,B5          ; |95| 
           NOP             3
           SUBSP   .L2X    A3,B5,B4          ; |95| 
           NOP             3
           RCPSP   .S2     B4,B6             ; |53| 
           MPYSP   .M2     B4,B6,B7          ; |53| 
           NOP             3
           SUBSP   .L2     B10,B7,B7         ; |53| 
           NOP             3
           MPYSP   .M2     B6,B7,B6          ; |53| 
           NOP             3
           MPYSP   .M2     B4,B6,B4          ; |53| 
           NOP             3
           SUBSP   .L2     B10,B4,B4         ; |53| 
           NOP             3
           MPYSP   .M2     B6,B4,B4          ; |53| 
           NOP             3
           MPYSP   .M2     B5,B4,B4          ; |53| 
           NOP             4
           ADDSP   .L1X    A11,B4,A3         ; |97| 
           NOP             3
           MPYSP   .M1     A5,A3,A3          ; |97| 
           NOP             3

   [ A1]   MV      .L1     A12,A3            ; |101| 
|| [ A2]   LDW     .D2T1   *+SP(40),A3       ; |101| 

           NOP             4

           STW     .D1T1   A3,*+A26[A10]     ; |197| 
||         MVC     .S2     TSCL,B4           ; |128| 

           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     _t_offset,B13
||         MVKL    .S1     _cycle_counts+24,A3
||         ADD     .L1     1,A10,A10         ; |191| 

           MVKH    .S2     _t_offset,B13
||         MVKH    .S1     _cycle_counts+24,A3

           MVK     .S2     128,B30           ; |191| 
||         MVKL    .S1     _t_stop,A25
||         MV      .L1     A3,A15            ; |130| 
||         LDDW    .D2T2   *B13,B17:B16      ; |130| 

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
           MVKH    .S1     _t_stop,A25
           STDW    .D1T2   B5:B4,*A25        ; |128| 
           CMPLT   .L1X    A10,B30,A0        ; |191| 
           ADDU    .L2     B16,B8,B7:B6      ; |130| 

           ADD     .S2     B7,B17,B8         ; |130| 
||         SUBU    .L2     B4,B6,B7:B6       ; |130| 
|| [ A0]   ZERO    .D2     B4

           ADD     .D2     B8,B9,B8          ; |130| 
|| [ A0]   B       .S1     $C$L14            ; |191| 
||         EXT     .S2     B7,24,24,B9       ; |130| 
||         ADDU    .L2X    A4,B6,B7:B6       ; |130| 

   [ A0]   CALL    .S1     _gimme_random     ; |193| 
||         SUB     .L2     B5,B8,B8          ; |130| 
|| [ A0]   MVKH    .S2     0xc2c80000,B4

           ADD     .L2     B8,B9,B8          ; |130| 
||         ADD     .L1X    B7,A5,A3          ; |130| 

           MV      .L1X    B6,A4             ; |130| 
           ADD     .L1X    A3,B8,A5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D1T1   A5:A4,*A15        ; |130| 
|| [ A0]   ZERO    .L1     A4

           ; BRANCHCC OCCURS {$C$L14}        ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A15,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL30,B3,3      ; |135| 
$C$RL30:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A12
           SET     .S1     A12,0x1a,0x1d,A12
           MPYSP   .M1     A12,A4,A3         ; |135| 
           ZERO    .L1     A11
           SET     .S1     A11,0x15,0x1d,A11
           ZERO    .L1     A10               ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL31:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           MV      .L2X    A15,B4
           MV      .L2X    A10,B5
           MV      .L2X    A10,B6

           MVK     .S2     24,B10
||         MV      .L2X    A10,B7

           SUB     .L2X    A15,B10,B10
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           STDW    .D2T2   B7:B6,*B10        ; |114| 
||         MVC     .S2     B5,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     _t_start,A14

           MVKH    .S1     _t_start,A14
||         MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKL    .S1     _input,A13

           STDW    .D2T2   B5:B4,*B13        ; |117| 
||         MVKH    .S1     _input,A13

           LDW     .D1T1   *A13,A3           ; |205| 
           MVK     .S1     128,A15           ; |204| 
           NOP             2
           CALL    .S1     _exp2f            ; |205| 
           LDW     .D1T1   *+A3[A10],A4      ; |205| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL32,B3,3      ; |205| 
$C$RL32:   ; CALL OCCURS {_exp2f} {0}        ; |205| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *A3,A3            ; |205| 
           NOP             4

           STW     .D1T1   A4,*+A3[A10]      ; |205| 
||         ADD     .L1     1,A10,A10         ; |204| 

           CMPLT   .L1     A10,A15,A0        ; |204| 

   [ A0]   BNOP    .S1     $C$L15,3          ; |204| 
|| [ A0]   LDW     .D1T1   *A13,A3           ; |205| 

   [ A0]   CALL    .S1     _exp2f            ; |205| 
   [ A0]   LDW     .D1T1   *+A3[A10],A4      ; |205| 
           ; BRANCHCC OCCURS {$C$L15}        ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A7:A6        ; |130| 
||         LDDW    .D2T2   *B13,B9:B8        ; |130| 

           MVKL    .S2     _t_stop,B11
           MV      .L2     B4,B7             ; |128| 
           MVKH    .S2     _t_stop,B11
           NOP             1
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B9,A3          ; |130| 
||         LDDW    .D2T2   *B10,B9:B8        ; |130| 

           SUBU    .L2X    B6,A4,B5:B4       ; |130| 
           ADD     .L1     A3,A7,A3          ; |130| 
           EXT     .S2     B5,24,24,B16      ; |130| 
           CALL    .S1     __fltllif         ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         SUB     .S2X    B7,A3,B8          ; |130| 

           ADD     .L2     B5,B9,B31         ; |130| 
||         ADD     .S2     B8,B16,B5         ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B31,B5,B4         ; |130| 

           STDW    .D2T2   B7:B6,*B11        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL33,B3,0      ; |130| 

$C$RL33:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A12,A4,A3         ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL34:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MV      .L2X    A10,B4            ; |130| 

           MV      .L2X    A10,B5            ; |130| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(8)    ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B5       ; |117| 
||         SUB     .L2     B8,B7,B6          ; |117| 

           ADD     .L2     B6,B5,B5          ; |117| 
           STDW    .D2T2   B5:B4,*B13        ; |117| 
           LDW     .D1T1   *A13,A3           ; |213| 
           LDW     .D2T1   *+SP(52),A12      ; |117| 
           NOP             2
           CALL    .S1     _exp2sp           ; |213| 
           LDW     .D1T1   *+A3[A10],A4      ; |213| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL35,B3,3      ; |213| 
$C$RL35:   ; CALL OCCURS {_exp2sp} {0}       ; |213| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D1T1   *A12,A3           ; |213| 
           NOP             4

           STW     .D1T1   A4,*+A3[A10]      ; |213| 
||         ADD     .L1     1,A10,A10         ; |212| 

           CMPLT   .L1     A10,A15,A0        ; |212| 

   [ A0]   BNOP    .S1     $C$L16,3          ; |212| 
|| [ A0]   LDW     .D1T1   *A13,A3           ; |213| 

   [ A0]   CALL    .S1     _exp2sp           ; |213| 
   [ A0]   LDW     .D1T1   *+A3[A10],A4      ; |213| 
           ; BRANCHCC OCCURS {$C$L16}        ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B13,B9:B8        ; |130| 

           MV      .L2     B4,B7             ; |128| 
           MV      .L2     B11,B30           ; |130| 
           NOP             2
           ADDU    .L1X    B8,A4,A7:A6       ; |130| 

           ADD     .L1X    A7,B9,A3          ; |130| 
||         LDDW    .D2T2   *+B10(8),B9:B8    ; |130| 

           ADD     .L1     A3,A5,A3          ; |130| 
||         SUBU    .L2X    B6,A6,B5:B4       ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           SUB     .L2X    B7,A3,B31         ; |130| 
           CALL    .S1     __fltllif         ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         ADD     .S2     B31,B16,B8        ; |130| 

           ADD     .L2     B5,B9,B5          ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B5,B8,B4          ; |130| 

           STDW    .D2T2   B7:B6,*B30        ; |128| 

           ADDKPC  .S2     $C$RL36,B3,0      ; |130| 
||         MV      .L1X    B4,A5             ; |130| 

$C$RL36:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL37:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18

           ADDAD   .D2     B10,1,B11
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B11        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(16)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B9             ; |116| 

           STDW    .D1T2   B9:B8,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B6           ; |117| 
           SUBU    .L2     B4,B8,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B6,B9,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 
           STDW    .D2T2   B5:B4,*B13        ; |117| 
           LDW     .D1T1   *A13,A3           ; |221| 
           LDW     .D2T1   *+SP(56),A12      ; |117| 
           NOP             2
           CALL    .S1     _exp2sp_c         ; |221| 
           LDW     .D1T1   *+A3[A10],A4      ; |221| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL38,B3,3      ; |221| 
$C$RL38:   ; CALL OCCURS {_exp2sp_c} {0}     ; |221| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D1T1   *A12,A3           ; |221| 
           NOP             4

           STW     .D1T1   A4,*+A3[A10]      ; |221| 
||         ADD     .L1     1,A10,A10         ; |220| 

           CMPLT   .L1     A10,A15,A0        ; |220| 

   [ A0]   BNOP    .S1     $C$L17,3          ; |220| 
|| [ A0]   LDW     .D1T1   *A13,A3           ; |221| 

   [ A0]   CALL    .S1     _exp2sp_c         ; |221| 
   [ A0]   LDW     .D1T1   *+A3[A10],A4      ; |221| 
           ; BRANCHCC OCCURS {$C$L17}        ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D2T2   *B13,B9:B8        ; |130| 
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 

           MVKL    .S2     _t_stop,B31
           LDDW    .D2T2   *+B10(16),B17:B16 ; |130| 
           MV      .L2     B4,B7             ; |128| 
           MVKH    .S2     _t_stop,B31
           ADDU    .L2X    B8,A4,B5:B4       ; |130| 

           ADD     .S2     B5,B9,B8          ; |130| 
||         SUBU    .L2     B6,B4,B5:B4       ; |130| 

           ADD     .D2X    B8,A5,B8          ; |130| 
||         CALL    .S1     __fltllif         ; |130| 
||         EXT     .S2     B5,24,24,B9       ; |130| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 

           SUB     .L2     B7,B8,B8          ; |130| 
||         ADD     .S2     B5,B17,B5         ; |130| 

           ADD     .L2     B8,B9,B8          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 

           ADD     .L2     B5,B8,B4          ; |130| 
           STDW    .D2T2   B7:B6,*B31        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL39,B3,0      ; |130| 

$C$RL39:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 111
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL40:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 

           ADDAD   .D2     B11,1,B12
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B12        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A14        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           SUB     .L2     B8,B5,B4          ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 

           MVKL    .S1     _output,A12
||         ADD     .L2     B4,B5,B7          ; |117| 

           MVKH    .S1     _output,A12
||         MV      .L2X    A13,B9            ; |228| 
||         STDW    .D2T2   B7:B6,*B13        ; |117| 

           CALLP   .S2     _exp2sp_v,B3
||         LDW     .D1T2   *+A12(16),B4      ; |228| 
||         LDW     .D2T1   *B9,A4            ; |228| 
||         MVK     .S1     0x80,A6           ; |228| 

$C$RL41:   ; CALL OCCURS {_exp2sp_v} {0}     ; |228| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A17:A16      ; |130| 
||         LDDW    .D2T2   *B13,B7:B6        ; |130| 

           MVK     .S1     16,A13
           ADD     .L1X    B12,A13,A13
           MVKL    .S1     _t_stop,A3

           LDDW    .D1T1   *A13,A9:A8        ; |130| 
||         MVKH    .S1     _t_stop,A3

           ADDU    .L1X    B6,A16,A7:A6      ; |130| 

           MV      .L2     B4,B9             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A7,B7,A3          ; |130| 

           SUBU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1     A3,A17,A5         ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           SUB     .S1X    B9,A5,A6          ; |130| 
||         ADDU    .L1     A8,A4,A5:A4       ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A6,A3,A5          ; |130| 

           CALLP   .S2     __fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL42:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL43:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6

           STDW    .D1T1   A5:A4,*A13        ; |130| 
||         MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D1T2   *+A12(4),B4       ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A12,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL44:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     _fcn_pass,B10
           MVKH    .S2     0x3ee4f8b5,B7
           MVKH    .S2     0x88e368f1,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A12,A4           ; |67| 
||         MVKH    .S2     _fcn_pass,B10

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A12(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL45:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A12(12),B4      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A12,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL46:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T1   *+SP(60),A3       ; |68| 
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           LDW     .D1T1   *A12,A4           ; |69| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL47:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(64),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           LDW     .D2T2   *+SP(68),B5
           NOP             3

   [!B0]   B       .S1     $C$L18            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B5,B0            ; |72| 
   [ B1]   ADD     .L2     4,B5,B5
           NOP             3
           ; BRANCHCC OCCURS {$C$L18}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
   [ B0]   LDW     .D2T2   *B5,B5            ; |72| 
           CMPEQ   .L2     B4,0,B6           ; |72| 
           XOR     .L2     1,B6,B31          ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B5,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 

   [ B0]   AND     .L2     B31,B4,B0         ; |72| 
|| [!B0]   ZERO    .S2     B0                ; |72| 

   [ B0]   B       .S1     $C$L19            ; |72| 
   [ B0]   CALL    .S1     _print_test_results ; |234| 
   [ B0]   MVKL    .S1     _all_pass,A3
   [ B0]   MVKH    .S1     _all_pass,A3
           NOP             2
           ; BRANCHCC OCCURS {$C$L19}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |234| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           MV      .L1     A10,A4
           NOP             1
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x2,A4            ; |234| 
||         ADDKPC  .S2     $C$RL48,B3,0      ; |234| 

$C$RL48:   ; CALL OCCURS {_print_test_results} {0}  ; |234| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |235| 

$C$RL49:   ; CALL OCCURS {_printf} {0}       ; |235| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |235| 

$C$RL50:   ; CALL OCCURS {_printf} {0}       ; |235| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |242| 

$C$RL51:   ; CALL OCCURS {_print_profile_results} {0}  ; |242| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |245| 

$C$RL52:   ; CALL OCCURS {_print_memory_results} {0}  ; |245| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(80),B3      ; |246| 
           LDDW    .D2T1   *++SP,A13:A12     ; |246| 
           LDDW    .D2T1   *++SP,A15:A14     ; |246| 
           LDDW    .D2T2   *++SP,B11:B10     ; |246| 
           LDDW    .D2T2   *++SP,B13:B12     ; |246| 

           LDW     .D2T1   *++SP(8),A10      ; |246| 
||         RET     .S2     B3                ; |246| 

           LDW     .D2T1   *++SP(8),A11      ; |246| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |246| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"exp2SP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_exp2f
	.global	_exp2
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_exp2sp
	.global	_exp2sp_c
	.global	_exp2sp_v
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
