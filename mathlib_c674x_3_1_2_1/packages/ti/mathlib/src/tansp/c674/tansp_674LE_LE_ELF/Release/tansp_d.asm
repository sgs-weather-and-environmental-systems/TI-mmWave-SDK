;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Tue May 17 00:02:14 2016                                *
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
	.elfsym	a,SYM_SIZE(720)
a:
	.word	0b951b717h		; a[0] @ 0
	.word	0396a5b53h		; a[1] @ 32
	.word	0b982f261h		; a[2] @ 64
	.word	039925545h		; a[3] @ 96
	.word	0b9a386f7h		; a[4] @ 128
	.word	039b6bddfh		; a[5] @ 160
	.word	0b9cc36bbh		; a[6] @ 192
	.word	039e4357dh		; a[7] @ 224
	.word	0b9ff0603h		; a[8] @ 256
	.word	03a0e7e8fh		; a[9] @ 288
	.word	0ba1f3ccah		; a[10] @ 320
	.word	03a31f2a7h		; a[11] @ 352
	.word	0ba46db52h		; a[12] @ 384
	.word	03a5e38f0h		; a[13] @ 416
	.word	0ba785562h		; a[14] @ 448
	.word	03a8ac1a1h		; a[15] @ 480
	.word	0ba9b0f6eh		; a[16] @ 512
	.word	03aad47a1h		; a[17] @ 544
	.word	0bac1a3e0h		; a[18] @ 576
	.word	03ad86497h		; a[19] @ 608
	.word	0baf1d1aeh		; a[20] @ 640
	.word	03b071dceh		; a[21] @ 672
	.word	0bb16fe1ah		; a[22] @ 704
	.word	03b28bbf6h		; a[23] @ 736
	.word	0bb3c8f7dh		; a[24] @ 768
	.word	03b52b761h		; a[25] @ 800
	.word	0bb6b79bah		; a[26] @ 832
	.word	03b83926bh		; a[27] @ 864
	.word	0bb93081bh		; a[28] @ 896
	.word	03ba44ed0h		; a[29] @ 928
	.word	0bbb79d32h		; a[30] @ 960
	.word	03bcd304eh		; a[31] @ 992
	.word	0bbe54c60h		; a[32] @ 1024
	.word	03c001ed6h		; a[33] @ 1056
	.word	0bc0f2cb2h		; a[34] @ 1088
	.word	03c1fff65h		; a[35] @ 1120
	.word	0bc32cc1bh		; a[36] @ 1152
	.word	03c47ce56h		; a[37] @ 1184
	.word	0bc5f4885h		; a[38] @ 1216
	.word	03c7984dch		; a[39] @ 1248
	.word	0bc8b6b33h		; a[40] @ 1280
	.word	03c9bcceah		; a[41] @ 1312
	.word	0bcae1b67h		; a[42] @ 1344
	.word	03cc29089h		; a[43] @ 1376
	.word	0bcd96d09h		; a[44] @ 1408
	.word	03cf2f937h		; a[45] @ 1440
	.word	0bd07c2edh		; a[46] @ 1472
	.word	03d17b6a0h		; a[47] @ 1504
	.word	0bd298a2ah		; a[48] @ 1536
	.word	03d3d75edh		; a[49] @ 1568
	.word	0bd53b8e5h		; a[50] @ 1600
	.word	03d6c9981h		; a[51] @ 1632
	.word	0bd843336h		; a[52] @ 1664
	.word	03d93bbcah		; a[53] @ 1696
	.word	0bda5179eh		; a[54] @ 1728
	.word	03db87d97h		; a[55] @ 1760
	.word	0bdce2b14h		; a[56] @ 1792
	.word	03de6649eh		; a[57] @ 1824
	.word	0be00bb68h		; a[58] @ 1856
	.word	03e0fdbabh		; a[59] @ 1888
	.word	0be20c2eeh		; a[60] @ 1920
	.word	03e33a69fh		; a[61] @ 1952
	.word	0be48c289h		; a[62] @ 1984
	.word	03e605964h		; a[63] @ 2016
	.word	0be7ab5d1h		; a[64] @ 2048
	.word	03e8c1596h		; a[65] @ 2080
	.word	0be9c8b51h		; a[66] @ 2112
	.word	03eaef02bh		; a[67] @ 2144
	.word	0bec37e51h		; a[68] @ 2176
	.word	03eda76c2h		; a[69] @ 2208
	.word	0bef42225h		; a[70] @ 2240
	.word	03f0868d7h		; a[71] @ 2272
	.word	0bf18700ah		; a[72] @ 2304
	.word	03f2a595dh		; a[73] @ 2336
	.word	0bf3e5d78h		; a[74] @ 2368
	.word	03f54bba5h		; a[75] @ 2400
	.word	0bf6dbaa6h		; a[76] @ 2432
	.word	03f84d4c3h		; a[77] @ 2464
	.word	0bf947054h		; a[78] @ 2496
	.word	03fa5e15dh		; a[79] @ 2528
	.word	0bfb95f0bh		; a[80] @ 2560
	.word	03fcf2703h		; a[81] @ 2592
	.word	0bfe77e2ch		; a[82] @ 2624
	.word	0400158bch		; a[83] @ 2656
	.word	0c0108b7ah		; a[84] @ 2688
	.word	040218766h		; a[85] @ 2720
	.word	0c0348230h		; a[86] @ 2752
	.word	04049b7e1h		; a[87] @ 2784
	.word	0c0616b90h		; a[88] @ 2816
	.word	0407be836h		; a[89] @ 2848
	.word	0c08cc0c8h		; a[90] @ 2880
	.word	0409d4aa1h		; a[91] @ 2912
	.word	0c0afc5f8h		; a[92] @ 2944
	.word	040c46d39h		; a[93] @ 2976
	.word	0c0db81bdh		; a[94] @ 3008
	.word	040f54c81h		; a[95] @ 3040
	.word	0c1090f8ch		; a[96] @ 3072
	.word	041192a55h		; a[97] @ 3104
	.word	0c12b2989h		; a[98] @ 3136
	.word	0413f4620h		; a[99] @ 3168
	.word	0c155bf9ch		; a[100] @ 3200
	.word	0416edd2fh		; a[101] @ 3232
	.word	0c185771dh		; a[102] @ 3264
	.word	0419525bfh		; a[103] @ 3296
	.word	0c1a6ac18h		; a[104] @ 3328
	.word	041ba4199h		; a[105] @ 3360
	.word	0c1d02430h		; a[106] @ 3392
	.word	041e89911h		; a[107] @ 3424
	.word	0c201f6d1h		; a[108] @ 3456
	.word	042113c21h		; a[109] @ 3488
	.word	0c2224ccdh		; a[110] @ 3520
	.word	042355ec8h		; a[111] @ 3552
	.word	0c24aae66h		; a[112] @ 3584
	.word	042627f0ch		; a[113] @ 3616
	.word	0c27d1c0fh		; a[114] @ 3648
	.word	0428d6ccbh		; a[115] @ 3680
	.word	0c29e0adch		; a[116] @ 3712
	.word	042b09cc8h		; a[117] @ 3744
	.word	0c2c55d47h		; a[118] @ 3776
	.word	042dc8dfah		; a[119] @ 3808
	.word	0c2f67845h		; a[120] @ 3840
	.word	04309b70ah		; a[121] @ 3872
	.word	0c319e581h		; a[122] @ 3904
	.word	0432bfabah		; a[123] @ 3936
	.word	0c3402fdfh		; a[124] @ 3968
	.word	04356c4d7h		; a[125] @ 4000
	.word	0c370011ah		; a[126] @ 4032
	.word	043861a37h		; a[127] @ 4064
	.word	0c395dc02h		; a[128] @ 4096
	.word	043a777c8h		; a[129] @ 4128
	.word	0c3bb2539h		; a[130] @ 4160
	.word	043d1228fh		; a[131] @ 4192
	.word	0c3e9b556h		; a[132] @ 4224
	.word	0440295a3h		; a[133] @ 4256
	.word	0c411ed9fh		; a[134] @ 4288
	.word	044231324h		; a[135] @ 4320
	.word	0c4363c6fh		; a[136] @ 4352
	.word	0444ba618h		; a[137] @ 4384
	.word	0c46393d9h		; a[138] @ 4416
	.word	0447e5168h		; a[139] @ 4448
	.word	0c48e19a2h		; a[140] @ 4480
	.word	0449ecc00h		; a[141] @ 4512
	.word	0c4b1749ch		; a[142] @ 4544
	.word	044c64e77h		; a[143] @ 4576
	.word	0c4dd9b8dh		; a[144] @ 4608
	.word	044f7a581h		; a[145] @ 4640
	.word	0c50a5f58h		; a[146] @ 4672
	.word	0451aa19ah		; a[147] @ 4704
	.word	0c52ccce5h		; a[148] @ 4736
	.word	045411abch		; a[149] @ 4768
	.word	0c557cb50h		; a[150] @ 4800
	.word	045712666h		; a[151] @ 4832
	.word	0c586be1bh		; a[152] @ 4864
	.word	045969329h		; a[153] @ 4896
	.word	0c5a84473h		; a[154] @ 4928
	.word	045bc09eeh		; a[155] @ 4960
	.word	0c5d22223h		; a[156] @ 4992
	.word	045ead2f4h		; a[157] @ 5024
	.word	0c603353ah		; a[158] @ 5056
	.word	046129ff6h		; a[159] @ 5088
	.word	0c623da71h		; a[160] @ 5120
	.word	046371b29h		; a[161] @ 5152
	.word	0c64c9ef6h		; a[162] @ 5184
	.word	04664a9f6h		; a[163] @ 5216
	.word	0c67f8833h		; a[164] @ 5248
	.word	0468ec74dh		; a[165] @ 5280
	.word	0c69f8e14h		; a[166] @ 5312
	.word	046b24d7bh		; a[167] @ 5344
	.word	0c6c740d2h		; a[168] @ 5376
	.word	046deaa5ch		; a[169] @ 5408
	.word	0c6f8d424h		; a[170] @ 5440
	.word	0470b0873h		; a[171] @ 5472
	.word	0c71b5e92h		; a[172] @ 5504
	.word	0472da014h		; a[173] @ 5536
	.word	0c74206bbh		; a[174] @ 5568
	.word	04758d30ah		; a[175] @ 5600
	.word	0c7724d1fh		; a[176] @ 5632
	.word	0478762c5h		; a[177] @ 5664
	.word	0c7974b2dh		; a[178] @ 5696
	.word	047a91216h		; a[179] @ 5728

;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\022205 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\022207 
;**	Parameter deleted: req_flags == 1;
;**	Parameter deleted: tol == 0.0001;
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
||         MVKL    .S2     0xeb1c432d,B6

           STDW    .D2T1   A13:A12,*SP--     ; |63| 
||         MVKL    .S1     output,A11
||         MVKL    .S2     0x3f1a36e2,B7

           STW     .D2T1   A10,*SP--(8)      ; |63| 
||         MVKH    .S1     output,A11
||         MVKH    .S2     0xeb1c432d,B6

           LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MV      .L1     A4,A6             ; |63| 
||         MVKH    .S2     0x3f1a36e2,B7
||         MVK     .S1     0x1,A8            ; |66| 

           MV      .L1X    B3,A13            ; |63| 
||         CALLP   .S2     isequal,B3
||         MV      .S1     A4,A10            ; |63| 
||         LDW     .D1T1   *A11,A4           ; |66| 

$C$RL0:    ; CALL OCCURS {isequal} {0}       ; |66| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6

           LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKL    .S1     fcn_pass,A12
||         MVKH    .S2     0x3f1a36e2,B7

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S1     fcn_pass,A12
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A12(4)       ; |66| 
||         MV      .L1     A10,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL1:    ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0xeb1c432d,B6
           MVKL    .S2     0x3f1a36e2,B7

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVKH    .S2     0x3f1a36e2,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A3,*+A12(8)       ; |67| 
||         MV      .L1     A10,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL2:    ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6

           STW     .D1T1   A4,*+A12(12)      ; |68| 
||         MVKH    .S2     0x3f1a36e2,B7

           MV      .L1     A11,A3            ; |66| 
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVKH    .S2     0xeb1c432d,B6

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
;*   Local Frame Size  : 8 Args + 4 Auto + 56 Save = 68 byte                  *
;******************************************************************************
main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           STW     .D2T1   A11,*SP--(8)      ; |121| 
           STW     .D2T1   A10,*SP--(8)      ; |121| 
           STDW    .D2T2   B13:B12,*SP--     ; |121| 
           STDW    .D2T2   B11:B10,*SP--     ; |121| 
           STDW    .D2T1   A15:A14,*SP--     ; |121| 

           STDW    .D2T1   A13:A12,*SP--     ; |121| 
||         MVKL    .S1     $C$SL1+0,A4

           STW     .D2T2   B3,*SP--(24)      ; |121| 
||         CALLP   .S2     driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL4:    ; CALL OCCURS {driver_init} {0}   ; |129| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xb4,B4
||         MVKL    .S1     a,A12

           MVKH    .S1     a,A12
||         MVKL    .S2     output,B11

           CALL    .S1     tanf              ; |138| 
||         MV      .L1     A12,A13
||         MV      .D1X    B4,A10
||         MVKH    .S2     output,B11
||         ZERO    .L2     B10

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A13++,A4         ; |138| 
           ADDKPC  .S2     $C$RL5,B3,3       ; |138| 
$C$RL5:    ; CALL OCCURS {tanf} {0}          ; |138| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |138| 
||         SUB     .L1     A10,1,A0          ; |137| 
||         SUB     .S1     A10,1,A10         ; |137| 

   [ A0]   BNOP    .S1     $C$L3,3           ; |137| 

           ADD     .L2     B10,B4,B4         ; |138| 
||         ADD     .S2     4,B10,B10         ; |137| 

   [ A0]   CALL    .S1     tanf              ; |138| 
||         STW     .D2T1   A4,*B4            ; |138| 
|| [!A0]   MVK     .S2     0xb4,B4

           ; BRANCHCC OCCURS {$C$L3}         ; |137| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A12,A11
||         ADD     .S2     4,B11,B11

           MV      .L1X    B4,A10
||         CALL    .S1     tansp             ; |141| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |141| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |141| 
$C$RL6:    ; CALL OCCURS {tansp} {0}         ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |141| 
||         SUB     .L1     A10,1,A0          ; |140| 
||         SUB     .S1     A10,1,A10         ; |140| 

   [ A0]   BNOP    .S1     $C$L4,3           ; |140| 

           ADD     .L2     B10,B4,B4         ; |141| 
||         ADD     .S2     4,B10,B10         ; |140| 

   [ A0]   CALL    .S1     tansp             ; |141| 
||         STW     .D2T1   A4,*B4            ; |141| 
|| [!A0]   MVK     .S2     0xb4,B4

           ; BRANCHCC OCCURS {$C$L4}         ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 2

           ZERO    .L2     B10
||         MV      .L1     A11,A12
||         ADD     .S2     4,B11,B11

           MV      .L1X    B4,A10
||         CALL    .S1     tansp_c           ; |144| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |144| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |144| 
$C$RL7:    ; CALL OCCURS {tansp_c} {0}       ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |144| 
||         SUB     .L1     A10,1,A0          ; |143| 
||         SUB     .S1     A10,1,A10         ; |143| 

   [ A0]   B       .S2     $C$L5             ; |143| 
|| [!A0]   MVKL    .S1     0x3b95fb56,A15
|| [!A0]   ADD     .L2     4,B11,B18

   [!A0]   MVKL    .S1     0x3eaaa63c,A13
   [!A0]   MVKL    .S1     0x3e08fa17,A12
   [!A0]   MVKL    .S1     0x3ea2f983,A3

           ADD     .L2     B10,B4,B4         ; |144| 
||         ADD     .S2     4,B10,B10         ; |143| 

   [ A0]   CALL    .S1     tansp_c           ; |144| 
||         STW     .D2T1   A4,*B4            ; |144| 

           ; BRANCHCC OCCURS {$C$L5}         ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

           MVKH    .S1     0x3ea2f983,A3
||         MVK     .S2     0xb4,B2
||         MV      .L1     A11,A8
||         ZERO    .D1     A29
||         LDW     .D2T1   *B18,A7

           MVKH    .S1     0x3e08fa17,A12
           MVKH    .S1     0x3eaaa63c,A13
           MVKH    .S1     0x3b95fb56,A15
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 77
           LDW     .D1T1   *A8++,A6          ; |162| 
           MVKL    .S1     0x3ea2f983,A4
           MVKH    .S1     0x3ea2f983,A4
           ZERO    .L1     A31
           MVKH    .S1     0x40490000,A31
           MPYSP   .M1     A4,A6,A4          ; |162| 
           MVKL    .S2     0x3a7daa21,B4
           MVKH    .S2     0x3a7daa21,B4
           MVKL    .S1     0x2ec57500,A30
           SPINT   .L1     A4,A4             ; |162| 
           MVKH    .S1     0x2ec57500,A30
           ZERO    .L2     B6
           MVKL    .S2     0x3fc90fd8,B5
           INTSP   .L1     A4,A5             ; |162| 
           MVKH    .S2     0x3fc90fd8,B5
           MVKL    .S2     0x40490fdb,B31
           MVKH    .S2     0x40490fdb,B31
           MPYSP   .M1     A31,A5,A4         ; |162| 
           MPYSP   .M2X    B4,A5,B4          ; |162| 
           ZERO    .L2     B30               ; |167| 
           MVKL    .S2     0x3d568e40,B17
           SUBSP   .L1     A6,A4,A6          ; |162| 
           MPYSP   .M1     A30,A5,A4         ; |162| 
           MVKL    .S2     0x3cc1bb56,B9
           MVKL    .S2     0x3c0e1bf7,B8
           MVKH    .S2     0x3d568e40,B17
           SUBSP   .L2X    A6,B4,B4          ; |162| 
           MVKH    .S2     0x3cc1bb56,B9
           MVKH    .S2     0x3c0e1bf7,B8
           MVKL    .S2     0x3f490fdb,B29
           SUBSP   .L2X    B4,A4,B4          ; |162| 
           MVKH    .S2     0x3f490fdb,B29
           NOP             2
           CMPGTSP .S2     B4,B5,B0          ; |162| 
   [ B0]   SUBSP   .L2     B4,B31,B4         ; |162| 
           SET     .S2     B30,31,31,B5      ; |167| 
           NOP             2
           CMPLTSP .S2     B4,B6,B1          ; |165| 
   [ B1]   XOR     .L2     B4,B5,B4          ; |167| 
           MPYSP   .M2     B4,B4,B6          ; |121| 
           CMPGTSP .S2     B4,B29,B0         ; |171| 
   [ B0]   MVKL    .S2     0x34af7259,B31
   [ B0]   MVKH    .S2     0x34af7259,B31
           MPYSP   .M2     B6,B6,B5          ; |121| 
           MPYSP   .M2     B8,B6,B8          ; |121| 
           MPYSP   .M1X    A13,B6,A5         ; |121| 
           NOP             1
           MPYSP   .M2     B5,B6,B16         ; |121| 
           MPYSP   .M2     B5,B5,B7          ; |121| 
           MPYSP   .M1X    A15,B5,A6         ; |121| 
           MPYSP   .M1X    A12,B5,A4         ; |121| 
           MPYSP   .M2     B17,B16,B6        ; |121| 
           MPYSP   .M2     B9,B7,B9          ; |121| 
           NOP             2
           ADDSP   .L2X    A6,B8,B5          ; |121| 
           ADDSP   .L2     B6,B9,B6          ; |121| 
           ADDSP   .L1     A5,A4,A4          ; |121| 
           SET     .S1     A29,0x17,0x1d,A6
           MPYSP   .M2     B7,B5,B5          ; |121| 
           ZERO    .S1     A5
           ADDSP   .L1X    A4,B6,A4          ; |121| 
           MVKH    .S1     0xbf800000,A5
   [!B1]   MV      .L1     A6,A5             ; |151| 
           NOP             1

           ADDSP   .L1X    B5,A4,A4          ; |121| 
|| [ B0]   MVKL    .S2     0x3fc90fd8,B5

   [ B0]   MVKH    .S2     0x3fc90fd8,B5
   [ B0]   SUBSP   .L2     B5,B4,B4          ; |174| 
           NOP             1

   [!B0]   BNOP    .S1     $C$L7,1           ; |121| 
|| [!B0]   MPYSP   .M1X    B4,A4,A4          ; |121| 

   [ B0]   ADDSP   .L2     B31,B4,B7         ; |174| 
           NOP             2
   [!B0]   ADDSP   .L1X    B4,A4,A3          ; |121| 
           ; BRANCHCC OCCURS {$C$L7}         ; |121| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 67
           MVKL    .S2     0x3d568e40,B28
           MPYSP   .M2     B7,B7,B6          ; |174| 
           MVKL    .S2     0x3cc1bb56,B29
           MVKL    .S2     0x3c0e1bf7,B30
           MVKH    .S2     0x3d568e40,B28
           MPYSP   .M2     B6,B6,B5          ; |174| 
           MVKH    .S2     0x3cc1bb56,B29
           MVKH    .S2     0x3c0e1bf7,B30
           MPYSP   .M1X    A13,B6,A6         ; |174| 
           MPYSP   .M2     B5,B6,B16         ; |174| 
           MPYSP   .M2     B5,B5,B8          ; |174| 
           MPYSP   .M2     B30,B6,B17        ; |174| 
           MPYSP   .M1X    A15,B5,A3         ; |174| 
           MPYSP   .M2     B28,B16,B4        ; |174| 
           MPYSP   .M2     B29,B8,B9         ; |174| 
           MPYSP   .M1X    A12,B5,A4         ; |174| 
           ZERO    .L1     A30
           ADDSP   .L2X    A3,B17,B5         ; |174| 
           ADDSP   .L2     B4,B9,B4          ; |174| 
           ADDSP   .L1     A6,A4,A31         ; |174| 
           SET     .S1     A30,0x1e,0x1e,A6
           MPYSP   .M2     B8,B5,B5          ; |174| 
           NOP             1
           ADDSP   .L1X    A31,B4,A3         ; |174| 
           ZERO    .L2     B4
           NOP             2
           ADDSP   .L1X    B5,A3,A3          ; |174| 
           NOP             3
           MPYSP   .M1X    B7,A3,A3          ; |174| 
           NOP             3
           ADDSP   .L1X    B7,A3,A4          ; |174| 
           NOP             3
           RCPSP   .S1     A4,A3             ; |65| 
           MPYSP   .M1     A4,A3,A9          ; |65| 
           CMPEQSP .S2X    A4,B4,B0          ; |65| 
           NOP             2
           SUBSP   .L1     A6,A9,A9          ; |65| 
           NOP             3
           MPYSP   .M1     A3,A9,A3          ; |65| 
           NOP             3
           MPYSP   .M1     A4,A3,A9          ; |65| 
   [ B0]   MV      .L1X    B4,A3             ; |65| 
           NOP             2
           SUBSP   .L1     A6,A9,A6          ; |65| 
           NOP             3
   [!B0]   MPYSP   .M1     A3,A6,A3          ; |65| 
           NOP             3
           SPDP    .S1     A3,A17:A16        ; |65| 
           NOP             1
           DPSP    .L1     A17:A16,A3        ; |65| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 8
           SUB     .L2     B2,1,B2           ; |146| 
   [!B2]   ADD     .L2     4,B18,B12
   [ B2]   B       .S1     $C$L6             ; |146| 
           MPYSP   .M1     A5,A3,A4          ; |147| 
           NOP             3

   [!B2]   CALL    .S1     tansp_v           ; |149| 
||         STW     .D1T1   A4,*A7++          ; |147| 

           ; BRANCHCC OCCURS {$C$L6}         ; |146| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *B12,B4           ; |149| 
           MV      .L1     A11,A4            ; |149| 
           MVK     .S1     0xb4,A6           ; |149| 
           ADDKPC  .S2     $C$RL8,B3,1       ; |149| 
$C$RL8:    ; CALL OCCURS {tansp_v} {0}       ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     allequal,B3
||         MVK     .S1     0xb4,A4           ; |154| 

$C$RL9:    ; CALL OCCURS {allequal} {0}      ; |154| 

           CALLP   .S2     print_test_results,B3
||         MVK     .L1     0x1,A4            ; |155| 

$C$RL10:   ; CALL OCCURS {print_test_results} {0}  ; |155| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVKL    .S1     a_sc,A6
||         ZERO    .L1     A3
||         ZERO    .L2     B9

           MVKH    .S2     0xff800000,B9
||         MVKH    .S1     0xbf800000,A3
||         ZERO    .L2     B8

           MVKH    .S1     a_sc,A6
||         SET     .S2     B8,0x17,0x1e,B8
||         ZERO    .L1     A4
||         ZERO    .L2     B4

           STDW    .D1T2   B9:B8,*+A6(8)     ; |165| 
||         MV      .L1     A3,A5             ; |167| 
||         MVKH    .S2     0x80000000,B4
||         SET     .S1     A4,0x17,0x1d,A4

           STDW    .D1T1   A5:A4,*+A6(16)    ; |167| 
||         ADD     .L2     -1,B4,B16
||         MVK     .S2     -1,B17            ; |169| 

           STDW    .D1T2   B17:B16,*+A6(24)  ; |169| 
||         MV      .L2     B4,B7             ; |163| 
||         ZERO    .S2     B6

           CALL    .S2     tanf              ; |172| 
||         STDW    .D1T2   B7:B6,*A6         ; |163| 
||         SUB     .L1     A6,4,A14
||         MVK     .L2     0x8,B10
||         ZERO    .S1     A11

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
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *++A14,A4         ; |172| 
           ADDKPC  .S2     $C$RL11,B3,3      ; |172| 
$C$RL11:   ; CALL OCCURS {tanf} {0}          ; |172| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 28
           MVKL    .S1     output,A10
           MVKH    .S1     output,A10
           LDW     .D1T2   *A10,B4           ; |172| 
           NOP             4
           ADD     .L2X    A11,B4,B4         ; |172| 
           STW     .D2T1   A4,*B4            ; |172| 

           CALLP   .S2     tansp,B3
||         LDW     .D1T1   *A14,A4           ; |173| 

$C$RL12:   ; CALL OCCURS {tansp} {0}         ; |173| 
           LDW     .D1T2   *+A10(4),B4       ; |173| 
           NOP             4
           ADD     .L2X    A11,B4,B4         ; |173| 
           STW     .D2T1   A4,*B4            ; |173| 

           CALLP   .S2     tansp_c,B3
||         LDW     .D1T1   *A14,A4           ; |174| 

$C$RL13:   ; CALL OCCURS {tansp_c} {0}       ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 55
           LDW     .D1T1   *+A10(8),A3       ; |174| 
           MVKL    .S1     0x3ea2f983,A31
           MVKH    .S1     0x3ea2f983,A31
           ZERO    .L2     B29               ; |167| 
           MVKL    .S2     0x3a7daa21,B4
           ADD     .L1     A11,A3,A3         ; |174| 
           STW     .D1T1   A4,*A3            ; |174| 
           LDW     .D1T1   *A14,A5           ; |159| 
           ZERO    .L1     A30
           ZERO    .L1     A28
           MVKH    .S2     0x3a7daa21,B4
           MVKH    .S1     0x40490000,A30
           MPYSP   .M1     A31,A5,A3         ; |159| 
           MVKL    .S2     0x3fc90fd8,B31
           MVKH    .S2     0x3fc90fd8,B31
           MVKL    .S1     0x2ec57500,A29
           SPINT   .L1     A3,A3             ; |159| 
           MVKL    .S2     0x40490fdb,B30
           MVKH    .S1     0x2ec57500,A29
           MVKH    .S2     0x40490fdb,B30
           INTSP   .L1     A3,A4             ; |159| 
           SET     .S2     B29,31,31,B6      ; |167| 
           MVKL    .S2     0x3f490fdb,B28
           MVKH    .S2     0x3f490fdb,B28
           MPYSP   .M1     A30,A4,A3         ; |159| 
           MPYSP   .M2X    B4,A4,B4          ; |159| 
           NOP             2
           SUBSP   .L1     A5,A3,A5          ; |159| 
           MPYSP   .M1     A29,A4,A3         ; |159| 
           SET     .S1     A28,0x17,0x1d,A4
           NOP             2
           SUBSP   .L2X    A5,B4,B4          ; |159| 
           NOP             3
           SUBSP   .L2X    B4,A3,B5          ; |159| 
           ZERO    .L1     A3
           MVKL    .S2     0x3fc90fd8,B4
           MVKH    .S1     0xbf800000,A3
           CMPGTSP .S2     B5,B31,B0         ; |161| 
   [ B0]   SUBSP   .L2     B5,B30,B5         ; |162| 
           MVKH    .S2     0x3fc90fd8,B4
           NOP             2
           CMPLTSP .S2     B5,B29,B0         ; |165| 
   [ B0]   XOR     .L2     B5,B6,B5          ; |167| 

           CMPGTSP .S2     B5,B28,B1         ; |171| 
||         SUBSP   .L2     B4,B5,B4          ; |172| 

   [!B1]   BNOP    .S1     $C$L9,1           ; |171| 
|| [!B1]   MPYSP   .M2     B5,B5,B7          ; |121| 
|| [ B1]   MVKL    .S2     0x34af7259,B31

   [ B1]   MVKH    .S2     0x34af7259,B31
           ADDSP   .L2     B31,B4,B16        ; |172| 
   [!B1]   MPYSP   .M2     B7,B7,B6          ; |121| 
   [!B0]   MV      .L1     A4,A3             ; |151| 
           ; BRANCHCC OCCURS {$C$L9}         ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 68
           MVKL    .S2     0x3c0e1bf7,B30
           MPYSP   .M2     B16,B16,B6        ; |174| 
           MVKL    .S2     0x3cc1bb56,B29
           MVKL    .S2     0x3d568e40,B28
           MVKH    .S2     0x3c0e1bf7,B30
           MPYSP   .M2     B6,B6,B5          ; |174| 
           MVKH    .S2     0x3cc1bb56,B29
           MVKH    .S2     0x3d568e40,B28
           MPYSP   .M1X    A13,B6,A5         ; |174| 
           MPYSP   .M2     B5,B6,B8          ; |174| 
           MPYSP   .M2     B5,B5,B7          ; |174| 
           MPYSP   .M2     B30,B6,B17        ; |174| 
           MPYSP   .M1X    A15,B5,A6         ; |174| 
           MPYSP   .M2     B28,B8,B4         ; |174| 
           MPYSP   .M2     B29,B7,B9         ; |174| 
           MPYSP   .M1X    A12,B5,A4         ; |174| 
           ZERO    .L1     A31
           ADDSP   .L2X    A6,B17,B5         ; |174| 
           ADDSP   .L2     B4,B9,B4          ; |174| 
           ADDSP   .L1     A5,A4,A4          ; |174| 
           SET     .S1     A31,0x1e,0x1e,A6
           MPYSP   .M2     B7,B5,B5          ; |174| 
           NOP             1
           ADDSP   .L1X    A4,B4,A4          ; |174| 
           ZERO    .L2     B4
           NOP             2
           ADDSP   .L1X    B5,A4,A4          ; |174| 
           NOP             3
           MPYSP   .M1X    B16,A4,A4         ; |174| 
           NOP             3
           ADDSP   .L1X    B16,A4,A4         ; |174| 
           NOP             3
           RCPSP   .S1     A4,A5             ; |65| 
           MPYSP   .M1     A4,A5,A7          ; |65| 
           CMPEQSP .S2X    A4,B4,B0          ; |67| 
           NOP             2
           SUBSP   .L1     A6,A7,A7          ; |65| 
           NOP             3
           MPYSP   .M1     A5,A7,A5          ; |65| 
           NOP             3
           MPYSP   .M1     A4,A5,A7          ; |65| 
           NOP             3
           SUBSP   .L1     A6,A7,A6          ; |65| 
           NOP             3
           MPYSP   .M1     A5,A6,A5          ; |65| 
           NOP             1
           BNOP    .S1     $C$L10,1          ; |71| 
   [ B0]   MV      .L1X    B4,A5             ; |67| 
           SPDP    .S1     A5,A5:A4          ; |71| 
           NOP             1
           DPSP    .L1     A5:A4,A4          ; |71| 
           ; BRANCH OCCURS {$C$L10}          ; |71| 
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 29

           MVKL    .S2     0x3d568e40,B30
||         MPYSP   .M1X    A13,B7,A6         ; |121| 

           MVKL    .S2     0x3c0e1bf7,B4

           MPYSP   .M2     B6,B7,B16         ; |121| 
||         MVKL    .S2     0x3cc1bb56,B31
||         MPYSP   .M1X    A15,B6,A4         ; |121| 

           MPYSP   .M2     B6,B6,B8          ; |121| 
||         MVKH    .S2     0x3d568e40,B30

           MVKH    .S2     0x3c0e1bf7,B4

           MVKH    .S2     0x3cc1bb56,B31
||         MPYSP   .M2     B4,B7,B9          ; |121| 

           MPYSP   .M2     B30,B16,B4        ; |121| 
           MPYSP   .M2     B31,B8,B17        ; |121| 
           MPYSP   .M1X    A12,B6,A5         ; |121| 
           ADDSP   .L2X    A4,B9,B6          ; |121| 
           NOP             1
           ADDSP   .L2     B4,B17,B4         ; |121| 
           ADDSP   .L1     A6,A5,A31         ; |121| 
           MPYSP   .M2     B8,B6,B6          ; |121| 
           NOP             2
           ADDSP   .L1X    A31,B4,A4         ; |121| 
           NOP             3
           ADDSP   .L1X    B6,A4,A4          ; |121| 
           NOP             3
           MPYSP   .M1X    B5,A4,A4          ; |121| 
           NOP             3
           ADDSP   .L1X    B5,A4,A4          ; |121| 
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 8

           ADDAW   .D1     A10,3,A5
||         SUB     .L1X    B10,1,A0          ; |171| 

           LDW     .D1T1   *A5,A5            ; |175| 
   [ A0]   B       .S1     $C$L8             ; |171| 
           MPYSP   .M1     A3,A4,A4          ; |175| 
           SUB     .L2     B10,1,B10         ; |171| 
           NOP             1

           ADD     .L1     A11,A5,A3         ; |175| 
||         ADD     .S1     4,A11,A11         ; |171| 

   [ A0]   CALL    .S1     tanf              ; |172| 
||         STW     .D1T1   A4,*A3            ; |175| 

           ; BRANCHCC OCCURS {$C$L8}         ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     tansp_v           ; |177| 
           LDW     .D2T2   *B12,B4           ; |177| 
           MVKL    .S1     a_sc,A4
           MVKH    .S1     a_sc,A4
           ADDKPC  .S2     $C$RL14,B3,0      ; |177| 
           MVK     .L1     0x8,A6            ; |177| 
$C$RL14:   ; CALL OCCURS {tansp_v} {0}       ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     allequal,B3
||         MVK     .L1     0x8,A4            ; |180| 

$C$RL15:   ; CALL OCCURS {allequal} {0}      ; |180| 

           CALLP   .S2     print_test_results,B3
||         MVK     .L1     0x3,A4            ; |181| 

$C$RL16:   ; CALL OCCURS {print_test_results} {0}  ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
           MVKL    .S2     a_ext,B13

           MVKH    .S2     a_ext,B13
||         ZERO    .L1     A3

           SET     .S1     A3,0x17,0x17,A3

           CALL    .S1     tanf              ; |186| 
||         STW     .D2T1   A3,*B13           ; |184| 
||         MV      .L1X    B13,A11           ; |184| 
||         MV      .D1     A10,A14           ; |186| 
||         MVK     .S2     0x81,B10
||         ZERO    .L2     B11

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
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A11,A4           ; |186| 
           ADDKPC  .S2     $C$RL17,B3,3      ; |186| 
$C$RL17:   ; CALL OCCURS {tanf} {0}          ; |186| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D1T1   *A14,A3           ; |186| 
           NOP             4
           ADD     .L1X    B11,A3,A3         ; |186| 
           STW     .D1T1   A4,*A3            ; |186| 

           CALLP   .S2     tansp,B3
||         LDW     .D1T1   *A11,A4           ; |187| 

$C$RL18:   ; CALL OCCURS {tansp} {0}         ; |187| 
           LDW     .D1T1   *+A14(4),A3       ; |187| 
           NOP             4
           ADD     .L1X    B11,A3,A3         ; |187| 
           STW     .D1T1   A4,*A3            ; |187| 

           CALLP   .S2     tansp_c,B3
||         LDW     .D1T1   *A11,A4           ; |188| 

$C$RL19:   ; CALL OCCURS {tansp_c} {0}       ; |188| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 55
           LDW     .D1T1   *+A14(8),A3       ; |188| 
           MVKL    .S1     0x3ea2f983,A31
           MVKH    .S1     0x3ea2f983,A31
           ZERO    .L2     B28               ; |167| 
           MVKL    .S2     0x3a7daa21,B31
           ADD     .L2X    B11,A3,B4         ; |188| 
           STW     .D2T1   A4,*B4            ; |188| 
           LDW     .D1T1   *A11,A5           ; |159| 
           ZERO    .L1     A30
           ZERO    .L1     A28
           MVKH    .S1     0x40490000,A30
           MVKH    .S2     0x3a7daa21,B31
           MPYSP   .M1     A31,A5,A3         ; |159| 
           MVKL    .S2     0x3fc90fd8,B30
           MVKH    .S2     0x3fc90fd8,B30
           MVKL    .S1     0x2ec57500,A29
           SPINT   .L1     A3,A3             ; |159| 
           MVKH    .S1     0x2ec57500,A29
           MVKL    .S2     0x40490fdb,B29
           MVKH    .S2     0x40490fdb,B29
           INTSP   .L1     A3,A4             ; |159| 
           SET     .S2     B28,31,31,B5      ; |167| 
           MVKL    .S2     0x3f490fdb,B27
           MVKH    .S2     0x3f490fdb,B27
           MPYSP   .M1     A30,A4,A3         ; |159| 
           MPYSP   .M2X    B31,A4,B4         ; |159| 
           NOP             2
           SUBSP   .L1     A5,A3,A5          ; |159| 
           MPYSP   .M1     A29,A4,A3         ; |159| 
           NOP             3
           SUBSP   .L2X    A5,B4,B4          ; |159| 
           NOP             3
           SUBSP   .L2X    B4,A3,B8          ; |159| 
           ZERO    .L1     A3
           MVKL    .S2     0x3fc90fd8,B4
           MVKH    .S1     0xbf800000,A3
           CMPGTSP .S2     B8,B30,B0         ; |161| 
   [ B0]   SUBSP   .L2     B8,B29,B8         ; |162| 
           MVKH    .S2     0x3fc90fd8,B4
           NOP             2
           CMPLTSP .S2     B8,B28,B0         ; |165| 

   [ B0]   XOR     .L2     B8,B5,B8          ; |167| 
|| [ B0]   MV      .S2X    A3,B9             ; |166| 
||         SET     .S1     A28,0x17,0x1d,A3

           CMPGTSP .S2     B8,B27,B1         ; |171| 
||         SUBSP   .L2     B4,B8,B4          ; |172| 

   [!B1]   BNOP    .S1     $C$L12,1          ; |171| 
|| [!B1]   MPYSP   .M2     B8,B8,B5          ; |121| 
|| [ B1]   MVKL    .S2     0x34af7259,B5

   [ B1]   MVKH    .S2     0x34af7259,B5
   [ B1]   ADDSP   .L2     B5,B4,B8          ; |172| 
   [!B1]   MPYSP   .M2     B5,B5,B6          ; |121| 
   [!B0]   MV      .L2X    A3,B9             ; |151| 
           ; BRANCHCC OCCURS {$C$L12}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 69
           MVKL    .S2     0x3c0e1bf7,B31
           MPYSP   .M2     B8,B8,B6          ; |174| 
           MVKL    .S2     0x3cc1bb56,B30
           MVKL    .S2     0x3d568e40,B29
           MVKH    .S2     0x3c0e1bf7,B31
           MPYSP   .M2     B6,B6,B5          ; |174| 
           MVKH    .S2     0x3cc1bb56,B30
           MVKH    .S2     0x3d568e40,B29
           MPYSP   .M1X    A13,B6,A4         ; |174| 
           MPYSP   .M2     B5,B6,B18         ; |174| 
           MPYSP   .M2     B5,B5,B7          ; |174| 
           MPYSP   .M2     B31,B6,B16        ; |174| 
           MPYSP   .M1X    A15,B5,A5         ; |174| 
           MPYSP   .M2     B29,B18,B4        ; |174| 
           MPYSP   .M2     B30,B7,B17        ; |174| 
           MPYSP   .M1X    A12,B5,A3         ; |174| 
           ZERO    .L1     A31
           ADDSP   .L2X    A5,B16,B5         ; |174| 
           ADDSP   .L2     B4,B17,B4         ; |174| 
           ADDSP   .L1     A4,A3,A3          ; |174| 
           SET     .S1     A31,0x1e,0x1e,A5
           MPYSP   .M2     B7,B5,B5          ; |174| 
           SUB     .S1X    B10,1,A0          ; |185| 
           ADDSP   .L1X    A3,B4,A3          ; |174| 
           SUB     .L2     B10,1,B10         ; |185| 
           ZERO    .L2     B4
           NOP             1
           ADDSP   .L1X    B5,A3,A3          ; |174| 
           NOP             3
           MPYSP   .M1X    B8,A3,A3          ; |174| 
           NOP             3
           ADDSP   .L1X    B8,A3,A3          ; |174| 
           NOP             3
           RCPSP   .S1     A3,A4             ; |65| 
           MPYSP   .M1     A3,A4,A6          ; |65| 
           CMPEQSP .S2X    A3,B4,B0          ; |67| 
           NOP             2
           SUBSP   .L1     A5,A6,A6          ; |65| 
           NOP             3
           MPYSP   .M1     A4,A6,A4          ; |65| 
           NOP             3
           MPYSP   .M1     A3,A4,A6          ; |65| 
           NOP             3
           SUBSP   .L1     A5,A6,A5          ; |65| 
           NOP             3
           MPYSP   .M1     A4,A5,A4          ; |65| 
           MVKL    .S1     0xc000cccc,A5
           MVKH    .S1     0xc000cccc,A5
           B       .S1     $C$L13            ; |71| 
   [ B0]   MV      .L1X    B4,A4             ; |67| 
           NOP             1

           SPDP    .S2X    A4,B5:B4          ; |71| 
||         MVKL    .S1     0xcccccccd,A4

           MVKH    .S1     0xcccccccd,A4

           DPSP    .L2     B5:B4,B4          ; |71| 
||         MVK     .S2     12,B5

           ; BRANCH OCCURS {$C$L13}          ; |71| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 30

           MVKL    .S2     0x3cc1bb56,B4
||         MPYSP   .M1X    A13,B5,A4         ; |121| 

           MVKL    .S2     0x3d568e40,B31

           MPYSP   .M2     B6,B5,B17         ; |121| 
||         MVKH    .S2     0x3cc1bb56,B4
||         MPYSP   .M1X    A15,B6,A5         ; |121| 

           MPYSP   .M1X    A12,B6,A3         ; |121| 
||         MPYSP   .M2     B6,B6,B7          ; |121| 

           MVKH    .S2     0x3d568e40,B31
           MVKL    .S2     0x3c0e1bf7,B30
           MPYSP   .M2     B31,B17,B17       ; |121| 
           MPYSP   .M2     B4,B7,B16         ; |121| 
           MVKH    .S2     0x3c0e1bf7,B30
           MPYSP   .M2     B30,B5,B4         ; |121| 
           ADDSP   .L1     A4,A3,A3          ; |121| 
           ADDSP   .L2     B17,B16,B5        ; |121| 
           SUB     .L1X    B10,1,A0          ; |185| 
           ADDSP   .L2X    A5,B4,B4          ; |121| 
           SUB     .S2     B10,1,B10         ; |185| 
           MVKL    .S1     0xcccccccd,A4
           ADDSP   .L1X    A3,B5,A3          ; |121| 
           MPYSP   .M2     B7,B4,B4          ; |121| 
           MVKH    .S1     0xcccccccd,A4
           MVKL    .S1     0xc000cccc,A5
           MVKH    .S1     0xc000cccc,A5
           ADDSP   .L2X    B4,A3,B4          ; |121| 
           MVK     .S2     12,B5
           NOP             2
           MPYSP   .M2     B8,B4,B4          ; |121| 
           NOP             3
           ADDSP   .L2     B8,B4,B4          ; |121| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 25
           ADD     .L2X    A10,B5,B5
           LDW     .D2T2   *B5,B5            ; |189| 
           NOP             1
           MPYSP   .M2     B9,B4,B4          ; |189| 
           NOP             2
           ADD     .L2     B11,B5,B5         ; |189| 
           STW     .D2T2   B4,*B5            ; |189| 
           LDW     .D1T1   *A11,A3           ; |190| 
           ADD     .L2     4,B11,B11         ; |185| 
           NOP             3
           MPYSPDP .M1     A3,A5:A4,A5:A4    ; |190| 
           NOP             5
   [ A0]   B       .S1     $C$L11            ; |185| 
           DPSP    .L1     A5:A4,A3          ; |190| 
           NOP             3

   [ A0]   CALL    .S1     tanf              ; |186| 
||         STW     .D1T1   A3,*++A11         ; |190| 

           ; BRANCHCC OCCURS {$C$L11}        ; |185| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     tansp_v           ; |192| 
||         MV      .L2X    A10,B10           ; |192| 

           LDW     .D2T2   *+B10(16),B4      ; |192| 
           ADDKPC  .S2     $C$RL20,B3,2      ; |192| 

           MV      .L1X    B13,A4
||         MVK     .S1     0x81,A6           ; |192| 

$C$RL20:   ; CALL OCCURS {tansp_v} {0}       ; |192| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 40
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f1a36e2,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0x81,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL21:   ; CALL OCCURS {isequal} {0}       ; |66| 

           MVKL    .S1     fcn_pass,A11
||         MVKL    .S2     0xeb1c432d,B6

           MVKH    .S1     fcn_pass,A11
||         MVKL    .S2     0x3f1a36e2,B7

           MV      .L1     A11,A3            ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           STW     .D1T1   A4,*+A3(4)        ; |66| 
||         LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3f1a36e2,B7

           CALLP   .S2     isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0x81,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL22:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6

           MV      .L1     A11,A3            ; |67| 
||         MVKH    .S2     0x3f1a36e2,B7

           STW     .D1T1   A4,*+A3(8)        ; |67| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0x81,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL23:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6

           MV      .L1     A11,A3            ; |68| 
||         MVKH    .S2     0x3f1a36e2,B7

           STW     .D1T1   A4,*+A3(12)       ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |69| 
||         LDW     .D2T2   *B12,B4           ; |69| 
||         MVK     .S1     0x81,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL24:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADD     .L2X    4,A11,B11
           LDW     .D2T2   *B11,B0           ; |72| 
           MV      .L1     A11,A3            ; |72| 
           ADD     .L2X    8,A11,B10
           STW     .D1T1   A4,*+A3(16)       ; |69| 
           NOP             1

   [!B0]   B       .S2     $C$L14            ; |72| 
|| [!B0]   MVKL    .S1     all_pass,A3
|| [!B0]   ZERO    .L1     A4                ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite

   [!B0]   CALL    .S2     print_test_results ; |196| 
|| [!B0]   MVKH    .S1     all_pass,A3
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L14}        ; |72| 
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
           CALL    .S1     print_test_results ; |196| 
           MVKL    .S1     all_pass,A3
           MVKH    .S1     all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x4,A4            ; |196| 
||         ADDKPC  .S2     $C$RL25,B3,0      ; |196| 

$C$RL25:   ; CALL OCCURS {print_test_results} {0}  ; |196| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
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
           MVKL    .S1     t_offset,A4

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVK     .S1     0x80,A3

           CALL    .S1     gimme_random      ; |206| 
||         EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     t_offset,A4

           MVKL    .S1     0x41490fda,A4
||         STDW    .D1T2   B5:B4,*A4         ; |117| 

           MVKH    .S1     0x41490fda,A4
||         MVKL    .S2     0xc0c90fda,B4
||         STW     .D2T1   A3,*+SP(12)       ; |117| 
||         MV      .L2X    A11,B13           ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 2
           MVKH    .S2     0xc0c90fda,B4
           ADDKPC  .S2     $C$RL26,B3,0      ; |206| 
$C$RL26:   ; CALL OCCURS {gimme_random} {0}  ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 56
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |206| 
           NOP             4
           ADD     .L1X    B13,A3,A3         ; |206| 

           STW     .D1T1   A4,*A3            ; |206| 
||         MVC     .S2     TSCL,B4           ; |122| 

           NOP             1

           MV      .L1X    B4,A6             ; |122| Define a twin register
||         MVC     .S2     TSCH,B6           ; |122| 

           MVKL    .S1     0x3ea2f983,A3
           MVKH    .S1     0x3ea2f983,A3
           MPYSP   .M1     A3,A4,A3          ; |159| 
           ZERO    .L1     A29
           MV      .L2X    A11,B29           ; |162| 
           MVKL    .S2     0x3a7daa21,B4
           SPINT   .L1     A3,A3             ; |159| 
           ZERO    .L1     A31
           MV      .L1X    B6,A7             ; |122| 
           MVKH    .S1     0x40490000,A31
           INTSP   .L1     A3,A5             ; |159| 
           MVKH    .S2     0x3a7daa21,B4
           MVKL    .S2     0x3fc90fd8,B31
           MVKH    .S2     0x3fc90fd8,B31
           MPYSP   .M1     A31,A5,A3         ; |159| 
           MPYSP   .M2X    B4,A5,B4          ; |159| 
           MVKL    .S1     0x2ec57500,A30
           MVKH    .S1     0x2ec57500,A30
           SUBSP   .L1     A4,A3,A4          ; |159| 
           MPYSP   .M1     A30,A5,A3         ; |159| 
           MVKL    .S2     0x40490fdb,B30
           MVKH    .S2     0x40490fdb,B30
           SET     .S2     B29,31,31,B7      ; |167| 
           SUBSP   .L2X    A4,B4,B4          ; |159| 
           MVKL    .S2     0x3f490fdb,B28
           MVKH    .S2     0x3f490fdb,B28
           NOP             1
           SUBSP   .L2X    B4,A3,B5          ; |159| 
           ZERO    .L1     A3
           MVKL    .S2     0x3fc90fd8,B4
           MVKH    .S1     0xbf800000,A3
           CMPGTSP .S2     B5,B31,B0         ; |161| 
   [ B0]   SUBSP   .L2     B5,B30,B5         ; |162| 
           MVKH    .S2     0x3fc90fd8,B4
           NOP             2
           CMPLTSP .S2     B5,B29,B0         ; |165| 

   [ B0]   XOR     .L2     B5,B7,B5          ; |167| 
|| [ B0]   MV      .S2X    A3,B9             ; |166| 
||         SET     .S1     A29,0x17,0x1d,A3

           CMPGTSP .S2     B5,B28,B1         ; |171| 
||         SUBSP   .L2     B4,B5,B4          ; |172| 

   [!B1]   BNOP    .S1     $C$L16,1          ; |171| 
|| [ B1]   MVKL    .S2     0x34af7259,B31

   [ B1]   MVKH    .S2     0x34af7259,B31
           ADDSP   .L2     B31,B4,B6         ; |172| 
   [!B1]   MPYSP   .M2     B5,B5,B6          ; |121| 
   [!B0]   MV      .L2X    A3,B9             ; |151| 
           ; BRANCHCC OCCURS {$C$L16}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 69
           MVKL    .S2     0x3d568e40,B28
           MPYSP   .M2     B6,B6,B8          ; |174| 
           MVKL    .S2     0x3cc1bb56,B29
           MVKL    .S2     0x3c0e1bf7,B30
           MVKH    .S2     0x3d568e40,B28
           MPYSP   .M2     B8,B8,B5          ; |174| 
           MVKH    .S2     0x3cc1bb56,B29
           MVKH    .S2     0x3c0e1bf7,B30
           MPYSP   .M1X    A13,B8,A3         ; |174| 
           MPYSP   .M2     B5,B8,B17         ; |174| 
           MPYSP   .M2     B5,B5,B7          ; |174| 
           MPYSP   .M2     B30,B8,B18        ; |174| 
           MPYSP   .M1X    A15,B5,A5         ; |174| 
           MPYSP   .M2     B28,B17,B4        ; |174| 
           MPYSP   .M2     B29,B7,B16        ; |174| 
           MPYSP   .M1X    A12,B5,A4         ; |174| 
           ZERO    .L1     A31
           ADDSP   .L2X    A5,B18,B5         ; |174| 
           ADDSP   .L2     B4,B16,B4         ; |174| 
           ADDSP   .L1     A3,A4,A3          ; |174| 
           SET     .S1     A31,0x1e,0x1e,A5
           MPYSP   .M2     B7,B5,B5          ; |174| 
           MV      .L2X    A10,B27           ; |65| 
           ADDSP   .L1X    A3,B4,A3          ; |174| 
           NOP             3
           ADDSP   .L1X    B5,A3,A3          ; |174| 
           NOP             3
           MPYSP   .M1X    B6,A3,A3          ; |174| 
           NOP             3
           ADDSP   .L1X    B6,A3,A3          ; |174| 
           NOP             3
           RCPSP   .S1     A3,A4             ; |65| 
           MPYSP   .M1     A3,A4,A8          ; |65| 
           CMPEQSP .S2X    A3,B27,B0         ; |67| 
           NOP             2
           SUBSP   .L1     A5,A8,A8          ; |65| 
           NOP             3
           MPYSP   .M1     A4,A8,A4          ; |65| 
           NOP             3
           MPYSP   .M1     A3,A4,A8          ; |65| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3
           STDW    .D1T1   A7:A6,*A3
           SUBSP   .L1     A5,A8,A5          ; |65| 
           NOP             3
           MPYSP   .M1     A4,A5,A4          ; |65| 
           NOP             2
           B       .S1     $C$L17            ; |71| 
   [ B0]   MV      .L1     A11,A4            ; |67| 
           NOP             1
           SPDP    .S2X    A4,B5:B4          ; |71| 
           NOP             1

           DPSP    .L2     B5:B4,B4          ; |71| 
||         MVKL    .S2     output+12,B5

           ; BRANCH OCCURS {$C$L17}          ; |71| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 34
           MVKL    .S2     0x3d568e40,B31
           MVKL    .S2     0x3cc1bb56,B4

           MPYSP   .M1X    A13,B6,A4         ; |121| 
||         MPYSP   .M2     B6,B6,B8          ; |121| 

           MVKH    .S2     0x3d568e40,B31
           MVKH    .S2     0x3cc1bb56,B4
           MVKL    .S2     0x3c0e1bf7,B30
           MPYSP   .M2     B8,B6,B17         ; |121| 
           MPYSP   .M2     B8,B8,B7          ; |121| 
           MVKH    .S2     0x3c0e1bf7,B30
           MPYSP   .M1X    A15,B8,A5         ; |121| 
           MPYSP   .M2     B31,B17,B17       ; |121| 
           MPYSP   .M2     B4,B7,B16         ; |121| 
           MPYSP   .M1X    A12,B8,A3         ; |121| 
           MPYSP   .M2     B30,B6,B4         ; |121| 
           NOP             1
           ADDSP   .L2     B17,B16,B6        ; |121| 
           ADDSP   .L1     A4,A3,A3          ; |121| 
           ADDSP   .L2X    A5,B4,B4          ; |121| 
           NOP             2
           ADDSP   .L1X    A3,B6,A3          ; |121| 
           MPYSP   .M2     B7,B4,B4          ; |121| 
           NOP             3
           ADDSP   .L2X    B4,A3,B4          ; |121| 
           MVKL    .S1     t_start,A3
           MVKH    .S1     t_start,A3
           STDW    .D1T1   A7:A6,*A3
           MPYSP   .M2     B5,B4,B4          ; |121| 
           NOP             3

           ADDSP   .L2     B5,B4,B4          ; |121| 
||         MVKL    .S2     output+12,B5

;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 24
           MVKH    .S2     output+12,B5
           LDW     .D2T2   *B5,B5            ; |210| 
           NOP             1
           MPYSP   .M2     B9,B4,B4          ; |210| 
           NOP             2
           ADD     .L2     B13,B5,B5         ; |210| 

           STW     .D2T2   B4,*B5            ; |210| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     t_offset,A3
||         LDW     .D2T1   *+SP(12),A30      ; |128| 
||         MVKL    .S2     cycle_counts+24,B5
||         MV      .L2     B4,B9             ; |128| 

           MVKH    .S1     t_offset,A3
||         MVKH    .S2     cycle_counts+24,B5
||         ADD     .L2     4,B13,B13         ; |204| 

           LDDW    .D1T1   *A3,A9:A8         ; |130| 
||         LDDW    .D2T2   *B5,B7:B6         ; |130| 
||         MVKL    .S1     t_stop,A31

           MV      .L1X    B5,A14            ; |130| 
||         MVKH    .S1     t_stop,A31

           STDW    .D1T2   B9:B8,*A31        ; |128| 
           SUB     .L1     A30,1,A0          ; |204| 
           STW     .D2T1   A0,*+SP(12)       ; |130| 
           ADDU    .L1     A8,A6,A5:A4       ; |130| 
           ADD     .L1     A5,A9,A5          ; |130| 

   [ A0]   B       .S1     $C$L15            ; |204| 
||         SUBU    .L2X    B8,A4,B5:B4       ; |130| 
||         ADD     .L1     A5,A7,A4          ; |130| 

           EXT     .S2     B5,24,24,B16      ; |130| 
||         ADDU    .L2     B6,B4,B5:B4       ; |130| 

   [ A0]   CALL    .S2     gimme_random      ; |206| 
||         SUB     .L2X    B9,A4,B6          ; |130| 
||         ADD     .D2     B5,B7,B5          ; |130| 
|| [ A0]   MVKL    .S1     0x41490fda,A4

           ADD     .L2     B6,B16,B6         ; |130| 
|| [ A0]   MVKH    .S1     0x41490fda,A4

           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D1T2   B5:B4,*A14        ; |130| 
|| [ A0]   MVKL    .S2     0xc0c90fda,B4

           ; BRANCHCC OCCURS {$C$L15}        ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL27,B3,3      ; |135| 
$C$RL27:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
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
$C$RL28:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           MV      .L2X    A14,B4

           MV      .L2X    A10,B31           ; |114| 
||         MVK     .S2     24,B5

           SUB     .L2X    A14,B5,B5
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           MVC     .S2     B31,TSCL          ; |115| 
||         STDW    .D2T1   A11:A10,*B5       ; |114| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B8           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B8,B4,B4          ; |117| 
||         MVKL    .S1     t_offset,A3

           ADD     .L2     B4,B5,B7          ; |117| 
||         MVKH    .S1     t_offset,A3

           STDW    .D1T2   B7:B6,*A3         ; |117| 
||         MVK     .S1     0x80,A12
||         MV      .L1     A12,A15           ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |219| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A15,A3,A3         ; |219| 
||         CALL    .S1     tanf              ; |219| 

           LDW     .D1T1   *A3,A4            ; |219| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |219| 
$C$RL29:   ; CALL OCCURS {tanf} {0}          ; |219| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output,B4
           MVKH    .S2     output,B4
           LDW     .D2T2   *B4,B4            ; |219| 
           NOP             4
           ADD     .L1X    A15,B4,A3         ; |219| 

           STW     .D1T1   A4,*A3            ; |219| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S1     t_offset,A14
||         MVKL    .S2     t_start,B4
||         SUB     .L1     A12,1,A0          ; |217| 
||         MV      .L2     B6,B17            ; |128| 
||         SUB     .D1     A12,1,A12         ; |217| 

           MVKH    .S1     t_offset,A14
||         MVKH    .S2     t_start,B4
||         ADD     .L1     4,A15,A15         ; |217| 

           LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B4,B9:B8         ; |130| 
||         MVKL    .S1     cycle_counts,A3
||         MVKL    .S2     cycle_counts,B6

           MVKH    .S1     cycle_counts,A3
||         MVKH    .S2     cycle_counts,B6

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     t_stop,A31

           MVKH    .S1     t_stop,A31
|| [!A0]   MV      .L1X    B6,A15

           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADDU    .L2X    A4,B8,B5:B4       ; |130| 

           ADD     .S2X    B5,A5,B7          ; |130| 
|| [ A0]   B       .S1     $C$L18            ; |217| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .D2     B7,B9,B7          ; |130| 
||         EXT     .S2     B5,24,24,B8       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B7,B7         ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B7,B8,B7          ; |130| 
           ADD     .L2     B5,B7,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B6         ; |130| 

           ; BRANCHCC OCCURS {$C$L18}        ; |217| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A15,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL30,B3,3      ; |135| 
$C$RL30:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A11,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL31:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A15(16) ; |114| 
||         MV      .L2X    A10,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A15        ; |135| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B6           ; |117| 
           MVC     .S2     TSCH,B9           ; |117| 
           SUBU    .L2     B6,B5,B7:B6       ; |117| 

           EXT     .S2     B7,24,24,B5       ; |117| 
||         SUB     .L2     B9,B4,B4          ; |117| 
||         MVK     .S1     0x80,A3

           ADD     .L2     B4,B5,B7          ; |117| 
||         STW     .D2T1   A3,*+SP(12)       ; |117| 
||         MV      .S2X    A14,B8            ; |117| 

           STDW    .D2T2   B7:B6,*B8         ; |117| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |228| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |228| 
||         CALL    .S1     tansp_c           ; |228| 

           LDW     .D1T1   *A3,A4            ; |228| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |228| 
$C$RL32:   ; CALL OCCURS {tansp_c} {0}       ; |228| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output+8,B4
           MVKH    .S2     output+8,B4
           LDW     .D2T2   *B4,B4            ; |228| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |228| 

           STW     .D1T1   A4,*A3            ; |228| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_start,B5
||         LDW     .D2T1   *+SP(12),A30      ; |128| 
||         ADDAD   .D1     A15,2,A3
||         MV      .L2     B4,B17            ; |128| 
||         MVKL    .S1     t_stop,A31
||         ADD     .L1     4,A12,A12         ; |226| 

           MVKH    .S2     t_start,B5
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         MVKH    .S1     t_stop,A31

           LDDW    .D2T2   *B5,B7:B6         ; |130| 
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVK     .S2     16,B13

           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADD     .L2X    A15,B13,B13
           SUB     .L1     A30,1,A0          ; |226| 

   [!A0]   MV      .L1     A15,A3
||         STW     .D2T1   A0,*+SP(12)       ; |130| 

           ADDU    .L2X    A4,B6,B9:B8       ; |130| 

           ADD     .S2X    B9,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L19            ; |226| 
||         SUBU    .L2     B16,B8,B5:B4      ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B6,B6         ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __c6xabi_fltllif  ; |135| 
||         STDW    .D2T2   B5:B4,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L19}        ; |226| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A3(16),A5:A4    ; |135| 
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

           MV      .L1     A15,A3            ; |135| 
||         STDW    .D2T1   A5:A4,*B13        ; |135| 
||         MV      .L2X    A11,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*+A3(8)   ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B5,B4,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B7,B6,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 
||         MVK     .S1     0x80,A3

           STDW    .D1T2   B5:B4,*A14        ; |117| 
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
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 15
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           MVKL    .S1     input,A3
           MVKH    .S1     input,A3
           LDW     .D1T1   *A3,A3            ; |237| 
           MVKL    .S2     t_start,B6
           MVKH    .S2     t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |237| 
||         CALL    .S1     tansp             ; |237| 

           LDW     .D1T1   *A3,A4            ; |237| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |237| 
$C$RL35:   ; CALL OCCURS {tansp} {0}         ; |237| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     output+4,B4
           MVKH    .S2     output+4,B4
           LDW     .D2T2   *B4,B4            ; |237| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |237| 

           STW     .D1T1   A4,*A3            ; |237| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     t_start,B13
||         LDW     .D2T1   *+SP(12),A31      ; |130| 
||         MVKL    .S1     cycle_counts+8,A3
||         MV      .L2     B4,B9             ; |128| 
||         ADD     .L1     4,A12,A12         ; |235| 

           MVKH    .S2     t_start,B13
||         LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         MVKH    .S1     cycle_counts+8,A3

           LDDW    .D2T2   *B13,B17:B16      ; |130| 
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     t_stop,A15

           MVKH    .S1     t_stop,A15
           STDW    .D1T2   B9:B8,*A15        ; |128| 
           SUB     .L1     A31,1,A0          ; |235| 
           STW     .D2T1   A0,*+SP(12)       ; |130| 
           ADDU    .L2X    A4,B16,B7:B6      ; |130| 

           SUBU    .L2     B8,B6,B5:B4       ; |130| 
||         ADD     .S2X    B7,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L20            ; |235| 

           ADD     .L2     B6,B17,B6         ; |130| 

           SUB     .D2     B9,B6,B5          ; |130| 
||         ADDU    .L2X    A6,B4,B7:B6       ; |130| 
||         EXT     .S2     B5,24,24,B4       ; |130| 

           ADD     .L2     B5,B4,B5          ; |130| 
||         ADD     .S2X    B7,A7,B4          ; |130| 

           ADD     .L2     B4,B5,B7          ; |130| 
||         MV      .S2X    A3,B4             ; |130| 
|| [!A0]   MVK     .S1     8,A3

           STDW    .D2T2   B7:B6,*B4         ; |130| 
           ; BRANCHCC OCCURS {$C$L20}        ; |235| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           SUB     .L1X    B4,A3,A3
||         CALL    .S1     __c6xabi_fltllif  ; |135| 

           LDDW    .D1T1   *+A3(8),A5:A4     ; |135| 
           ADDKPC  .S2     $C$RL36,B3,3      ; |135| 
$C$RL36:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 114
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
           MVKL    .S1     cycle_counts+8,A12
           MVKH    .S1     cycle_counts+8,A12
           SUBAW   .D1     A12,2,A3

           MV      .L2X    A11,B4            ; |114| 
||         STDW    .D1T1   A5:A4,*A12        ; |135| 

           STDW    .D1T1   A11:A10,*+A3(32)  ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D2T2   B7:B6,*B13        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     output,A3
           MVKH    .S1     output,A3

           MV      .L1     A3,A10            ; |117| 
||         MVKL    .S1     input,A3
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           MVKH    .S1     input,A3
||         EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 

           MV      .L2X    A3,B9             ; |244| 
||         STDW    .D1T2   B5:B4,*A14        ; |117| 

           CALLP   .S2     tansp_v,B3
||         LDW     .D2T1   *B9,A4            ; |244| 
||         LDW     .D1T2   *+A10(16),B4      ; |244| 
||         MVK     .S1     0x80,A6           ; |244| 

$C$RL38:   ; CALL OCCURS {tansp_v} {0}       ; |244| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B13,B9:B8        ; |130| 

           MVK     .S2     24,B13
           ADD     .L2X    A12,B13,B13
           LDDW    .D2T2   *B13,B7:B6        ; |130| 
           MV      .L2     B4,B17            ; |128| 
           ADDU    .L1X    A4,B8,A7:A6       ; |130| 
           ADD     .L1     A7,A5,A3          ; |130| 
           SUBU    .L1X    B16,A6,A5:A4      ; |130| 

           ADD     .L2X    A3,B9,B5          ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           ADDU    .L1X    B6,A4,A5:A4       ; |130| 
||         SUB     .L2     B17,B5,B5         ; |130| 
||         MV      .S2X    A15,B4            ; |128| 

           ADD     .L2X    B5,A3,B5          ; |130| 
           ADD     .L2X    A5,B7,B6          ; |130| 

           STDW    .D2T2   B17:B16,*B4       ; |128| 
||         ADD     .L2     B6,B5,B4          ; |130| 

           NOP             1

           CALLP   .S2     __c6xabi_fltllif,B3
||         MV      .L1X    B4,A5             ; |130| 

$C$RL39:   ; CALL OCCURS {__c6xabi_fltllif} {0}  ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A11,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __c6xabi_fixdlli,B3
$C$RL40:   ; CALL OCCURS {__c6xabi_fixdlli} {0}  ; |130| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f1a36e2,B7

           STDW    .D2T1   A5:A4,*B13        ; |130| 
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 

$C$RL41:   ; CALL OCCURS {isequal} {0}       ; |66| 
           MVKL    .S2     0xeb1c432d,B6

           MVKL    .S1     fcn_pass,A3
||         MVKL    .S2     0x3f1a36e2,B7

           LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVKH    .S1     fcn_pass,A3
||         MVKH    .S2     0xeb1c432d,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MV      .S1     A3,A11            ; |66| 
||         MVKH    .S2     0x3f1a36e2,B7

           CALLP   .S2     isequal,B3
||         STW     .D1T1   A5,*+A11(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL42:   ; CALL OCCURS {isequal} {0}       ; |67| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6

           STW     .D1T1   A4,*+A11(8)       ; |67| 
||         MVKH    .S2     0x3f1a36e2,B7

           LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL43:   ; CALL OCCURS {isequal} {0}       ; |68| 
           MVKL    .S2     0x3f1a36e2,B7
           MVKL    .S2     0xeb1c432d,B6
           MVKH    .S2     0x3f1a36e2,B7

           STW     .D1T1   A4,*+A11(12)      ; |68| 
||         MVKH    .S2     0xeb1c432d,B6

           CALLP   .S2     isequal,B3
||         LDW     .D1T1   *A10,A4           ; |69| 
||         LDW     .D2T2   *B12,B4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x1,A8            ; |69| 

$C$RL44:   ; CALL OCCURS {isequal} {0}       ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *B11,B0           ; |72| 
           STW     .D1T1   A4,*+A11(16)      ; |69| 
           NOP             3

   [!B0]   BNOP    .S1     $C$L21,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           ; BRANCHCC OCCURS {$C$L21}        ; |72| 
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
   [ A0]   B       .S1     $C$L22            ; |72| 
   [ A0]   CALL    .S1     print_test_results ; |250| 
           MVK     .L1     0x1,A3            ; |72| 
   [ A0]   MVKL    .S1     all_pass,A4
   [ A0]   MVKH    .S1     all_pass,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L22}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L21:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     print_test_results ; |250| 
           MVKL    .S1     all_pass,A4
           MVKH    .S1     all_pass,A4
           MV      .L1     A12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |250| 
||         ADDKPC  .S2     $C$RL45,B3,0      ; |250| 

$C$RL45:   ; CALL OCCURS {print_test_results} {0}  ; |250| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |251| 

$C$RL46:   ; CALL OCCURS {printf} {0}        ; |251| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |251| 

$C$RL47:   ; CALL OCCURS {printf} {0}        ; |251| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     print_profile_results,B3
||         MV      .L1     A10,A4            ; |258| 

$C$RL48:   ; CALL OCCURS {print_profile_results} {0}  ; |258| 

           CALLP   .S2     print_memory_results,B3
||         MV      .L1     A10,A4            ; |261| 

$C$RL49:   ; CALL OCCURS {print_memory_results} {0}  ; |261| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(24),B3      ; |262| 
           LDDW    .D2T1   *++SP,A13:A12     ; |262| 
           LDDW    .D2T1   *++SP,A15:A14     ; |262| 
           LDDW    .D2T2   *++SP,B11:B10     ; |262| 
           LDDW    .D2T2   *++SP,B13:B12     ; |262| 

           LDW     .D2T1   *++SP(8),A10      ; |262| 
||         RET     .S2     B3                ; |262| 

           LDW     .D2T1   *++SP(8),A11      ; |262| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |262| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"tanSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	printf
	.global	tanf
	.global	driver_init
	.global	print_profile_results
	.global	print_memory_results
	.global	print_test_results
	.global	gimme_random
	.global	isequal
	.global	tansp_c
	.global	tansp
	.global	tansp_v
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
