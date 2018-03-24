;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:48:52 2016                                *
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
	.word	04960a788h		; a[0] @ 0
	.word	048321ac7h		; a[1] @ 32
	.word	048ba9cb5h		; a[2] @ 64
	.word	0488e3c06h		; a[3] @ 96
	.word	04933c143h		; a[4] @ 128
	.word	048c9adb0h		; a[5] @ 160
	.word	04916a24eh		; a[6] @ 192
	.word	04949bce9h		; a[7] @ 224
	.word	048292e67h		; a[8] @ 256
	.word	0493f69cah		; a[9] @ 288
	.word	0496e4c1eh		; a[10] @ 320
	.word	048b6a2f7h		; a[11] @ 352
	.word	0495101e1h		; a[12] @ 384
	.word	048c4ff78h		; a[13] @ 416
	.word	04946fdc8h		; a[14] @ 448
	.word	0488a25d6h		; a[15] @ 480
	.word	04954b0d0h		; a[16] @ 512
	.word	04953e7fch		; a[17] @ 544
	.word	0496b0b67h		; a[18] @ 576
	.word	048b6d6fah		; a[19] @ 608
	.word	0493fd1a8h		; a[20] @ 640
	.word	04856caa8h		; a[21] @ 672
	.word	0492e12e8h		; a[22] @ 704
	.word	04963652bh		; a[23] @ 736
	.word	049195a4ah		; a[24] @ 768
	.word	04970d8b8h		; a[25] @ 800
	.word	0494a5d59h		; a[26] @ 832
	.word	0492e321bh		; a[27] @ 864
	.word	04958db87h		; a[28] @ 896
	.word	04818620ah		; a[29] @ 928
	.word	04904758ah		; a[30] @ 960
	.word	04965ec47h		; a[31] @ 992
	.word	04903fb67h		; a[32] @ 1024
	.word	04831f1a1h		; a[33] @ 1056
	.word	049069c54h		; a[34] @ 1088
	.word	048977b44h		; a[35] @ 1120
	.word	046a3fd29h		; a[36] @ 1152
	.word	049740149h		; a[37] @ 1184
	.word	04702fcedh		; a[38] @ 1216
	.word	04970b77ch		; a[39] @ 1248
	.word	048597226h		; a[40] @ 1280
	.word	049740b4ah		; a[41] @ 1312
	.word	0491880d2h		; a[42] @ 1344
	.word	04910e175h		; a[43] @ 1376
	.word	04901bd7eh		; a[44] @ 1408
	.word	04739dd09h		; a[45] @ 1440
	.word	048cfc7a4h		; a[46] @ 1472
	.word	04864863dh		; a[47] @ 1504
	.word	04940038ch		; a[48] @ 1536
	.word	048eafd3ch		; a[49] @ 1568
	.word	0468b585bh		; a[50] @ 1600
	.word	048e79948h		; a[51] @ 1632
	.word	0488ec81ah		; a[52] @ 1664
	.word	047c30619h		; a[53] @ 1696
	.word	048d908e9h		; a[54] @ 1728
	.word	048acd352h		; a[55] @ 1760
	.word	0494ac617h		; a[56] @ 1792
	.word	0482f4b54h		; a[57] @ 1824
	.word	0485471f2h		; a[58] @ 1856
	.word	048b68c6fh		; a[59] @ 1888
	.word	0491f0c4eh		; a[60] @ 1920
	.word	048dba1abh		; a[61] @ 1952
	.word	0489d4b22h		; a[62] @ 1984
	.word	048f9f28ch		; a[63] @ 2016
	.word	048e21de6h		; a[64] @ 2048
	.word	047fc11f0h		; a[65] @ 2080
	.word	0484ba1adh		; a[66] @ 2112
	.word	0484e2a30h		; a[67] @ 2144
	.word	048e19268h		; a[68] @ 2176
	.word	0495a005eh		; a[69] @ 2208
	.word	049425e97h		; a[70] @ 2240
	.word	048bd41ffh		; a[71] @ 2272
	.word	0489198f4h		; a[72] @ 2304
	.word	049585c3ch		; a[73] @ 2336
	.word	048e5491bh		; a[74] @ 2368
	.word	048ca9000h		; a[75] @ 2400
	.word	047b189eah		; a[76] @ 2432
	.word	0492f80fbh		; a[77] @ 2464
	.word	047b09f6bh		; a[78] @ 2496
	.word	0480fb991h		; a[79] @ 2528
	.word	048d5062dh		; a[80] @ 2560
	.word	048ed2410h		; a[81] @ 2592
	.word	049709572h		; a[82] @ 2624
	.word	0495ad2a6h		; a[83] @ 2656
	.word	048bf3d17h		; a[84] @ 2688
	.word	04932724fh		; a[85] @ 2720
	.word	049680d69h		; a[86] @ 2752
	.word	048de0cfah		; a[87] @ 2784
	.word	048eff651h		; a[88] @ 2816
	.word	048ea45dfh		; a[89] @ 2848
	.word	0486d0cafh		; a[90] @ 2880
	.word	0479543ach		; a[91] @ 2912
	.word	049309f15h		; a[92] @ 2944
	.word	048596868h		; a[93] @ 2976
	.word	049128b60h		; a[94] @ 3008
	.word	048ee5e6ch		; a[95] @ 3040
	.word	04908c5e9h		; a[96] @ 3072
	.word	0495d7d63h		; a[97] @ 3104
	.word	04855488dh		; a[98] @ 3136
	.word	0495572eeh		; a[99] @ 3168
	.word	049656424h		; a[100] @ 3200
	.word	0496eb75bh		; a[101] @ 3232
	.word	0493aebf1h		; a[102] @ 3264
	.word	0495d9976h		; a[103] @ 3296
	.word	0488129f0h		; a[104] @ 3328
	.word	0489e4d80h		; a[105] @ 3360
	.word	048bf06a7h		; a[106] @ 3392
	.word	0492e8018h		; a[107] @ 3424
	.word	048c4e563h		; a[108] @ 3456
	.word	048934659h		; a[109] @ 3488
	.word	049297255h		; a[110] @ 3520
	.word	049598b28h		; a[111] @ 3552
	.word	0492b1ca8h		; a[112] @ 3584
	.word	04938fa1ch		; a[113] @ 3616
	.word	049380672h		; a[114] @ 3648
	.word	048fa7879h		; a[115] @ 3680
	.word	0496c4427h		; a[116] @ 3712
	.word	049719c14h		; a[117] @ 3744
	.word	047d994f2h		; a[118] @ 3776
	.word	047d76c79h		; a[119] @ 3808
	.word	048ea1a4fh		; a[120] @ 3840
	.word	0493b71eeh		; a[121] @ 3872
	.word	0493ea856h		; a[122] @ 3904
	.word	049286d72h		; a[123] @ 3936
	.word	049714f3fh		; a[124] @ 3968
	.word	048a1daeeh		; a[125] @ 4000
	.word	0486fc9f6h		; a[126] @ 4032
	.word	04931a143h		; a[127] @ 4064
	.word	0492cf738h		; a[128] @ 4096
	.word	048bff75dh		; a[129] @ 4128
	.word	048dd74beh		; a[130] @ 4160
	.word	04820ac3bh		; a[131] @ 4192
	.word	048a14afeh		; a[132] @ 4224
	.word	047ef7f17h		; a[133] @ 4256
	.word	0494ba551h		; a[134] @ 4288
	.word	048cc78f8h		; a[135] @ 4320
	.word	04973b1f3h		; a[136] @ 4352
	.word	0482e2d30h		; a[137] @ 4384
	.word	0488001c8h		; a[138] @ 4416
	.word	048b292d4h		; a[139] @ 4448
	.word	048a67d54h		; a[140] @ 4480
	.word	04921442ah		; a[141] @ 4512
	.word	047d4c5dfh		; a[142] @ 4544
	.word	048aadfcch		; a[143] @ 4576
	.word	048dd1fdbh		; a[144] @ 4608
	.word	04825d655h		; a[145] @ 4640
	.word	048335910h		; a[146] @ 4672
	.word	048441191h		; a[147] @ 4704
	.word	049591e84h		; a[148] @ 4736
	.word	04935cad0h		; a[149] @ 4768
	.word	049424d03h		; a[150] @ 4800
	.word	0483c96e4h		; a[151] @ 4832
	.word	04925ba56h		; a[152] @ 4864
	.word	0495ead81h		; a[153] @ 4896
	.word	0492c0ab0h		; a[154] @ 4928
	.word	047b8aa07h		; a[155] @ 4960
	.word	0489da8dfh		; a[156] @ 4992
	.word	049214744h		; a[157] @ 5024
	.word	048072463h		; a[158] @ 5056
	.word	047e6f5a6h		; a[159] @ 5088
	.word	0493f7bb2h		; a[160] @ 5120
	.word	048dc8353h		; a[161] @ 5152
	.word	04942e330h		; a[162] @ 5184
	.word	0496bdc6eh		; a[163] @ 5216
	.word	048f5862ch		; a[164] @ 5248
	.word	0484afc36h		; a[165] @ 5280
	.word	049529021h		; a[166] @ 5312
	.word	04942a829h		; a[167] @ 5344
	.word	048b76473h		; a[168] @ 5376
	.word	048a0a7fbh		; a[169] @ 5408
	.word	0496a1560h		; a[170] @ 5440
	.word	0486aa76eh		; a[171] @ 5472
	.word	04940786ch		; a[172] @ 5504
	.word	049260103h		; a[173] @ 5536
	.word	048432712h		; a[174] @ 5568
	.word	048c18f0fh		; a[175] @ 5600
	.word	0490ad7e4h		; a[176] @ 5632
	.word	049112f59h		; a[177] @ 5664
	.word	0481f6d80h		; a[178] @ 5696
	.word	0494a3cddh		; a[179] @ 5728
	.word	0470048bbh		; a[180] @ 5760
	.word	04954fb67h		; a[181] @ 5792
	.word	04957e07bh		; a[182] @ 5824
	.word	0490e7b02h		; a[183] @ 5856
	.word	04969f33eh		; a[184] @ 5888
	.word	04940ac97h		; a[185] @ 5920
	.word	049596539h		; a[186] @ 5952
	.word	0481f32cfh		; a[187] @ 5984
	.word	04911619ah		; a[188] @ 6016
	.word	047a1411bh		; a[189] @ 6048
	.word	04813cf86h		; a[190] @ 6080
	.word	04903069ah		; a[191] @ 6112
	.word	049203f23h		; a[192] @ 6144
	.word	0496b187dh		; a[193] @ 6176
	.word	047f44388h		; a[194] @ 6208
	.word	04813fe2fh		; a[195] @ 6240
	.word	048a2dda2h		; a[196] @ 6272
	.word	047c773e2h		; a[197] @ 6304
	.word	04931834ch		; a[198] @ 6336
	.word	049609051h		; a[199] @ 6368
	.word	048893853h		; a[200] @ 6400

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\018085 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\018087 
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
;*   Local Frame Size  : 8 Args + 100 Auto + 56 Save = 164 byte               *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |133| 
           STW     .D2T1   A10,*SP--(8)      ; |133| 
           STDW    .D2T2   B13:B12,*SP--     ; |133| 
           STDW    .D2T2   B11:B10,*SP--     ; |133| 
           STDW    .D2T1   A15:A14,*SP--     ; |133| 

           STDW    .D2T1   A13:A12,*SP--     ; |133| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(120)     ; |133| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     a,A11

           MVKH    .S1     a,A11
||         MVKL    .S2     output,B10

           CALL    .S1     log10f            ; |150| 
||         MV      .L1     A11,A13
||         MV      .D1X    B4,A10
||         MVKH    .S2     output,B10
||         ZERO    .L2     B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A13++,A4         ; |150| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |150| 
$C$RL1:    ; CALL OCCURS {log10f} {0}        ; |150| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B10,B4           ; |150| 
||         SUB     .L1     A10,1,A0          ; |149| 
||         SUB     .S1     A10,1,A10         ; |149| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |149| 
|| [!A0]   ADD     .L2     4,B10,B5

           ADD     .L2     B11,B4,B4         ; |150| 
||         ADD     .S2     4,B11,B11         ; |149| 

   [ A0]   CALL    .S1     log10f            ; |150| 
||         STW     .D2T1   A4,*B4            ; |150| 
|| [!A0]   MVK     .S2     0xc9,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B11
||         STW     .D2T2   B5,*+SP(60)
||         MV      .L1     A11,A12

           MV      .L1X    B4,A10
||         CALL    .S1     log10sp           ; |153| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A11++,A4         ; |153| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |153| 
$C$RL2:    ; CALL OCCURS {log10sp} {0}       ; |153| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(60),B4       ; |153| 
           SUB     .L1     A10,1,A0          ; |152| 
           SUB     .L1     A10,1,A10         ; |152| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |153| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |152| 

           ADD     .L2     B11,B4,B4         ; |153| 
||         ADD     .S2     4,B11,B11         ; |152| 

   [ A0]   CALL    .S1     log10sp           ; |153| 
||         STW     .D2T1   A4,*B4            ; |153| 

           ; BRANCHCC OCCURS {$C$L2}         ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(60),B4
           MVK     .S2     0xc9,B5
           ZERO    .L2     B11
           MV      .L1     A12,A11
           MV      .L1X    B5,A10
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(64)
||         CALL    .S1     log10sp_c         ; |156| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A11++,A4         ; |156| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |156| 
$C$RL3:    ; CALL OCCURS {log10sp_c} {0}     ; |156| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(64),B4       ; |156| 
||         SUB     .L1     A10,1,A0          ; |155| 
||         SUB     .S1     A10,1,A10         ; |155| 

   [!A0]   ZERO    .L2     B6
|| [!A0]   MVKL    .S1     0x3eaaa872,A5

   [!A0]   MVKL    .S2     0xbf000003,B5
   [!A0]   LDW     .D2T2   *+SP(64),B31
   [!A0]   MVKL    .S1     0xbe6bd0fc,A3
           LDW     .D2T2   *B4,B4            ; |156| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |155| 

           ADD     .L2     B11,B4,B4         ; |156| 
||         ADD     .S2     4,B11,B11         ; |155| 

   [ A0]   CALL    .S2     log10sp_c         ; |156| 
||         STW     .D2T1   A4,*B4            ; |156| 
|| [!A0]   MVKL    .S1     0x3e436581,A4

           ; BRANCHCC OCCURS {$C$L3}         ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17

           SET     .S2     B6,0x14,0x1d,B24
||         MVKL    .S1     0xfefa39ec,A10
||         ZERO    .L2     B6
||         ADD     .D2     4,B31,B13

           MVKL    .S2     0x3ede5bd9,B4
||         MVKL    .S1     0x3fe62e42,A11
||         LDW     .D2T2   *B13,B18
||         ZERO    .L2     B16               ; |83| 

           MVK     .S1     0xfffffc01,A6
||         MVKL    .S2     0xbe804d66,B7
||         MV      .L2X    A12,B17

           MVKL    .S1     0x3fdbcb7b,A9
||         MVKL    .S2     ti_math_logtable,B8
||         STW     .D2T1   A6,*+SP(32)

           MVKL    .S1     0x1526e872,A8
||         MVKL    .S2     0x439a209a,B9
||         MV      .L2X    A6,B22

           MVKL    .S1     0x7f7fffff,A14
||         MVKH    .S2     0xbf000003,B5

           MVKH    .S1     0x3eaaa872,A5
||         MVKH    .S2     0xff800000,B6
||         STW     .D2T2   B5,*+SP(28)

           MVKH    .S1     0xbe6bd0fc,A3
||         MVKH    .S2     0x3ede5bd9,B4
||         STW     .D2T2   B6,*+SP(40)
||         MV      .L2     B6,B20

           MVKH    .S1     0x3e436581,A4
||         MVKH    .S2     0xbe804d66,B7
||         STW     .D2T2   B4,*+SP(12)
||         MV      .L2X    A5,B23

           MVKH    .S1     0xfefa39ec,A10
||         MVKH    .S2     ti_math_logtable,B8
||         MV      .L2     B7,B25
||         MV      .D2     B24,B7

           MVKH    .S1     0x3fe62e42,A11
||         MVKH    .S2     0x439a209a,B9
||         MV      .L1     A10,A16
||         STW     .D2T2   B8,*+SP(36)
||         MV      .L2X    A4,B24

           MVKH    .S1     0x3fdbcb7b,A9
||         MV      .L1     A11,A17
||         STW     .D2T2   B9,*+SP(44)
||         DINT                              ; interrupts off
||         MV      .L2X    A3,B26

           MVKH    .S1     0x1526e872,A8
||         STW     .D2T1   A9,*+SP(56)       ; |83| 
||         MV      .L1     A9,A19
||         MV      .L2     B4,B27
||         MV      .S2     B9,B19

           MVKH    .S1     0x7f7fffff,A14
||         STW     .D2T1   A8,*+SP(52)       ; |83| 
||         MV      .L1     A8,A18
||         MV      .L2     B8,B21
||         ZERO    .S2     B6                ; |83| 

           MVK     .S1     0xc9,A7
||         STW     .D2T1   A4,*+SP(20)
||         ZERO    .L1     A4                ; |83| 

           STW     .D2T1   A3,*+SP(16)
||         MV      .L1     A14,A3
||         SUB     .S1     A7,1,A1

           STW     .D2T1   A5,*+SP(24)
||         MV      .L1X    B5,A5

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/log10sp/log10sp_d.c
;*      Loop source line                 : 158
;*      Loop opening brace source line   : 158
;*      Loop closing brace source line   : 160
;*      Known Minimum Trip Count         : 201                    
;*      Known Maximum Trip Count         : 201                    
;*      Known Max Trip Count Factor      : 201
;*      Loop Carried Dependency Bound(^) : 73
;*      Unpartitioned Resource Bound     : 13
;*      Partitioned Resource Bound(*)    : 13
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        4     
;*      .S units                     3        9     
;*      .D units                     0        3     
;*      .M units                    13*      10     
;*      .X cross paths              12        2     
;*      .T address paths             0        3     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           4        8     (.L or .S unit)
;*      Addition ops (.LSD)          0        7     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             4       11     
;*      Bound(.L .S .D .LS .LSD)     3       11     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 73 Did not find schedule
;*         ii = 74 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: | * ***  **      ****            |      **        ************    |
;*       1: | * ***  **      ****            |      **        ************    |
;*       2: | * ***  **      ****            |      **        ************    |
;*       3: | * ***  **      ****            |      **        ************    |
;*       4: | * ***  **      ****            |      **        ************    |
;*       5: | * ***  **      ****            |      **        *************   |
;*       6: | * ***  **      ****            |      **        *************   |
;*       7: | * ***  **      ****            |    ****        *************   |
;*       8: | * ***  **      ****            |      **        *************   |
;*       9: | * ***  **      ****            |     ***        *************   |
;*      10: | * ***  **      ****            |      ** *      *************   |
;*      11: | * ***  **      ****            |    ******      *************   |
;*      12: | * ***  **      ****            |    *****       **************  |
;*      13: | * ***  **      ****            |      ***       **************  |
;*      14: | * ***  **      ****            |      ***       **************  |
;*      15: | * ***  **      ****            |      ***       **************  |
;*      16: | * ***  **      ****            |      ***       **************  |
;*      17: | * ***  **      ****            |      ***       **************  |
;*      18: | * ***  **      ****            |    ****        **************  |
;*      19: | * ***  **      ****            |    ****        **************  |
;*      20: | * ***  **      ****            |      **        **************  |
;*      21: | * ***  **      ****            |      **        **************  |
;*      22: | * ***  **      ****            |    ****        **************  |
;*      23: | * ***  **      ****            |    ****        **************  |
;*      24: | * ***  **      ****            |    ****        **************  |
;*      25: | * ***  **      ****            |    ******      **************  |
;*      26: | * ***  **      ****            |    ******      **************  |
;*      27: | * ***  **      ****            |      ****      **************  |
;*      28: | * ***  **      ****            |      ****      **************  |
;*      29: | * ***  **      ****            |      ****      **************  |
;*      30: | * ***  **      ****            |      ****      **************  |
;*      31: | * ***  **      ****            |      **        **************  |
;*      32: | * ***  **      ****            |      **        **************  |
;*      33: | * *******      ****            |    *****       **************  |
;*      34: | * *******      ****            |    ******      *************   |
;*      35: | * ***  **      ****            |      ***       *************   |
;*      36: | * ***  **      ****            |      **        *************   |
;*      37: | * ***  **      ******          |    * **        *************   |
;*      38: | * ***  **      ******          |    ****        *************   |
;*      39: | * ***  **      *******         |      ***       *************   |
;*      40: | * *******      *******         |      ***       *************   |
;*      41: | * *******      *******         |    * ***       *************   |
;*      42: | * *******      *******         |    *****       *************   |
;*      43: | * *******      *******         |    * **        *************   |
;*      44: | * ***  **      *******         |    * **        *************   |
;*      45: | * ***  **      *******         |    * **        *************   |
;*      46: | * ***  **      *******         |    ****        *************   |
;*      47: | * ***  **      *******         |      **        *************   |
;*      48: | * ***  **      *******         |      **        *************   |
;*      49: | * ***  **      *******         |      **        *************   |
;*      50: | * *******      *******         |    * **        *************   |
;*      51: | * *******      ******          |      **        *************   |
;*      52: | * ***  **      ****            |      **        *************   |
;*      53: | * ***  **      ****            |      **        *************   |
;*      54: | * ***  **      ****            |    * **        *************   |
;*      55: | * ***  **      ****            |      **        *************   |
;*      56: | * ***  **      ****            |      **        *************   |
;*      57: | * *******      ****            |      **        *************   |
;*      58: | * *******      ****            |    * **        *************   |
;*      59: | * *******      ****            |      **        *************   |
;*      60: | * *******      ****            |    ****        *************   |
;*      61: | * *******      ****            |    ****        *************   |
;*      62: | * ***  **      ****            |      **        *************   |
;*      63: | * ***  **      ****            |      **        *************   |
;*      64: | * ***  **      ****            |      **        *************   |
;*      65: | * ***  **      ****            |      **        *************   |
;*      66: | * ***  **      ****            |      **        *************   |
;*      67: | * ***  **      ****            |    ****        *************   |
;*      68: | * ***  **      ****            |      **        *************   |
;*      69: | * ***  **      ****            |      **        *************   |
;*      70: | * ***  **      ****            |      **        *************   |
;*      71: |** ***  **      ****            |    * **        *************   |
;*      72: |** ***  **      ****            |    * **        ************    |
;*      73: | * ***  **      ****            |    ****        ************    |
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
;*      Total cycles (est.)         : 0 + min_trip_cnt * 74 = 14874        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A1,1,A1
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C100:
;*   0              LDW     .D2T2   *B17++,B28        ; |83|  ^ 
;*   1              NOP             4
;*   5              SPDP    .S2     B28,B5:B4         ; |83|  ^ 
;*   6              NOP             1
;*   7              RCPDP   .S2     B5:B4,B5:B4       ; |83|  ^ 
;*   8              NOP             1
;*   9              CLR     .S2     B5,0,16,B9        ; |83|  ^ 
;*  10              MV      .D2     B9,B5             ; |83|  ^ 
;*     ||           MV      .L2     B16,B4            ; |83| 
;*     ||           EXTU    .S2     B9,1,21,B8        ; |83| 
;*  11              MPYSPDP .M2     B28,B5:B4,B5:B4   ; |83|  ^ 
;*     ||           ADD     .L2     B22,B8,B8         ; |83| 
;*     ||           EXTU    .S2     B9,12,29,B29      ; |83| 
;*  12              NOP             5
;*  17              INTDP   .L2     B8,B5:B4          ; |83| 
;*  18              SUBDP   .L2     B5:B4,B7:B6,B9:B8 ; |83|  ^ 
;*  19              NOP             4
;*  23              MPYDP   .M1X    A17:A16,B5:B4,A7:A6 ; |83| 
;*  24              NOP             1
;*  25              DPSP    .L2     B9:B8,B29         ; |83|  ^ 
;*  26              NOP             1
;*  27              MPYDP   .M1X    A9:A8,B9:B8,A21:A20 ; |83| 
;*  28              LDDW    .D2T2   *+B21[B29],B5:B4  ; |83| 
;*  29              MPYSP   .M2     B29,B29,B8        ; |83|  ^ 
;*  30              MPYSP   .M2     B24,B29,B9        ; |83|  ^ 
;*  31              NOP             2
;*  33              SUBDP   .L1X    B5:B4,A7:A6,A7:A6 ; |83| 
;*     ||           MPYSP   .M2     B8,B29,B4         ; |83| 
;*  34              ADDSP   .L2     B25,B9,B4         ; |83|  ^ 
;*     ||           MPYSP   .M2     B26,B8,B5         ; |83|  ^ 
;*  35              MPYSP   .M2     B8,B8,B8          ; |83| 
;*     ||           MPYSP   .M1X    A5,B8,A22         ; |83| 
;*  36              NOP             1
;*  37              MPYSP   .M2     B23,B4,B4         ; |83| 
;*  38              ADDSP   .L2     B5,B4,B5          ; |83|  ^ 
;*  39              NOP             1
;*  40              MPYDP   .M1     A19:A18,A7:A6,A7:A6 ; |83| 
;*  41              NOP             1
;*  42              MPYSP   .M2     B8,B5,B5          ; |83|  ^ 
;*  43              NOP             3
;*  46              ADDSP   .L2     B5,B4,B4          ; |83|  ^ 
;*  47              NOP             3
;*  50              ADDDP   .L1     A7:A6,A21:A20,A7:A6 ; |83| 
;*     ||           ADDSP   .L2X    B4,A22,B4         ; |83|  ^ 
;*  51              NOP             3
;*  54              MPYSP   .M2     B27,B4,B4         ; |83|  ^ 
;*  55              NOP             3
;*  58              SPDP    .S2     B4,B5:B4          ; |83|  ^ 
;*  59              NOP             1
;*  60              ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |83|  ^ 
;*  61              NOP             6
;*  67              DPSP    .L2     B5:B4,B4          ; |83|  ^ 
;*  68      [ A1]   BDEC    .S1     $C$C100,A1        ; |158| 
;*  69              NOP             1
;*  70              CMPGTSP .S1X    B28,A4,A0         ; |83| 
;*  71      [!A0]   MV      .L2     B20,B4            ; |83| 
;*     ||           CMPGTSP .S1X    B28,A3,A0         ; |83| 
;*  72      [!A0]   MV      .S2     B4,B5             ; |83|  ^ 
;*     ||   [ A0]   MV      .L2     B19,B5            ; |83| 
;*  73              STW     .D2T2   B5,*B18++         ; |83|  ^ 
;*  74              ; BRANCHCC OCCURS {$C$C100}       ; |158| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 74
           LDW     .D2T2   *B17++,B28        ; |83| <0,0>  ^ 
           NOP             4
           SPDP    .S2     B28,B5:B4         ; |83| <0,5>  ^ 
           NOP             1
           RCPDP   .S2     B5:B4,B5:B4       ; |83| <0,7>  ^ 
           NOP             1
           CLR     .S2     B5,0,16,B9        ; |83| <0,9>  ^ 

           MV      .L2     B16,B4            ; |83| <0,10> 
||         EXTU    .S2     B9,1,21,B8        ; |83| <0,10> 
||         MV      .D2     B9,B5             ; |83| <0,10>  ^ 

           EXTU    .S2     B9,12,29,B29      ; |83| <0,11> 
||         ADD     .L2     B22,B8,B8         ; |83| <0,11> 
||         MPYSPDP .M2     B28,B5:B4,B5:B4   ; |83| <0,11>  ^ 

           NOP             5
           INTDP   .L2     B8,B5:B4          ; |83| <0,17> 
           SUBDP   .L2     B5:B4,B7:B6,B9:B8 ; |83| <0,18>  ^ 
           NOP             4
           MPYDP   .M1X    A17:A16,B5:B4,A7:A6 ; |83| <0,23> 
           NOP             1
           DPSP    .L2     B9:B8,B29         ; |83| <0,25>  ^ 
           NOP             1
           MPYDP   .M1X    A9:A8,B9:B8,A21:A20 ; |83| <0,27> 
           LDDW    .D2T2   *+B21[B29],B5:B4  ; |83| <0,28> 
           MPYSP   .M2     B29,B29,B8        ; |83| <0,29>  ^ 
           MPYSP   .M2     B24,B29,B9        ; |83| <0,30>  ^ 
           NOP             2

           SUBDP   .L1X    B5:B4,A7:A6,A7:A6 ; |83| <0,33> 
||         MPYSP   .M2     B8,B29,B4         ; |83| <0,33> 

           MPYSP   .M2     B26,B8,B5         ; |83| <0,34>  ^ 
||         ADDSP   .L2     B25,B9,B4         ; |83| <0,34>  ^ 

           MPYSP   .M1X    A5,B8,A22         ; |83| <0,35> 
||         MPYSP   .M2     B8,B8,B8          ; |83| <0,35> 

           NOP             1
           MPYSP   .M2     B23,B4,B4         ; |83| <0,37> 
           ADDSP   .L2     B5,B4,B5          ; |83| <0,38>  ^ 
           NOP             1
           MPYDP   .M1     A19:A18,A7:A6,A7:A6 ; |83| <0,40> 
           NOP             1
           MPYSP   .M2     B8,B5,B5          ; |83| <0,42>  ^ 
           NOP             3
           ADDSP   .L2     B5,B4,B4          ; |83| <0,46>  ^ 
           NOP             3

           ADDDP   .L1     A7:A6,A21:A20,A7:A6 ; |83| <0,50> 
||         ADDSP   .L2X    B4,A22,B4         ; |83| <0,50>  ^ 

           NOP             3
           MPYSP   .M2     B27,B4,B4         ; |83| <0,54>  ^ 
           NOP             3
           SPDP    .S2     B4,B5:B4          ; |83| <0,58>  ^ 
           NOP             1
           ADDDP   .L2X    B5:B4,A7:A6,B5:B4 ; |83| <0,60>  ^ 
           NOP             6
           DPSP    .L2     B5:B4,B4          ; |83| <0,67>  ^ 
   [ A1]   BDEC    .S1     $C$L5,A1          ; |158| <0,68> 
           NOP             1
           CMPGTSP .S1X    B28,A4,A0         ; |83| <0,70> 

           CMPGTSP .S1X    B28,A3,A0         ; |83| <0,71> 
|| [!A0]   MV      .L2     B20,B4            ; |83| <0,71> 

   [ A0]   MV      .L2     B19,B5            ; |83| <0,72> 
|| [!A0]   MV      .S2     B4,B5             ; |83| <0,72>  ^ 

           STW     .D2T2   B5,*B18++         ; |83| <0,73>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           STW     .D2T2   B26,*+SP(16)
           STW     .D2T2   B24,*+SP(20)
           STW     .D2T2   B23,*+SP(24)
           STW     .D2T2   B22,*+SP(32)
           STW     .D2T2   B21,*+SP(36)
           STW     .D2T2   B20,*+SP(40)
           STW     .D2T2   B19,*+SP(44)
           STW     .D2T1   A19,*+SP(56)
           STW     .D2T1   A18,*+SP(52)

           MV      .L1     A4,A13
||         STW     .D2T1   A5,*+SP(28)

           RINT                              ; interrupts on
||         MV      .L1     A3,A14
||         MV      .D1     A16,A10
||         STW     .D2T2   B27,*+SP(12)
||         MVK     .S1     0xc9,A6           ; |161| 

           CALLP   .S2     log10sp_v,B3
||         LDW     .D2T2   *+B10(16),B4      ; |161| 
||         MV      .L1     A12,A4            ; |161| 
||         MV      .L2     B7,B12
||         MV      .S1     A17,A11
||         MV      .D1X    B25,A15

$C$RL4:    ; CALL OCCURS {log10sp_v} {0}     ; |161| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 48
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0x88e368f1,B6

           MV      .L2     B10,B5
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     fcn_pass,B4
           MVKL    .S2     output,B31
           MVKH    .S2     0x3ee4f8b5,B7

           ADD     .L1X    4,B13,A3
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           MVKH    .S2     output,B31
||         STW     .D2T1   A3,*+SP(68)

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     fcn_pass,B5

           MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     fcn_pass,B5

           ADD     .L1     4,A3,A3
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A4,*+B5(16)       ; |69| 
           ADD     .L2     8,B5,B4
           STW     .D2T2   B4,*+SP(76)       ; |69| 
           STW     .D2T1   A3,*+SP(72)

   [!A0]   B       .S1     $C$L7             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |165| 
   [!A0]   ZERO    .L1     A3                ; |72| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S1     all_pass,A4
   [!A0]   MVKH    .S1     all_pass,A4
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
||         MVK     .S1     0x1,A3            ; |72| 

   [!A0]   ZERO    .L1     A3                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |165| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x1,A4            ; |165| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |165| 

$C$RL9:    ; CALL OCCURS {print_test_results} {0}  ; |165| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S2     a_sc,B4
||         MVK     .L2     -1,B6             ; |178| 
||         ZERO    .D2     B11

           MVKH    .S2     a_sc,B4
||         ZERO    .L2     B10
||         MVK     .D2     0x7,B29

           LDW     .D2T2   *+SP(40),B5       ; |178| 
||         MV      .L2     B4,B7             ; |173| 
||         MVKL    .S2     0x7f7fffff,B31

           STW     .D2T2   B6,*+B7(24)       ; |178| 
||         MV      .L2     B7,B6
||         MVKH    .S2     0xbf800000,B11

           ZERO    .L1     A5
||         MV      .L2     B6,B30            ; |175| 
||         SET     .S2     B10,0x17,0x1d,B10
||         STW     .D2T2   B29,*+SP(48)      ; |177| 

           MVKH    .S2     0x7f7fffff,B31
||         MVKH    .S1     0x80000000,A5
||         MV      .L1     A13,A4            ; |173| 
||         STDW    .D2T2   B11:B10,*+B30(16) ; |177| 

           MV      .L1X    B4,A12            ; |173| 
||         ADD     .L2     1,B31,B4
||         STDW    .D2T1   A5:A4,*B30        ; |173| 

           STDW    .D2T2   B5:B4,*+B6(8)     ; |175| 
           LDW     .D1T1   *A12,A3           ; |180| 
           CALL    .S1     log10             ; |180| 
           ZERO    .L2     B10
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |180| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL10,B3,0      ; |180| 
$C$RL10:   ; CALL OCCURS {log10} {0}         ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |180| 
           DPSP    .L1     A5:A4,A3          ; |180| 
           NOP             3
           ADD     .L2     B10,B4,B4         ; |180| 
           STW     .D2T1   A3,*B4            ; |180| 

           CALLP   .S2     __c6xabi_isinff,B3
||         LDW     .D1T1   *A12,A4           ; |181| 

$C$RL11:   ; CALL OCCURS {__c6xabi_isinff} {0}  ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           MV      .L1     A4,A0             ; |181| 

           MV      .L1     A0,A2             ; |181| branch predicate copy
|| [ A0]   LDW     .D1T1   *A12,A3           ; |181| 
|| [!A0]   B       .S1     $C$L10            ; |181| 

   [!A2]   CALL    .S1     log10sp           ; |181| 
   [!A2]   LDW     .D1T1   *A12,A4           ; |181| 
           NOP             2
           CMPGTSP .S1     A3,A13,A0         ; |181| 
           ; BRANCHCC OCCURS {$C$L10}        ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
   [!A0]   B       .S1     $C$L9             ; |181| 
   [ A0]   CALL    .S1     log10             ; |181| 
   [ A0]   SPDP    .S1     A3,A5:A4          ; |181| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L9}         ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL12,B3,0      ; |181| 
$C$RL12:   ; CALL OCCURS {log10} {0}         ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S1     $C$L11            ; |181| 
||         DPSP    .L1     A5:A4,A3          ; |181| 
||         MVKL    .S2     output,B5

           MVKH    .S2     output,B5
           LDW     .D2T2   *+B5(4),B5        ; |181| 
           NOP             2
           MV      .L2X    A3,B4             ; |181| 
           ; BRANCH OCCURS {$C$L11}          ; |181| 
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     log10sp           ; |181| 
           LDW     .D1T1   *A12,A4           ; |181| 
           NOP             3
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL13,B3,0      ; |181| 
$C$RL13:   ; CALL OCCURS {log10sp} {0}       ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           SPDP    .S1     A4,A5:A4          ; |181| 
           MVKL    .S2     output,B5
           DPSP    .L1     A5:A4,A3          ; |181| 
           MVKH    .S2     output,B5
           LDW     .D2T2   *+B5(4),B5        ; |181| 
           NOP             2
           MV      .L2X    A3,B4             ; |181| 
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 8
           NOP             1
           ADD     .L2     B10,B5,B5         ; |181| 

           STW     .D2T2   B4,*B5            ; |181| 
||         CALL    .S1     log10sp_c         ; |182| 

           LDW     .D1T1   *A12,A4           ; |182| 
           ADDKPC  .S2     $C$RL14,B3,3      ; |182| 
$C$RL14:   ; CALL OCCURS {log10sp_c} {0}     ; |182| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 91
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |182| 
           ZERO    .L1     A8                ; |83| 
           ZERO    .L1     A9
           LDW     .D2T1   *+SP(32),A6       ; |83| 
           LDW     .D2T1   *+SP(36),A30      ; |83| 
           ADD     .L2     B10,B4,B4         ; |182| 
           STW     .D2T1   A4,*B4            ; |182| 
           LDW     .D1T1   *A12++,A3         ; |183| 
           SET     .S1     A9,0x14,0x1d,A9
           MVKL    .S2     0x3fe62e42,B5
           LDW     .D2T1   *+SP(20),A29      ; |83| 
           MVKH    .S2     0x3fe62e42,B5
           SPDP    .S1     A3,A5:A4          ; |83| 
           MVKL    .S2     0x3fdbcb7b,B7
           RCPDP   .S1     A5:A4,A5:A4       ; |83| 
           LDW     .D2T1   *+SP(16),A28      ; |83| 

           CLR     .S1     A5,0,16,A16       ; |83| 
||         ZERO    .L1     A4                ; |83| 

           MV      .L1     A16,A5            ; |83| 
           MPYSPDP .M1     A3,A5:A4,A5:A4    ; |83| 
           EXTU    .S1     A16,1,21,A7       ; |83| 
           ADD     .L1     A6,A7,A6          ; |83| 
           INTDP   .L1     A6,A7:A6          ; |83| 
           LDW     .D2T1   *+SP(24),A26      ; |83| 
           MVKL    .S2     0x1526e872,B6
           MVKL    .S2     0xfefa39ec,B4
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |83| 
           MVKH    .S2     0xfefa39ec,B4
           MPYDP   .M2X    B5:B4,A7:A6,B5:B4 ; |83| 
           LDW     .D2T2   *+SP(28),B8       ; |83| 
           MVKH    .S2     0x3fdbcb7b,B7
           EXTU    .S1     A16,12,29,A31     ; |83| 
           LDDW    .D1T1   *+A30[A31],A9:A8  ; |83| 
           DPSP    .L1     A5:A4,A17         ; |83| 
           MVKH    .S2     0x1526e872,B6
           MV      .L1X    B7,A7             ; |83| 
           LDW     .D2T2   *+SP(12),B31      ; |83| 
           MPYSP   .M1     A17,A17,A16       ; |83| 
           MPYSP   .M1     A29,A17,A6        ; |83| 
           SUBDP   .L2X    A9:A8,B5:B4,B5:B4 ; |83| 
           MVKL    .S2     output+12,B30
           MPYSP   .M1     A28,A16,A9        ; |83| 

           ADDSP   .L1     A15,A6,A8         ; |83| 
||         MV      .S1X    B6,A6             ; |83| 

           MPYDP   .M2X    B7:B6,A5:A4,B7:B6 ; |83| 
           MPYSP   .M1     A16,A16,A27       ; |83| 
           MPYSP   .M1     A16,A17,A4        ; |83| 
           ADDSP   .L1     A9,A8,A5          ; |83| 
           MVKH    .S2     output+12,B30
           CMPGTSP .S1     A3,A13,A1         ; |85| 
           MPYSP   .M1     A26,A4,A4         ; |83| 
           MPYSP   .M1     A27,A5,A5         ; |83| 
           MPYSP   .M2X    B8,A16,B8         ; |83| 
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |83| 
           CMPGTSP .S1     A3,A14,A0         ; |88| 
           ADDSP   .L1     A5,A4,A4          ; |83| 
           NOP             4
           ADDSP   .L2X    A4,B8,B8          ; |83| 
           NOP             2
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |83| 
           MPYSP   .M2     B31,B8,B6         ; |83| 
           NOP             3
           SPDP    .S2     B6,B7:B6          ; |83| 
           NOP             1
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |83| 
           LDW     .D2T2   *B30,B6           ; |183| 
           NOP             5

           DPSP    .L2     B5:B4,B4          ; |83| 
|| [!A1]   LDW     .D2T2   *+SP(40),B4       ; |88| 
||         ADD     .S2     B10,B6,B5         ; |183| 

   [ A0]   LDW     .D2T2   *+SP(44),B4       ; |86| 
           LDW     .D2T2   *+SP(48),B6       ; |89| 
           ADD     .S2     4,B10,B10         ; |179| 
           NOP             2
           STW     .D2T2   B4,*B5            ; |183| 

           SUB     .L1X    B6,1,A0           ; |179| 
||         SUB     .L2     B6,1,B4           ; |179| 

   [ A0]   LDW     .D1T1   *A12,A3           ; |180| 
|| [ A0]   B       .S1     $C$L8             ; |179| 
|| [!A0]   MVKL    .S2     output,B10
||         STW     .D2T2   B4,*+SP(48)       ; |183| 

   [ A0]   CALL    .S1     log10             ; |180| 
|| [!A0]   MVKH    .S2     output,B10

   [!A0]   CALL    .S1     log10sp_v         ; |185| 
   [!A0]   LDW     .D2T2   *+B10(16),B4      ; |185| 
   [!A0]   MVKL    .S1     a_sc,A4
   [ A0]   SPDP    .S1     A3,A5:A4          ; |180| 
           ; BRANCHCC OCCURS {$C$L8}         ; |179| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           MVK     .L1     0x7,A6            ; |185| 

           ADDKPC  .S2     $C$RL15,B3,0      ; |185| 
||         MVKH    .S1     a_sc,A4

$C$RL15:   ; CALL OCCURS {log10sp_v} {0}     ; |185| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .L1     0x7,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B5
           MVKL    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .L1     0x7,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B5
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .L1     0x7,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL18:   ; CALL OCCURS {isequal} {0}       ; |68| 

           LDW     .D2T1   *+SP(68),A3       ; |68| 
||         MVKL    .S2     fcn_pass,B4

           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B4

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           MV      .L2     B10,B31           ; |69| 
||         STW     .D2T1   A3,*+SP(80)       ; |68| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .L1     0x7,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL19:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T1   *+SP(72),A3       ; |69| 
           MVKL    .S2     fcn_pass,B31
           MVKH    .S2     fcn_pass,B31
           STW     .D2T1   A4,*+B31(16)      ; |69| 
           STW     .D2T2   B11,*+SP(48)      ; |69| 

           MV      .L2X    A3,B4             ; |177| 
||         STW     .D2T1   A3,*+SP(84)       ; |177| 

           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T1   *+SP(76),A3
           NOP             3

   [!B0]   B       .S1     $C$L12            ; |72| 
|| [!B0]   ZERO    .L1     A4                ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     print_test_results ; |189| 
|| [ B0]   MV      .L2X    A3,B4
||         STW     .D2T1   A3,*+SP(88)       ; |72| 
|| [!B0]   MVKL    .S1     all_pass,A3

   [!B0]   MVKH    .S1     all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L12}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           CMPEQ   .L1     A4,0,A3           ; |72| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           MVK     .L1     0x1,A4            ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   ZERO    .L1     A4                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |189| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |189| 
||         ADDKPC  .S2     $C$RL20,B3,0      ; |189| 

$C$RL20:   ; CALL OCCURS {print_test_results} {0}  ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16

           LDW     .D2T2   *+SP(56),B11      ; |83| 
||         MVKL    .S2     0xc000cccc,B5

           LDW     .D2T2   *+SP(52),B10      ; |83| 
||         MVK     .S2     0xed,B30

           MVKL    .S2     0xcccccccd,B31
||         ZERO    .L1     A4                ; |83| 
||         STW     .D2T2   B12,*+SP(92)      ; |83| 

           MVKL    .S2     a_ext,B4
||         STW     .D2T1   A4,*+SP(56)       ; |192| 

           MVKH    .S2     0xc000cccc,B5
||         STW     .D2T2   B30,*+SP(52)      ; |192| 

           ZERO    .L1     A3
||         MVKH    .S2     0xcccccccd,B31
||         STW     .D2T2   B5,*+SP(108)      ; |198| 

           MVKH    .S2     a_ext,B4
||         SET     .S1     A3,0x17,0x17,A3
||         STW     .D2T2   B31,*+SP(104)     ; |198| 

           STW     .D2T1   A3,*B4            ; |192| 
           STW     .D2T2   B10,*+SP(96)      ; |83| 

           STW     .D2T2   B11,*+SP(100)     ; |83| 
||         MV      .L1X    B4,A12            ; |192| 

           LDW     .D1T1   *A12,A3           ; |194| 
           ZERO    .L2     B12               ; |83| 
           NOP             2
           CALL    .S1     log10             ; |194| 
           SPDP    .S2X    A3,B5:B4          ; |194| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 4
           NOP             2
           MV      .L1X    B5,A5             ; |194| 

           MV      .L1X    B4,A4             ; |194| 
||         ADDKPC  .S2     $C$RL21,B3,0      ; |194| 

$C$RL21:   ; CALL OCCURS {log10} {0}         ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |194| 
           DPSP    .L1     A5:A4,A3          ; |194| 
           NOP             3
           ADD     .L2     B12,B4,B4         ; |194| 
           STW     .D2T1   A3,*B4            ; |194| 

           CALLP   .S2     log10sp,B3
||         LDW     .D1T1   *A12,A4           ; |195| 

$C$RL22:   ; CALL OCCURS {log10sp} {0}       ; |195| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |195| 
           MV      .L2X    A4,B5             ; |195| 
           NOP             3
           ADD     .L2     B12,B4,B4         ; |195| 
           STW     .D2T2   B5,*B4            ; |195| 

           CALLP   .S2     log10sp_c,B3
||         LDW     .D1T1   *A12,A4           ; |196| 

$C$RL23:   ; CALL OCCURS {log10sp_c} {0}     ; |196| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 109
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |196| 
           LDW     .D2T1   *+SP(32),A30      ; |83| 
           MV      .L2     B11,B5            ; |83| 
           LDW     .D2T1   *+SP(36),A28      ; |83| 
           LDW     .D2T1   *+SP(20),A18      ; |83| 
           ADD     .L2     B12,B4,B4         ; |196| 
           STW     .D2T1   A4,*B4            ; |196| 
           LDW     .D1T1   *A12,A3           ; |197| 
           LDW     .D2T1   *+SP(16),A27
           LDW     .D2T1   *+SP(24),A25      ; |83| 
           LDW     .D2T2   *+SP(28),B8       ; |83| 
           MV      .L2     B10,B4            ; |83| 
           SPDP    .S1     A3,A5:A4          ; |83| 
           LDW     .D2T2   *+SP(12),B31      ; |83| 
           RCPDP   .S1     A5:A4,A5:A4       ; |83| 
           LDW     .D2T2   *B13,B30          ; |197| 

           CLR     .S1     A5,0,16,A16       ; |83| 
||         ZERO    .L1     A4                ; |83| 

           MV      .L1     A16,A5            ; |83| 
||         EXTU    .S1     A16,1,21,A31      ; |83| 

           MPYSPDP .M1     A3,A5:A4,A9:A8    ; |83| 
||         LDW     .D2T1   *+SP(92),A5       ; |83| 

           ADD     .L1     A30,A31,A4        ; |83| 

           INTDP   .L1     A4,A7:A6          ; |83| 
||         LDW     .D2T1   *+SP(56),A4       ; |83| 

           EXTU    .S1     A16,12,29,A29     ; |83| 
           CMPGTSP .S1     A3,A13,A1         ; |85| 
           CMPGTSP .S1     A3,A14,A0         ; |88| 
           ADD     .L2     B12,B30,B29       ; |197| 
           SUBDP   .L1     A9:A8,A5:A4,A9:A8 ; |83| 
           MPYDP   .M1     A11:A10,A7:A6,A5:A4 ; |83| 
           LDDW    .D1T1   *+A28[A29],A7:A6  ; |83| 
           ADD     .L2     4,B12,B12         ; |193| 
           NOP             3
           DPSP    .L1     A9:A8,A17         ; |83| 
           MPYDP   .M2X    B11:B10,A9:A8,B7:B6 ; |83| 
           NOP             2
           MPYSP   .M1     A17,A17,A16       ; |83| 
           MPYSP   .M1     A18,A17,A18       ; |83| 
           SUBDP   .S1     A7:A6,A5:A4,A5:A4 ; |83| 
           NOP             1
           MPYSP   .M1     A27,A16,A7        ; |83| 
           ADDSP   .L1     A15,A18,A6        ; |83| 
           MPYSP   .M1     A16,A16,A26       ; |83| 
           MPYSP   .M1     A16,A17,A8        ; |83| 
           MPYSP   .M2X    B8,A16,B8         ; |83| 
           ADDSP   .L1     A7,A6,A6          ; |83| 
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |83| 
           MPYSP   .M1     A25,A8,A4         ; |83| 
           NOP             1
           MPYSP   .M1     A26,A6,A5         ; |83| 
           NOP             3
           ADDSP   .L1     A5,A4,A4          ; |83| 
           NOP             4
           ADDSP   .L2X    A4,B8,B8          ; |83| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |83| 
           NOP             2
           MPYSP   .M2     B31,B8,B6         ; |83| 
           NOP             3
           SPDP    .S2     B6,B7:B6          ; |83| 
           NOP             1
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |83| 
           NOP             6

           DPSP    .L2     B5:B4,B4          ; |83| 
|| [!A1]   LDW     .D2T2   *+SP(40),B4       ; |88| 

   [ A0]   LDW     .D2T2   *+SP(44),B4       ; |86| 
           LDW     .D2T2   *+SP(108),B5
           NOP             3
           STW     .D2T2   B4,*B29           ; |197| 
           LDW     .D1T2   *A12,B6           ; |198| 
           LDW     .D2T2   *+SP(104),B4
           NOP             4
           MPYSPDP .M2     B6,B5:B4,B5:B4    ; |198| 
           NOP             6

           DPSP    .L2     B5:B4,B4          ; |198| 
||         LDW     .D2T2   *+SP(52),B5

           NOP             3
           STW     .D1T2   B4,*++A12         ; |198| 

           SUB     .L1X    B5,1,A0           ; |193| 
||         SUB     .L2     B5,1,B4           ; |193| 

   [ A0]   BNOP    .S1     $C$L13,1          ; |193| 
|| [ A0]   LDW     .D1T1   *A12,A3           ; |194| 
|| [!A0]   MVKL    .S2     output,B10
||         STW     .D2T2   B4,*+SP(52)       ; |198| 

   [!A0]   MVKL    .S1     a_ext,A4
   [!A0]   MVKH    .S2     output,B10
   [ A0]   CALL    .S1     log10             ; |194| 

   [!A0]   CALL    .S1     log10sp_v         ; |200| 
||         SPDP    .S2X    A3,B5:B4          ; |194| 
|| [!A0]   LDW     .D2T2   *+B10(16),B4      ; |200| 

           ; BRANCHCC OCCURS {$C$L13}        ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           MVKH    .S1     a_ext,A4
           MVK     .S1     0xed,A6           ; |200| 
           ADDKPC  .S2     $C$RL24,B3,2      ; |200| 
$C$RL24:   ; CALL OCCURS {log10sp_v} {0}     ; |200| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xed,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B11
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B11
           MVKL    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B11(4)       ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0xed,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D2T1   A4,*+B11(8)       ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0xed,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL27:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T1   *+SP(68),A3       ; |68| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L2     B10,B4            ; |68| 
||         STW     .D2T1   A4,*+B11(12)      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0xed,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL28:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(72),A3       ; |69| 
           LDW     .D2T2   *+SP(76),B4
           STW     .D2T1   A4,*+B11(16)      ; |69| 
           NOP             2
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [!A0]   B       .S1     $C$L14            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |204| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   ZERO    .L1     A3                ; |72| 
   [!A0]   MVKL    .S1     all_pass,A4
   [!A0]   MVKH    .S1     all_pass,A4
           ; BRANCHCC OCCURS {$C$L14}        ; |72| 
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
           CALL    .S1     print_test_results ; |204| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x4,A4            ; |204| 
||         ADDKPC  .S2     $C$RL29,B3,0      ; |204| 

$C$RL29:   ; CALL OCCURS {print_test_results} {0}  ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15

           ZERO    .L2     B5                ; |114| 
||         ZERO    .D2     B4                ; |114| 
||         MVKL    .S2     cycle_counts+24,B7

           MVKH    .S2     cycle_counts+24,B7
||         STW     .D2T2   B4,*+SP(52)       ; |114| 
||         ZERO    .L2     B6                ; |114| 

           MVC     .S2     B6,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B7         ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     0x49742410,A12
           MVKL    .S1     t_offset,A3

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKH    .S1     0x49742410,A12

           CALL    .S1     gimme_random      ; |214| 
||         EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 

           LDW     .D2T2   *+SP(48),B4       ; |214| 
||         ADD     .L2     B4,B5,B7          ; |117| 
||         MVKH    .S1     t_offset,A3

           STDW    .D1T2   B7:B6,*A3         ; |117| 
||         MV      .L1     A12,A4            ; |214| 
||         MVK     .S1     0x80,A10
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL30,B3,2      ; |214| 
$C$RL30:   ; CALL OCCURS {gimme_random} {0}  ; |214| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 96
           MVKL    .S2     input,B13
           MVKH    .S2     input,B13
           LDW     .D2T2   *B13,B4           ; |214| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |214| 

           STW     .D2T1   A4,*B4            ; |214| 
||         MVC     .S2     TSCL,B4           ; |122| 

           MVC     .S2     TSCH,B5           ; |122| 

           SPDP    .S1     A4,A7:A6          ; |83| 
||         LDW     .D2T1   *+SP(32),A5       ; |83| 
||         ZERO    .L1     A17
||         ZERO    .D1     A16               ; |83| 
||         MVKL    .S2     0xfefa39ec,B6

           MVKL    .S2     0x3fe62e42,B7
||         LDW     .D2T1   *+SP(36),A30      ; |83| 

           LDW     .D2T1   *+SP(20),A29      ; |83| 
||         RCPDP   .S1     A7:A6,A7:A6       ; |83| 

           MVKH    .S2     0xfefa39ec,B6

           CLR     .S1     A7,0,16,A3        ; |83| 
||         ZERO    .L1     A6                ; |83| 

           MV      .L1     A3,A7             ; |83| 
           MPYSPDP .M1     A4,A7:A6,A7:A6    ; |83| 
           LDW     .D2T1   *+SP(16),A28      ; |83| 
           MVKH    .S2     0x3fe62e42,B7
           EXTU    .S1     A3,1,21,A8        ; |83| 
           ADD     .L1     A5,A8,A5          ; |83| 
           INTDP   .L1     A5,A9:A8          ; |83| 
           SET     .S1     A17,0x14,0x1d,A17
           SUBDP   .L1     A7:A6,A17:A16,A7:A6 ; |83| 
           LDW     .D2T1   *+SP(24),A25      ; |83| 
           MVKL    .S2     0x3fdbcb7b,B9
           LDW     .D2T2   *+SP(28),B16      ; |83| 
           MPYDP   .M2X    B7:B6,A9:A8,B7:B6 ; |83| 
           MVKL    .S2     0x1526e872,B8
           MVKH    .S2     0x3fdbcb7b,B9
           DPSP    .L1     A7:A6,A5          ; |83| 
           EXTU    .S1     A3,12,29,A31      ; |83| 
           LDDW    .D1T1   *+A30[A31],A17:A16 ; |83| 
           MVKH    .S2     0x1526e872,B8
           MPYSP   .M1     A5,A5,A3          ; |83| 
           MPYSP   .M1     A29,A5,A8         ; |83| 
           MV      .L1X    B9,A9             ; |83| 
           SUBDP   .L2X    A17:A16,B7:B6,B7:B6 ; |83| 
           MPYSP   .M1     A28,A3,A17        ; |83| 

           ADDSP   .L1     A15,A8,A27        ; |83| 
||         MV      .S1X    B8,A8             ; |83| 

           MPYSP   .M1     A3,A3,A26         ; |83| 
           MPYDP   .M2X    B9:B8,A7:A6,B9:B8 ; |83| 
           MPYSP   .M1     A3,A5,A5          ; |83| 
           ADDSP   .L1     A17,A27,A6        ; |83| 
           LDW     .D2T2   *+SP(12),B31      ; |83| 
           CMPGTSP .S1     A4,A13,A1         ; |85| 
           MPYSP   .M1     A25,A5,A5         ; |83| 
           MPYSP   .M1     A26,A6,A6         ; |83| 
           MPYSP   .M2X    B16,A3,B16        ; |83| 
           MPYDP   .M2X    A9:A8,B7:B6,B7:B6 ; |83| 
           MVKL    .S2     output+12,B30
           ADDSP   .L1     A6,A5,A5          ; |83| 
           CMPGTSP .S1     A4,A14,A0         ; |88| 
           MVKH    .S2     output+12,B30
           MVKL    .S2     t_start,B12
           MVKH    .S2     t_start,B12
           ADDSP   .L2X    A5,B16,B16        ; |83| 
           STDW    .D2T2   B5:B4,*B12
           NOP             1
           ADDDP   .L2     B7:B6,B9:B8,B7:B6 ; |83| 
           MPYSP   .M2     B31,B16,B8        ; |83| 
           NOP             3
           SPDP    .S2     B8,B9:B8          ; |83| 
           NOP             1
           ADDDP   .L2     B9:B8,B7:B6,B7:B6 ; |83| 
           LDW     .D2T2   *B30,B8           ; |218| 
           NOP             5

           DPSP    .L2     B7:B6,B6          ; |83| 
|| [!A1]   LDW     .D2T2   *+SP(40),B6       ; |218| 

   [ A0]   LDW     .D2T2   *+SP(44),B6       ; |86| 
           ADD     .L2     B10,B8,B7         ; |218| 
           NOP             3

           STW     .D2T2   B6,*B7            ; |218| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B7           ; |128| 

           MVKL    .S2     t_offset,B11
||         MVKL    .S1     cycle_counts+24,A3
||         SUB     .L1     A10,1,A0          ; |212| 
||         ADD     .L2     4,B10,B10         ; |212| 
||         SUB     .D1     A10,1,A10         ; |212| 

           MVKH    .S2     t_offset,B11
||         MVKH    .S1     cycle_counts+24,A3

           MV      .L1     A3,A11            ; |130| 
||         LDDW    .D2T2   *B11,B17:B16      ; |130| 

           MVKL    .S1     t_stop,A24
           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           MVKH    .S1     t_stop,A24
           STDW    .D1T2   B7:B6,*A24        ; |128| 
           ADDU    .L2     B16,B4,B9:B8      ; |130| 

           ADD     .S2     B9,B17,B4         ; |130| 
||         SUBU    .L2     B6,B8,B9:B8       ; |130| 

           ADD     .L2     B4,B5,B4          ; |130| 
|| [ A0]   B       .S1     $C$L15            ; |212| 
||         EXT     .S2     B9,24,24,B5       ; |130| 

           SUB     .L2     B7,B4,B4          ; |130| 
||         ADDU    .L1X    A6,B8,A5:A4       ; |130| 

           ADD     .L2     B4,B5,B4          ; |130| 
||         ADD     .L1     A5,A7,A5          ; |130| 

   [ A0]   CALL    .S1     gimme_random      ; |214| 

           ADD     .L1X    A5,B4,A5          ; |130| 
|| [ A0]   LDW     .D2T2   *+SP(48),B4       ; |214| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T1   A5:A4,*A11        ; |130| 
|| [ A0]   MV      .L1     A12,A4            ; |214| 

           ; BRANCHCC OCCURS {$C$L15}        ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A11,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |135| 
$C$RL31:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A14
           SET     .S1     A14,0x1a,0x1d,A14
           MPYSP   .M1     A14,A4,A3         ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           ZERO    .L1     A12               ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL32:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MV      .L2X    A11,B6
           MV      .L2X    A12,B4

           MV      .L2X    A12,B5
||         MVK     .S2     24,B10

           SUB     .L2X    A11,B10,B10
||         STDW    .D2T1   A5:A4,*B6         ; |135| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B10        ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MV      .L1X    B12,A12           ; |116| 

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A12        ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 

           MVK     .S2     0x80,B4
||         ADD     .L2     B4,B5,B7          ; |117| 

           MV      .L1X    B13,A15

           MV      .L1X    B4,A11            ; |117| 
||         STDW    .D2T2   B7:B6,*B11        ; |117| 
||         ZERO    .S1     A10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A15,A3           ; |226| 
           NOP             4

           ADD     .L1     A10,A3,A3         ; |226| 
||         CALL    .S1     log10f            ; |226| 

           LDW     .D1T1   *A3,A4            ; |226| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |226| 
$C$RL33:   ; CALL OCCURS {log10f} {0}        ; |226| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     output,B4
||         SUB     .L1     A11,1,A0          ; |225| 
||         SUB     .S1     A11,1,A11         ; |225| 

           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |226| 
   [ A0]   BNOP    .S1     $C$L16,3          ; |225| 

           ADD     .L1X    A10,B4,A3         ; |226| 
||         ADD     .S1     4,A10,A10         ; |225| 

           STW     .D1T1   A4,*A3            ; |226| 
           ; BRANCHCC OCCURS {$C$L16}        ; |225| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A12,A7:A6        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MVKL    .S2     t_stop,B12
           MV      .L2     B4,B7             ; |128| 
           MVKH    .S2     t_stop,B12
           NOP             1
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B9,A3          ; |130| 
||         LDDW    .D2T2   *B10,B9:B8        ; |130| 

           SUBU    .L2X    B6,A4,B5:B4       ; |130| 
           ADD     .L1     A3,A7,A3          ; |130| 
           EXT     .S2     B5,24,24,B16      ; |130| 
           CALL    .S1     __c6xabi_fltllif  ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         SUB     .S2X    B7,A3,B8          ; |130| 

           ADD     .L2     B5,B9,B31         ; |130| 
||         ADD     .S2     B8,B16,B5         ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B31,B5,B4         ; |130| 

           STDW    .D2T2   B7:B6,*B12        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL34,B3,0      ; |130| 

$C$RL34:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A14,A4,A3         ; |130| 
           MV      .L1     A13,A11           ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             1
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL35:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MV      .L2X    A10,B4            ; |130| 

           MV      .L2X    A10,B5            ; |130| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(8)    ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 

           STDW    .D1T2   B7:B6,*A12        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B5       ; |117| 
||         SUB     .L2     B8,B7,B6          ; |117| 

           ADD     .L2     B6,B5,B5          ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A10,A13

           MV      .L1X    B4,A10            ; |117| 
||         LDW     .D2T2   *+SP(60),B13      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A15,A3           ; |234| 
           NOP             4

           ADD     .L1     A13,A3,A3         ; |234| 
||         CALL    .S1     log10sp           ; |234| 

           LDW     .D1T1   *A3,A4            ; |234| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |234| 
$C$RL36:   ; CALL OCCURS {log10sp} {0}       ; |234| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |234| 
||         SUB     .L1     A10,1,A0          ; |233| 
||         SUB     .S1     A10,1,A10         ; |233| 

   [ A0]   BNOP    .S1     $C$L17,3          ; |233| 

           ADD     .L1X    A13,B4,A3         ; |234| 
||         ADD     .S1     4,A13,A13         ; |233| 

           STW     .D1T1   A4,*A3            ; |234| 
           ; BRANCHCC OCCURS {$C$L17}        ; |233| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A12,A7:A6        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MV      .L2     B4,B7             ; |128| 
           NOP             3
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B9,A3          ; |130| 
||         LDDW    .D2T2   *+B10(8),B9:B8    ; |130| 

           ADD     .L1     A3,A7,A3          ; |130| 
||         SUBU    .L2X    B6,A4,B5:B4       ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           SUB     .L2X    B7,A3,B31         ; |130| 
           CALL    .S1     __c6xabi_fltllif  ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         MV      .S2     B12,B8            ; |130| 

           ADD     .L2     B5,B9,B30         ; |130| 
||         ADD     .S2     B31,B16,B5        ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B30,B5,B4         ; |130| 

           STDW    .D2T2   B7:B6,*B8         ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL37,B3,0      ; |130| 

$C$RL37:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A14,A4,A3         ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL38:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           ADDAD   .D2     B10,1,B12
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B12        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(16)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A12        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A10,A13

           MV      .L1X    B4,A10            ; |117| 
||         LDW     .D2T2   *+SP(64),B13      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A15,A3           ; |242| 
           NOP             4

           ADD     .L1     A13,A3,A3         ; |242| 
||         CALL    .S1     log10sp_c         ; |242| 

           LDW     .D1T1   *A3,A4            ; |242| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |242| 
$C$RL39:   ; CALL OCCURS {log10sp_c} {0}     ; |242| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |242| 
||         SUB     .L1     A10,1,A0          ; |241| 
||         SUB     .S1     A10,1,A10         ; |241| 

   [ A0]   BNOP    .S1     $C$L18,3          ; |241| 

           ADD     .L1X    A13,B4,A3         ; |242| 
||         ADD     .S1     4,A13,A13         ; |241| 

           STW     .D1T1   A4,*A3            ; |242| 
           ; BRANCHCC OCCURS {$C$L18}        ; |241| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MV      .L2     B4,B7             ; |128| 
||         LDDW    .D1T1   *A12,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MV      .L2     B10,B13           ; |130| 
           LDDW    .D2T2   *+B13(16),B17:B16 ; |130| 
           MVKL    .S2     t_stop,B31
           MVKH    .S2     t_stop,B31
           ADDU    .L2X    B8,A4,B5:B4       ; |130| 

           ADD     .S2     B5,B9,B8          ; |130| 
||         SUBU    .L2     B6,B4,B5:B4       ; |130| 

           ADD     .D2X    B8,A5,B8          ; |130| 
||         CALL    .S1     __c6xabi_fltllif  ; |130| 
||         EXT     .S2     B5,24,24,B9       ; |130| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 

           SUB     .L2     B7,B8,B8          ; |130| 
||         ADD     .S2     B5,B17,B5         ; |130| 

           ADD     .L2     B8,B9,B8          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 

           ADD     .L2     B5,B8,B4          ; |130| 
           STDW    .D2T2   B7:B6,*B31        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL40,B3,0      ; |130| 

$C$RL40:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 107
           MPYSP   .M1     A14,A4,A3         ; |130| 
           ZERO    .L1     A10               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL41:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 

           ADDAD   .D2     B12,1,B10
||         MV      .L2X    A10,B5

           MV      .L2X    A10,B4
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           STDW    .D2T2   B5:B4,*+B13(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 

           STDW    .D1T2   B7:B6,*A12        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           MVKL    .S1     output,A13
||         ADD     .L2     B31,B6,B5         ; |117| 

           MVKH    .S1     output,A13
||         MV      .L2X    A15,B9            ; |249| 
||         STDW    .D2T2   B5:B4,*B11        ; |117| 

           CALLP   .S2     log10sp_v,B3
||         LDW     .D1T2   *+A13(16),B4      ; |249| 
||         LDW     .D2T1   *B9,A4            ; |249| 
||         MVK     .S1     0x80,A6           ; |249| 

$C$RL42:   ; CALL OCCURS {log10sp_v} {0}     ; |249| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A12,A17:A16      ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MVK     .S1     16,A12
           ADD     .L1X    B10,A12,A12
           MVKL    .S1     t_stop,A3

           LDDW    .D1T1   *A12,A9:A8        ; |130| 
||         MVKH    .S1     t_stop,A3

           ADDU    .L1X    B6,A16,A7:A6      ; |130| 

           MV      .L2     B4,B9             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A7,B7,A3          ; |130| 

           SUBU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1     A3,A17,A3         ; |130| 
||         EXT     .S1     A5,24,24,A6       ; |130| 

           SUB     .S1X    B9,A3,A3          ; |130| 
||         ADDU    .L1     A8,A4,A5:A4       ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A3,A6,A5          ; |130| 

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL43:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           MPYSP   .M1     A14,A4,A3         ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL44:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6

           STDW    .D1T1   A5:A4,*A12        ; |130| 
||         MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D1T2   *+A13(4),B4       ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A13,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL45:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     fcn_pass,B10
           MVKH    .S2     0x3ee4f8b5,B7
           MVKH    .S2     0x88e368f1,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A13,A4           ; |67| 
||         MVKH    .S2     fcn_pass,B10

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A13(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A13(12),B4      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A13,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL47:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T1   *+SP(80),A3       ; |68| 
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           LDW     .D1T1   *A13,A4           ; |69| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL48:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(84),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           LDW     .D2T2   *+SP(88),B5
           NOP             3

   [!B0]   B       .S1     $C$L19            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B5,B0            ; |72| 
   [ B1]   ADD     .L2     4,B5,B5
           NOP             3
           ; BRANCHCC OCCURS {$C$L19}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
   [ B0]   LDW     .D2T2   *B5,B5            ; |72| 
           CMPEQ   .L2     B4,0,B6           ; |72| 
           XOR     .L2     1,B6,B31          ; |72| 
           MVK     .L1     0x1,A3            ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B5,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 

   [ B0]   AND     .L2     B31,B4,B0         ; |72| 
|| [!B0]   ZERO    .S2     B0                ; |72| 

   [ B0]   B       .S1     $C$L20            ; |72| 
   [ B0]   CALL    .S1     print_test_results ; |255| 
   [ B0]   MVKL    .S1     all_pass,A4
   [ B0]   MVKH    .S1     all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L20}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |255| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           MV      .L1     A10,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |255| 
||         ADDKPC  .S2     $C$RL49,B3,0      ; |255| 

$C$RL49:   ; CALL OCCURS {print_test_results} {0}  ; |255| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |256| 

$C$RL50:   ; CALL OCCURS {printf} {0}        ; |256| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |256| 

$C$RL51:   ; CALL OCCURS {printf} {0}        ; |256| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |263| 

$C$RL52:   ; CALL OCCURS {print_profile_results} {0}  ; |263| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |266| 

$C$RL53:   ; CALL OCCURS {print_memory_results} {0}  ; |266| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(120),B3     ; |267| 
           LDDW    .D2T1   *++SP,A13:A12     ; |267| 
           LDDW    .D2T1   *++SP,A15:A14     ; |267| 
           LDDW    .D2T2   *++SP,B11:B10     ; |267| 
           LDDW    .D2T2   *++SP,B13:B12     ; |267| 

           LDW     .D2T1   *++SP(8),A10      ; |267| 
||         RET     .S2     B3                ; |267| 

           LDW     .D2T1   *++SP(8),A11      ; |267| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |267| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"log10SP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	log10
	.global	log10f
	.global	__c6xabi_isinff
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	log10sp
	.global	log10sp_c
	.global	log10sp_v
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
