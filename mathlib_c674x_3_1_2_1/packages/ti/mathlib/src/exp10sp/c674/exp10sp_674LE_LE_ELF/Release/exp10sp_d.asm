;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:44:51 2016                                *
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
	.word	040e82d54h		; a[0] @ 0
	.word	04102fb66h		; a[1] @ 32
	.word	040f804eeh		; a[2] @ 64
	.word	0409c28bfh		; a[3] @ 96
	.word	0c1167ad8h		; a[4] @ 128
	.word	0bff75d35h		; a[5] @ 160
	.word	03f377935h		; a[6] @ 192
	.word	0c02ffa57h		; a[7] @ 224
	.word	04088cb73h		; a[8] @ 256
	.word	0c04db04ah		; a[9] @ 288
	.word	0c087bb7bh		; a[10] @ 320
	.word	040587300h		; a[11] @ 352
	.word	040bbc2dbh		; a[12] @ 384
	.word	0406a62ddh		; a[13] @ 416
	.word	0410eca12h		; a[14] @ 448
	.word	0c10bbbeah		; a[15] @ 480
	.word	0c11de6b0h		; a[16] @ 512
	.word	0c0a10d6bh		; a[17] @ 544
	.word	0c0d92ce3h		; a[18] @ 576
	.word	040b10b3fh		; a[19] @ 608
	.word	04103a16eh		; a[20] @ 640
	.word	0407106eeh		; a[21] @ 672
	.word	0bfb665efh		; a[22] @ 704
	.word	040f8519ch		; a[23] @ 736
	.word	0410a870eh		; a[24] @ 768
	.word	03e9e4b19h		; a[25] @ 800
	.word	0c10675cah		; a[26] @ 832
	.word	0c06155b6h		; a[27] @ 864
	.word	0c060d11bh		; a[28] @ 896
	.word	0c10bfb4fh		; a[29] @ 928
	.word	0c080e0a5h		; a[30] @ 960
	.word	040ddf5b3h		; a[31] @ 992
	.word	0c0c62e19h		; a[32] @ 1024
	.word	03f022d4eh		; a[33] @ 1056
	.word	0c0f9da22h		; a[34] @ 1088
	.word	0c10bfab2h		; a[35] @ 1120
	.word	0bed697efh		; a[36] @ 1152
	.word	04108f50ah		; a[37] @ 1184
	.word	0c0187f0eh		; a[38] @ 1216
	.word	0bf98cf35h		; a[39] @ 1248
	.word	04117d722h		; a[40] @ 1280
	.word	0c0dddf4ah		; a[41] @ 1312
	.word	040cf6b29h		; a[42] @ 1344
	.word	0c09895b5h		; a[43] @ 1376
	.word	0c07065a7h		; a[44] @ 1408
	.word	04106858eh		; a[45] @ 1440
	.word	0411d07b8h		; a[46] @ 1472
	.word	0405ae65ah		; a[47] @ 1504
	.word	04116ca5ah		; a[48] @ 1536
	.word	040b83852h		; a[49] @ 1568
	.word	0c087fbbeh		; a[50] @ 1600
	.word	04048d43ch		; a[51] @ 1632
	.word	0c092f3ach		; a[52] @ 1664
	.word	0c0d5e2a6h		; a[53] @ 1696
	.word	0410e8488h		; a[54] @ 1728
	.word	0c10fa14ch		; a[55] @ 1760
	.word	0c0199a0dh		; a[56] @ 1792
	.word	0c07ac68eh		; a[57] @ 1824
	.word	0c10ad817h		; a[58] @ 1856
	.word	03edc3c05h		; a[59] @ 1888
	.word	0c07d33cfh		; a[60] @ 1920
	.word	0c07ff335h		; a[61] @ 1952
	.word	03fadb7bfh		; a[62] @ 1984
	.word	03fdf0fa8h		; a[63] @ 2016
	.word	040fc7d16h		; a[64] @ 2048
	.word	0c1057550h		; a[65] @ 2080
	.word	0c0ab8faeh		; a[66] @ 2112
	.word	04003e433h		; a[67] @ 2144
	.word	040ddaddch		; a[68] @ 2176
	.word	0bf824b98h		; a[69] @ 2208
	.word	0405b84bch		; a[70] @ 2240
	.word	040b2e380h		; a[71] @ 2272
	.word	04081a34ch		; a[72] @ 2304
	.word	0c11b2e3fh		; a[73] @ 2336
	.word	0c03e7723h		; a[74] @ 2368
	.word	0c0d7d8b0h		; a[75] @ 2400
	.word	040dbee43h		; a[76] @ 2432
	.word	0c0a34675h		; a[77] @ 2464
	.word	03fc111a2h		; a[78] @ 2496
	.word	04031656fh		; a[79] @ 2528
	.word	0bd36f2c0h		; a[80] @ 2560
	.word	0bf433b17h		; a[81] @ 2592
	.word	0bda3b86ch		; a[82] @ 2624
	.word	04110b06bh		; a[83] @ 2656
	.word	04099faadh		; a[84] @ 2688
	.word	040cd979bh		; a[85] @ 2720
	.word	0c0ff8c9bh		; a[86] @ 2752
	.word	0405812a4h		; a[87] @ 2784
	.word	0bea7eb9bh		; a[88] @ 2816
	.word	0c0640f30h		; a[89] @ 2848
	.word	0c0adaaeeh		; a[90] @ 2880
	.word	0c0b02532h		; a[91] @ 2912
	.word	0bee18446h		; a[92] @ 2944
	.word	040c66f63h		; a[93] @ 2976
	.word	03f9649aah		; a[94] @ 3008
	.word	040f0fddeh		; a[95] @ 3040
	.word	0c04f455eh		; a[96] @ 3072
	.word	0411707aeh		; a[97] @ 3104
	.word	04016206eh		; a[98] @ 3136
	.word	0409988a2h		; a[99] @ 3168
	.word	03dffb408h		; a[100] @ 3200
	.word	0c055359dh		; a[101] @ 3232
	.word	040afa340h		; a[102] @ 3264
	.word	040aa6fabh		; a[103] @ 3296
	.word	0c0942985h		; a[104] @ 3328
	.word	0c08a9ecbh		; a[105] @ 3360
	.word	0c0a679bch		; a[106] @ 3392
	.word	040a32183h		; a[107] @ 3424
	.word	040a5570fh		; a[108] @ 3456
	.word	0c114cba9h		; a[109] @ 3488
	.word	0c10a8e00h		; a[110] @ 3520
	.word	0c0471593h		; a[111] @ 3552
	.word	04114b063h		; a[112] @ 3584
	.word	0403e79d3h		; a[113] @ 3616
	.word	0c0dbaddah		; a[114] @ 3648
	.word	0c1192e98h		; a[115] @ 3680
	.word	0407178b0h		; a[116] @ 3712
	.word	0c115722bh		; a[117] @ 3744
	.word	0c09b2c0ah		; a[118] @ 3776
	.word	0c0f39eaeh		; a[119] @ 3808
	.word	0400d53e9h		; a[120] @ 3840
	.word	0410dd45ah		; a[121] @ 3872
	.word	0410c2bcah		; a[122] @ 3904
	.word	040c2c63ah		; a[123] @ 3936
	.word	0c0aa3a34h		; a[124] @ 3968
	.word	04116b6e2h		; a[125] @ 4000
	.word	0403f716dh		; a[126] @ 4032
	.word	0c10215bch		; a[127] @ 4064
	.word	041025083h		; a[128] @ 4096
	.word	03f734c8bh		; a[129] @ 4128
	.word	0404c7700h		; a[130] @ 4160
	.word	040de7f2ch		; a[131] @ 4192
	.word	040d7bcd0h		; a[132] @ 4224
	.word	0411581a9h		; a[133] @ 4256
	.word	0c107b876h		; a[134] @ 4288
	.word	040ab241ch		; a[135] @ 4320
	.word	0c10e825fh		; a[136] @ 4352
	.word	0c046e591h		; a[137] @ 4384
	.word	040ee5798h		; a[138] @ 4416
	.word	0bfdfd8d4h		; a[139] @ 4448
	.word	0bf9327f6h		; a[140] @ 4480
	.word	0404988e3h		; a[141] @ 4512
	.word	040de9ca1h		; a[142] @ 4544
	.word	0c0d796e1h		; a[143] @ 4576
	.word	04093aa24h		; a[144] @ 4608
	.word	04089d8a4h		; a[145] @ 4640
	.word	0404ca19ah		; a[146] @ 4672
	.word	0c09f9efch		; a[147] @ 4704
	.word	0be0fb748h		; a[148] @ 4736
	.word	0c0cd208ah		; a[149] @ 4768
	.word	040b9dbabh		; a[150] @ 4800
	.word	040ac7b58h		; a[151] @ 4832
	.word	0c0e4a48fh		; a[152] @ 4864
	.word	03f5ab869h		; a[153] @ 4896
	.word	03fd82149h		; a[154] @ 4928
	.word	040276dfah		; a[155] @ 4960
	.word	0410bd89eh		; a[156] @ 4992
	.word	0c0ddcaffh		; a[157] @ 5024
	.word	0c0b670b6h		; a[158] @ 5056
	.word	04005ec9eh		; a[159] @ 5088
	.word	04119bdd6h		; a[160] @ 5120
	.word	0c0c02d93h		; a[161] @ 5152
	.word	040891e1ah		; a[162] @ 5184
	.word	0c08476deh		; a[163] @ 5216
	.word	0c0b769bbh		; a[164] @ 5248
	.word	0408af5e6h		; a[165] @ 5280
	.word	0410d9de5h		; a[166] @ 5312
	.word	0c0d650b2h		; a[167] @ 5344
	.word	0bfb8f5b3h		; a[168] @ 5376
	.word	03fc543f8h		; a[169] @ 5408
	.word	04018dcb0h		; a[170] @ 5440
	.word	03e0223fch		; a[171] @ 5472
	.word	0c097c3f8h		; a[172] @ 5504
	.word	0bcfabbbeh		; a[173] @ 5536
	.word	0c084e0c0h		; a[174] @ 5568
	.word	0bf45f0f1h		; a[175] @ 5600
	.word	0c0c660d6h		; a[176] @ 5632
	.word	0c111f2e1h		; a[177] @ 5664
	.word	0c02dbf0dh		; a[178] @ 5696
	.word	0c11a1d93h		; a[179] @ 5728
	.word	03f23d70ch		; a[180] @ 5760
	.word	0402318e4h		; a[181] @ 5792
	.word	0c105e383h		; a[182] @ 5824
	.word	0c11f7d18h		; a[183] @ 5856
	.word	0bf65de85h		; a[184] @ 5888
	.word	0bdd10808h		; a[185] @ 5920
	.word	03f0899a3h		; a[186] @ 5952
	.word	0c1059100h		; a[187] @ 5984
	.word	04114eebch		; a[188] @ 6016
	.word	040997607h		; a[189] @ 6048
	.word	040259326h		; a[190] @ 6080
	.word	040b89428h		; a[191] @ 6112
	.word	041068dd6h		; a[192] @ 6144
	.word	0c080851dh		; a[193] @ 6176
	.word	0c0d51988h		; a[194] @ 6208
	.word	0bf2d582dh		; a[195] @ 6240
	.word	0c11e232ch		; a[196] @ 6272
	.word	0411275b1h		; a[197] @ 6304
	.word	040a1d7d0h		; a[198] @ 6336
	.word	0c05e76a8h		; a[199] @ 6368
	.word	040acdd59h		; a[200] @ 6400

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\026362 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\026364 
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
;*   Local Frame Size  : 8 Args + 76 Auto + 56 Save = 140 byte                *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |111| 
           STW     .D2T1   A10,*SP--(8)      ; |111| 
           STDW    .D2T2   B13:B12,*SP--     ; |111| 
           STDW    .D2T2   B11:B10,*SP--     ; |111| 
           STDW    .D2T1   A15:A14,*SP--     ; |111| 

           STDW    .D2T1   A13:A12,*SP--     ; |111| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(96)      ; |111| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {driver_init} {0}   ; |119| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     a,A11

           MVKH    .S1     a,A11
||         MVKL    .S2     output,B13

           CALL    .S1     exp10f            ; |128| 
||         MV      .L1     A11,A12
||         MV      .D1X    B4,A10
||         MVKH    .S2     output,B13
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |128| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |128| 
$C$RL1:    ; CALL OCCURS {exp10f} {0}        ; |128| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |128| 
||         SUB     .L1     A10,1,A0          ; |127| 
||         SUB     .S1     A10,1,A10         ; |127| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |127| 
|| [!A0]   MVK     .S2     0xc9,B5

           ADD     .L2     B10,B4,B4         ; |128| 
||         ADD     .S2     4,B10,B10         ; |127| 

   [ A0]   CALL    .S1     exp10f            ; |128| 
||         STW     .D2T1   A4,*B4            ; |128| 
|| [!A0]   ADD     .L2     4,B13,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |127| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     exp10sp           ; |131| 
||         ZERO    .L2     B10
||         MV      .L1X    B5,A12
||         MV      .D1     A11,A10
||         STW     .D2T2   B4,*+SP(68)

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A10++,A4         ; |131| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |131| 
$C$RL2:    ; CALL OCCURS {exp10sp} {0}       ; |131| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(68),B4       ; |131| 
           SUB     .L1     A12,1,A0          ; |130| 
           SUB     .L1     A12,1,A12         ; |130| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |131| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |130| 

           ADD     .L2     B10,B4,B4         ; |131| 
||         ADD     .S2     4,B10,B10         ; |130| 

   [ A0]   CALL    .S1     exp10sp           ; |131| 
||         STW     .D2T1   A4,*B4            ; |131| 

           ; BRANCHCC OCCURS {$C$L2}         ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(68),B4
           MVK     .S2     0xc9,B5
           ZERO    .L2     B10
           MV      .L1     A11,A12
           MV      .L1X    B5,A10
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(72)
||         CALL    .S1     exp10sp_c         ; |134| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |134| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |134| 
$C$RL3:    ; CALL OCCURS {exp10sp_c} {0}     ; |134| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(72),B4       ; |134| 
||         SUB     .L1     A10,1,A0          ; |133| 
||         SUB     .S1     A10,1,A10         ; |133| 

   [!A0]   ZERO    .L1     A5
   [!A0]   MVKL    .S1     0x3d317000,A3
   [!A0]   LDW     .D2T2   *+SP(72),B16
   [!A0]   MVKH    .S1     0x3d317000,A3
           LDW     .D2T2   *B4,B4            ; |134| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |133| 

           ADD     .L2     B10,B4,B4         ; |134| 
||         ADD     .S2     4,B10,B10         ; |133| 

   [ A0]   CALL    .S2     exp10sp_c         ; |134| 
||         STW     .D2T1   A4,*B4            ; |134| 
|| [!A0]   MVK     .S1     0x72,A4

           ; BRANCHCC OCCURS {$C$L3}         ; |133| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           SET     .S1     A5,0x17,0x1d,A9
||         STW     .D2T1   A3,*+SP(24)
||         MVKL    .S2     0xc2aeac50,B4
||         ZERO    .L1     A5
||         MV      .L2X    A3,B23
||         ZERO    .D1     A31

           MVKL    .S1     0x7f7fffff,A3
||         MVKL    .S2     0x3605fdf4,B8
||         STW     .D2T1   A4,*+SP(40)
||         ZERO    .L2     B9

           MVKL    .S1     0x3effffff,A13
||         MVKL    .S2     ti_math_jTable,B6
||         ADD     .L2     4,B16,B10
||         STW     .D2T1   A31,*+SP(44)

           MVKL    .S1     ti_math_kTable,A14
||         MVKL    .S2     0x42b17218,B11
||         LDW     .D2T2   *B10,B16
||         MV      .L2X    A9,B20

           MVKL    .S1     0x42549a78,A4
||         MVKH    .S2     0xc2aeac50,B4
||         ZERO    .L2     B18
||         MV      .D2X    A11,B7

           MVKH    .S1     0xfff00000,A5
||         MVKH    .S2     0x3605fdf4,B8
||         STW     .D2T2   B4,*+SP(48)

           MVKH    .S1     0x7f7fffff,A3
||         MVKH    .S2     ti_math_jTable,B6
||         STW     .D2T1   A5,*+SP(32)

           MVKH    .S1     0x3effffff,A13
||         MVKH    .S2     0x42b17218,B11
||         MV      .L1X    B8,A16
||         STW     .D2T1   A3,*+SP(52)
||         MV      .L2X    A5,B21

           MVKH    .S1     ti_math_kTable,A14
||         MVKL    .S2     0x3e2abce4,B5
||         MV      .L1X    B6,A8
||         LDW     .D2T1   *+SP(40),A5
||         MV      .L2X    A3,B17

           MVKH    .S1     0x42549a78,A4
||         MVKH    .S2     0x3e2abce4,B5
||         MV      .L1X    B11,A3
||         STW     .D2T2   B8,*+SP(12)
||         ADD     .L2X    1,A13,B24

           MVKL    .S1     0x40135d8e,A6
||         MVKH    .S2     0xbf000000,B9
||         STW     .D2T1   A4,*+SP(20)
||         MV      .L2X    A14,B22

           MVKH    .S1     0x40135d8e,A6
||         MV      .L1X    B4,A4
||         STW     .D2T2   B6,*+SP(28)
||         DINT                              ; interrupts off
||         MV      .L2X    A4,B25

           MVK     .S1     0xc9,A7
||         MV      .L1     A6,A9
||         ADD     .D1     -2,A9,A6
||         STW     .D2T2   B5,*+SP(36)
||         MV      .L2     B9,B26
||         MV      .S2     B5,B19

           SUB     .L1     A7,1,A1
||         MV      .S1     A13,A7
||         STW     .D2T2   B9,*+SP(16)

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/exp10sp/exp10sp_d.c
;*      Loop source line                 : 136
;*      Loop opening brace source line   : 136
;*      Loop closing brace source line   : 138
;*      Known Minimum Trip Count         : 201                    
;*      Known Maximum Trip Count         : 201                    
;*      Known Max Trip Count Factor      : 201
;*      Loop Carried Dependency Bound(^) : 72
;*      Unpartitioned Resource Bound     : 9
;*      Partitioned Resource Bound(*)    : 9
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1        3     
;*      .S units                     4        3     
;*      .D units                     1        3     
;*      .M units                     8        7     
;*      .X cross paths               9*       7     
;*      .T address paths             1        3     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        7     (.L or .S unit)
;*      Addition ops (.LSD)          1        9     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             3        7     
;*      Bound(.L .S .D .LS .LSD)     3        9*    
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
;*       0: | * *******      *               |       *        ***********     |
;*       1: | * *******      *               |       *        ***********     |
;*       2: | * *******      *               |       *        ***********     |
;*       3: | * *******      *               |       *        ***********     |
;*       4: | * *******      *               |       *        ***********     |
;*       5: | * *******      *               |    *  *        ***********     |
;*       6: | * *******      *               |       *        ***********     |
;*       7: | * *******      *               |       *        ***********     |
;*       8: | * *******      *               |       *        ***********     |
;*       9: | * *******      *   *           |    *  *        ***********     |
;*      10: | * *******      *   **          |     * *        ***********     |
;*      11: | * *******      *   **          |     * *        ***********     |
;*      12: | * *******      *   **          |     * *        ***********     |
;*      13: | * *******      *   **          |    ** *        ***********     |
;*      14: | * *******      *   **          |     * *        ***********     |
;*      15: | * *******      *   **          |     * *        ***********     |
;*      16: | * *******      *   **          |     * *        ***********     |
;*      17: | * *******      *   **          |    ** *        ***********     |
;*      18: | * *******      *   **          |    ** *        ***********     |
;*      19: | * *******      *   **          |    ** *        ***********     |
;*      20: | * *******      **  **          |    ** *        ***********     |
;*      21: | * *******      *   **          |     * *        ***********     |
;*      22: | * *******      *   **          |    ** *        ***********     |
;*      23: | * *******      *   **          |    ** *        ***********     |
;*      24: | * *******      *   **          |     * *        ***********     |
;*      25: | * *******      * ****          |     * ***      ***********     |
;*      26: | * *******      * ****          |    ** ***      ***********     |
;*      27: | * *******      ******          |     * ***      ***********     |
;*      28: | * *******      ******          |     * ***      ***********     |
;*      29: | * *******      **  **          |     * *        ***********     |
;*      30: | * *******      **  **          |    ** *        ***********     |
;*      31: | * *******      *   **          |     * *        ***********     |
;*      32: | * *******      *   **          |     * *        ***********     |
;*      33: | * *******      *   **          |     * *        ***********     |
;*      34: | * *******      *   **          |    ** *        ***********     |
;*      35: | * *******      * ****          |    ** *        ***********     |
;*      36: | * *******      * ****          |    ** *        ***********     |
;*      37: | * *******      * * **          |    *  * *      ***********     |
;*      38: | * *******      * * **          |    ** * *      ***********     |
;*      39: | * *******      *** **          |     * * *      ***********     |
;*      40: | * *******      *** **          |       * *      ***********     |
;*      41: | * *******      *** **          |       * *      ***********     |
;*      42: | * *******      *** **          |    *  * *      ***********     |
;*      43: | * *******      ******          |       * *      ***********     |
;*      44: | * *******      ******          |       * *      ***********     |
;*      45: | * *******      ******          |       * *      ***********     |
;*      46: | * *******      ******          |    *  * *      ***********     |
;*      47: | * *******      *** **          |       * *      ***********     |
;*      48: | * *******      *** **          |       * *      ***********     |
;*      49: | * *******      *** **          |       * *      ***********     |
;*      50: | * *******      *** **          |    *  * *      ***********     |
;*      51: | * *******      * * **          |       * *      ***********     |
;*      52: | * *******      * * **          |       * *      ***********     |
;*      53: | * *******      * * **          |       * *      ***********     |
;*      54: | * *******      * * **          |    *  * *      ***********     |
;*      55: | * *******      * * **          |       * *      ***********     |
;*      56: | * *******      * * **          |       * *      ***********     |
;*      57: | * *******      * * **          |       * *      ***********     |
;*      58: | * *******      *   **          |    *  ***      ***********     |
;*      59: | * *******      *   **          |    *  ***      ***********     |
;*      60: | * *******      *   **          |       *        ***********     |
;*      61: | * *******      *   **          |       *        ***********     |
;*      62: | * *******      *   **          |       *        ***********     |
;*      63: | * *******      *   **          |       *        ***********     |
;*      64: | * *******      *   **          |       *        ***********     |
;*      65: |** *******      *   *           |    ** *        ***********     |
;*      66: | * *******      *   *           |       *        ***********     |
;*      67: | * *******      *   *           |       *        ***********     |
;*      68: | * *******      *   *           |       *        ***********     |
;*      69: |** *******      *   *           |     * *        ***********     |
;*      70: |** *******      *               |    ** *        ***********     |
;*      71: | * *******      *               |    ****        ***********     |
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
;*        $C$C119:
;*   0              LDW     .D2T2   *B7++,B4          ; |88|  ^ 
;*   1              NOP             4
;*   5              MPYSP   .M2     B25,B4,B4         ; |88|  ^ 
;*     ||           MPYSP   .M1X    A9,B4,A20         ; |88| 
;*   6              NOP             3
;*   9              CMPLTSP .S2     B4,B26,B5         ; |88| 
;*     ||           ADDSP   .L2     B24,B4,B4         ; |88|  ^ 
;*     ||           EXTU    .S1     A20,1,24,A21      ; |100| 
;*  10              NOP             3
;*  13              SPTRUNC .L2     B4,B4             ; |88|  ^ 
;*  14              NOP             3
;*  17              SUB     .S2     B4,B5,B5          ; |88|  ^ 
;*     ||           SUB     .L2     B4,B5,B4          ; |100| 
;*  18              INTSP   .L2     B5,B4             ; |88|  ^ 
;*     ||           SHL     .S2     B4,16,B4          ; |100| 
;*  19              EXTU    .S2     B5,28,30,B4       ; |100| 
;*     ||           AND     .L1X    3,B5,A17          ; |100| 
;*     ||           AND     .L2     B21,B4,B5         ; |100| 
;*  20              LDDW    .D2T2   *+B22[B4],B9:B8   ; |100| 
;*     ||           LDDW    .D1T1   *+A8[A17],A19:A18 ; |100| 
;*  21              NOP             1
;*  22              MPYSP   .M2     B23,B4,B4         ; |88|  ^ 
;*  23              MPYSP   .M1X    A16,B4,A17        ; |88| 
;*  24              NOP             1
;*  25              MPYDP   .M1X    A19:A18,B9:B8,A19:A18 ; |100| 
;*  26              SUBSP   .L2X    A20,B4,B4         ; |88|  ^ 
;*  27              NOP             3
;*  30              SUBSP   .L2X    B4,A17,B4         ; |88|  ^ 
;*  31              NOP             3
;*  34              MPYSP   .M2     B4,B4,B5          ; |88|  ^ 
;*  35              MPYSP   .M1X    A6,B4,A17         ; |100| 
;*  36              ADD     .L2X    B5,A19,B9         ; |100| 
;*  37              NOP             1
;*  38              MPYSP   .M2     B5,B4,B4          ; |100|  ^ 
;*  39              MPYSP   .M1X    A7,B5,A19         ; |100| 
;*  40              NOP             2
;*  42              MPYSP   .M2     B19,B4,B4         ; |100|  ^ 
;*  43              NOP             3
;*  46              ADDSP   .L2X    A19,B4,B4         ; |100|  ^ 
;*  47              NOP             3
;*  50              ADDSP   .L2X    B4,A17,B4         ; |100|  ^ 
;*  51              NOP             3
;*  54              ADDSP   .L2     B20,B4,B4         ; |100|  ^ 
;*  55              NOP             2
;*  57              MV      .S2X    A18,B8            ; |100| 
;*  58              MPYSPDP .M2     B4,B9:B8,B5:B4    ; |100|  ^ 
;*  59              NOP             5
;*  64              CMPLTU  .L1     A21,A5,A0         ; |100| 
;*  65      [ A0]   ADDSP   .S2X    B20,A20,B5        ; |100| 
;*     ||   [!A0]   DPSP    .L2     B5:B4,B5          ; |100|  ^ 
;*  66      [ A1]   BDEC    .S1     $C$C119,A1        ; |136| 
;*  67              NOP             1
;*  68              CMPLTSP .S1     A20,A4,A0         ; |100| 
;*  69      [!A0]   MV      .S2     B5,B4             ; |100|  ^ 
;*     ||   [ A0]   MV      .L2     B18,B4            ; |100| 
;*     ||           CMPGTSP .S1     A20,A3,A0         ; |100| 
;*  70      [!A0]   MV      .S2     B4,B6             ; |100|  ^ 
;*     ||   [ A0]   MV      .L2     B17,B6            ; |100| 
;*  71              STW     .D2T2   B6,*B16++         ; |100|  ^ 
;*  72              ; BRANCHCC OCCURS {$C$C119}       ; |136| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 72
           LDW     .D2T2   *B7++,B4          ; |88| <0,0>  ^ 
           NOP             4

           MPYSP   .M1X    A9,B4,A20         ; |88| <0,5> 
||         MPYSP   .M2     B25,B4,B4         ; |88| <0,5>  ^ 

           NOP             3

           EXTU    .S1     A20,1,24,A21      ; |100| <0,9> 
||         CMPLTSP .S2     B4,B26,B5         ; |88| <0,9> 
||         ADDSP   .L2     B24,B4,B4         ; |88| <0,9>  ^ 

           NOP             3
           SPTRUNC .L2     B4,B4             ; |88| <0,13>  ^ 
           NOP             3

           SUB     .L2     B4,B5,B4          ; |100| <0,17> 
||         SUB     .S2     B4,B5,B5          ; |88| <0,17>  ^ 

           SHL     .S2     B4,16,B4          ; |100| <0,18> 
||         INTSP   .L2     B5,B4             ; |88| <0,18>  ^ 

           AND     .L2     B21,B4,B5         ; |100| <0,19> 
||         EXTU    .S2     B5,28,30,B4       ; |100| <0,19> 
||         AND     .L1X    3,B5,A17          ; |100| <0,19> 

           LDDW    .D2T2   *+B22[B4],B9:B8   ; |100| <0,20> 
||         LDDW    .D1T1   *+A8[A17],A19:A18 ; |100| <0,20> 

           NOP             1
           MPYSP   .M2     B23,B4,B4         ; |88| <0,22>  ^ 
           MPYSP   .M1X    A16,B4,A17        ; |88| <0,23> 
           NOP             1
           MPYDP   .M1X    A19:A18,B9:B8,A19:A18 ; |100| <0,25> 
           SUBSP   .L2X    A20,B4,B4         ; |88| <0,26>  ^ 
           NOP             3
           SUBSP   .L2X    B4,A17,B4         ; |88| <0,30>  ^ 
           NOP             3
           MPYSP   .M2     B4,B4,B5          ; |88| <0,34>  ^ 
           MPYSP   .M1X    A6,B4,A17         ; |100| <0,35> 
           ADD     .L2X    B5,A19,B9         ; |100| <0,36> 
           NOP             1
           MPYSP   .M2     B5,B4,B4          ; |100| <0,38>  ^ 
           MPYSP   .M1X    A7,B5,A19         ; |100| <0,39> 
           NOP             2
           MPYSP   .M2     B19,B4,B4         ; |100| <0,42>  ^ 
           NOP             3
           ADDSP   .L2X    A19,B4,B4         ; |100| <0,46>  ^ 
           NOP             3
           ADDSP   .L2X    B4,A17,B4         ; |100| <0,50>  ^ 
           NOP             3
           ADDSP   .L2     B20,B4,B4         ; |100| <0,54>  ^ 
           NOP             2
           MV      .S2X    A18,B8            ; |100| <0,57> 
           MPYSPDP .M2     B4,B9:B8,B5:B4    ; |100| <0,58>  ^ 
           NOP             5
           CMPLTU  .L1     A21,A5,A0         ; |100| <0,64> 

   [ A0]   ADDSP   .S2X    B20,A20,B5        ; |100| <0,65> 
|| [!A0]   DPSP    .L2     B5:B4,B5          ; |100| <0,65>  ^ 

   [ A1]   BDEC    .S1     $C$L5,A1          ; |136| <0,66> 
           NOP             1
           CMPLTSP .S1     A20,A4,A0         ; |100| <0,68> 

           CMPGTSP .S1     A20,A3,A0         ; |100| <0,69> 
|| [ A0]   MV      .L2     B18,B4            ; |100| <0,69> 
|| [!A0]   MV      .S2     B5,B4             ; |100| <0,69>  ^ 

   [ A0]   MV      .L2     B17,B6            ; |100| <0,70> 
|| [!A0]   MV      .S2     B4,B6             ; |100| <0,70>  ^ 

           STW     .D2T2   B6,*B16++         ; |100| <0,71>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           STW     .D2T1   A4,*+SP(48)
           STW     .D2T2   B25,*+SP(20)
           STW     .D2T2   B23,*+SP(24)
           STW     .D2T2   B21,*+SP(32)
           STW     .D2T2   B19,*+SP(36)
           STW     .D2T2   B18,*+SP(44)
           STW     .D2T2   B17,*+SP(52)
           STW     .D2T1   A16,*+SP(12)
           STW     .D2T1   A8,*+SP(28)

           MV      .L1X    B20,A10
||         STW     .D2T1   A5,*+SP(40)

           MV      .L1     A6,A12
||         MV      .L2X    A3,B11
||         MV      .S1     A7,A13
||         MV      .D1X    B22,A14
||         STW     .D2T2   B26,*+SP(16)
||         RINT                              ; interrupts on

           CALLP   .S2     exp10sp_v,B3
||         LDW     .D2T2   *+B13(16),B4      ; |139| 
||         MV      .L1     A11,A4            ; |139| 
||         MVK     .S1     0xc9,A6           ; |139| 
||         MV      .L2X    A9,B12
||         MV      .D1X    B24,A15

$C$RL4:    ; CALL OCCURS {exp10sp_v} {0}     ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *B13,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0x88e368f1,B6

           LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     fcn_pass,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0x88e368f1,B6

           MV      .L2     B13,B5
||         LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B4
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B4

           ADD     .L1X    4,B10,A3
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           STW     .D2T1   A3,*+SP(76)
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B13,A4           ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S2     fcn_pass,B4
           MVKH    .S2     fcn_pass,B4

           ADD     .L2     4,B4,B4
||         MVKL    .S2     fcn_pass,B5

           LDW     .D2T2   *B4,B0            ; |72| 
||         MVKH    .S2     fcn_pass,B5

           STW     .D2T2   B4,*+SP(80)
           ADD     .L2     8,B5,B4
           STW     .D2T2   B4,*+SP(84)       ; |69| 
           STW     .D2T1   A4,*+B5(16)       ; |69| 

   [!B0]   MVKL    .S1     all_pass,A3
|| [!B0]   B       .S2     $C$L7             ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [!B0]   ZERO    .D2     B4                ; |72| 

   [!B0]   CALL    .S2     print_test_results ; |143| 
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
           CALL    .S1     print_test_results ; |143| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |143| 
||         STW     .D1T2   B4,*A3            ; |72| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |143| 

$C$RL9:    ; CALL OCCURS {print_test_results} {0}  ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T1   *+SP(44),A6       ; |151| 
||         MVKL    .S2     a_sc,B4

           MVKL    .S2     0x7f7fffff,B31
||         MVK     .L2     0x7,B29

           STW     .D2T2   B29,*+SP(56)      ; |151| 
||         MVKH    .S2     a_sc,B4
||         ZERO    .L1     A5
||         MVK     .L2     -1,B6             ; |156| 

           MV      .L2     B4,B6             ; |156| 
||         STW     .D2T2   B6,*+B4(24)       ; |156| 
||         MVKH    .S1     0xbf800000,A5
||         ZERO    .S2     B5
||         ZERO    .L1     A7
||         MV      .D1     A10,A4            ; |155| 

           STDW    .D2T1   A5:A4,*+B6(16)    ; |155| 
||         MV      .L2     B6,B30            ; |153| 
||         MVKH    .S2     0x7f7fffff,B31
||         MVKH    .S1     0x80000000,A7

           STDW    .D2T1   A7:A6,*B30        ; |151| 
||         ADD     .L2     1,B31,B4
||         MV      .L1X    B4,A11            ; |151| 
||         MVKH    .S2     0xff800000,B5

           STDW    .D2T2   B5:B4,*+B6(8)     ; |153| 
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
           LDW     .D1T1   *A11,A3           ; |158| 
           CALL    .S1     exp10             ; |158| 
           ADDKPC  .S2     $C$RL10,B3,2      ; |158| 
           SPDP    .S1     A3,A5:A4          ; |158| 
           NOP             1
$C$RL10:   ; CALL OCCURS {exp10} {0}         ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |158| 
           DPSP    .L1     A5:A4,A3          ; |158| 
           NOP             3
           ADD     .L2     B13,B4,B4         ; |158| 
           STW     .D2T1   A3,*B4            ; |158| 

           CALLP   .S2     exp10sp,B3
||         LDW     .D1T1   *A11,A4           ; |159| 

$C$RL11:   ; CALL OCCURS {exp10sp} {0}       ; |159| 
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(4),B4        ; |159| 
           NOP             4
           ADD     .L2     B13,B4,B4         ; |159| 
           STW     .D2T1   A4,*B4            ; |159| 

           CALLP   .S2     exp10sp_c,B3
||         LDW     .D1T1   *A11,A4           ; |160| 

$C$RL12:   ; CALL OCCURS {exp10sp_c} {0}     ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 84
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |160| 
           LDW     .D2T1   *+SP(20),A3
           LDW     .D2T1   *+SP(16),A31
           LDW     .D2T1   *+SP(24),A30
           LDW     .D2T2   *+SP(12),B31
           ADD     .L2     B13,B4,B4         ; |160| 
           STW     .D2T1   A4,*B4            ; |160| 
           LDW     .D1T1   *A11++,A5         ; |78| 
           LDW     .D2T2   *+SP(28),B29      ; |102| 
           LDW     .D2T2   *+SP(36),B27
           LDW     .D2T2   *+SP(48),B25
           LDW     .D2T1   *+SP(32),A27      ; |102| 
           MPYSP   .M1     A3,A5,A4          ; |81| 
           MPYSP   .M2X    B12,A5,B6         ; |78| 
           LDW     .D2T1   *+SP(40),A26      ; |105| 
           NOP             1
           ADDSP   .L1     A15,A4,A3         ; |81| 
           CMPLTSP .S1     A4,A31,A0         ; |82| 
           EXTU    .S2     B6,1,24,B26       ; |105| 
           CMPLTSP .S2     B6,B25,B1         ; |110| 
           SPTRUNC .L1     A3,A6             ; |81| 
           LDW     .D2T2   *B10,B25          ; |161| 
           CMPLTU  .L2X    B26,A26,B0        ; |105| 
           CMPGTSP .S2     B6,B11,B2         ; |115| 
   [ A0]   SUB     .L1     A6,1,A6           ; |83| 
           INTSP   .L1     A6,A4             ; |102| 
           EXTU    .S1     A6,28,30,A29      ; |102| 
           AND     .L2X    3,A6,B30          ; |102| 
           SHL     .S1     A6,16,A28         ; |102| 
           MPYSP   .M1     A30,A4,A3         ; |102| 
           MPYSP   .M2X    B31,A4,B4         ; |102| 
           LDDW    .D1T1   *+A14[A29],A5:A4  ; |102| 
           NOP             2
           SUBSP   .L2X    B6,A3,B5          ; |102| 
           NOP             3
           SUBSP   .L2     B5,B4,B8          ; |102| 
           LDDW    .D2T2   *+B29[B30],B5:B4  ; |102| 
           NOP             2
           MPYSP   .M2     B8,B8,B7          ; |102| 
           MPYSP   .M1X    A12,B8,A3         ; |102| 
           NOP             2
           MPYSP   .M2     B7,B8,B28         ; |102| 
           MPYSP   .M1X    A13,B7,A7         ; |102| 
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |102| 
           NOP             1
           MPYSP   .M2     B27,B28,B4        ; |102| 
           ADD     .L2     B13,B25,B5        ; |161| 
           ADD     .L2     4,B13,B13         ; |157| 
           NOP             2
           ADDSP   .L1X    A7,B4,A7          ; |102| 
           LDW     .D2T2   *+SP(56),B4       ; |116| 
           NOP             2
           ADDSP   .L1     A7,A3,A3          ; |102| 
           NOP             3
           ADDSP   .L1     A10,A3,A6         ; |102| 
           AND     .L1     A27,A28,A3        ; |102| 
           ADD     .L1     A3,A5,A5          ; |102| 
           SUB     .S1X    B4,1,A0           ; |157| 
           MPYSPDP .M1     A6,A5:A4,A5:A4    ; |102| 
           SUB     .L2     B4,1,B4           ; |157| 
           STW     .D2T2   B4,*+SP(56)       ; |161| 
   [!A0]   MVKL    .S2     output,B10
   [!A0]   MVKH    .S2     output,B10
           NOP             2
           DPSP    .L1     A5:A4,A3          ; |102| 

   [ B0]   ADDSP   .L1X    A10,B6,A3         ; |106| 
|| [ B1]   LDW     .D2T1   *+SP(44),A3       ; |115| 

   [ A0]   BNOP    .S1     $C$L8,4           ; |157| 
|| [ B2]   LDW     .D2T1   *+SP(52),A3       ; |111| 

   [!A0]   CALL    .S1     exp10sp_v         ; |163| 
||         STW     .D2T1   A3,*B5            ; |161| 

           ; BRANCHCC OCCURS {$C$L8}         ; |157| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B10(16),B4      ; |163| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           MVK     .L1     0x7,A6            ; |163| 
           ADDKPC  .S2     $C$RL13,B3,0      ; |163| 
$C$RL13:   ; CALL OCCURS {exp10sp_v} {0}     ; |163| 
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

$C$RL14:   ; CALL OCCURS {isequal} {0}       ; |66| 
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

$C$RL15:   ; CALL OCCURS {isequal} {0}       ; |67| 
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

$C$RL16:   ; CALL OCCURS {isequal} {0}       ; |68| 

           LDW     .D2T1   *+SP(76),A3       ; |68| 
||         MVKL    .S2     fcn_pass,B4

           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7
           MVKH    .S2     fcn_pass,B4

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           MV      .L2     B10,B5            ; |68| 
||         STW     .D2T1   A3,*+SP(60)       ; |68| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B5,A4            ; |69| 
||         MVK     .L1     0x7,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL17:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(80),A3       ; |69| 
           LDW     .D2T2   *+SP(84),B13
           MVKL    .S2     fcn_pass,B4
           MVKH    .S2     fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A3,*+SP(64)       ; |69| 
           NOP             3

   [!A0]   B       .S1     $C$L9             ; |72| 
|| [ A0]   LDW     .D2T2   *B13,B0           ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |167| 
   [ A0]   ADD     .L2     4,B13,B4
   [!A0]   ZERO    .L1     A4                ; |72| 
   [!A0]   MVKL    .S1     all_pass,A3
   [!A0]   MVKH    .S1     all_pass,A3
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
           CALL    .S1     print_test_results ; |167| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x3,A4            ; |167| 
||         ADDKPC  .S2     $C$RL18,B3,0      ; |167| 

$C$RL18:   ; CALL OCCURS {print_test_results} {0}  ; |167| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           MVKL    .S1     a_ext,A3
           MVKH    .S1     a_ext,A3

           MVK     .S2     0xed,B31
||         ZERO    .L1     A4

           MV      .L2X    A3,B4             ; |170| 
||         STW     .D2T2   B31,*+SP(56)      ; |170| 
||         SET     .S1     A4,0x17,0x17,A4

           STW     .D2T1   A4,*B4            ; |170| 
||         MV      .L1     A3,A11            ; |170| 
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D1T1   *A11,A3           ; |172| 
           CALL    .S1     exp10             ; |172| 
           ADDKPC  .S2     $C$RL19,B3,2      ; |172| 
           SPDP    .S1     A3,A5:A4          ; |172| 
           NOP             1
$C$RL19:   ; CALL OCCURS {exp10} {0}         ; |172| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 21
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |172| 
           DPSP    .L1     A5:A4,A3          ; |172| 
           ZERO    .L2     B31
           MVKH    .S2     0xc3800000,B31
           NOP             1
           ADD     .L2     B10,B4,B4         ; |172| 
           STW     .D2T1   A3,*B4            ; |172| 
           LDW     .D1T1   *A11,A4           ; |173| 
           NOP             4
           CMPGTSP .S2X    A4,B31,B0         ; |173| 
   [!B0]   B       .S1     $C$L11            ; |173| 
   [ B0]   CALL    .S1     exp10sp           ; |173| 
   [!B0]   CALL    .S1     exp10             ; |173| 
   [!B0]   SPDP    .S1     A4,A5:A4          ; |173| 
           NOP             2
           ; BRANCHCC OCCURS {$C$L11}        ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL20,B3,0      ; |173| 
$C$RL20:   ; CALL OCCURS {exp10sp} {0}       ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8

           SPDP    .S1     A4,A5:A4          ; |173| 
||         MVKL    .S2     output,B4

           MVKH    .S2     output,B4

           BNOP    .S1     $C$L12,4          ; |173| 
||         DPSP    .L1     A5:A4,A3          ; |173| 
||         LDW     .D2T2   *+B4(4),B4        ; |173| 

           MV      .L2X    A3,B5             ; |173| 
||         ADD     .S2     B10,B4,B4         ; |173| 

           ; BRANCH OCCURS {$C$L12}          ; |173| 
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL21,B3,1      ; |173| 
$C$RL21:   ; CALL OCCURS {exp10} {0}         ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4

           LDW     .D2T2   *+B4(4),B4        ; |173| 
||         DPSP    .L1     A5:A4,A3          ; |173| 

           NOP             4

           ADD     .L2     B10,B4,B4         ; |173| 
||         MV      .S2X    A3,B5             ; |173| 

;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     exp10sp_c         ; |174| 
||         STW     .D2T2   B5,*B4            ; |173| 

           LDW     .D1T1   *A11,A4           ; |174| 
           ADDKPC  .S2     $C$RL22,B3,3      ; |174| 
$C$RL22:   ; CALL OCCURS {exp10sp_c} {0}     ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 101
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *+B4(8),B4        ; |174| 
           LDW     .D2T1   *+SP(20),A3
           LDW     .D2T1   *+SP(16),A31
           LDW     .D2T1   *+SP(24),A30
           LDW     .D2T2   *+SP(12),B31
           ADD     .L2     B10,B4,B4         ; |174| 
           STW     .D2T1   A4,*B4            ; |174| 
           LDW     .D1T1   *A11,A6           ; |78| 
           LDW     .D2T2   *+SP(28),B29      ; |102| 
           LDW     .D2T2   *+SP(36),B27
           MVKL    .S2     output+12,B26
           LDW     .D2T1   *+SP(32),A27      ; |102| 
           MPYSP   .M1     A3,A6,A5          ; |81| 
           MPYSP   .M2X    B12,A6,B6         ; |78| 
           LDW     .D2T2   *+SP(48),B24
           LDW     .D2T1   *+SP(40),A26      ; |105| 
           ADDSP   .L1     A15,A5,A3         ; |81| 
           CMPLTSP .S1     A5,A31,A0         ; |82| 
           MVKH    .S2     output+12,B26
           EXTU    .S2     B6,1,24,B25       ; |105| 
           SPTRUNC .L1     A3,A3             ; |81| 
           CMPLTSP .S2     B6,B24,B1         ; |110| 
           CMPLTU  .L2X    B25,A26,B0        ; |105| 
           CMPGTSP .S2     B6,B11,B2         ; |115| 
   [ A0]   SUB     .L1     A3,1,A3           ; |83| 
           INTSP   .L1     A3,A5             ; |102| 
           EXTU    .S1     A3,28,30,A29      ; |102| 
           AND     .L2X    3,A3,B30          ; |102| 
           SHL     .S1     A3,16,A28         ; |102| 
           MPYSP   .M1     A30,A5,A4         ; |102| 
           MPYSP   .M2X    B31,A5,B4         ; |102| 
           AND     .L1     A27,A28,A3        ; |102| 
           NOP             2
           SUBSP   .L2X    B6,A4,B5          ; |102| 
           LDDW    .D1T1   *+A14[A29],A5:A4  ; |102| 
           NOP             2
           SUBSP   .L2     B5,B4,B7          ; |102| 
           LDDW    .D2T2   *+B29[B30],B5:B4  ; |102| 
           NOP             2
           MPYSP   .M2     B7,B7,B8          ; |102| 
           MPYSP   .M1X    A12,B7,A6         ; |102| 
           NOP             2
           MPYSP   .M2     B8,B7,B28         ; |102| 
           MPYSP   .M1X    A13,B8,A7         ; |102| 
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |102| 
           LDW     .D2T2   *B26,B5           ; |175| 
           MPYSP   .M2     B27,B28,B4        ; |102| 
           NOP             4
           ADDSP   .L1X    A7,B4,A7          ; |102| 
           ADD     .L2     B10,B5,B23        ; |175| 
           LDW     .D2T2   *+SP(56),B4
           ADD     .S1     A3,A5,A5          ; |102| 
           ADDSP   .L1     A7,A6,A6          ; |102| 
           ADD     .L2     4,B10,B10         ; |171| 
           NOP             2
           ADDSP   .L1     A10,A6,A6         ; |102| 
           SUB     .L1X    B4,1,A0           ; |171| 
           SUB     .L2     B4,1,B4           ; |171| 
   [!A0]   MVKL    .S2     output,B10
           MPYSPDP .M1     A6,A5:A4,A5:A4    ; |102| 
   [!A0]   MVKH    .S2     output,B10
           NOP             5
           DPSP    .L1     A5:A4,A4          ; |102| 

   [ B0]   ADDSP   .L1X    A10,B6,A4         ; |106| 
|| [ B1]   LDW     .D2T1   *+SP(44),A4       ; |115| 

   [ B2]   LDW     .D2T1   *+SP(52),A4       ; |111| 
           MVKL    .S1     0xc000cccc,A5
           MVKH    .S1     0xc000cccc,A5
           NOP             2
           STW     .D2T1   A4,*B23           ; |175| 
           LDW     .D1T1   *A11,A3           ; |176| 
           MVKL    .S1     0xcccccccd,A4
           MVKH    .S1     0xcccccccd,A4
           NOP             2
           MPYSPDP .M1     A3,A5:A4,A5:A4    ; |176| 
           NOP             5
   [ A0]   B       .S1     $C$L10            ; |171| 
           DPSP    .L1     A5:A4,A3          ; |176| 
           NOP             3

   [!A0]   CALL    .S1     exp10sp_v         ; |178| 
||         STW     .D1T1   A3,*++A11         ; |176| 
||         STW     .D2T2   B4,*+SP(56)       ; |176| 

           ; BRANCHCC OCCURS {$C$L10}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B10(16),B4      ; |178| 
           MVKL    .S1     a_ext,A4
           MVKH    .S1     a_ext,A4
           MVK     .S1     0xed,A6           ; |178| 
           ADDKPC  .S2     $C$RL23,B3,0      ; |178| 
$C$RL23:   ; CALL OCCURS {exp10sp_v} {0}     ; |178| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0xed,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL24:   ; CALL OCCURS {isequal} {0}       ; |66| 
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
||         MVK     .S1     0xed,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL25:   ; CALL OCCURS {isequal} {0}       ; |67| 
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
||         MVK     .S1     0xed,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL26:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     fcn_pass,B5

           LDW     .D2T1   *+SP(60),A3       ; |68| 
||         MVKL    .S2     0x3ee4f8b5,B7

           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     fcn_pass,B5
           MVKH    .S2     0x3ee4f8b5,B7

           MV      .L2     B10,B4            ; |68| 
||         STW     .D2T1   A4,*+B5(12)       ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0xed,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL27:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(64),A3       ; |69| 
           MVKL    .S2     fcn_pass,B4
           MVKH    .S2     fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           NOP             1
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [!A0]   B       .S1     $C$L13            ; |72| 
|| [ A0]   LDW     .D2T2   *B13,B0           ; |72| 

   [!A0]   CALL    .S1     print_test_results ; |182| 
   [ A0]   ADD     .L2     4,B13,B4
   [!A0]   ZERO    .L1     A3                ; |72| 
   [!A0]   MVKL    .S1     all_pass,A4
   [!A0]   MVKH    .S1     all_pass,A4
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
           CALL    .S1     print_test_results ; |182| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x4,A4            ; |182| 
||         ADDKPC  .S2     $C$RL28,B3,0      ; |182| 

$C$RL28:   ; CALL OCCURS {print_test_results} {0}  ; |182| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L2     B5                ; |114| 

           STW     .D2T2   B5,*+SP(60)       ; |114| 
||         ZERO    .L2     B4                ; |114| 
||         MVKL    .S2     cycle_counts+24,B7

           MVKH    .S2     cycle_counts+24,B7
||         STW     .D2T2   B4,*+SP(56)       ; |114| 
||         ZERO    .L2     B6                ; |114| 

           MVC     .S2     B6,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B7         ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           CALL    .S1     gimme_random      ; |192| 

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKL    .S1     t_offset,A3
||         MVK     .S2     0x80,B30
||         ZERO    .L1     A11

           EXT     .S2     B5,24,24,B6       ; |117| 
||         MVKH    .S1     0xc1200000,A11
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     t_offset,A3
||         STW     .D2T2   B30,*+SP(64)      ; |117| 
||         ZERO    .L1     A4

           MV      .L2X    A11,B4            ; |192| 
||         STDW    .D1T2   B5:B4,*A3         ; |117| 
||         MVKH    .S1     0x41a00000,A4
||         ZERO    .S2     B10

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
           ADDKPC  .S2     $C$RL29,B3,0      ; |192| 
$C$RL29:   ; CALL OCCURS {gimme_random} {0}  ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 110
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |192| 
           NOP             4
           ADD     .L1X    B10,A3,A3         ; |192| 

           STW     .D1T1   A4,*A3            ; |192| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 

           LDW     .D2T1   *+SP(20),A3       ; |122| 
||         MPYSP   .M2X    B12,A4,B8         ; |78| 
||         MVKL    .S2     output+12,B26

           LDW     .D2T2   *+SP(16),B4
||         MVKH    .S2     output+12,B26

           LDW     .D2T1   *+SP(24),A31
||         MVKL    .S2     t_start,B13

           LDW     .D2T2   *+SP(12),B31
||         MVKH    .S2     t_start,B13

           LDW     .D2T2   *+SP(28),B29      ; |102| 
||         EXTU    .S2     B8,1,24,B25       ; |105| 

           MPYSP   .M1     A3,A4,A3          ; |81| 
||         LDW     .D2T2   *+SP(36),B27
||         CMPGTSP .S2     B8,B11,B2         ; |115| 

           LDW     .D2T1   *+SP(32),A28      ; |102| 
           LDW     .D2T1   *+SP(40),A27
           LDW     .D2T2   *+SP(48),B23      ; |122| 

           ADDSP   .S1     A15,A3,A5         ; |81| 
||         LDW     .D2T2   *B26,B24          ; |196| 

           CMPLTSP .S2X    A3,B4,B0          ; |82| 
||         STDW    .D2T2   B7:B6,*B13

           NOP             1
           CMPLTU  .L1X    B25,A27,A0        ; |105| 

           SPTRUNC .L1     A5,A6             ; |81| 
||         CMPLTSP .S2     B8,B23,B1         ; |110| 

           NOP             3
   [ B0]   SUB     .L1     A6,1,A6           ; |83| 

           INTSP   .L1     A6,A3             ; |102| 
||         EXTU    .S1     A6,28,30,A30      ; |102| 

           AND     .L2X    3,A6,B30          ; |102| 
||         SHL     .S1     A6,16,A29         ; |102| 

           NOP             2
           MPYSP   .M1     A31,A3,A5         ; |102| 
           MPYSP   .M2X    B31,A3,B4         ; |102| 
           NOP             3

           SUBSP   .L2X    B8,A5,B5          ; |102| 
||         LDDW    .D1T1   *+A14[A30],A5:A4  ; |102| 

           NOP             3

           SUBSP   .L2     B5,B4,B9          ; |102| 
||         LDDW    .D2T2   *+B29[B30],B5:B4  ; |102| 

           NOP             3
           MPYSP   .M2     B9,B9,B16         ; |102| 
           MPYSP   .M1X    A12,B9,A3         ; |102| 
           NOP             2
           MPYSP   .M2     B16,B9,B28        ; |102| 
           MPYSP   .M1X    A13,B16,A7        ; |102| 
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |102| 
           NOP             1
           MPYSP   .M2     B27,B28,B4        ; |102| 
           NOP             4

           ADDSP   .L1X    A7,B4,A7          ; |102| 
||         ADD     .L2     B10,B24,B4        ; |196| 

           NOP             3
           ADDSP   .L1     A7,A3,A3          ; |102| 
           NOP             3

           ADDSP   .L1     A10,A3,A7         ; |102| 
||         AND     .S1     A28,A29,A3        ; |102| 

           ADD     .L1     A3,A5,A5          ; |102| 
           NOP             2
           MPYSPDP .M1     A7,A5:A4,A5:A4    ; |102| 
           NOP             6
           DPSP    .L1     A5:A4,A3          ; |102| 

   [ A0]   ADDSP   .L1X    A10,B8,A3         ; |106| 
|| [ B1]   LDW     .D2T1   *+SP(44),A3       ; |196| 

   [ B2]   LDW     .D2T1   *+SP(52),A3       ; |111| 
           NOP             4

           STW     .D2T1   A3,*B4            ; |196| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B9           ; |128| 

           MVKL    .S1     t_offset,A3
||         ADD     .L2     4,B10,B10         ; |190| 

           MVKH    .S1     t_offset,A3

           LDDW    .D1T1   *A3,A5:A4         ; |130| 
||         MVKL    .S1     cycle_counts+24,A26

           MVKH    .S1     cycle_counts+24,A26

           LDDW    .D1T1   *A26,A7:A6        ; |130| 
||         MVKL    .S1     cycle_counts+24,A3

           MVKH    .S1     cycle_counts+24,A3
           MVKL    .S1     t_stop,A25

           ADDU    .L2X    A4,B6,B5:B4       ; |130| 
||         MVKH    .S1     t_stop,A25

           ADD     .S2X    B5,A5,B6          ; |130| 
||         SUBU    .L2     B8,B4,B5:B4       ; |130| 
||         STDW    .D1T2   B9:B8,*A25        ; |128| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B9,B6,B6          ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 

           ADD     .L2     B5,B6,B5          ; |130| 
||         LDW     .D2T2   *+SP(64),B6       ; |130| 

           STDW    .D1T2   B5:B4,*A3         ; |130| 
           NOP             3

           SUB     .L1X    B6,1,A0           ; |190| 
||         SUB     .L2     B6,1,B4           ; |190| 

           STW     .D2T2   B4,*+SP(64)       ; |130| 
|| [ A0]   ZERO    .L1     A4
|| [ A0]   MV      .L2X    A11,B4            ; |192| 
|| [ A0]   B       .S1     $C$L14            ; |190| 
|| [!A0]   LDDW    .D1T1   *A3,A5:A4         ; |135| 

   [ A0]   CALL    .S2     gimme_random      ; |192| 
|| [ A0]   MVKH    .S1     0x41a00000,A4

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L14}        ; |190| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL30,B3,1      ; |135| 
$C$RL30:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A11
           SET     .S1     A11,0x1a,0x1d,A11
           MPYSP   .M1     A11,A4,A3         ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           ZERO    .L1     A12               ; |135| 
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL31:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S1     cycle_counts+24,A3

           MV      .L2X    A12,B4
||         MVKH    .S1     cycle_counts+24,A3

           MV      .L2X    A12,B5

           MV      .L2X    A3,B6
||         MVK     .S2     24,B10

           SUB     .L2X    A3,B10,B10
||         STDW    .D2T1   A5:A4,*B6         ; |135| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B10        ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MV      .L1X    B13,A14           ; |116| 

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A14        ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           SUBU    .L2     B6,B4,B7:B6       ; |117| 
||         MVKL    .S2     t_offset,B11

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 

           MVK     .S2     0x80,B4
||         ADD     .L2     B4,B5,B7          ; |117| 

           MVKH    .S2     t_offset,B11
||         MVKL    .S1     input,A10

           MV      .L1X    B4,A15            ; |117| 
||         STDW    .D2T2   B7:B6,*B11        ; |117| 
||         MVKH    .S1     input,A10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A10,A3           ; |204| 
           NOP             4

           ADD     .L1     A12,A3,A3         ; |204| 
||         CALL    .S1     exp10f            ; |204| 

           LDW     .D1T1   *A3,A4            ; |204| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |204| 
$C$RL32:   ; CALL OCCURS {exp10f} {0}        ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     output,B4
||         SUB     .L1     A15,1,A0          ; |203| 
||         SUB     .S1     A15,1,A15         ; |203| 

           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |204| 
   [ A0]   BNOP    .S1     $C$L15,3          ; |203| 

           ADD     .L1X    A12,B4,A3         ; |204| 
||         ADD     .S1     4,A12,A12         ; |203| 

           STW     .D1T1   A4,*A3            ; |204| 
           ; BRANCHCC OCCURS {$C$L15}        ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A7:A6        ; |130| 
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
||         ADDKPC  .S2     $C$RL33,B3,0      ; |130| 

$C$RL33:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL34:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MV      .L2X    A12,B4            ; |130| 

           MV      .L2X    A12,B5            ; |130| 
||         STDW    .D2T1   A5:A4,*B10        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(8)    ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 

           STDW    .D1T2   B7:B6,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B5       ; |117| 
||         SUB     .L2     B8,B7,B6          ; |117| 

           ADD     .L2     B6,B5,B5          ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A12,A15

           MV      .L1X    B4,A12            ; |117| 
||         LDW     .D2T2   *+SP(68),B13      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A10,A3           ; |212| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |212| 
||         CALL    .S1     exp10sp           ; |212| 

           LDW     .D1T1   *A3,A4            ; |212| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |212| 
$C$RL35:   ; CALL OCCURS {exp10sp} {0}       ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |212| 
||         SUB     .L1     A12,1,A0          ; |211| 
||         SUB     .S1     A12,1,A12         ; |211| 

   [ A0]   BNOP    .S1     $C$L16,3          ; |211| 

           ADD     .L1X    A15,B4,A3         ; |212| 
||         ADD     .S1     4,A15,A15         ; |211| 

           STW     .D1T1   A4,*A3            ; |212| 
           ; BRANCHCC OCCURS {$C$L16}        ; |211| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A7:A6        ; |130| 
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
||         ADDKPC  .S2     $C$RL36,B3,0      ; |130| 

$C$RL36:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL37:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           ADDAD   .D2     B10,1,B12
||         MV      .L2X    A12,B5

           MV      .L2X    A12,B4
||         STDW    .D2T1   A5:A4,*B12        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(16)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 

           STDW    .D2T2   B5:B4,*B11        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A12,A15

           MV      .L1X    B4,A12            ; |117| 
||         LDW     .D2T2   *+SP(72),B13      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A10,A3           ; |220| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |220| 
||         CALL    .S1     exp10sp_c         ; |220| 

           LDW     .D1T1   *A3,A4            ; |220| 
           ADDKPC  .S2     $C$RL38,B3,3      ; |220| 
$C$RL38:   ; CALL OCCURS {exp10sp_c} {0}     ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B13,B4           ; |220| 
||         SUB     .L1     A12,1,A0          ; |219| 
||         SUB     .S1     A12,1,A12         ; |219| 

   [ A0]   BNOP    .S1     $C$L17,3          ; |219| 

           ADD     .L1X    A15,B4,A3         ; |220| 
||         ADD     .S1     4,A15,A15         ; |219| 

           STW     .D1T1   A4,*A3            ; |220| 
           ; BRANCHCC OCCURS {$C$L17}        ; |219| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B11,B9:B8        ; |130| 

           MVKL    .S2     t_stop,B31
           LDDW    .D2T2   *+B10(16),B17:B16 ; |130| 
           MV      .L2     B4,B7             ; |128| 
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
||         ADDKPC  .S2     $C$RL39,B3,0      ; |130| 

$C$RL39:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 107
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A13:A12,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL40:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 

           ADDAD   .D2     B12,1,B13
||         MV      .L2X    A12,B5

           MV      .L2X    A12,B4
||         STDW    .D2T1   A5:A4,*B13        ; |130| 

           STDW    .D2T2   B5:B4,*+B10(32)   ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B7           ; |116| 

           STDW    .D1T2   B7:B6,*A14        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B4,B6,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           MVKL    .S1     output,A15
||         ADD     .L2     B31,B6,B5         ; |117| 

           MVKH    .S1     output,A15
||         MV      .L2X    A10,B9            ; |227| 
||         STDW    .D2T2   B5:B4,*B11        ; |117| 

           CALLP   .S2     exp10sp_v,B3
||         LDW     .D1T2   *+A15(16),B4      ; |227| 
||         LDW     .D2T1   *B9,A4            ; |227| 
||         MVK     .S1     0x80,A6           ; |227| 

$C$RL41:   ; CALL OCCURS {exp10sp_v} {0}     ; |227| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A17:A16      ; |130| 
||         LDDW    .D2T2   *B11,B7:B6        ; |130| 

           MVK     .S1     16,A10
           ADD     .L1X    B13,A10,A10
           MVKL    .S1     t_stop,A3

           LDDW    .D1T1   *A10,A9:A8        ; |130| 
||         MVKH    .S1     t_stop,A3

           ADDU    .L1X    B6,A16,A5:A4      ; |130| 

           MV      .L2     B4,B9             ; |128| 
||         MV      .S2X    A3,B4             ; |128| 
||         ADD     .L1X    A5,B7,A3          ; |130| 

           SUBU    .L1X    B8,A4,A7:A6       ; |130| 

           ADD     .L1     A3,A17,A4         ; |130| 
||         EXT     .S1     A7,24,24,A3       ; |130| 

           SUB     .S1X    B9,A4,A6          ; |130| 
||         ADDU    .L1     A8,A6,A5:A4       ; |130| 

           ADD     .L1     A5,A9,A3          ; |130| 
||         ADD     .S1     A6,A3,A5          ; |130| 

           CALLP   .S2     __c6xabi_fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL42:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           MPYSP   .M1     A11,A4,A3         ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL43:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6

           STDW    .D1T1   A5:A4,*A10        ; |130| 
||         MVKH    .S2     0x3ee4f8b5,B7

           LDW     .D1T2   *+A15(4),B4       ; |66| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A15,A4           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 

$C$RL44:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     fcn_pass,B10
           MVKH    .S2     0x3ee4f8b5,B7
           MVKH    .S2     0x88e368f1,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A15,A4           ; |67| 
||         MVKH    .S2     fcn_pass,B10

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *+A15(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL45:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3ee4f8b5,B7
           MVKL    .S2     0x88e368f1,B6
           MVKH    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A15(12),B4      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A15,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL46:   ; CALL OCCURS {isequal} {0}       ; |68| 
           LDW     .D2T1   *+SP(76),A3       ; |68| 
           MVKL    .S2     0x88e368f1,B6
           MVKL    .S2     0x3ee4f8b5,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0x88e368f1,B6

           LDW     .D1T1   *A15,A4           ; |69| 
||         MVKH    .S2     0x3ee4f8b5,B7

           CALLP   .S2     isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL47:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(80),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           LDW     .D2T2   *+SP(84),B5
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
           CMPEQ   .L2     B4,0,B4           ; |72| 
           MVK     .L1     0x1,A3            ; |72| 
           NOP             2
   [ B0]   CMPEQ   .L2     B5,0,B5           ; |72| 

   [ B0]   XOR     .L2     1,B5,B4           ; |72| 
||         XOR     .S2     1,B4,B5           ; |72| 

   [ B0]   AND     .L2     B5,B4,B0          ; |72| 
|| [!B0]   ZERO    .S2     B0                ; |72| 

   [ B0]   B       .S1     $C$L19            ; |72| 
   [ B0]   CALL    .S1     print_test_results ; |233| 
   [ B0]   MVKL    .S1     all_pass,A4
   [ B0]   MVKH    .S1     all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L19}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |233| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           MV      .L1     A12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |233| 
||         ADDKPC  .S2     $C$RL48,B3,0      ; |233| 

$C$RL48:   ; CALL OCCURS {print_test_results} {0}  ; |233| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |234| 

$C$RL49:   ; CALL OCCURS {printf} {0}        ; |234| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |234| 

$C$RL50:   ; CALL OCCURS {printf} {0}        ; |234| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |241| 

$C$RL51:   ; CALL OCCURS {print_profile_results} {0}  ; |241| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |244| 

$C$RL52:   ; CALL OCCURS {print_memory_results} {0}  ; |244| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(96),B3      ; |245| 
           LDDW    .D2T1   *++SP,A13:A12     ; |245| 
           LDDW    .D2T1   *++SP,A15:A14     ; |245| 
           LDDW    .D2T2   *++SP,B11:B10     ; |245| 
           LDDW    .D2T2   *++SP,B13:B12     ; |245| 

           LDW     .D2T1   *++SP(8),A10      ; |245| 
||         RET     .S2     B3                ; |245| 

           LDW     .D2T1   *++SP(8),A11      ; |245| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |245| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"exp10SP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	exp10f
	.global	exp10
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	exp10sp
	.global	exp10sp_c
	.global	exp10sp_v
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
