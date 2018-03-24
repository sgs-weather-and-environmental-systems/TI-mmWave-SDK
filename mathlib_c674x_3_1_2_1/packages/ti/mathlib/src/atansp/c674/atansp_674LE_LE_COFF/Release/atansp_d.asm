;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:39:17 2016                                *
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
	.word	04095f1dfh		; _a[0] @ 0
	.word	0c08c7117h		; _a[1] @ 32
	.word	0c0c71a0fh		; _a[2] @ 64
	.word	0403e4c45h		; _a[3] @ 96
	.word	0c05963a3h		; _a[4] @ 128
	.word	04068e0f4h		; _a[5] @ 160
	.word	0bfe6080bh		; _a[6] @ 192
	.word	0c0aedd23h		; _a[7] @ 224
	.word	0c07f15b0h		; _a[8] @ 256
	.word	0bf0eff92h		; _a[9] @ 288
	.word	04078f59eh		; _a[10] @ 320
	.word	0bfa88ff6h		; _a[11] @ 352
	.word	0c0ae08f3h		; _a[12] @ 384
	.word	0c070f6e8h		; _a[13] @ 416
	.word	04095b49ch		; _a[14] @ 448
	.word	0beedf41eh		; _a[15] @ 480
	.word	03f855e62h		; _a[16] @ 512
	.word	0bf84a9d4h		; _a[17] @ 544
	.word	0bf99cabch		; _a[18] @ 576
	.word	0c00b2a54h		; _a[19] @ 608
	.word	04047a123h		; _a[20] @ 640
	.word	0408b1771h		; _a[21] @ 672
	.word	03fa541c7h		; _a[22] @ 704
	.word	0bfa2cd43h		; _a[23] @ 736
	.word	040ad4d10h		; _a[24] @ 768
	.word	03f54e1ach		; _a[25] @ 800
	.word	0c0c1ea2eh		; _a[26] @ 832
	.word	0bf41de51h		; _a[27] @ 864
	.word	0408f3b52h		; _a[28] @ 896
	.word	0c0c5a714h		; _a[29] @ 928
	.word	03ebf564dh		; _a[30] @ 960
	.word	03f03ffb8h		; _a[31] @ 992
	.word	03f7e1d3eh		; _a[32] @ 1024
	.word	040b2caf9h		; _a[33] @ 1056
	.word	0bfcd56ffh		; _a[34] @ 1088
	.word	0c08dd3e3h		; _a[35] @ 1120
	.word	03d46887bh		; _a[36] @ 1152
	.word	0be4b41fch		; _a[37] @ 1184
	.word	0c096dca5h		; _a[38] @ 1216
	.word	0c0b70dd5h		; _a[39] @ 1248
	.word	0bfd26d42h		; _a[40] @ 1280
	.word	0c0a7f0d0h		; _a[41] @ 1312
	.word	0401e0a14h		; _a[42] @ 1344
	.word	0bfdee7e6h		; _a[43] @ 1376
	.word	0c0322602h		; _a[44] @ 1408
	.word	03f194de5h		; _a[45] @ 1440
	.word	0bfde853ah		; _a[46] @ 1472
	.word	03f7051bbh		; _a[47] @ 1504
	.word	03ffd4075h		; _a[48] @ 1536
	.word	0c0c000c0h		; _a[49] @ 1568
	.word	0402e59d8h		; _a[50] @ 1600
	.word	0bb269454h		; _a[51] @ 1632
	.word	0c029b5e8h		; _a[52] @ 1664
	.word	040c898a3h		; _a[53] @ 1696
	.word	0402a54e6h		; _a[54] @ 1728
	.word	0c029222ah		; _a[55] @ 1760
	.word	0c028f5f1h		; _a[56] @ 1792
	.word	0c01eea1eh		; _a[57] @ 1824
	.word	03ff12363h		; _a[58] @ 1856
	.word	0bef15828h		; _a[59] @ 1888
	.word	0c0949d86h		; _a[60] @ 1920
	.word	0c09a5001h		; _a[61] @ 1952
	.word	0c08a181eh		; _a[62] @ 1984
	.word	04091b025h		; _a[63] @ 2016
	.word	03fbeaae4h		; _a[64] @ 2048
	.word	040b652cch		; _a[65] @ 2080
	.word	0c05c22ech		; _a[66] @ 2112
	.word	0400cb2b9h		; _a[67] @ 2144
	.word	040a3f9b6h		; _a[68] @ 2176
	.word	040174ad0h		; _a[69] @ 2208
	.word	0c0840c7bh		; _a[70] @ 2240
	.word	0bf359565h		; _a[71] @ 2272
	.word	0be07c44fh		; _a[72] @ 2304
	.word	03e84e3c4h		; _a[73] @ 2336
	.word	04005ea76h		; _a[74] @ 2368
	.word	0c0b880a2h		; _a[75] @ 2400
	.word	0c0677014h		; _a[76] @ 2432
	.word	0c0c59c50h		; _a[77] @ 2464
	.word	0403629b3h		; _a[78] @ 2496
	.word	0401f6426h		; _a[79] @ 2528
	.word	0c0455297h		; _a[80] @ 2560
	.word	0c0b93054h		; _a[81] @ 2592
	.word	04021a8f9h		; _a[82] @ 2624
	.word	040c08d23h		; _a[83] @ 2656
	.word	0c08d41c1h		; _a[84] @ 2688
	.word	0409000e0h		; _a[85] @ 2720
	.word	0c026983bh		; _a[86] @ 2752
	.word	0406b8f4eh		; _a[87] @ 2784
	.word	040579505h		; _a[88] @ 2816
	.word	0c0b94257h		; _a[89] @ 2848
	.word	03f223777h		; _a[90] @ 2880
	.word	0bfade7d9h		; _a[91] @ 2912
	.word	0c0109a6bh		; _a[92] @ 2944
	.word	03e93d47ch		; _a[93] @ 2976
	.word	0408c008fh		; _a[94] @ 3008
	.word	0bfbff0c7h		; _a[95] @ 3040
	.word	0bfd12b00h		; _a[96] @ 3072
	.word	03f5848bah		; _a[97] @ 3104
	.word	040afdc3ah		; _a[98] @ 3136
	.word	040225ffbh		; _a[99] @ 3168
	.word	04080a0bfh		; _a[100] @ 3200
	.word	0406d8b1dh		; _a[101] @ 3232
	.word	040958402h		; _a[102] @ 3264
	.word	03fdac174h		; _a[103] @ 3296
	.word	040a694cbh		; _a[104] @ 3328
	.word	0c08ba564h		; _a[105] @ 3360
	.word	0c0a65fefh		; _a[106] @ 3392
	.word	040787db9h		; _a[107] @ 3424
	.word	0c04ba3efh		; _a[108] @ 3456
	.word	040b676d7h		; _a[109] @ 3488
	.word	0c002c3c0h		; _a[110] @ 3520
	.word	0c06ad73dh		; _a[111] @ 3552
	.word	0404b6bc9h		; _a[112] @ 3584
	.word	04089dc4eh		; _a[113] @ 3616
	.word	040371514h		; _a[114] @ 3648
	.word	0c0915945h		; _a[115] @ 3680
	.word	04028b551h		; _a[116] @ 3712
	.word	0406fcb57h		; _a[117] @ 3744
	.word	0402b0813h		; _a[118] @ 3776
	.word	0c03b30e4h		; _a[119] @ 3808
	.word	0403ab170h		; _a[120] @ 3840
	.word	0c0890b96h		; _a[121] @ 3872
	.word	0c0a80f35h		; _a[122] @ 3904
	.word	03f98335ch		; _a[123] @ 3936
	.word	0406e2614h		; _a[124] @ 3968
	.word	03fa5ecefh		; _a[125] @ 4000
	.word	040c0924bh		; _a[126] @ 4032
	.word	0bea3a882h		; _a[127] @ 4064
	.word	0c06e2f97h		; _a[128] @ 4096
	.word	0c08d2fd8h		; _a[129] @ 4128
	.word	040973a5ch		; _a[130] @ 4160
	.word	03f9891a4h		; _a[131] @ 4192
	.word	03fb87e16h		; _a[132] @ 4224
	.word	0c086cabfh		; _a[133] @ 4256
	.word	03fad5579h		; _a[134] @ 4288
	.word	040c6236ah		; _a[135] @ 4320
	.word	0c0c1caeeh		; _a[136] @ 4352
	.word	0bfec4d1fh		; _a[137] @ 4384
	.word	0c00559a0h		; _a[138] @ 4416
	.word	0c0b7ae5fh		; _a[139] @ 4448
	.word	040519d65h		; _a[140] @ 4480
	.word	04058ac44h		; _a[141] @ 4512
	.word	03f6a4184h		; _a[142] @ 4544
	.word	0be896784h		; _a[143] @ 4576
	.word	03e934b9eh		; _a[144] @ 4608
	.word	04070bd9eh		; _a[145] @ 4640
	.word	0c07f0986h		; _a[146] @ 4672
	.word	0bfdf1bb5h		; _a[147] @ 4704
	.word	0c004c5d7h		; _a[148] @ 4736
	.word	0c07676ach		; _a[149] @ 4768
	.word	0bfebab35h		; _a[150] @ 4800
	.word	0c0a14107h		; _a[151] @ 4832
	.word	03f4f6464h		; _a[152] @ 4864
	.word	0c0bbe871h		; _a[153] @ 4896
	.word	03fdf7262h		; _a[154] @ 4928
	.word	0bf0a8eaah		; _a[155] @ 4960
	.word	040af9166h		; _a[156] @ 4992
	.word	0403d2c73h		; _a[157] @ 5024
	.word	040a8ab7ch		; _a[158] @ 5056
	.word	03e6e2677h		; _a[159] @ 5088
	.word	03d01d10bh		; _a[160] @ 5120
	.word	0c0a708feh		; _a[161] @ 5152
	.word	0bf589632h		; _a[162] @ 5184
	.word	0403de70fh		; _a[163] @ 5216
	.word	040061a45h		; _a[164] @ 5248
	.word	0c07f333bh		; _a[165] @ 5280
	.word	04045faa9h		; _a[166] @ 5312
	.word	0409dafeeh		; _a[167] @ 5344
	.word	0c0828395h		; _a[168] @ 5376
	.word	0be1441f1h		; _a[169] @ 5408
	.word	040682d07h		; _a[170] @ 5440
	.word	0c0996e9eh		; _a[171] @ 5472
	.word	0c0971224h		; _a[172] @ 5504
	.word	0407ce2f7h		; _a[173] @ 5536
	.word	0407a3f4bh		; _a[174] @ 5568
	.word	0409c3e21h		; _a[175] @ 5600
	.word	040b08ebdh		; _a[176] @ 5632
	.word	0c024b39bh		; _a[177] @ 5664
	.word	0bf62957bh		; _a[178] @ 5696
	.word	0c0c1f7efh		; _a[179] @ 5728
	.word	0bf9cb353h		; _a[180] @ 5760
	.word	0bf78bd0fh		; _a[181] @ 5792
	.word	03f840d6fh		; _a[182] @ 5824
	.word	04005f160h		; _a[183] @ 5856
	.word	03fe6b050h		; _a[184] @ 5888
	.word	0c0bcd581h		; _a[185] @ 5920
	.word	03f806c06h		; _a[186] @ 5952
	.word	0c0028556h		; _a[187] @ 5984
	.word	0c09a5937h		; _a[188] @ 6016
	.word	0c025f1aeh		; _a[189] @ 6048
	.word	0c0b74140h		; _a[190] @ 6080
	.word	0409a0d85h		; _a[191] @ 6112
	.word	03fd5770dh		; _a[192] @ 6144
	.word	0403ec629h		; _a[193] @ 6176
	.word	040bb632dh		; _a[194] @ 6208
	.word	0bd3deee3h		; _a[195] @ 6240
	.word	0bff07608h		; _a[196] @ 6272
	.word	0c064a4bch		; _a[197] @ 6304
	.word	040050ddbh		; _a[198] @ 6336
	.word	0402b0acbh		; _a[199] @ 6368
	.word	04051ca9dh		; _a[200] @ 6400
$C$IR_1:	.set	804

	.global	_a
_a:	.usect	".far",804,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\012768 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\0127610 
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
;*   Local Frame Size  : 8 Args + 72 Auto + 56 Save = 136 byte                *
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

           STW     .D2T2   B3,*SP--(88)      ; |112| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |120| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A12

           MVKH    .S1     _a,A12
||         MVKL    .S2     _output,B11

           CALL    .S1     _atanf            ; |129| 
||         MV      .L1     A12,A13
||         MV      .D1X    B4,A10
||         MVKH    .S2     _output,B11
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
$C$RL1:    ; CALL OCCURS {_atanf} {0}        ; |129| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |129| 
||         SUB     .L1     A10,1,A0          ; |128| 
||         SUB     .S1     A10,1,A10         ; |128| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |128| 
|| [!A0]   MVK     .S2     0xc9,B5

           ADD     .L2     B10,B4,B4         ; |129| 
||         ADD     .S2     4,B10,B10         ; |128| 

   [ A0]   CALL    .S1     _atanf            ; |129| 
||         STW     .D2T1   A4,*B4            ; |129| 
|| [!A0]   ADD     .L2     4,B11,B4

           ; BRANCHCC OCCURS {$C$L1}         ; |128| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     _atansp           ; |132| 
||         ZERO    .L2     B10
||         MV      .L1X    B5,A10
||         MV      .D1     A12,A11
||         STW     .D2T2   B4,*+SP(48)

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |132| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |132| 
$C$RL2:    ; CALL OCCURS {_atansp} {0}       ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(48),B4       ; |132| 
           SUB     .L1     A10,1,A0          ; |131| 
           SUB     .L1     A10,1,A10         ; |131| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |132| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |131| 

           ADD     .L2     B10,B4,B4         ; |132| 
||         ADD     .S2     4,B10,B10         ; |131| 

   [ A0]   CALL    .S1     _atansp           ; |132| 
||         STW     .D2T1   A4,*B4            ; |132| 

           ; BRANCHCC OCCURS {$C$L2}         ; |131| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(48),B4
           MVK     .S2     0xc9,B5
           ZERO    .L2     B10
           MV      .L1     A11,A12
           MV      .L1X    B5,A10
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(52)
||         CALL    .S1     _atansp_c         ; |135| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |135| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |135| 
$C$RL3:    ; CALL OCCURS {_atansp_c} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(52),B4       ; |135| 
           SUB     .L1     A10,1,A0          ; |134| 
           SUB     .L1     A10,1,A10         ; |134| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |135| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |134| 

           ADD     .L2     B10,B4,B4         ; |135| 
||         ADD     .S2     4,B10,B10         ; |134| 

   [ A0]   CALL    .S1     _atansp_c         ; |135| 
||         STW     .D2T1   A4,*B4            ; |135| 

           ; BRANCHCC OCCURS {$C$L3}         ; |134| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13

           LDW     .D2T2   *+SP(52),B4
||         MVKL    .S2     0xbc647bb5,B6
||         MVKL    .S1     0x3d21435c,A3
||         ZERO    .L1     A5
||         ZERO    .D1     A6
||         MV      .L2X    A11,B16

           MVKL    .S2     0xbe11271d,B7
||         MVKL    .S1     0xbd942fbf,A15

           MVKL    .S2     0x3fc90fdb,B5
||         MVKL    .S1     0xbeaaaa23,A13

           MVKL    .S2     0x3dd77af5,B8
||         MVKH    .S1     0x3d21435c,A3

           MVKH    .S2     0xbc647bb5,B6
||         MVKH    .S1     0xbd942fbf,A15
||         STW     .D2T1   A3,*+SP(12)

           MVKH    .S2     0xbe11271d,B7
||         SET     .S1     A5,0x1e,0x1e,A5
||         ADD     .L2     4,B4,B9
||         ZERO    .L1     A3                ; |106| 
||         MV      .D2X    A3,B20

           MVKH    .S2     0x3fc90fdb,B5
||         SET     .S1     A6,0x17,0x1d,A8
||         LDW     .D2T2   *B9,B17
||         MV      .L1X    B6,A16
||         MV      .L2X    A15,B21

           MVKH    .S2     0x3dd77af5,B8
||         MVKH    .S1     0xbeaaaa23,A13
||         STW     .D2T2   B9,*+SP(40)
||         ZERO    .L1     A5                ; |106| 
||         MV      .L2X    A5,B22

           MVKL    .S1     0x3e4cb0c1,A4
||         MVKL    .S2     0x3b16d624,B31
||         MV      .L1X    B5,A6
||         STW     .D2T2   B6,*+SP(16)
||         MV      .L2X    A8,B23

           MVKH    .S1     0x3e4cb0c1,A4
||         MVKH    .S2     0x3b16d624,B31
||         MV      .L1X    B7,A8
||         STW     .D2T2   B7,*+SP(24)
||         MV      .L2X    A13,B18

           MVK     .S1     0xc9,A9
||         MV      .L1X    B8,A7
||         STW     .D2T2   B5,*+SP(32)
||         MV      .L2     B31,B19
||         DINT                              ; interrupts off

           STW     .D2T2   B8,*+SP(28)
||         SUB     .L1     A9,1,A1
||         MV      .S1     A4,A9

           STW     .D2T1   A4,*+SP(20)
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/atansp/atansp_d.c
;*      Loop source line                 : 137
;*      Loop opening brace source line   : 137
;*      Loop closing brace source line   : 139
;*      Known Minimum Trip Count         : 201                    
;*      Known Maximum Trip Count         : 201                    
;*      Known Max Trip Count Factor      : 201
;*      Loop Carried Dependency Bound(^) : 83
;*      Unpartitioned Resource Bound     : 10
;*      Partitioned Resource Bound(*)    : 16
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     0        0     
;*      .S units                     4        3     
;*      .D units                     0        2     
;*      .M units                     4       16*    
;*      .X cross paths               7        5     
;*      .T address paths             0        2     
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           3        9     (.L or .S unit)
;*      Addition ops (.LSD)          4        7     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             4        6     
;*      Bound(.L .S .D .LS .LSD)     4        7     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 83 Did not find schedule
;*         ii = 84 Schedule found with 1 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: | * * *****      **              |         *      ********        |
;*       1: | * * *****      **              |         *      ********        |
;*       2: | * * *****      **              |         *      ********        |
;*       3: | * * *****      **              |         *      ********        |
;*       4: | * * *****      **              |         *      ********        |
;*       5: | * * *****      **              |     *   *      ********        |
;*       6: | * * *****      **              |    **   *      ********        |
;*       7: | * * *****      **              |*    *   *      ********        |
;*       8: | * * *****      **              |*    **  *      ********        |
;*       9: | * * *****      **              |*    *** *      ********        |
;*      10: | * * *****      **              |*    *** *      ********        |
;*      11: | * * *****      **              |*    *** *      ********        |
;*      12: | * * *****      **              |*    *** *      ********        |
;*      13: | * * *****      **              |*   **** *      ********        |
;*      14: | * * *****      **              |*    *** *      ********        |
;*      15: | * * *****      **              |*    *** *      ********        |
;*      16: | * * *****      **              |*    *** *      ********        |
;*      17: | * * *****      **              |*   **** *      ********        |
;*      18: | * * *****      **              |*    **  *      ********        |
;*      19: | * * *****      **              |*    **  *      ********        |
;*      20: | * * *****      **              |*    **  *      ********        |
;*      21: | * * *****      **              |*   ***  *      ********        |
;*      22: | * * *****      **              |*   **   *      ********        |
;*      23: | * * *****      **              |*   **   *      ********        |
;*      24: | * * *****      **              |*   **   *      ********        |
;*      25: | * * *****      **              |*   ***  *      ********        |
;*      26: | * * *****      **              |*   **   *      ********        |
;*      27: | * * *****      **              |*   **   *      ********        |
;*      28: | * * *****      **              |*   **   *      ********        |
;*      29: | * * *****      **              |*   ***  *      ********        |
;*      30: | * * *****      **              |*    *   *      ********        |
;*      31: | * * *****      **              |*    *   *      ********        |
;*      32: | * *******      **              |**   *   *      ********        |
;*      33: |** *******      **              | *  **   *      ********        |
;*      34: | * *******      **              | *   *   *      ********        |
;*      35: |** *******      **              | *       *      ********        |
;*      36: |** *******      **              | *    *  *      ********        |
;*      37: |** *******      **              | *    * **      ********        |
;*      38: |** *******      **              | *    * **      ********        |
;*      39: |** *******      **              | *    * **      ********        |
;*      40: |** *******      **              | *    * **      ********        |
;*      41: |** *******      **              | *  * * **      ********        |
;*      42: |** *******      **              | *  * * **      ********        |
;*      43: |** *******      **              | *  * * **      ********        |
;*      44: |** *******      **              | *  * * **      ********        |
;*      45: |** *******      **              | *  * ****      ********        |
;*      46: |** *******      **              | *  * ****      ********        |
;*      47: |** *******      **              | *    ****      ********        |
;*      48: |** *******      ***             | *  * ****      ********        |
;*      49: |** *******      ***             | *  ******      ********        |
;*      50: |** *******      ***             | *  ******      ********        |
;*      51: |** *******      **              | *  ******      ********        |
;*      52: |** *******      **              | *  * * **      ********        |
;*      53: |** *******      **              | *  * * **      ********        |
;*      54: |** *******      **  *           | *  * * **      ********        |
;*      55: |** *******      ** **           | *   ** **      ********        |
;*      56: |** *******      *****           | *   ** **      ********        |
;*      57: |** *******      **  *           | *  *** **      ********        |
;*      58: |** *******      **  *           | *   ** **      ********        |
;*      59: |** *******      **  *           | *   ** **      ********        |
;*      60: |** *******      *** *           | *   ** **      ********        |
;*      61: |** *******      **              | *  *** **      ********        |
;*      62: |** *******      **              | *    * **      ********        |
;*      63: |** *******      **              | *    * **      ********        |
;*      64: |** *******      ***             | *    * **      ********        |
;*      65: |** *******      ***             | *  * * **      ********        |
;*      66: |** *******      **              | *    * **      ********        |
;*      67: |** *******      **              | *    * **      ********        |
;*      68: |** *******      **              | *    * **      ********        |
;*      69: |** *******      **              | *  * * **      ********        |
;*      70: |** *******      **              | *    * **      ********        |
;*      71: |** *******      **              | *    * **      ********        |
;*      72: |** *******      **              | *    * **      ********        |
;*      73: |** *******      **              | *  * * **      ********        |
;*      74: |** *******      **              | *    *  *      ********        |
;*      75: |** *******      **              | *    *  *      ********        |
;*      76: |** *******      **              | *    *  *      ********        |
;*      77: |** *******      **              | *  * *  *      ********        |
;*      78: |** *******      **              | *  * *  *      ********        |
;*      79: |** *******      **              |      *  *      ********        |
;*      80: |** *******      **              |      *  *      ********        |
;*      81: |** *******      **              |      *  *      ********        |
;*      82: |** *******      **              |      *  *      ********        |
;*      83: | * *******      **              |      *  *      ********        |
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
;*      Total cycles (est.)         : 0 + min_trip_cnt * 84 = 16884        
;*----------------------------------------------------------------------------*
;*       SETUP CODE
;*
;*                  SUB             A1,1,A1
;*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C135:
;*   0              LDW     .D2T2   *B16++,B5         ; |138|  ^ 
;*   1              NOP             4
;*   5              ABSSP   .S2     B5,B4             ; |124|  ^ 
;*   6              CMPGTSP .S2     B4,B23,B0         ; |124|  ^ 
;*   7      [!B0]   MV      .S2     B23,B6            ; |117|  ^ 
;*     ||   [ B0]   MV      .L2     B5,B6             ; |125|  ^ 
;*   8              RCPSP   .S2     B6,B7             ; |94|  ^ 
;*   9              MPYSP   .M2     B6,B7,B4          ; |94|  ^ 
;*  10              NOP             3
;*  13              SUBSP   .L2     B22,B4,B4         ; |94|  ^ 
;*  14              NOP             3
;*  17              MPYSP   .M2     B7,B4,B4          ; |94|  ^ 
;*  18              NOP             3
;*  21              MPYSP   .M2     B6,B4,B6          ; |94|  ^ 
;*  22              NOP             3
;*  25              SUBSP   .L2     B22,B6,B6         ; |94|  ^ 
;*  26              NOP             3
;*  29              MPYSP   .M2     B4,B6,B4          ; |94|  ^ 
;*  30              NOP             1
;*  31      [!B0]   ZERO    .L2     B1                ; |119| 
;*     ||   [ B0]   MVK     .S2     0x1,B1            ; |127| 
;*     ||           SET     .S1     A5,31,31,A4       ; |106| 
;*  32              CMPLTSP .S1X    B5,A3,A0          ; |121| 
;*     ||   [ B0]   MV      .L2     B23,B5            ; |126| 
;*     ||   [!B1]   MV      .L1     A3,A17            ; |106| 
;*     ||   [ B1]   MV      .D1     A6,A17            ; |106| 
;*  33              MPYSP   .M2     B5,B4,B8          ; |94|  ^ 
;*     ||   [ A0]   XOR     .L1     A17,A4,A4         ; |106| 
;*     ||   [!A0]   MV      .S1     A17,A4            ; |106| 
;*  34              CMPEQSP .S1X    B5,A3,A0          ; |106| 
;*  35      [ A0]   MV      .L2X    A3,B6             ; |106| 
;*  36              NOP             1
;*  37              MPYSP   .M2     B8,B8,B4          ; |94|  ^ 
;*  38              NOP             3
;*  41              MPYSP   .M2     B4,B4,B7          ; |94|  ^ 
;*  42              NOP             2
;*  44              MPYSP   .M2     B18,B4,B4         ; |103| 
;*     ||           MPYSP   .M1X    A16,B4,A18        ; |103| 
;*  45              MPYSP   .M2     B19,B7,B5         ; |103|  ^ 
;*  46              MPYSP   .M2     B7,B4,B5          ; |103| 
;*     ||           MPYSP   .M1X    A9,B7,A18         ; |103| 
;*  47              MPYSP   .M2     B7,B7,B4          ; |103| 
;*  48              NOP             1
;*  49              ADDSP   .L2X    A18,B5,B4         ; |103|  ^ 
;*  50              ADDSP   .L1X    B4,A18,A20        ; |103| 
;*     ||           MPYSP   .M2     B7,B5,B4          ; |103| 
;*  51              MPYSP   .M1X    A8,B5,A19         ; |103| 
;*     ||           MPYSP   .M2     B7,B4,B5          ; |103| 
;*  52              MPYSP   .M1X    A7,B4,A18         ; |103| 
;*  53              ADDSP   .L2     B20,B4,B4         ; |103|  ^ 
;*  54              MPYSP   .M2     B21,B4,B5         ; |103| 
;*  55              NOP             1
;*  56              ADDSP   .L1     A19,A18,A18       ; |103| 
;*  57              MPYSP   .M2     B5,B4,B4          ; |103|  ^ 
;*  58              NOP             2
;*  60              ADDSP   .L1     A20,A18,A18       ; |103| 
;*  61              ADDSP   .L2     B5,B4,B4          ; |103|  ^ 
;*  62              NOP             3
;*  65              ADDSP   .L2X    B4,A18,B4         ; |103|  ^ 
;*  66              NOP             3
;*  69              MPYSP   .M2     B8,B4,B4          ; |103|  ^ 
;*  70              NOP             3
;*  73              ADDSP   .L2     B8,B4,B4          ; |103|  ^ 
;*  74              NOP             3
;*  77      [ B1]   SUBSP   .L2X    A4,B4,B9          ; |106|  ^ 
;*  78      [!B1]   ADDSP   .L2X    B4,A4,B9          ; |106|  ^ 
;*     ||   [ A1]   BDEC    .S1     $C$C135,A1        ; |137| 
;*  79              NOP             3
;*  82      [!A0]   MV      .L2     B9,B6             ; |106|  ^ 
;*  83              STW     .D2T2   B6,*B17++         ; |106|  ^ 
;*  84              ; BRANCHCC OCCURS {$C$C135}       ; |137| 
;*----------------------------------------------------------------------------*
$C$L4:    ; PIPED LOOP PROLOG
;** --------------------------------------------------------------------------*
$C$L5:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 84
           LDW     .D2T2   *B16++,B5         ; |138| <0,0>  ^ 
           NOP             4
           ABSSP   .S2     B5,B4             ; |124| <0,5>  ^ 
           CMPGTSP .S2     B4,B23,B0         ; |124| <0,6>  ^ 

   [ B0]   MV      .L2     B5,B6             ; |125| <0,7>  ^ 
|| [!B0]   MV      .S2     B23,B6            ; |117| <0,7>  ^ 

           RCPSP   .S2     B6,B7             ; |94| <0,8>  ^ 
           MPYSP   .M2     B6,B7,B4          ; |94| <0,9>  ^ 
           NOP             3
           SUBSP   .L2     B22,B4,B4         ; |94| <0,13>  ^ 
           NOP             3
           MPYSP   .M2     B7,B4,B4          ; |94| <0,17>  ^ 
           NOP             3
           MPYSP   .M2     B6,B4,B6          ; |94| <0,21>  ^ 
           NOP             3
           SUBSP   .L2     B22,B6,B6         ; |94| <0,25>  ^ 
           NOP             3
           MPYSP   .M2     B4,B6,B4          ; |94| <0,29>  ^ 
           NOP             1

           SET     .S1     A5,31,31,A4       ; |106| <0,31> 
|| [!B0]   ZERO    .L2     B1                ; |119| <0,31> 
|| [ B0]   MVK     .S2     0x1,B1            ; |127| <0,31> 

   [!B1]   MV      .L1     A3,A17            ; |106| <0,32> 
|| [ B1]   MV      .D1     A6,A17            ; |106| <0,32> 
||         CMPLTSP .S1X    B5,A3,A0          ; |121| <0,32> 
|| [ B0]   MV      .L2     B23,B5            ; |126| <0,32> 

   [ A0]   XOR     .L1     A17,A4,A4         ; |106| <0,33> 
|| [!A0]   MV      .S1     A17,A4            ; |106| <0,33> 
||         MPYSP   .M2     B5,B4,B8          ; |94| <0,33>  ^ 

           CMPEQSP .S1X    B5,A3,A0          ; |106| <0,34> 
   [ A0]   MV      .L2X    A3,B6             ; |106| <0,35> 
           NOP             1
           MPYSP   .M2     B8,B8,B4          ; |94| <0,37>  ^ 
           NOP             3
           MPYSP   .M2     B4,B4,B7          ; |94| <0,41>  ^ 
           NOP             2

           MPYSP   .M2     B18,B4,B4         ; |103| <0,44> 
||         MPYSP   .M1X    A16,B4,A18        ; |103| <0,44> 

           MPYSP   .M2     B19,B7,B5         ; |103| <0,45>  ^ 

           MPYSP   .M1X    A9,B7,A18         ; |103| <0,46> 
||         MPYSP   .M2     B7,B4,B5          ; |103| <0,46> 

           MPYSP   .M2     B7,B7,B4          ; |103| <0,47> 
           NOP             1
           ADDSP   .L2X    A18,B5,B4         ; |103| <0,49>  ^ 

           ADDSP   .L1X    B4,A18,A20        ; |103| <0,50> 
||         MPYSP   .M2     B7,B5,B4          ; |103| <0,50> 

           MPYSP   .M2     B7,B4,B5          ; |103| <0,51> 
||         MPYSP   .M1X    A8,B5,A19         ; |103| <0,51> 

           MPYSP   .M1X    A7,B4,A18         ; |103| <0,52> 
           ADDSP   .L2     B20,B4,B4         ; |103| <0,53>  ^ 
           MPYSP   .M2     B21,B4,B5         ; |103| <0,54> 
           NOP             1
           ADDSP   .L1     A19,A18,A18       ; |103| <0,56> 
           MPYSP   .M2     B5,B4,B4          ; |103| <0,57>  ^ 
           NOP             2
           ADDSP   .L1     A20,A18,A18       ; |103| <0,60> 
           ADDSP   .L2     B5,B4,B4          ; |103| <0,61>  ^ 
           NOP             3
           ADDSP   .L2X    B4,A18,B4         ; |103| <0,65>  ^ 
           NOP             3
           MPYSP   .M2     B8,B4,B4          ; |103| <0,69>  ^ 
           NOP             3
           ADDSP   .L2     B8,B4,B4          ; |103| <0,73>  ^ 
           NOP             3
   [ B1]   SUBSP   .L2X    A4,B4,B9          ; |106| <0,77>  ^ 

   [ A1]   BDEC    .S1     $C$L5,A1          ; |137| <0,78> 
|| [!B1]   ADDSP   .L2X    B4,A4,B9          ; |106| <0,78>  ^ 

           NOP             3
   [!A0]   MV      .L2     B9,B6             ; |106| <0,82>  ^ 
           STW     .D2T2   B6,*B17++         ; |106| <0,83>  ^ 
;** --------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP EPILOG
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A6,*+SP(32)
           STW     .D2T1   A16,*+SP(16)

           MV      .L1X    B18,A13
||         STW     .D2T1   A9,*+SP(20)

           MV      .L1X    B19,A14
||         STW     .D2T1   A8,*+SP(24)

           MV      .L1X    B21,A15
||         STW     .D2T1   A7,*+SP(28)

           STW     .D2T2   B20,*+SP(12)
||         MV      .L1X    B22,A12
||         RINT                              ; interrupts on

           CALLP   .S2     _atansp_v,B3
||         LDW     .D2T2   *+B11(16),B4      ; |140| 
||         MVK     .S1     0xc9,A6           ; |140| 
||         MV      .L1     A11,A4            ; |140| 
||         MV      .L2X    A3,B10
||         MV      .D1X    B23,A10

$C$RL4:    ; CALL OCCURS {_atansp_v} {0}     ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 48
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B11,A4           ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL5:    ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL6:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B6(8)        ; |67| 
||         MVKL    .S2     0xa0b5ed8d,B6

           MV      .L2     B11,B5
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B5,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     _fcn_pass,B4

           LDW     .D2T1   *+SP(40),A3       ; |68| 
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B4
           MVKL    .S2     _output,B31
           MVKH    .S2     0xa0b5ed8d,B6

           ADD     .L1     4,A3,A3
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           MVKH    .S2     _output,B31
||         STW     .D2T1   A3,*+SP(44)

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL8:    ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           MVKL    .S1     _fcn_pass,A3
||         MVKL    .S2     _fcn_pass,B5

           MVKH    .S1     _fcn_pass,A3
||         MVKH    .S2     _fcn_pass,B5

           ADD     .L1     4,A3,A3
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A4,*+B5(16)       ; |69| 
           ADD     .L2     8,B5,B4
           STW     .D2T2   B4,*+SP(60)       ; |69| 
           STW     .D2T1   A3,*+SP(56)

   [!A0]   B       .S1     $C$L7             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |144| 
   [!A0]   ZERO    .L1     A3                ; |72| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S1     _all_pass,A4
   [!A0]   MVKH    .S1     _all_pass,A4
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
           CALL    .S1     _print_test_results ; |144| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x1,A4            ; |144| 
||         ADDKPC  .S2     $C$RL9,B3,0       ; |144| 

$C$RL9:    ; CALL OCCURS {_print_test_results} {0}  ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           LDW     .D2T1   *+SP(40),A3       ; |154| 

           MVKL    .S2     _a_sc,B6
||         MVK     .L2     0x7,B31

           MVKH    .S2     _a_sc,B6
||         ZERO    .L1     A7
||         MVK     .L2     -1,B7             ; |157| 
||         STW     .D2T2   B31,*+SP(36)      ; |152| 

           MVKH    .S1     0x80000000,A7
||         MV      .L1X    B10,A6            ; |152| 
||         STW     .D2T2   B7,*+B6(24)       ; |157| 

           MV      .L1X    B6,A11            ; |152| 
||         ZERO    .S1     A5
||         ZERO    .L2     B4
||         STDW    .D2T1   A7:A6,*B6         ; |152| 

           MVKH    .S1     0xbf800000,A5
||         MV      .L1     A10,A4            ; |156| 
||         ZERO    .L2     B5
||         SET     .S2     B4,0x17,0x1e,B4
||         STW     .D2T1   A3,*+SP(64)       ; |89| 

           STDW    .D2T1   A5:A4,*+B6(16)    ; |156| 
||         MV      .L2X    A11,B6            ; |152| 
||         MVKH    .S2     0xff800000,B5

           STDW    .D2T2   B5:B4,*+B6(8)     ; |154| 
           LDW     .D1T1   *A11,A3           ; |159| 
           ZERO    .L2     B11
           NOP             2
           CALL    .S1     _atan             ; |159| 
           SPDP    .S2X    A3,B5:B4          ; |159| 
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
;          EXCLUSIVE CPU CYCLES: 4
           NOP             2
           MV      .L1X    B5,A5             ; |159| 

           MV      .L1X    B4,A4             ; |159| 
||         ADDKPC  .S2     $C$RL10,B3,0      ; |159| 

$C$RL10:   ; CALL OCCURS {_atan} {0}         ; |159| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *A3,A3            ; |159| 
           DPSP    .L1     A5:A4,A4          ; |159| 
           NOP             3
           ADD     .L1X    B11,A3,A3         ; |159| 
           STW     .D1T1   A4,*A3            ; |159| 

           CALLP   .S2     _atansp,B3
||         LDW     .D1T1   *A11,A4           ; |160| 

$C$RL11:   ; CALL OCCURS {_atansp} {0}       ; |160| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(4),A3        ; |160| 
           NOP             4
           ADD     .L2X    B11,A3,B4         ; |160| 
           STW     .D2T1   A4,*B4            ; |160| 

           CALLP   .S2     _atansp_c,B3
||         LDW     .D1T1   *A11,A4           ; |161| 

$C$RL12:   ; CALL OCCURS {_atansp_c} {0}     ; |161| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 100
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(8),A3        ; |161| 
           LDW     .D2T2   *+SP(16),B31      ; |103| 
           LDW     .D2T2   *+SP(20),B30      ; |103| 
           LDW     .D2T2   *+SP(28),B29      ; |103| 
           LDW     .D2T2   *+SP(24),B28      ; |103| 
           ADD     .L2X    B11,A3,B4         ; |161| 
           STW     .D2T1   A4,*B4            ; |161| 
           LDW     .D1T1   *A11++,A5         ; |162| 
           LDW     .D2T2   *+SP(12),B27      ; |103| 
           ZERO    .L2     B25               ; |89| 
           LDW     .D2T2   *+SP(64),B24      ; |83| 
           NOP             1
           MV      .L1     A5,A3             ; |124| 
           ABSSP   .S1     A3,A4             ; |124| 
           CMPGTSP .S1     A4,A10,A0         ; |124| 
   [!A0]   MV      .L1     A10,A3            ; |117| 
           RCPSP   .S1     A3,A4             ; |133| 
           MPYSP   .M1     A3,A4,A6          ; |133| 
           CMPLTSP .S2X    A5,B10,B0         ; |121| 
   [ A0]   MV      .L1     A10,A5            ; |126| 

   [ A0]   MVK     .L1     0x1,A0            ; |127| 
|| [!A0]   ZERO    .S1     A0                ; |119| 

           SUBSP   .L1     A12,A6,A6         ; |133| 
   [ A0]   LDW     .D2T2   *+SP(32),B12      ; |83| 
   [!A0]   MV      .L2     B10,B12           ; |83| 
           CMPEQSP .S1X    A5,B10,A2         ; |135| 
           MPYSP   .M1     A4,A6,A4          ; |133| 
           NOP             3
           MPYSP   .M1     A3,A4,A3          ; |133| 
           NOP             3
           SUBSP   .L1     A12,A3,A3         ; |133| 
           NOP             3
           MPYSP   .M1     A4,A3,A3          ; |133| 
           NOP             3
           MPYSP   .M1     A5,A3,A6          ; |133| 
           NOP             3
           MPYSP   .M1     A6,A6,A4          ; |103| 
           NOP             3
           MPYSP   .M1     A4,A4,A3          ; |103| 
           MPYSP   .M2X    B31,A4,B4         ; |103| 
           MPYSP   .M1     A13,A4,A31        ; |103| 
           NOP             1
           MPYSP   .M1     A14,A3,A9         ; |103| 
           MPYSP   .M1     A3,A4,A7          ; |103| 
           MPYSP   .M1     A3,A3,A8          ; |103| 
           MPYSP   .M2X    B30,A3,B7         ; |103| 
           NOP             1

           ADDSP   .L2X    B4,A9,B5          ; |103| 
||         MPYSP   .M1     A3,A7,A29         ; |103| 

           MPYSP   .M2X    B28,A7,B8         ; |103| 
           MPYSP   .M1     A3,A8,A30         ; |103| 
           MPYSP   .M2X    B29,A8,B6         ; |103| 
           ADDSP   .L2     B27,B5,B4         ; |103| 
           ADDSP   .L1X    A31,B7,A28        ; |103| 
           MPYSP   .M1     A15,A29,A3        ; |103| 
           ADDSP   .L2     B8,B6,B6          ; |103| 
           MPYSP   .M2X    A30,B4,B5         ; |103| 
           NOP             2
           ADDSP   .L2X    A28,B6,B26        ; |103| 
           ADDSP   .L2X    A3,B5,B5          ; |103| 
           SET     .S2     B25,31,31,B6      ; |89| 
   [ B0]   XOR     .S2     B12,B6,B12        ; |89| 
           NOP             1
           ADDSP   .L2     B5,B26,B4         ; |103| 
           NOP             3
           MPYSP   .M2X    A6,B4,B5          ; |103| 
           NOP             3
           ADDSP   .L2X    A6,B5,B4          ; |103| 
           LDW     .D2T2   *B24,B5           ; |162| 
           NOP             2

   [!A0]   ADDSP   .L2     B4,B12,B13        ; |106| 
|| [ A0]   SUBSP   .S2     B12,B4,B13        ; |106| 
||         LDW     .D2T2   *+SP(36),B4       ; |136| 

           NOP             1
           ADD     .L2     B11,B5,B5         ; |162| 
           ADD     .D2     4,B11,B11         ; |158| 
   [ A2]   MV      .L2     B10,B13           ; |136| 

           STW     .D2T2   B13,*B5           ; |162| 
||         SUB     .L1X    B4,1,A0           ; |158| 
||         SUB     .L2     B4,1,B4           ; |158| 

   [ A0]   BNOP    .S1     $C$L8,1           ; |158| 
|| [ A0]   LDW     .D1T1   *A11,A3           ; |159| 
|| [!A0]   MVKL    .S2     _output,B11
||         STW     .D2T2   B4,*+SP(36)       ; |162| 

   [!A0]   MVKL    .S1     _a_sc,A4
   [!A0]   MVKH    .S2     _output,B11
   [ A0]   CALL    .S1     _atan             ; |159| 

   [!A0]   CALL    .S1     _atansp_v         ; |164| 
||         SPDP    .S2X    A3,B5:B4          ; |159| 
|| [!A0]   LDW     .D2T2   *+B11(16),B4      ; |164| 

           ; BRANCHCC OCCURS {$C$L8}         ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           MVKH    .S1     _a_sc,A4
           MVK     .L1     0x7,A6            ; |164| 
           ADDKPC  .S2     $C$RL13,B3,2      ; |164| 
$C$RL13:   ; CALL OCCURS {_atansp_v} {0}     ; |164| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .L1     0x7,A6            ; |66| 
||         MVK     .S1     0x1,A8            ; |66| 

$C$RL14:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B5
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .L1     0x7,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL15:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B11,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVK     .L1     0x7,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL16:   ; CALL OCCURS {_isequal} {0}      ; |68| 

           LDW     .D2T1   *+SP(44),A3       ; |68| 
||         MVKL    .S2     _fcn_pass,B4

           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B4

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           MV      .L2     B11,B31           ; |69| 
||         STW     .D2T1   A3,*+SP(64)       ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         LDW     .D2T1   *B31,A4           ; |69| 
||         MVK     .L1     0x7,A6            ; |69| 
||         MVK     .S1     0x1,A8            ; |69| 

$C$RL17:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           LDW     .D2T1   *+SP(56),A3       ; |69| 
           MVKL    .S2     _fcn_pass,B31
           MVKH    .S2     _fcn_pass,B31
           STW     .D2T1   A4,*+B31(16)      ; |69| 
           NOP             1

           MV      .L2X    A3,B4             ; |69| 
||         STW     .D2T1   A3,*+SP(68)       ; |69| 

           LDW     .D2T2   *B4,B0            ; |72| 
           LDW     .D2T1   *+SP(60),A3
           NOP             3

   [!B0]   B       .S1     $C$L9             ; |72| 
|| [!B0]   ZERO    .L1     A4                ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     _print_test_results ; |168| 
|| [ B0]   MV      .L2X    A3,B4
||         STW     .D2T1   A3,*+SP(72)       ; |72| 
|| [!B0]   MVKL    .S1     _all_pass,A3

   [!B0]   MVKH    .S1     _all_pass,A3
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
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
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S2     0xc000cccc,B4
           MVKL    .S2     0xcccccccd,B31
           MVK     .S2     0xed,B30
           MVKL    .S2     _a_ext,B5
           MVKH    .S2     0xc000cccc,B4

           MVKH    .S2     0xcccccccd,B31
||         STW     .D2T2   B30,*+SP(36)

           MVKH    .S2     _a_ext,B5
||         ZERO    .L1     A4
||         STW     .D2T2   B4,*+SP(80)       ; |177| 

           MV      .L2     B5,B29            ; |171| 
||         SET     .S1     A4,0x17,0x17,A4
||         STW     .D2T2   B31,*+SP(76)      ; |177| 

           MV      .L1X    B5,A11            ; |171| 
||         STW     .D2T1   A4,*B29           ; |171| 

           LDW     .D1T1   *A11,A3           ; |173| 
           ZERO    .L2     B11
           NOP             2
           CALL    .S1     _atan             ; |173| 
           SPDP    .S2X    A3,B5:B4          ; |173| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 4
           NOP             2
           MV      .L1X    B5,A5             ; |173| 

           MV      .L1X    B4,A4             ; |173| 
||         ADDKPC  .S2     $C$RL19,B3,0      ; |173| 

$C$RL19:   ; CALL OCCURS {_atan} {0}         ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |173| 
           DPSP    .L1     A5:A4,A3          ; |173| 
           NOP             3
           ADD     .L2     B11,B4,B4         ; |173| 
           STW     .D2T1   A3,*B4            ; |173| 

           CALLP   .S2     _atansp,B3
||         LDW     .D1T1   *A11,A4           ; |174| 

$C$RL20:   ; CALL OCCURS {_atansp} {0}       ; |174| 
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(4),B4        ; |174| 
           NOP             4
           ADD     .L2     B11,B4,B4         ; |174| 
           STW     .D2T1   A4,*B4            ; |174| 

           CALLP   .S2     _atansp_c,B3
||         LDW     .D1T1   *A11,A4           ; |175| 

$C$RL21:   ; CALL OCCURS {_atansp_c} {0}     ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 119
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *+B4(8),B4        ; |175| 
           LDW     .D2T2   *+SP(16),B31      ; |103| 
           LDW     .D2T2   *+SP(20),B30      ; |103| 
           LDW     .D2T2   *+SP(28),B29      ; |103| 
           LDW     .D2T2   *+SP(24),B28      ; |103| 
           ADD     .L2     B11,B4,B4         ; |175| 
           STW     .D2T1   A4,*B4            ; |175| 
           LDW     .D1T1   *A11,A5           ; |176| 
           LDW     .D2T2   *+SP(12),B27      ; |103| 
           ZERO    .L2     B25               ; |89| 
           LDW     .D2T2   *+SP(40),B24      ; |83| 
           NOP             1
           MV      .L1     A5,A3             ; |124| 
           ABSSP   .S1     A3,A4             ; |124| 
           CMPGTSP .S1     A4,A10,A0         ; |124| 
   [!A0]   MV      .L1     A10,A3            ; |117| 
           RCPSP   .S1     A3,A4             ; |133| 
           MPYSP   .M1     A3,A4,A6          ; |133| 
           CMPLTSP .S1X    A5,B10,A16        ; |121| 
   [ A0]   MV      .L1     A10,A5            ; |126| 
           MV      .L2X    A16,B0            ; |133| 
           SUBSP   .L1     A12,A6,A6         ; |133| 

   [ A0]   MVK     .L1     0x1,A0            ; |127| 
|| [!A0]   ZERO    .S1     A0                ; |119| 

   [ A0]   LDW     .D2T2   *+SP(32),B12      ; |83| 
   [!A0]   MV      .L2     B10,B12           ; |83| 
           MPYSP   .M1     A4,A6,A4          ; |133| 
           CMPEQSP .S2X    A5,B10,B2         ; |135| 
           NOP             2
           MPYSP   .M1     A3,A4,A3          ; |133| 
           NOP             3
           SUBSP   .L1     A12,A3,A3         ; |133| 
           NOP             3
           MPYSP   .M1     A4,A3,A3          ; |133| 
           NOP             3
           MPYSP   .M1     A5,A3,A6          ; |133| 
           NOP             3
           MPYSP   .M1     A6,A6,A4          ; |103| 
           NOP             3
           MPYSP   .M1     A4,A4,A3          ; |103| 
           MPYSP   .M2X    B31,A4,B4         ; |103| 
           MPYSP   .M1     A13,A4,A31        ; |103| 
           NOP             1
           MPYSP   .M1     A14,A3,A9         ; |103| 
           MPYSP   .M1     A3,A4,A7          ; |103| 
           MPYSP   .M1     A3,A3,A8          ; |103| 
           MPYSP   .M2X    B30,A3,B6         ; |103| 
           NOP             1

           ADDSP   .L2X    B4,A9,B5          ; |103| 
||         MPYSP   .M1     A3,A7,A29         ; |103| 

           MPYSP   .M2X    B28,A7,B8         ; |103| 
           MPYSP   .M1     A3,A8,A30         ; |103| 
           MPYSP   .M2X    B29,A8,B7         ; |103| 
           ADDSP   .L2     B27,B5,B4         ; |103| 
           ADDSP   .L1X    A31,B6,A4         ; |103| 
           MPYSP   .M1     A15,A29,A3        ; |103| 
           ADDSP   .L2     B8,B7,B26         ; |103| 
           MPYSP   .M2X    A30,B4,B4         ; |103| 
           SET     .S2     B25,31,31,B6      ; |89| 
   [ B0]   XOR     .S2     B12,B6,B12        ; |89| 
           ADDSP   .L2X    A4,B26,B5         ; |103| 
           ADDSP   .L2X    A3,B4,B4          ; |103| 
           NOP             3
           ADDSP   .L2     B4,B5,B4          ; |103| 
           NOP             3
           MPYSP   .M2X    A6,B4,B5          ; |103| 
           LDW     .D2T2   *B24,B4           ; |176| 
           NOP             2
           ADDSP   .L2X    A6,B5,B5          ; |103| 
           NOP             3

   [ A0]   SUBSP   .L2     B12,B5,B13        ; |106| 
|| [!A0]   ADDSP   .S2     B5,B12,B13        ; |106| 

           ADD     .L2     B11,B4,B4         ; |176| 
           LDW     .D2T2   *+SP(80),B5
           ADD     .D2     4,B11,B11         ; |172| 
   [ B2]   MV      .L2     B10,B13           ; |136| 
           STW     .D2T2   B13,*B4           ; |176| 
           LDW     .D1T2   *A11,B6           ; |177| 
           LDW     .D2T2   *+SP(76),B4
           NOP             4
           MPYSPDP .M2     B6,B5:B4,B5:B4    ; |177| 
           NOP             6

           DPSP    .L2     B5:B4,B5          ; |177| 
||         LDW     .D2T2   *+SP(36),B4

           NOP             3
           STW     .D1T2   B5,*++A11         ; |177| 

           SUB     .L1X    B4,1,A0           ; |172| 
||         SUB     .L2     B4,1,B4           ; |172| 

   [ A0]   BNOP    .S1     $C$L10,1          ; |172| 
|| [ A0]   LDW     .D1T1   *A11,A3           ; |173| 
|| [!A0]   MVKL    .S2     _output,B11
||         STW     .D2T2   B4,*+SP(36)       ; |177| 

   [!A0]   MVKL    .S1     _a_ext,A4
   [!A0]   MVKH    .S2     _output,B11
   [ A0]   CALL    .S1     _atan             ; |173| 

   [!A0]   CALL    .S1     _atansp_v         ; |179| 
||         SPDP    .S2X    A3,B5:B4          ; |173| 
|| [!A0]   LDW     .D2T2   *+B11(16),B4      ; |179| 

           ; BRANCHCC OCCURS {$C$L10}        ; |172| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           MVKH    .S1     _a_ext,A4
           MVK     .S1     0xed,A6           ; |179| 
           ADDKPC  .S2     $C$RL22,B3,2      ; |179| 
$C$RL22:   ; CALL OCCURS {_atansp_v} {0}     ; |179| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .S1     0xed,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL23:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B12
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B12
           MVKL    .S2     0xa0b5ed8d,B6

           LDW     .D2T2   *+B11(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B12(4)       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B11,A4           ; |67| 
||         MVK     .S1     0xed,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL24:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1X    B11,A3            ; |67| 
||         STW     .D2T1   A4,*+B12(8)       ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVK     .S1     0xed,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL25:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T1   *+SP(44),A3       ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L2     B11,B4            ; |68| 
||         STW     .D2T1   A4,*+B12(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B4,A4            ; |69| 
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0xed,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL26:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(56),A3       ; |69| 
           LDW     .D2T2   *+SP(60),B4
           STW     .D2T1   A4,*+B12(16)      ; |69| 
           NOP             2
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [!A0]   B       .S1     $C$L11            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |183| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   ZERO    .L1     A3                ; |72| 
   [!A0]   MVKL    .S1     _all_pass,A4
   [!A0]   MVKH    .S1     _all_pass,A4
           ; BRANCHCC OCCURS {$C$L11}        ; |72| 
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
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x4,A4            ; |183| 
||         ADDKPC  .S2     $C$RL27,B3,0      ; |183| 

$C$RL27:   ; CALL OCCURS {_print_test_results} {0}  ; |183| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L2     B5                ; |114| 

           STW     .D2T2   B5,*+SP(40)       ; |114| 
||         ZERO    .L2     B4                ; |114| 
||         MVKL    .S2     _cycle_counts+24,B7

           MVKH    .S2     _cycle_counts+24,B7
||         STW     .D2T2   B4,*+SP(36)       ; |114| 
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
||         MVK     .S2     0x80,B30

           MVKL    .S2     0xc0c90fda,B4
||         STDW    .D1T2   B5:B4,*A5         ; |117| 
||         MVKL    .S1     0x41490fda,A4

           MVKH    .S2     0xc0c90fda,B4
||         MVKH    .S1     0x41490fda,A4
||         STW     .D2T2   B30,*+SP(44)      ; |117| 
||         ZERO    .L1     A11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL28,B3,0      ; |193| 
$C$RL28:   ; CALL OCCURS {_gimme_random} {0}  ; |193| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 110

           MVKL    .S1     _input,A3
||         MV      .L1     A4,A5             ; |193| 

           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |193| 
           NOP             4
           ADD     .L1     A11,A3,A3         ; |193| 

           STW     .D1T1   A5,*A3            ; |193| 
||         MVC     .S2     TSCL,B6           ; |122| 

           MVC     .S2     TSCH,B7           ; |122| 

           ABSSP   .S1     A4,A3             ; |124| 
||         LDW     .D2T2   *+SP(16),B4       ; |103| 
||         ZERO    .L2     B27               ; |89| 

           CMPGTSP .S1     A3,A10,A0         ; |124| 
||         LDW     .D2T2   *+SP(20),B31      ; |103| 

   [!A0]   MV      .L1     A10,A4            ; |117| 
||         LDW     .D2T2   *+SP(28),B30      ; |103| 
||         MVKL    .S1     _output+12,A27

           RCPSP   .S1     A4,A3             ; |133| 
||         LDW     .D2T2   *+SP(24),B29      ; |103| 

           MPYSP   .M1     A4,A3,A6          ; |133| 
||         LDW     .D2T2   *+SP(12),B28      ; |103| 
||         MVKH    .S1     _output+12,A27

           MVKL    .S1     _t_start,A26
           MVKH    .S1     _t_start,A26
           STDW    .D1T2   B7:B6,*A26
           SUBSP   .L1     A12,A6,A6         ; |133| 
           NOP             3
           MPYSP   .M1     A3,A6,A3          ; |133| 
           NOP             3
           MPYSP   .M1     A4,A3,A4          ; |133| 
           NOP             3
           SUBSP   .L1     A12,A4,A4         ; |133| 
           NOP             3

           MPYSP   .M1     A3,A4,A3          ; |133| 
||         MV      .L1     A5,A4             ; |197| 

           CMPLTSP .S1X    A4,B10,A16        ; |121| 
|| [ A0]   MV      .L1     A10,A4            ; |126| 

   [ A0]   MVK     .L1     0x1,A0            ; |127| 
|| [!A0]   ZERO    .S1     A0                ; |119| 

   [ A0]   LDW     .D2T2   *+SP(32),B11      ; |83| 
||         MV      .L2X    A16,B0            ; |133| 
|| [!A0]   MV      .S2     B10,B11           ; |83| 

           MPYSP   .M1     A4,A3,A6          ; |133| 
||         CMPEQSP .S2X    A4,B10,B2         ; |135| 

           NOP             3
           MPYSP   .M1     A6,A6,A5          ; |103| 
           NOP             3
           MPYSP   .M1     A5,A5,A3          ; |103| 

           MPYSP   .M2X    B4,A5,B4          ; |103| 
||         MPYSP   .M1     A13,A5,A31        ; |103| 

           NOP             2
           MPYSP   .M1     A14,A3,A9         ; |103| 

           MPYSP   .M1     A3,A3,A8          ; |103| 
||         MPYSP   .M2X    B31,A3,B5         ; |103| 

           MPYSP   .M1     A3,A5,A7          ; |103| 
           NOP             2

           ADDSP   .L2X    B4,A9,B16         ; |103| 
||         MPYSP   .M1     A3,A8,A30         ; |103| 

           MPYSP   .M1     A3,A7,A29         ; |103| 
||         MPYSP   .M2X    B30,A8,B8         ; |103| 
||         ADDSP   .L1X    A31,B5,A28        ; |103| 
||         LDW     .D1T1   *A27,A3           ; |197| 

           MPYSP   .M2X    B29,A7,B9         ; |103| 
           NOP             1
           ADDSP   .L2     B28,B16,B4        ; |103| 
           MPYSP   .M1     A15,A29,A5        ; |103| 

           ADDSP   .L2     B9,B8,B5          ; |103| 
||         ADD     .L1     A11,A3,A3         ; |197| 

           NOP             1
           MPYSP   .M2X    A30,B4,B4         ; |103| 
           NOP             1
           ADDSP   .L2X    A28,B5,B5         ; |103| 
           NOP             1
           ADDSP   .L2X    A5,B4,B4          ; |103| 
           NOP             3

           ADDSP   .L2     B4,B5,B4          ; |103| 
||         SET     .S2     B27,31,31,B5      ; |89| 

   [ B0]   XOR     .L2     B11,B5,B11        ; |89| 
           NOP             2
           MPYSP   .M2X    A6,B4,B4          ; |103| 
           NOP             3
           ADDSP   .L2X    A6,B4,B4          ; |103| 
           NOP             3

   [!A0]   ADDSP   .L2     B4,B11,B12        ; |106| 
|| [ A0]   SUBSP   .S2     B11,B4,B12        ; |106| 

           NOP             3
   [ B2]   MV      .L2     B10,B12           ; |136| 

           STW     .D1T2   B12,*A3           ; |197| 
||         MVC     .S2     TSCL,B4           ; |128| 

           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     _t_offset,B13
||         MVKL    .S1     _t_stop,A3
||         ADD     .L1     4,A11,A11         ; |191| 

           MVKH    .S2     _t_offset,B13
||         MVKH    .S1     _t_stop,A3

           LDDW    .D2T2   *B13,B17:B16      ; |130| 
||         MVKL    .S2     _cycle_counts+24,B8

           MVKH    .S2     _cycle_counts+24,B8
||         STDW    .D1T2   B5:B4,*A3         ; |128| 
||         MVKL    .S1     _cycle_counts+24,A3

           LDDW    .D2T2   *B8,B19:B18       ; |130| 
||         MVKH    .S1     _cycle_counts+24,A3

           NOP             2
           ADDU    .L2     B16,B6,B9:B8      ; |130| 

           ADD     .S2     B9,B17,B6         ; |130| 
||         SUBU    .L2     B4,B8,B9:B8       ; |130| 
||         LDW     .D2T2   *+SP(44),B4       ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
||         EXT     .S2     B9,24,24,B9       ; |130| 

           ADDU    .L2     B18,B8,B7:B6      ; |130| 
||         SUB     .S2     B5,B6,B8          ; |130| 

           ADD     .L2     B7,B19,B7         ; |130| 
||         ADD     .S2     B8,B9,B8          ; |130| 

           ADD     .L2     B7,B8,B7          ; |130| 

           SUB     .L1X    B4,1,A0           ; |191| 
||         SUB     .L2     B4,1,B4           ; |191| 
||         STDW    .D1T2   B7:B6,*A3         ; |130| 

           STW     .D2T2   B4,*+SP(44)       ; |130| 
|| [ A0]   MVKL    .S1     0x41490fda,A4
|| [ A0]   B       .S2     $C$L12            ; |191| 
|| [!A0]   LDDW    .D1T1   *A3,A5:A4         ; |135| 

   [ A0]   CALL    .S1     _gimme_random     ; |193| 
|| [ A0]   MVKL    .S2     0xc0c90fda,B4

   [!A0]   CALL    .S2     __fltllif         ; |135| 
|| [ A0]   MVKH    .S1     0x41490fda,A4

   [ A0]   MVKH    .S2     0xc0c90fda,B4
           NOP             2
           ; BRANCHCC OCCURS {$C$L12}        ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL29,B3,1      ; |135| 
$C$RL29:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
           CALLP   .S2     __fixdlli,B3
$C$RL30:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           MVKL    .S2     _cycle_counts+24,B6
           MVKH    .S2     _cycle_counts+24,B6

           STDW    .D2T1   A5:A4,*B6         ; |135| 
||         MV      .L2X    A12,B5

           SUBAW   .D2     B6,6,B10
||         MV      .L2X    A12,B4

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T2   B5:B4,*B10        ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     _t_start,A14
           MVKH    .S1     _t_start,A14

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A14        ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B4,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B5,B4          ; |117| 

           MVK     .S2     0x80,B4
||         ADD     .L2     B4,B5,B7          ; |117| 

           MVKL    .S1     _input,A10

           MV      .L1X    B4,A15            ; |117| 
||         STDW    .D2T2   B7:B6,*B13        ; |117| 
||         MVKH    .S1     _input,A10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A10,A3           ; |205| 
           NOP             4

           ADD     .L1     A12,A3,A3         ; |205| 
||         CALL    .S1     _atanf            ; |205| 

           LDW     .D1T1   *A3,A4            ; |205| 
           ADDKPC  .S2     $C$RL31,B3,3      ; |205| 
$C$RL31:   ; CALL OCCURS {_atanf} {0}        ; |205| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9

           MVKL    .S2     _output,B4
||         SUB     .L1     A15,1,A0          ; |204| 
||         SUB     .S1     A15,1,A15         ; |204| 

           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |205| 
   [ A0]   BNOP    .S1     $C$L13,3          ; |204| 

           ADD     .L1X    A12,B4,A3         ; |205| 
||         ADD     .S1     4,A12,A12         ; |204| 

           STW     .D1T1   A4,*A3            ; |205| 
           ; BRANCHCC OCCURS {$C$L13}        ; |204| 
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

           ADD     .L1X    A5,B9,A31         ; |130| 
||         LDDW    .D2T2   *B10,B9:B8        ; |130| 
||         MV      .S1     A4,A3             ; |130| 

           STDW    .D2T2   B7:B6,*B11        ; |128| 

           SUBU    .L2X    B6,A3,B5:B4       ; |130| 
||         ADD     .L1     A31,A7,A3         ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           CALL    .S1     __fltllif         ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         SUB     .S2X    B7,A3,B8          ; |130| 

           ADD     .L2     B5,B9,B31         ; |130| 
||         ADD     .S2     B8,B16,B5         ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B31,B5,B4         ; |130| 

           ADDKPC  .S2     $C$RL32,B3,0      ; |130| 
           MV      .L1X    B4,A5             ; |130| 
$C$RL32:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL33:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MV      .L2X    A12,B4            ; |130| 

           MV      .L2X    A12,B5            ; |130| 
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

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 

           STDW    .D2T2   B5:B4,*B13        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A12,A15

           MV      .L1X    B4,A12            ; |117| 
||         LDW     .D2T2   *+SP(48),B12      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A10,A3           ; |213| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |213| 
||         CALL    .S1     _atansp           ; |213| 

           LDW     .D1T1   *A3,A4            ; |213| 
           ADDKPC  .S2     $C$RL34,B3,3      ; |213| 
$C$RL34:   ; CALL OCCURS {_atansp} {0}       ; |213| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |213| 
||         SUB     .L1     A12,1,A0          ; |212| 
||         SUB     .S1     A12,1,A12         ; |212| 

   [ A0]   BNOP    .S1     $C$L14,3          ; |212| 

           ADD     .L1X    A15,B4,A3         ; |213| 
||         ADD     .S1     4,A15,A15         ; |212| 

           STW     .D1T1   A4,*A3            ; |213| 
           ; BRANCHCC OCCURS {$C$L14}        ; |212| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A7:A6        ; |130| 
||         LDDW    .D2T2   *B13,B9:B8        ; |130| 

           MV      .L2     B4,B7             ; |128| 
           MV      .L2     B11,B30           ; |130| 
           NOP             2
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B9,A3          ; |130| 
||         LDDW    .D2T2   *+B10(8),B9:B8    ; |130| 

           ADD     .L1     A3,A7,A3          ; |130| 
||         SUBU    .L2X    B6,A4,B5:B4       ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
           SUB     .L2X    B7,A3,B31         ; |130| 
           CALL    .S1     __fltllif         ; |130| 

           ADDU    .L2     B8,B4,B5:B4       ; |130| 
||         ADD     .S2     B31,B16,B8        ; |130| 

           ADD     .L2     B5,B9,B5          ; |130| 

           MV      .L1X    B4,A4             ; |130| 
||         ADD     .L2     B5,B8,B4          ; |130| 

           STDW    .D2T2   B7:B6,*B30        ; |128| 

           ADDKPC  .S2     $C$RL35,B3,0      ; |130| 
||         MV      .L1X    B4,A5             ; |130| 

$C$RL35:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL36:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14

           ADDAD   .D2     B10,1,B11
||         MV      .L2X    A12,B5

           MV      .L2X    A12,B4
||         STDW    .D2T1   A5:A4,*B11        ; |130| 

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

           STDW    .D2T2   B5:B4,*B13        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A12,A15

           MV      .L1X    B4,A12            ; |117| 
||         LDW     .D2T2   *+SP(52),B12      ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A10,A3           ; |221| 
           NOP             4

           ADD     .L1     A15,A3,A3         ; |221| 
||         CALL    .S1     _atansp_c         ; |221| 

           LDW     .D1T1   *A3,A4            ; |221| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |221| 
$C$RL37:   ; CALL OCCURS {_atansp_c} {0}     ; |221| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |221| 
||         SUB     .L1     A12,1,A0          ; |220| 
||         SUB     .S1     A12,1,A12         ; |220| 

   [ A0]   BNOP    .S1     $C$L15,3          ; |220| 

           ADD     .L1X    A15,B4,A3         ; |221| 
||         ADD     .S1     4,A15,A15         ; |220| 

           STW     .D1T1   A4,*A3            ; |221| 
           ; BRANCHCC OCCURS {$C$L15}        ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B13,B9:B8        ; |130| 

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
||         ADDKPC  .S2     $C$RL38,B3,0      ; |130| 

$C$RL38:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 107
           MPYSP   .M1     A11,A4,A3         ; |130| 
           ZERO    .L1     A12               ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A13:A12,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL39:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 

           ADDAD   .D2     B11,1,B12
||         MV      .L2X    A12,B5

           MV      .L2X    A12,B4
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

           MVKL    .S1     _output,A15
||         ADD     .L2     B4,B5,B7          ; |117| 

           MVKH    .S1     _output,A15
||         MV      .L2X    A10,B9            ; |228| 
||         STDW    .D2T2   B7:B6,*B13        ; |117| 

           CALLP   .S2     _atansp_v,B3
||         LDW     .D1T2   *+A15(16),B4      ; |228| 
||         LDW     .D2T1   *B9,A4            ; |228| 
||         MVK     .S1     0x80,A6           ; |228| 

$C$RL40:   ; CALL OCCURS {_atansp_v} {0}     ; |228| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A17:A16      ; |130| 
||         LDDW    .D2T2   *B13,B7:B6        ; |130| 

           MVK     .S1     16,A10
           ADD     .L1X    B12,A10,A10
           MVKL    .S1     _t_stop,A3

           LDDW    .D1T1   *A10,A9:A8        ; |130| 
||         MVKH    .S1     _t_stop,A3

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

           CALLP   .S2     __fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL41:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           MPYSP   .M1     A11,A4,A3         ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL42:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           STDW    .D1T1   A5:A4,*A10        ; |130| 
||         MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A15(4),B4       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A15,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL43:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     _fcn_pass,B10
           MVKH    .S2     0x3eb0c6f7,B7
           MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A15,A4           ; |67| 
||         MVKH    .S2     _fcn_pass,B10

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A15(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL44:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A15(12),B4      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A15,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL45:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T1   *+SP(64),A3       ; |68| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           LDW     .D1T1   *A15,A4           ; |69| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL46:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T2   *+SP(68),B5       ; |69| 
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             2
           LDW     .D2T2   *B5,B0            ; |72| 
           LDW     .D2T2   *+SP(72),B5
           NOP             3

   [!B0]   B       .S1     $C$L16            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [ B0]   LDW     .D2T2   *B5,B0            ; |72| 
   [ B1]   ADD     .L2     4,B5,B5
           NOP             3
           ; BRANCHCC OCCURS {$C$L16}        ; |72| 
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

   [ B0]   B       .S1     $C$L17            ; |72| 
   [ B0]   CALL    .S1     _print_test_results ; |234| 
   [ B0]   MVKL    .S1     _all_pass,A3
   [ B0]   MVKH    .S1     _all_pass,A3
           NOP             2
           ; BRANCHCC OCCURS {$C$L17}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |234| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           MV      .L1     A12,A4
           NOP             1
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x2,A4            ; |234| 
||         ADDKPC  .S2     $C$RL47,B3,0      ; |234| 

$C$RL47:   ; CALL OCCURS {_print_test_results} {0}  ; |234| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |235| 

$C$RL48:   ; CALL OCCURS {_printf} {0}       ; |235| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |235| 

$C$RL49:   ; CALL OCCURS {_printf} {0}       ; |235| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |242| 

$C$RL50:   ; CALL OCCURS {_print_profile_results} {0}  ; |242| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |245| 

$C$RL51:   ; CALL OCCURS {_print_memory_results} {0}  ; |245| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(88),B3      ; |246| 
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
$C$SL1:	.string	"atanSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_atan
	.global	_atanf
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_atansp
	.global	_atansp_c
	.global	_atansp_v
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
