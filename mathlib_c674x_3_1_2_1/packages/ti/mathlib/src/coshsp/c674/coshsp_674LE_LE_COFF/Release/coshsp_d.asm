;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:41:16 2016                                *
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
	.word	03f8239c5h		; _a[0] @ 0
	.word	0340db22eh		; _a[1] @ 32
	.word	0b41cdb83h		; _a[2] @ 64
	.word	0342da428h		; _a[3] @ 96
	.word	0b4403888h		; _a[4] @ 128
	.word	03454c9d9h		; _a[5] @ 160
	.word	0b46b8e8dh		; _a[6] @ 192
	.word	034826176h		; _a[7] @ 224
	.word	0b49054d7h		; _a[8] @ 256
	.word	0349fc65eh		; _a[9] @ 288
	.word	0b4b0deefh		; _a[10] @ 320
	.word	034c3cbc8h		; _a[11] @ 352
	.word	0b4d8bf05h		; _a[12] @ 384
	.word	034eff022h		; _a[13] @ 416
	.word	0b504ce41h		; _a[14] @ 448
	.word	035130412h		; _a[15] @ 480
	.word	0b522bf21h		; _a[16] @ 512
	.word	035342915h		; _a[17] @ 544
	.word	0b547700bh		; _a[18] @ 576
	.word	0355cc709h		; _a[19] @ 608
	.word	0b5746692h		; _a[20] @ 640
	.word	035874699h		; _a[21] @ 672
	.word	0b595c00eh		; _a[22] @ 704
	.word	035a5c606h		; _a[23] @ 736
	.word	0b5b782e7h		; _a[24] @ 768
	.word	035cb25a1h		; _a[25] @ 800
	.word	0b5e0e242h		; _a[26] @ 832
	.word	035f8f245h		; _a[27] @ 864
	.word	0b609cab4h		; _a[28] @ 896
	.word	036188916h		; _a[29] @ 928
	.word	0b628db5ah		; _a[30] @ 960
	.word	0363aecach		; _a[31] @ 992
	.word	0b64eece8h		; _a[32] @ 1024
	.word	036651102h		; _a[33] @ 1056
	.word	0b67d9399h		; _a[34] @ 1088
	.word	0368c5ac9h		; _a[35] @ 1120
	.word	0b69b5f62h		; _a[36] @ 1152
	.word	036abff58h		; _a[37] @ 1184
	.word	0b6be66b3h		; _a[38] @ 1216
	.word	036d2c62ah		; _a[39] @ 1248
	.word	0b6e953b1h		; _a[40] @ 1280
	.word	03701257dh		; _a[41] @ 1312
	.word	0b70ef712h		; _a[42] @ 1344
	.word	0371e432bh		; _a[43] @ 1376
	.word	0b72f3248h		; _a[44] @ 1408
	.word	03741f143h		; _a[45] @ 1440
	.word	0b756b1c0h		; _a[46] @ 1472
	.word	0376daaa3h		; _a[47] @ 1504
	.word	0b7838c69h		; _a[48] @ 1536
	.word	037919fc7h		; _a[49] @ 1568
	.word	0b7a134bbh		; _a[50] @ 1600
	.word	037b27479h		; _a[51] @ 1632
	.word	0b7c58cb4h		; _a[52] @ 1664
	.word	037daafffh		; _a[53] @ 1696
	.word	0b7f21646h		; _a[54] @ 1728
	.word	03805fec4h		; _a[55] @ 1760
	.word	0b8145529h		; _a[56] @ 1792
	.word	038243449h		; _a[57] @ 1824
	.word	0b835c62bh		; _a[58] @ 1856
	.word	038493955h		; _a[59] @ 1888
	.word	0b85ec142h		; _a[60] @ 1920
	.word	0387696f5h		; _a[61] @ 1952
	.word	0b8887cc4h		; _a[62] @ 1984
	.word	03897176fh		; _a[63] @ 2016
	.word	0b8a74222h		; _a[64] @ 2048
	.word	038b927ach		; _a[65] @ 2080
	.word	0b8ccf770h		; _a[66] @ 2112
	.word	038e2e5e4h		; _a[67] @ 2144
	.word	0b8fb2d15h		; _a[68] @ 2176
	.word	0390b06a6h		; _a[69] @ 2208
	.word	0b919e6d6h		; _a[70] @ 2240
	.word	0392a5e82h		; _a[71] @ 2272
	.word	0b93c9942h		; _a[72] @ 2304
	.word	03950c761h		; _a[73] @ 2336
	.word	0b9671e3ch		; _a[74] @ 2368
	.word	0397fd904h		; _a[75] @ 2400
	.word	0b98d9c99h		; _a[76] @ 2432
	.word	0399cc3a0h		; _a[77] @ 2464
	.word	0b9ad89b8h		; _a[78] @ 2496
	.word	039c01b45h		; _a[79] @ 2528
	.word	0b9d4a973h		; _a[80] @ 2560
	.word	039eb6ab0h		; _a[81] @ 2592
	.word	0ba024d9ch		; _a[82] @ 2624
	.word	03a103ee0h		; _a[83] @ 2656
	.word	0ba1fae0dh		; _a[84] @ 2688
	.word	03a30c3ffh		; _a[85] @ 2720
	.word	0ba43adf6h		; _a[86] @ 2752
	.word	03a589e04h		; _a[87] @ 2784
	.word	0ba6fcb99h		; _a[88] @ 2816
	.word	03a84ba06h		; _a[89] @ 2848
	.word	0ba92edaeh		; _a[90] @ 2880
	.word	03aa2a655h		; _a[91] @ 2912
	.word	0bab40da8h		; _a[92] @ 2944
	.word	03ac751b0h		; _a[93] @ 2976
	.word	0badca56eh		; _a[94] @ 3008
	.word	03af4415bh		; _a[95] @ 3040
	.word	0bb073201h		; _a[96] @ 3072
	.word	03b15a946h		; _a[97] @ 3104
	.word	0bb25acc9h		; _a[98] @ 3136
	.word	03b3766f5h		; _a[99] @ 3168
	.word	0bb4b06b5h		; _a[100] @ 3200
	.word	03b60c001h		; _a[101] @ 3232
	.word	0bb78cc5ah		; _a[102] @ 3264
	.word	03b89b5b9h		; _a[103] @ 3296
	.word	0bb9871deh		; _a[104] @ 3328
	.word	03ba8c1a2h		; _a[105] @ 3360
	.word	0bbbad036h		; _a[106] @ 3392
	.word	03bcecd67h		; _a[107] @ 3424
	.word	0bbe4ee21h		; _a[108] @ 3456
	.word	03bfd6cfeh		; _a[109] @ 3488
	.word	0bc0c4569h		; _a[110] @ 3520
	.word	03c1b47b8h		; _a[111] @ 3552
	.word	0bc2be52bh		; _a[112] @ 3584
	.word	03c3e49b2h		; _a[113] @ 3616
	.word	0bc52a615h		; _a[114] @ 3648
	.word	03c693025h		; _a[115] @ 3680
	.word	0bc8111d3h		; _a[116] @ 3712
	.word	03c8ee14fh		; _a[117] @ 3744
	.word	0bc9e2b14h		; _a[118] @ 3776
	.word	03caf17a0h		; _a[119] @ 3808
	.word	0bcc1d3c0h		; _a[120] @ 3840
	.word	03cd6910ch		; _a[121] @ 3872
	.word	0bced8676h		; _a[122] @ 3904
	.word	03d037860h		; _a[123] @ 3936
	.word	0bd11899dh		; _a[124] @ 3968
	.word	03d211c2dh		; _a[125] @ 4000
	.word	0bd32594eh		; _a[126] @ 4032
	.word	03d456ea2h		; _a[127] @ 4064
	.word	0bd5a8eb2h		; _a[128] @ 4096
	.word	03d71f16ah		; _a[129] @ 4128
	.word	0bd85ea5dh		; _a[130] @ 4160
	.word	03d943e94h		; _a[131] @ 4192
	.word	0bda41b49h		; _a[132] @ 4224
	.word	03db5aa7dh		; _a[133] @ 4256
	.word	0bdc91ab0h		; _a[134] @ 4288
	.word	03dde9f50h		; _a[135] @ 4320
	.word	0bdf67169h		; _a[136] @ 4352
	.word	03e0867feh		; _a[137] @ 4384
	.word	0be170070h		; _a[138] @ 4416
	.word	03e2728adh		; _a[139] @ 4448
	.word	0be390b7eh		; _a[140] @ 4480
	.word	03e4cd83bh		; _a[141] @ 4512
	.word	0be62c358h		; _a[142] @ 4544
	.word	03e7b06d2h		; _a[143] @ 4576
	.word	0be8af178h		; _a[144] @ 4608
	.word	03e99cf68h		; _a[145] @ 4640
	.word	0beaa4492h		; _a[146] @ 4672
	.word	03ebc7c8fh		; _a[147] @ 4704
	.word	0bed0a793h		; _a[148] @ 4736
	.word	03ee6fb0ch		; _a[149] @ 4768
	.word	0beffb211h		; _a[150] @ 4800
	.word	03f0d870ah		; _a[151] @ 4832
	.word	0bf1cabc2h		; _a[152] @ 4864
	.word	03f2d6f4ah		; _a[153] @ 4896
	.word	0bf3ffe04h		; _a[154] @ 4928
	.word	03f548912h		; _a[155] @ 4960
	.word	0bf6b46d6h		; _a[156] @ 4992
	.word	0c2b2d072h		; _a[157] @ 5024
	.word	0bf9028e5h		; _a[158] @ 5056
	.word	03f9f95bch		; _a[159] @ 5088
	.word	0bfb0a915h		; _a[160] @ 5120
	.word	03fc3902ah		; _a[161] @ 5152
	.word	0bfd87d0bh		; _a[162] @ 5184
	.word	03fefa711h		; _a[163] @ 5216
	.word	0c004a5d3h		; _a[164] @ 5248
	.word	04012d752h		; _a[165] @ 5280
	.word	0c0228d93h		; _a[166] @ 5312
	.word	04033f23dh		; _a[167] @ 5344
	.word	0c0473355h		; _a[168] @ 5376
	.word	0405c83d3h		; _a[169] @ 5408
	.word	0c0741c2ah		; _a[170] @ 5440
	.word	040871d6bh		; _a[171] @ 5472
	.word	0c095927bh		; _a[172] @ 5504
	.word	040a59390h		; _a[173] @ 5536
	.word	0c0b74b08h		; _a[174] @ 5568
	.word	040cae7cdh		; _a[175] @ 5600
	.word	0c0e09dc9h		; _a[176] @ 5632
	.word	040f8a67ah		; _a[177] @ 5664
	.word	0c109a0c0h		; _a[178] @ 5696
	.word	041185aa8h		; _a[179] @ 5728
	.word	0c128a7f0h		; _a[180] @ 5760
	.word	0413ab3c6h		; _a[181] @ 5792
	.word	0c14eadebh		; _a[182] @ 5824
	.word	04164cb49h		; _a[183] @ 5856
	.word	0c17d4669h		; _a[184] @ 5888
	.word	0418c300ch		; _a[185] @ 5920
	.word	0c19b3016h		; _a[186] @ 5952
	.word	041abcafah		; _a[187] @ 5984
	.word	0c1be2cbah		; _a[188] @ 6016
	.word	041d28600h		; _a[189] @ 6048
	.word	0c1e90ca8h		; _a[190] @ 6080
	.word	04200fe2bh		; _a[191] @ 6112
	.word	0c20ecb8dh		; _a[192] @ 6144
	.word	0421e12fch		; _a[193] @ 6176
	.word	0c22efcf5h		; _a[194] @ 6208
	.word	04241b63bh		; _a[195] @ 6240
	.word	0c2567062h		; _a[196] @ 6272
	.word	0426d624bh		; _a[197] @ 6304
	.word	0c283645bh		; _a[198] @ 6336
	.word	042917373h		; _a[199] @ 6368
	.word	0c2b2d072h		; _a[200] @ 6400
$C$IR_1:	.set	804

	.global	_a
_a:	.usect	".far",804,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\025007 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\025009 
	.sect	".text:optci"
	.clink

;******************************************************************************
;* FUNCTION NAME: expsp_coshsp_i                                              *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,A5,A6,A7,A8,A9,B0,B4,B5,B6,B7,B8,B9,B16     *
;*   Regs Used         : A0,A3,A4,A5,A6,A7,A8,A9,B0,B3,B4,B5,B6,B7,B8,B9,B16  *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_expsp_coshsp_i:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 79
           MVKL    .S1     0x41b8aa3b,A3
           MVKH    .S1     0x41b8aa3b,A3
           MPYSP   .M1     A3,A4,A3          ; |77| 
           ZERO    .L2     B4
           SET     .S2     B4,0x18,0x1d,B4
           MVKL    .S2     0x3fa62e42,B9
           MVKL    .S2     0xfef2e4e7,B8
           ADDSP   .L2X    B4,A3,B4          ; |77| 
           MVKH    .S2     0x3fa62e42,B9
           MVKH    .S2     0xfef2e4e7,B8
           MVKL    .S2     _ti_math_jTable,B7
           SPTRUNC .L2     B4,B6             ; |77| 
           ZERO    .L2     B4
           MVKH    .S2     0xbf000000,B4
           CMPLTSP .S2X    A3,B4,B0          ; |78| 
   [ B0]   SUB     .L2     B6,1,B6           ; |79| 
           INTDP   .L2     B6,B5:B4          ; |87| 
           SUB     .D2     B6,16,B6          ; |89| 
           MVKH    .S2     _ti_math_jTable,B7
           EXTU    .S2     B6,30,30,B16      ; |100| 
           SPDP    .S1     A4,A9:A8          ; |87| 
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |87| 
           LDDW    .D2T1   *+B7[B16],A7:A6   ; |100| 
           NOP             5
           MVKL    .S2     _ti_math_kTable,B5
           EXTU    .S2     B6,28,30,B4       ; |100| 
           MVKH    .S2     _ti_math_kTable,B5
           LDDW    .D2T2   *+B5[B4],B5:B4    ; |100| 
           SUBDP   .L1X    A9:A8,B9:B8,A9:A8 ; |87| 
           NOP             3
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |100| 
           NOP             2
           DPSP    .L1     A9:A8,A3          ; |87| 
           MVKL    .S2     0x3f00010f,B4
           MVKL    .S1     0x3e2aab29,A9
           MVKH    .S2     0x3f00010f,B4
           MPYSP   .M1     A3,A3,A5          ; |87| 
           MVKH    .S1     0x3e2aab29,A9
           NOP             2
           MPYSP   .M1     A5,A3,A8          ; |87| 
           MPYSP   .M2X    B4,A5,B4          ; |87| 
           NOP             2
           MPYSP   .M1     A9,A8,A5          ; |87| 
           ZERO    .L1     A8
           SET     .S1     A8,0x17,0x1d,A8
           NOP             1
           ADDSP   .L1X    B4,A5,A5          ; |87| 
           NOP             3
           ADDSP   .L1     A5,A3,A5          ; |87| 
           SHL     .S1X    B6,16,A3          ; |100| 
           CLR     .S1     A3,0,19,A3        ; |100| 
           ADD     .S1     A3,A7,A7          ; |100| 
           ADDSP   .L1     A8,A5,A5          ; |100| 
           MVKL    .S1     0x3f317218,A3
           MVKH    .S1     0x3f317218,A3
           SUBSP   .L1     A4,A3,A3          ; |104| 
           MPYSPDP .M1     A5,A7:A6,A7:A6    ; |100| 
           MVKL    .S1     0x42b17218,A8
           MVKH    .S1     0x42b17218,A8
           ZERO    .L1     A5
           CMPGTSP .S1     A3,A8,A0          ; |104| 
           SET     .S1     A5,0x17,0x1e,A5
           RET     .S2     B3                ; |109| 
           DPSP    .L1     A7:A6,A4          ; |100| 
           NOP             3
   [ A0]   MV      .L1     A5,A4             ; |105| 
           ; BRANCH OCCURS {B3}              ; |109| 
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

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           MVK     .S2     0xc9,B4
||         MVKL    .S1     _a,A12

           MVKH    .S1     _a,A12
||         MVKL    .S2     _output,B11

           CALL    .S1     _coshf            ; |140| 
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
           LDW     .D1T1   *A13++,A4         ; |140| 
           ADDKPC  .S2     $C$RL1,B3,3       ; |140| 
$C$RL1:    ; CALL OCCURS {_coshf} {0}        ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |140| 
||         SUB     .L1     A10,1,A0          ; |139| 
||         SUB     .S1     A10,1,A10         ; |139| 

   [ A0]   BNOP    .S1     $C$L1,3           ; |139| 

           ADD     .L2     B10,B4,B5         ; |140| 
||         ADD     .D2     4,B10,B10         ; |139| 
|| [!A0]   MVK     .S2     0xc9,B4

   [ A0]   CALL    .S1     _coshf            ; |140| 
||         STW     .D2T1   A4,*B5            ; |140| 

           ; BRANCHCC OCCURS {$C$L1}         ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     _coshsp           ; |143| 
||         MV      .L1X    B4,A10
||         ZERO    .L2     B10
||         MV      .D1     A12,A11
||         ADD     .S2     4,B11,B12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |143| 
           ADDKPC  .S2     $C$RL2,B3,3       ; |143| 
$C$RL2:    ; CALL OCCURS {_coshsp} {0}       ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |143| 
||         SUB     .L1     A10,1,A0          ; |142| 
||         SUB     .S1     A10,1,A10         ; |142| 

   [ A0]   BNOP    .S1     $C$L2,3           ; |142| 

           ADD     .L2     B10,B4,B5         ; |143| 
||         ADD     .D2     4,B10,B10         ; |142| 
|| [!A0]   MVK     .S2     0xc9,B4

   [ A0]   CALL    .S1     _coshsp           ; |143| 
||         STW     .D2T1   A4,*B5            ; |143| 

           ; BRANCHCC OCCURS {$C$L2}         ; |142| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     _coshsp_c         ; |146| 
||         MV      .L1X    B4,A10
||         ZERO    .L2     B10
||         MV      .D1     A11,A12
||         ADD     .S2     4,B12,B12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A12++,A4         ; |146| 
           ADDKPC  .S2     $C$RL3,B3,3       ; |146| 
$C$RL3:    ; CALL OCCURS {_coshsp_c} {0}     ; |146| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B12,B4           ; |146| 
||         SUB     .L1     A10,1,A0          ; |145| 
||         SUB     .S1     A10,1,A10         ; |145| 

   [ A0]   BNOP    .S1     $C$L3,3           ; |145| 
|| [!A0]   ADD     .L1X    4,B12,A10

           ADD     .L2     B10,B4,B5         ; |146| 
||         ADD     .S2     4,B10,B10         ; |145| 

   [ A0]   CALL    .S1     _coshsp_c         ; |146| 
||         STW     .D2T1   A4,*B5            ; |146| 

           ; BRANCHCC OCCURS {$C$L3}         ; |145| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           ZERO    .L1     A12
||         MVK     .S1     0xc9,A1
||         SUB     .L2X    A11,4,B17
||         LDW     .D1T2   *A10,B18

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D2T2   *++B17,B5         ; |149| 
           ZERO    .L2     B4
           MVKH    .S2     0x41800000,B4
           NOP             2
           ABSSP   .S2     B5,B19            ; |200| 

           CMPGTSP .S2     B19,B4,B0         ; |204| 
||         ZERO    .L2     B4

   [!B0]   ZERO    .L1     A16
|| [ B0]   B       .S1     $C$L6             ; |204| 
||         SET     .S2     B4,0x17,0x1d,B4
||         MV      .L2     B0,B2             ; |204| branch predicate copy
||         MV      .D2     B0,B1             ; guard predicate rewrite

   [!B0]   SET     .S1     A16,0x18,0x1d,A16
||         CMPGTSP .S2     B19,B4,B0         ; |207| 

   [ B1]   MVK     .L2     0x1,B0            ; |207| nullify predicate
   [!B0]   B       .S1     $C$L5             ; |207| 
   [ B2]   CALL    .S1     _expsp_coshsp_i   ; |205| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L6}         ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

   [ B0]   CALL    .S1     _expsp_coshsp_i   ; |211| 
|| [!B0]   MPYSP   .M2     B5,B5,B5          ; |172| 

           NOP             2
           ; BRANCHCC OCCURS {$C$L5}         ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL4,B3,1       ; |211| 
           MV      .L1X    B5,A4             ; |211| 
$C$RL4:    ; CALL OCCURS {_expsp_coshsp_i} {0}  ; |211| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           ZERO    .L1     A5
           SET     .S1     A5,0x1e,0x1e,A5
           MPYSP   .M1     A5,A4,A3          ; |211| 
           MVKL    .S2     0x7f7fffff,B4
           MVKH    .S2     0x7f7fffff,B4
           SUB     .L1     A1,1,A1           ; |148| 
           RCPSP   .S1     A3,A4             ; |127| 
           MPYSP   .M1     A3,A4,A6          ; |127| 
           CMPEQSP .S1     A3,A12,A0         ; |129| 
           ABSSP   .S2X    A3,B5             ; |133| 
           CMPGTSP .S2     B5,B4,B0          ; |133| 
           SUBSP   .L1     A5,A6,A6          ; |127| 
           MVKL    .S2     0x42b2d4fc,B4
           NOP             2
           MPYSP   .M1     A4,A6,A4          ; |127| 
           NOP             3
           MPYSP   .M1     A3,A4,A6          ; |127| 
           NOP             3
           SUBSP   .L1     A5,A6,A5          ; |127| 
           NOP             3
           MPYSP   .M1     A4,A5,A4          ; |127| 
           NOP             3
   [ A0]   MV      .L1     A12,A4            ; |130| 
   [ B0]   MV      .L1     A12,A4            ; |134| 
           ADDSP   .L1     A4,A3,A3          ; |213| 
           NOP             3

           BNOP    .S1     $C$L7,4           ; |213| 
||         MPYSP   .M1     A16,A3,A3         ; |213| 

           MV      .L2X    A3,B5             ; |213| Define a twin register
||         ZERO    .L1     A3

           ; BRANCH OCCURS {$C$L7}           ; |213| 
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 23

           MVKL    .S1     0x3ab60b61,A4
||         MVKL    .S2     0x37d00d01,B8

           MVKH    .S2     0x37d00d01,B8
||         MPYSP   .M2     B5,B5,B4          ; |172| 

           MPYSP   .M1X    A16,B5,A5         ; |172| 
           MVKL    .S1     0x3d2aaaab,A3
           MVKH    .S1     0x3ab60b61,A4
           MPYSP   .M2     B4,B5,B7          ; |172| 
           MPYSP   .M2     B4,B4,B6          ; |172| 
           MVKH    .S1     0x3d2aaaab,A3
           MPYSP   .M1X    A3,B4,A3          ; |172| 
           MPYSP   .M2X    A4,B7,B4          ; |172| 
           MPYSP   .M2     B8,B6,B5          ; |172| 
           SUB     .L1     A1,1,A1           ; |148| 
           ADDSP   .L1     A3,A5,A3          ; |172| 
           ZERO    .L2     B31
           ADDSP   .L2     B4,B5,B4          ; |172| 
           NOP             2
           B       .S1     $C$L8             ; |172| 
           ADDSP   .L2X    B4,A3,B5          ; |172| 
           SET     .S2     B31,0x17,0x1d,B4
           ZERO    .L1     A3
           SET     .S1     A3,0x17,0x1e,A3

   [ A1]   B       .S1     $C$L4             ; |148| 
||         ADDSP   .L2     B4,B5,B5          ; |172| 
||         MVKL    .S2     0x42b2d4fc,B4

           ; BRANCH OCCURS {$C$L8}           ; |172| 
;** --------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 4
           MV      .L1X    B19,A4            ; |205| 
           ADDKPC  .S2     $C$RL5,B3,2       ; |205| 
$C$RL5:    ; CALL OCCURS {_expsp_coshsp_i} {0}  ; |205| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           SUB     .L1     A1,1,A1           ; |148| 
||         MVKL    .S2     0x42b2d4fc,B4
||         MV      .L2X    A4,B5             ; |205| 
||         ZERO    .S1     A3

;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 1

   [ A1]   B       .S2     $C$L4             ; |148| 
||         SET     .S1     A3,0x17,0x1e,A3

;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 5
           MVKH    .S2     0x42b2d4fc,B4
           CMPGTSP .S2     B19,B4,B0         ; |216| 
           NOP             1
   [ B0]   MV      .L2X    A3,B5             ; |217| 

   [!A1]   CALL    .S1     _coshsp_v         ; |151| 
||         STW     .D2T2   B5,*B18++         ; |149| 

           ; BRANCHCC OCCURS {$C$L4}         ; |148| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *+B11(16),B4      ; |151| 
           ADDKPC  .S2     $C$RL6,B3,2       ; |151| 

           MV      .L1     A11,A4            ; |151| 
||         MVK     .S1     0xc9,A6           ; |151| 

$C$RL6:    ; CALL OCCURS {_coshsp_v} {0}     ; |151| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D2T1   *B11,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B11(4),B4       ; |66| 
||         MVK     .S1     0xc9,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |66| 
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
||         MVK     .S1     0xc9,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL8:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     _fcn_pass,B5

           LDW     .D2T2   *+B11(12),B4      ; |68| 
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L2     B11,B8
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B8,A4            ; |68| 
||         MVK     .S1     0xc9,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL9:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     _fcn_pass,B4
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     _fcn_pass,B4
           MVKH    .S2     0x3eb0c6f7,B7

           ADD     .L1     4,A10,A15
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B11,A4           ; |69| 
||         LDW     .D1T2   *A15,B4           ; |69| 
||         MVK     .S1     0xc9,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL10:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S1     _fcn_pass,A3
           MVKH    .S1     _fcn_pass,A3
           ADD     .L1     4,A3,A14
           LDW     .D1T1   *A14,A0           ; |72| 
           MV      .L2X    A3,B4             ; |72| 
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           ADD     .L2X    8,A3,B10
           NOP             1

   [!A0]   B       .S1     $C$L9             ; |72| 
|| [ A0]   LDW     .D2T2   *B10,B0           ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |157| 
   [ A0]   ADD     .L2     4,B10,B4
   [!A0]   MVKL    .S2     _all_pass,B4
   [!A0]   MV      .L2X    A12,B5
   [!A0]   MVKH    .S2     _all_pass,B4
           ; BRANCHCC OCCURS {$C$L9}         ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [!B0]   MV      .L1     A12,A0            ; |72| 
           MVK     .L2     0x1,B5            ; |72| 
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1
   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
   [!A0]   MV      .L2X    A12,B5
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |157| 
           MVKL    .S2     _all_pass,B4
           MVKH    .S2     _all_pass,B4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x1,A4            ; |157| 
||         STW     .D2T2   B5,*B4            ; |72| 
||         ADDKPC  .S2     $C$RL11,B3,0      ; |157| 

$C$RL11:   ; CALL OCCURS {_print_test_results} {0}  ; |157| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           ZERO    .L1     A13

           MVKH    .S1     0x80000000,A13
||         MVKL    .S2     _a_sc,B12
||         ZERO    .L1     A3

           SET     .S1     A3,0x17,0x1d,A3
||         MVKH    .S2     _a_sc,B12

           STDW    .D2T1   A13:A12,*B12      ; |165| 
||         ADD     .L1     -1,A13,A6
||         ZERO    .L2     B5
||         ZERO    .S1     A31
||         MVK     .D1     -1,A7             ; |171| 

           STDW    .D2T1   A7:A6,*+B12(24)   ; |171| 
||         SET     .S1     A31,0x17,0x1e,A3
||         MV      .L2X    A3,B4             ; |169| 
||         MVKH    .S2     0xbf800000,B5
||         ZERO    .L1     A5

           STDW    .D2T2   B5:B4,*+B12(16)   ; |169| 
||         MV      .L1     A3,A4             ; |167| 
||         MVKH    .S1     0xff800000,A5

           CALL    .S1     _coshf            ; |174| 
||         STDW    .D2T1   A5:A4,*+B12(8)    ; |167| 
||         SUB     .L1X    B12,4,A11
||         MV      .D1     A12,A10
||         MVK     .L2     0x8,B11

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
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *++A11,A4         ; |174| 
           ADDKPC  .S2     $C$RL12,B3,3      ; |174| 
$C$RL12:   ; CALL OCCURS {_coshf} {0}        ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 28
           MVKL    .S1     _output,A13
           MVKH    .S1     _output,A13
           LDW     .D1T2   *A13,B4           ; |174| 
           NOP             4
           ADD     .L2X    A10,B4,B4         ; |174| 
           STW     .D2T1   A4,*B4            ; |174| 

           CALLP   .S2     _coshsp,B3
||         LDW     .D1T1   *A11,A4           ; |175| 

$C$RL13:   ; CALL OCCURS {_coshsp} {0}       ; |175| 
           LDW     .D1T2   *+A13(4),B4       ; |175| 
           NOP             4
           ADD     .L2X    A10,B4,B4         ; |175| 
           STW     .D2T1   A4,*B4            ; |175| 

           CALLP   .S2     _coshsp_c,B3
||         LDW     .D1T1   *A11,A4           ; |176| 

$C$RL14:   ; CALL OCCURS {_coshsp_c} {0}     ; |176| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           LDW     .D1T1   *+A13(8),A3       ; |176| 
           ZERO    .L2     B4
           MVKH    .S2     0x41800000,B4
           NOP             2
           ADD     .L1     A10,A3,A3         ; |176| 
           STW     .D1T1   A4,*A3            ; |176| 
           LDW     .D1T1   *A11,A4           ; |177| 
           NOP             4
           ABSSP   .S2X    A4,B17            ; |200| 

           CMPGTSP .S2     B17,B4,B0         ; |204| 
||         ZERO    .L2     B4

   [ B0]   B       .S1     $C$L12            ; |204| 
|| [!B0]   ZERO    .L1     A16
||         SET     .S2     B4,0x17,0x1d,B4
||         MV      .L2     B0,B2             ; |204| branch predicate copy
||         MV      .D2     B0,B1             ; guard predicate rewrite

   [!B0]   SET     .S1     A16,0x18,0x1d,A16
||         CMPGTSP .S2     B17,B4,B0         ; |207| 

   [ B1]   MVK     .L2     0x1,B0            ; |207| nullify predicate
   [!B0]   B       .S1     $C$L11            ; |207| 
   [ B2]   CALL    .S1     _expsp_coshsp_i   ; |205| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L12}        ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

   [ B0]   CALL    .S1     _expsp_coshsp_i   ; |211| 
|| [!B0]   MPYSP   .M1     A4,A4,A4          ; |172| 

           NOP             2
           ; BRANCHCC OCCURS {$C$L11}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL15,B3,2      ; |211| 
$C$RL15:   ; CALL OCCURS {_expsp_coshsp_i} {0}  ; |211| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           ZERO    .L1     A5
           SET     .S1     A5,0x1e,0x1e,A5
           MPYSP   .M1     A5,A4,A3          ; |211| 
           ZERO    .L1     A31
           MVKL    .S2     0x7f7fffff,B4
           MVKH    .S2     0x7f7fffff,B4
           RCPSP   .S1     A3,A4             ; |127| 
           MPYSP   .M1     A3,A4,A6          ; |127| 
           CMPEQSP .S1     A3,A12,A0         ; |129| 
           ABSSP   .S2X    A3,B5             ; |133| 
           CMPGTSP .S2     B5,B4,B0          ; |133| 
           SUBSP   .L1     A5,A6,A6          ; |127| 
           MVKL    .S2     0x42b2d4fc,B4
           NOP             2
           MPYSP   .M1     A4,A6,A4          ; |127| 
           NOP             3
           MPYSP   .M1     A3,A4,A6          ; |127| 
           NOP             3
           SUBSP   .L1     A5,A6,A5          ; |127| 
           NOP             3
           MPYSP   .M1     A4,A5,A4          ; |127| 
           NOP             3
   [ A0]   MV      .L1     A12,A4            ; |130| 
   [ B0]   MV      .L1     A12,A4            ; |134| 
           ADDSP   .L1     A4,A3,A3          ; |213| 
           SUB     .L1X    B11,1,A0          ; |173| 
           SUB     .L2     B11,1,B11         ; |173| 
           NOP             1

           BNOP    .S1     $C$L13,4          ; |213| 
||         MPYSP   .M1     A16,A3,A3         ; |213| 

           MV      .L2X    A3,B5             ; |213| Define a twin register
||         ADDAW   .D1     A13,3,A3

           ; BRANCH OCCURS {$C$L13}          ; |213| 
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 24

           MVKL    .S2     0x3ab60b61,B5
||         MVKL    .S1     0x37d00d01,A7

           MVKH    .S1     0x37d00d01,A7
||         MPYSP   .M1     A4,A4,A3          ; |172| 

           MVKL    .S2     0x3d2aaaab,B4
           MPYSP   .M1     A16,A4,A8         ; |172| 
           MVKH    .S2     0x3ab60b61,B5
           MPYSP   .M1     A3,A4,A6          ; |172| 
           MPYSP   .M1     A3,A3,A5          ; |172| 
           MVKH    .S2     0x3d2aaaab,B4
           MPYSP   .M2X    B4,A3,B4          ; |172| 
           MPYSP   .M1X    B5,A6,A3          ; |172| 
           MPYSP   .M1     A7,A5,A4          ; |172| 
           SUB     .L1X    B11,1,A0          ; |173| 
           SUB     .L2     B11,1,B11         ; |173| 
           ADDSP   .L1X    B4,A8,A31         ; |172| 
           ADDSP   .L1     A3,A4,A3          ; |172| 
           ZERO    .L2     B31
           SET     .S2     B31,0x17,0x1d,B4
           NOP             1

           BNOP    .S1     $C$L13,4          ; |172| 
||         ADDSP   .L1     A3,A31,A3         ; |172| 
||         ZERO    .D1     A31

           ADDSP   .L2X    B4,A3,B5          ; |172| 
||         ADDAW   .D1     A13,3,A3
||         MVKL    .S2     0x42b2d4fc,B4

           ; BRANCH OCCURS {$C$L13}          ; |172| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 4
           MV      .L1X    B17,A4            ; |205| 
           ADDKPC  .S2     $C$RL16,B3,2      ; |205| 
$C$RL16:   ; CALL OCCURS {_expsp_coshsp_i} {0}  ; |205| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           SUB     .L2     B11,1,B11         ; |173| 
||         MV      .D2X    A4,B5             ; |205| 
||         ZERO    .L1     A31
||         MVKL    .S2     0x42b2d4fc,B4
||         ADDAW   .D1     A13,3,A3
||         SUB     .S1X    B11,1,A0          ; |173| 

;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D1T1   *A3,A4            ; |177| 
||         SET     .S1     A31,0x17,0x1e,A3
||         MVKH    .S2     0x42b2d4fc,B4

   [ A0]   BNOP    .S1     $C$L10,2          ; |173| 
||         CMPGTSP .S2     B17,B4,B0         ; |216| 

   [ B0]   MV      .L2X    A3,B5             ; |217| 

           ADD     .L1     A10,A4,A3         ; |177| 
||         ADD     .S1     4,A10,A10         ; |173| 

   [ A0]   CALL    .S1     _coshf            ; |174| 
||         STW     .D1T2   B5,*A3            ; |177| 

           ; BRANCHCC OCCURS {$C$L10}        ; |173| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     _coshsp_v         ; |179| 
           LDW     .D1T2   *+A13(16),B4      ; |179| 
           ADDKPC  .S2     $C$RL17,B3,2      ; |179| 

           MV      .L1X    B12,A4
||         MVK     .S1     0x8,A6            ; |179| 

$C$RL17:   ; CALL OCCURS {_coshsp_v} {0}     ; |179| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 40
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           LDW     .D1T1   *A13,A4           ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A13(4),B4       ; |66| 
||         MVK     .L1     0x8,A6            ; |66| 
||         MVK     .S1     0x9,A8            ; |66| 

$C$RL18:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7

           LDW     .D1T2   *+A13(8),B4       ; |67| 
||         MVKL    .S1     _fcn_pass,A3
||         MVKH    .S2     0xa0b5ed8d,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A13,A4           ; |67| 
||         MVKH    .S1     _fcn_pass,A3
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A5,*+A3(4)        ; |66| 
||         MVK     .L1     0x8,A6            ; |67| 
||         MVK     .S1     0x9,A8            ; |67| 

$C$RL19:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7

           MVKL    .S1     _fcn_pass,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     _fcn_pass,A3
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L2X    A13,B4            ; |179| 
||         STW     .D1T1   A4,*+A3(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B4,A4            ; |68| 
||         LDW     .D1T2   *+A13(12),B4      ; |68| 
||         MVK     .L1     0x8,A6            ; |68| 
||         MVK     .S1     0x9,A8            ; |68| 

$C$RL20:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7

           MVKL    .S1     _fcn_pass,A3
||         MVKL    .S2     0xa0b5ed8d,B6

           MVKH    .S1     _fcn_pass,A3
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L2X    A15,B12           ; |68| 
||         STW     .D1T1   A4,*+A3(12)       ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A13,A4           ; |69| 
||         LDW     .D2T2   *B12,B4           ; |69| 
||         MVK     .L1     0x8,A6            ; |69| 
||         MVK     .S1     0x9,A8            ; |69| 

$C$RL21:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           MV      .L2X    A14,B11           ; |69| 
           LDW     .D2T2   *B11,B0           ; |72| 
           MVKL    .S1     _fcn_pass,A3
           MVKH    .S1     _fcn_pass,A3
           STW     .D1T1   A4,*+A3(16)       ; |69| 
           NOP             1

   [!B0]   MVKL    .S1     _all_pass,A4
|| [!B0]   B       .S2     $C$L14            ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [!B0]   MV      .L1     A12,A3

   [!B0]   CALL    .S2     _print_test_results ; |183| 
|| [!B0]   MVKH    .S1     _all_pass,A4
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           NOP             3
           ; BRANCHCC OCCURS {$C$L14}        ; |72| 
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
||         MVK     .S1     0x1,A3            ; |72| 

   [!A0]   MV      .L1     A12,A3
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |183| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x3,A4            ; |183| 
||         ADDKPC  .S2     $C$RL22,B3,0      ; |183| 

$C$RL22:   ; CALL OCCURS {_print_test_results} {0}  ; |183| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S2     _a_ext,B4

           MVKH    .S2     _a_ext,B4
||         ZERO    .L1     A3

           SET     .S1     A3,0x17,0x17,A3

           MV      .L1X    B4,A10            ; |186| 
||         STW     .D2T1   A3,*B4            ; |186| 
||         MVK     .S2     0x7d,B4

           MV      .L2X    A12,B13

           CALL    .S1     _coshf            ; |188| 
||         MV      .L1X    B4,A11            ; |186| 

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
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A10,A4           ; |188| 
           ADDKPC  .S2     $C$RL23,B3,3      ; |188| 
$C$RL23:   ; CALL OCCURS {_coshf} {0}        ; |188| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 26
           LDW     .D1T1   *A13,A3           ; |188| 
           NOP             4
           ADD     .L1X    B13,A3,A3         ; |188| 
           STW     .D1T1   A4,*A3            ; |188| 

           CALLP   .S2     _coshsp,B3
||         LDW     .D1T1   *A10,A4           ; |189| 

$C$RL24:   ; CALL OCCURS {_coshsp} {0}       ; |189| 
           LDW     .D1T1   *+A13(4),A3       ; |189| 
           NOP             4
           ADD     .L1X    B13,A3,A3         ; |189| 
           STW     .D1T1   A4,*A3            ; |189| 

           CALLP   .S2     _coshsp_c,B3
||         LDW     .D1T1   *A10,A4           ; |190| 

$C$RL25:   ; CALL OCCURS {_coshsp_c} {0}     ; |190| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           LDW     .D1T1   *+A13(8),A3       ; |190| 
           ZERO    .L2     B31
           MVKH    .S2     0x41800000,B31
           NOP             2
           ADD     .L2X    B13,A3,B4         ; |190| 
           STW     .D2T1   A4,*B4            ; |190| 
           LDW     .D1T1   *A10,A4           ; |191| 
           ZERO    .L2     B4
           SET     .S2     B4,0x17,0x1d,B4
           NOP             2
           ABSSP   .S2X    A4,B17            ; |200| 
           CMPGTSP .S2     B17,B31,B0        ; |204| 

   [ B0]   B       .S1     $C$L17            ; |204| 
|| [!B0]   ZERO    .L1     A16
||         MV      .L2     B0,B2             ; |204| branch predicate copy
||         MV      .S2     B0,B1             ; guard predicate rewrite

   [!B0]   SET     .S1     A16,0x18,0x1d,A16
||         CMPGTSP .S2     B17,B4,B0         ; |207| 

   [ B1]   MVK     .L2     0x1,B0            ; |207| nullify predicate
   [!B0]   B       .S1     $C$L16            ; |207| 
   [ B2]   CALL    .S1     _expsp_coshsp_i   ; |205| 
           NOP             1
           ; BRANCHCC OCCURS {$C$L17}        ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

   [ B0]   CALL    .S1     _expsp_coshsp_i   ; |211| 
|| [!B0]   MPYSP   .M1     A4,A4,A4          ; |172| 

           NOP             2
           ; BRANCHCC OCCURS {$C$L16}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           ADDKPC  .S2     $C$RL26,B3,2      ; |211| 
$C$RL26:   ; CALL OCCURS {_expsp_coshsp_i} {0}  ; |211| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           ZERO    .L1     A5
           SET     .S1     A5,0x1e,0x1e,A5
           MPYSP   .M1     A5,A4,A3          ; |211| 
           MVKL    .S2     0x7f7fffff,B4
           MVKH    .S2     0x7f7fffff,B4
           MVKL    .S2     0x42b2d4fc,B31
           RCPSP   .S1     A3,A4             ; |127| 
           MPYSP   .M1     A3,A4,A6          ; |127| 
           ABSSP   .S2X    A3,B5             ; |133| 
           CMPGTSP .S2     B5,B4,B0          ; |133| 
           MVK     .S2     12,B5
           SUBSP   .L1     A5,A6,A6          ; |127| 
           ADD     .L2X    A13,B5,B5
           LDW     .D2T2   *B5,B6            ; |191| 
           MVKH    .S2     0x42b2d4fc,B31
           MPYSP   .M1     A4,A6,A4          ; |127| 
           CMPEQSP .S1     A3,A12,A0         ; |129| 
           NOP             2
           MPYSP   .M1     A3,A4,A6          ; |127| 
           ADD     .L2     B13,B6,B5         ; |191| 
           ADD     .L2     4,B13,B13         ; |187| 
           NOP             1
           SUBSP   .L1     A5,A6,A5          ; |127| 
           NOP             3
           MPYSP   .M1     A4,A5,A4          ; |127| 
           MVKL    .S1     0xc000cccc,A5
           MVKH    .S1     0xc000cccc,A5
           NOP             1

   [ A0]   MV      .L1     A12,A4            ; |130| 
||         SUB     .S1     A11,1,A0          ; |187| 
||         SUB     .D1     A11,1,A11         ; |187| 

   [ B0]   MV      .L1     A12,A4            ; |134| 
           ADDSP   .L1     A4,A3,A3          ; |213| 
           CMPGTSP .S2     B17,B31,B0        ; |216| 
           MVKL    .S1     0xcccccccd,A4
           MVKH    .S1     0xcccccccd,A4

           BNOP    .S1     $C$L18,4          ; |213| 
||         MPYSP   .M1     A16,A3,A3         ; |213| 

           MV      .L2X    A3,B4             ; |213| Define a twin register
||         ZERO    .L1     A3

           ; BRANCH OCCURS {$C$L18}          ; |213| 
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 24

           MVKL    .S2     0x3ab60b61,B4
||         MVKL    .S1     0x37d00d01,A7
||         ZERO    .L2     B31
||         SUB     .L1     A11,1,A0          ; |187| 
||         SUB     .D1     A11,1,A11         ; |187| 

           MPYSP   .M1     A4,A4,A3          ; |172| 
           MVKL    .S2     0x3d2aaaab,B5
           MPYSP   .M1     A16,A4,A31        ; |172| 
           MVKH    .S2     0x3d2aaaab,B5
           MPYSP   .M1     A3,A4,A6          ; |172| 

           MPYSP   .M1     A3,A3,A5          ; |172| 
||         MPYSP   .M2X    B5,A3,B5          ; |172| 

           MVKH    .S2     0x3ab60b61,B4
           MVKH    .S1     0x37d00d01,A7

           MPYSP   .M1X    B4,A6,A3          ; |172| 
||         SET     .S2     B31,0x17,0x1d,B4

           MPYSP   .M1     A7,A5,A5          ; |172| 
||         MVKL    .S2     0x42b2d4fc,B31

           ADDSP   .L1X    B5,A31,A4         ; |172| 
||         MVK     .S2     12,B5

           ADD     .L2X    A13,B5,B5
||         MVKH    .S2     0x42b2d4fc,B31

           LDW     .D2T2   *B5,B6            ; |191| 
           ADDSP   .L1     A3,A5,A3          ; |172| 
           CMPGTSP .S2     B17,B31,B0        ; |216| 
           MVKL    .S1     0xc000cccc,A5
           MVKH    .S1     0xc000cccc,A5

           BNOP    .S2     $C$L18,3          ; |172| 
||         ADDSP   .L1     A3,A4,A3          ; |172| 
||         MVKL    .S1     0xcccccccd,A4
||         ADD     .L2     B13,B6,B5         ; |191| 
||         ADD     .D2     4,B13,B13         ; |187| 

           MVKH    .S1     0xcccccccd,A4

           ADDSP   .L2X    B4,A3,B4          ; |172| 
||         ZERO    .L1     A3

           ; BRANCH OCCURS {$C$L18}          ; |172| 
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 4
           MV      .L1X    B17,A4            ; |205| 
           ADDKPC  .S2     $C$RL27,B3,2      ; |205| 
$C$RL27:   ; CALL OCCURS {_expsp_coshsp_i} {0}  ; |205| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVK     .S2     12,B5
           ADD     .L2X    A13,B5,B5
           LDW     .D2T2   *B5,B6            ; |191| 
           MVKL    .S1     0xc000cccc,A5
           MVKL    .S2     0x42b2d4fc,B31

           MV      .L2X    A4,B4             ; |205| 
||         MVKL    .S1     0xcccccccd,A4

           MVKH    .S2     0x42b2d4fc,B31
||         MVKH    .S1     0xc000cccc,A5
||         SUB     .L1     A11,1,A0          ; |187| 

           ADD     .L2     B13,B6,B5         ; |191| 
||         ADD     .D2     4,B13,B13         ; |187| 
||         CMPGTSP .S2     B17,B31,B0        ; |216| 
||         MVKH    .S1     0xcccccccd,A4
||         ZERO    .L1     A3
||         SUB     .D1     A11,1,A11         ; |187| 

;** --------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 22
           SET     .S1     A3,0x17,0x1e,A3
           NOP             2
   [ B0]   MV      .L2X    A3,B4             ; |217| 
           STW     .D2T2   B4,*B5            ; |191| 
           LDW     .D1T1   *A10,A3           ; |192| 
           NOP             4
           MPYSPDP .M1     A3,A5:A4,A5:A4    ; |192| 
           NOP             5
   [ A0]   B       .S1     $C$L15            ; |187| 
           DPSP    .L1     A5:A4,A3          ; |192| 
           NOP             3

   [ A0]   CALL    .S1     _coshf            ; |188| 
||         STW     .D1T1   A3,*++A10         ; |192| 

           ; BRANCHCC OCCURS {$C$L15}        ; |187| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           CALL    .S1     _coshsp_v         ; |194| 
||         MV      .L2X    A13,B13           ; |194| 

           LDW     .D2T2   *+B13(16),B4      ; |194| 
           MVKL    .S1     _a_ext,A4
           MVKH    .S1     _a_ext,A4
           ADDKPC  .S2     $C$RL28,B3,0      ; |194| 
           MVK     .S1     0x7d,A6           ; |194| 
$C$RL28:   ; CALL OCCURS {_coshsp_v} {0}     ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 47
           LDW     .D2T2   *B13,B5           ; |66| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7
           MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MV      .L1X    B5,A4             ; |66| 
||         MVK     .S1     0x7d,A6           ; |66| 
||         MVK     .D1     0x9,A8            ; |66| 

$C$RL29:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     _fcn_pass,B5

           LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B5(4)        ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .S1     0x7d,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL30:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3eb0c6f7,B7

           STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A13,A4           ; |68| 
||         LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVK     .S1     0x7d,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL31:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     _fcn_pass,B4
           MVKL    .S2     0xa0b5ed8d,B6
           MVKL    .S2     0x3eb0c6f7,B7
           MVKH    .S2     _fcn_pass,B4
           MVKH    .S2     0xa0b5ed8d,B6

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         LDW     .D1T2   *A15,B4           ; |69| 
||         MVKH    .S2     0x3eb0c6f7,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A13,A4           ; |69| 
||         MVK     .S1     0x7d,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL32:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D1T1   *A14,A0           ; |72| 
           MVKL    .S2     _fcn_pass,B4
           MV      .L2     B10,B5            ; |72| 
           MVKH    .S2     _fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 

   [ A0]   ADD     .L2     4,B5,B4
|| [!A0]   B       .S1     $C$L19            ; |72| 
|| [ A0]   LDW     .D2T2   *B5,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |198| 
   [!A0]   MVKL    .S1     _all_pass,A3
   [!A0]   MVKH    .S1     _all_pass,A3
   [!A0]   MV      .L2X    A12,B4
   [!A0]   MV      .L2X    A3,B5
           ; BRANCHCC OCCURS {$C$L19}        ; |72| 
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
           CALL    .S1     _print_test_results ; |198| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             1
           MV      .L2X    A3,B5
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 1

           MVK     .L1     0x4,A4            ; |198| 
||         STW     .D2T2   B4,*B5            ; |72| 
||         ADDKPC  .S2     $C$RL33,B3,0      ; |198| 

$C$RL33:   ; CALL OCCURS {_print_test_results} {0}  ; |198| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MVKL    .S2     _cycle_counts+24,B5

           MVKH    .S2     _cycle_counts+24,B5
||         MV      .L2X    A12,B4            ; |114| 
||         MV      .L1     A12,A10           ; |114| 
||         MV      .S1     A12,A11           ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A11:A10,*B5       ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     _t_start,A3

           MVKH    .S1     _t_start,A3
||         MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     _t_offset,A4

           CALL    .S2     _gimme_random     ; |208| 
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVK     .S1     0x80,A3
||         ZERO    .L1     A13

           EXT     .S2     B5,24,24,B6       ; |117| 
||         MVKH    .S1     0x43480000,A13
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     _t_offset,A4

           MV      .L1     A13,A4            ; |208| 
||         ZERO    .L2     B4
||         STDW    .D1T2   B5:B4,*A4         ; |117| 
||         STW     .D2T1   A3,*+SP(12)       ; |117| 
||         MV      .S2X    A12,B13           ; |117| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 2
           MVKH    .S2     0xc2c80000,B4
           ADDKPC  .S2     $C$RL34,B3,0      ; |208| 
$C$RL34:   ; CALL OCCURS {_gimme_random} {0}  ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           LDW     .D1T1   *A3,A3            ; |208| 
           NOP             4
           ADD     .L2X    B13,A3,B4         ; |208| 

           STW     .D2T1   A4,*B4            ; |208| 
||         MVC     .S2     TSCL,B4           ; |122| 

           NOP             1

           MV      .L1X    B4,A18            ; |122| Define a twin register
||         MVC     .S2     TSCH,B5           ; |122| 

           ZERO    .L2     B4
||         ABSSP   .S2X    A4,B17            ; |200| 

           MVKH    .S2     0x41800000,B4
||         MV      .L1X    B5,A19            ; |122| 

           CMPGTSP .S2     B17,B4,B0         ; |204| 
||         ZERO    .L2     B4

   [ B0]   B       .S1     $C$L22            ; |204| 
|| [!B0]   ZERO    .L1     A16
||         SET     .S2     B4,0x17,0x1d,B4
||         MV      .L2     B0,B2             ; |204| branch predicate copy
||         MV      .D2     B0,B1             ; guard predicate rewrite

   [!B0]   SET     .S1     A16,0x18,0x1d,A16
||         CMPGTSP .S2     B17,B4,B0         ; |207| 

   [ B1]   MVK     .L2     0x1,B0            ; |207| nullify predicate
|| [ B2]   MVKL    .S1     _t_start,A3

   [!B0]   B       .S1     $C$L21            ; |207| 
   [ B2]   CALL    .S1     _expsp_coshsp_i   ; |205| 
   [ B2]   MVKH    .S1     _t_start,A3
           ; BRANCHCC OCCURS {$C$L22}        ; |204| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

   [ B0]   CALL    .S1     _expsp_coshsp_i   ; |211| 
|| [!B0]   MPYSP   .M1     A4,A4,A4          ; |172| 

           NOP             2
           ; BRANCHCC OCCURS {$C$L21}        ; |207| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3
           MVKL    .S2     _t_start,B4
           MVKH    .S2     _t_start,B4

           STDW    .D2T1   A19:A18,*B4
||         ADDKPC  .S2     $C$RL35,B3,0      ; |211| 

$C$RL35:   ; CALL OCCURS {_expsp_coshsp_i} {0}  ; |211| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           ZERO    .L1     A5
           SET     .S1     A5,0x1e,0x1e,A5
           MPYSP   .M1     A5,A4,A3          ; |211| 
           MVKL    .S1     _t_start,A31
           MVKL    .S2     0x7f7fffff,B4
           MVKH    .S2     0x7f7fffff,B4
           RCPSP   .S1     A3,A4             ; |127| 
           MPYSP   .M1     A3,A4,A6          ; |127| 
           MVKH    .S1     _t_start,A31
           MVKL    .S2     0x42b2d4fc,B6
           LDDW    .D1T1   *A31,A19:A18      ; |213| 
           SUBSP   .L1     A5,A6,A6          ; |127| 
           CMPEQSP .S1     A3,A12,A0         ; |129| 
           ABSSP   .S2X    A3,B5             ; |133| 
           CMPGTSP .S2     B5,B4,B0          ; |133| 
           MPYSP   .M1     A4,A6,A4          ; |127| 
           MVKL    .S2     _output+12,B5
           MVKH    .S2     _output+12,B5
           LDW     .D2T2   *B5,B5            ; |212| 
           MPYSP   .M1     A3,A4,A6          ; |127| 
           MVKH    .S2     0x42b2d4fc,B6
           NOP             2
           SUBSP   .L1     A5,A6,A5          ; |127| 
           ADD     .L2     B13,B5,B5         ; |212| 
           NOP             2
           MPYSP   .M1     A4,A5,A4          ; |127| 
           NOP             3
   [ A0]   MV      .L1     A12,A4            ; |130| 
   [ B0]   MV      .L1     A12,A4            ; |134| 
           ADDSP   .L1     A4,A3,A3          ; |213| 
           CMPGTSP .S2     B17,B6,B0         ; |216| 
           NOP             2

           BNOP    .S1     $C$L23,4          ; |213| 
||         MPYSP   .M1     A16,A3,A3         ; |213| 

           MV      .L2X    A3,B4             ; |213| Define a twin register
||         ZERO    .L1     A3

           ; BRANCH OCCURS {$C$L23}          ; |213| 
;** --------------------------------------------------------------------------*
$C$L21:    
;          EXCLUSIVE CPU CYCLES: 24

           MVKL    .S2     0x3ab60b61,B4
||         MVKL    .S1     0x37d00d01,A7
||         ZERO    .L2     B31

           MPYSP   .M1     A4,A4,A3          ; |172| 
||         MVKL    .S2     0x3d2aaaab,B5
||         MVKH    .S1     0x37d00d01,A7

           MVKH    .S2     0x3ab60b61,B4
||         MPYSP   .M1     A16,A4,A31        ; |172| 
||         MVKL    .S1     _t_start,A30

           MVKH    .S1     _t_start,A30
           MVKH    .S2     0x3d2aaaab,B5
           MPYSP   .M1     A3,A4,A6          ; |172| 

           MPYSP   .M1     A3,A3,A5          ; |172| 
||         MPYSP   .M2X    B5,A3,B5          ; |172| 

           STDW    .D1T1   A19:A18,*A30
           MVKL    .S2     0x42b2d4fc,B6
           MPYSP   .M1X    B4,A6,A3          ; |172| 
           MPYSP   .M1     A7,A5,A5          ; |172| 

           ADDSP   .L1X    B5,A31,A4         ; |172| 
||         MVKL    .S2     _output+12,B5

           MVKH    .S2     _output+12,B5
           LDW     .D2T2   *B5,B5            ; |212| 
           ADDSP   .L1     A3,A5,A3          ; |172| 
           MVKH    .S2     0x42b2d4fc,B6
           CMPGTSP .S2     B17,B6,B0         ; |216| 
           SET     .S2     B31,0x17,0x1d,B4

           BNOP    .S1     $C$L23,4          ; |172| 
||         ADDSP   .L1     A3,A4,A3          ; |172| 
||         ADD     .L2     B13,B5,B5         ; |212| 

           ADDSP   .L2X    B4,A3,B4          ; |172| 
||         ZERO    .L1     A3

           ; BRANCH OCCURS {$C$L23}          ; |172| 
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 4
           MV      .L1X    B17,A4            ; |205| 
           ADDKPC  .S2     $C$RL36,B3,1      ; |205| 
           STDW    .D1T1   A19:A18,*A3
$C$RL36:   ; CALL OCCURS {_expsp_coshsp_i} {0}  ; |205| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 8
           MVKL    .S2     _output+12,B5
           MVKH    .S2     _output+12,B5
           LDW     .D2T2   *B5,B5            ; |212| 
           MVKL    .S2     0x42b2d4fc,B6
           MVKH    .S2     0x42b2d4fc,B6
           CMPGTSP .S2     B17,B6,B0         ; |216| 
           ZERO    .L1     A3

           MV      .L2X    A4,B4             ; |205| 
||         ADD     .S2     B13,B5,B5         ; |212| 

;** --------------------------------------------------------------------------*
$C$L23:    
;          EXCLUSIVE CPU CYCLES: 21
           SET     .S1     A3,0x17,0x1e,A3
           NOP             2
   [ B0]   MV      .L2X    A3,B4             ; |217| 

           STW     .D2T2   B4,*B5            ; |212| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     _t_offset,A15
||         LDW     .D2T1   *+SP(12),A31      ; |128| 
||         MVKL    .S2     _cycle_counts+24,B5
||         MV      .L2     B4,B9             ; |128| 

           MVKH    .S1     _t_offset,A15
||         MVKH    .S2     _cycle_counts+24,B5
||         ADD     .L2     4,B13,B13         ; |206| 

           LDDW    .D1T1   *A15,A7:A6        ; |130| 
||         LDDW    .D2T2   *B5,B7:B6         ; |130| 
||         MVKL    .S1     _t_stop,A3

           MV      .L1X    B5,A14            ; |130| 
||         MVKH    .S1     _t_stop,A3

           STDW    .D1T2   B9:B8,*A3         ; |128| 
           SUB     .L1     A31,1,A0          ; |206| 
           STW     .D2T1   A0,*+SP(12)       ; |130| 
           ADDU    .L1     A6,A18,A5:A4      ; |130| 
           ADD     .L1     A5,A7,A5          ; |130| 

           SUBU    .L2X    B8,A4,B5:B4       ; |130| 
||         ADD     .L1     A5,A19,A4         ; |130| 
|| [ A0]   B       .S1     $C$L20            ; |206| 

           EXT     .S2     B5,24,24,B16      ; |130| 
||         ADDU    .L2     B6,B4,B5:B4       ; |130| 

   [ A0]   CALL    .S1     _gimme_random     ; |208| 
||         SUB     .L2X    B9,A4,B6          ; |130| 
||         ADD     .S2     B5,B7,B5          ; |130| 
|| [ A0]   MV      .L1     A13,A4            ; |208| 

           ADD     .L2     B6,B16,B6         ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D1T2   B5:B4,*A14        ; |130| 
|| [ A0]   ZERO    .L2     B4

           ; BRANCHCC OCCURS {$C$L20}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL37,B3,3      ; |135| 
$C$RL37:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           ZERO    .L1     A13
           SET     .S1     A13,0x15,0x1d,A13
           NOP             1
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             2
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL38:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
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

           ADD     .L2     B4,B5,B7          ; |117| 

           STDW    .D1T2   B7:B6,*A15        ; |117| 
||         MVK     .S1     0x80,A14

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
           LDW     .D1T1   *A3,A3            ; |221| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |221| 
||         CALL    .S1     _coshf            ; |221| 

           LDW     .D1T1   *A3,A4            ; |221| 
           ADDKPC  .S2     $C$RL39,B3,3      ; |221| 
$C$RL39:   ; CALL OCCURS {_coshf} {0}        ; |221| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output,B4
           MVKH    .S2     _output,B4
           LDW     .D2T2   *B4,B4            ; |221| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |221| 

           STW     .D1T1   A4,*A3            ; |221| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S2     _t_start,B4
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         MVKL    .S1     _cycle_counts,A3
||         SUB     .L1     A14,1,A0          ; |219| 
||         MV      .L2     B6,B17            ; |128| 

           MVKH    .S2     _t_start,B4
||         MVKH    .S1     _cycle_counts,A3
||         SUB     .L1     A14,1,A14         ; |219| 
||         ADD     .D1     4,A12,A12         ; |219| 

           LDDW    .D2T2   *B4,B9:B8         ; |130| 
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S2     _cycle_counts,B6
||         MVKL    .S1     _t_stop,A31

           MVKH    .S1     _t_stop,A31
           MVKH    .S2     _cycle_counts,B6
           STDW    .D1T2   B17:B16,*A31      ; |128| 
   [!A0]   MV      .L1X    B6,A14
           ADDU    .L2X    A4,B8,B5:B4       ; |130| 

           ADD     .S2X    B5,A5,B7          ; |130| 
|| [ A0]   B       .S1     $C$L24            ; |219| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .D2     B7,B9,B7          ; |130| 
||         EXT     .S2     B5,24,24,B8       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B7,B7         ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B7,B8,B7          ; |130| 
           ADD     .L2     B5,B7,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B6         ; |130| 

           ; BRANCHCC OCCURS {$C$L24}        ; |219| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL40,B3,3      ; |135| 
$C$RL40:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
$C$RL41:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
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
||         STW     .D2T1   A3,*+SP(12)       ; |117| 
||         MV      .S2X    A15,B7            ; |117| 

           STDW    .D2T2   B5:B4,*B7         ; |117| 
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
           LDW     .D1T1   *A3,A3            ; |230| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |230| 
||         CALL    .S1     _coshsp_c         ; |230| 

           LDW     .D1T1   *A3,A4            ; |230| 
           ADDKPC  .S2     $C$RL42,B3,3      ; |230| 
$C$RL42:   ; CALL OCCURS {_coshsp_c} {0}     ; |230| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output+8,B4
           MVKH    .S2     _output+8,B4
           LDW     .D2T2   *B4,B4            ; |230| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |230| 

           STW     .D1T1   A4,*A3            ; |230| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S2     _t_start,B4
||         LDW     .D2T1   *+SP(12),A30      ; |128| 
||         ADDAD   .D1     A14,2,A3
||         MV      .L2     B6,B17            ; |128| 
||         MVKL    .S1     _t_stop,A31
||         ADD     .L1     4,A12,A12         ; |228| 

           MVKH    .S2     _t_start,B4
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         MVKH    .S1     _t_stop,A31

           LDDW    .D2T2   *B4,B9:B8         ; |130| 
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVK     .S2     16,B13

           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADD     .L2X    A14,B13,B13
           SUB     .L1     A30,1,A0          ; |228| 
           STW     .D2T1   A0,*+SP(12)       ; |130| 
           ADDU    .L2X    A4,B8,B5:B4       ; |130| 

   [ A0]   B       .S1     $C$L25            ; |228| 
||         ADD     .S2X    B5,A5,B6          ; |130| 
||         SUBU    .L2     B16,B4,B5:B4      ; |130| 

           ADD     .D2     B6,B9,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B6,B6         ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L25}        ; |228| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(16),A5:A4   ; |135| 
           ADDKPC  .S2     $C$RL43,B3,3      ; |135| 
$C$RL43:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
           CALLP   .S2     __fixdlli,B3
$C$RL44:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 10

           STDW    .D1T1   A11:A10,*+A14(8)  ; |114| 
||         MV      .L2X    A10,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D2T1   A5:A4,*B13        ; |135| 

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
           LDW     .D1T1   *A3,A3            ; |239| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |239| 
||         CALL    .S1     _coshsp           ; |239| 

           LDW     .D1T1   *A3,A4            ; |239| 
           ADDKPC  .S2     $C$RL45,B3,3      ; |239| 
$C$RL45:   ; CALL OCCURS {_coshsp} {0}       ; |239| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output+4,B4
           MVKH    .S2     _output+4,B4
           LDW     .D2T2   *B4,B4            ; |239| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |239| 

           STW     .D1T1   A4,*A3            ; |239| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     _t_start,B4
||         LDW     .D2T1   *+SP(12),A30      ; |128| 
||         ADDAD   .D1     A14,1,A3
||         MV      .L2     B5,B17            ; |128| 
||         MVKL    .S1     _t_stop,A31
||         ADD     .L1     4,A12,A12         ; |237| 

           MVKH    .S2     _t_start,B4
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         MVKH    .S1     _t_stop,A31

           MV      .L2X    A3,B13            ; |128| 
||         LDDW    .D2T2   *B4,B7:B6         ; |130| 

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
           STDW    .D1T2   B17:B16,*A31      ; |128| 
           SUB     .L1     A30,1,A0          ; |237| 
           STW     .D2T1   A0,*+SP(12)       ; |130| 
           ADDU    .L2X    A4,B6,B9:B8       ; |130| 

           ADD     .S2X    B9,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L26            ; |237| 
||         SUBU    .L2     B16,B8,B5:B4      ; |130| 

           ADD     .D2     B6,B7,B6          ; |130| 
||         EXT     .S2     B5,24,24,B8       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B6,B7         ; |130| 
||         MV      .S2     B4,B6             ; |130| 
||         ADD     .D2X    B5,A7,B4          ; |130| 

           ADD     .L2     B7,B8,B5          ; |130| 
           ADD     .L2     B4,B5,B7          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B7:B6,*B13        ; |130| 

           ; BRANCHCC OCCURS {$C$L26}        ; |237| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A14(8),A5:A4    ; |135| 
           ADDKPC  .S2     $C$RL46,B3,3      ; |135| 
$C$RL46:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 114
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |135| 
           MV      .L1     A11,A12           ; |135| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL47:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 

           MV      .L2X    A10,B4            ; |114| 
||         MV      .L1X    B13,A12           ; |135| 
||         STDW    .D1T1   A11:A10,*+A14(32) ; |114| 

           STDW    .D1T1   A5:A4,*A12        ; |135| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3
           NOP             1
           MV      .L2X    A3,B13            ; |116| 

           STDW    .D2T2   B5:B4,*B13        ; |116| 
||         MVC     .S2     TSCL,B6           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3

           MV      .L1     A3,A10            ; |117| 
||         MVKL    .S1     _input,A3
||         SUBU    .L2     B6,B4,B7:B6       ; |117| 

           MVKH    .S1     _input,A3
||         SUB     .L2     B8,B5,B4          ; |117| 
||         EXT     .S2     B7,24,24,B5       ; |117| 

           ADD     .L2     B4,B5,B7          ; |117| 

           MV      .L2X    A3,B9             ; |246| 
||         STDW    .D1T2   B7:B6,*A15        ; |117| 

           CALLP   .S2     _coshsp_v,B3
||         LDW     .D2T1   *B9,A4            ; |246| 
||         LDW     .D1T2   *+A10(16),B4      ; |246| 
||         MVK     .S1     0x80,A6           ; |246| 

$C$RL48:   ; CALL OCCURS {_coshsp_v} {0}     ; |246| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         LDDW    .D2T2   *B13,B9:B8        ; |130| 

           MVK     .S2     24,B13
           ADD     .L2X    A12,B13,B13
           LDDW    .D2T2   *B13,B7:B6        ; |130| 
           MVKL    .S1     _t_stop,A3

           ADDU    .L1X    A4,B8,A7:A6       ; |130| 
||         MVKH    .S1     _t_stop,A3

           ADD     .S1     A7,A5,A6          ; |130| 
||         SUBU    .L1X    B16,A6,A5:A4      ; |130| 

           MV      .L2     B4,B17            ; |128| 
||         MV      .S2X    A3,B4             ; |128| 

           ADD     .L2X    A6,B9,B5          ; |130| 
||         EXT     .S1     A5,24,24,A3       ; |130| 

           ADDU    .L1X    B6,A4,A5:A4       ; |130| 
||         SUB     .L2     B17,B5,B5         ; |130| 

           ADD     .L2X    B5,A3,B5          ; |130| 
           ADD     .L2X    A5,B7,B6          ; |130| 

           STDW    .D2T2   B17:B16,*B4       ; |128| 
||         ADD     .L2     B6,B5,B4          ; |130| 

           NOP             1

           CALLP   .S2     __fltllif,B3
||         MV      .L1X    B4,A5             ; |130| 

$C$RL49:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1     A11,A12           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A13:A12,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL50:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           STDW    .D2T1   A5:A4,*B13        ; |130| 
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 

$C$RL51:   ; CALL OCCURS {_isequal} {0}      ; |66| 
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
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL52:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6

           STW     .D1T1   A4,*+A11(8)       ; |67| 
||         MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A10,A3            ; |68| 
||         LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL53:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3eb0c6f7,B7
           MVKL    .S2     0xa0b5ed8d,B6
           MVKH    .S2     0x3eb0c6f7,B7

           MV      .L1     A10,A3            ; |68| 
||         STW     .D1T1   A4,*+A11(12)      ; |68| 
||         MVKH    .S2     0xa0b5ed8d,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         LDW     .D2T2   *B12,B4           ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL54:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *B11,B0           ; |72| 
           STW     .D1T1   A4,*+A11(16)      ; |69| 
           NOP             3

   [!B0]   BNOP    .S1     $C$L27,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B10,B0           ; |72| 

   [ B1]   ADD     .L2     4,B10,B4
           ; BRANCHCC OCCURS {$C$L27}        ; |72| 
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
   [ A0]   B       .S1     $C$L28            ; |72| 
   [ A0]   CALL    .S1     _print_test_results ; |252| 
           MVK     .L1     0x1,A3            ; |72| 
   [ A0]   MVKL    .S1     _all_pass,A4
   [ A0]   MVKH    .S1     _all_pass,A4
           NOP             1
           ; BRANCHCC OCCURS {$C$L28}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L27:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |252| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           MV      .L1     A12,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L28:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |252| 
||         ADDKPC  .S2     $C$RL55,B3,0      ; |252| 

$C$RL55:   ; CALL OCCURS {_print_test_results} {0}  ; |252| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |253| 

$C$RL56:   ; CALL OCCURS {_printf} {0}       ; |253| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |253| 

$C$RL57:   ; CALL OCCURS {_printf} {0}       ; |253| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |260| 

$C$RL58:   ; CALL OCCURS {_print_profile_results} {0}  ; |260| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |263| 

$C$RL59:   ; CALL OCCURS {_print_memory_results} {0}  ; |263| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 11
           LDW     .D2T2   *++SP(24),B3      ; |264| 
           LDDW    .D2T1   *++SP,A13:A12     ; |264| 
           LDDW    .D2T1   *++SP,A15:A14     ; |264| 
           LDDW    .D2T2   *++SP,B11:B10     ; |264| 
           LDDW    .D2T2   *++SP,B13:B12     ; |264| 

           LDW     .D2T1   *++SP(8),A10      ; |264| 
||         RET     .S2     B3                ; |264| 

           LDW     .D2T1   *++SP(8),A11      ; |264| 
           NOP             4
           ; BRANCH OCCURS {B3}              ; |264| 
;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const:.string"
$C$SL1:	.string	"coshSP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_coshf
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_coshsp_c
	.global	_coshsp
	.global	_coshsp_v
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
