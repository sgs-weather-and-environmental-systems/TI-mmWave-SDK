;******************************************************************************
;* TMS320C6x C/C++ Codegen                                          PC v7.4.2 *
;* Date/Time created: Tue May 17 00:00:33 2016                                *
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
	.word	055e8f352h,0bf768183h		; _a[0] @ 0
	.word	00bfd8f37h,03fb83988h		; _a[1] @ 64
	.word	003475d37h,0bf90e115h		; _a[2] @ 128
	.word	0564f1714h,03f96816fh		; _a[3] @ 192
	.word	0fd8a59e1h,0bf9c21c8h		; _a[4] @ 256
	.word	0a84909dfh,03fa0e111h		; _a[5] @ 320
	.word	0d1cce6ceh,0bfa3b13eh		; _a[6] @ 384
	.word	0a56a8834h,03fa6816bh		; _a[7] @ 448
	.word	0ceee6523h,0bfa95198h		; _a[8] @ 512
	.word	0f8724212h,03fac21c5h		; _a[9] @ 576
	.word	0cc0fe378h,0bfaef1f2h		; _a[10] @ 640
	.word	0fac9e033h,03fb0e10fh		; _a[11] @ 704
	.word	08f8bceabh,0bfb24926h		; _a[12] @ 768
	.word	0f95a9f5eh,03fb3b13ch		; _a[13] @ 832
	.word	08e1c8dd5h,0bfb51953h		; _a[14] @ 896
	.word	0f7eb5e88h,03fb68169h		; _a[15] @ 960
	.word	08cad4d00h,0bfb7e980h		; _a[16] @ 1024
	.word	0216f3b77h,03fb95197h		; _a[17] @ 1088
	.word	03557d0a1h,0bfbab9adh		; _a[18] @ 1152
	.word	09f26a154h,03fbc21c3h		; _a[19] @ 1216
	.word	008f57208h,0bfbd89dah		; _a[20] @ 1280
	.word	072c442bbh,03fbef1f0h		; _a[21] @ 1344
	.word	045091e8dh,0bfc02d04h		; _a[22] @ 1408
	.word	079f086e6h,03fc0e10fh		; _a[23] @ 1472
	.word	0aed7ef40h,0bfc1951ah		; _a[24] @ 1536
	.word	0e3bf5799h,03fc24925h		; _a[25] @ 1600
	.word	018a6bff3h,0bfc2fd31h		; _a[26] @ 1664
	.word	04d8e284ch,03fc3b13ch		; _a[27] @ 1728
	.word	0827590a6h,0bfc46547h		; _a[28] @ 1792
	.word	0b75cf8ffh,03fc51952h		; _a[29] @ 1856
	.word	0ec446159h,0bfc5cd5dh		; _a[30] @ 1920
	.word	0212bc9b2h,03fc68169h		; _a[31] @ 1984
	.word	05613320ch,0bfc73574h		; _a[32] @ 2048
	.word	08afa9a65h,03fc7e97fh		; _a[33] @ 2112
	.word	0bfe202bfh,0bfc89d8ah		; _a[34] @ 2176
	.word	0f4c96b18h,03fc95195h		; _a[35] @ 2240
	.word	029b0d372h,0bfca05a1h		; _a[36] @ 2304
	.word	05e983bcch,03fcab9ach		; _a[37] @ 2368
	.word	06a3f38fbh,0bfcb6db8h		; _a[38] @ 2432
	.word	09f26a154h,03fcc21c3h		; _a[39] @ 2496
	.word	0d40e09aeh,0bfccd5ceh		; _a[40] @ 2560
	.word	008f57208h,03fcd89dah		; _a[41] @ 2624
	.word	03ddcda61h,0bfce3de5h		; _a[42] @ 2688
	.word	072c442bbh,03fcef1f0h		; _a[43] @ 2752
	.word	0a7abab14h,0bfcfa5fbh		; _a[44] @ 2816
	.word	06e4989b7h,03fd02d03h		; _a[45] @ 2880
	.word	008bd3de4h,0bfd08709h		; _a[46] @ 2944
	.word	0a330f210h,03fd0e10eh		; _a[47] @ 3008
	.word	03da4a63dh,0bfd13b14h		; _a[48] @ 3072
	.word	0d8185a6ah,03fd19519h		; _a[49] @ 3136
	.word	0728c0e97h,0bfd1ef1fh		; _a[50] @ 3200
	.word	00cffc2c3h,03fd24925h		; _a[51] @ 3264
	.word	012d3415bh,0bfd2a32bh		; _a[52] @ 3328
	.word	0ad46f588h,03fd2fd30h		; _a[53] @ 3392
	.word	047baa9b5h,0bfd35736h		; _a[54] @ 3456
	.word	0e22e5de1h,03fd3b13bh		; _a[55] @ 3520
	.word	07ca2120eh,0bfd40b41h		; _a[56] @ 3584
	.word	01715c63bh,03fd46547h		; _a[57] @ 3648
	.word	0b1897a68h,0bfd4bf4ch		; _a[58] @ 3712
	.word	04bfd2e94h,03fd51952h		; _a[59] @ 3776
	.word	0e670e2c1h,0bfd57357h		; _a[60] @ 3840
	.word	080e496eeh,03fd5cd5dh		; _a[61] @ 3904
	.word	01b584b1bh,0bfd62763h		; _a[62] @ 3968
	.word	0b5cbff47h,03fd68168h		; _a[63] @ 4032
	.word	0503fb374h,0bfd6db6eh		; _a[64] @ 4096
	.word	0eab367a1h,03fd73573h		; _a[65] @ 4160
	.word	0f086e639h,0bfd78f79h		; _a[66] @ 4224
	.word	08afa9a65h,03fd7e97fh		; _a[67] @ 4288
	.word	0256e4e92h,0bfd84385h		; _a[68] @ 4352
	.word	0bfe202bfh,03fd89d8ah		; _a[69] @ 4416
	.word	05a55b6ech,0bfd8f790h		; _a[70] @ 4480
	.word	0f4c96b18h,03fd95195h		; _a[71] @ 4544
	.word	08f3d1f45h,0bfd9ab9bh		; _a[72] @ 4608
	.word	029b0d372h,03fda05a1h		; _a[73] @ 4672
	.word	0c424879fh,0bfda5fa6h		; _a[74] @ 4736
	.word	05e983bcch,03fdab9ach		; _a[75] @ 4800
	.word	0f90beff8h,0bfdb13b1h		; _a[76] @ 4864
	.word	0937fa425h,03fdb6db7h		; _a[77] @ 4928
	.word	02df35852h,0bfdbc7bdh		; _a[78] @ 4992
	.word	0c8670c7fh,03fdc21c2h		; _a[79] @ 5056
	.word	062dac0abh,0bfdc7bc8h		; _a[80] @ 5120
	.word	0fd4e74d8h,03fdcd5cdh		; _a[81] @ 5184
	.word	097c22905h,0bfdd2fd3h		; _a[82] @ 5248
	.word	03235dd32h,03fdd89d9h		; _a[83] @ 5312
	.word	0cca9915eh,0bfdde3deh		; _a[84] @ 5376
	.word	0d27d0ff6h,03fde3de4h		; _a[85] @ 5440
	.word	06cf0c423h,0bfde97eah		; _a[86] @ 5504
	.word	007647850h,03fdef1f0h		; _a[87] @ 5568
	.word	0a1d82c7ch,0bfdf4bf5h		; _a[88] @ 5632
	.word	03c4be0a9h,03fdfa5fbh		; _a[89] @ 5696
	.word	000000000h,0bfe00000h		; _a[90] @ 5760
	.word	0a5467606h,03fe59f22h		; _a[91] @ 5824
	.word	04a8cec0ch,0bfeb3e45h		; _a[92] @ 5888
	.word	0dd11be6eh,03ff06eb3h		; _a[93] @ 5952
	.word	0803cd142h,0bff33e45h		; _a[94] @ 6016
	.word	016f86a0ah,03ff60dd6h		; _a[95] @ 6080
	.word	0ba237cddh,0bff8dd67h		; _a[96] @ 6144
	.word	05d4e8fb0h,03ffbacf9h		; _a[97] @ 6208
	.word	0f40a2878h,0bffe7c89h		; _a[98] @ 6272
	.word	0cb9a9da6h,04000a60dh		; _a[99] @ 6336
	.word	09d30270fh,0c0020dd6h		; _a[100] @ 6400
	.word	0e88df373h,04003759eh		; _a[101] @ 6464
	.word	0ba237cddh,0c004dd67h		; _a[102] @ 6528
	.word	08bb90646h,040064530h		; _a[103] @ 6592
	.word	05d4e8fb0h,0c007acf9h		; _a[104] @ 6656
	.word	0a8ac5c14h,0400914c1h		; _a[105] @ 6720
	.word	07a41e57eh,0c00a7c8ah		; _a[106] @ 6784
	.word	0c59fb1e2h,0400be452h		; _a[107] @ 6848
	.word	097353b4bh,0c00d4c1bh		; _a[108] @ 6912
	.word	068cac4b5h,0400eb3e4h		; _a[109] @ 6976
	.word	09d30270fh,0c0100dd6h		; _a[110] @ 7040
	.word	0c2df0d41h,04010c1bah		; _a[111] @ 7104
	.word	02ba9d1f6h,0c011759fh		; _a[112] @ 7168
	.word	0947496abh,040122983h		; _a[113] @ 7232
	.word	0ba237cddh,0c012dd67h		; _a[114] @ 7296
	.word	022ee4192h,04013914ch		; _a[115] @ 7360
	.word	0489d27c4h,0c0144530h		; _a[116] @ 7424
	.word	0b167ec78h,04014f914h		; _a[117] @ 7488
	.word	01a32b12dh,0c015acf9h		; _a[118] @ 7552
	.word	03fe1975fh,0401660ddh		; _a[119] @ 7616
	.word	0a8ac5c14h,0c01714c1h		; _a[120] @ 7680
	.word	0117720c9h,04017c8a6h		; _a[121] @ 7744
	.word	07a41e57eh,0c0187c8ah		; _a[122] @ 7808
	.word	09ff0cbb0h,04019306eh		; _a[123] @ 7872
	.word	008bb9064h,0c019e453h		; _a[124] @ 7936
	.word	071865519h,0401a9837h		; _a[125] @ 8000
	.word	097353b4bh,0c01b4c1bh		; _a[126] @ 8064
	.word	000000000h,0401c0000h		; _a[127] @ 8128
	.word	068cac4b5h,0c01cb3e4h		; _a[128] @ 8192
	.word	08e79aae7h,0401d67c8h		; _a[129] @ 8256
	.word	0f7446f9ch,0c01e1bach		; _a[130] @ 8320
	.word	0600f3450h,0401ecf91h		; _a[131] @ 8384
	.word	085be1a82h,0c01f8375h		; _a[132] @ 8448
	.word	0f7446f9ch,040201bach		; _a[133] @ 8512
	.word	02ba9d1f6h,0c020759fh		; _a[134] @ 8576
	.word	03e81450fh,04020cf91h		; _a[135] @ 8640
	.word	072e6a769h,0c0212983h		; _a[136] @ 8704
	.word	0a74c09c4h,040218375h		; _a[137] @ 8768
	.word	0ba237cddh,0c021dd67h		; _a[138] @ 8832
	.word	01016ce79h,04022375ah		; _a[139] @ 8896
	.word	022ee4192h,0c022914ch		; _a[140] @ 8960
	.word	035c5b4abh,04022eb3eh		; _a[141] @ 9024
	.word	06a2b1705h,0c0234530h		; _a[142] @ 9088
	.word	09e90795fh,040239f22h		; _a[143] @ 9152
	.word	0b167ec78h,0c023f914h		; _a[144] @ 9216
	.word	0a2b17050h,040245306h		; _a[145] @ 9280
	.word	05d4e8fb0h,0c024acf9h		; _a[146] @ 9344
	.word	0c8605682h,0402506eah		; _a[147] @ 9408
	.word	082fd75e2h,0c02560ddh		; _a[148] @ 9472
	.word	03d9a9542h,04025bad0h		; _a[149] @ 9536
	.word	0a8ac5c14h,0c02614c1h		; _a[150] @ 9600
	.word	063497b74h,040266eb4h		; _a[151] @ 9664
	.word	0ce5b4246h,0c026c8a5h		; _a[152] @ 9728
	.word	088f861a6h,040272298h		; _a[153] @ 9792
	.word	0f40a2878h,0c0277c89h		; _a[154] @ 9856
	.word	0aea747d8h,04027d67ch		; _a[155] @ 9920
	.word	019b90eaah,0c028306eh		; _a[156] @ 9984
	.word	0d4562e0ah,040288a60h		; _a[157] @ 10048
	.word	08ef34d6ah,0c028e453h		; _a[158] @ 10112
	.word	0fa05143ch,040293e44h		; _a[159] @ 10176
	.word	0b4a2339ch,0c0299837h		; _a[160] @ 10240
	.word	01fb3fa6eh,04029f229h		; _a[161] @ 10304
	.word	0da5119ceh,0c02a4c1bh		; _a[162] @ 10368
	.word	04562e0a0h,0402aa60dh		; _a[163] @ 10432
	.word	000000000h,0c02b0000h		; _a[164] @ 10496
	.word	0ba9d1f60h,0402b59f2h		; _a[165] @ 10560
	.word	025aee632h,0c02bb3e4h		; _a[166] @ 10624
	.word	0e04c0592h,0402c0dd6h		; _a[167] @ 10688
	.word	04b5dcc64h,0c02c67c8h		; _a[168] @ 10752
	.word	005faebc4h,0402cc1bbh		; _a[169] @ 10816
	.word	0710cb296h,0c02d1bach		; _a[170] @ 10880
	.word	02ba9d1f6h,0402d759fh		; _a[171] @ 10944
	.word	0e646f156h,0c02dcf91h		; _a[172] @ 11008
	.word	05158b828h,0402e2983h		; _a[173] @ 11072
	.word	00bf5d788h,0c02e8376h		; _a[174] @ 11136
	.word	077079e5ah,0402edd67h		; _a[175] @ 11200
	.word	031a4bdbah,0c02f375ah		; _a[176] @ 11264
	.word	09cb6848ch,0402f914bh		; _a[177] @ 11328
	.word	05753a3ech,0c02feb3eh		; _a[178] @ 11392
	.word	088f861a6h,040302298h		; _a[179] @ 11456
	.word	03e81450fh,0c0304f91h		; _a[180] @ 11520
	.word	09bcfd4bfh,040307c8ah		; _a[181] @ 11584
	.word	05158b828h,0c030a983h		; _a[182] @ 11648
	.word	0aea747d8h,04030d67ch		; _a[183] @ 11712
	.word	064302b41h,0c0310375h		; _a[184] @ 11776
	.word	0c17ebaf1h,04031306eh		; _a[185] @ 11840
	.word	077079e5ah,0c0315d67h		; _a[186] @ 11904
	.word	0d4562e0ah,040318a60h		; _a[187] @ 11968
	.word	031a4bdbah,0c031b75ah		; _a[188] @ 12032
	.word	0e72da123h,04031e452h		; _a[189] @ 12096
	.word	0447c30d3h,0c032114ch		; _a[190] @ 12160
	.word	0fa05143ch,040323e44h		; _a[191] @ 12224
	.word	05753a3ech,0c0326b3eh		; _a[192] @ 12288
	.word	00cdc8755h,040329837h		; _a[193] @ 12352
	.word	06a2b1705h,0c032c530h		; _a[194] @ 12416
	.word	0c779a6b5h,04032f229h		; _a[195] @ 12480
	.word	07d028a1eh,0c0331f22h		; _a[196] @ 12544
	.word	0da5119ceh,040334c1bh		; _a[197] @ 12608
	.word	08fd9fd37h,0c0337914h		; _a[198] @ 12672
	.word	0ed288ce7h,04033a60dh		; _a[199] @ 12736
	.word	0a2b17050h,0c033d306h		; _a[200] @ 12800
$C$IR_1:	.set	1608

	.global	_a
_a:	.usect	".far",1608,8
;	C:\MATHLIB_Tools\CCSV5_5_0\ccsv5\tools\compiler\c6000_7.4.2\bin\opt6x.exe C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\027126 C:\\Users\\gtbldadm\\AppData\\Local\\Temp\\027128 
;**	Parameter deleted: req_flags == 1;
;**	Parameter deleted: tol == 1e-10;
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
||         MVKL    .S2     0xd9d7bdbb,B6

           STDW    .D2T1   A13:A12,*SP--     ; |63| 
||         MVKL    .S1     _output,A11
||         MVKL    .S2     0x3ddb7cdf,B7

           STW     .D2T1   A10,*SP--(8)      ; |63| 
||         MVKH    .S1     _output,A11
||         MVKH    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A11(4),B4       ; |66| 
||         MV      .L1     A4,A6             ; |63| 
||         MVKH    .S2     0x3ddb7cdf,B7
||         MVK     .S1     0x1,A8            ; |66| 

           MV      .L1X    B3,A13            ; |63| 
||         CALLP   .S2     _isequal,B3
||         MV      .S1     A4,A10            ; |63| 
||         LDW     .D1T1   *A11,A4           ; |66| 

$C$RL0:    ; CALL OCCURS {_isequal} {0}      ; |66| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 30
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           LDW     .D1T2   *+A11(8),B4       ; |67| 
||         MVKL    .S1     _fcn_pass,A12
||         MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A4,A3             ; |66| 
||         LDW     .D1T1   *A11,A4           ; |67| 
||         MVKH    .S1     _fcn_pass,A12
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A3,*+A12(4)       ; |66| 
||         MV      .L1     A10,A6            ; |67| 
||         MVK     .S1     0x1,A8            ; |67| 

$C$RL1:    ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           LDW     .D1T2   *+A11(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A3             ; |67| 
||         LDW     .D1T1   *A11,A4           ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A3,*+A12(8)       ; |67| 
||         MV      .L1     A10,A6            ; |68| 
||         MVK     .S1     0x1,A8            ; |68| 

$C$RL2:    ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           STW     .D1T1   A4,*+A12(12)      ; |68| 
||         MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A11,A3            ; |66| 
||         LDW     .D1T2   *+A11(16),B4      ; |69| 
||         MVKH    .S2     0xd9d7bdbb,B6

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
;*   Local Frame Size  : 8 Args + 0 Auto + 56 Save = 64 byte                  *
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

           STW     .D2T2   B3,*SP--(16)      ; |124| 
||         CALLP   .S2     _driver_init,B3
||         MVKH    .S1     $C$SL1+0,A4

$C$RL4:    ; CALL OCCURS {_driver_init} {0}  ; |132| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           MVKL    .S1     _a,A13
||         MVKL    .S2     _output,B10

           MVKH    .S1     _a,A13
||         MVKH    .S2     _output,B10

           MV      .L1     A13,A12
||         CALL    .S1     _tanh             ; |141| 
||         LDW     .D2T1   *B10,A11

           LDDW    .D1T1   *A12++,A5:A4      ; |141| 
           MVK     .S2     0xc9,B4
           NOP             1
           MV      .L1X    B4,A10
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L3:    
;          EXCLUSIVE CPU CYCLES: 1
           ADDKPC  .S2     $C$RL5,B3,0       ; |141| 
$C$RL5:    ; CALL OCCURS {_tanh} {0}         ; |141| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           SUB     .L1     A10,1,A0          ; |140| 
||         STDW    .D1T1   A5:A4,*A11++      ; |141| 
||         SUB     .S1     A10,1,A10         ; |140| 

   [!A0]   MVK     .S2     0xc9,B4
|| [!A0]   ADD     .L2     4,B10,B11
|| [ A0]   B       .S1     $C$L3             ; |140| 

   [ A0]   CALL    .S1     _tanh             ; |141| 
   [ A0]   LDDW    .D1T1   *A12++,A5:A4      ; |141| 
   [!A0]   MV      .L1     A13,A10
   [!A0]   ZERO    .L2     B10
   [!A0]   MV      .L1X    B4,A11
           ; BRANCHCC OCCURS {$C$L3}         ; |140| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1
           CALL    .S1     _tanhdp           ; |144| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L4:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A13++,A5:A4      ; |144| 
           ADDKPC  .S2     $C$RL6,B3,3       ; |144| 
$C$RL6:    ; CALL OCCURS {_tanhdp} {0}       ; |144| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |144| 
||         SUB     .L1     A11,1,A0          ; |143| 
||         SUB     .S1     A11,1,A11         ; |143| 

   [ A0]   BNOP    .S1     $C$L4,3           ; |143| 

           ADD     .L2     B10,B4,B5         ; |144| 
||         ADD     .D2     8,B10,B10         ; |143| 
|| [!A0]   MVK     .S2     0xc9,B4

   [ A0]   CALL    .S1     _tanhdp           ; |144| 
||         STDW    .D2T1   A5:A4,*B5         ; |144| 

           ; BRANCHCC OCCURS {$C$L4}         ; |143| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 1

           CALL    .S1     _tanhdp_c         ; |147| 
||         MV      .L1X    B4,A11
||         ZERO    .L2     B10
||         MV      .D1     A10,A12
||         ADD     .S2     4,B11,B11

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L5:    
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *A12++,A5:A4      ; |147| 
           ADDKPC  .S2     $C$RL7,B3,3       ; |147| 
$C$RL7:    ; CALL OCCURS {_tanhdp_c} {0}     ; |147| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7

           LDW     .D2T2   *B11,B4           ; |147| 
||         SUB     .L1     A11,1,A0          ; |146| 
||         SUB     .S1     A11,1,A11         ; |146| 

   [ A0]   BNOP    .S1     $C$L5,3           ; |146| 

           ADD     .L2     B10,B4,B5         ; |147| 
||         ADD     .S2     8,B10,B10         ; |146| 

   [ A0]   CALL    .S1     _tanhdp_c         ; |147| 
||         STDW    .D2T1   A5:A4,*B5         ; |147| 

           ; BRANCHCC OCCURS {$C$L5}         ; |146| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 3

           ADD     .L2     4,B11,B8
||         MVK     .S2     0xc9,B1
||         SUB     .L1     A10,8,A3
||         ZERO    .D2     B20               ; |61| 
||         ZERO    .S1     A31

           LDW     .D2T1   *B8,A18
||         MVK     .S2     1022,B29          ; |64| 
||         ZERO    .L2     B31

           ZERO    .L2     B28
||         ZERO    .S2     B30

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L6:    
;          EXCLUSIVE CPU CYCLES: 15

           ZERO    .L2     B5:B4             ; |200| 
||         LDDW    .D1T1   *++A3,A9:A8       ; |195| 

           MVKL    .S1     0x3fd33333,A17
           MVKL    .S1     0x33333333,A16
           MVKH    .S1     0x3fd33333,A17
           MVKH    .S1     0x33333333,A16

           ABSDP   .S1     A9:A8,A5:A4       ; |195| 
||         CMPLTDP .S2X    A9:A8,B5:B4,B0    ; |200| 

           ZERO    .L1     A9
           CMPLTDP .S1     A5:A4,A17:A16,A0  ; |203| 

   [!B0]   ZERO    .L1     A17
|| [ B0]   ZERO    .D1     A17

   [!A0]   ZERO    .L1     A8                ; |206| 
|| [ A0]   B       .S2     $C$L7             ; |203| 
||         MVKH    .S1     0x40330000,A9
||         MV      .D1     A0,A2             ; branch predicate copy

           MV      .L1     A0,A1             ; guard predicate rewrite
||         CMPGTDP .S1     A5:A4,A9:A8,A0    ; |206| 
|| [!B0]   ZERO    .D1     A16               ; |200| 

   [ B0]   ZERO    .L1     A16               ; |200| 

   [ A0]   ZERO    .L1     A7
|| [ A0]   MV      .D1     A8,A6             ; |197| 
|| [ B0]   MVKH    .S1     0xbff00000,A17

   [ A0]   SET     .S1     A7,0x14,0x1d,A7
|| [ A2]   MPYDP   .M1     A5:A4,A5:A4,A7:A6 ; |119| 
|| [ A1]   ZERO    .L1     A0                ; |197| nullify predicate

   [ A0]   B       .S2     $C$L8
|| [!B0]   SET     .S1     A17,0x14,0x1d,A17

           ; BRANCHCC OCCURS {$C$L7}         ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

   [!A0]   ZERO    .L1     A7
|| [!A0]   MV      .S1     A8,A6             ; |61| 
|| [!A0]   MVKL    .S2     0x3ff71547,B5

   [!A0]   MVKH    .S1     0xc0000000,A7
|| [!A0]   MVKL    .S2     0x652b82fe,B4

   [!A0]   MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |61| 
   [!A0]   MVKH    .S2     0x3ff71547,B5
   [!A0]   MVKH    .S2     0x652b82fe,B4
           ; BRANCHCC OCCURS {$C$L8}  
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 337
           MVKL    .S1     0x3fe63000,A7
           MVKH    .S1     0x3fe63000,A7
           MVKL    .S2     0x5c610ca8,B6
           MVKL    .S2     0xbf2bd010,B7
           MVKH    .S2     0x5c610ca8,B6
           MVKH    .S2     0xbf2bd010,B7
           MVKL    .S1     0x6f58dc1c,A8
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |61| 
           MVKL    .S1     0x3ef152a4,A9
           MVKH    .S1     0x6f58dc1c,A8
           MVKH    .S1     0x3ef152a4,A9
           ZERO    .L2     B21
           SET     .S2     B21,0x1e,0x1e,B21
           NOP             4
           DPINT   .L2     B5:B4,B9          ; |61| 
           NOP             3
           INTDP   .L2     B9,B5:B4          ; |61| 
           NOP             5
           MPYDP   .M1X    A7:A6,B5:B4,A7:A6 ; |61| 
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |61| 
           NOP             8
           SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |61| 
           NOP             6
           SUBDP   .L1X    A5:A4,B5:B4,A7:A6 ; |61| 
           MVKL    .S2     0x6fde3809,B4
           MVKL    .S2     0x3f403f99,B5
           MVKH    .S2     0x6fde3809,B4
           MVKH    .S2     0x3f403f99,B5
           NOP             2
           MPYDP   .M1     A7:A6,A7:A6,A5:A4 ; |61| 
           NOP             9
           MPYDP   .M1     A9:A8,A5:A4,A21:A20 ; |61| 
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |61| 
           NOP             4
           MVKL    .S1     0x6fb3f6e0,A8
           MVKL    .S1     0x3f7c70e4,A9
           MVKH    .S1     0x6fb3f6e0,A8
           MVKH    .S1     0x3f7c70e4,A9
           ADDDP   .L1     A9:A8,A21:A20,A9:A8 ; |61| 
           MVKL    .S1     0x714251b3,A20
           MVKL    .S1     0x3fac718e,A21
           MVKH    .S1     0x714251b3,A20
           MVKH    .S1     0x3fac718e,A21
           NOP             1
           ADDDP   .L2X    A21:A20,B5:B4,B5:B4 ; |61| 
           MPYDP   .M1     A5:A4,A9:A8,A9:A8 ; |61| 
           ZERO    .L1     A20               ; |61| 
           MV      .L1X    B21,A21           ; |209| 
           NOP             3
           MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |61| 
           NOP             2

           ZERO    .L2     B5
||         ZERO    .S2     B4                ; |61| 

           MVKH    .S2     0x3fd00000,B5
           ADDDP   .L2X    B5:B4,A9:A8,B5:B4 ; |61| 
           ZERO    .L1     A4                ; |61| 
           MV      .L1X    B21,A5            ; |64| 
           ZERO    .L1     A8                ; |61| 
           NOP             3
           MPYDP   .M2X    A7:A6,B5:B4,B17:B16 ; |61| 
           NOP             2

           SET     .S2     B31,0x15,0x1d,B5
||         ZERO    .L2     B4                ; |61| 

           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |61| 
           NOP             6
           SUBDP   .L2     B5:B4,B17:B16,B7:B6 ; |61| 
           NOP             6
           RCPDP   .S2     B7:B6,B5:B4       ; |61| 
           NOP             1
           MPYDP   .M2     B5:B4,B7:B6,B19:B18 ; |61| 
           NOP             9
           SUBDP   .L2     B21:B20,B19:B18,B19:B18 ; |61| 
           NOP             6
           MPYDP   .M2     B5:B4,B19:B18,B5:B4 ; |61| 
           NOP             9
           MPYDP   .M2     B5:B4,B7:B6,B19:B18 ; |64| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A5:A4,B19:B18,A5:A4 ; |64| 
           NOP             6
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |64| 
           NOP             6
           ZERO    .L2     B5:B4             ; |64| 
           CMPEQDP .S2     B17:B16,B5:B4,B0  ; |64| 
           MV      .L2     B20,B4            ; |64| 
   [!B0]   MPYDP   .M1X    A5:A4,B7:B6,A7:A6 ; |64| 
   [ B0]   ZERO    .L1     A5:A4             ; |64| 
           SET     .S2     B30,0x15,0x1d,B5
           ADD     .L2     B29,B9,B6         ; |64| 
   [!B0]   MV      .L1X    B21,A9            ; |64| 
           SHL     .S2     B6,20,B7          ; |64| 
           MV      .L2     B20,B6            ; |64| 
           NOP             3
   [!B0]   SUBDP   .L1     A9:A8,A7:A6,A7:A6 ; |64| 
           NOP             6
   [!B0]   MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |64| 
           NOP             9
   [!B0]   MPYDP   .M1X    B17:B16,A5:A4,A5:A4 ; |64| 
           NOP             9
           NOP             1
           ADDDP   .L2X    B5:B4,A5:A4,B5:B4 ; |64| 
           MV      .L1     A8,A4             ; |64| 
           ZERO    .L1     A5
           MVKH    .S1     0x40100000,A5
           NOP             3
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |64| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |64| 
           NOP             6
           SET     .S2     B28,0x14,0x1d,B5
           MV      .L2     B6,B4             ; |64| 
           NOP             1
           ADDDP   .L1X    B5:B4,A5:A4,A5:A4 ; |64| 
           MV      .L2     B21,B5            ; |209| 
           NOP             5
           RCPDP   .S1     A5:A4,A7:A6       ; |209| 
           NOP             1
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |209| 
           NOP             9
           SUBDP   .L1     A21:A20,A9:A8,A9:A8 ; |209| 
           NOP             6
           MPYDP   .M1     A7:A6,A9:A8,A7:A6 ; |209| 
           NOP             9
           MPYDP   .M1     A5:A4,A7:A6,A9:A8 ; |209| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A9:A8,B5:B4 ; |209| 
           NOP             6
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |209| 
           NOP             9
           MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |209| 
           NOP             6
           MV      .L1     A20,A4            ; |209| 
           MV      .L1     A21,A5            ; |209| 
           NOP             1
           SUBDP   .L2X    A5:A4,B7:B6,B7:B6 ; |209| 
           SET     .S1     A31,0x14,0x1d,A5
           NOP             5
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |209| 
           NOP             9
           ADDDP   .L2     B5:B4,B5:B4,B5:B4 ; |209| 
           NOP             2
           BNOP    .S1     $C$L8,4           ; |209| 
           SUBDP   .L1X    B5:B4,A5:A4,A7:A6 ; |209| 
           ; BRANCH OCCURS {$C$L8}           ; |209| 
;** --------------------------------------------------------------------------*
$C$L7:    
;          EXCLUSIVE CPU CYCLES: 77
           MVKL    .S1     0x3f6e11ce,A21
           MVKL    .S2     0x3f9666af,B5
           MVKL    .S1     0x903de2ef,A20
           MVKL    .S2     0x84e8ae0f,B4
           MVKH    .S1     0x3f6e11ce,A21
           MVKH    .S2     0x3f9666af,B5
           MVKH    .S1     0x903de2ef,A20
           MVKH    .S2     0x84e8ae0f,B4
           MPYDP   .M1     A7:A6,A7:A6,A23:A22 ; |119| 
           MVKL    .S1     0x53b8707d,A26
           MVKL    .S2     0xe912d40f,B6
           MVKL    .S1     0xbfd55555,A27
           MVKL    .S2     0xbf822997,B7
           MVKH    .S1     0x53b8707d,A26
           MPYDP   .M2X    B5:B4,A7:A6,B17:B16 ; |119| 
           MVKH    .S2     0xe912d40f,B6
           MVKH    .S1     0xbfd55555,A27
           MVKH    .S2     0xbf822997,B7
           MPYDP   .M1     A23:A22,A7:A6,A9:A8 ; |119| 
           MVKL    .S2     0xbfaba1e4,B5
           MVKL    .S2     0x3f7f105d,B4
           MVKH    .S2     0xbfaba1e4,B5
           MPYDP   .M1     A27:A26,A7:A6,A27:A26 ; |119| 
           MVKH    .S2     0x3f7f105d,B4
           ADDDP   .L2     B5:B4,B17:B16,B5:B4 ; |119| 
           MPYDP   .M2X    B7:B6,A23:A22,B7:B6 ; |119| 
           NOP             2
           MPYDP   .M1     A21:A20,A9:A8,A25:A24 ; |119| 
           NOP             2
           MVKL    .S1     0x3fc11111,A21
           MVKL    .S1     0x49fb127b,A20
           MVKH    .S1     0x3fc11111,A21
           MVKH    .S1     0x49fb127b,A20
           MPYDP   .M1     A21:A20,A23:A22,A7:A6 ; |119| 
           MPYDP   .M2X    A9:A8,B5:B4,B5:B4 ; |119| 
           NOP             4
           ADDDP   .L2X    A25:A24,B7:B6,B7:B6 ; |119| 
           NOP             3
           ADDDP   .L1     A27:A26,A7:A6,A7:A6 ; |119| 
           NOP             2
           MPYDP   .M2X    A9:A8,B7:B6,B7:B6 ; |119| 
           NOP             3
           ADDDP   .L1X    A7:A6,B5:B4,A7:A6 ; |119| 
           NOP             6
           ADDDP   .L1X    B7:B6,A7:A6,A7:A6 ; |119| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A7:A6 ; |119| 
           NOP             9
           ADDDP   .L1     A5:A4,A7:A6,A7:A6 ; |119| 
;** --------------------------------------------------------------------------*
$C$L8:    
;          EXCLUSIVE CPU CYCLES: 17
           SUB     .L2     B1,1,B1           ; |149| 
   [!B1]   ADD     .L2     4,B8,B11
           NOP             4
           MPYDP   .M1     A17:A16,A7:A6,A5:A4 ; |150| 
           NOP             4
   [ B1]   BNOP    .S1     $C$L6,4           ; |149| 

   [!B1]   CALL    .S1     _tanhdp_v         ; |152| 
||         STDW    .D1T1   A5:A4,*A18++      ; |150| 

           ; BRANCHCC OCCURS {$C$L6}         ; |149| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *B11,B4           ; |152| 
           MV      .L1     A10,A4            ; |152| 
           MVK     .S1     0xc9,A6           ; |152| 
           ADDKPC  .S2     $C$RL8,B3,1       ; |152| 
$C$RL8:    ; CALL OCCURS {_tanhdp_v} {0}     ; |152| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .S1     0xc9,A4           ; |157| 

$C$RL9:    ; CALL OCCURS {_allequal} {0}     ; |157| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x1,A4            ; |158| 

$C$RL10:   ; CALL OCCURS {_print_test_results} {0}  ; |158| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12
           MVKL    .S2     _a_sc,B4
           MVKH    .S2     _a_sc,B4
           MVK     .L1     0xffffffff,A17    ; |172| 

           MV      .L1X    B4,A11            ; |165| 
||         MV      .S1     A17,A16           ; |172| 

           STDW    .D1T1   A17:A16,*+A11(56) ; |172| 
||         ZERO    .S2     B9
||         ZERO    .L2     B7:B6             ; |165| 

           STDW    .D1T2   B7:B6,*A11        ; |165| 
||         MVKH    .S2     0xbff00000,B9
||         ZERO    .L1     A7
||         ZERO    .L2     B8                ; |170| 

           STDW    .D1T2   B9:B8,*+A11(40)   ; |170| 
||         SET     .S1     A7,0x14,0x1d,A7
||         ZERO    .L2     B17
||         ZERO    .L1     A6                ; |170| 

           STDW    .D1T1   A7:A6,*+A11(32)   ; |169| 
||         MVKH    .S2     0xfff00000,B17
||         ZERO    .L1     A8                ; |170| 
||         ZERO    .S1     A9
||         ZERO    .L2     B16               ; |170| 

           STDW    .D1T2   B17:B16,*+A11(24) ; |168| 
||         SET     .S1     A9,0x14,0x1e,A9
||         ZERO    .L1     A5

           STDW    .D1T1   A9:A8,*+A11(16)   ; |167| 
||         MVK     .L2     0x8,B4
||         SUB     .S2     B4,8,B12
||         MVKH    .S1     0x80000000,A5
||         ZERO    .L1     A4                ; |170| 

           ADD     .L1     -1,A5,A17
||         STDW    .D1T1   A5:A4,*+A11(8)    ; |166| 

           STDW    .D1T1   A17:A16,*+A11(48) ; |171| 
||         MV      .L1X    B4,A10            ; |166| 
||         ZERO    .L2     B10               ; |170| 

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
;          EXCLUSIVE CPU CYCLES: 7
           LDDW    .D2T2   *++B12,B5:B4      ; |175| 
           CALL    .S1     _tanh             ; |175| 
           ADDKPC  .S2     $C$RL11,B3,2      ; |175| 
           MV      .L1X    B4,A4             ; |175| 
           MV      .L1X    B5,A5             ; |175| 
$C$RL11:   ; CALL OCCURS {_tanh} {0}         ; |175| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 35
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3
           MV      .L1     A3,A12            ; |175| 
           LDW     .D1T2   *A12,B4           ; |175| 
           NOP             4
           ADD     .L2     B10,B4,B4         ; |175| 
           STDW    .D2T1   A5:A4,*B4         ; |175| 

           CALLP   .S2     _tanhdp,B3
||         LDDW    .D2T1   *B12,A5:A4        ; |176| 

$C$RL12:   ; CALL OCCURS {_tanhdp} {0}       ; |176| 
           LDW     .D1T1   *+A12(4),A3       ; |176| 
           NOP             4
           ADD     .L2X    B10,A3,B4         ; |176| 
           STDW    .D2T1   A5:A4,*B4         ; |176| 
           LDDW    .D2T2   *B12,B5:B4        ; |177| 
           NOP             4
           MV      .L1X    B4,A4             ; |177| 

           CALLP   .S2     _tanhdp_c,B3
||         MV      .L1X    B5,A5             ; |177| 

$C$RL13:   ; CALL OCCURS {_tanhdp_c} {0}     ; |177| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           LDW     .D1T1   *+A12(8),A3       ; |177| 
           MVKL    .S2     0x3fd33333,B9
           MVKL    .S2     0x33333333,B8
           MVKH    .S2     0x3fd33333,B9
           MVKH    .S2     0x33333333,B8
           ADD     .L2X    B10,A3,B4         ; |177| 
           STDW    .D2T1   A5:A4,*B4         ; |177| 
           LDDW    .D2T2   *B12,B5:B4        ; |195| 
           ZERO    .L1     A5:A4             ; |200| 
           NOP             3

           ABSDP   .S2     B5:B4,B7:B6       ; |195| 
||         CMPLTDP .S1X    B5:B4,A5:A4,A0    ; |200| 

           ZERO    .L2     B5

           CMPLTDP .S2     B7:B6,B9:B8,B0    ; |203| 
|| [ A0]   ZERO    .L1     A9
|| [!A0]   ZERO    .S1     A9
|| [ A0]   ZERO    .D1     A8                ; |200| 

   [!A0]   SET     .S1     A9,0x14,0x1d,A9
|| [!A0]   ZERO    .L1     A8                ; |200| 

   [ B0]   B       .S1     $C$L11            ; |203| 
|| [!B0]   ZERO    .L2     B4                ; |206| 
||         MVKH    .S2     0x40330000,B5
||         MV      .D2     B0,B1             ; guard predicate rewrite

           MV      .L2     B0,B2             ; branch predicate copy
||         CMPGTDP .S2     B7:B6,B5:B4,B0    ; |206| 

   [ B2]   MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |119| 
   [ A0]   MVKH    .S1     0xbff00000,A9
   [ B1]   ZERO    .L2     B0                ; |206| nullify predicate
   [ B0]   B       .S1     $C$L10            ; |206| 
           ; BRANCHCC OCCURS {$C$L11}        ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5

   [!B0]   ZERO    .L2     B5
|| [!B0]   MVKL    .S1     0x3ff71547,A5
|| [ B0]   B       .S2     $C$L13
|| [ B0]   ZERO    .L1     A5
|| [ B0]   MV      .D1X    B4,A4             ; |197| 

   [!B0]   MVKH    .S2     0xc0000000,B5
|| [!B0]   MVKL    .S1     0x652b82fe,A4

   [!B0]   MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |148| 
|| [!B0]   MVKH    .S1     0x3ff71547,A5

   [!B0]   MVKH    .S1     0x652b82fe,A4
   [ B0]   SET     .S1     A5,0x14,0x1d,A5
           ; BRANCHCC OCCURS {$C$L10}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 336
           ZERO    .L2     B6                ; |154| 
           MVKL    .S2     0x3fe63000,B7
           MVKH    .S2     0x3fe63000,B7
           MVKL    .S1     0x5c610ca8,A6
           MVKL    .S1     0xbf2bd010,A7
           MVKH    .S1     0x5c610ca8,A6
           MVKH    .S1     0xbf2bd010,A7
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |148| 
           MVKL    .S2     0x6f58dc1c,B8
           MVKL    .S2     0x3ef152a4,B9
           MVKH    .S2     0x6f58dc1c,B8
           MVKH    .S2     0x3ef152a4,B9
           ZERO    .L1     A16               ; |155| 
           ZERO    .L1     A17
           SET     .S1     A17,0x15,0x1d,A17
           ZERO    .L1     A22               ; |64| 
           ZERO    .L1     A23
           DPINT   .L1     A5:A4,A18         ; |148| 
           SET     .S1     A23,0x1e,0x1e,A23
           ZERO    .L1     A31
           MVK     .S1     0x3fe,A3
           INTDP   .L1     A18,A5:A4         ; |154| 
           ADD     .L1     A3,A18,A3         ; |62| 
           ZERO    .L1     A30
           ZERO    .S1     A29
           NOP             2
           MPYDP   .M2X    B7:B6,A5:A4,B7:B6 ; |154| 
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |154| 
           NOP             8
           SUBDP   .L2     B5:B4,B7:B6,B5:B4 ; |154| 
           NOP             6
           SUBDP   .L2X    B5:B4,A5:A4,B7:B6 ; |154| 
           MVKL    .S1     0x6fde3809,A4
           MVKL    .S1     0x3f403f99,A5
           MVKH    .S1     0x6fde3809,A4
           MVKH    .S1     0x3f403f99,A5
           NOP             2
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |154| 
           NOP             9
           MPYDP   .M2     B9:B8,B5:B4,B17:B16 ; |154| 
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |155| 
           NOP             4
           MVKL    .S2     0x6fb3f6e0,B8
           MVKL    .S2     0x3f7c70e4,B9
           MVKH    .S2     0x6fb3f6e0,B8
           MVKH    .S2     0x3f7c70e4,B9
           ADDDP   .L2     B9:B8,B17:B16,B9:B8 ; |154| 
           MVKL    .S2     0x714251b3,B16
           MVKL    .S2     0x3fac718e,B17
           MVKH    .S2     0x714251b3,B16
           MVKH    .S2     0x3fac718e,B17
           NOP             1
           ADDDP   .L1X    B17:B16,A5:A4,A5:A4 ; |155| 
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |154| 
           ZERO    .L2     B16               ; |64| 
           MV      .L2X    A23,B17           ; |62| 
           NOP             3
           MPYDP   .M1X    B5:B4,A5:A4,A7:A6 ; |155| 
           NOP             2

           ZERO    .L1     A5
||         ZERO    .S1     A4                ; |154| 

           MVKH    .S1     0x3fd00000,A5
           ADDDP   .L1X    A5:A4,B9:B8,A5:A4 ; |154| 
           ZERO    .L2     B4                ; |64| 
           MV      .L2X    A23,B5            ; |64| 
           ZERO    .L2     B8                ; |64| 
           MV      .L2X    A23,B9            ; |64| 
           ADDDP   .L1     A17:A16,A7:A6,A7:A6 ; |155| 
           NOP             1
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |154| 
           NOP             9
           SUBDP   .L1     A7:A6,A5:A4,A7:A6 ; |155| 
           NOP             6
           RCPDP   .S1     A7:A6,A17:A16     ; |64| 
           NOP             1
           MPYDP   .M1     A7:A6,A17:A16,A21:A20 ; |64| 
           NOP             9
           SUBDP   .L1     A23:A22,A21:A20,A21:A20 ; |64| 
           NOP             6
           MPYDP   .M1     A17:A16,A21:A20,A17:A16 ; |64| 
           NOP             9
           MPYDP   .M1     A7:A6,A17:A16,A21:A20 ; |64| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A21:A20,B5:B4 ; |64| 
           NOP             6
           MPYDP   .M2X    A17:A16,B5:B4,B5:B4 ; |64| 
           NOP             9
           MPYDP   .M2X    A7:A6,B5:B4,B7:B6 ; |64| 
           NOP             9
           SUBDP   .L2     B9:B8,B7:B6,B7:B6 ; |64| 
           ZERO    .L1     A7:A6             ; |66| 
           CMPEQDP .S1     A5:A4,A7:A6,A0    ; |66| 
           MV      .L1     A22,A6            ; |62| 
           SHL     .S1     A3,20,A7          ; |62| 
           NOP             2
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |64| 
           NOP             9
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |64| 
           NOP             8
           MV      .L1     A22,A4            ; |67| 
   [ A0]   ZERO    .L2     B5:B4             ; |67| 
           SET     .S1     A31,0x15,0x1d,A5
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |62| 
           MV      .L2     B8,B4             ; |62| 
           ZERO    .L2     B5
           MVKH    .S2     0x40100000,B5
           NOP             3
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |62| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |62| 
           NOP             6
           SET     .S1     A30,0x14,0x1d,A5
           MV      .L1     A6,A4             ; |62| 
           NOP             1
           ADDDP   .L2X    A5:A4,B5:B4,B7:B6 ; |62| 
           MV      .L1     A23,A5            ; |62| 
           NOP             5
           RCPDP   .S2     B7:B6,B5:B4       ; |62| 
           NOP             1
           MPYDP   .M2     B5:B4,B7:B6,B9:B8 ; |62| 
           NOP             9
           SUBDP   .L2     B17:B16,B9:B8,B9:B8 ; |62| 
           NOP             6
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |62| 
           NOP             9
           MPYDP   .M2     B5:B4,B7:B6,B9:B8 ; |62| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A5:A4,B9:B8,A5:A4 ; |62| 
           NOP             6
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |62| 
           NOP             9
           MPYDP   .M1X    A5:A4,B7:B6,A7:A6 ; |209| 
           MV      .L2     B16,B4            ; |209| 
           MV      .L2     B17,B5            ; |209| 
           NOP             7
           SUBDP   .L1X    B5:B4,A7:A6,A7:A6 ; |209| 
           NOP             6
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |209| 
           NOP             8
           SET     .S1     A29,0x14,0x1d,A7
           ADDDP   .L1     A5:A4,A5:A4,A5:A4 ; |209| 
           MV      .S1     A22,A6            ; |209| 
           BNOP    .S1     $C$L12,4          ; |209| 
           SUBDP   .L1     A5:A4,A7:A6,A5:A4 ; |209| 
           ; BRANCH OCCURS {$C$L12}          ; |209| 
;** --------------------------------------------------------------------------*
$C$L10:    
;          EXCLUSIVE CPU CYCLES: 1

           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |178| 
||         MVK     .S2     12,B4
||         SUB     .L1     A10,1,A0          ; |174| 
||         SUB     .S1     A10,1,A10         ; |174| 

           ; BRANCH OCCURS {$C$L13}  
;** --------------------------------------------------------------------------*
$C$L11:    
;          EXCLUSIVE CPU CYCLES: 73

           MVKL    .S1     0x84e8ae0f,A4
||         MVKL    .S2     0xbfd55555,B21

           MVKL    .S2     0x53b8707d,B20
           MVKL    .S1     0x3f9666af,A5
           MVKH    .S2     0xbfd55555,B21
           MVKH    .S1     0x84e8ae0f,A4
           MVKH    .S2     0x53b8707d,B20
           MPYDP   .M2     B5:B4,B5:B4,B9:B8 ; |119| 
           MVKH    .S1     0x3f9666af,A5
           MVKL    .S1     0xbf822997,A7
           MVKL    .S2     0x3f6e11ce,B19
           MVKL    .S1     0xe912d40f,A6
           MVKL    .S2     0x903de2ef,B18
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |119| 
           MVKH    .S1     0xbf822997,A7
           MVKH    .S2     0x3f6e11ce,B19
           MVKH    .S1     0xe912d40f,A6
           MPYDP   .M2     B9:B8,B5:B4,B17:B16 ; |119| 
           MVKH    .S2     0x903de2ef,B18
           MVKL    .S1     0xbfaba1e4,A17
           MVKL    .S1     0x3f7f105d,A16
           MVKH    .S1     0xbfaba1e4,A17
           MPYDP   .M2     B21:B20,B5:B4,B21:B20 ; |119| 
           MVKH    .S1     0x3f7f105d,A16
           ADDDP   .L1     A17:A16,A5:A4,A5:A4 ; |119| 
           MPYDP   .M1X    A7:A6,B9:B8,A7:A6 ; |119| 
           MVKL    .S2     0x3fc11111,B5
           MPYDP   .M2     B19:B18,B17:B16,B19:B18 ; |119| 
           MVKL    .S2     0x49fb127b,B4
           MVKH    .S2     0x3fc11111,B5
           MVKH    .S2     0x49fb127b,B4
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |119| 
           MPYDP   .M1X    B17:B16,A5:A4,A5:A4 ; |119| 
           NOP             6
           ADDDP   .L1X    B19:B18,A7:A6,A7:A6 ; |119| 
           NOP             1
           ADDDP   .L2     B21:B20,B5:B4,B5:B4 ; |119| 
           NOP             4
           MPYDP   .M1X    B17:B16,A7:A6,A7:A6 ; |119| 
           NOP             1
           ADDDP   .L2X    B5:B4,A5:A4,B5:B4 ; |119| 
           NOP             7
           ADDDP   .L1X    A7:A6,B5:B4,A5:A4 ; |119| 
           NOP             6
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |119| 
           NOP             9
           ADDDP   .L1X    B7:B6,A5:A4,A5:A4 ; |119| 
;** --------------------------------------------------------------------------*
$C$L12:    
;          EXCLUSIVE CPU CYCLES: 7
           SUB     .S1     A10,1,A0          ; |174| 
           MVK     .S2     12,B4
           SUB     .L1     A10,1,A10         ; |174| 
           NOP             3
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |178| 
;** --------------------------------------------------------------------------*
$C$L13:    
;          EXCLUSIVE CPU CYCLES: 10
           ADD     .L2X    A12,B4,B4
           LDW     .D2T2   *B4,B4            ; |178| 
           NOP             2
   [ A0]   BNOP    .S1     $C$L9,2           ; |174| 
           ADD     .L2     B10,B4,B5         ; |178| 
           ADD     .L2     8,B10,B10         ; |174| 

   [!A0]   CALL    .S1     _tanhdp_v         ; |180| 
||         STDW    .D2T1   A5:A4,*B5         ; |178| 

           ; BRANCHCC OCCURS {$C$L9}         ; |174| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D2T2   *B11,B4           ; |180| 
           MV      .L1     A11,A4
           ADDKPC  .S2     $C$RL14,B3,1      ; |180| 
           MVK     .L1     0x8,A6            ; |180| 
$C$RL14:   ; CALL OCCURS {_tanhdp_v} {0}     ; |180| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .L1     0x8,A4            ; |183| 

$C$RL15:   ; CALL OCCURS {_allequal} {0}     ; |183| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x3,A4            ; |184| 

$C$RL16:   ; CALL OCCURS {_print_test_results} {0}  ; |184| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4
           MVKL    .S1     _a_ext,A12

           MVK     .S1     0x777,A3
||         ZERO    .L2     B5

           SET     .S2     B5,0x14,0x14,B5
||         MVKH    .S1     _a_ext,A12
||         ZERO    .L2     B4                ; |187| 

           CALL    .S2     _tanh             ; |189| 
||         STDW    .D1T2   B5:B4,*A12        ; |187| 
||         MV      .L1     A12,A10           ; |187| 
||         MV      .S1     A3,A11            ; |187| 
||         ZERO    .L2     B10               ; |187| 

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
           LDDW    .D1T1   *A10,A5:A4        ; |189| 
           ADDKPC  .S2     $C$RL17,B3,3      ; |189| 
$C$RL17:   ; CALL OCCURS {_tanh} {0}         ; |189| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 28
           MVKL    .S1     _output,A14
           MVKH    .S1     _output,A14
           LDW     .D1T1   *A14,A3           ; |189| 
           NOP             4
           ADD     .L1X    B10,A3,A3         ; |189| 
           STDW    .D1T1   A5:A4,*A3         ; |189| 

           CALLP   .S2     _tanhdp,B3
||         LDDW    .D1T1   *A10,A5:A4        ; |190| 

$C$RL18:   ; CALL OCCURS {_tanhdp} {0}       ; |190| 
           LDW     .D1T1   *+A14(4),A3       ; |190| 
           NOP             4
           ADD     .L1X    B10,A3,A3         ; |190| 
           STDW    .D1T1   A5:A4,*A3         ; |190| 

           CALLP   .S2     _tanhdp_c,B3
||         LDDW    .D1T1   *A10,A5:A4        ; |191| 

$C$RL19:   ; CALL OCCURS {_tanhdp_c} {0}     ; |191| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 22
           LDW     .D1T1   *+A14(8),A3       ; |191| 
           MVKL    .S2     0x33333333,B8
           MVKL    .S2     0x3fd33333,B9
           MVKH    .S2     0x33333333,B8
           MVKH    .S2     0x3fd33333,B9
           ADD     .L2X    B10,A3,B4         ; |191| 
           STDW    .D2T1   A5:A4,*B4         ; |191| 
           LDDW    .D1T2   *A10,B5:B4        ; |195| 
           ZERO    .L1     A5:A4             ; |200| 
           NOP             3

           ABSDP   .S2     B5:B4,B7:B6       ; |195| 
||         CMPLTDP .S1X    B5:B4,A5:A4,A0    ; |200| 

           ZERO    .L2     B5
           CMPLTDP .S2     B7:B6,B9:B8,B0    ; |203| 

   [ A0]   ZERO    .L2     B9
|| [!A0]   ZERO    .D2     B9

   [ B0]   B       .S1     $C$L16            ; |203| 
|| [!B0]   ZERO    .L2     B4                ; |206| 
||         MVKH    .S2     0x40330000,B5
||         MV      .D2     B0,B1             ; guard predicate rewrite

           MV      .L2     B0,B2             ; branch predicate copy
||         CMPGTDP .S2     B7:B6,B5:B4,B0    ; |206| 
|| [ A0]   ZERO    .D2     B8                ; |200| 

   [ B2]   MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |119| 
|| [!A0]   ZERO    .L2     B8                ; |200| 

   [ B1]   ZERO    .L2     B0                ; |206| nullify predicate
|| [!A0]   SET     .S2     B9,0x14,0x1d,B9

   [ B0]   BNOP    .S1     $C$L15,1          ; |206| 
|| [ A0]   MVKH    .S2     0xbff00000,B9

           ; BRANCHCC OCCURS {$C$L16}        ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 4

   [!B0]   ZERO    .L2     B5
|| [!B0]   MVKL    .S1     0x3ff71547,A5
|| [ B0]   B       .S2     $C$L17
|| [ B0]   ZERO    .D2     B5

   [!B0]   MVKH    .S2     0xc0000000,B5
|| [!B0]   MVKL    .S1     0x652b82fe,A4

   [!B0]   MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |148| 
|| [!B0]   MVKH    .S1     0x3ff71547,A5
|| [ B0]   SET     .S2     B5,0x14,0x1d,B5

   [!B0]   MVKH    .S1     0x652b82fe,A4
           ; BRANCHCC OCCURS {$C$L15}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 339
           MVKL    .S1     0x5c610ca8,A6
           ZERO    .L2     B6                ; |154| 
           MVKL    .S2     0x3fe63000,B7
           MVKH    .S2     0x3fe63000,B7
           MVKL    .S1     0xbf2bd010,A7
           MVKH    .S1     0x5c610ca8,A6
           MVKH    .S1     0xbf2bd010,A7
           MVKL    .S2     0x6f58dc1c,B16
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |148| 
           MVKL    .S2     0x3ef152a4,B17
           MVKH    .S2     0x6f58dc1c,B16
           MVKH    .S2     0x3ef152a4,B17
           ZERO    .L1     A31
           ZERO    .L1     A21
           ZERO    .L1     A20               ; |64| 
           SET     .S1     A21,0x1e,0x1e,A21
           ZERO    .L1     A30
           MVK     .S1     0x3fe,A3
           DPINT   .L1     A5:A4,A16         ; |148| 
           ZERO    .L1     A29
           ZERO    .L2     B31
           NOP             1
           INTDP   .L1     A16,A5:A4         ; |154| 
           ADD     .L1     A3,A16,A3         ; |62| 
           NOP             4
           MPYDP   .M2X    B7:B6,A5:A4,B7:B6 ; |154| 
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |154| 
           NOP             8
           SUBDP   .L2     B5:B4,B7:B6,B5:B4 ; |154| 
           NOP             6
           SUBDP   .L2X    B5:B4,A5:A4,B7:B6 ; |154| 
           MVKL    .S1     0x6fde3809,A4
           MVKL    .S1     0x3f403f99,A5
           MVKH    .S1     0x6fde3809,A4
           MVKH    .S1     0x3f403f99,A5
           NOP             2
           MPYDP   .M2     B7:B6,B7:B6,B5:B4 ; |154| 
           NOP             9
           MPYDP   .M2     B17:B16,B5:B4,B19:B18 ; |154| 
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |155| 
           NOP             4
           MVKL    .S2     0x6fb3f6e0,B16
           MVKL    .S2     0x3f7c70e4,B17
           MVKH    .S2     0x6fb3f6e0,B16
           MVKH    .S2     0x3f7c70e4,B17
           ADDDP   .L2     B17:B16,B19:B18,B17:B16 ; |154| 
           MVKL    .S2     0x714251b3,B18
           MVKL    .S2     0x3fac718e,B19
           MVKH    .S2     0x714251b3,B18
           MVKH    .S2     0x3fac718e,B19
           NOP             1
           ADDDP   .L1X    B19:B18,A5:A4,A5:A4 ; |155| 
           MPYDP   .M2     B5:B4,B17:B16,B17:B16 ; |154| 
           ZERO    .L2     B18               ; |64| 
           MV      .L2X    A21,B19           ; |62| 
           NOP             3
           MPYDP   .M1X    B5:B4,A5:A4,A7:A6 ; |155| 
           NOP             2

           ZERO    .L1     A5
||         ZERO    .S1     A4                ; |154| 

           MVKH    .S1     0x3fd00000,A5
           ADDDP   .L1X    A5:A4,B17:B16,A5:A4 ; |154| 
           ZERO    .L2     B4                ; |64| 
           MV      .L2X    A21,B5            ; |64| 
           ZERO    .L2     B16               ; |64| 
           MV      .L2X    A21,B17           ; |64| 
           NOP             2
           MPYDP   .M1X    B7:B6,A5:A4,A9:A8 ; |154| 
           NOP             2

           SET     .S1     A31,0x15,0x1d,A5
||         ZERO    .L1     A4                ; |155| 

           ADDDP   .L1     A5:A4,A7:A6,A5:A4 ; |155| 
           NOP             6
           SUBDP   .L1     A5:A4,A9:A8,A5:A4 ; |155| 
           NOP             6
           RCPDP   .S1     A5:A4,A7:A6       ; |64| 
           NOP             1
           MPYDP   .M1     A5:A4,A7:A6,A19:A18 ; |64| 
           NOP             9
           SUBDP   .L1     A21:A20,A19:A18,A19:A18 ; |64| 
           NOP             6
           MPYDP   .M1     A7:A6,A19:A18,A7:A6 ; |64| 
           NOP             9
           MPYDP   .M1     A5:A4,A7:A6,A19:A18 ; |64| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A19:A18,B5:B4 ; |64| 
           NOP             6
           MPYDP   .M2X    A7:A6,B5:B4,B5:B4 ; |64| 
           NOP             9
           MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |64| 
           SHL     .S1     A3,20,A7          ; |62| 
           MV      .L1     A20,A6            ; |62| 
           ZERO    .L1     A5:A4             ; |66| 
           CMPEQDP .S1     A9:A8,A5:A4,A0    ; |66| 
           MV      .L1     A20,A4            ; |67| 
           SET     .S1     A30,0x15,0x1d,A5
           NOP             3
           SUBDP   .L2     B17:B16,B7:B6,B7:B6 ; |64| 
           NOP             6
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |64| 
           NOP             9
           MPYDP   .M2X    A9:A8,B5:B4,B5:B4 ; |64| 
           NOP             9
   [ A0]   ZERO    .L2     B5:B4             ; |67| 
           NOP             1
           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |62| 
           MV      .L2     B16,B4            ; |62| 
           ZERO    .L2     B5
           MVKH    .S2     0x40100000,B5
           NOP             3
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |62| 
           NOP             9
           NOP             1
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |62| 
           NOP             6
           SET     .S1     A29,0x14,0x1d,A5
           MV      .L1     A6,A4             ; |62| 
           NOP             1
           ADDDP   .L2X    A5:A4,B5:B4,B5:B4 ; |62| 
           MV      .L1     A21,A5            ; |62| 
           NOP             5
           RCPDP   .S2     B5:B4,B7:B6       ; |62| 
           NOP             1
           MPYDP   .M2     B7:B6,B5:B4,B17:B16 ; |62| 
           NOP             9
           SUBDP   .L2     B19:B18,B17:B16,B17:B16 ; |62| 
           NOP             6
           MPYDP   .M2     B7:B6,B17:B16,B7:B6 ; |62| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B17:B16 ; |62| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A5:A4,B17:B16,A5:A4 ; |62| 
           NOP             6
           MPYDP   .M1X    B7:B6,A5:A4,A5:A4 ; |62| 
           NOP             9
           MPYDP   .M1X    A5:A4,B5:B4,A7:A6 ; |209| 
           NOP             6
           MV      .L2     B18,B4            ; |209| 
           MV      .L2     B19,B5            ; |209| 
           NOP             1
           SUBDP   .L1X    B5:B4,A7:A6,A7:A6 ; |209| 
           SET     .S2     B31,0x14,0x1d,B5
           NOP             5
           MPYDP   .M1     A5:A4,A7:A6,A5:A4 ; |209| 
           NOP             9
           ADDDP   .L1     A5:A4,A5:A4,A5:A4 ; |209| 
           NOP             2
           BNOP    .S1     $C$L17,4          ; |209| 
           SUBDP   .L2X    A5:A4,B5:B4,B5:B4 ; |209| 
           ; BRANCH OCCURS {$C$L17}          ; |209| 
;** --------------------------------------------------------------------------*
$C$L15:    
;          EXCLUSIVE CPU CYCLES: 2
           NOP             2
           ; BRANCH OCCURS {$C$L17}  
;** --------------------------------------------------------------------------*
$C$L16:    
;          EXCLUSIVE CPU CYCLES: 75
           MVKL    .S2     0x3f6e11ce,B21
           MVKL    .S1     0x3f9666af,A5
           MVKL    .S2     0x903de2ef,B20
           MVKL    .S1     0x84e8ae0f,A4
           MVKH    .S2     0x3f6e11ce,B21
           MVKH    .S1     0x3f9666af,A5
           MPYDP   .M2     B5:B4,B5:B4,B17:B16 ; |119| 
           MVKH    .S2     0x903de2ef,B20
           MVKH    .S1     0x84e8ae0f,A4
           MVKL    .S2     0x53b8707d,B22
           MVKL    .S1     0xe912d40f,A6
           MVKL    .S2     0xbfd55555,B23
           MVKL    .S1     0xbf822997,A7
           MPYDP   .M1X    A5:A4,B5:B4,A9:A8 ; |119| 
           MVKH    .S2     0x53b8707d,B22
           MVKH    .S1     0xe912d40f,A6
           MPYDP   .M2     B17:B16,B5:B4,B19:B18 ; |119| 
           MVKH    .S2     0xbfd55555,B23
           MVKH    .S1     0xbf822997,A7
           MVKL    .S1     0xbfaba1e4,A5
           MPYDP   .M2     B23:B22,B5:B4,B5:B4 ; |119| 
           MVKL    .S1     0x3f7f105d,A4
           MVKH    .S1     0xbfaba1e4,A5
           MVKH    .S1     0x3f7f105d,A4
           ADDDP   .L1     A5:A4,A9:A8,A5:A4 ; |119| 
           MPYDP   .M1X    A7:A6,B17:B16,A7:A6 ; |119| 
           MPYDP   .M2     B21:B20,B19:B18,B25:B24 ; |119| 
           NOP             2
           MVKL    .S2     0x3fc11111,B21
           MVKL    .S2     0x49fb127b,B20
           MVKH    .S2     0x3fc11111,B21
           MVKH    .S2     0x49fb127b,B20
           MPYDP   .M2     B21:B20,B17:B16,B17:B16 ; |119| 
           MPYDP   .M1X    B19:B18,A5:A4,A9:A8 ; |119| 
           NOP             4
           ADDDP   .L1X    B25:B24,A7:A6,A5:A4 ; |119| 
           NOP             3
           ADDDP   .L2     B5:B4,B17:B16,B5:B4 ; |119| 
           NOP             2
           MPYDP   .M1X    B19:B18,A5:A4,A5:A4 ; |119| 
           NOP             3
           ADDDP   .L2X    B5:B4,A9:A8,B5:B4 ; |119| 
           NOP             6
           ADDDP   .L2X    A5:A4,B5:B4,B5:B4 ; |119| 
           NOP             6
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |119| 
           NOP             9
           ADDDP   .L2     B7:B6,B5:B4,B5:B4 ; |119| 
;** --------------------------------------------------------------------------*
$C$L17:    
;          EXCLUSIVE CPU CYCLES: 33
           MVK     .S2     12,B6
           ADD     .L2X    A14,B6,B6
           LDW     .D2T2   *B6,B6            ; |192| 
           MVKL    .S1     0xc000cccc,A7
           MVKL    .S1     0xcccccccd,A6
           MVKH    .S1     0xc000cccc,A7
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |192| 
           ADD     .L2     B10,B6,B6         ; |192| 
           MVKH    .S1     0xcccccccd,A6
           SUB     .L1     A11,1,A0          ; |188| 
           SUB     .L1     A11,1,A11         ; |188| 
           ADD     .L2     8,B10,B10         ; |188| 
           NOP             4
           STDW    .D2T2   B5:B4,*B6         ; |192| 
           LDDW    .D1T1   *A10,A5:A4        ; |193| 
           NOP             4
           MPYDP   .M1     A7:A6,A5:A4,A5:A4 ; |193| 
           NOP             4
   [ A0]   BNOP    .S1     $C$L14,4          ; |188| 

   [ A0]   CALL    .S1     _tanh             ; |189| 
||         STDW    .D1T1   A5:A4,*++A10      ; |193| 

           ; BRANCHCC OCCURS {$C$L14}        ; |188| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     _tanhdp_v         ; |195| 
           LDW     .D2T2   *B11,B4           ; |195| 
           ADDKPC  .S2     $C$RL20,B3,2      ; |195| 

           MV      .L1     A12,A4
||         MVK     .S1     0x777,A6          ; |195| 

$C$RL20:   ; CALL OCCURS {_tanhdp_v} {0}     ; |195| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 12

           CALLP   .S2     _allequal,B3
||         MVK     .S1     0x777,A4          ; |198| 

$C$RL21:   ; CALL OCCURS {_allequal} {0}     ; |198| 

           CALLP   .S2     _print_test_results,B3
||         MVK     .L1     0x4,A4            ; |199| 

$C$RL22:   ; CALL OCCURS {_print_test_results} {0}  ; |199| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 15
           MVKL    .S1     _cycle_counts+24,A3

           MVKH    .S1     _cycle_counts+24,A3
||         ZERO    .L2     B4                ; |114| 
||         ZERO    .L1     A10               ; |114| 
||         ZERO    .D1     A11               ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A11:A10,*A3       ; |114| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B5           ; |116| 
           MVKL    .S1     _t_start,A3
           MVKH    .S1     _t_start,A3

           MVC     .S2     TSCL,B6           ; |117| 
||         STDW    .D1T2   B5:B4,*A3         ; |116| 

           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B6,B4,B9:B8       ; |117| 

           EXT     .S2     B9,24,24,B6       ; |117| 
||         SUB     .L2     B7,B5,B5          ; |117| 
||         MVKL    .S1     _t_offset,A3

           ADD     .L2     B5,B6,B5          ; |117| 
||         MV      .S2     B8,B4             ; |117| 
||         MVKH    .S1     _t_offset,A3
||         ZERO    .L1     A5

           MVK     .S2     0x80,B4
||         STDW    .D1T2   B5:B4,*A3         ; |117| 
||         MVKH    .S1     0x40440000,A5

           MVKL    .S1     _input,A3
||         MV      .L1     A10,A12

           CALL    .S2     _gimme_random     ; |208| 
||         MV      .L2X    A11,B4            ; |208| 
||         MV      .L1X    B4,A13            ; |117| 
||         MVKH    .S1     _input,A3
||         ZERO    .D2     B5
||         MV      .D1     A10,A4            ; |208| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains control code
;*----------------------------------------------------------------------------*
$C$L18:    
;          EXCLUSIVE CPU CYCLES: 5
           LDW     .D1T1   *A3,A15           ; |208| 
           MVKH    .S2     0xc0340000,B5
           ADDKPC  .S2     $C$RL23,B3,2      ; |208| 
$C$RL23:   ; CALL OCCURS {_gimme_random} {0}  ; |208| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 16
           ADD     .L1     A15,A12,A3        ; |208| 

           STDW    .D1T1   A5:A4,*A3         ; |208| 
||         MVC     .S2     TSCL,B4           ; |122| 

           NOP             1

           MV      .L1X    B4,A6             ; |122| Define a twin register
||         MVC     .S2     TSCH,B4           ; |122| 

           ADD     .D1     A15,A12,A3        ; |199| 
||         ABSDP   .S1     A5:A4,A17:A16     ; |195| 
||         MVKL    .S2     0x33333333,B6
||         ZERO    .L1     A5:A4             ; |199| 
||         MV      .L2X    A15,B10           ; |199| 

           LDDW    .D1T1   *A3,A9:A8         ; |199| 
||         MVKL    .S2     0x3fd33333,B7

           MVKH    .S2     0x33333333,B6
           MVKH    .S2     0x3fd33333,B7
           CMPLTDP .S2X    A17:A16,B7:B6,B0  ; |203| 
           MV      .L1X    B4,A7             ; |122| 

           CMPLTDP .S1     A9:A8,A5:A4,A0    ; |199| 
|| [ B0]   MPYDP   .M1     A17:A16,A17:A16,A5:A4 ; |119| 
|| [ B0]   B       .S2     $C$L20            ; |203| 

   [!B0]   ZERO    .L1     A5
|| [!B0]   ZERO    .D1     A4                ; |206| 

   [ A0]   ZERO    .L1     A9
|| [!A0]   ZERO    .D1     A9
|| [!B0]   MVKH    .S1     0x40330000,A5

   [!A0]   SET     .S1     A9,0x14,0x1d,A9
|| [ A0]   ZERO    .L1     A8                ; |200| 
|| [!A0]   ZERO    .D1     A8                ; |192| 

   [ A0]   MVKH    .S1     0xbff00000,A9
   [!B0]   CMPGTDP .S1     A17:A16,A5:A4,A0  ; |206| 
           ; BRANCHCC OCCURS {$C$L20}        ; |203| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 7
           ZERO    .L1     A5

   [ A0]   B       .S2     $C$L19            ; |206| 
||         MVKH    .S1     0xc0000000,A5

   [ A0]   B       .S1     $C$L22
|| [!A0]   MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |148| 
|| [ A0]   ZERO    .L1     A5
|| [!A0]   MVKL    .S2     0x3ff71547,B5

   [ A0]   SET     .S1     A5,0x14,0x1d,A5
   [!A0]   MVKL    .S2     0x652b82fe,B4
   [!A0]   MVKH    .S2     0x3ff71547,B5
   [!A0]   MVKH    .S2     0x652b82fe,B4
           ; BRANCHCC OCCURS {$C$L19}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 337
           MV      .L1     A11,A16           ; |154| 
           MVKL    .S1     0x3fe63000,A17
           MVKH    .S1     0x3fe63000,A17
           MVKL    .S2     0x5c610ca8,B6
           MVKL    .S2     0xbf2bd010,B7
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |148| 
           MVKH    .S2     0x5c610ca8,B6
           MVKH    .S2     0xbf2bd010,B7
           MVKL    .S1     0x6f58dc1c,A18
           MVKL    .S1     0x3ef152a4,A19
           MVKH    .S1     0x6f58dc1c,A18
           MVKH    .S1     0x3ef152a4,A19
           ZERO    .L2     B31
           ZERO    .L2     B21
           MV      .L2X    A10,B20           ; |64| 
           DPINT   .L2     B5:B4,B8          ; |148| 
           SET     .S2     B21,0x1e,0x1e,B21
           ZERO    .L2     B30
           MVK     .S2     0x3fe,B29
           INTDP   .L2     B8,B5:B4          ; |154| 
           ZERO    .L2     B28
           ZERO    .L1     A31
           NOP             3
           MPYDP   .M1X    A17:A16,B5:B4,A17:A16 ; |154| 
           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |154| 
           NOP             8
           SUBDP   .L1     A5:A4,A17:A16,A5:A4 ; |154| 
           NOP             6
           SUBDP   .L1X    A5:A4,B5:B4,A17:A16 ; |154| 
           MVKL    .S2     0x3f403f99,B5
           MVKL    .S2     0x6fde3809,B4
           MVKH    .S2     0x3f403f99,B5
           MVKH    .S2     0x6fde3809,B4
           NOP             2
           MPYDP   .M1     A17:A16,A17:A16,A5:A4 ; |154| 
           NOP             9
           MPYDP   .M1     A19:A18,A5:A4,A21:A20 ; |154| 
           MPYDP   .M2X    B5:B4,A5:A4,B5:B4 ; |155| 
           NOP             4
           MVKL    .S1     0x6fb3f6e0,A18
           MVKL    .S1     0x3f7c70e4,A19
           MVKH    .S1     0x6fb3f6e0,A18
           MVKH    .S1     0x3f7c70e4,A19
           ADDDP   .L1     A19:A18,A21:A20,A19:A18 ; |154| 
           MVKL    .S1     0x714251b3,A20
           MVKL    .S1     0x3fac718e,A21
           MVKH    .S1     0x714251b3,A20
           MVKH    .S1     0x3fac718e,A21
           NOP             1
           ADDDP   .L2X    A21:A20,B5:B4,B5:B4 ; |155| 
           MPYDP   .M1     A5:A4,A19:A18,A19:A18 ; |154| 
           ZERO    .L1     A20               ; |62| 
           MV      .L1X    B21,A21           ; |62| 
           NOP             3
           MPYDP   .M2X    A5:A4,B5:B4,B7:B6 ; |155| 
           NOP             2
           ZERO    .L2     B5

           MVKH    .S2     0x3fd00000,B5
||         MV      .L2X    A10,B4            ; |154| 

           ADDDP   .L2X    B5:B4,A19:A18,B5:B4 ; |154| 
           MV      .L1     A11,A4            ; |64| 
           MV      .L1X    B21,A5            ; |64| 
           MV      .L1     A11,A18           ; |64| 
           MV      .L1X    B21,A19           ; |64| 
           NOP             2
           MPYDP   .M2X    A17:A16,B5:B4,B17:B16 ; |154| 
           NOP             2
           SET     .S2     B31,0x15,0x1d,B5
           MV      .L2X    A10,B4            ; |155| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |155| 
           NOP             6
           SUBDP   .L2     B5:B4,B17:B16,B7:B6 ; |155| 
           NOP             6
           RCPDP   .S2     B7:B6,B5:B4       ; |64| 
           NOP             1
           MPYDP   .M2     B7:B6,B5:B4,B19:B18 ; |64| 
           NOP             9
           SUBDP   .L2     B21:B20,B19:B18,B19:B18 ; |64| 
           NOP             6
           MPYDP   .M2     B5:B4,B19:B18,B5:B4 ; |64| 
           NOP             9
           MPYDP   .M2     B7:B6,B5:B4,B19:B18 ; |64| 
           NOP             9
           NOP             1
           SUBDP   .L1X    A5:A4,B19:B18,A5:A4 ; |64| 
           NOP             6
           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |64| 
           NOP             9
           MPYDP   .M1X    B7:B6,A5:A4,A17:A16 ; |64| 
           ZERO    .L2     B5:B4             ; |66| 
           CMPEQDP .S2     B17:B16,B5:B4,B0  ; |66| 
           ZERO    .L2     B4                ; |62| 
           SET     .S2     B30,0x15,0x1d,B5
           NOP             5
           SUBDP   .L1     A19:A18,A17:A16,A17:A16 ; |64| 
           NOP             6
           MPYDP   .M1     A5:A4,A17:A16,A5:A4 ; |64| 
           NOP             9
           MPYDP   .M1X    B17:B16,A5:A4,A5:A4 ; |64| 
           NOP             9
   [ B0]   ZERO    .L1     A5:A4             ; |67| 
           NOP             1
           ADDDP   .L2X    B5:B4,A5:A4,B7:B6 ; |62| 
           ADD     .S2     B29,B8,B4         ; |62| 
           SHL     .S2     B4,20,B5          ; |62| 
           ZERO    .L2     B4                ; |62| 
           ZERO    .L1     A4                ; |62| 
           ZERO    .L1     A5
           MVKH    .S1     0x40100000,A5
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |62| 
           NOP             9
           NOP             1
           MPYDP   .M1X    A5:A4,B5:B4,A5:A4 ; |62| 
           NOP             6
           ZERO    .L2     B4                ; |62| 
           SET     .S2     B28,0x14,0x1d,B5
           NOP             1
           ADDDP   .L1X    B5:B4,A5:A4,A17:A16 ; |62| 
           ZERO    .L2     B4                ; |62| 
           MV      .L2     B21,B5            ; |62| 
           NOP             4
           RCPDP   .S1     A17:A16,A5:A4     ; |62| 
           NOP             1
           MPYDP   .M1     A5:A4,A17:A16,A19:A18 ; |62| 
           NOP             9
           SUBDP   .L1     A21:A20,A19:A18,A19:A18 ; |62| 
           NOP             6
           MPYDP   .M1     A5:A4,A19:A18,A5:A4 ; |62| 
           NOP             9
           MPYDP   .M1     A5:A4,A17:A16,A19:A18 ; |62| 
           NOP             9
           NOP             1
           SUBDP   .L2X    B5:B4,A19:A18,B5:B4 ; |62| 
           NOP             6
           MPYDP   .M2X    A5:A4,B5:B4,B5:B4 ; |62| 
           NOP             9
           MPYDP   .M2X    B5:B4,A17:A16,B7:B6 ; |209| 
           ZERO    .L1     A4                ; |209| 
           MV      .L1     A21,A5            ; |209| 
           NOP             7
           SUBDP   .L2X    A5:A4,B7:B6,B7:B6 ; |209| 
           ZERO    .L1     A4                ; |209| 
           SET     .S1     A31,0x14,0x1d,A5
           NOP             4
           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |209| 
           NOP             9
           ADDDP   .L2     B5:B4,B5:B4,B5:B4 ; |209| 
           NOP             2
           BNOP    .S1     $C$L21,4          ; |209| 
           SUBDP   .L1X    B5:B4,A5:A4,A5:A4 ; |209| 
           ; BRANCH OCCURS {$C$L21}          ; |209| 
;** --------------------------------------------------------------------------*
$C$L19:    
;          EXCLUSIVE CPU CYCLES: 1

           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |212| 
||         MVK     .S2     12,B4
||         MVKL    .S1     _t_start,A3

           ; BRANCH OCCURS {$C$L22}  
;** --------------------------------------------------------------------------*
$C$L20:    
;          EXCLUSIVE CPU CYCLES: 73
           MVKL    .S2     0x3f9666af,B5
           MVKL    .S1     0x3f6e11ce,A23
           MVKL    .S2     0x84e8ae0f,B4
           MVKL    .S1     0x903de2ef,A22
           MPYDP   .M1     A5:A4,A5:A4,A19:A18 ; |119| 
           MVKH    .S2     0x3f9666af,B5
           MVKH    .S1     0x3f6e11ce,A23
           MVKH    .S2     0x84e8ae0f,B4
           MVKL    .S2     0xe912d40f,B8
           MVKH    .S1     0x903de2ef,A22
           MPYDP   .M2X    B5:B4,A5:A4,B7:B6 ; |119| 
           MVKL    .S1     0x53b8707d,A24
           MVKL    .S2     0xbf822997,B9
           MVKL    .S1     0xbfd55555,A25
           MPYDP   .M1     A19:A18,A5:A4,A21:A20 ; |119| 
           MVKH    .S2     0xe912d40f,B8
           MVKH    .S1     0x53b8707d,A24
           MVKL    .S2     0xbfaba1e4,B5
           MVKH    .S1     0xbfd55555,A25
           MVKL    .S2     0x3f7f105d,B4
           MPYDP   .M1     A25:A24,A5:A4,A5:A4 ; |119| 
           MVKH    .S2     0xbfaba1e4,B5
           MVKH    .S2     0x3f7f105d,B4
           MVKH    .S2     0xbf822997,B9
           MPYDP   .M1     A23:A22,A21:A20,A27:A26 ; |119| 
           ADDDP   .L2     B5:B4,B7:B6,B5:B4 ; |119| 
           MPYDP   .M2X    B9:B8,A19:A18,B7:B6 ; |119| 
           MVKL    .S1     0x3fc11111,A23
           MVKL    .S1     0x49fb127b,A22
           MVKH    .S1     0x3fc11111,A23
           MVKH    .S1     0x49fb127b,A22
           MPYDP   .M1     A23:A22,A19:A18,A19:A18 ; |119| 
           MPYDP   .M2X    A21:A20,B5:B4,B9:B8 ; |119| 
           NOP             4
           ADDDP   .L2X    A27:A26,B7:B6,B5:B4 ; |119| 
           NOP             3
           ADDDP   .L1     A5:A4,A19:A18,A5:A4 ; |119| 
           NOP             2
           MPYDP   .M2X    A21:A20,B5:B4,B5:B4 ; |119| 
           NOP             3
           ADDDP   .L1X    A5:A4,B9:B8,A5:A4 ; |119| 
           NOP             6
           ADDDP   .L1X    B5:B4,A5:A4,A5:A4 ; |119| 
           NOP             6
           MPYDP   .M1     A17:A16,A5:A4,A5:A4 ; |119| 
           NOP             9
           ADDDP   .L1     A17:A16,A5:A4,A5:A4 ; |119| 
;** --------------------------------------------------------------------------*
$C$L21:    
;          EXCLUSIVE CPU CYCLES: 7
           MVK     .S2     12,B4
           MVKL    .S1     _t_start,A3
           NOP             4
           MPYDP   .M1     A9:A8,A5:A4,A5:A4 ; |212| 
;** --------------------------------------------------------------------------*
$C$L22:    
;          EXCLUSIVE CPU CYCLES: 26
           ADD     .L2X    A14,B4,B4
           LDW     .D2T2   *B4,B4            ; |212| 
           MVKH    .S1     _t_start,A3
           STDW    .D1T1   A7:A6,*A3
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |212| 

           STDW    .D1T1   A5:A4,*A3         ; |212| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     _t_offset,A3
||         MVKL    .S2     _cycle_counts+24,B5
||         SUB     .L1     A13,1,A0          ; |206| 
||         MV      .L2     B4,B9             ; |128| 
||         ADD     .D1     8,A12,A12         ; |206| 

           MVKH    .S1     _t_offset,A3
||         MVKH    .S2     _cycle_counts+24,B5
||         SUB     .L1     A13,1,A13         ; |206| 

           LDDW    .D1T1   *A3,A9:A8         ; |130| 
||         LDDW    .D2T2   *B5,B7:B6         ; |130| 
||         MVKL    .S1     _t_stop,A31

           MV      .L1X    B5,A15            ; |130| 
|| [ A0]   MVKL    .S1     _input,A3

           MVKH    .S1     _t_stop,A31
           STDW    .D1T2   B9:B8,*A31        ; |128| 
   [ A0]   MVKH    .S1     _input,A3
           ADDU    .L1     A8,A6,A5:A4       ; |130| 
           ADD     .L1     A5,A9,A5          ; |130| 

           SUBU    .L2X    B8,A4,B5:B4       ; |130| 
||         ADD     .L1     A5,A7,A4          ; |130| 
|| [ A0]   B       .S1     $C$L18            ; |206| 
|| [ A0]   ZERO    .D1     A5

           EXT     .S2     B5,24,24,B16      ; |130| 
||         ADDU    .L2     B6,B4,B5:B4       ; |130| 
|| [ A0]   MVKH    .S1     0x40440000,A5

           SUB     .L2X    B9,A4,B17         ; |130| 
||         MV      .S2     B4,B6             ; |130| 
||         ADD     .D2     B5,B7,B4          ; |130| 
|| [ A0]   MV      .L1     A10,A4            ; |208| 

           ADD     .L2     B17,B16,B5        ; |130| 

           ADD     .L2     B4,B5,B7          ; |130| 
|| [ A0]   ZERO    .S2     B5
|| [ A0]   MV      .D2X    A11,B4            ; |208| 

   [ A0]   CALL    .S1     _gimme_random     ; |208| 
||         STDW    .D1T2   B7:B6,*A15        ; |130| 

           ; BRANCHCC OCCURS {$C$L18}        ; |206| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 6
           CALL    .S1     __fltllif         ; |135| 
           LDDW    .D1T1   *A15,A5:A4        ; |135| 
           ADDKPC  .S2     $C$RL24,B3,3      ; |135| 
$C$RL24:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
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
$C$RL25:   ; CALL OCCURS {__fixdlli} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 14
           MV      .L2X    A15,B4

           MV      .L2X    A11,B31           ; |114| 
||         MVK     .S2     24,B5

           SUB     .L2X    A15,B5,B5
||         STDW    .D2T1   A5:A4,*B4         ; |135| 

           MVC     .S2     B31,TSCL          ; |115| 
||         STDW    .D2T1   A11:A10,*B5       ; |114| 

           MVC     .S2     TSCL,B5           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MVC     .S2     TSCL,B7           ; |117| 
           MVC     .S2     TSCH,B6           ; |117| 
           MVKL    .S1     _t_offset,A3
           MVK     .S1     0x80,A31

           SUBU    .L2     B7,B5,B9:B8       ; |117| 
||         MVKL    .S1     _output,A4

           EXT     .S2     B9,24,24,B5       ; |117| 
||         MVKH    .S1     _output,A4
||         SUB     .L2     B6,B4,B4          ; |117| 

           ADD     .L2     B4,B5,B9          ; |117| 
||         LDW     .D1T1   *A4,A12
||         MVKH    .S1     _t_offset,A3

           STDW    .D1T2   B9:B8,*A3         ; |117| 
||         MV      .L1     A31,A15           ; |117| 
||         MV      .S1X    B10,A14

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains a call
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*      Disqualified loop: Loop contains non-pipelinable instructions
;*----------------------------------------------------------------------------*
$C$L23:    
;          EXCLUSIVE CPU CYCLES: 8
           MVC     .S2     TSCL,B4           ; |122| 
           MVC     .S2     TSCH,B5           ; |122| 
           CALL    .S1     _tanh             ; |221| 
           LDDW    .D1T1   *A14++,A5:A4      ; |221| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           ADDKPC  .S2     $C$RL26,B3,0      ; |221| 
$C$RL26:   ; CALL OCCURS {_tanh} {0}         ; |221| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 20

           STDW    .D1T1   A5:A4,*A12++      ; |221| 
||         MVC     .S2     TSCL,B8           ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S1     _t_start,A3
||         MVKL    .S2     _t_offset,B10
||         SUB     .L1     A15,1,A0          ; |219| 
||         MV      .L2     B4,B9             ; |128| 
||         SUB     .D1     A15,1,A15         ; |219| 

           MVKH    .S1     _t_start,A3
||         MVKH    .S2     _t_offset,B10

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         LDDW    .D2T2   *B10,B7:B6        ; |130| 
||         MVKL    .S1     _cycle_counts,A31

           MVKH    .S1     _cycle_counts,A31
           MVKL    .S1     _t_stop,A30
           MVKH    .S1     _t_stop,A30
           STDW    .D1T2   B9:B8,*A30        ; |128| 

           ADDU    .L1X    B6,A6,A5:A4       ; |130| 
||         MVKL    .S2     _cycle_counts,B6

           ADD     .L1X    A5,B7,A6          ; |130| 
||         MVKH    .S2     _cycle_counts,B6

           SUBU    .L2X    B8,A4,B17:B16     ; |130| 
||         LDDW    .D1T1   *A31,A5:A4        ; |130| 
||         ADD     .L1     A6,A7,A6          ; |130| 

           MV      .L2     B16,B4            ; |130| 
||         EXT     .S2     B17,24,24,B16     ; |130| 
|| [!A0]   MV      .L1X    B6,A14

           SUB     .L2X    B9,A6,B7          ; |130| 

   [ A0]   BNOP    .S1     $C$L23,1          ; |219| 
||         ADD     .L2     B7,B16,B7         ; |130| 

           ADDU    .L2X    A4,B4,B5:B4       ; |130| 
           ADD     .L2X    B5,A5,B5          ; |130| 
           ADD     .L2     B5,B7,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B6         ; |130| 

           ; BRANCHCC OCCURS {$C$L23}        ; |219| 
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
||         MV      .L2X    A11,B4            ; |114| 

           MVC     .S2     B4,TSCL           ; |115| 
||         STDW    .D1T1   A5:A4,*A14        ; |135| 

           MVC     .S2     TSCL,B4           ; |116| 
           MVC     .S2     TSCH,B6           ; |116| 
           MVC     .S2     TSCL,B5           ; |117| 
           MVC     .S2     TSCH,B7           ; |117| 
           SUBU    .L2     B5,B4,B5:B4       ; |117| 

           EXT     .S2     B5,24,24,B6       ; |117| 
||         SUB     .L2     B7,B6,B5          ; |117| 
||         MVK     .S1     0x80,A3

           ADD     .L2     B5,B6,B5          ; |117| 

           MV      .L2X    A3,B10            ; |117| 
||         STDW    .D2T2   B5:B4,*B10        ; |117| 

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
           LDW     .D1T1   *A3,A3            ; |230| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |230| 
||         CALL    .S1     _tanhdp_c         ; |230| 

           LDDW    .D1T1   *A3,A5:A4         ; |230| 
           ADDKPC  .S2     $C$RL29,B3,3      ; |230| 
$C$RL29:   ; CALL OCCURS {_tanhdp_c} {0}     ; |230| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output+8,B4
           MVKH    .S2     _output+8,B4
           LDW     .D2T2   *B4,B4            ; |230| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |230| 

           STDW    .D1T1   A5:A4,*A3         ; |230| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B6           ; |128| 

           MVKL    .S1     _t_offset,A15
||         MVKL    .S2     _t_start,B4
||         ADDAD   .D1     A14,2,A3
||         SUB     .L1X    B10,1,A0          ; |228| 
||         MV      .L2     B6,B17            ; |128| 
||         SUB     .D2     B10,1,B10         ; |228| 

           MVKH    .S1     _t_offset,A15
||         MVKH    .S2     _t_start,B4
||         LDDW    .D1T1   *A3,A7:A6         ; |130| 
|| [!A0]   MV      .L1     A14,A3

           MVKL    .S1     _t_stop,A31
||         LDDW    .D1T1   *A15,A5:A4        ; |130| 
||         LDDW    .D2T2   *B4,B9:B8         ; |130| 

           MVK     .S2     16,B12
           MVKH    .S1     _t_stop,A31
           ADD     .L2X    A14,B12,B12
           STDW    .D1T2   B17:B16,*A31      ; |128| 
           ADDU    .L2X    A4,B8,B5:B4       ; |130| 

   [ A0]   B       .S1     $C$L24            ; |228| 
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
||         STDW    .D2T2   B5:B4,*B12        ; |130| 
||         ADD     .L1     8,A12,A12         ; |228| 

           ; BRANCHCC OCCURS {$C$L24}        ; |228| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A3(16),A5:A4    ; |135| 
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

           MV      .L1     A14,A3            ; |135| 
||         STDW    .D2T1   A5:A4,*B12        ; |135| 
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
||         MVK     .S1     0x80,A3

           ADD     .L2     B5,B6,B5          ; |117| 

           STDW    .D1T2   B5:B4,*A15        ; |117| 
||         MV      .L2X    A3,B13            ; |117| 

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
           LDW     .D1T1   *A3,A3            ; |239| 
           MVKL    .S2     _t_start,B6
           MVKH    .S2     _t_start,B6
           STDW    .D2T2   B5:B4,*B6         ; |122| 
           NOP             1

           ADD     .L1     A12,A3,A3         ; |239| 
||         CALL    .S1     _tanhdp           ; |239| 

           LDDW    .D1T1   *A3,A5:A4         ; |239| 
           ADDKPC  .S2     $C$RL32,B3,3      ; |239| 
$C$RL32:   ; CALL OCCURS {_tanhdp} {0}       ; |239| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 24
           MVKL    .S2     _output+4,B4
           MVKH    .S2     _output+4,B4
           LDW     .D2T2   *B4,B4            ; |239| 
           NOP             4
           ADD     .L1X    A12,B4,A3         ; |239| 

           STDW    .D1T1   A5:A4,*A3         ; |239| 
||         MVC     .S2     TSCL,B16          ; |128| 

           MVC     .S2     TSCH,B4           ; |128| 

           MVKL    .S2     _t_start,B10
||         MVKL    .S1     _t_offset,A14
||         SUB     .L1X    B13,1,A0          ; |237| 
||         MV      .L2     B4,B17            ; |128| 
||         ADD     .D1     8,A12,A12         ; |237| 
||         SUB     .D2     B13,1,B13         ; |237| 

           MVKH    .S2     _t_start,B10
||         MVKH    .S1     _t_offset,A14

           LDDW    .D1T1   *A14,A5:A4        ; |130| 
||         LDDW    .D2T2   *B10,B9:B8        ; |130| 
||         MVKL    .S1     _cycle_counts+8,A3

           MVKH    .S1     _cycle_counts+8,A3

           LDDW    .D1T1   *A3,A7:A6         ; |130| 
||         MVKL    .S1     _t_stop,A15

           MV      .L2X    A3,B12            ; |128| 
||         MVKH    .S1     _t_stop,A15

   [!A0]   MVKL    .S1     _cycle_counts,A3
||         STDW    .D1T2   B17:B16,*A15      ; |128| 

           ADDU    .L2X    A4,B8,B7:B6       ; |130| 
|| [!A0]   MVKH    .S1     _cycle_counts,A3

           SUBU    .L2     B16,B6,B5:B4      ; |130| 
||         ADD     .S2X    B7,A5,B6          ; |130| 
|| [ A0]   B       .S1     $C$L25            ; |237| 

           ADD     .D2     B6,B9,B6          ; |130| 
||         EXT     .S2     B5,24,24,B7       ; |130| 
||         ADDU    .L2X    A6,B4,B5:B4       ; |130| 

           SUB     .L2     B17,B6,B6         ; |130| 
||         ADD     .S2X    B5,A7,B5          ; |130| 

           ADD     .L2     B6,B7,B6          ; |130| 
           ADD     .L2     B5,B6,B5          ; |130| 

   [!A0]   CALL    .S1     __fltllif         ; |135| 
||         STDW    .D2T2   B5:B4,*B12        ; |130| 

           ; BRANCHCC OCCURS {$C$L25}        ; |237| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 5
           LDDW    .D1T1   *+A3(8),A5:A4     ; |135| 
           ADDKPC  .S2     $C$RL33,B3,3      ; |135| 
$C$RL33:   ; CALL OCCURS {__fltllif} {0}     ; |135| 
;** --------------------------------------------------------------------------*
;          EXCLUSIVE CPU CYCLES: 113
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
           MV      .L1X    B12,A12           ; |135| 
           SUBAW   .D1     A12,2,A3

           MV      .L2X    A11,B4            ; |114| 
||         STDW    .D1T1   A5:A4,*A12        ; |135| 

           STDW    .D1T1   A11:A10,*+A3(32)  ; |114| 
||         MVC     .S2     B4,TSCL           ; |115| 

           MVC     .S2     TSCL,B8           ; |116| 
           MVC     .S2     TSCH,B4           ; |116| 
           MV      .L2     B4,B9             ; |116| 

           STDW    .D2T2   B9:B8,*B10        ; |116| 
||         MVC     .S2     TSCL,B4           ; |117| 

           MVC     .S2     TSCH,B7           ; |117| 
           MVKL    .S1     _output,A3
           MVKH    .S1     _output,A3

           MV      .L1     A3,A10            ; |117| 
||         MVKL    .S1     _input,A3
||         SUBU    .L2     B4,B8,B5:B4       ; |117| 

           MVKH    .S1     _input,A3
||         EXT     .S2     B5,24,24,B7       ; |117| 
||         SUB     .L2     B7,B9,B5          ; |117| 

           ADD     .L2     B5,B7,B5          ; |117| 

           MV      .L2X    A3,B6             ; |247| 
||         STDW    .D1T2   B5:B4,*A14        ; |117| 

           CALLP   .S2     _tanhdp_v,B3
||         LDW     .D2T1   *B6,A4            ; |247| 
||         LDW     .D1T2   *+A10(16),B4      ; |247| 
||         MVK     .S1     0x80,A6           ; |247| 

$C$RL35:   ; CALL OCCURS {_tanhdp_v} {0}     ; |247| 
           MVC     .S2     TSCL,B16          ; |128| 
           MVC     .S2     TSCH,B6           ; |128| 

           LDDW    .D1T1   *A14,A7:A6        ; |130| 
||         LDDW    .D2T2   *B10,B5:B4        ; |130| 

           MVK     .S2     24,B10
           ADD     .L2X    A12,B10,B10
           MV      .L2     B6,B17            ; |128| 
           LDDW    .D2T2   *B10,B7:B6        ; |130| 
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
           MV      .L2X    A15,B8            ; |128| 

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
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7
           MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A6             ; |130| 
||         LDW     .D1T1   *A10,A4           ; |66| 
||         MV      .S1     A5,A7             ; |130| 
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         LDW     .D1T2   *+A10(4),B4       ; |66| 
||         STDW    .D2T1   A7:A6,*B10        ; |130| 
||         MVK     .S1     0x80,A6           ; |66| 
||         MVK     .L1     0x1,A8            ; |66| 

$C$RL38:   ; CALL OCCURS {_isequal} {0}      ; |66| 
           MVKL    .S2     0xd9d7bdbb,B6
           MVKL    .S2     0x3ddb7cdf,B7

           LDW     .D1T2   *+A10(8),B4       ; |67| 
||         MVKL    .S1     _fcn_pass,A11
||         MVKH    .S2     0xd9d7bdbb,B6

           MV      .L1     A4,A5             ; |66| 
||         LDW     .D1T1   *A10,A4           ; |67| 
||         MVKH    .S1     _fcn_pass,A11
||         MVKH    .S2     0x3ddb7cdf,B7

           CALLP   .S2     _isequal,B3
||         STW     .D1T1   A5,*+A11(4)       ; |66| 
||         MVK     .S1     0x80,A6           ; |67| 
||         MVK     .L1     0x1,A8            ; |67| 

$C$RL39:   ; CALL OCCURS {_isequal} {0}      ; |67| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6

           STW     .D1T1   A4,*+A11(8)       ; |67| 
||         MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A10,A3            ; |68| 
||         LDW     .D1T2   *+A10(12),B4      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |68| 
||         MVK     .S1     0x80,A6           ; |68| 
||         MVK     .L1     0x1,A8            ; |68| 

$C$RL40:   ; CALL OCCURS {_isequal} {0}      ; |68| 
           MVKL    .S2     0x3ddb7cdf,B7
           MVKL    .S2     0xd9d7bdbb,B6
           MVKH    .S2     0x3ddb7cdf,B7

           MV      .L1     A10,A3            ; |68| 
||         STW     .D1T1   A4,*+A11(12)      ; |68| 
||         MVKH    .S2     0xd9d7bdbb,B6

           CALLP   .S2     _isequal,B3
||         LDW     .D1T1   *A3,A4            ; |69| 
||         LDW     .D2T2   *B11,B4           ; |69| 
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

   [!B0]   BNOP    .S1     $C$L26,4          ; |72| 
||         MV      .L2     B0,B1             ; guard predicate rewrite
|| [ B0]   LDW     .D2T2   *B4,B0            ; |72| 

   [ B1]   ADD     .L2     4,B4,B4
           ; BRANCHCC OCCURS {$C$L26}        ; |72| 
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
   [ A0]   B       .S1     $C$L27            ; |72| 
   [ A0]   CALL    .S1     _print_test_results ; |253| 
   [ A0]   MVKL    .S1     _all_pass,A3
   [ A0]   MVKH    .S1     _all_pass,A3
           NOP             2
           ; BRANCHCC OCCURS {$C$L27}        ; |72| 
;** --------------------------------------------------------------------------*
$C$L26:    
;          EXCLUSIVE CPU CYCLES: 5
           CALL    .S1     _print_test_results ; |253| 
           MVKL    .S1     _all_pass,A3
           MVKH    .S1     _all_pass,A3
           MV      .L1     A12,A4
           NOP             1
;** --------------------------------------------------------------------------*
$C$L27:    
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
           LDW     .D2T2   *++SP(16),B3      ; |265| 
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
$C$SL1:	.string	"tanhDP",0
$C$SL2:	.string	"----------------------------------------",0
$C$SL3:	.string	"----------------------------------------",10,0
;*****************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                             *
;*****************************************************************************
	.global	_printf
	.global	_tanh
	.global	_driver_init
	.global	_print_profile_results
	.global	_print_memory_results
	.global	_print_test_results
	.global	_gimme_random
	.global	_isequal
	.global	_tanhdp_c
	.global	_tanhdp
	.global	_tanhdp_v
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
