;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Mon May 16 23:51:54 2016                                *
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
	.word	06d6dc1a4h,0c01911e1h		; _a[0] @ 0
	.word	099a2d3d5h,0c021e882h		; _a[1] @ 64
	.word	02bf2cd12h,04022078ch		; _a[2] @ 128
	.word	040cc78eah,04020a865h		; _a[3] @ 192
	.word	0c1b46ad6h,03ffbef2eh		; _a[4] @ 256
	.word	0734571fah,0401d02aeh		; _a[5] @ 320
	.word	061035017h,0bfe11202h		; _a[6] @ 384
	.word	095f9d1e9h,0bff34e73h		; _a[7] @ 448
	.word	0b67eacaeh,0c00aea1fh		; _a[8] @ 512
	.word	08854cdb8h,0bfd3e247h		; _a[9] @ 576
	.word	02c1be7bdh,0c02165f7h		; _a[10] @ 640
	.word	03de7c21ch,040228784h		; _a[11] @ 704
	.word	0419babc3h,040096332h		; _a[12] @ 768
	.word	0e9bd9e5ch,0401c284ch		; _a[13] @ 832
	.word	01f36262dh,0c021aed7h		; _a[14] @ 896
	.word	0ce8a3c2fh,0c023548dh		; _a[15] @ 960
	.word	021484f24h,0c0232b7fh		; _a[16] @ 1024
	.word	0bebabb52h,0c020646ah		; _a[17] @ 1088
	.word	014b3156ch,0c022fa7fh		; _a[18] @ 1152
	.word	0094f341bh,0c008f2e3h		; _a[19] @ 1216
	.word	0698fe692h,0c01fa26dh		; _a[20] @ 1280
	.word	07853ceb4h,03ff3c62bh		; _a[21] @ 1344
	.word	0ca3a4b55h,0401424c1h		; _a[22] @ 1408
	.word	04deea05ch,04020491dh		; _a[23] @ 1472
	.word	0db36f2dbh,04016ff81h		; _a[24] @ 1536
	.word	0f4e519cbh,0401a8e50h		; _a[25] @ 1600
	.word	02cd8a61fh,0c014e6f2h		; _a[26] @ 1664
	.word	0df670344h,0401fd3cbh		; _a[27] @ 1728
	.word	0cb1465e9h,0c0184d2dh		; _a[28] @ 1792
	.word	0450acc0ch,0400f4fbah		; _a[29] @ 1856
	.word	04bdd4e24h,0401125d0h		; _a[30] @ 1920
	.word	0c7e9383dh,04010d670h		; _a[31] @ 1984
	.word	0c39d7922h,040099d6bh		; _a[32] @ 2048
	.word	0a6fc58ach,0c01a12b0h		; _a[33] @ 2112
	.word	04894c448h,0400217a2h		; _a[34] @ 2176
	.word	072e6a769h,040229d83h		; _a[35] @ 2240
	.word	0945df076h,04011cceah		; _a[36] @ 2304
	.word	033f19f14h,0bfd10ee4h		; _a[37] @ 2368
	.word	0ded4364eh,03ffe7e96h		; _a[38] @ 2432
	.word	0188cbec0h,03fc68b2ch		; _a[39] @ 2496
	.word	0ae5af1beh,0c01b7323h		; _a[40] @ 2560
	.word	088c967bdh,0c02086b0h		; _a[41] @ 2624
	.word	04f3fd934h,03fe94603h		; _a[42] @ 2688
	.word	037931444h,0c0006cc0h		; _a[43] @ 2752
	.word	06af2bd21h,040222fcah		; _a[44] @ 2816
	.word	04f8726d0h,04006213ah		; _a[45] @ 2880
	.word	06f5019f4h,03ff14d46h		; _a[46] @ 2944
	.word	0034d925ah,040203a50h		; _a[47] @ 3008
	.word	09051f23bh,0c00d2ae9h		; _a[48] @ 3072
	.word	0960a98e0h,0c0229d8fh		; _a[49] @ 3136
	.word	0b6fad370h,0402186bbh		; _a[50] @ 3200
	.word	02de0e3dbh,03fe119ebh		; _a[51] @ 3264
	.word	0ce7b22b6h,0400c6c27h		; _a[52] @ 3328
	.word	027dcbddch,0c003e147h		; _a[53] @ 3392
	.word	099cd9c00h,0c01475a3h		; _a[54] @ 3456
	.word	0e6d8e78dh,040232b6bh		; _a[55] @ 3520
	.word	07e6a692ah,0400b9ca1h		; _a[56] @ 3584
	.word	046dfb862h,04023816fh		; _a[57] @ 3648
	.word	0c34b43cbh,0c0176095h		; _a[58] @ 3712
	.word	01759b8d9h,0c0189b12h		; _a[59] @ 3776
	.word	071f5e6a2h,0c01a5c7eh		; _a[60] @ 3840
	.word	01ff3bb4eh,0bffca92dh		; _a[61] @ 3904
	.word	0427c7c52h,040191676h		; _a[62] @ 3968
	.word	02d051bc9h,0c00b56c9h		; _a[63] @ 4032
	.word	013795988h,0c014078dh		; _a[64] @ 4096
	.word	028b02272h,0bffdf6dbh		; _a[65] @ 4160
	.word	054195cc8h,0c013c41bh		; _a[66] @ 4224
	.word	03377fc91h,04013c259h		; _a[67] @ 4288
	.word	03d06f18ch,0c0177c40h		; _a[68] @ 4352
	.word	085e30370h,040228b19h		; _a[69] @ 4416
	.word	0584464b4h,040211843h		; _a[70] @ 4480
	.word	0d9e4e344h,0c0223140h		; _a[71] @ 4544
	.word	0e69fdcaah,03ff57f3fh		; _a[72] @ 4608
	.word	0e107ed34h,0c0127d76h		; _a[73] @ 4672
	.word	01fb902ebh,0bfde7a4bh		; _a[74] @ 4736
	.word	0ae388d0fh,0c022d390h		; _a[75] @ 4800
	.word	089a0fe12h,0c0211b0bh		; _a[76] @ 4864
	.word	0e12472a6h,040136b8ch		; _a[77] @ 4928
	.word	0856960edh,04012fa8eh		; _a[78] @ 4992
	.word	0c06abebbh,040118a7bh		; _a[79] @ 5056
	.word	0395c4220h,0400b077bh		; _a[80] @ 5120
	.word	00148d55ch,0c022e358h		; _a[81] @ 5184
	.word	058636e64h,04016426ah		; _a[82] @ 5248
	.word	0f0c2755bh,0c00467b6h		; _a[83] @ 5312
	.word	062e82ca5h,03fea9178h		; _a[84] @ 5376
	.word	078282fcah,04022ebafh		; _a[85] @ 5440
	.word	03012ed43h,0401f1e15h		; _a[86] @ 5504
	.word	04fe01224h,0bff050e8h		; _a[87] @ 5568
	.word	0d601ffb5h,0c020c1aah		; _a[88] @ 5632
	.word	0df5c1b8ah,04009ca2ch		; _a[89] @ 5696
	.word	066f5019fh,03ff77cd4h		; _a[90] @ 5760
	.word	00dae3e6ch,040045315h		; _a[91] @ 5824
	.word	0df23e766h,0401fbf5bh		; _a[92] @ 5888
	.word	0a0c43046h,0c0043602h		; _a[93] @ 5952
	.word	0a6ca03c5h,03fed615ch		; _a[94] @ 6016
	.word	00ea9e6efh,0401929b9h		; _a[95] @ 6080
	.word	022ee4192h,0401a394ch		; _a[96] @ 6144
	.word	064345cffh,04004ba3ch		; _a[97] @ 6208
	.word	065010b99h,040145cf8h		; _a[98] @ 6272
	.word	0ccf86bb7h,0c01d4b48h		; _a[99] @ 6336
$C$IR_1:	.set	800

	.sect	".cinit"
	.align	8
	.field  	$C$IR_2,32
	.field  	_b+0,32
	.word	000000000h,040390000h		; _b[0] @ 0
	.word	000000000h,040380000h		; _b[1] @ 64
	.word	000000000h,040390000h		; _b[2] @ 128
	.word	000000000h,0c0390000h		; _b[3] @ 192
	.word	000000000h,000000000h		; _b[4] @ 256
	.word	000000000h,040390000h		; _b[5] @ 320
	.word	000000000h,040390000h		; _b[6] @ 384
	.word	000000000h,040390000h		; _b[7] @ 448
	.word	000000000h,040390000h		; _b[8] @ 512
	.word	000000000h,040390000h		; _b[9] @ 576
	.word	000000000h,040390000h		; _b[10] @ 640
	.word	000000000h,040380000h		; _b[11] @ 704
	.word	000000000h,040390000h		; _b[12] @ 768
	.word	000000000h,0c0390000h		; _b[13] @ 832
	.word	000000000h,000000000h		; _b[14] @ 896
	.word	000000000h,040390000h		; _b[15] @ 960
	.word	000000000h,040390000h		; _b[16] @ 1024
	.word	000000000h,040390000h		; _b[17] @ 1088
	.word	000000000h,040390000h		; _b[18] @ 1152
	.word	000000000h,040390000h		; _b[19] @ 1216
	.word	000000000h,040390000h		; _b[20] @ 1280
	.word	000000000h,040380000h		; _b[21] @ 1344
	.word	000000000h,040390000h		; _b[22] @ 1408
	.word	000000000h,0c0390000h		; _b[23] @ 1472
	.word	000000000h,000000000h		; _b[24] @ 1536
	.word	000000000h,040390000h		; _b[25] @ 1600
	.word	000000000h,040390000h		; _b[26] @ 1664
	.word	000000000h,040390000h		; _b[27] @ 1728
	.word	000000000h,040390000h		; _b[28] @ 1792
	.word	000000000h,040390000h		; _b[29] @ 1856
	.word	000000000h,040390000h		; _b[30] @ 1920
	.word	000000000h,040380000h		; _b[31] @ 1984
	.word	000000000h,040390000h		; _b[32] @ 2048
	.word	000000000h,0c0390000h		; _b[33] @ 2112
	.word	000000000h,000000000h		; _b[34] @ 2176
	.word	000000000h,040390000h		; _b[35] @ 2240
	.word	000000000h,040390000h		; _b[36] @ 2304
	.word	000000000h,040390000h		; _b[37] @ 2368
	.word	000000000h,040390000h		; _b[38] @ 2432
	.word	000000000h,040390000h		; _b[39] @ 2496
	.word	000000000h,040390000h		; _b[40] @ 2560
	.word	000000000h,040380000h		; _b[41] @ 2624
	.word	000000000h,040390000h		; _b[42] @ 2688
	.word	000000000h,0c0390000h		; _b[43] @ 2752
	.word	000000000h,000000000h		; _b[44] @ 2816
	.word	000000000h,040390000h		; _b[45] @ 2880
	.word	000000000h,040390000h		; _b[46] @ 2944
	.word	000000000h,040390000h		; _b[47] @ 3008
	.word	000000000h,040390000h		; _b[48] @ 3072
	.word	000000000h,040390000h		; _b[49] @ 3136
	.word	000000000h,040390000h		; _b[50] @ 3200
	.word	000000000h,040380000h		; _b[51] @ 3264
	.word	000000000h,040390000h		; _b[52] @ 3328
	.word	000000000h,0c0390000h		; _b[53] @ 3392
	.word	000000000h,000000000h		; _b[54] @ 3456
	.word	000000000h,040390000h		; _b[55] @ 3520
	.word	000000000h,040390000h		; _b[56] @ 3584
	.word	000000000h,040390000h		; _b[57] @ 3648
	.word	000000000h,040390000h		; _b[58] @ 3712
	.word	000000000h,040390000h		; _b[59] @ 3776
	.word	000000000h,040390000h		; _b[60] @ 3840
	.word	000000000h,040380000h		; _b[61] @ 3904
	.word	000000000h,040390000h		; _b[62] @ 3968
	.word	000000000h,0c0390000h		; _b[63] @ 4032
	.word	000000000h,000000000h		; _b[64] @ 4096
	.word	000000000h,040390000h		; _b[65] @ 4160
	.word	000000000h,040390000h		; _b[66] @ 4224
	.word	000000000h,040390000h		; _b[67] @ 4288
	.word	000000000h,040390000h		; _b[68] @ 4352
	.word	000000000h,040390000h		; _b[69] @ 4416
	.word	000000000h,040390000h		; _b[70] @ 4480
	.word	000000000h,040380000h		; _b[71] @ 4544
	.word	000000000h,040390000h		; _b[72] @ 4608
	.word	000000000h,0c0390000h		; _b[73] @ 4672
	.word	000000000h,000000000h		; _b[74] @ 4736
	.word	000000000h,040390000h		; _b[75] @ 4800
	.word	000000000h,040390000h		; _b[76] @ 4864
	.word	000000000h,040390000h		; _b[77] @ 4928
	.word	000000000h,040390000h		; _b[78] @ 4992
	.word	000000000h,040390000h		; _b[79] @ 5056
	.word	000000000h,040390000h		; _b[80] @ 5120
	.word	000000000h,040380000h		; _b[81] @ 5184
	.word	000000000h,040390000h		; _b[82] @ 5248
	.word	000000000h,0c0390000h		; _b[83] @ 5312
	.word	000000000h,000000000h		; _b[84] @ 5376
	.word	000000000h,040390000h		; _b[85] @ 5440
	.word	000000000h,040390000h		; _b[86] @ 5504
	.word	000000000h,040390000h		; _b[87] @ 5568
	.word	000000000h,040390000h		; _b[88] @ 5632
	.word	000000000h,040390000h		; _b[89] @ 5696
	.word	000000000h,040390000h		; _b[90] @ 5760
	.word	000000000h,040380000h		; _b[91] @ 5824
	.word	000000000h,040390000h		; _b[92] @ 5888
	.word	000000000h,0c0390000h		; _b[93] @ 5952
	.word	000000000h,000000000h		; _b[94] @ 6016
	.word	000000000h,040390000h		; _b[95] @ 6080
	.word	000000000h,040390000h		; _b[96] @ 6144
	.word	000000000h,040390000h		; _b[97] @ 6208
	.word	000000000h,040390000h		; _b[98] @ 6272
	.word	000000000h,040390000h		; _b[99] @ 6336
$C$IR_2:	.set	800

	.global	_a
_a:	.usect	".far",800,8
	.global	_b
_b:	.usect	".far",800,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\027764 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\027766 
	.sect	".text:optci"
	.clink

;******************************************************************************
;* FUNCTION NAME: logdpMod_powdpi                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,A5,A6,A7,A8,A9,B4,B5,B6,B7,B8,B9,A16,A17,*
;*                           A18,A19,B16,B17,B18,B19                          *
;*   Regs Used         : A0,A1,A3,A4,A5,A6,A7,A8,A9,B3,B4,B5,B6,B7,B8,B9,A16, *
;*                           A17,A18,A19,B16,B17,B18,B19                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_logdpMod_powdpi:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 322
           CLR     .S1     A5,20,31,A3       ; |86| 
           EXTU    .S1     A5,1,21,A1        ; |81| 

           SET     .S1     A3,21,29,A17      ; |86| 
||         MV      .L1     A4,A16            ; |86| 

   [!A1]   ZERO    .L1     A17:A16           ; |89| 
||         ZERO    .L2     B7

           ZERO    .L2     B6                ; |97| 
           SET     .S2     B7,0x15,0x1d,B7
           SUBDP   .L2X    A17:A16,B7:B6,B5:B4 ; |97| 
           MV      .S2     B7,B17            ; |98| 
           ZERO    .L2     B16               ; |97| 
           MVKL    .S1     0x667f3bcd,A6
           MPYDP   .M1X    B17:B16,A17:A16,A9:A8 ; |94| 
           MVKL    .S1     0x3fe6a09e,A7
           MVKH    .S1     0x667f3bcd,A6
           MPYDP   .M2     B7:B6,B5:B4,B9:B8 ; |98| 
           MVKH    .S1     0x3fe6a09e,A7
           CMPGTDP .S1     A17:A16,A7:A6,A0  ; |92| 
           NOP             7
           ADDDP   .L2     B7:B6,B9:B8,B9:B8 ; |98| 
           NOP             1
   [ A0]   ADDDP   .L2X    B17:B16,A9:A8,B9:B8 ; |94| 
           ZERO    .L1     A9
           SET     .S1     A9,0x1e,0x1e,A9
           MV      .L1X    B6,A8             ; |103| 
           NOP             3
           RCPDP   .S2     B9:B8,B17:B16     ; |103| 
           NOP             1
           MPYDP   .M2     B9:B8,B17:B16,B19:B18 ; |103| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A9:A8,B19:B18,A7:A6 ; |103| 
           NOP             6
           MPYDP   .M1X    B17:B16,A7:A6,A7:A6 ; |103| 
           NOP             9
           MPYDP   .M1X    B9:B8,A7:A6,A19:A18 ; |103| 
           MVKL    .S2     0x4030624a,B17
           MVKL    .S2     0x2016afed,B16
           MVKH    .S2     0x4030624a,B17
           MVKH    .S2     0x2016afed,B16
           NOP             5
           SUBDP   .L1     A9:A8,A19:A18,A19:A18 ; |103| 
           NOP             6
           MPYDP   .M1     A7:A6,A19:A18,A19:A18 ; |103| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B9:B8,A19:A18,B9:B8 ; |103| 
           MV      .L1X    B7,A7             ; |98| 
           MV      .L1     A8,A6             ; |103| 
           SUBDP   .L1     A17:A16,A7:A6,A7:A6 ; |93| 
           NOP             6
           SUBDP   .L2X    A9:A8,B9:B8,B9:B8 ; |103| 
           NOP             6
           MPYDP   .M2X    A19:A18,B9:B8,B9:B8 ; |103| 
           NOP             3
   [ A0]   SUBDP   .L2X    A7:A6,B7:B6,B5:B4 ; |93| 
           MVKL    .S1     0x40738083,A7
           MVKL    .S1     0xfa15267e,A6
           MVKH    .S1     0x40738083,A7
           MVKH    .S1     0xfa15267e,A6
           NOP             2
           MPYDP   .M2     B5:B4,B9:B8,B7:B6 ; |103| 
           NOP             9
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |103| 
           MVKL    .S2     0xc041d580,B9
           MVKL    .S2     0x4b67ce0f,B8
           MVKH    .S2     0xc041d580,B9
           MVKH    .S2     0x4b67ce0f,B8
           NOP             5
           ADDDP   .L2     B9:B8,B5:B4,B9:B8 ; |53| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           NOP             9
           NOP             1
           ADDDP   .L1X    A7:A6,B9:B8,A7:A6 ; |53| 
           MV      .L2X    A9,B9             ; |103| 
           MV      .L2X    A8,B8             ; |53| 
           NOP             4
           MPYDP   .M1X    B5:B4,A7:A6,A17:A16 ; |53| 
           NOP             5
           MVKL    .S1     0xc0880bfe,A7
           MVKL    .S1     0x9c0d9077,A6
           MVKH    .S1     0xc0880bfe,A7
           MVKH    .S1     0x9c0d9077,A6
           ADDDP   .L1     A7:A6,A17:A16,A7:A6 ; |53| 
           NOP             6
           RCPDP   .S1     A7:A6,A17:A16     ; |53| 
           NOP             1
           MPYDP   .M1     A17:A16,A7:A6,A19:A18 ; |53| 
           NOP             9
           SUBDP   .L1X    B9:B8,A19:A18,A19:A18 ; |53| 
           MVKL    .S2     0xbfe94415,B9
           MVKL    .S2     0xb356bd29,B8
           MVKH    .S2     0xbfe94415,B9
           MVKH    .S2     0xb356bd29,B8
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |53| 
           NOP             1
           MPYDP   .M1     A17:A16,A19:A18,A17:A16 ; |53| 
           NOP             9
           MPYDP   .M1     A17:A16,A7:A6,A19:A18 ; |53| 
           ADDDP   .L2     B17:B16,B9:B8,B9:B8 ; |53| 
           NOP             8
           SUBDP   .L1     A9:A8,A19:A18,A19:A18 ; |53| 
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |53| 
           NOP             5
           MPYDP   .M1     A17:A16,A19:A18,A17:A16 ; |53| 
           NOP             9
           MPYDP   .M1     A17:A16,A7:A6,A7:A6 ; |53| 
           NOP             9
           SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |53| 
           MVKL    .S1     0xc05007ff,A9
           MVKL    .S1     0x12b3b59a,A8
           MVKH    .S1     0xc05007ff,A9
           MVKH    .S1     0x12b3b59a,A8
           NOP             2
           MPYDP   .M1     A17:A16,A7:A6,A7:A6 ; |53| 
           ADDDP   .L2X    A9:A8,B9:B8,B9:B8 ; |53| 
           NOP             9
           MPYDP   .M2X    B9:B8,A7:A6,B9:B8 ; |53| 
           NOP             9
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |107| 
           MVKL    .S1     0xbf2bd010,A7
           MVKL    .S1     0x5c610ca8,A6
           MVK     .S2     1022,B8           ; |81| 
           MVKH    .S1     0xbf2bd010,A7
           SUB     .L1X    A1,B8,A3          ; |81| 
   [!A0]   SUB     .L1     A3,1,A3           ; |99| 
           INTDP   .L1     A3,A9:A8          ; |109| 
           MVKH    .S1     0x5c610ca8,A6
           NOP             1
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |107| 
           NOP             5
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |109| 
           NOP             3
           ADDDP   .L2     B5:B4,B7:B6,B7:B6 ; |107| 
           MVKL    .S2     0x3fe63000,B5

           MVKH    .S2     0x3fe63000,B5
||         ZERO    .L2     B4                ; |109| 

           MPYDP   .M2X    B5:B4,A9:A8,B5:B4 ; |109| 
           NOP             3
           ADDDP   .L2X    B7:B6,A7:A6,B7:B6 ; |109| 
           NOP             6
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |109| 
           MVKL    .S2     0x7fefffff,B7
           MVKH    .S2     0x7fefffff,B7
           MVK     .L2     0xffffffff,B6     ; |111| 
           NOP             1
           CMPGTDP .S1X    A5:A4,B7:B6,A0    ; |111| 
           NOP             1
   [ A0]   MVKL    .S2     0xfefa39ef,B4
           RET     .S2     B3                ; |116| 
   [ A0]   MVKL    .S2     0x40862e42,B5
   [ A0]   MVKH    .S2     0xfefa39ef,B4
   [ A0]   MVKH    .S2     0x40862e42,B5
           MV      .L1X    B4,A4             ; |115| 
           MV      .L1X    B5,A5             ; |115| 
           ; BRANCH OCCURS {B3}              ; |116| 
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
;*   Local Frame Size  : 8 Args + 164 Auto + 56 Save = 228 byte               *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           STW     .D2T1   A11,*SP--(8)      ; |113| 
           STW     .D2T1   A10,*SP--(8)      ; |113| 
           STDW    .D2T2   B13:B12,*SP--     ; |113| 
           STDW    .D2T2   B11:B10,*SP--     ; |113| 
           STDW    .D2T1   A15:A14,*SP--     ; |113| 
           STDW    .D2T1   A13:A12,*SP--     ; |113| 
           STW     .D2T2   B3,*SP--(8)       ; |113| 

           MVKL    .S1     $C$SL1+0,A4
||         ADDK    .S2     -176,SP           ; |113| 

           CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL0:    ; CALL OCCURS {_driver_init} {0}  ; |122| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 9
           MVKL    .S1     _a,A10

           MVKL    .S2     _b,B10
||         MVKL    .S1     _output,A14

           MVKH    .S1     _a,A10
||         MVK     .S2     0x64,B4

           MVKH    .S2     _b,B10
||         MVKH    .S1     _output,A14

           MV      .L2     B10,B11
||         MV      .L1     A10,A12
||         CALL    .S1     _pow              ; |131| 
||         LDW     .D1T1   *A14,A11

           LDDW    .D1T1   *A12++,A5:A4      ; |131| 
||         MV      .L1X    B4,A13
||         LDDW    .D2T2   *B11++,B5:B4      ; |131| 

           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L1:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL1,B3,0       ; |131| 
$C$RL1:    ; CALL OCCURS {_pow} {0}          ; |131| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A13,1,A0          ; |130| 
||         STDW    .D1T1   A5:A4,*A11++      ; |131| 
||         SUB     .S1     A13,1,A13         ; |130| 

   [ A0]   LDDW    .D2T2   *B11++,B5:B4      ; |131| 
|| [!A0]   ADD     .L2X    4,A14,B4
|| [!A0]   MV      .L1     A10,A15
|| [!A0]   MV      .S2     B10,B12
|| [ A0]   B       .S1     $C$L1             ; |130| 

   [ A0]   CALL    .S1     _pow              ; |131| 
   [ A0]   LDDW    .D1T1   *A12++,A5:A4      ; |131| 
   [!A0]   MVK     .S1     0x64,A11
   [!A0]   ZERO    .L2     B11
   [!A0]   STW     .D2T2   B4,*+SP(28)
           ; BRANCHCC OCCURS {$C$L1}         ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     _powdp            ; |134| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L2:    
;          EXCLUSIVE CPU CYCLES: 5

           LDDW    .D1T1   *A10++,A5:A4      ; |134| 
||         LDDW    .D2T2   *B10++,B5:B4      ; |134| 

           ADDKPC  .S2     $C$RL2,B3,3       ; |134| 
$C$RL2:    ; CALL OCCURS {_powdp} {0}        ; |134| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(28),B4       ; |134| 
           SUB     .L1     A11,1,A0          ; |133| 
           SUB     .L1     A11,1,A11         ; |133| 
           NOP             2
           LDW     .D2T2   *B4,B4            ; |134| 
   [ A0]   BNOP    .S1     $C$L2,3           ; |133| 

           ADD     .L2     B11,B4,B4         ; |134| 
||         ADD     .S2     8,B11,B11         ; |133| 

   [ A0]   CALL    .S1     _powdp            ; |134| 
||         STDW    .D2T1   A5:A4,*B4         ; |134| 

           ; BRANCHCC OCCURS {$C$L2}         ; |133| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           LDW     .D2T2   *+SP(28),B4
           MV      .L2     B12,B11
           MV      .L1     A15,A11
           MVK     .S1     0x64,A10
           ZERO    .L2     B10
           ADD     .L2     4,B4,B4

           STW     .D2T2   B4,*+SP(32)
||         CALL    .S1     _powdp_c          ; |137| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 5

           LDDW    .D1T1   *A11++,A5:A4      ; |137| 
||         LDDW    .D2T2   *B11++,B5:B4      ; |137| 

           ADDKPC  .S2     $C$RL3,B3,3       ; |137| 
$C$RL3:    ; CALL OCCURS {_powdp_c} {0}      ; |137| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           LDW     .D2T2   *+SP(32),B4       ; |137| 
||         SUB     .L1     A10,1,A0          ; |136| 
||         SUB     .S1     A10,1,A10         ; |136| 

   [!A0]   LDW     .D2T1   *+SP(32),A21
|| [!A0]   ZERO    .L1     A3
|| [!A0]   ZERO    .S1     A23
|| [!A0]   ZERO    .D1     A22

   [!A0]   SET     .S1     A3,0x1e,0x1e,A3

   [!A0]   STW     .D2T1   A3,*+SP(68)       ; |153| 
|| [!A0]   MV      .L1     A3,A25
|| [!A0]   MV      .S1     A3,A29            ; |153| 

   [!A0]   SET     .S1     A23,0x14,0x1d,A3
           LDW     .D2T2   *B4,B4            ; |137| 
   [ A0]   BNOP    .S1     $C$L3,3           ; |136| 

           ADD     .L2     B10,B4,B4         ; |137| 
||         ADD     .S2     8,B10,B10         ; |136| 

   [ A0]   CALL    .S1     _powdp_c          ; |137| 
||         STDW    .D2T1   A5:A4,*B4         ; |137| 
|| [!A0]   ZERO    .L2     B4

           ; BRANCHCC OCCURS {$C$L3}         ; |136| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19

           STW     .D2T1   A3,*+SP(20)       ; |188| 
||         SET     .S1     A22,0x14,0x1e,A3
||         MVKL    .S2     0xc086232b,B31
||         ZERO    .L1     A28
||         ZERO    .D1     A5
||         ZERO    .L2     B1

           MVKL    .S2     0xdd7abcd2,B30
||         MVKL    .S1     0x40862e42,A31
||         STW     .D2T1   A3,*+SP(16)
||         ADD     .L1     4,A21,A3
||         ZERO    .L2     B26

           MVKL    .S2     0x3fac718e,B29
||         MVKL    .S1     0xfefa39cc,A30
||         STW     .D2T1   A3,*+SP(88)
||         ZERO    .L2     B24

           MVKL    .S2     0x714251b3,B28
||         MVKL    .S1     0x3f7c70e4,A26
||         STW     .D2T1   A5,*+SP(12)
||         SUB     .L2     B12,8,B22

           MVKL    .S2     0x3fe63000,B27
||         MVKL    .S1     0x6fb3f6e0,A24

           MVKL    .S2     0x3ff71547,B25
||         MVKH    .S1     0x40862e42,A31

           MVKL    .S2     0x652b82fe,B23
||         MVKH    .S1     0xfefa39cc,A30
||         STW     .D2T1   A31,*+SP(76)      ; |156| 
||         SUB     .L1     A15,8,A31

           SET     .S2     B4,0x15,0x1d,B4
||         MVKH    .S1     0x3f7c70e4,A26
||         STW     .D2T1   A30,*+SP(72)      ; |156| 
||         ZERO    .L1     A30

           MVKH    .S2     0xc086232b,B31
||         MVKH    .S1     0x6fb3f6e0,A24
||         STW     .D2T1   A26,*+SP(52)      ; |147| 
||         ZERO    .L1     A26

           MVKH    .S2     0xdd7abcd2,B30
||         MVKH    .S1     0x3fd00000,A28
||         STW     .D2T2   B31,*+SP(84)      ; |161| 
||         MV      .L1X    B4,A27            ; |153| 

           MVKH    .S2     0x3fac718e,B29
||         MVKL    .S1     0x3ef152a4,A11
||         STW     .D2T2   B30,*+SP(80)      ; |161| 

           MVKH    .S2     0x714251b3,B28
||         MVKL    .S1     0x6f58dc1c,A10
||         STW     .D2T2   B29,*+SP(64)      ; |148| 
||         ZERO    .L2     B29

           MVKH    .S2     0x3fe63000,B27
||         MVKL    .S1     0xbf2bd010,A13
||         STW     .D2T2   B28,*+SP(60)      ; |148| 
||         ZERO    .L2     B28

           MVKH    .S2     0x3ff71547,B25
||         MVKL    .S1     0x5c610ca8,A12
||         STW     .D2T2   B27,*+SP(40)      ; |147| 
||         ZERO    .L2     B27

           MVKH    .S2     0x652b82fe,B23
||         STW     .D2T2   B25,*+SP(36)      ; |147| 
||         MVKH    .S1     0x3ef152a4,A11

           MVKL    .S2     0x3f403f99,B11
||         STW     .D2T1   A24,*+SP(48)      ; |147| 
||         MVKH    .S1     0x6f58dc1c,A10
||         ZERO    .L1     A24

           MVKL    .S2     0x6fde3809,B10
||         STW     .D2T2   B23,*+SP(24)      ; |147| 
||         MVK     .L2     0xffffffff,B23    ; |195| 
||         MVKH    .S1     0xbf2bd010,A13

           STW     .D2T1   A28,*+SP(44)      ; |147| 
||         MVKH    .S2     0x3f403f99,B11
||         MVKH    .S1     0x5c610ca8,A12
||         ZERO    .L1     A28

           STW     .D2T2   B4,*+SP(56)       ; |148| 
||         MVKH    .S2     0x6fde3809,B10
||         MVK     .S1     0x64,A2

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 8
           LDDW    .D1T1   *++A31,A21:A20    ; |140| 
           LDDW    .D2T2   *++B22,B21:B20    ; |140| 
           CALL    .S1     _logdpMod_powdpi  ; |187| 
           ADDKPC  .S2     $C$RL4,B3,1       ; |187| 
           ABSDP   .S1     A21:A20,A23:A22   ; |187| 
           NOP             1

           MV      .L1     A23,A5            ; |187| 
||         MV      .S1     A22,A4            ; |187| 

$C$RL4:    ; CALL OCCURS {_logdpMod_powdpi} {0}  ; |187| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 246
           MPYDP   .M2X    B21:B20,A5:A4,B5:B4 ; |187| 
           LDW     .D2T1   *+SP(20),A5
           LDW     .D2T2   *+SP(36),B7       ; |192| 
           LDW     .D2T2   *+SP(24),B6       ; |192| 
           MV      .L1X    B1,A4
           LDW     .D2T2   *+SP(40),B9
           CMPEQDP .S1     A23:A22,A5:A4,A0  ; |188| 
           MV      .L2     B29,B8
           LDW     .D2T1   *+SP(52),A17      ; |148| 
           LDW     .D2T1   *+SP(48),A16      ; |148| 
   [ A0]   ZERO    .L2     B5:B4             ; |189| 
           MPYDP   .M2     B7:B6,B5:B4,B7:B6 ; |147| 
           DPINT   .L2     B21:B20,B17       ; |178| 
           SUB     .L1     A2,1,A2           ; |139| 
           MVK     .S2     0x400,B25
   [!A2]   MV      .S2X    A14,B13
           EXTU    .S2     B17,31,31,B2      ; |180| 
           ZERO    .L1     A23
           LDW     .D2T1   *+SP(88),A1       ; |198| 
           NOP             2
           DPINT   .L2     B7:B6,B16         ; |147| 
           NOP             3
           INTDP   .L2     B16,B7:B6         ; |147| 
           NOP             4
           MPYDP   .M2     B9:B8,B7:B6,B9:B8 ; |147| 
           MPYDP   .M1X    A13:A12,B7:B6,A5:A4 ; |147| 
           NOP             8
           SUBDP   .L2     B5:B4,B9:B8,B7:B6 ; |147| 
           LDW     .D2T2   *+SP(64),B9
           LDW     .D2T2   *+SP(60),B8
           NOP             5
           SUBDP   .L1X    B7:B6,A5:A4,A7:A6 ; |147| 
           NOP             6
           MPYDP   .M1     A7:A6,A7:A6,A5:A4 ; |147| 
           NOP             9
           MPYDP   .M1     A11:A10,A5:A4,A9:A8 ; |147| 
           MPYDP   .M2X    B11:B10,A5:A4,B7:B6 ; |148| 
           NOP             8
           ADDDP   .L1     A17:A16,A9:A8,A9:A8 ; |147| 
           ADDDP   .L2     B9:B8,B7:B6,B7:B6 ; |148| 
           MV      .S2     B27,B8
           MV      .L2X    A27,B9
           NOP             3
           MPYDP   .M1     A5:A4,A9:A8,A9:A8 ; |147| 
           MPYDP   .M2X    A5:A4,B7:B6,B7:B6 ; |148| 
           LDW     .D2T1   *+SP(44),A5       ; |148| 
           NOP             6
           MV      .L1X    B28,A4            ; |148| 
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |147| 
           ADDDP   .L2     B9:B8,B7:B6,B7:B6 ; |148| 
           NOP             5
           MPYDP   .M1     A7:A6,A5:A4,A17:A16 ; |147| 
           NOP             9
           SUBDP   .L1X    B7:B6,A17:A16,A7:A6 ; |148| 
           MV      .S1     A29,A5
           MV      .L1X    B26,A4
           LDW     .D2T2   *+SP(84),B7       ; |192| 
           ADD     .L2     B25,B16,B6        ; |153| 
           SHL     .S2     B6,20,B25         ; |153| 
           LDW     .D2T2   *+SP(80),B6       ; |192| 
           RCPDP   .S1     A7:A6,A9:A8       ; |153| 
           NOP             1
           MPYDP   .M1     A7:A6,A9:A8,A19:A18 ; |153| 
           NOP             9
           SUBDP   .L1     A5:A4,A19:A18,A5:A4 ; |153| 
           NOP             6
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |153| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A9:A8 ; |153| 
           NOP             9
           SUBDP   .L1     A29:A28,A9:A8,A9:A8 ; |153| 
           NOP             6
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |153| 
           NOP             9
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |153| 
           ZERO    .L1     A9:A8             ; |180| 
           CMPLTDP .S1     A21:A20,A9:A8,A3  ; |180| 
           NOP             7
           SUBDP   .L1     A25:A24,A7:A6,A7:A6 ; |153| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |153| 
           INTDP   .L1X    B17,A7:A6         ; |180| 
           NOP             8
           MPYDP   .M1     A17:A16,A5:A4,A5:A4 ; |153| 
           CMPEQDP .S1X    B21:B20,A7:A6,A6  ; |180| 
           LDW     .D2T1   *+SP(76),A7       ; |192| 
           AND     .L1     A6,A3,A3          ; |180| 
           LDW     .D2T1   *+SP(72),A6       ; |192| 
           AND     .L2X    B2,A3,B0          ; |180| 
           MVK     .L1     0x1,A3            ; |176| 
   [ B0]   MV      .L1X    B23,A3            ; |176| 
           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |161| 
           INTDP   .L2     B17,B7:B6         ; |194| 
           ADDDP   .L1     A27:A26,A5:A4,A5:A4 ; |153| 
           CMPGTDP .S1X    B5:B4,A7:A6,A0    ; |156| 
           NOP             6
           MPYDP   .M2X    B25:B24,A5:A4,B9:B8 ; |153| 
           CMPEQDP .S2     B21:B20,B7:B6,B31 ; |194| 
           ZERO    .L2     B7:B6             ; |194| 
           INTDP   .L1     A3,A5:A4          ; |192| 
           CMPLTDP .S2X    A21:A20,B7:B6,B6  ; |194| 
           LDW     .D1T1   *A1,A3            ; |140| 
           XOR     .L2     1,B31,B30         ; |194| 
           NOP             3

   [ A0]   MVKL    .S2     0x7fefffff,B9
|| [ A0]   MV      .L2     B23,B8            ; |157| 

   [ A0]   MVKH    .S2     0x7fefffff,B9
   [ B0]   ZERO    .L2     B9:B8             ; |162| 
           MPYDP   .M2X    B9:B8,A5:A4,B5:B4 ; |192| 
           ADD     .L1     A30,A3,A3         ; |140| 
           ADD     .L1     8,A30,A30         ; |139| 

           ZERO    .L2     B9:B8             ; |198| 
||         ZERO    .L1     A5:A4             ; |198| 

           CMPEQDP .S2X    A21:A20,B9:B8,B8  ; |198| 
           CMPLTDP .S1X    B21:B20,A5:A4,A4  ; |198| 
           AND     .L2     B30,B6,B0         ; |194| 
           AND     .L1X    A4,B8,A0          ; |198| 
           SET     .S1     A23,0x0,0x1e,A4
           NOP             1

   [ A2]   BNOP    .S1     $C$L4,3           ; |139| 
|| [ B0]   MV      .L2X    A4,B5             ; |195| 
|| [ A0]   LDW     .D2T2   *+SP(16),B5       ; |199| 
|| [ B0]   MV      .S2     B23,B4            ; |195| 

   [ A0]   MV      .L2     B24,B4            ; |195| 

   [!A2]   CALL    .S1     _powdp_v          ; |142| 
||         STDW    .D1T2   B5:B4,*A3         ; |140| 

           ; BRANCHCC OCCURS {$C$L4}         ; |139| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T1   *+B13(16),A6      ; |142| 
           MVK     .S2     0x64,B6           ; |142| 
           MV      .L2     B12,B4            ; |142| 
           MV      .L1     A15,A4            ; |142| 
           ADDKPC  .S2     $C$RL5,B3,0       ; |142| 
$C$RL5:    ; CALL OCCURS {_powdp_v} {0}      ; |142| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B13,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B13(4),B4       ; |66| 
||         MVK     .S1     0x64,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL6:    ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B13(8),B4       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B13,A4           ; |67| 
||         MVK     .S1     0x64,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL7:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A14,A4           ; |68| 
||         LDW     .D2T2   *+B13(12),B4      ; |68| 
||         MVK     .S1     0x64,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL8:    ; CALL OCCURS {_isequal} {0}      ; |68| 

           LDW     .D2T1   *+SP(88),A3       ; |68| 
||         MVKL    .S2     _fcn_pass,B4

           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B4

           STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           ADD     .L1     4,A3,A3
||         LDW     .D1T1   *A14,A4           ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         STW     .D2T1   A3,*+SP(92)
||         MVK     .S1     0x64,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL9:    ; CALL OCCURS {_isequal} {0}      ; |69| 
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
           STW     .D2T2   B4,*+SP(100)      ; |69| 
           STW     .D2T1   A3,*+SP(96)

   [!A0]   B       .S1     $C$L5             ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |146| 
   [!A0]   ZERO    .L1     A3                ; |72| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S1     _all_pass,A4
   [!A0]   MVKH    .S1     _all_pass,A4
           ; BRANCHCC OCCURS {$C$L5}         ; |72| 
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
           CALL    .S1     _print_test_results ; |146| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x1,A4            ; |146| 
||         ADDKPC  .S2     $C$RL10,B3,0      ; |146| 

$C$RL10:   ; CALL OCCURS {_print_test_results} {0}  ; |146| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 19
           LDW     .D2T1   *+SP(20),A4       ; |153| 
           LDW     .D2T1   *+SP(16),A5
           MVKL    .S1     _a_sc,A3
           ZERO    .L1     A7
           MVKL    .S2     _b_sc,B17
           STW     .D2T1   A4,*+SP(104)      ; |157| 

           MVKH    .S1     0xfff00000,A7
||         LDW     .D2T1   *+SP(12),A4

           MVKH    .S1     _a_sc,A3
||         MVKH    .S2     _b_sc,B17
||         ZERO    .L2     B9
||         ZERO    .L1     A6                ; |156| 

           MVKH    .S2     0xbff00000,B9
||         ZERO    .L2     B8                ; |158| 
||         STDW    .D2T1   A7:A6,*+B17(24)   ; |156| 

           MV      .L2X    A3,B16            ; |153| 
||         STDW    .D2T2   B9:B8,*+B17(40)   ; |158| 

           STDW    .D2T1   A7:A6,*+B16(24)   ; |156| 

           STDW    .D2T1   A5:A4,*+B16(16)   ; |155| 
||         ZERO    .L2     B4

           STDW    .D2T1   A5:A4,*+B17(16)   ; |155| 
||         SET     .S2     B4,0x0,0x1e,B4

           LDW     .D2T1   *+SP(104),A5      ; |155| 
||         ADD     .L2     1,B4,B5
||         MV      .S2X    A4,B4

           STDW    .D2T2   B5:B4,*+B16(8)    ; |154| 

           STDW    .D2T2   B5:B4,*+B17(8)    ; |154| 
||         ZERO    .L2     B5:B4             ; |153| 

           STDW    .D2T2   B5:B4,*B16        ; |153| 

           STDW    .D2T2   B5:B4,*B17        ; |153| 
||         MVK     .L2     0x6,B5            ; |161| 
||         MVK     .L1     0x5,A1            ; |160| 

           STDW    .D2T1   A5:A4,*+B16(32)   ; |157| 
||         MVC     .S2     B5,RILC
||         MVK     .L2     5,B4              ; |161| 
||         SUB     .L1     A1,1,A1           ; |160| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*
;*      Loop found in file               : C:/nightlybuilds/mathlib/ti/mathlib/src/powdp/powdp_d.c
;*      Loop source line                 : 161
;*      Loop opening brace source line   : 161
;*      Loop closing brace source line   : 165
;*      Known Minimum Trip Count         : 6                    
;*      Known Maximum Trip Count         : 6                    
;*      Known Max Trip Count Factor      : 6
;*      Loop Carried Dependency Bound(^) : 6
;*      Unpartitioned Resource Bound     : 2
;*      Partitioned Resource Bound(*)    : 4
;*      Resource Partition:
;*                                A-side   B-side
;*      .L units                     1        0     
;*      .S units                     1        0     
;*      .D units                     1        3     
;*      .M units                     0        0     
;*      .X cross paths               0        0     
;*      .T address paths             0        4*    
;*      Long read paths              0        0     
;*      Long write paths             0        0     
;*      Logical  ops (.LS)           0        0     (.L or .S unit)
;*      Addition ops (.LSD)          6        0     (.L or .S or .D unit)
;*      Bound(.L .S .LS)             1        0     
;*      Bound(.L .S .D .LS .LSD)     3        1     
;*
;*      Searching for software pipeline schedule at ...
;*         ii = 6  Schedule found with 2 iterations in parallel
;*
;*      Register Usage Table:
;*          +-----------------------------------------------------------------+
;*          |AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA|BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB|
;*          |00000000001111111111222222222233|00000000001111111111222222222233|
;*          |01234567890123456789012345678901|01234567890123456789012345678901|
;*          |--------------------------------+--------------------------------|
;*       0: |   ****                         |      ***                       |
;*       1: |   *****                        |      ***                       |
;*       2: |*  ****                         |    *****                       |
;*       3: |   *****                        |      ***                       |
;*       4: |   *****                        |    *****                       |
;*       5: |   *****                        |      ***                       |
;*          +-----------------------------------------------------------------+
;*
;*      Done
;*
;*      Loop will be splooped
;*      Collapsed epilog stages       : 0
;*      Collapsed prolog stages       : 0
;*      Minimum required memory pad   : 0 bytes
;*
;*      Minimum safe trip count       : 1
;*      Min. prof. trip count  (est.) : 2
;*
;*      Mem bank conflicts/iter(est.) : { min 0.000, est 0.000, max 0.000 }
;*      Mem bank perf. penalty (est.) : 0.0%
;*
;*
;*      Total cycles (est.)         : 6 + min_trip_cnt * 6 = 42        
;*----------------------------------------------------------------------------*
;*        SINGLE SCHEDULED ITERATION
;*
;*        $C$C108:
;*   0              ADD     .L1     A4,A3,A7          ; |163| 
;*   1              CMPLT   .L1     A7,6,A0           ; |163| 
;*   2      [!A0]   MVK     .S1     0xffffffd0,A7     ; |163| 
;*     ||   [ A0]   ZERO    .D1     A7                ; |163| 
;*   3              LDDW    .D2T2   *B8++,B5:B4       ; |162|  ^ 
;*     ||           ADD     .L1     A5,A7,A7          ; |163| 
;*   4              ADD     .L1     A6,A7,A7          ; |163| 
;*   5              LDDW    .D1T2   *A7,B5:B4         ; |163|  ^ 
;*     ||           ADD     .L1     1,A4,A4           ; |161| 
;*   6              NOP             2
;*   8              STDW    .D2T2   B5:B4,*B7++       ; |162|  ^ 
;*     ||           ADD     .L1     8,A5,A5           ; |161| 
;*   9              NOP             1
;*  10              STDW    .D2T2   B5:B4,*B6++       ; |163|  ^ 
;*     ||           SPBR            $C$C108
;*  11              NOP             1
;*  12              ; BRANCHCC OCCURS {$C$C108}       ; |161| 
;*----------------------------------------------------------------------------*
$C$L6:    ; PIPED LOOP PROLOG
;          EXCLUSIVE CPU CYCLES: 7

   [ A1]   SPLOOPD 6       ;12               ; SPRELOAD
||         MVK     .L1     0x1,A3            ; |160| 
||         MVC     .S2     B4,ILC
||         STDW    .D2T1   A5:A4,*+B17(32)   ; |157| 
||         ZERO    .S1     A4                ; |161| 

;** --------------------------------------------------------------------------*
$C$L7:    ; PIPED LOOP KERNEL
;          EXCLUSIVE CPU CYCLES: 6

           SPMASK          L2,D2
||         STDW    .D2T2   B9:B8,*+B16(40)   ; |158| 
||         MVK     .L2     0x8,B9
||         ADD     .L1     A4,A3,A7          ; |163| (P) <0,0> 

           SPMASK          S1,S2
||         MV      .S1X    B17,A14           ; |153| 
||         MVKL    .S2     _a_sc,B8
||         CMPLT   .L1     A7,6,A0           ; |163| (P) <0,1> 

           SPMASK          L1,S2
||         MVKH    .S2     _a_sc,B8
||         MV      .L1X    B9,A5
|| [ A0]   ZERO    .D1     A7                ; |163| (P) <0,2> 
|| [!A0]   MVK     .S1     0xffffffd0,A7     ; |163| (P) <0,2> 

           SPMASK          S1
||         MV      .S1     A14,A6
||         LDDW    .D2T2   *B8++,B5:B4       ; |162| (P) <0,3>  ^ 
||         ADD     .L1     A5,A7,A7          ; |163| (P) <0,3> 

           SPMASK          D2
||         ADDAD   .D2     B17,6,B6
||         ADD     .L1     A6,A7,A7          ; |163| (P) <0,4> 

           SPMASK          D2
||         ADDAD   .D2     B16,6,B7
||         ADD     .L1     1,A4,A4           ; |161| (P) <0,5> 
||         LDDW    .D1T2   *A7,B5:B4         ; |163| (P) <0,5>  ^ 

           NOP             2

           STDW    .D2T2   B5:B4,*B7++       ; |162| <0,8>  ^ 
||         ADD     .L1     8,A5,A5           ; |161| <0,8> 

           NOP             1

           SPKERNEL 0,0
||         STDW    .D2T2   B5:B4,*B6++       ; |163| <0,10>  ^ 

;** --------------------------------------------------------------------------*
$C$L8:    ; PIPED LOOP EPILOG AND PROLOG
;          EXCLUSIVE CPU CYCLES: 9
           NOP             2

           SPMASKR         ;$C$L8
||         ZERO    .S1     A4                ; |161| 
||         ADD     .D1     1,A3,A3           ; |160| 

           ADD     .L2     8,B9,B9           ; |160| 
|| [ A1]   B       .S2     $C$L8             ; |160| 

           MV      .S1     A6,A14
||         MVKL    .S2     _a_sc,B8
||         SUB     .D1     A1,1,A1           ; |160| 

           MVKH    .S2     _a_sc,B8
||         MV      .L1X    B9,A5

           MV      .S1     A14,A6
||         MVK     .L2     0x6,B5            ; |161| 
||         MVK     .S2     5,B4              ; |161| 

           NOP             2
           ; BRANCHCC OCCURS {$C$L8}         ; |160| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           MVKL    .S1     _a_sc,A3
           MVK     .S1     0x24,A31          ; |168| 
           MVKH    .S1     _a_sc,A3

           CALL    .S1     _pow              ; |170| 
||         SUB     .L1     A3,8,A15
||         STW     .D2T1   A31,*+SP(20)
||         SUB     .L2X    A14,8,B13

           LDDW    .D1T1   *++A15,A5:A4      ; |170| 
||         LDDW    .D2T2   *++B13,B5:B4      ; |170| 
||         ZERO    .L2     B12

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L9:    
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL11,B3,3      ; |170| 
$C$RL11:   ; CALL OCCURS {_pow} {0}          ; |170| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *A3,A3            ; |170| 
           ZERO    .L2     B7:B6             ; |171| 
           NOP             3
           ADD     .L2X    B12,A3,B4         ; |170| 
           STDW    .D2T1   A5:A4,*B4         ; |170| 
           LDDW    .D2T2   *B13,B5:B4        ; |171| 
           NOP             4
           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |171| 
           NOP             1
   [!B0]   B       .S1     $C$L10            ; |171| 

   [ B0]   CALL    .S1     _pow              ; |171| 
|| [ B0]   LDDW    .D1T1   *A15,A5:A4        ; |171| 

   [!B0]   CALL    .S1     _powdp            ; |171| 
   [!B0]   LDDW    .D1T1   *A15,A5:A4        ; |171| 
           NOP             2
           ; BRANCHCC OCCURS {$C$L10}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL12,B3,0      ; |171| 
$C$RL12:   ; CALL OCCURS {_pow} {0}          ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6

           B       .S2     $C$L11            ; |171| 
||         MVKL    .S1     _output,A3

           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(4),A3        ; |171| 
           MV      .L2X    A4,B4             ; |171| 
           MV      .L2X    A5,B5             ; |171| 
           NOP             1
           ; BRANCH OCCURS {$C$L11}          ; |171| 
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 2
           ADDKPC  .S2     $C$RL13,B3,1      ; |171| 
$C$RL13:   ; CALL OCCURS {_powdp} {0}        ; |171| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(4),A3        ; |171| 
           MV      .L2X    A4,B4             ; |171| 
           MV      .L2X    A5,B5             ; |171| 
           NOP             1
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 8
           NOP             1
           ADD     .L2X    B12,A3,B6         ; |171| 

           STDW    .D2T2   B5:B4,*B6         ; |171| 
||         CALL    .S1     _powdp_c          ; |172| 

           LDDW    .D1T1   *A15,A5:A4        ; |172| 
||         LDDW    .D2T2   *B13,B5:B4        ; |172| 

           ADDKPC  .S2     $C$RL14,B3,3      ; |172| 
$C$RL14:   ; CALL OCCURS {_powdp_c} {0}      ; |172| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(8),A3        ; |172| 
           NOP             4
           ADD     .L2X    B12,A3,B4         ; |172| 
           STDW    .D2T1   A5:A4,*B4         ; |172| 
           LDDW    .D1T1   *A15,A21:A20      ; |173| 
           LDDW    .D2T2   *B13,B21:B20      ; |173| 
           NOP             3
           ABSDP   .S1     A21:A20,A23:A22   ; |187| 
           NOP             1

           MV      .L1     A23,A5            ; |187| 
||         MV      .S1     A22,A4            ; |187| 
||         CALLP   .S2     _logdpMod_powdpi,B3

$C$RL15:   ; CALL OCCURS {_logdpMod_powdpi} {0}  ; |187| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 255
           MPYDP   .M2X    B21:B20,A5:A4,B7:B6 ; |187| 
           MVKL    .S2     0x652b82fe,B4
           ZERO    .L2     B8                ; |188| 
           ZERO    .L2     B9
           SET     .S2     B9,0x14,0x1d,B9
           MVKL    .S2     0x3ff71547,B5
           MVKH    .S2     0x652b82fe,B4
           CMPEQDP .S1X    A23:A22,B9:B8,A0  ; |188| 
           MVKH    .S2     0x3ff71547,B5
           ZERO    .L1     A4                ; |188| 
   [ A0]   ZERO    .L2     B7:B6             ; |189| 
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |147| 
           MVKL    .S1     0x3fe63000,A5
           MVKH    .S1     0x3fe63000,A5
           MVKL    .S2     0x3f7c70e4,B9
           MVKL    .S2     0x6fb3f6e0,B8
           MVKH    .S2     0x3f7c70e4,B9
           MVKH    .S2     0x6fb3f6e0,B8
           MVKL    .S1     0x3fac718e,A17
           MVKL    .S1     0x714251b3,A16
           MVKH    .S1     0x3fac718e,A17
           DPINT   .L2     B5:B4,B16         ; |147| 
           MVKH    .S1     0x714251b3,A16
           ZERO    .L1     A31
           ZERO    .S2     B29
           INTDP   .L2     B16,B5:B4         ; |147| 
           ZERO    .L1     A30
           ZERO    .L2     B28
           ZERO    .L1     A29
           LDW     .D2T1   *+SP(20),A26      ; |199| 
           DPINT   .L2     B21:B20,B18       ; |178| 
           MPYDP   .M1X    A5:A4,B5:B4,A7:A6 ; |147| 
           MVK     .L2     0xffffffff,B23    ; |195| 
           ZERO    .S2     B24
           MVKL    .S1     0xbf2bd010,A5
           MVKL    .S1     0x5c610ca8,A4
           MVKH    .S1     0xbf2bd010,A5
           MVKH    .S1     0x5c610ca8,A4
           MVK     .S2     0x400,B27
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |147| 
           EXTU    .S2     B18,31,31,B26     ; |180| 
           SUBDP   .L1X    B7:B6,A7:A6,A5:A4 ; |147| 
           MVKL    .S2     _output+12,B25
           MVKH    .S2     _output+12,B25
           NOP             6
           SUBDP   .L1X    A5:A4,B5:B4,A7:A6 ; |147| 
           MVKL    .S2     0x3ef152a4,B5
           MVKL    .S2     0x6f58dc1c,B4
           MVKH    .S2     0x3ef152a4,B5
           MVKH    .S2     0x6f58dc1c,B4
           NOP             2
           MPYDP   .M1     A7:A6,A7:A6,A5:A4 ; |147| 
           NOP             9
           MPYDP   .M1X    B5:B4,A5:A4,A9:A8 ; |147| 
           NOP             4
           MVKL    .S2     0x3f403f99,B5
           MVKL    .S2     0x6fde3809,B4
           MVKH    .S2     0x3f403f99,B5
           MVKH    .S2     0x6fde3809,B4
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |148| 
           ADDDP   .L1X    B9:B8,A9:A8,A9:A8 ; |147| 
           NOP             6
           MPYDP   .M1     A5:A4,A9:A8,A9:A8 ; |147| 
           NOP             1
           ADDDP   .L2X    A17:A16,B5:B4,B5:B4 ; |148| 
           ZERO    .L1     A16               ; |147| 
           ZERO    .L1     A17
           MVKH    .S1     0x3fd00000,A17
           NOP             3
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |148| 
           ADDDP   .L1     A17:A16,A9:A8,A5:A4 ; |147| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |147| 
           NOP             2

           MV      .L1     A16,A4            ; |148| 
||         SET     .S1     A31,0x15,0x1d,A5

           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |148| 
           ZERO    .L2     B4                ; |153| 
           SET     .S2     B29,0x1e,0x1e,B5
           NOP             4
           SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |148| 
           NOP             6
           RCPDP   .S1     A5:A4,A9:A8       ; |153| 
           NOP             1
           MPYDP   .M1     A5:A4,A9:A8,A17:A16 ; |153| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A17:A16,B5:B4 ; |153| 
           NOP             6
           MPYDP   .M2X    A9:A8,B5:B4,B5:B4 ; |153| 
           NOP             9
           MPYDP   .M2X    A5:A4,B5:B4,B9:B8 ; |153| 
           ZERO    .L1     A8                ; |153| 
           SET     .S1     A30,0x1e,0x1e,A9
           NOP             8
           SUBDP   .L1X    A9:A8,B9:B8,A9:A8 ; |153| 
           MVKL    .S2     0x40862e42,B9
           MVKL    .S2     0xfefa39cc,B8
           MVKH    .S2     0x40862e42,B9
           MVKH    .S2     0xfefa39cc,B8
           CMPGTDP .S2     B7:B6,B9:B8,B2    ; |156| 
           LDW     .D2T2   *B25,B8           ; |173| 
           MPYDP   .M1X    B5:B4,A9:A8,A9:A8 ; |153| 
           SET     .S2     B24,0x0,0x1e,B9
           NOP             8
           MPYDP   .M1     A5:A4,A9:A8,A5:A4 ; |153| 
           ZERO    .L2     B4                ; |153| 
           SET     .S2     B28,0x1e,0x1e,B5
           ADD     .L2     B12,B8,B22        ; |173| 
           ADD     .L2     8,B12,B12         ; |174| 
           NOP             6
           SUBDP   .L2X    B5:B4,A5:A4,B5:B4 ; |153| 
           ZERO    .L1     A4                ; |153| 
           SET     .S1     A29,0x15,0x1d,A5
           NOP             4
           MPYDP   .M2X    A9:A8,B5:B4,B5:B4 ; |153| 
           NOP             9
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |153| 
           MVKL    .S1     0xc086232b,A9
           MVKL    .S1     0xdd7abcd2,A8
           MVKH    .S1     0xc086232b,A9
           MVKH    .S1     0xdd7abcd2,A8
           CMPLTDP .S1X    B7:B6,A9:A8,A0    ; |161| 
           ZERO    .L2     B7:B6             ; |194| 
           ZERO    .L1     A7:A6             ; |180| 
           CMPLTDP .S2X    A21:A20,B7:B6,B6  ; |194| 
           CMPLTDP .S1     A21:A20,A7:A6,A3  ; |180| 
           ZERO    .L1     A7:A6             ; |198| 
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |153| 
           ADD     .L2     B27,B16,B4        ; |153| 
           ZERO    .L2     B16               ; |153| 
           SHL     .S2     B4,20,B17         ; |153| 
           INTDP   .L2     B18,B5:B4         ; |180| 
           CMPLTDP .S1X    B21:B20,A7:A6,A28 ; |198| 
           NOP             1
           MPYDP   .M1X    B17:B16,A5:A4,A5:A4 ; |153| 
           NOP             2
           CMPEQDP .S2     B21:B20,B5:B4,B4  ; |180| 
           NOP             1
           AND     .L2X    B4,A3,B4          ; |180| 
           AND     .L2     B26,B4,B0         ; |180| 
           MVK     .L2     0x1,B4            ; |176| 
   [ B0]   ADD     .L2     -2,B4,B4
           INTDP   .L2     B4,B5:B4          ; |192| 

   [ B2]   MVKL    .S1     0x7fefffff,A5
|| [ B2]   MVK     .L1     0xffffffff,A4     ; |157| 

   [ B2]   MVKH    .S1     0x7fefffff,A5
   [ A0]   ZERO    .L1     A5:A4             ; |162| 
           SUB     .L1     A26,1,A3          ; |168| 

           INTDP   .L1X    B18,A5:A4         ; |194| 
||         MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |192| 

           STW     .D2T1   A3,*+SP(20)       ; |173| 
           NOP             3
           CMPEQDP .S1X    B21:B20,A5:A4,A6  ; |194| 
           ZERO    .L1     A5:A4             ; |198| 

           CMPEQDP .S1     A21:A20,A5:A4,A4  ; |198| 
||         XOR     .L1     1,A6,A27          ; |194| 

           AND     .L1X    A27,B6,A1         ; |194| 
           AND     .L1     A28,A4,A0         ; |198| 

   [ A1]   MV      .L2     B9,B5             ; |195| 
|| [ A0]   LDW     .D2T2   *+SP(16),B5       ; |199| 
|| [ A1]   MV      .S2     B23,B4            ; |195| 

   [ A0]   LDW     .D2T2   *+SP(12),B4       ; |195| 
||         SUB     .L1     A26,1,A0          ; |168| 

   [ A0]   BNOP    .S1     $C$L9,2           ; |168| 
|| [!A0]   MVKL    .S2     _output,B12

   [!A0]   MVKH    .S2     _output,B12

   [ A0]   CALL    .S1     _pow              ; |170| 
||         STDW    .D2T2   B5:B4,*B22        ; |173| 

   [!A0]   CALL    .S1     _powdp_v          ; |177| 
|| [ A0]   LDDW    .D1T1   *++A15,A5:A4      ; |170| 
|| [ A0]   LDDW    .D2T2   *++B13,B5:B4      ; |170| 

           ; BRANCHCC OCCURS {$C$L9}         ; |168| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T1   *+B12(16),A6      ; |177| 
           MVKL    .S1     _a_sc,A4
           MVKH    .S1     _a_sc,A4
           MVK     .S2     0x24,B6           ; |177| 

           MV      .L2X    A14,B4            ; |177| 
||         ADDKPC  .S2     $C$RL16,B3,0      ; |177| 

$C$RL16:   ; CALL OCCURS {_powdp_v} {0}      ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 46
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B12,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B12(4),B4       ; |66| 
||         MVK     .S1     0x24,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL17:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B6(4)        ; |66| 
||         MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B12(8),B4       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B12,A4           ; |67| 
||         MVK     .S1     0x24,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL18:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     _fcn_pass,B5
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     _fcn_pass,B5
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1X    B12,A3            ; |67| 
||         STW     .D2T1   A4,*+B5(8)        ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B12(12),B4      ; |68| 
||         MVK     .S1     0x24,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL19:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     _fcn_pass,B4

           LDW     .D2T1   *+SP(92),A3       ; |68| 
||         MVKL    .S2     0xd9d7bdbb,B6

           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B4

           MV      .L1X    B12,A31           ; |69| 
||         STW     .D2T1   A4,*+B4(12)       ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T1   *A31,A4           ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         STW     .D2T1   A3,*+SP(108)      ; |68| 
||         MVK     .S1     0x24,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL20:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(96),A3       ; |69| 
           MVKL    .S2     _fcn_pass,B4
           MVKH    .S2     _fcn_pass,B4
           STW     .D2T1   A4,*+B4(16)       ; |69| 
           NOP             1
           LDW     .D1T1   *A3,A0            ; |72| 
           STW     .D2T1   A3,*+SP(112)      ; |69| 
           LDW     .D2T1   *+SP(100),A3
           NOP             2

   [!A0]   B       .S2     $C$L12            ; |72| 
|| [!A0]   MVKL    .S1     _all_pass,A4

   [!A0]   CALL    .S2     _print_test_results ; |181| 
|| [!A0]   MVKH    .S1     _all_pass,A4

   [ A0]   MV      .L2X    A3,B4
||         STW     .D2T1   A3,*+SP(116)      ; |72| 

   [ A0]   LDW     .D2T2   *B4,B0            ; |72| 
   [!A0]   ZERO    .L1     A3                ; |72| 
   [ A0]   ADD     .L2     4,B4,B4
           ; BRANCHCC OCCURS {$C$L12}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           CMPEQ   .L1     A4,0,A3           ; |72| 
           XOR     .L1     1,A3,A3           ; |72| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |72| 
   [!B0]   ZERO    .L1     A0                ; |72| 
           NOP             3
   [ B0]   CMPEQ   .L2     B4,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 
           NOP             1

   [ B0]   AND     .L1X    A3,B4,A0          ; |72| 
||         MVK     .S1     0x1,A3            ; |72| 

   [!A0]   ZERO    .L1     A3                ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |181| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           NOP             2
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x3,A4            ; |181| 
||         ADDKPC  .S2     $C$RL21,B3,0      ; |181| 

$C$RL21:   ; CALL OCCURS {_print_test_results} {0}  ; |181| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 51
           LDW     .D2T1   *+SP(84),A28      ; |195| 

           LDW     .D2T1   *+SP(68),A24      ; |153| 
||         ZERO    .L1     A16               ; |184| 

           STW     .D2T1   A16,*+SP(84)      ; |185| 
           LDW     .D2T1   *+SP(52),A19      ; |147| 
           LDW     .D2T2   *+SP(24),B12      ; |188| 
           LDW     .D2T1   *+SP(56),A23      ; |153| 
           LDW     .D2T1   *+SP(72),A25      ; |153| 
           LDW     .D2T1   *+SP(76),A26      ; |153| 
           LDW     .D2T1   *+SP(80),A27      ; |153| 
           LDW     .D2T1   *+SP(88),A29      ; |191| 
           LDW     .D2T1   *+SP(48),A18      ; |147| 
           LDW     .D2T1   *+SP(40),A17      ; |147| 
           LDW     .D2T1   *+SP(60),A21      ; |147| 
           LDW     .D2T1   *+SP(64),A22      ; |148| 

           LDW     .D2T1   *+SP(44),A20      ; |147| 
||         ZERO    .L1     A7                ; |184| 

           LDW     .D2T2   *+SP(36),B13      ; |188| 
||         MV      .L1     A7,A9             ; |184| 
||         MVKL    .S2     _b_ext,B5

           STW     .D2T1   A9,*+SP(132)      ; |184| 
||         MVKH    .S2     _b_ext,B5

           STW     .D2T2   B5,*+SP(20)       ; |185| 
||         ZERO    .L1     A4                ; |184| 

           LDW     .D2T1   *+SP(104),A16     ; |188| 

           STW     .D2T1   A4,*+SP(124)      ; |184| 
||         MV      .L2X    A4,B30            ; |185| 
||         MVK     .S1     0x777,A6

           STW     .D2T2   B30,*+SP(68)      ; |185| 
||         MVKL    .S1     0xcccccccd,A30

           STW     .D2T1   A7,*+SP(52)       ; |185| 
||         MVKL    .S1     0xc000cccc,A31

           STW     .D2T1   A6,*+SP(24)
||         MVKH    .S1     0xcccccccd,A30

           STW     .D2T1   A30,*+SP(160)     ; |191| 
||         MVKH    .S1     0xc000cccc,A31
||         ZERO    .L1     A3

           STW     .D2T1   A31,*+SP(164)     ; |191| 
||         MVKH    .S1     0xbff80000,A3

           STW     .D2T1   A3,*+SP(172)      ; |192| 
           STW     .D2T1   A23,*+SP(128)     ; |148| 
           STW     .D2T1   A24,*+SP(120)     ; |153| 
           STW     .D2T1   A24,*+SP(136)     ; |153| 
           STW     .D2T1   A25,*+SP(140)     ; |153| 
           STW     .D2T1   A26,*+SP(144)     ; |153| 
           STW     .D2T1   A27,*+SP(148)     ; |153| 
           STW     .D2T1   A28,*+SP(152)     ; |153| 
           STW     .D2T1   A29,*+SP(156)     ; |195| 
           STW     .D2T1   A17,*+SP(48)      ; |147| 
           STW     .D2T1   A18,*+SP(60)      ; |147| 
           STW     .D2T1   A19,*+SP(64)      ; |147| 
           STW     .D2T1   A20,*+SP(56)      ; |147| 
           STW     .D2T1   A21,*+SP(76)      ; |147| 
           STW     .D2T1   A22,*+SP(80)      ; |147| 

           STW     .D2T1   A23,*+SP(72)      ; |148| 
||         MVKL    .S2     _a_ext,B4

           STW     .D2T1   A24,*+SP(88)      ; |153| 
||         ZERO    .L1     A9                ; |184| 
||         MVKH    .S2     _a_ext,B4

           STW     .D2T1   A9,*+SP(168)      ; |184| 

           LDW     .D2T2   *+SP(20),B4
||         MV      .L1X    B4,A14            ; |184| 

           STW     .D2T1   A9,*+SP(36)
||         ZERO    .L1     A5

           STW     .D2T1   A9,*+SP(104)      ; |185| 
||         MV      .L2     B5,B31            ; |184| 
||         SET     .S1     A5,0x14,0x14,A5

           STDW    .D2T1   A5:A4,*B31        ; |185| 

           STW     .D2T1   A16,*+SP(40)      ; |188| 
||         ZERO    .L2     B30               ; |184| 

           STW     .D2T2   B30,*+SP(44)      ; |185| 
||         MV      .L2X    A14,B29           ; |185| 

           CALL    .S1     _pow              ; |187| 
||         STDW    .D2T1   A5:A4,*B29        ; |184| 

           LDDW    .D1T1   *A14,A5:A4        ; |187| 
||         LDDW    .D2T2   *B4,B5:B4         ; |187| 
||         ZERO    .L1     A15               ; |184| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 4
           ADDKPC  .S2     $C$RL22,B3,3      ; |187| 
$C$RL22:   ; CALL OCCURS {_pow} {0}          ; |187| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 52
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T2   *A3,B4            ; |187| 
           LDW     .D2T2   *+SP(20),B31
           NOP             3
           ADD     .L1X    A15,B4,A3         ; |187| 
           STDW    .D1T1   A5:A4,*A3         ; |187| 

           CALLP   .S2     _powdp,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |188| 
||         LDDW    .D2T2   *B31,B5:B4        ; |188| 

$C$RL23:   ; CALL OCCURS {_powdp} {0}        ; |188| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(4),A3        ; |188| 
           LDW     .D2T2   *+SP(20),B4
           NOP             3
           ADD     .L1     A15,A3,A3         ; |188| 
           STDW    .D1T1   A5:A4,*A3         ; |188| 

           CALLP   .S2     _powdp_c,B3
||         LDDW    .D1T1   *A14,A5:A4        ; |189| 
||         LDDW    .D2T2   *B4,B5:B4         ; |189| 

$C$RL24:   ; CALL OCCURS {_powdp_c} {0}      ; |189| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           LDW     .D1T1   *+A3(8),A3        ; |189| 
           LDW     .D2T2   *+SP(20),B4       ; |187| 
           NOP             3
           ADD     .L1     A15,A3,A3         ; |189| 
           STDW    .D1T1   A5:A4,*A3         ; |189| 
           LDDW    .D1T1   *A14,A21:A20      ; |190| 
           LDDW    .D2T2   *B4,B21:B20       ; |190| 
           NOP             3
           ABSDP   .S1     A21:A20,A23:A22   ; |187| 
           NOP             1

           MV      .L1     A22,A4            ; |187| 
||         MV      .S1     A23,A5            ; |187| 
||         CALLP   .S2     _logdpMod_powdpi,B3

$C$RL25:   ; CALL OCCURS {_logdpMod_powdpi} {0}  ; |187| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 277
           MPYDP   .M2X    B21:B20,A5:A4,B5:B4 ; |187| 
           LDW     .D2T1   *+SP(40),A5
           LDW     .D2T1   *+SP(36),A4
           ZERO    .L1     A30
           MVK     .S2     0x400,B29
           DPINT   .L2     B21:B20,B17       ; |178| 
           LDW     .D2T1   *+SP(156),A31     ; |198| 
           CMPEQDP .S1     A23:A22,A5:A4,A0  ; |188| 
           LDW     .D2T2   *+SP(20),B27      ; |190| 
           EXTU    .S2     B17,31,31,B28     ; |180| 
   [ A0]   ZERO    .L2     B5:B4             ; |189| 
           MPYDP   .M2     B13:B12,B5:B4,B7:B6 ; |147| 
           LDW     .D2T2   *+SP(20),B26
           NOP             8
           DPINT   .L2     B7:B6,B16         ; |147| 
           LDW     .D2T2   *+SP(48),B7
           MV      .L2X    A4,B6             ; |147| 
           NOP             1
           INTDP   .L2     B16,B9:B8         ; |147| 
           NOP             4
           MPYDP   .M2     B7:B6,B9:B8,B7:B6 ; |147| 
           MPYDP   .M1X    A13:A12,B9:B8,A5:A4 ; |147| 
           LDW     .D2T2   *+SP(80),B9
           LDW     .D2T2   *+SP(76),B8
           NOP             6
           SUBDP   .L2     B5:B4,B7:B6,B7:B6 ; |147| 
           NOP             7
           SUBDP   .L1X    B7:B6,A5:A4,A9:A8 ; |147| 
           LDW     .D2T1   *+SP(64),A5       ; |148| 
           LDW     .D2T1   *+SP(60),A4       ; |148| 
           NOP             4
           MPYDP   .M1     A9:A8,A9:A8,A7:A6 ; |147| 
           NOP             9
           MPYDP   .M1     A11:A10,A7:A6,A17:A16 ; |147| 
           MPYDP   .M2X    B11:B10,A7:A6,B7:B6 ; |148| 
           NOP             8
           ADDDP   .L1     A5:A4,A17:A16,A5:A4 ; |147| 
           ADDDP   .L2     B9:B8,B7:B6,B7:B6 ; |148| 
           LDW     .D2T2   *+SP(72),B9
           NOP             4
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |147| 
           MPYDP   .M2X    A7:A6,B7:B6,B7:B6 ; |148| 
           LDW     .D2T1   *+SP(56),A7       ; |148| 
           LDW     .D2T1   *+SP(52),A6       ; |148| 
           NOP             6
           ADDDP   .L1     A7:A6,A5:A4,A5:A4 ; |147| 
           MV      .L2X    A6,B8             ; |147| 
           ADDDP   .L2     B9:B8,B7:B6,B7:B6 ; |148| 
           NOP             4
           MPYDP   .M1     A9:A8,A5:A4,A19:A18 ; |147| 
           LDW     .D2T1   *+SP(88),A5
           NOP             8
           SUBDP   .L1X    B7:B6,A19:A18,A17:A16 ; |148| 
           MV      .S1     A6,A4             ; |147| 
           ZERO    .L2     B6                ; |153| 
           ADD     .L2     B29,B16,B7        ; |153| 
           SHL     .S2     B7,20,B7          ; |153| 
           NOP             2
           RCPDP   .S1     A17:A16,A7:A6     ; |153| 
           NOP             1
           MPYDP   .M1     A17:A16,A7:A6,A9:A8 ; |153| 
           NOP             9
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |153| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |153| 
           LDW     .D2T1   *+SP(120),A5
           NOP             8
           MPYDP   .M1     A17:A16,A7:A6,A9:A8 ; |153| 
           MV      .L1X    B8,A4             ; |153| 
           NOP             8
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |153| 
           NOP             6
           MPYDP   .M1     A7:A6,A5:A4,A7:A6 ; |153| 
           LDW     .D2T1   *+SP(136),A5
           NOP             8
           MPYDP   .M1     A17:A16,A7:A6,A9:A8 ; |153| 
           MV      .L1X    B8,A4             ; |153| 
           NOP             8
           SUBDP   .S1     A5:A4,A9:A8,A5:A4 ; |153| 
           ZERO    .L1     A9:A8             ; |180| 
           CMPLTDP .S1     A21:A20,A9:A8,A3  ; |180| 
           NOP             4
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |153| 
           NOP             9
           MPYDP   .M1     A19:A18,A5:A4,A7:A6 ; |153| 
           NOP             7
           MV      .L1X    B9,A5             ; |178| 
           MV      .L1X    B8,A4             ; |178| 
           ADDDP   .S1     A5:A4,A7:A6,A5:A4 ; |153| 
           INTDP   .L1X    B17,A7:A6         ; |180| 
           NOP             4
           CMPEQDP .S1X    B21:B20,A7:A6,A6  ; |180| 
           LDW     .D2T1   *+SP(144),A7      ; |192| 

           MPYDP   .M2X    B7:B6,A5:A4,B9:B8 ; |153| 
||         AND     .L1     A6,A3,A3          ; |180| 
||         LDW     .D2T1   *+SP(140),A6      ; |192| 

           LDW     .D2T2   *+SP(152),B7      ; |192| 
           LDW     .D2T2   *+SP(148),B6      ; |192| 
           NOP             1

           AND     .L2X    B28,A3,B0         ; |180| 
||         MVK     .L1     0x1,A3            ; |176| 

   [ B0]   ADD     .L1     -2,A3,A3
||         CMPGTDP .S1X    B5:B4,A7:A6,A0    ; |156| 

           INTDP   .L1     A3,A5:A4          ; |192| 
           LDW     .D1T1   *A31,A3           ; |190| 
           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |161| 
           ZERO    .L2     B5:B4             ; |198| 

   [ A0]   MVKL    .S2     0x7fefffff,B9
|| [ A0]   MVK     .L2     0xffffffff,B8     ; |157| 

   [ A0]   MVKH    .S2     0x7fefffff,B9
   [ B0]   ZERO    .L2     B9:B8             ; |162| 

           MPYDP   .M2X    B9:B8,A5:A4,B7:B6 ; |192| 
||         INTDP   .L2     B17,B9:B8         ; |194| 

           CMPLTDP .S2     B21:B20,B5:B4,B16 ; |198| 
           ZERO    .L2     B5:B4             ; |198| 
           SET     .S1     A30,0x0,0x1e,A4
           CMPEQDP .S2X    A21:A20,B5:B4,B17 ; |198| 
           ZERO    .L2     B5:B4             ; |194| 
           CMPEQDP .S2     B21:B20,B9:B8,B8  ; |194| 
           AND     .L2     B16,B17,B0        ; |198| 
           CMPLTDP .S2X    A21:A20,B5:B4,B4  ; |194| 
           XOR     .L2     1,B8,B5           ; |194| 
           AND     .L2     B5,B4,B1          ; |194| 

   [ B1]   MV      .L2X    A4,B7             ; |195| 
||         MVK     .L1     0xffffffff,A4     ; |195| 

   [ B0]   LDW     .D2T2   *+SP(16),B7       ; |195| 

   [ B1]   MV      .L2X    A4,B6             ; |195| 
|| [ B0]   LDW     .D2T2   *+SP(12),B6       ; |199| 

           ADD     .L1     A15,A3,A3         ; |190| 
           LDW     .D2T1   *+SP(172),A5      ; |191| 
           LDW     .D2T1   *+SP(168),A4      ; |191| 
           ADD     .L1     8,A15,A15         ; |186| 
           STDW    .D1T2   B7:B6,*A3         ; |190| 
           LDDW    .D2T2   *B27,B5:B4        ; |192| 
           LDDW    .D1T1   *A14,A7:A6        ; |191| 
           NOP             3

           MPYDP   .M1X    A5:A4,B5:B4,A9:A8 ; |192| 
||         LDW     .D2T1   *+SP(160),A4

           LDW     .D2T1   *+SP(164),A5
           NOP             4
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |191| 
           NOP             3
           STDW    .D2T1   A9:A8,*++B26      ; |192| 
           LDW     .D2T1   *+SP(24),A3       ; |192| 
           STW     .D2T2   B26,*+SP(20)      ; |192| 
           NOP             3

           SUB     .L1     A3,1,A0           ; |186| 
||         STDW    .D1T1   A5:A4,*++A14      ; |191| 
||         SUB     .S1     A3,1,A3           ; |186| 

   [ A0]   B       .S1     $C$L13            ; |186| 
||         LDW     .D2T2   *+SP(20),B4
|| [!A0]   MVKL    .S2     _output,B10
|| [ A0]   LDDW    .D1T1   *A14,A5:A4        ; |187| 

           STW     .D2T1   A3,*+SP(24)       ; |191| 
|| [!A0]   MVKL    .S1     _a_ext,A4

   [!A0]   MVKH    .S2     _output,B10
   [!A0]   LDW     .D2T1   *+B10(16),A6      ; |194| 
   [ A0]   CALL    .S1     _pow              ; |187| 

   [!A0]   CALL    .S1     _powdp_v          ; |194| 
|| [ A0]   LDDW    .D2T2   *B4,B5:B4         ; |187| 
|| [!A0]   MVKL    .S2     _b_ext,B4

           ; BRANCHCC OCCURS {$C$L13}        ; |186| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           MVKH    .S2     _b_ext,B4
           MVK     .S2     0x777,B6          ; |194| 
           MVKH    .S1     _a_ext,A4
           ADDKPC  .S2     $C$RL26,B3,1      ; |194| 
$C$RL26:   ; CALL OCCURS {_powdp_v} {0}      ; |194| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 43
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D2T1   *B10,A4           ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T2   *+B10(4),B4       ; |66| 
||         MVK     .S1     0x777,A6          ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL27:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     _fcn_pass,B11
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     _fcn_pass,B11
           MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D2T2   *+B10(8),B4       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B11(4)       ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D2T1   *B10,A4           ; |67| 
||         MVK     .S1     0x777,A6          ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL28:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1X    B10,A3            ; |67| 
||         STW     .D2T1   A4,*+B11(8)       ; |67| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         LDW     .D2T2   *+B10(12),B4      ; |68| 
||         MVK     .S1     0x777,A6          ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL29:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T1   *+SP(92),A3       ; |68| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           MV      .L1X    B10,A5            ; |68| 
||         STW     .D2T1   A4,*+B11(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T1   *A5,A4            ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x777,A6          ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL30:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(96),A3       ; |69| 
           LDW     .D2T2   *+SP(100),B4
           STW     .D2T1   A4,*+B11(16)      ; |69| 
           NOP             2
           LDW     .D1T1   *A3,A0            ; |72| 
           NOP             4

   [!A0]   B       .S1     $C$L14            ; |72| 
|| [ A0]   LDW     .D2T2   *B4,B0            ; |72| 

   [!A0]   CALL    .S1     _print_test_results ; |198| 
   [!A0]   ZERO    .L1     A4                ; |72| 
   [ A0]   ADD     .L2     4,B4,B4
   [!A0]   MVKL    .S1     _all_pass,A3
   [!A0]   MVKH    .S1     _all_pass,A3
           ; BRANCHCC OCCURS {$C$L14}        ; |72| 
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
           CALL    .S1     _print_test_results ; |198| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           NOP             2
;** --------------------------------------------------------------------------*
$C$L14:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A4,*A3            ; |72| 
||         MVK     .L1     0x4,A4            ; |198| 
||         ADDKPC  .S2     $C$RL31,B3,0      ; |198| 

$C$RL31:   ; CALL OCCURS {_print_test_results} {0}  ; |198| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         ZERO    .L2     B4                ; |114| 
||         ZERO    .L1     A4                ; |114| 
||         ZERO    .D1     A5                ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A3         ; |114| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVKL    .S1     _t_start,A3

           MVKH    .S1     _t_start,A3
||         MV      .L2     B4,B7             ; |116| 

           MVC     .S2     TSCL,B4           ; |117| 
||         STDW    .D1T2   B7:B6,*A3         ; |116| 

           MVC     .S2     TSCH,B8           ; |117| 

           MVKL    .S1     _t_offset,A3
||         SUBU    .L2     B4,B6,B5:B4       ; |117| 

           CALL    .S1     _gimme_random     ; |208| 
||         EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B8,B7,B31         ; |117| 

           ADD     .L2     B31,B6,B5         ; |117| 
||         MVKH    .S1     _t_offset,A3
||         MV      .S2X    A5,B11            ; |114| 

           MVK     .S2     0x80,B4
||         STDW    .D1T2   B5:B4,*A3         ; |117| 

           ZERO    .L2     B5
||         MV      .L1X    B11,A4            ; |208| 
||         ZERO    .S1     A5
||         MV      .S2X    A4,B10            ; |114| 
||         MV      .D1     A4,A11

           MV      .L2     B10,B4            ; |208| 
||         MV      .L1X    B4,A10            ; |117| 
||         MVKH    .S2     0xc0240000,B5
||         MVKH    .S1     0x40340000,A5

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL32,B3,0      ; |208| 
$C$RL32:   ; CALL OCCURS {_gimme_random} {0}  ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 45
           MVKL    .S1     _input,A3
           MVKH    .S1     _input,A3
           ZERO    .L2     B5
           MV      .L2X    A3,B12            ; |208| 
           LDW     .D2T2   *B12,B4           ; |208| 
           MVKH    .S2     0xc0240000,B5
           NOP             3
           ADD     .L1X    A11,B4,A3         ; |208| 

           STDW    .D1T1   A5:A4,*A3         ; |208| 
||         ZERO    .L1     A5

           CALLP   .S2     _gimme_random,B3
||         MVKH    .S1     0x40340000,A5
||         MV      .L1X    B11,A4            ; |209| 
||         MV      .L2     B10,B4            ; |209| 

$C$RL33:   ; CALL OCCURS {_gimme_random} {0}  ; |209| 
           LDW     .D2T2   *+B12(4),B4       ; |209| 
           MV      .L1     A5,A25            ; |209| 
           MV      .L1     A4,A24            ; |209| 
           NOP             2
           ADD     .L1X    A11,B4,A3         ; |209| 

           STDW    .D1T1   A25:A24,*A3       ; |209| 
||         MVC     .S2     TSCL,B20          ; |122| 

           MVC     .S2     TSCH,B21          ; |122| 
           MV      .L1X    B12,A13           ; |122| 
           LDW     .D1T1   *A13,A3           ; |213| 
           NOP             4
           ADD     .L1     A11,A3,A3         ; |213| 
           LDDW    .D1T1   *A3,A21:A20       ; |213| 
           NOP             4
           ABSDP   .S1     A21:A20,A23:A22   ; |187| 
           NOP             1

           CALLP   .S2     _logdpMod_powdpi,B3
||         MV      .L1     A22,A4            ; |187| 
||         MV      .S1     A23,A5            ; |187| 

$C$RL34:   ; CALL OCCURS {_logdpMod_powdpi} {0}  ; |187| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 265
           MPYDP   .M1     A25:A24,A5:A4,A5:A4 ; |187| 
           MVKL    .S2     0x652b82fe,B4
           MV      .L2     B10,B6            ; |188| 
           ZERO    .L2     B7
           SET     .S2     B7,0x14,0x1d,B7
           MVKL    .S2     0x3ff71547,B5
           CMPEQDP .S1X    A23:A22,B7:B6,A0  ; |188| 
           MVKH    .S2     0x652b82fe,B4
           MVKH    .S2     0x3ff71547,B5
           MV      .L1X    B11,A6            ; |147| 
   [ A0]   ZERO    .L1     A5:A4             ; |189| 
           MVKL    .S1     0x3fe63000,A7
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |147| 
           MVKH    .S1     0x3fe63000,A7
           MVKL    .S2     0x3ef152a4,B9
           MVKL    .S2     0x6f58dc1c,B8
           MVKH    .S2     0x3ef152a4,B9
           MVKH    .S2     0x6f58dc1c,B8
           MVKL    .S2     0x3f7c70e4,B19
           MVKL    .S2     0x6fb3f6e0,B18
           MVKH    .S2     0x3f7c70e4,B19
           MVKH    .S2     0x6fb3f6e0,B18
           DPINT   .L2     B5:B4,B16         ; |147| 
           ZERO    .L2     B29
           ZERO    .L1     A31
           DPINT   .L1     A25:A24,A3        ; |178| 
           INTDP   .L2     B16,B5:B4         ; |147| 
           ZERO    .L1     A30
           ZERO    .L2     B13
           MVK     .S2     0xffffffff,B25    ; |195| 
           MV      .S2     B10,B12           ; |153| 
           MPYDP   .M2X    A7:A6,B5:B4,B7:B6 ; |147| 
           EXTU    .S1     A3,31,31,A17      ; |180| 
           SET     .S2     B13,0x15,0x1d,B13
           MVKL    .S1     0xbf2bd010,A7
           MVKL    .S1     0x5c610ca8,A6
           MVKH    .S1     0xbf2bd010,A7
           MVKH    .S1     0x5c610ca8,A6
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |147| 
           MVK     .S2     0x400,B28
           MVKL    .S2     _output+12,B27
           SUBDP   .L2X    A5:A4,B7:B6,B5:B4 ; |147| 
           MVKH    .S2     _output+12,B27
           MVKL    .S1     _t_start,A15
           MVKH    .S1     _t_start,A15
           STDW    .D1T2   B21:B20,*A15
           NOP             3
           SUBDP   .L2X    B5:B4,A7:A6,B7:B6 ; |147| 
           MVKL    .S1     0x6fde3809,A6
           MVKL    .S1     0x3f403f99,A7
           MVKH    .S1     0x6fde3809,A6
           MVKH    .S1     0x3f403f99,A7
           NOP             2
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |147| 
           NOP             9
           MPYDP   .M2     B9:B8,B5:B4,B9:B8 ; |147| 
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |148| 
           NOP             8
           ADDDP   .L2     B19:B18,B9:B8,B9:B8 ; |147| 
           MVKL    .S2     0x3fac718e,B19
           MVKL    .S2     0x714251b3,B18
           MVKH    .S2     0x3fac718e,B19
           MVKH    .S2     0x714251b3,B18
           NOP             1
           ADDDP   .L1X    B19:B18,A7:A6,A7:A6 ; |148| 
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |147| 
           MV      .L2     B10,B18           ; |153| 
           NOP             4
           MPYDP   .M1X    B5:B4,A7:A6,A9:A8 ; |148| 
           NOP             2
           ZERO    .L1     A7

           MVKH    .S1     0x3fd00000,A7
||         MV      .L1X    B11,A6            ; |147| 

           ADDDP   .L1X    A7:A6,B9:B8,A7:A6 ; |147| 
           MV      .L2     B10,B4            ; |148| 
           SET     .S2     B29,0x15,0x1d,B5
           NOP             4
           MPYDP   .M1X    B7:B6,A7:A6,A7:A6 ; |147| 
           ADDDP   .L2X    B5:B4,A9:A8,B5:B4 ; |148| 
           SET     .S1     A31,0x1e,0x1e,A9
           NOP             8
           SUBDP   .L2X    B5:B4,A7:A6,B5:B4 ; |148| 
           MV      .L1X    B11,A8            ; |153| 
           MV      .L2X    A9,B19            ; |153| 
           NOP             4
           RCPDP   .S2     B5:B4,B9:B8       ; |153| 
           NOP             1
           MPYDP   .M2     B5:B4,B9:B8,B7:B6 ; |153| 
           NOP             9
           SUBDP   .L2X    A9:A8,B7:B6,B7:B6 ; |153| 
           NOP             6
           MPYDP   .M2     B9:B8,B7:B6,B9:B8 ; |153| 
           NOP             9
           MPYDP   .M2     B5:B4,B9:B8,B7:B6 ; |153| 
           NOP             9
           SUBDP   .L2     B19:B18,B7:B6,B7:B6 ; |153| 
           NOP             6
           MPYDP   .M2     B9:B8,B7:B6,B7:B6 ; |153| 
           NOP             9
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |153| 
           MVKL    .S2     0xc086232b,B9
           MVKL    .S2     0xdd7abcd2,B8
           MVKH    .S2     0xc086232b,B9
           MVKH    .S2     0xdd7abcd2,B8
           NOP             6
           SUBDP   .L1X    A9:A8,B5:B4,A9:A8 ; |153| 
           INTDP   .L2X    A3,B5:B4          ; |180| 
           CMPLTDP .S1X    A5:A4,B9:B8,A1    ; |161| 
           LDW     .D2T2   *B27,B8           ; |213| 
           NOP             3
           MPYDP   .M1X    B7:B6,A9:A8,A9:A8 ; |153| 
           NOP             9
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |153| 
           ADD     .L2     B28,B16,B6        ; |153| 
           SHL     .S2     B6,20,B17         ; |153| 
           CMPEQDP .S1X    A25:A24,B5:B4,A16 ; |180| 
           ZERO    .L2     B7:B6             ; |180| 
           CMPLTDP .S2X    A21:A20,B7:B6,B4  ; |180| 
           ZERO    .L2     B16               ; |153| 
           AND     .L2X    A16,B4,B4         ; |180| 
           AND     .L2X    A17,B4,B0         ; |180| 
           MVK     .L2     0x1,B4            ; |176| 
           ADDDP   .L1X    B13:B12,A7:A6,A7:A6 ; |153| 
   [ B0]   ADD     .L2     -2,B4,B4
           INTDP   .L2     B4,B5:B4          ; |192| 
           MVKL    .S1     0xfefa39cc,A8
           INTDP   .L2X    A3,B7:B6          ; |194| 
           MVKL    .S1     0x40862e42,A9
           MVKH    .S1     0xfefa39cc,A8
           MPYDP   .M1X    B17:B16,A7:A6,A7:A6 ; |153| 
           MVKH    .S1     0x40862e42,A9
           CMPGTDP .S1     A5:A4,A9:A8,A0    ; |156| 
           CMPEQDP .S2X    A25:A24,B7:B6,B6  ; |194| 
           ADD     .L1X    A11,B8,A29        ; |213| 
           XOR     .L2     1,B6,B26          ; |194| 
           NOP             4

   [ A0]   MVKL    .S1     0x7fefffff,A7
|| [ A0]   MVK     .L1     0xffffffff,A6     ; |157| 

   [ A0]   MVKH    .S1     0x7fefffff,A7
   [ A1]   ZERO    .L1     A7:A6             ; |162| 
           MPYDP   .M1X    A7:A6,B5:B4,A5:A4 ; |192| 
           NOP             2

           ZERO    .L2     B5:B4             ; |198| 
||         ZERO    .L1     A7:A6             ; |198| 

           CMPEQDP .S2X    A21:A20,B5:B4,B7  ; |198| 
||         CMPLTDP .S1     A25:A24,A7:A6,A3  ; |198| 

           ZERO    .L2     B5:B4             ; |194| 
           SET     .S1     A30,0x0,0x1e,A7
           CMPLTDP .S2X    A21:A20,B5:B4,B4  ; |194| 
           AND     .L1X    A3,B7,A0          ; |198| 
           AND     .L2     B26,B4,B0         ; |194| 

   [ B0]   MV      .L1X    B25,A4            ; |195| 
|| [ B0]   MV      .S1     A7,A5             ; |195| 
|| [ A0]   LDW     .D2T1   *+SP(16),A5       ; |199| 

   [ A0]   LDW     .D2T1   *+SP(12),A4       ; |195| 
           NOP             4

           STDW    .D1T1   A5:A4,*A29        ; |213| 
||         MVC     .S2     TSCL,B6           ; |128| 

           MVC     .S2     TSCH,B7           ; |128| 

           MVKL    .S2     _t_offset,B4
||         SUB     .L1     A10,1,A0          ; |206| 
||         MVKL    .S1     _t_stop,A3
||         ADD     .D1     8,A11,A11         ; |206| 

           MVKH    .S2     _t_offset,B4
||         MVKL    .S1     _cycle_counts+24,A14
|| [ A0]   ZERO    .L1     A5
|| [ A0]   MV      .D1X    B11,A4            ; |208| 

           LDDW    .D2T2   *B4,B17:B16       ; |130| 
||         MVKL    .S2     _cycle_counts+24,B24
||         MVKH    .S1     _t_stop,A3
||         SUB     .L1     A10,1,A10         ; |206| 

           STDW    .D1T2   B7:B6,*A3         ; |128| 
||         MVKH    .S2     _cycle_counts+24,B24

           LDDW    .D2T2   *B24,B9:B8        ; |130| 
           MVKH    .S1     _cycle_counts+24,A14
   [ A0]   MVKH    .S1     0x40340000,A5
           ADDU    .L2     B16,B20,B5:B4     ; |130| 

           ADD     .S2     B5,B17,B16        ; |130| 
|| [ A0]   B       .S1     $C$L15            ; |206| 
||         SUBU    .L2     B6,B4,B5:B4       ; |130| 

   [ A0]   CALL    .S1     _gimme_random     ; |208| 
||         ADD     .D2     B16,B21,B16       ; |130| 
||         EXT     .S2     B5,24,24,B17      ; |130| 
||         ADDU    .L2     B8,B4,B5:B4       ; |130| 

           SUB     .L2     B7,B16,B16        ; |130| 
||         MV      .S2     B4,B8             ; |130| 
||         ADD     .D2     B5,B9,B4          ; |130| 

           ADD     .L2     B16,B17,B5        ; |130| 

           ADD     .L2     B4,B5,B9          ; |130| 
|| [ A0]   ZERO    .S2     B5
|| [ A0]   MV      .D2     B10,B4            ; |208| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D1T2   B9:B8,*A14        ; |130| 
|| [ A0]   MVKH    .S2     0xc0240000,B5

           ; BRANCHCC OCCURS {$C$L15}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A14,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL35,B3,3      ; |135| 
$C$RL35:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A12
           SET     .S1     A12,0x1a,0x1d,A12
           MPYSP   .M1     A12,A4,A3         ; |135| 
           MV      .L1X    B13,A11           ; |135| 
           MV      .L1X    B11,A10           ; |135| 
           NOP             1
           SPDP    .S1     A3,A5:A4          ; |135| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |135| 
           CALLP   .S2     __fixdlli,B3
$C$RL36:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18

           MVK     .S2     24,B12
||         MV      .L2X    A14,B4

           SUB     .L2X    A14,B12,B12
||         MV      .S2     B10,B5            ; |114| 
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           STDW    .D2T2   B11:B10,*B12      ; |114| 
||         MVC     .S2     B5,TSCL           ; |115| 

           MVC     .S2     TSCL,B6           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B7             ; |116| 

           STDW    .D1T2   B7:B6,*A15        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B8           ; |117| 

           LDW     .D1T2   *+A13(4),B13
||         MVKL    .S2     _t_offset,B31

           LDW     .D1T1   *A13,A14
||         MVK     .S2     0x80,B30

           SUBU    .L2     B4,B6,B5:B4       ; |117| 
||         MVKH    .S2     _t_offset,B31

           EXT     .S2     B5,24,24,B7       ; |117| 
||         SUB     .L2     B8,B7,B5          ; |117| 
||         MVKL    .S1     _output,A3

           ADD     .L2     B5,B7,B7          ; |117| 
||         MV      .S2     B4,B6             ; |117| 
||         MVKH    .S1     _output,A3
||         STW     .D2T2   B30,*+SP(12)      ; |117| 

           STDW    .D2T2   B7:B6,*B31        ; |117| 
||         CALL    .S1     _pow              ; |221| 
||         LDW     .D1T1   *A3,A10

           LDDW    .D1T1   *A14++,A5:A4      ; |221| 
||         LDDW    .D2T2   *B13++,B5:B4      ; |221| 

           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL37,B3,0      ; |221| 
$C$RL37:   ; CALL OCCURS {_pow} {0}          ; |221| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           LDW     .D2T2   *+SP(12),B4       ; |221| 
           STDW    .D1T1   A5:A4,*A10++      ; |221| 
           NOP             3

           SUB     .L1X    B4,1,A0           ; |220| 
||         SUB     .L2     B4,1,B4           ; |220| 

   [ A0]   B       .S1     $C$L16            ; |220| 
||         STW     .D2T2   B4,*+SP(12)       ; |221| 

   [ A0]   LDDW    .D2T2   *B13++,B5:B4      ; |221| 
|| [ A0]   CALL    .S1     _pow              ; |221| 

   [ A0]   LDDW    .D1T1   *A14++,A5:A4      ; |221| 
           NOP             3
           ; BRANCHCC OCCURS {$C$L16}        ; |220| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_offset,B13
||         LDDW    .D1T1   *A15,A7:A6        ; |130| 

           MVKH    .S2     _t_offset,B13
           LDDW    .D2T2   *B13,B9:B8        ; |130| 
           MV      .L2     B4,B7             ; |128| 
           MVKL    .S2     _t_stop,B30
           MVKH    .S2     _t_stop,B30
           NOP             1
           ADDU    .L1X    B8,A6,A5:A4       ; |130| 

           ADD     .L1X    A5,B9,A31         ; |130| 
||         LDDW    .D2T2   *B12,B9:B8        ; |130| 

           ADD     .L1     A31,A7,A3         ; |130| 
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

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL38,B3,0      ; |130| 

$C$RL38:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 13
           MPYSP   .M1     A12,A4,A3         ; |130| 
           MV      .L1X    B11,A10           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL39:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18

           MV      .L2     B10,B4            ; |114| 
||         STDW    .D2T2   B11:B10,*+B12(8)  ; |114| 

           STDW    .D2T1   A5:A4,*B12        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B9             ; |116| 

           STDW    .D1T2   B9:B8,*A15        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B6           ; |117| 
           SUBU    .L2     B4,B8,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B6,B9,B5          ; |117| 

           ADD     .L2     B5,B6,B5          ; |117| 

           STDW    .D2T2   B5:B4,*B13        ; |117| 
||         MVK     .S2     0x80,B4

           MV      .L1     A10,A14

           MV      .L1X    B4,A10            ; |117| 
||         MVKL    .S2     _input,B4

           MVKH    .S2     _input,B4
           LDW     .D2T2   *B4,B4            ; |229| 
           LDW     .D2T1   *+SP(28),A12      ; |117| 
           ADD     .L1     4,A13,A13
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D1T1   *A13,A3           ; |229| 
           ADD     .L2X    A14,B4,B4         ; |229| 
           LDDW    .D2T2   *B4,B7:B6         ; |229| 
           NOP             2
           ADD     .L1     A14,A3,A3         ; |229| 
           LDDW    .D1T1   *A3,A5:A4         ; |229| 
           CALL    .S1     _powdp            ; |229| 
           ADDKPC  .S2     $C$RL40,B3,2      ; |229| 

           MV      .L2X    A4,B4             ; |229| 
||         MV      .L1X    B6,A4             ; |229| 

           MV      .L2X    A5,B5             ; |229| 
||         MV      .L1X    B7,A5             ; |229| 

$C$RL40:   ; CALL OCCURS {_powdp} {0}        ; |229| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D1T1   *A12,A3           ; |229| 
||         SUB     .L1     A10,1,A0          ; |228| 

   [ A0]   MVKL    .S2     _input,B4
|| [ A0]   B       .S1     $C$L17            ; |228| 

   [ A0]   MVKH    .S2     _input,B4
   [ A0]   LDW     .D2T2   *B4,B4            ; |229| 
           SUB     .L1     A10,1,A10         ; |228| 

           ADD     .L1     A14,A3,A3         ; |229| 
||         ADD     .S1     8,A14,A14         ; |228| 

           STDW    .D1T1   A5:A4,*A3         ; |229| 
           ; BRANCHCC OCCURS {$C$L17}        ; |228| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MV      .L2     B13,B4            ; |128| 
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 

           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           MVKL    .S2     _t_stop,B31
           MV      .L2     B5,B7             ; |128| 
           LDDW    .D2T2   *+B12(8),B5:B4    ; |130| 
           MVKH    .S2     _t_stop,B31
           ADDU    .L1X    B8,A4,A7:A6       ; |130| 
           ADD     .L1X    A7,B9,A4          ; |130| 

           ADD     .L1     A4,A5,A3          ; |130| 
||         SUBU    .L2X    B6,A6,B9:B8       ; |130| 

           EXT     .S2     B9,24,24,B16      ; |130| 
||         ADDU    .L2     B4,B8,B9:B8       ; |130| 
||         CALL    .S1     __fltllif         ; |130| 

           SUB     .L2X    B7,A3,B4          ; |130| 
||         ADD     .S2     B9,B5,B5          ; |130| 

           MV      .L1X    B8,A4             ; |130| 
||         ADD     .L2     B4,B16,B8         ; |130| 

           ADD     .L2     B5,B8,B4          ; |130| 
           STDW    .D2T2   B7:B6,*B31        ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL41,B3,0      ; |130| 

$C$RL41:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1X    B11,A10           ; |130| 
           NOP             2
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL42:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 18
           STDW    .D2T2   B11:B10,*+B12(16) ; |114| 

           ADDAD   .D2     B12,1,B13
||         MV      .L2     B10,B4            ; |114| 

           STDW    .D2T1   A5:A4,*B13        ; |130| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B9             ; |116| 

           STDW    .D1T2   B9:B8,*A15        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B6           ; |117| 
           MVKL    .S2     _t_offset,B30

           SUBU    .L2     B4,B8,B5:B4       ; |117| 
||         MVKH    .S2     _t_offset,B30

           SUB     .L2     B6,B9,B31         ; |117| 
||         MV      .D2     B4,B6             ; |117| 
||         MVK     .S2     0x80,B4

           EXT     .S2     B5,24,24,B7       ; |117| 

           ADD     .L2     B31,B7,B7         ; |117| 
||         MV      .L1     A13,A14
||         MV      .S1     A10,A13
||         MV      .D1X    B4,A10            ; |117| 
||         MVKL    .S2     _input,B4

           MVKH    .S2     _input,B4
||         STDW    .D2T2   B7:B6,*B30        ; |117| 

           LDW     .D2T2   *B4,B4            ; |237| 
           LDW     .D2T1   *+SP(32),A12      ; |117| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 13
           LDW     .D1T1   *A14,A3           ; |237| 
           ADD     .L2X    A13,B4,B4         ; |237| 
           LDDW    .D2T2   *B4,B7:B6         ; |237| 
           NOP             2
           ADD     .L1     A13,A3,A3         ; |237| 
           LDDW    .D1T1   *A3,A5:A4         ; |237| 
           CALL    .S1     _powdp_c          ; |237| 
           ADDKPC  .S2     $C$RL43,B3,2      ; |237| 

           MV      .L2X    A4,B4             ; |237| 
||         MV      .L1X    B6,A4             ; |237| 

           MV      .L2X    A5,B5             ; |237| 
||         MV      .L1X    B7,A5             ; |237| 

$C$RL43:   ; CALL OCCURS {_powdp_c} {0}      ; |237| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D1T1   *A12,A3           ; |237| 
||         SUB     .L1     A10,1,A0          ; |236| 

   [ A0]   MVKL    .S2     _input,B4
|| [ A0]   B       .S1     $C$L18            ; |236| 

   [ A0]   MVKH    .S2     _input,B4
   [ A0]   LDW     .D2T2   *B4,B4            ; |237| 
           SUB     .L1     A10,1,A10         ; |236| 

           ADD     .L1     A13,A3,A3         ; |237| 
||         ADD     .S1     8,A13,A13         ; |236| 

           STDW    .D1T1   A5:A4,*A3         ; |237| 
           ; BRANCHCC OCCURS {$C$L18}        ; |236| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 17
           MVC     .S2     TSCL,B6           ; |128| 
           MVC     .S2     TSCH,B5           ; |128| 

           MVKL    .S2     _t_offset,B4
||         MV      .L1     A15,A12           ; |128| 

           MVKH    .S2     _t_offset,B4
||         LDDW    .D1T1   *A12,A5:A4        ; |130| 

           LDDW    .D2T2   *B4,B9:B8         ; |130| 
           MV      .L2     B12,B31           ; |130| 
           LDDW    .D2T2   *+B31(16),B17:B16 ; |130| 
           MV      .L2     B5,B7             ; |128| 
           MV      .L1X    B12,A13           ; |130| 
           ADDU    .L2X    B8,A4,B5:B4       ; |130| 

           ADD     .S2     B5,B9,B8          ; |130| 
||         SUBU    .L2     B6,B4,B5:B4       ; |130| 

           ADD     .D2X    B8,A5,B8          ; |130| 
||         CALL    .S1     __fltllif         ; |130| 
||         EXT     .S2     B5,24,24,B9       ; |130| 
||         ADDU    .L2     B16,B4,B5:B4      ; |130| 

           SUB     .L2     B7,B8,B8          ; |130| 
||         ADD     .S2     B5,B17,B30        ; |130| 

           ADD     .L2     B8,B9,B5          ; |130| 
||         MV      .L1X    B4,A4             ; |130| 
||         MVKL    .S2     _t_stop,B8

           ADD     .L2     B30,B5,B4         ; |130| 
||         MVKH    .S2     _t_stop,B8

           STDW    .D2T2   B7:B6,*B8         ; |128| 

           MV      .L1X    B4,A5             ; |130| 
||         ADDKPC  .S2     $C$RL44,B3,0      ; |130| 

$C$RL44:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 112
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           MV      .L1X    B11,A10           ; |130| 
           NOP             3
           SPDP    .S2X    A3,B5:B4          ; |130| 
           NOP             2
           ADDDP   .L1X    A11:A10,B5:B4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL45:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 

           ADDAD   .D2     B13,1,B12
||         MV      .L2X    A13,B4

           MV      .L2     B10,B31           ; |114| 
||         STDW    .D2T2   B11:B10,*+B4(32)  ; |114| 

           STDW    .D2T1   A5:A4,*B12        ; |130| 
||         MVC     .S2     B31,TSCL          ; |115| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 

           STDW    .D1T2   B5:B4,*A15        ; |116| 
||         MVC     .S2     TSCL,B8           ; |117| 

           MVC     .S2     TSCH,B6           ; |117| 
           MVKL    .S1     _input,A3

           MVKH    .S1     _input,A3
||         MV      .L2X    A14,B7            ; |117| 
||         MVKL    .S2     _t_offset,B10

           SUBU    .L2     B8,B4,B9:B8       ; |117| 
||         SUB     .D2     B6,B5,B5          ; |117| 
||         MVKH    .S2     _t_offset,B10

           MVKL    .S1     _output,A13
||         MV      .L2X    A3,B16            ; |244| 
||         LDW     .D2T2   *B7,B4            ; |244| 
||         EXT     .S2     B9,24,24,B6       ; |117| 

           MVKH    .S1     _output,A13
||         LDW     .D2T1   *B16,A4           ; |244| 
||         ADD     .L2     B5,B6,B9          ; |117| 
||         MVK     .S2     0x80,B6           ; |244| 

           CALLP   .S2     _powdp_v,B3
||         LDW     .D1T1   *+A13(16),A6      ; |244| 
||         STDW    .D2T2   B9:B8,*B10        ; |117| 

$C$RL46:   ; CALL OCCURS {_powdp_v} {0}      ; |244| 
           MVC     .S2     TSCL,B8           ; |128| 
           MVC     .S2     TSCH,B4           ; |128| 

           LDDW    .D1T1   *A15,A9:A8        ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 

           MVK     .S1     16,A12
           ADD     .L1X    B12,A12,A12
           LDDW    .D1T1   *A12,A7:A6        ; |130| 
           MVKL    .S1     _t_stop,A3
           ADDU    .L1X    B6,A8,A5:A4       ; |130| 

           MVKH    .S1     _t_stop,A3
||         SUBU    .L1X    B8,A4,A17:A16     ; |130| 

           ADD     .L1X    A5,B7,A4          ; |130| 
||         MV      .L2     B4,B9             ; |128| 

           ADD     .L1     A4,A9,A4          ; |130| 
||         MV      .L2X    A3,B4             ; |128| 
||         MV      .D1     A16,A3            ; |130| 
||         EXT     .S1     A17,24,24,A8      ; |130| 

           SUB     .S1X    B9,A4,A3          ; |130| 
||         ADDU    .L1     A6,A3,A5:A4       ; |130| 

           ADD     .L1     A5,A7,A3          ; |130| 
||         ADD     .S1     A3,A8,A5          ; |130| 

           CALLP   .S2     __fltllif,B3
||         ADD     .L1     A3,A5,A5          ; |130| 
||         STDW    .D2T2   B9:B8,*B4         ; |128| 

$C$RL47:   ; CALL OCCURS {__fltllif} {0}     ; |130| 
           ZERO    .L1     A3
           SET     .S1     A3,0x1a,0x1d,A3
           MPYSP   .M1     A3,A4,A3          ; |130| 
           NOP             3
           SPDP    .S1     A3,A5:A4          ; |130| 
           NOP             1
           ADDDP   .L1     A11:A10,A5:A4,A5:A4 ; |130| 
           CALLP   .S2     __fixdlli,B3
$C$RL48:   ; CALL OCCURS {__fixdlli} {0}     ; |130| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           STDW    .D1T1   A5:A4,*A12        ; |130| 
||         MVKH    .S2     0x3ddb7cdf,B7

           LDW     .D1T2   *+A13(4),B4       ; |66| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A13,A4           ; |66| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x9,A8            ; |66| 

$C$RL49:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     _fcn_pass,B10
           MVKH    .S2     0x3ddb7cdf,B7
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A13,A4           ; |67| 
||         MVKH    .S2     _fcn_pass,B10

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A13(8),B4       ; |67| 
||         STW     .D2T1   A3,*+B10(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x9,A8            ; |67| 

$C$RL50:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(8)       ; |67| 
||         LDW     .D1T2   *+A13(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A13,A4           ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x9,A8            ; |68| 

$C$RL51:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           LDW     .D2T1   *+SP(108),A3      ; |68| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A4,*+B10(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T1   *A13,A4           ; |69| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *A3,B4            ; |69| 
||         MVK     .S1     0x80,A6           ; |69| 
||         MVK     .L1     0x9,A8            ; |69| 

$C$RL52:   ; CALL OCCURS {_isequal} {0}      ; |69| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           LDW     .D2T1   *+SP(112),A3      ; |69| 
           LDW     .D2T2   *+SP(116),B5
           MV      .L2X    A4,B4             ; |69| 
           STW     .D2T2   B4,*+B10(16)      ; |69| 
           NOP             1
           LDW     .D1T2   *A3,B0            ; |72| 
           NOP             4

   [!B0]   BNOP    .S1     $C$L19,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B5,B0            ; |72| 

   [ B1]   ADD     .L2     4,B5,B5
           ; BRANCHCC OCCURS {$C$L19}        ; |72| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
   [ B0]   LDW     .D2T2   *B5,B6            ; |72| 
           CMPEQ   .L2     B4,0,B31          ; |72| 
           XOR     .L2     1,B31,B5          ; |72| 
           MVK     .L1     0x1,A3            ; |72| 
           NOP             1
   [ B0]   CMPEQ   .L2     B6,0,B4           ; |72| 
   [ B0]   XOR     .L2     1,B4,B4           ; |72| 

   [ B0]   AND     .L2     B5,B4,B0          ; |72| 
|| [!B0]   ZERO    .S2     B0                ; |72| 

   [ B0]   B       .S1     $C$L20            ; |72| 
   [ B0]   CALL    .S1     _print_test_results ; |250| 
   [ B0]   MVKL    .S1     _all_pass,A4
   [ B0]   MVKH    .S1     _all_pass,A4
           NOP             2
           ; BRANCHCC OCCURS {$C$L20}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |250| 
           MVKL    .S1     _all_pass,A4
           MVKH    .S1     _all_pass,A4
           MV      .L1     A10,A3
           NOP             1
;** --------------------------------------------------------------------------*
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 1

           STW     .D1T1   A3,*A4            ; |72| 
||         MVK     .L1     0x2,A4            ; |250| 
||         ADDKPC  .S2     $C$RL53,B3,0      ; |250| 

$C$RL53:   ; CALL OCCURS {_print_test_results} {0}  ; |250| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     $C$SL2+0,B4
           MVKH    .S2     $C$SL2+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |251| 

$C$RL54:   ; CALL OCCURS {_printf} {0}       ; |251| 
           MVKL    .S2     $C$SL3+0,B4
           MVKH    .S2     $C$SL3+0,B4

           CALLP   .S2     _printf,B3
||         STW     .D2T2   B4,*+SP(4)        ; |251| 

$C$RL55:   ; CALL OCCURS {_printf} {0}       ; |251| 
           MVKL    .S1     $C$SL1+0,A10
           MVKH    .S1     $C$SL1+0,A10

           CALLP   .S2     _print_profile_results,B3
||         MV      .L1     A10,A4            ; |258| 

$C$RL56:   ; CALL OCCURS {_print_profile_results} {0}  ; |258| 

           CALLP   .S2     _print_memory_results,B3
||         MV      .L1     A10,A4            ; |261| 

$C$RL57:   ; CALL OCCURS {_print_memory_results} {0}  ; |261| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           ADDK    .S2     176,SP            ; |262| 
           LDW     .D2T2   *++SP(8),B3       ; |262| 
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
$C$SL1:	.string	"powDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_pow
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_powdp
	.global	_powdp_c
	.global	_powdp_v
	.global	_t_start
	.global	_t_stop
	.global	_t_offset
	.global	_cycle_counts
	.global	_fcn_pass
	.global	_all_pass
	.global	_a_ext
	.global	_b_ext
	.global	_a_sc
	.global	_b_sc
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
